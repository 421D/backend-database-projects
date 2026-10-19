# Backend & Database Projects

Systems programming in Rust and relational database design in SQL.

| Project | What it is | Stack | Highlight |
|---|---|---|---|
| [RSheet](rsheet-rust/) | Concurrent spreadsheet engine: cells reference each other and update reactively | Rust, `Arc`/`Mutex`/`Condvar`, `mpsc` | Background recomputation of dependent cells; version checks stop stale results from overwriting newer values |
| [Clothing Sales DB](database-projects/clothing-sales-db/) | Wholesale model with colour and size attributes, purchasing, inventory and sales | SQL Server (T-SQL) | 10 tables; triggers block edits to warehouse records and print old and new prices on update |

Related: the [Community Service Mini Program](https://github.com/421D/fullstack-frontend-projects/tree/main/wechat-miniprograms/community-service-miniprogram)
has a serverless backend (WeChat Cloud Functions and cloud database); it lives in the full-stack repository.

## Repository layout

```
rsheet-rust/            Cargo project (cargo run)
database-projects/
  clothing-sales-db/    clothing-sales.sql
```

Each project folder has its own README.
