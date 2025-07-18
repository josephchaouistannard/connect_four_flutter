# Project Decisions

A log of significant technical or architectural choices made during the project's lifecycle, including during the planning phase.

As a rule, if a decision would be difficult, time consuming, or expensive to change later, it belongs in this file.

---

### Chose PostgreSQL over MongoDB

-   **Why:** The application's core data (users, products, orders) is highly relational. I need strong data integrity and ACID compliance, which is native to PostgreSQL. The rich ecosystem of query tools is also a major benefit.
-   **Alternatives Considered:** MongoDB was considered for its flexibility, but the lack of enforced schema and complex joins for relational data would have added more complexity in the long run.

---

### Implemented Authentication with Auth0 (Buy vs. Build)

-   **Why:** Building a secure authentication system from scratch is complex, time-consuming, and carries significant security risks (password hashing, token management, social logins). Auth0 provides all of this out of the box with a generous free tier.
-   **Alternatives Considered:** I considered building it myself using Passport.js, but the development time saved by using a third-party service allows me to focus on the core features of the app.

---