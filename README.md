# Elm Tutorial

## Installing Elm

```bash
npm i -g elm elm-format elm-test elm-json
```

## Installing the Elm plugin for VS Code

Search for `elmtooling.elm-ls-vscode`in VS Code extensions.

## Compiling Elm

```bash
elm make src/Main.elm --output index.html
```

Or with a development server:

```bash
elm-live src/Main.elm -- --output index.html
```

## Resources

[Documentation for core functions and packages](https://package.elm-lang.org/packages/elm/core/latest/)

[Searching functions by type signature in libraries](https://klaftertief.github.io/elm-search/)

[Elm UI](https://www.youtube.com/watch?v=Ie-gqwSHQr0)

[Extensive tutorial](https://elmprogramming.com/)
