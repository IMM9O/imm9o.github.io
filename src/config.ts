import type { Site, SocialObjects } from "./types";

export const SITE: Site = {
  website: "https://imm9o.github.io/", // replace this with your deployed domain
  author: "Islam Muhammad",
  desc: "My Tech Blog Posts",
  title: "Islam Muhammad Blog",
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
    name: "LinkedIn",
    href: "https://www.linkedin.com/in/islam-muhammad/",
    linkTitle: `${SITE.title} on LinkedIn`,
    active: true,
  },
  {
    name: "Github",
    href: "https://github.com/IMM9O",
    linkTitle: ` ${SITE.title} on Github`,
    active: true,
  },
  {
    name: "Medium",
    href: "https://imm9o.medium.com/",
    linkTitle: `${SITE.title} on Medium`,
    active: true,
  },
  {
    name: "Dev.to",
    href: "https://dev.to/imm9o",
    linkTitle: `${SITE.title} on Medium`,
    active: true,
  },
];
