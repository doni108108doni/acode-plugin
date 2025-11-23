# Acode plugin

Read acode plugin [documentation](https://docs.acode.app/docs/) to develop plugin for acode editor.

## Setup

For a quick setup of the development environment, run:

```bash
chmod +x setup.sh
./setup.sh
```

This script will:
- Check for npm (if not found, provides manual installation instructions)
- Check for Zed editor (if not found, provides manual installation instructions)
- Clone the acodex_server repository
- Install project dependencies
- Build the project

**Note:** The script requires npm and Zed editor to be installed manually for security reasons. It will not automatically install these tools.

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
