# New Game

This is a template repository for building games with Lua+LÖVE.

It ships with the following things:
 - A "Hello World" LÖVE application
 - A `release` workflow that:
    1. Only runs when you push with a version tag, i.e. v1.0
    2. Builds the game for LÖVE/Linux, Windows (32-, 64-bit), and MacOS.
    3. Pushes builds to a GitHub release.
    4. Pushes builds to an Itch.IO page.
