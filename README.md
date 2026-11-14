# Mastering Lua & Luau: Systems Engineering & Game Architecture

A structured, production-focused repository documenting my deep dive into **Lua 5.1**, **Luau (Roblox)**, and **Defold**. Rather than basic syntax tutorials, this workspace focuses on **server-authoritative game systems, zero-trust network security, strict static typing, and clean software architecture** designed for commercial game development.

## 🎯 Core Focus Areas

1. **Language & Runtime Foundation:**

   * **Lua 5.1 / LuaJIT:** Core fluency in tables, metatables, coroutines, closures, and memory-safe patterns (the shared foundation of both Roblox and Defold).

   * **Typed Luau (`--!strict`):** Leveraging gradual static typing, custom `export type` definitions, compound operators, string interpolation, and the `task` scheduling library.

   * **TypeScript Interop (`roblox-ts`):** Exploring strongly-typed TypeScript-to-Luau compilation workflows alongside native Luau.

2. **Professional Toolchain & Workflow:**

   * **External IDE Setup:** Developing in VS Code rather than in-engine editors.

   * **Version Control & Sync:** Using **Rojo**, **Rokit**, and **Wally** to sync local codebases with Roblox Studio and manage dependencies cleanly via Git.

   * **Quality Assurance & Testing:** Applying an adversarial QA mindset—writing automated unit tests, profiling memory usage, and preventing connection/memory leaks (`Trove`/`Maid` patterns).

3. **Zero-Trust Security & Server-Authoritative Architecture:**

   * Designing `RemoteEvents` and `RemoteFunctions` under a strict *"never trust the client"* security model.

   * Implementing server-side validation layers: type verification, rate limiting, spatial/distance sanity checks, `NaN` guards, and race-condition prevention for virtual economies.

4. **Cross-Platform Commercial Prototyping (Defold):**

   * Utilizing **Defold** (Lua 5.1 / LuaJIT) for lightweight, fast-loading HTML5/WebAssembly web games, desktop utilities, and modular Lua packages.

## 🛠️ Featured Roadmap & Portfolio Modules

* \[ \] **Session-Locked Data & Trading Engine:** A server-authoritative inventory and currency module using `ProfileStore` with atomic trade validation to eliminate duplication glitches.

* \[ \] **Modular Ability & Hitbox Framework:** A data-driven combat system featuring server-side spatial validation, cooldown enforcement, and decoupled configuration tables.

* \[ \] **Finite State Machine (FSM) & AI Behavior Engine:** A reusable, strictly typed Luau state-machine library with runtime debugging overlays.

* \[ \] **Live-Ops Telemetry & Remote Config Wrapper:** An analytics batching and dynamic economy-tuning module built for rapid live-ops iteration.

* \[ \] **Defold HTML5 Micro-Game Prototype:** A lightweight, instant-load browser game compiled to WebAssembly.

## 🧰 Tech Stack & Tooling

* **Languages:** Lua 5.1, Luau (`--!strict`), TypeScript (`roblox-ts`)

* **Engines:** Roblox Studio, Defold

* **Workflow & DevOps:** VS Code, Git/GitHub, Rojo, Rokit, Wally, StyLua, Selene

* **Environment:** Windows 11 (Roblox Studio) & Linux (Defold / CLI Tooling)

## 📫 Connect & Collaborate

I bring 20+ years of enterprise operations, quality assurance, and risk-management experience into game systems engineering—focusing on reliable delivery, clean architecture, and bulletproof backend logic.

* **GitHub:** [github.com/](https://github.com/yourusername)ladoblanco

* **Roblox Talent Hub / DevForum:** *(Link your profile once live)*
