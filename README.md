# Zoo Park Website — «Зелёный Мир»

A Spring Boot web application for a fictional eco-park and wildlife sanctuary, built as a university lab project and extended with a full QA package: test cases, a checklist, bug reports, and automated JUnit 5 tests.

> **QA at a glance:** 55 test cases · 11 bug reports · 1 checklist · 39 JUnit 5 tests across 7 controller test classes

## Features

- **Animals** — list of animals and a detail page for each one
- **Registration and login** — Spring Security, BCrypt password hashing
- **Tickets** — three ticket types, price calculation, PDF ticket generation (iText, Cyrillic font)
- **Excursions** — booking form, email notification to the administrator
- **Volunteers** — application form with validation
- **Donations** — donation form and confirmation page

## Tech stack

Java 21 · Spring Boot 3.5.5 · Spring Security · Spring Data JPA · Freemarker · MySQL 8 / H2 · Gradle · JUnit 5 · Docker Compose

## Project structure

```
.
├── app/                  # Spring Boot application
│   ├── src/main/java     # controllers, services, repositories, models, security config
│   ├── src/main/resources# Freemarker templates, static images, application.properties
│   ├── src/test/java     # JUnit 5 controller tests
│   ├── compose.yaml      # MySQL + application
│   └── Dockerfile
└── qa/                   # QA documentation
    ├── test-cases.md     # 55 test cases
    ├── checklist.md      # smoke / regression checklist
    └── bug-reports/      # BUG-01 … BUG-11
```

## Getting started

### Option 1: run locally (in-memory H2 database)

Requirements: JDK 21.

```bash
cd app
export MAIL_USERNAME=your_smtp_login
export MAIL_PASSWORD=your_smtp_password
./gradlew bootRun
```

On Windows (PowerShell) use `$env:MAIL_USERNAME="..."` instead of `export`.
Emails (excursion requests) are sent through `smtp.yandex.com`; without real credentials the site starts, but sending mail will fail.

The site is available at <http://localhost:8080>.

### Option 2: Docker Compose (MySQL)

Requirements: Docker with Compose.

```bash
cd app
export MAIL_USERNAME=your_smtp_login
export MAIL_PASSWORD=your_smtp_password
docker compose up --build
```

This starts MySQL 8.0 and the application at <http://localhost:8080>.

### Run the automated tests

```bash
cd app
./gradlew test
```

## QA documentation

All QA artifacts are in the [`qa/`](qa/) folder.

| Artifact | Description |
| --- | --- |
| [`qa/test-cases.md`](qa/test-cases.md) | 55 test cases grouped by module: authentication, animals, tickets, excursions, volunteers, security. Each case has an ID, scenario, expected result, type, result on the original version (`v1`), re-check result (`v2`), and a link to the related bug. |
| [`qa/checklist.md`](qa/checklist.md) | Short checklist for quick verification of the main flows. |
| [`qa/bug-reports/`](qa/bug-reports/) | 11 bug reports (`BUG-01` … `BUG-11`) with severity, priority, environment, preconditions, steps to reproduce, expected and actual results, and technical notes. |

**Test design techniques used:** equivalence partitioning, boundary value analysis, negative testing.

**Test case coverage by module:**

| Module | Test cases |
| --- | --- |
| Tickets | 13 |
| Registration and login | 12 |
| Excursions | 9 |
| Volunteers | 9 |
| Animals | 6 |
| Donations | 4 |
| Security | 2 |

### Defects found

| ID | Summary | Severity |
| --- | --- | --- |
| [BUG-01](qa/bug-reports/BUG-01.md) | Unknown ticket type is accepted on purchase | High |
| [BUG-02](qa/bug-reports/BUG-02.md) | Invalid ticket quantity is accepted on purchase | High |
| [BUG-03](qa/bug-reports/BUG-03.md) | Ticket PDF is not created when the app is started outside the project root | High |
| [BUG-04](qa/bug-reports/BUG-04.md) | Fields are mixed up in the excursion email sent to the administrator | Medium |
| [BUG-05](qa/bug-reports/BUG-05.md) | Excursion request is accepted without validation; email failure returns HTTP 200 | Medium |
| [BUG-06](qa/bug-reports/BUG-06.md) | Registering an existing email causes an HTTP 500 error | High |
| [BUG-07](qa/bug-reports/BUG-07.md) | Registration works without validating email, password, and name | Medium |
| [BUG-08](qa/bug-reports/BUG-08.md) | Volunteer application without interests causes an HTTP 400 error page | Medium |
| [BUG-09](qa/bug-reports/BUG-09.md) | Volunteer experience longer than 1000 characters causes a save error | Medium |
| [BUG-10](qa/bug-reports/BUG-10.md) | Non-existent animal id causes an HTTP 500 error | Medium |
| [BUG-11](qa/bug-reports/BUG-11.md) | Static resources are unavailable to unauthenticated users | Low |

## Automated tests

JUnit 5 tests for the controller layer (39 `@Test` methods):

`AnimalControllerTest` · `AuthControllerTest` · `DonationControllerTest` · `ExcursionControllerTest` · `HomeControllerTest` · `TicketControllerTest` · `VolunteerControllerTest`

They cover happy paths and edge cases such as empty results, non-existent ids, and invalid input.
