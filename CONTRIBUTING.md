# Contributing Guide & Project Conventions

<!-- 
This document serves as the single source of truth for all development standards and workflows for this project.
While this is currently a solo project, following these guidelines ensures consistency, maintainability,
and makes it easy to work on the project after a long break.
It is a rulebook for my future self.
-->

## Table of Contents

- [Contributing Guide \& Project Conventions](#contributing-guide--project-conventions)
  - [Table of Contents](#table-of-contents)
  - [Project Management](#project-management)
  - [Git Workflow](#git-workflow)
    - [Step 1: Pick an Issue](#step-1-pick-an-issue)
    - [Step 2: Create a Branch](#step-2-create-a-branch)
    - [Step 3: Do the Work \& Commit Changes](#step-3-do-the-work--commit-changes)
    - [Step 4: Open a Pull Request](#step-4-open-a-pull-request)
      - [**Craft the Perfect Title**](#craft-the-perfect-title)
      - [**Link the Issue in the Description**](#link-the-issue-in-the-description)
    - [Step 5: Merge and Clean Up](#step-5-merge-and-clean-up)
  - [Coding Style \& Naming Conventions](#coding-style--naming-conventions)
    - [Tooling: Linter \& Formatter](#tooling-linter--formatter)
    - [General Code Conventions](#general-code-conventions)
    - [File System Naming](#file-system-naming)
    - [Database Naming](#database-naming)
    - [API \& Data Transfer Naming](#api--data-transfer-naming)
    - [Commenting Style](#commenting-style)
  - [Folder Structure](#folder-structure)
  - [Testing Philosophy](#testing-philosophy)
  - [Releasing \& Versioning](#releasing--versioning)

---

## Project Management

All actionable work—features, bugs, and chores—is tracked as **Issues** in this GitHub repository. The work is visualized on our **GitHub Project board**, which acts as our single source of truth for task status.

-   **Issues:** Each task must have a corresponding Issue to allow for proper tracking.
-   **Project Board:** Issues are managed on a Kanban board with columns for `Backlog`, `To Do`, `In Progress`, and `Done`.

---

Of course. This is the final and most important step—codifying the complete, perfected workflow into your `CONTRIBUTING.md` file.

This updated section is comprehensive, unambiguous, and explains not just *what* to do, but *why* each step is crucial for the automation to work correctly.

Here is the rewritten section. Replace the entire "Version Control (Git Workflow)" part of your `CONTRIBUTING.md` with this.

---

## Git Workflow

All work on this project, from a new feature to a minor bug fix, follows a structured workflow. This ensures our Git history is clean, our changes are well-tested, and every piece of code is linked to a planned task. Following this process is essential for our automation to function correctly.

### Step 1: Pick an Issue

All work begins with an **Issue**. The Issue is the single source of truth for the task at hand.

1.  Go to the repository's **Issues** tab or the **Project Board**.
2.  Find an issue you want to work on from the `To Do` or `Backlog` columns.
3.  **Assign yourself to the issue.** This signals that the task is actively being worked on.
4.  If no issue exists for the work you want to do, create one first using the appropriate template.

### Step 2: Create a Branch

All code must be written on a dedicated branch, never directly on `main`. The branch name should be descriptive and include the issue number for easy traceability.

1.  First, ensure your local `main` branch is up-to-date:
    ```bash
    git checkout main
    git pull origin main
    ```
2.  Create a new branch using the naming convention `type/issue-number/short-description`:
    ```bash
    # Example for issue #42, which is a new feature
    git checkout -b feat/42/user-authentication
    ```
    **Common Types:**
-   `feat`: A new feature.
-   `fix`: A bug fix.
-   `docs`: Documentation only changes.
-   `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc).
-   `refactor`: A code change that neither fixes a bug nor adds a feature.
-   `perf`: A code change that improves performance.
-   `test`: Adding missing tests or correcting existing tests.
-   `chore`: Changes to the build process or auxiliary tools and libraries.

### Step 3: Do the Work & Commit Changes

This is the coding phase. As you work, create small, logical commits to save your progress.

1.  **Write your code** and any necessary tests.
2.  Commit your changes frequently. These local commit messages can be simple and descriptive of the small step you took.

    **Important:** Do **not** use keywords like `Closes #42` in your individual commit messages. This will be handled later in the Pull Request. The final, "perfect" commit message will be crafted when we create the Pull Request.

### Step 4: Open a Pull Request

Once your branch contains all the necessary changes to resolve the issue, it's time to open a Pull Request (PR). The PR is where we formalize the story of our change.

1.  Push your branch to the remote repository:
    ```bash
    git push --set-upstream origin feature/42/user-authentication
    ```
2.  Go to the repository on GitHub. A prompt will appear to help you **"Compare & pull request"**. Click it.
3.  The **Pull Request Template** will automatically load. This is where you create the final, clean description of your work.

#### **Craft the Perfect Title**
The PR title is the single most important part of this process. **It MUST follow the Conventional Commits specification.**

*   **Why?** When we use "Squash and merge," the PR title becomes the subject line of the single commit that goes into the `main` branch. Our `release-please` automation reads this commit subject to create the changelog and determine the next version number.

*   **Good Title:** `feat(auth): Implement user login via email and password`
*   **Bad Title:** `Added login screen`

#### **Link the Issue in the Description**
In the body of the PR description, use a magic keyword to link your PR to the original issue. This will automatically close the issue when the PR is merged.

*   **Example:**
    ```
    Closes #42
    ```

### Step 5: Merge and Clean Up

The PR serves as a final quality check before the code is added to the main codebase.

1.  **Wait for CI Checks:** The PR will automatically trigger our automated test suite. All checks must pass.
2.  **Perform a Self-Review:** Read through your own "Files Changed" one last time. This is a great way to catch typos or logic errors.
3.  **Merge the PR:** Once all checks have passed, click the **"Squash and merge"** button. This is the required merge strategy for this project as it keeps our `main` branch history clean and ensures our release automation works correctly.
4.  **Confirm the Commit Message:** GitHub will pre-fill the commit message with your PR title and description. Ensure it is correct, then confirm the squash and merge.

The process is now complete. Your code is on the `main` branch, the issue is closed, and the feature branch has been automatically deleted, leaving the repository clean for the next task.

---

## Coding Style & Naming Conventions

### Tooling: Linter & Formatter

-   **Linter:** The **Dart analyzer** `flutter analyze` is used to enforce code quality and style rules.
-   **Formatter:** The built-in **`dart format`** tool is used for all automated code formatting to ensure a consistent style. Do not manually format code.

The settings provided in the **`analysis_options.yaml`** file are the single source of truth and are not to be modified.

### General Code Conventions

| Construct | Convention | Example |
| :--- | :--- | :--- |
| **Variables, Methods & Parameters** | `camelCase` | `String currentUser;` |
| **Booleans** | `camelCase`, prefixed with `is`, `has`, `can` | `const isLoggedIn = true;` |
| **Constants (Universal)** | `k` + `camelCase` | `const kMaximumAttempts = 5;` |
| **Functions (Top-level)** | `camelCase` (verb-noun pair) | `Future<Profile> getUserProfile() {}` |
| **Classes, Enums, Typedefs, Mixins** | `PascalCase` | `class UserSession {}` |
| **Enum Members** | `camelCase` | `enum Status { published, draft }` |

### File System Naming

-   **All Dart Files & Directories:** `snake_case` (e.g., `user_profile.dart`, `api_helpers/`).

### Database Naming

*(This is backend-agnostic but maintained for full-stack consistency)*

| Construct | Convention | Example |
| :--- | :--- | :--- |
| **Tables** | `snake_case`, plural | `product_orders` |
| **Columns** | `snake_case`, singular | `first_name`, `created_at` |
| **Primary Keys** | `id` | `id` |
| **Foreign Keys** | singular table name + `_id` | `user_id` |

### API & Data Transfer Naming

*(This is backend-agnostic but maintained for full-stack consistency)*

| Construct | Convention | Example |
| :--- | :--- | :--- |
| **API URL Endpoints** | `kebab-case` | `/users/{id}/profile-picture` |
| **JSON Properties** | `camelCase` | `{ "orderTotal": 99.99 }` |

### Commenting Style

-   Comments should explain the **why**, not the **what**. The code should explain what it's doing.
-   All sentences in comments should start with a capital letter and end with a period.
-   Use **Dartdoc** (`///`) for documenting all public APIs (functions, classes, parameters).

```dart
/// Fetches the user profile from the remote server.
///
/// Throws a [NetworkException] if the request fails.
Future<Profile> getUserProfile(String userId) async {
  // ... implementation
}
```

## Folder Structure

This project follows a high-level structure that separates concerns. In this Flutter project, `/lib` serves as our `/src` directory, and `/test` serves as our `/tests` directory. All Dart files and directories use `snake_case`.

-   **/lib:** Contains all application source code.
-   **/test:** Contains all tests, mirroring the `/lib` structure.
-   **/docs:** Contains all human-readable documentation like `DECISIONS.md`.
-   **/scripts:** Contains helper scripts for automation.
-   **/assets:** Contains static assets like images, fonts, and translation files.

---

## Testing Philosophy

-   **Unit Tests:** All core business logic (in services, repositories, etc.) and complex widgets must have corresponding unit tests.
-   **Widget Tests:** All UI components should be tested to verify they render correctly and respond to user interaction.
-   **Integration Tests:** Critical user flows (e.g., user registration, checkout process) must be covered by integration tests.
-   **CI Pipeline:** All tests are automatically run via the workflow in `.github/workflows/ci.yml` (which runs `flutter test`) on every push and pull request. No PR will be merged if tests are failing.

---

## Releasing & Versioning

This project automates the release process based on Conventional Commits. This includes:
-   Automatically determining the next version number in `pubspec.yaml`.
-   Generating and updating the `CHANGELOG.md` file.
-   Creating a new Git tag.
-   Creating a corresponding GitHub Release with formatted release notes.

The release process is triggered manually by running a Dart script, ensuring a consistent workflow within the ecosystem.

```bash
# Example of how a release might be triggered
dart run tool/release.dart
```