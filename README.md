## School Management System (Academix)

This repository contains an **OOP-based School Management System (Academix)** built as a Java web application using **JSP/Servlets**.

### Project Structure

- **`SchoolManagementSystem/src/main/webapp`**: JSP views, static assets, and configuration.
  - **JSP pages** such as `index.jsp`, `home.jsp`, `Login.jsp`, `admin.jsp`, `Teacher.jsp`, `studentDashboard.jsp`, etc.
  - **`css/`**: Centralized stylesheets for pages (login, income/expenses, exam management, dashboards, etc.).
  - **`images/`**: Image and icon assets (e.g. `arrow-bar-right.svg`, logos, backgrounds).
  - **`WEB-INF/web.xml`**: Web application deployment descriptor.
- **`fullDB.sql`**: Main database schema and constraints for students, staff, exams, finance, curriculum, and related tables.
- **`database/finance.sql`**: Additional finance-related tables (`incomes`, `expenses`) and seed data for `Finance_Manager`.
