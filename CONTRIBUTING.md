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
  - [Version Control (Git Workflow)](#version-control-git-workflow)
    - [Branching Strategy](#branching-strategy)
    - [Commit Message Conventions](#commit-message-conventions)
    - [Pull Request Process](#pull-request-process)
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

## Version Control (Git Workflow)

This project uses a disciplined Git workflow to ensure a clean and understandable history.

### Branching Strategy

**Never commit directly to the `main` branch.** All work must be done on a separate feature or bugfix branch.

1.  Create a new branch from `main`.
2.  Name the branch using the following convention:
    - `type/short-description`.
    -   `feature/user_authentication`
    -   `bugfix/incorrect_invoice_total`
    -   `chore/update_dependencies`
3.  Work and commit on this new branch.
4.  Once work is complete, open a Pull Request to merge into `main`.

### Commit Message Conventions

This project uses the **Conventional Commits** specification. This ensures a clean commit history and allows for automatic changelog generation.

The commit message format is: `type(scope): subject`

**Common Types:**
-   `feat`: A new feature.
-   `fix`: A bug fix.
-   `docs`: Documentation only changes.
-   `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc).
-   `refactor`: A code change that neither fixes a bug nor adds a feature.
-   `perf`: A code change that improves performance.
-   `test`: Adding missing tests or correcting existing tests.
-   `chore`: Changes to the build process or auxiliary tools and libraries.

**Linking Issues:**
To automatically close an issue upon merging, use keywords in the commit message body (not the subject line).

**Example of a Perfect Commit:**
```
feat(auth): implement password reset via email

Adds the API endpoint and sends a tokenized link to the user's
registered email address.

Closes #42
```

### Pull Request Process

-   Even as a solo developer, all code must go through a Pull Request (PR).
-   A PR serves as a "code review for your future self," forcing a pause to review the changes.
-   It triggers the automated testing (CI) pipeline to ensure changes haven't broken anything.
-   Once all checks have passed, the PR can be merged into `main`, and the feature branch should be deleted.

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