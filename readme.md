# Acode plugin

Read acode plugin [documentation](https://docs.acode.app/docs/) to develop plugin for acode editor.

## Setup

For a quick setup of the development environment, run:

```bash
./setup.sh
```

This script will:
- Install npm (if not already installed)
- Install Zed editor (if not already installed)
- Clone the acodex_server repository
- Install project dependencies
- Build the project

## Usage

Use this for debug build:

```
npm run dev
```

and this for production build:

```
npm run build
```

## How to parse/bundle scss file ?

You'll need to install one sass esbuild plugin and then just add that in `esbuild.config.mjs` at line 34
