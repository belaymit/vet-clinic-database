## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<a name="readme-top"></a>


<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 vet-clinic-database <a name="about-project"></a>


**vet-clinic-database** is an educational project that I created to learn about postgresql.

### Learning objectives

>   Build a relational database based on a real-life example.
>   Create tables in SQL.
>   Insert and query data in SQL.
>   Use database transactions.
>   Modify and delete data in SQL.
>   Prepare complex queries that answer analytical questions.   
>   Use primary key & foreign key mechanism for joining tables.
>   Query multiple tables.
>   Prepare complex queries that answer analytical questions.
>   Understand the different types of relationships between tables.
>   Prepare complex queries that answer analytical questions.
>   Use primary key & foreign key mechanism for joining tables.
>   Understand what can impact database performance.



## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>


- **Database Schema**
- **Sql Stmt**
- **Queries**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

> To install PostgreSQL, first refresh your server’s local package index:
  ```sh
   sudo apt update
  ```
> Then, install the Postgres package along with a -contrib package that adds some additional utilities and functionality:
  ```sh
    sudo apt install postgresql postgresql-contrib
  ```
> Install pgAdmin

### Setup

Clone this repository to your desired folder:


```sh
  cd my-folder
  git clone git@github.com:belaymit/vet-clinic-database.git
```

### Usage
```sh
    sudo -u postgres psql
```
```sh
  \q   or   $   exit
```
```sh
  \c <vet_clinic>
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Schema Diagram
<img src="images/Schema_Diagram.png" width="500">

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Belay Birhanu G**

- GitHub: [@githubhandle](https://github.com/belaymit)
- Twitter: [@twitterhandle](https://twitter.com/2belamit)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/belay-birhanu-144ba714b/)


👤 **Jules Edozie**

- GitHub: [@githubhandle](https://github.com/julzedz)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/jules-edozie-b59b94234/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>


- [ ] **Add More Relations**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/belaymit/vet-clinic-database/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>


If you like this project please give it a start

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>


I would like to thank Microverse Community

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>

- **Why postgresql ?**

- PostgreSQL possesses robust feature sets including Multi-Version Concurrency Control (MVCC), point in time recovery, granular access controls, tablespaces, asynchronous replication, nested transactions, online/hot backups, a refined query planner/optimizer, and write ahead logging.

- **What are SQL JOINs?**
- SQL JOIN clauses are used to combine rows from two or more tables. Usually, tables are joined based on a related column between them, but you can also join tables that have no relationships. The term "SQL JOIN" is used to refer to a SQL query with the JOIN keyword. This is known as an explicit join. However, you can also join tables in SQL without using the JOIN keyword. This is known as an implicit join.

- **What are the 4 types of joins in SQL?**
- left, right, inner, and outer. In general, you'll only really need to use inner joins and left outer joins. Which join type you use depends on whether you want to include unmatched rows in your results: If you need unmatched rows in the primary table, use a left outer join.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
