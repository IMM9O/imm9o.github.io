---
author: Islam Muhammad
title: "Organizing Your Workflow with GitHub Actions"
slug: "organizing-your-workflow-with-github-actions"
description: "Simplify your workflow with GitHub Actions"
ogImage: https://images.unsplash.com/photo-1647166545674-ce28ce93bdca?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&w=1394&q=80
featured: false
tags:
  - tips
  - git
  - github
pubDatetime: 2025-04-01T00:00:00.000Z
---


<center>

![github](https://images.unsplash.com/photo-1647166545674-ce28ce93bdca?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&w=1394&q=80)
<span><small>Photo by <a href="https://unsplash.com/@praveentcom?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Praveen Thirumurugan</a> on <a href="https://unsplash.com/photos/mG28olYFgHI">Unsplash</a></small></span>

</center>


Recently, I started working on a project where multiple people would be joining the team. With so many contributors, it's essential to ensure that everyone aligns with the workflow and maintains consistency. However, as humans, we're prone to forgetting small details or overlooking processes. That's why we needed a reliable system to handle these tasks behind the scenes without constant manual intervention. Enter GitHub Actions—powerful tools to automate and organize workflows seamlessly.

In this article, I'll share how specific GitHub Actions `actions/labeler`, `thehanimo/pr-title-checker`, and `deepakputhraya/action-branch-name` can simplify pull request (PR) management, maintain consistency, and help your team focus on meaningful development.

## 1. `actions/labeler`

The `actions/labeler` action automatically labels pull requests based on the paths of files being changed or the branch name. This can be incredibly useful for categorizing PRs and ensuring that they are properly tagged for review.

### How It Works

To use `actions/labeler`, you need to create a `.github/labeler.yml` file in your repository with a list of labels and configuration options. The key is the name of the label you want to add, and the value is a match object that specifies the conditions for applying the label.

```yaml
# .github/labeler.yml
bug:
  - 'src/**/*.js'
enhancement:
  - 'docs/**/*.md'
```

In this example, any changes to JavaScript files in the `src` directory will be labeled as `bug`, and changes to Markdown files in the `docs` directory will be labeled as `enhancement`.

### Benefits

- **Automated Labeling**: Saves time by automatically applying labels based on file changes.
- **Consistency**: Ensures that PRs are consistently labeled, making it easier to filter and manage them.
- **Improved Workflow**: Helps reviewers quickly identify the type of changes being proposed.

## 2. `thehanimo/pr-title-checker`

The `thehanimo/pr-title-checker` action checks if PR titles conform to the contribution guidelines. Consistent and descriptive PR titles help maintainers organize their projects better and ensure that contributors follow the established naming conventions.

### How It Works

To use `thehanimo/pr-title-checker`, you need to create a configuration file `.github/pr-title-checker-config.json` with the desired checks and messages.

```json
{
  "LABEL": {
    "name": "title needs formatting",
    "color": "EEEEEE"
  },
  "CHECKS": {
    "prefixes": ["fix: ", "feat: "],
    "regexp": "docs\\(v[0-9]\\): ",
    "regexpFlags": "i",
    "ignoreLabels": ["dont-check-PRs-with-this-label", "meta"]
  },
  "MESSAGES": {
    "success": "All OK",
    "failure": "Failing CI test",
    "notice": ""
  }
}
```

In this example, the action checks if the PR title starts with `fix: ` or `feat: `, or matches the regular expression `docs(v[0-9]): `. If the title does not conform, a label `title needs formatting` is added to the PR.

### Benefits

- **Consistency**: Ensures that PR titles follow the contribution guidelines.
- **Improved Communication**: Makes it easier for maintainers and reviewers to understand the purpose of the PR.
- **Automated Checks**: Reduces the need for manual title checks, saving time and effort.

## 3. `deepakputhraya/action-branch-name`

The `deepakputhraya/action-branch-name` action extracts the branch name from the GitHub context and makes it available for use in subsequent steps. This can be useful for tagging Docker images, generating release notes, or any other task that requires the branch name.

### How It Works

To use `deepakputhraya/action-branch-name`, you need to add a step in your workflow file to extract the branch name.

```yaml
# .github/workflows/branch-name.yml
name: Extract Branch Name
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Extract branch name
        id: extract_branch
        uses: deepakputhraya/action-branch-name@v1
      - name: Use branch name
        run: echo "Branch name is ${{ steps.extract_branch.outputs.branch }}"
```

In this example, the branch name is extracted and printed in a subsequent step.

### Benefits

- **Flexibility**: Allows you to use the branch name in various parts of your workflow.
- **Automation**: Automates tasks that depend on the branch name, such as tagging or generating release notes.
- **Consistency**: Ensures that the correct branch name is used throughout the workflow.

## Conclusion

By leveraging these GitHub Actions, you can significantly improve the organization and efficiency of your workflow. `actions/labeler` helps with automated labeling, `thehanimo/pr-title-checker` ensures consistent PR titles, and `deepakputhraya/action-branch-name` provides flexibility in using branch names. Together, these actions can help you maintain a well-organized and efficient development process.

---

I hope this article helps you understand how these specific GitHub Actions can enhance your workflow. If you have any further questions or need additional information, feel free to ask!