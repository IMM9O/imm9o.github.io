---
author: Islam Muhammad
title: "What you gonna lose if you choose react over angular"
description: List of stand alone features that makes angular framework distinguish from other frameworks.
ogImage: https://images.unsplash.com/photo-1581574919402-5b7d733224d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80
tags:
  - angular
  - react
  - javascript
pubDatetime: 2020-06-01
featured: false
---

# What you gonna lose if you choose react over angular

> List of stand-alone features that makes angular framework distinguish from other frameworks.

<p style="text-align: center;">
  <img src="https://images.unsplash.com/photo-1581574919402-5b7d733224d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="Photo by engin akyurt on Unsplash">
  <p style="text-align: center;">
     Photo by <a href="https://unsplash.com/@enginakyurt">engin akyurt</a>
     on <a href="https://unsplash.com/">Unsplash</a>
  </p>
</p>

In this article **"What you gonna lose if you choose react over angular"** I will spot some of the features that make angular unique and stand out from other frameworks and this article not meant to compare react with angular there are already tons of articles or blog posts doing this, but in my opinion, if you choose x over y you will lose something so I wrote this article to guide you throw the features you gonna lose if you choose react over angular and finally you are free to choose whatever you want but remember you gonna lose something 😉.

Before we start I know many of these features can add to react using the community libraries, but this approach came with many issues like

- The library not updated to match last version of react.
- Library's author decides to remove it.
- Maybe react upgrade itself making the library obsolete.

## DI (Dependency injection)

Without a doubt **Dependency injection** is one of stand alone feature distinguished angular from other frameworks or library so i make it on the top of the list.

So what is **Dependency injection**?

In software engineering, dependency injection is a technique in which an object receives other objects that it depends on. These other objects are called dependencies. In the typical "using" relationship the receiving object is called a client and the passed object is called a service.

What **Dependency injection** offers?

- Singleton class (restricts the instantiation of a class to one "single" instance).
- Easy to unit-test (you will pass the needed objects to the constructor).
- Sharing state between components.
- Sharing functionality through the app.

What react offers similar to **Dependency injection** in angular?

For sharing state react has a [context](https://reactjs.org/docs/context.html), which provides a way to pass data through the component tree without having to pass props down manually at every level. This doesn't solve the scope issue after all context are global state and limited only to sharing state.

For sharing functionality you can use class but if you want it a singleton class or loaded it when you need it like angular you gonna build it with your self as react team doesn't provide such a solution for this problem.

## Separation of concerns

Angular doesn't have restrictions to wrote your angular component in one file or multi files one for html one for css and one for javascript, on the other hand, react force you to write your html with jsx syntax inside render function which is ok if the component very small and doesn't have a lot of logic attached to it but it will become a pain in ahead once that component scale up leaving you with readability issue.

## Scoped CSS

Angular provides embedded solutions for scope css which is a very critical and essential feature if you want to build a reusable styled component, on the other hand, react team doesn't provide or recommend a solution and once again leaving you to decide whether you built your own solutions or stick with the variety options to pick up one of them.

What angular provide out of the box?

- Scope css for css, sass, less or stylus.
- Three options for scope `ShadowDom`: Web components shadow dom, `Emulated`: Add scope css generated for each component and `None`: no scope.

## Stander HTML 😢

Surprise, JSX is not html and you can not use some attributes in html directly for example `class` become `className`, `for` become `htmlFor` I know it is not a big deal but it counts, and this leads us to another section.

## Web Components not fully supported in react

I'm not going to explain what is **Web Components** or why it become a web stander you can check this [link](https://developer.mozilla.org/en-US/docs/Web/Web_Components) for more details.

According to react [documentation](https://reactjs.org/docs/web-components.html): "React and Web Components are built to solve different problems. Web Components provide strong encapsulation for reusable components, while React provides a declarative library that keeps the DOM in sync with your data. The two goals are complementary. As a developer, you are free to use React in your Web Components, or to use Web Components in React, or both."

This is sweet, but it is not completely honest for example according to the same documentation if you gonna use video tag for example and wat to listen to play or pause event from the dom you will need to use a ref to interact with the DOM node directly, it is like jquery old days.

React team recommended to warp the web component with react component just to make it work another workaround for the limitation.

## Directives

![directives everywhere](https://dev-to-uploads.s3.amazonaws.com/i/bq6khdouhsm2j18e62vn.png)

One of the funny facts about directives that it exists in almost any framework except react. Mostly the frameworks using two-approach either using their own template engine like [blade](https://laravel.com/docs/7.x/blade) in laravel or using regular html as template engine like RiotJs, VueJs and Angular.

So, What is **directives**?

The definition can be different from framework to another but in general it is supercharge the element attached to it with adding extra functionally that doesn't exist when the element created or attached to the dom.

What angular **directives** provide?

- More readable instate of uglily inline ternary operator just write the directive on the element.
- Reusable piece of code.
- Directives can be attribute directive or structural directives.
- An Attribute directive changes the appearance or behavior of a DOM element.
- Structural directives are responsible for HTML layout.

## Forms, Forms and Forms 😁

There is no web app or websites nowadays doesn't have form or at least a search bar and I think [reactive form](https://angular.io/guide/reactive-forms) is one of the shining features exist only in angular solve many problems related to forms in an elegant and extendable way, this amazing feature makes build complex form super easy, easy to maintain and easy to customize. On the other hand, react team doesn't provide any solutions for just common forms problem and make it for developer decision and that leads to the lake of solutions out there and a lot of them are very opinionated and many of them solving part of the problem.

Example: angular reactive form (Login Form)

```typescript
    const form = new FormGroup({
      email: new FormControl('', [
        Validators.required,
        Validators.email
      ]),
      password: new FormControl('', [
        Validators.required,
        noWhitespaceValidator // custom validator
      ]),
    });

    onSubmit() {
        if (this.form.valid) {
            const formValue = form.value; // get the form data
            // call the server or do what you want
            // ...
        }
    }
```

```html
<form [formGroup]="form" (ngSubmit)="onSubmit()" autocomplete="off">
  <mat-form-field>
    <input
      matInput
      placeholder="Email"
      type="email"
      formControlName="email"
      autocomplete="off"
    />
  </mat-form-field>

  <mat-form-field>
    <input
      matInput
      placeholder="Password"
      type="password"
      formControlName="password"
      autocomplete="off"
    />
  </mat-form-field>

  <button mat-button type="submit">Login!</button>
</form>
```

As you can see it is very easy to maintain, read and more reasonable, i'm not going to explain reactive form in details but here is a list of what make it stand out features.

- Reactive forms provide a model-driven approach to handling form inputs whose values change over time.
- Reactive inputs are observables.
- Custom validators.
- Async Validators (for example: checking with server side if username available or not).
- Complex validator (for example: checking if renter password input matching password input).

## Angular CLI

Angular CLI is not schofield generator or scripts running only it is beyond that and here are some of features.

- Generate components files directly from cli with pre filling data as you configured in cmd.
- Upgrade your angular project with one command.
- Create your own generates using [Angular schematics](https://angular.io/guide/schematics).
- Support sass, less and stylus out of the box no need for extra setup or edit or eject web pack configurations.

# Conclusion

A lot of people are more interested in what they will lose, rather than what they will earn so that they will not regret the decision. It is like a trade-off you gonna win and lose there are no perfect solutions for all the problems either in life or in programming but after listing those features you can see the angular framework using regular html so most of solutions and features exist focus on reusability and not to break the web standers, on the other hand, react focus on keeping data in sync with ui.
