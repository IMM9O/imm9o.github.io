import type { Site, SocialObjects } from "./types";

export const SITE: Site = {
  website: "https://imm9o.github.io/", // replace this with your deployed domain
  author: "Islam Muhammad",
  desc: "A minimal, responsive and SEO-friendly Astro blog theme.",
  title: "IMM9O",
  ogImage: "IMM9O-og.jpg",
  lightAndDarkMode: true,
  postPerPage: 10,
  scheduledPostMargin: 15 * 60 * 1000, // 15 minutes
};

export const LOCALE = {
  lang: "en", // html lang code. Set this empty and default will be "en"
  langTag: ["en-EN"], // BCP 47 Language Tags. Set this empty [] to use the environment default
} as const;

export const LOGO_IMAGE = {
  enable: false,
  svg: true,
  width: 216,
  height: 46,
};

export const SOCIALS: SocialObjects = [
  {
    name: "Github",
    href: "https://github.com/IMM9O",
    linkTitle: ` ${SITE.title} on Github`,
    active: true,
  },
  {
    name: "LinkedIn",
    href: "https://www.linkedin.com/in/islam-muhammad/",
    linkTitle: `${SITE.title} on LinkedIn`,
    active: true,
  },
  {
    name: "Medium",
    href: "https://islamuad.medium.com/",
    linkTitle: `${SITE.title} on Medium`,
    active: true,
  },
  {
    name: "Dev.to",
    href: "https://dev.to/islamuad",
    linkTitle: `${SITE.title} on Medium`,
    active: true,
  },
];
