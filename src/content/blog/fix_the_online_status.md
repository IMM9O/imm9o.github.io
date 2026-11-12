---
author: Islam Muhammad
title: "The online status is broken, let's fix it"
description: "The browser says you are online, but your app cannot reach the server. Here is why navigator.onLine lies and how to build an online status that tells the truth."
pubDatetime: 2026-11-12T09:00:00Z
tags:
  - javascript
  - web
  - networking
featured: false
draft: true
ogImage: https://images.unsplash.com/photo-1516044734145-07ca8eef8731?auto=format&fit=crop&w=1200&h=630&q=80
---

Picture this. You are in a lift, or on a train in a tunnel. Your phone shows two bars. You open a web app, type a long message, and press send. The button spins. Nothing happens. The app does not say anything. It looks like it is working.

I have seen this problem in apps I worked on. The user thinks the app is fine. The app thinks the user is online. And between them, nothing moves. In this post, I explain why the "online" signal in the browser is not reliable, and I show you how to build a status that tells the truth.

![A white and black modem router with four green lights](https://images.unsplash.com/photo-1516044734145-07ca8eef8731?auto=format&fit=crop&w=1400&q=80)

<p style="text-align:center;font-size:0.9em;opacity:0.8">Photo by <a href="https://unsplash.com/@extaf_ms">Misha Feshchak</a> on <a href="https://unsplash.com/photos/white-and-black-modem-router-with-four-lights-syCXK9WndqQ">Unsplash</a></p>

## Table of contents

## What does "online" really mean?

When we say a user is online, we mean one thing: "My app can talk to my server right now." But the word "online" can mean three different things, and a device can pass the first test while it fails the others.

<svg viewBox="0 0 420 330" role="img" aria-labelledby="layers-title" style="width:100%;height:auto;max-width:520px;display:block;margin:2rem auto;">
<title id="layers-title">Three questions: is the device on a network, is the internet reachable, is my server reachable. The browser only answers the first.</title>
<rect x="20" y="10" width="380" height="84" rx="10" style="fill:rgb(var(--color-card));stroke:rgb(var(--color-accent));stroke-width:2.5"/>
<text x="40" y="40" style="fill:rgb(var(--color-text-base));font-size:18px;font-weight:700">1. Is the device on a network?</text>
<text x="40" y="66" style="fill:rgb(var(--color-text-base));font-size:14px">Wi-Fi or mobile data is connected</text>
<text x="40" y="84" style="fill:rgb(var(--color-accent));font-size:14px;font-weight:700">navigator.onLine answers only this</text>
<path d="M210 94 L210 118" style="stroke:rgb(var(--color-text-base));stroke-width:3;fill:none"/>
<rect x="20" y="122" width="380" height="84" rx="10" style="fill:rgb(var(--color-card));stroke:rgb(var(--color-text-base));stroke-width:1.5"/>
<text x="40" y="152" style="fill:rgb(var(--color-text-base));font-size:18px;font-weight:700">2. Is the internet reachable?</text>
<text x="40" y="178" style="fill:rgb(var(--color-text-base));font-size:14px">The router may be on, with no internet</text>
<text x="40" y="196" style="fill:rgb(var(--color-text-base));font-size:14px">Captive portals fail here</text>
<path d="M210 206 L210 230" style="stroke:rgb(var(--color-text-base));stroke-width:3;fill:none"/>
<rect x="20" y="234" width="380" height="84" rx="10" style="fill:rgb(var(--color-card));stroke:rgb(var(--color-text-base));stroke-width:1.5"/>
<text x="40" y="264" style="fill:rgb(var(--color-text-base));font-size:18px;font-weight:700">3. Is my server reachable?</text>
<text x="40" y="290" style="fill:rgb(var(--color-text-base));font-size:14px">The server may be down or blocked</text>
<text x="40" y="308" style="fill:rgb(var(--color-text-base));font-size:14px">This is the one your app needs</text>
</svg>

Your app needs the answer to question three. The browser gives you the answer to question one. That gap is the whole problem.

## Why the built-in indicator is not enough

The browser has a property called `navigator.onLine`, and two events, `online` and `offline`. They look like what you need. They are not.

### What `navigator.onLine` really tells you

- When it is `false`, the device has no network connection at all. You can trust this one. Nothing will work.
- When it is `true`, the device is connected to some network. That is all. It does not mean the internet works. It does not mean your server answers.

The browser cannot check more than that. It only looks at the state of the network connection on the device. It does not send a single request to anywhere.

### Cases where it says "online" but you are not

Here are common situations where the value is `true` and your app still cannot work:

- **Weak mobile signal.** The phone shows bars, but packets are not getting through. Think about a lift or a tunnel.
- **A router with no internet.** The Wi-Fi is on, but the line to the provider is down.
- **A captive portal.** In a hotel or an airport, you join the Wi-Fi but must log in on a page first. Until you do, your requests do not reach the real internet.
- **A VPN or proxy problem.** The device is connected, but traffic goes to a dead end.
- **Your server is down.** The user has a perfect connection, but your backend does not answer.
- **A firewall blocks your domain.** The rest of the internet works.

![Squidward meme: Me, offline in a lift. The app: still online](@assets/images/fix_the_online_status/meme-lift.png)

In each case, the user sees an app that looks alive, and nothing they do is saved. That is the worst experience: no error, no hint, and no way to know why.

### Other small problems

The `online` and `offline` events fire only when the network state changes on the device. If the connection is bad but never drops fully, no event fires. Also, the behavior can differ between browsers and between operating systems. A feature that depends on it can behave differently for each user.

![This is fine meme: navigator.onLine equals true, no internet](@assets/images/fix_the_online_status/meme-this-is-fine.png)

## The simple fix: let real requests tell you

The most basic way to know if a user is online is to look at what happens when your app talks to the server. If a request fails because of a network error, the user is probably offline.

In practice, this means:

1. Wrap your calls in one place, so you see every network error.
2. When a call fails with a network error (not a normal 4xx or 5xx response), show a clear message: "You seem to be offline. Your changes are not saved yet."
3. Keep the user's work. Do not clear a form because the request failed.

This is a good start, and every app should do it. But it has one weak point: the user only learns about the problem after they press a button. For many apps, we can do better.

## The better fix: check all the time

If your app needs live data, like a chat, a dashboard, or a booking screen, you want to know about a connection problem before the user does anything. You can do this in two ways, and which one to use depends on how your app talks to the server.

### Option 1: long polling or a heartbeat

If your app fetches data from time to time, add a small, cheap request that runs on a timer. This is often called a heartbeat. If it succeeds, you are online. If it fails or takes too long, you are not.

Long polling is a related technique. The client asks the server for new data, and the server holds the request open until it has something to send or a time limit ends. Then the client asks again. Because there is always a request in flight, a failure shows up fast, and you get your status as a side effect of the data you already fetch.

Here is a simple heartbeat. It calls a tiny `/health` endpoint and treats a timeout like a failure:

```js
async function checkConnection(timeoutMs = 4000) {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const response = await fetch("/health", {
      method: "HEAD",
      cache: "no-store",
      signal: controller.signal,
    });
    return response.ok;
  } catch {
    return false;
  } finally {
    clearTimeout(timer);
  }
}
```

A few details matter here:

- **`cache: "no-store"`** stops the browser from answering from its cache. Without it, you can get a "success" from a saved response.
- **A timeout** is needed. A bad connection often does not fail fast. It just hangs.
- **A tiny endpoint** keeps the cost low. `/health` should do no database work.

### Option 2: ping and pong on a WebSocket

If your app already uses a WebSocket, you have a better tool. The client sends a small "ping" message from time to time, and the server answers with a "pong". If the pong does not come back in time, the connection is dead, even if the browser still says it is open.

This matters because a WebSocket can look open when the path under it is broken. The browser may take a long time to notice. A ping and pong check finds it in seconds.

```js
function startPingPong(socket, { everyMs = 10000, waitMs = 4000, onChange }) {
  let waiting = null;

  const ping = setInterval(() => {
    socket.send(JSON.stringify({ type: "ping" }));
    waiting = setTimeout(() => onChange(false), waitMs);
  }, everyMs);

  socket.addEventListener("message", event => {
    if (JSON.parse(event.data).type === "pong") {
      clearTimeout(waiting);
      onChange(true);
    }
  });

  return () => {
    clearInterval(ping);
    clearTimeout(waiting);
  };
}
```

The server only needs one rule: when it receives a ping, send back a pong.

### Which one should you use?

| Method                     | Good for                                      | Weak point                              |
| -------------------------- | --------------------------------------------- | --------------------------------------- |
| `navigator.onLine`         | A quick hint that the device is fully offline | Says "online" when the internet is down |
| Check on failed requests   | Every app, as a base                          | The user learns late                    |
| Heartbeat or long polling  | Apps that fetch data, with no socket          | Extra requests, a small delay           |
| Ping and pong on WebSocket | Chat, live data, anything with a socket       | Needs server support                    |

My advice is to combine them. Use the real requests as the base, use a heartbeat or ping and pong for live apps, and use `navigator.onLine` only as a hint.

![Waiting Skeleton meme: Waiting for the browser to tell me I am offline](@assets/images/fix_the_online_status/meme-waiting.png)

## Make the status feel calm

A correct status is not enough. A status that flickers between "online" and "offline" every few seconds is also bad. Users stop trusting it, and they get annoyed.

### Wait for more than one failure

One failed request does not mean you are offline. A packet can get lost. Mark the user as offline only after two or three checks in a row fail. This is called debouncing, and it removes most of the flicker.

### Come back faster than you leave

When the status is "offline", check more often, for example every two or three seconds, so you can say "back online" quickly. When the status is "online", check less often to save battery and data. Also use a growing delay between tries (a backoff), so a dead server does not get hit with thousands of requests.

### Use the browser events as a trigger

The `online` event and the `offline` event are still useful. Do not use them as the answer. Use them as a signal to run your own check right now:

```js
window.addEventListener("online", () => runCheck());
window.addEventListener("offline", () => setStatus(false));
```

For the `offline` event, you can trust it, because the device really has no network. For the `online` event, run your check first, because the device may be on a network that does not work.

### Pause checks when nobody is looking

If the tab is hidden, there is no need to check every few seconds. Use the Page Visibility API (`document.visibilityState`) to slow down or stop the checks, and run one check when the tab becomes visible again.

## What to show the user

A good status tells the user what happens next, not only what is wrong.

- **A small, calm banner** when the connection is lost: "You are offline. We will save your changes when you are back."
- **A clear sign** when the connection returns, which disappears by itself after a few seconds.
- **Do not block the whole screen.** Many things still work offline, like reading data you already loaded.
- **Queue the actions.** If you can, keep the user's changes on the device and send them later. This is the biggest gain for the user.
- **Be honest about the unknown.** If you are not sure, say "Trying to reconnect" instead of "Offline".

## A short checklist

1. Do not use `navigator.onLine` as the only source of truth.
2. Handle network errors in one place and show a clear message.
3. Add a heartbeat, or ping and pong if you use a WebSocket.
4. Use a timeout and `cache: "no-store"` on your checks.
5. Change the status only after two or three failed checks.
6. Check more often while offline, and less often while online.
7. Keep the user's work, and send it later.
8. Stop or slow the checks when the tab is hidden.

## The takeaway

> The browser can tell you that you are connected. Only your server can tell you that you are online.

The built-in indicator answers a smaller question than the one your app asks. When you build your own check, you answer the real question: "Can this user reach my server right now?" It takes a little code, and it saves your users from the silent failure that makes an app feel broken.

If you remember one thing: trust a request that you sent over a flag that the browser set.
