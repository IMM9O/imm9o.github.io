---
author: Islam Muhammad
title: "The trades of and benefits of different web rendering technique"
description: "Explore the core advantages and trade-offs of web rendering techniques, crucial for optimizing web performance and enhancing user experiences."
ogImage: https://i.pinimg.com/564x/4d/5e/01/4d5e01b6b2926276e5d65e8695572834.jpg
featured: false
tags:
  - SSR
  - CSR
  - javascript
pubDatetime: 2024-03-05T09:48:53.263Z
---

![Art Canvas](https://i.pinimg.com/564x/4d/5e/01/4d5e01b6b2926276e5d65e8695572834.jpg)

In the ever-evolving landscape of web development, rendering techniques play a pivotal role in defining the performance, user experience, and scalability of web applications. From the traditional server-side rendering (SSR) that powers the initial content delivery, to the dynamic client-side rendering (CSR) that brings interactive experiences to life, each method carries its own set of trade-offs and benefits. Furthermore, the advent of static site generators (SSG) and the innovative hybrid approaches like incremental static regeneration (ISR) offer developers a spectrum of choices to tailor the rendering process to their specific needs. This discussion delves into the nuances of these techniques, shedding light on how they influence key performance metrics such as First Contentful Paint (**[FCP](https://web.dev/articles/fcp)**), Largest Contentful Paint (**[LCP](https://web.dev/articles/lcp)**), First Input Delay (**[FID](https://web.dev/articles/fid)**), and ultimately, how they can be leveraged to enhance the end-user’s journey through the web.

## What is web rendering?

Rendering is the intricate process that browsers undertake to transform code into the interactive web pages we interact with. Utilizing HTML, CSS, and JavaScript, browsers interpret and display content tailored to our devices. The art of rendering is not one-size-fits-all; it varies significantly based on the web application’s unique requirements and complexity. In this exploration, we’ll delve into the various rendering techniques, unraveling their distinct trade-offs and advantages. Our goal is to illuminate how these methods not only shape the developer’s approach but also profoundly impact the user’s experience as they navigate through the digital world.

## How the browser render work?

Here's a simplified explanation of how browser rendering works in bullet points:

- **Parsing**: The browser parses the raw bytes of HTML, CSS, and JavaScript files into characters and then constructs the Document Object Model (DOM) and CSS Object Model (CSSOM).
- **Render Tree Construction**: The DOM and CSSOM are combined to form a render tree, which represents the visual layout of the page.
- **Layout**: The browser calculates the size and position of each visible element on the page, a process known as "reflow."
- **Paint**: The browser fills in pixels for each element with colors, images, borders, etc., to create the final visual representation.
- **Composite**: If necessary, the browser layers the various elements and draws them in the correct order to produce the final page.

These steps are executed efficiently by the browser to render web pages quickly and respond to user interactions smoothly.

## The Role of Core Web Vitals in Rendering Decisions

[Google’s Core Web Vitals](https://moz.com/learn/seo/performance-metrics) are a set of standardized metrics designed to guide developers in enhancing user experience on web pages. They provide a quantifiable measure of a site’s performance, focusing on aspects crucial to user satisfaction. The metrics I’ve outlined are pivotal in influencing our decision-making process when selecting the most appropriate rendering method. By prioritizing these metrics, we ensure that our chosen technique aligns with the optimal balance of speed, responsiveness, and visual stability, thereby delivering a superior user experience.

- **First Contentful Paint** (FCP): The time it takes for the browser to render the first piece of content from the DOM.
- **Largest Contentful Paint** (LCP): Measures the render time of the largest content element visible within the viewport. - Aim for an LCP of 2.5 seconds or less for a good user experience.
- **First Input Delay** (FID): Captures the user’s first impression of a site’s interactivity and responsiveness by measuring the time from when a user first interacts with a page to the time when the browser is able to respond to that interaction. - A low FID is crucial for a page to feel responsive.
- **Cumulative Layout Shift** (CLS): Quantifies the amount of unexpected layout shift of visible page content. - A low CLS ensures that the page is stable as it loads, preventing elements from moving around as resources are loaded.

## What is the different types of web pages?

Dynamic, static, and interactive web pages are different types of web pages that have different characteristics and purposes. Here is a brief explanation of each type:

- **Dynamic web pages**: Dynamic web pages are web pages that can change their content or appearance based on user input, data from a database, or other factors. Dynamic web pages are usually created using server-side or client-side programming languages, such as PHP, ASP, JavaScript, etc. [Dynamic web pages can offer personalized and interactive content, but they may also have slower performance and lower SEO](https://www.freecodecamp.org/news/static-vs-dynamic-web-pages/).

- **Static web pages**: Static web pages are web pages that have fixed content and appearance for every user. Static web pages are usually created using HTML, CSS, and sometimes JavaScript. [Static web pages can offer fast and secure content, but they may also have limited functionality and interactivity](https://www.geeksforgeeks.org/difference-between-static-and-dynamic-web-pages/).

- **Interactive web pages**: Interactive web pages are web pages that allow the user to interact with the content or the interface, such as clicking, scrolling, dragging, typing, etc. Interactive web pages can be created using both dynamic and static web pages, as long as they use JavaScript or other technologies to enable user interaction. [Interactive web pages can offer rich and engaging user experience, but they may also have higher complexity and maintenance](https://www.mlytics.com/blog/static-and-dynamic-websites-whats-the-difference/).

I hope this helps you understand the difference between dynamic, static, and interactive web pages.

## What are the common rendering methods?

### Server-Side Rendering (SSR):

- **What it is**: SSR involves generating HTML for a web page on the server and sending it to the client browser.
- **How it works**:
  - When a user accesses an SSR-built web application, their browser requests a specific URL.
  - The server executes the application's code, retrieves data from various sources (like databases or APIs), and dynamically generates the HTML content for the requested page.
  - This HTML content is sent back to the client's browser as part of the server's response.
- **Advantages**:
  - Enables search engines to crawl and index content easily.
  - Improves initial page load times.
  - Ensures content accessibility even without JavaScript support.

### Client-Side Rendering (CSR):

- **What it is**: CSR loads minimal HTML from the server and uses JavaScript to fetch data and render content dynamically on the client's browser.
- **How it works**:
  - Users receive a minimal HTML file from the server, including references to CSS and JavaScript files.
  - The browser parses the document, executes the referenced JavaScript files, and initializes the client-side application.
  - Data is fetched asynchronously, and content is dynamically rendered using JavaScript frameworks or libraries.
  - Interactions (like button clicks) are handled locally without fetching entire HTML pages from the server.
- **Advantages**:
  - Provides a seamless and responsive user experience.
  - Allows dynamic and interactive web applications.
  - Reduces server load during initial page load.
- **Considerations**: SEO and initial load time can be challenging.

### SSR with Hydration: (re-hydration)

Server-Side Rendering (SSR) with hydration is often perceived as a **modern rebranding of Client-Side Rendering (CSR)**, designed to harness the traditional benefits of SSR, such as reduced First Contentful Paint (FCP) and enhanced Search Engine Optimization (SEO). By pre-rendering pages on the server, SSR with hydration delivers content to users more quickly, improving perceived performance and visibility to search engines. Yet, once the initial page is loaded, the application reverts to CSR-like behavior, with JavaScript taking over in the browser to manage subsequent interactions, thus maintaining the dynamic and interactive nature of CSR applications. This hybrid approach aims to provide the best of both worlds, optimizing both the loading performance and the interactive experience.

- **What it is**: Server-Side Rendering (SSR) with hydration is a technique where the server renders the HTML and the client 'hydrates' it with JavaScript to make it interactive.
- **How it works**: The server sends a fully rendered page to the client, which then uses JavaScript to add event handlers and other interactive features.
- **Advantages**: This approach can improve performance by reusing server-rendered DOM structures and reducing the need to recreate DOM nodes on the client-side.

### Static rendering: (pre-rendering)

- **What it is**: In the context of programming, **static rendering** refers to the process of pre-generating content during build time rather than dynamically generating it at runtime.
- **How it works**:
  - The HTML for a page is generated at build time and served from a CDN.
- **Advantages**:
  - Static sites load quickly because there's no need for server-side processing. Users receive pre-rendered content directly, resulting in faster page loads.
  - Static sites are less likely to encounter server-related issues. They're robust and dependable, making them suitable for critical applications.
  - Search engines favor static sites due to their straightforward structure. Properly optimized static content can improve your site's search rankings.
  - Hosting static sites is often more cost-effective than maintaining dynamic server infrastructure.
  - With fewer moving parts, static sites have a smaller attack surface, reducing security risks.

The landscape of web development is rich with a variety of rendering methods, each pivotal in its own right. These core techniques are not only prevalent but also versatile, allowing developers to harness their individual strengths or synergize them for compounded benefits. By strategically employing these methods—be it in isolation or in combination—we can significantly bolster the performance of web applications, directly impacting the Core Web Vitals. This, in turn, translates to an optimized and seamless user experience, ensuring that each interaction with the web is as efficient as it is engaging.

## How to choose the right rendering method?

![Interactivity graph based on rendering methods](@assets/images/interactivity_graph_based_on_rendering_methods.jpg)

- There is no definitive answer, as different rendering methods have different trade-offs and benefits depending on the type and complexity of the web application

- Some general guidelines are:

  - If your web application is static and does not require frequent updates or user interactions, you can use static rendering.

  - If your web application is dynamic and requires frequent updates or user interactions, you can use server-side rendering.

  - If your web application is highly interactive and relies on complex JavaScript logic or frameworks, you can use client-side rendering.

- You can also use a combination of these rendering methods, such as static site generation (SSG) or incremental static regeneration (ISR), to leverage the benefits of both static and dynamic rendering

## How do they affect performance and SEO?

- SSR can improve FCP, LCP and SEO, but increase FID and CLS.
- CSR can degrade FCP, LCP and SEO, but improve FID and CLS.
- Static rendering can improve both FCP and LCP, but may not be suitable for dynamic or personalized content.

## Is there any rendering methods rather than the common one?

### Incremental Static Rendering (ISR):

- **What it is**: ISR is a feature in Next.js that allows you to update static pages after the site is built.
- **How it works**: It enables static-generation on a per-page basis without needing to rebuild the entire site. You can define a `revalidate` time which determines how often the pages are regenerated.
- **Advantages**: The main advantage is the ability to retain the benefits of static generation while scaling to millions of pages. It also allows for pages to be updated in the background, providing fresh content without full rebuilds.

### Progressive Hydration:

- **What it is**: A technique where individual components of a server-rendered application are hydrated over time, rather than all at once.
- **How it works**: It allows for the gradual hydration of components based on certain conditions, such as visibility in the viewport.
- **Advantages**: This method reduces the initial JavaScript payload and improves Time to Interactive (TTI) by hydrating components only when needed.

### Partial Hydratio:

- **What it is**: A strategy that hydrates only the interactive components of a page, leaving the rest as static HTML.
- **How it works**: It selectively adds interactivity to components, which can reduce the JavaScript bundle size and improve performance.
- **Advantages**: Partial Hydration minimizes the uncanny valley effect, where a page looks interactive but isn’t, due to the main thread being busy.

### Island Architecture:

- **What it is**: A design pattern that creates “islands” of dynamic content within a sea of static content.
- **How it works**: Interactive parts of a page are treated as separate islands that can be independently hydrated.
- **Advantages**: It optimizes web pages by adding interactivity only where necessary, leading to faster load times and better user experience.

### Resumability:

- **What it is**: Resumability is a concept where the web application can resume its state without re-fetching resources, aiming for instant interactivity.
- **How it works**: It involves embedding necessary data straight into HTML markup delivered to the client, which then resumes execution as the application becomes interactive.
- **Advantages**: The primary benefit is a constant boot time for the application, as opposed to the variable time taken by traditional hydration methods.

### Progressive vs. Partial Hydration:

- Both aim to improve performance by reducing JavaScript usage. Progressive Hydration focuses on hydrating components over time, while Partial Hydration targets specific interactive components from the start.

### Progressive vs. Island Architecture:

- Progressive Hydration can be seen as a temporal optimization (when to hydrate), whereas Island Architecture is a structural optimization (what to hydrate).

### Partial vs. Island Architecture:

- Both create islands of interactivity, but they differ in implementation. Partial Hydration is more about optimizing existing frameworks, while Island Architecture is a broader design pattern

In summary, these rendering techniques open doors to multiple possibilities for enhancing performance and user experience. Whether you prioritize SEO, interactivity, or both, choosing the right method depends on your specific project needs. 🚀

## Conclusion

Web rendering techniques are essential for optimizing the balance between speed, interactivity, and resource efficiency. Understanding the trade-offs and benefits of SSR, CSR, SSG, and ISR is crucial for developers to make informed decisions that align with their application’s goals, ensuring a seamless and engaging user experience.
