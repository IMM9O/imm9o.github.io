---
author: Islam Muhammad
title: "12 lessons from 10 years of working as a developer"
description: "What I learned about talking, leading, code and time after 10 years at work. Most of the lessons are not about code."
pubDatetime: 2026-11-07T08:10:00Z
tags:
  - career
  - tips
featured: false
draft: false
ogImage: https://images.unsplash.com/photo-1484417894907-623942c8ee29?auto=format&fit=crop&w=1200&h=630&q=80
---

Before we start: this is not a list of coding tricks. After 10 years at work, most of what I learned has nothing to do with syntax. It is about how you talk, how you lead, and how you use your time.

I wrote these lessons as short rules in my notes, so some of them sound blunt. In this post, I explain each one: what it means, why it matters, what it looks like at work, and what you can do instead. The examples are typical situations, not stories about one company or one person.

![A laptop on a desk with code on the screen](https://images.unsplash.com/photo-1484417894907-623942c8ee29?auto=format&fit=crop&w=1400&q=80)

<p style="text-align:center;font-size:0.9em;opacity:0.8">Photo by <a href="https://unsplash.com/@emilep">Emile Perron</a> on <a href="https://unsplash.com/photos/macbook-pro-showing-programming-language-xrVDYZRGdw4">Unsplash</a></p>

## Table of contents

## Where do the lessons come from?

I put the 12 lessons into four groups. Most of them are in the first group. That tells you something: after 10 years, my biggest lessons were about people, not about code.

<svg viewBox="0 0 420 330" role="img" aria-labelledby="buckets-title" style="width:100%;height:auto;max-width:520px;display:block;margin:2rem auto;">
<title id="buckets-title">Four groups of lessons: how you talk (5), how you lead (2), your code (1), your time and energy (4)</title>
<rect x="20" y="10" width="380" height="64" rx="10" style="fill:rgb(var(--color-card));stroke:rgb(var(--color-accent));stroke-width:2"/>
<text x="40" y="38" style="fill:rgb(var(--color-text-base));font-size:18px;font-weight:700">How you talk</text>
<text x="40" y="60" style="fill:rgb(var(--color-text-base));font-size:14px">5 lessons</text>
<rect x="20" y="86" width="380" height="64" rx="10" style="fill:rgb(var(--color-card));stroke:rgb(var(--color-text-base));stroke-width:1.5"/>
<text x="40" y="114" style="fill:rgb(var(--color-text-base));font-size:18px;font-weight:700">How you lead</text>
<text x="40" y="136" style="fill:rgb(var(--color-text-base));font-size:14px">2 lessons</text>
<rect x="20" y="162" width="380" height="64" rx="10" style="fill:rgb(var(--color-card));stroke:rgb(var(--color-text-base));stroke-width:1.5"/>
<text x="40" y="190" style="fill:rgb(var(--color-text-base));font-size:18px;font-weight:700">Your code</text>
<text x="40" y="212" style="fill:rgb(var(--color-text-base));font-size:14px">1 lesson</text>
<rect x="20" y="238" width="380" height="64" rx="10" style="fill:rgb(var(--color-card));stroke:rgb(var(--color-text-base));stroke-width:1.5"/>
<text x="40" y="266" style="fill:rgb(var(--color-text-base));font-size:18px;font-weight:700">Your time and energy</text>
<text x="40" y="288" style="fill:rgb(var(--color-text-base));font-size:14px">4 lessons</text>
</svg>

## How you talk

### 1. Do not talk about your financial situation at work

This lesson is about your salary, your debts, your loans, and your money problems. Keep them out of work conversations.

Why does it matter? Money talk at work creates comparisons. When you tell a teammate your salary, you start a comparison that you cannot stop. One of you feels underpaid, and the other one feels awkward. Also, when you talk about money problems, some people start to see you as a person under pressure. They can think that you will leave soon, or that you will accept any offer.

At work, it looks like this. You complain at lunch about your rent, your car loan, or a raise that did not come. Everyone nods. A week later, a manager remembers it when they plan who gets the next big project.

What can you do instead?

- If you want a raise, talk to your manager in a private meeting. Bring facts about your work, not your expenses.
- If you want to know the market rate, use salary surveys or trusted friends outside your company.
- If you have a real money problem, talk to HR or to a friend outside work.

### 2. Do not blame the people who worked on the code base before you

You open an old file. The code is a mess. Your first reaction is: "Who wrote this?" This lesson says: stop there.

Why does it matter? You do not know the conditions they worked in. Maybe they had one week for a feature that needed one month. Maybe the requirements changed three times. Maybe the team was two people. The code is a result of those conditions, not only of their skill. Also, the person who wrote it is often still in the company, or a friend of someone in the room. Blame travels fast.

![Futurama Fry meme: Not sure if this code is bad, or I just did not write it](@assets/images/lessons_after_10_years_working/meme-legacy-code.png)

At work, it looks like this. In a code review or a planning meeting, someone says, "This module is garbage, the old team had no idea what they did." Everyone laughs. The new person in the team stays quiet, because they wrote half of that module.

What can you do instead?

- Describe the problem, not the person: "This function does three things. Let us split it."
- Ask before you judge: "Does anyone know why it works this way?" Often there is a reason.
- Fix it, and write a short note in the pull request about what you changed and why.
- Remember that in two years, someone new will open your code and feel the same.

### 3. Do not talk about anyone in a bad way

This one is short to say and hard to follow. Do not talk badly about a colleague, a manager, or a client. Not in meetings, not in private chats, not at lunch.

Why does it matter? People hear about it. A private chat is one screenshot away from the person you talked about. Even when they never hear it, the people who listened to you learn one thing: you talk about people behind their back. So they ask themselves what you say about them.

At work, it looks like this. A teammate misses a deadline. In a side chat, you write a joke about them. It feels harmless. Three months later, you need that teammate's help on a hard bug, and something feels cold between you.

What can you do instead?

- If you have a real problem with someone, tell them directly and privately.
- If that does not work, talk to your manager about the problem, with facts.
- If you have nothing good to say, say nothing. Silence never ends up in a screenshot.

### 4. Do not talk just to show that you are there

Some people speak in every meeting only to be seen. They repeat what someone else said, or they ask a question that they already know the answer to.

Why does it matter? It wastes everyone's time, and people notice it. After a while, they stop listening to you. Then, on the day you have something important to say, your words do not carry weight.

At work, it looks like this. The meeting is almost done. The decision is clear. Then someone says, "Just to add to that…" and repeats the decision in different words. The meeting takes ten more minutes.

What can you do instead?

- Before you speak, ask yourself: "Does this add new information, a risk, or a decision?" If not, stay quiet.
- If you agree, say "I agree" in one line, or send a message after the meeting.
- Show that you are there through your work: clear pull requests, good notes, problems solved on time.

### 5. Do not talk like you are the only one who understands

This lesson is about tone. It is the "obviously", "everyone knows that", and "it is simple" voice.

Why does it matter? Even when you are right, this tone makes people stop listening. They feel small, so they defend themselves instead of thinking about your idea. Also, you are often not the only one who understands. Other people see parts of the problem that you do not see.

At work, it looks like this. In a design discussion, someone explains their idea with a sigh: "As I said before, this is obviously the right way." The others agree just to end the meeting. Two weeks later, the team finds a problem that one of the quiet people saw from the start.

What can you do instead?

- Explain your idea as a proposal: "I think we can do X, because Y. What do you see that I do not see?"
- Ask the quietest person in the room for their opinion.
- When someone does not understand, explain it a second time in a different way. Do not repeat the same words louder.

## How you lead

### 6. When you lead, listen more and act less

When you become a lead, you want to prove yourself. So you act fast: new rules, new tools, a new process. This lesson says: listen first.

Why does it matter? The team knows things that you do not know yet: why the process is the way it is, which parts hurt, and what they already tried. When you act before you listen, you fix the wrong problems, and the team feels that their experience does not count.

At work, it looks like this. A new lead joins and changes the sprint process in the first week. Nobody asked for it. The real problem was slow code reviews, and nobody talked about it, because nobody asked.

What can you do instead?

- In your first weeks, meet each person one-to-one. Ask: "What works? What hurts? What do you want to change?"
- Write down what you hear, and look for patterns before you change anything.
- When you change something, explain which problem it solves, and name the people who raised it.

### 7. Do not always say no, and do not always say yes

A lead who says "no" to everything blocks the team. A lead who says "yes" to everything breaks the plan. Both answers are easy, because they need no thinking.

Why does it matter? Your "yes" and your "no" must mean something. If you always say no, people stop asking and go around you. If you always say yes, the team carries promises that it cannot keep, and the quality goes down.

At work, it looks like this. A product manager asks for one more feature in the sprint. The "always yes" lead agrees, and the team works late. The "always no" lead refuses, and the product manager goes to their manager. Both leads lose.

What can you do instead?

- Say "yes, if": "Yes, if we move ticket X to the next sprint."
- Say "no, because": "No, because the release is on Thursday. We can start it on Monday."
- Say "let me check": take a day, ask the team, and come back with a real answer.

## Your code

### 8. Do not fall in love with your code

Your code is a tool to solve a problem. It is not a piece of you.

Why does it matter? When you love your code, every review comment feels like an attack. You defend instead of listening. When the requirement changes, you try to save your old solution instead of building the right new one.

At work, it looks like this. You spend a week on an elegant abstraction. In review, a teammate shows that a simple function does the same job. You argue for an hour. In the end, the simple function wins, and you lost an hour and some trust.

What can you do instead?

- Treat review comments as information about the code, not about you.
- Ask: "If I start from zero today, do I build it the same way?" If the answer is no, let it go.
- Be happy when you delete code. Less code is less to maintain.

## Your time and energy

### 9. Managing time is more important than coding

You can write great code and still fail, because you ran out of time.

Why does it matter? At work, nobody sees the code that you did not finish. A good solution that comes late is often worth less than a simple solution that comes on time. As you become more senior, more of your day goes to meetings, reviews, and helping others. If you do not plan your time, those things eat your coding time.

At work, it looks like this. You plan to work on a hard feature in the morning. Then come a review request, two chat messages, and a "quick call". At 4 PM, you start the feature, tired.

What can you do instead?

- Block focus time in your calendar, and treat it like a meeting.
- Batch small tasks: answer messages and do reviews at fixed times.
- At the start of each day, choose the one task that you must finish today.

### 10. Estimating tickets is the most underrated skill

Most developers learn to code for years. Very few learn to estimate.

Why does it matter? An estimate is a promise to your team. The product manager plans the release with it. Your teammates plan their work around it. When your estimate is wrong again and again, people stop trusting your dates, even when your code is good.

![Boromir meme: One does not simply estimate a ticket](@assets/images/lessons_after_10_years_working/meme-estimate-ticket.png)

At work, it looks like this. In planning, you say, "Two days." You forgot the tests, the review, the deployment, and the question that you must ask another team. The ticket takes six days.

What can you do instead?

- Split the ticket into small steps, and estimate each step.
- Add the hidden work: tests, review, deployment, and waiting for others.
- Track your estimates against the real time. After a few sprints, you learn your own error.
- Say what you do not know: "Three days if the API works as documented. If not, I tell you on Tuesday."

### 11. Do not join a long meeting without an agenda

No agenda means no goal. No goal means no way to know when the meeting is done.

Why does it matter? A one-hour meeting with six people costs six hours of work. Without an agenda, nobody prepares, the talk moves in circles, and the meeting often ends with "let us meet again".

![Toy Story meme: Meetings, meetings everywhere](@assets/images/lessons_after_10_years_working/meme-meetings-everywhere.png)

At work, it looks like this. You get an invite for a two-hour meeting called "Sync". There is no description. You join, and after 40 minutes, you still do not know why you are there.

What can you do instead?

- Before you accept, ask politely: "Can you share the agenda, so I can prepare?"
- If you organize a meeting, write the goal and the questions to answer in the invite.
- If a meeting has no agenda and you are not needed, decline it and offer to answer by message.

### 12. Keep your daily work and your hobby apart

In my notes, this one was a single line. The idea is that your daily work and your hobby are two different things. When you mix them, you can hurt both.

Why does it matter? For many developers, coding starts as a hobby. Then it becomes the job. If your only hobby is the same thing that you do all day, you never really rest. Your side project starts to feel like work, and your work leaves you no energy for anything else.

What can you do instead?

- Have at least one hobby that has nothing to do with a screen or with code.
- If you code for fun, choose projects that feel different from your job: another language, a game, or a tool only for you.
- Protect your weekends and your vacation. The code is still there on Monday.

## The short version

| Topic     | Do                             | Do not                               |
| --------- | ------------------------------ | ------------------------------------ |
| Money     | Keep it private                | Talk about your finances at work     |
| Old code  | Fix it and explain the change  | Blame the people who wrote it        |
| People    | Speak well or say nothing      | Talk badly about them                |
| Meetings  | Speak when you add something   | Talk only to show that you are there |
| Tone      | Propose and ask                | Talk like you are the only expert    |
| Leading   | Listen first, then act         | Change everything in week one        |
| Decisions | Say "yes, if" or "no, because" | Always say yes, or always say no     |
| Your code | Let it change                  | Fall in love with it                 |
| Time      | Block focus time               | Let small tasks eat your day         |
| Estimates | Split, add hidden work, track  | Guess and hope                       |
| Agendas   | Ask for one, write one         | Sit in long meetings with no goal    |
| Hobbies   | Keep one away from code        | Turn every free hour into work       |

> Ten years in, my biggest improvement did not come from a new framework. It came from talking less, listening more, and protecting my time.

There is no perfect rulebook for a career. These are the rules that worked for me. Which lesson do you want to add to the list?
