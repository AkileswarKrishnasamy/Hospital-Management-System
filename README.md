
# Hospital Management System

## Overview

The **Hospital Management System** is a Java-based application designed to streamline and manage hospital operations efficiently. Leveraging the Spring Boot framework, this system aims to handle various administrative and clinical tasks, ensuring a seamless experience for both hospital staff and patients.

## Features

- **Patient Management**: Register, update, and track patient information.
- **Appointment Scheduling**: Facilitate appointment bookings between patients and doctors.
- **Staff Management**: Manage hospital staff details, including doctors, nurses, and administrative personnel.
- **Medical Records**: Maintain and access patient medical histories securely.
- **Billing System**: Generate and manage patient billing and invoices.
- **Inventory Management**: Track and manage hospital inventory and supplies.

## Technologies Used

- **Java**: Core programming language.
- **Spring Boot**: Framework for building the application.
- **Maven**: Dependency management and build tool.
- **CSS**: Styling for the user interface.

## Project Structure

```
Hospital-Management-System/
├── .mvn/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── hospital/
│   │   │           └── management/
│   │   │               └── system/
│   │   │                   ├── controllers/
│   │   │                   ├── models/
│   │   │                   ├── repositories/
│   │   │                   └── services/
│   │   └── resources/
│   │       ├── static/
│   │       └── templates/
├── .gitignore
├── mvnw
├── mvnw.cmd
└── pom.xml
```

## Getting Started

### Prerequisites

- **Java 17** or higher
- **Maven 3.6.0** or higher

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/AkileswarKrishnasamy/Hospital-Management-System.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd Hospital-Management-System
   ```
3. **Build the project using Maven**:
   ```bash
   mvn clean install
   ```
4. **Run the application**:
   ```bash
   mvn spring-boot:run
   ```

The application will start on `http://localhost:8080`.

## Usage

Once the application is running:

- Access the homepage at `http://localhost:8080`.
- Navigate through the application to manage patients, appointments, staff, and more.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

- Inspired by the need for efficient hospital management solutions.
- Built using the robust features of Spring Boot and Java.
