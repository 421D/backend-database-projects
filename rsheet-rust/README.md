# RSheet

A concurrent spreadsheet server in Rust. Several clients can set and read cells at the same time; when a cell changes, every cell that depends on it is recalculated in the background.

The [`rsheet_lib`](https://crates.io/crates/rsheet_lib) crate supplies the expression parser and the connection layer; the server, dependency tracking and concurrency model in `src/lib.rs` are my implementation.

## What it does

```
set A1 5
set B1 A1 * 2
get B1          → B1 = 10
set A1 7
get B1          → B1 = 14   (recomputed automatically)
```

- Expressions can use single cells (`A1`), vectors (`A1_A7`) and matrices (`B2_D10`).
- Errors propagate: a cell that depends on a failing cell reports a dependency error.

## How it works

- **One thread per connection.** Each client connection runs on its own thread and shares state through `Arc<Mutex<…>>`.
- **Dependency graph.** Two maps are kept in sync: which cells a cell reads from, and which cells read from it. Every `set` replaces the cell's old edges before recomputing.
- **Background worker.** Changed cells are sent over an `mpsc` channel to a worker thread, which recomputes their dependents and pushes those onward in turn.
- **Version numbers stop stale writes.** Every cell carries a version. A recomputation only writes its result if the version it started from is still current, so a slow, outdated calculation can never overwrite a newer value.
- **Waiting for consistency.** A `Condvar` lets a `get` wait until pending recomputations have finished.

## Stack

Rust, `std::thread`, `Arc`, `Mutex`, `Condvar`, `mpsc`, `HashMap` / `HashSet`, `rsheet_lib`, `clap`

## Run it

```bash
cd rsheet-rust
cargo run                     # interactive, reads commands from the terminal
cargo run -- 127.0.0.1:5000   # server mode, accepts several client connections
```

Commands: `set <cell> <expression>`, `get <cell>`, `sleep <ms>`.
