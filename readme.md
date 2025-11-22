# Full Access Acode Plugin

This plugin provides full access to all projects and comprehensive permissions for working with Acode editor.

## Features

This plugin is configured with full access capabilities including:

- **Full Filesystem Access**: Complete read/write access to filesystem operations through Acode SDK
- **All Projects Access**: Ability to access and work with all open projects and files
- **Editor Manipulation**: Full access to editor content and manipulation
- **Project Management**: Comprehensive project management operations
- **File Operations**: Complete file system read/write/delete operations

## Permissions & Capabilities

This plugin utilizes the Acode API to provide:

1. **Filesystem Operations** - Access to `fs` module for file operations
2. **Editor Manager** - Access to all open files and editor instances
3. **Active File Access** - Direct access to currently active file
4. **Project Files** - Access to all files in all open projects
5. **Content Manipulation** - Full ability to read and modify file contents

## Security Notice

This plugin has broad access to your projects and filesystem. Only use this plugin if you understand and trust its functionality. Always review the source code before installation.

## Development

Read acode plugin [documentation](https://docs.acode.app/docs/) to develop plugin for acode editor.

### Usage

Use this for debug build:

```bash
npm run dev
```

and this for production build:

```bash
npm run build
```

## Installation

1. Build the plugin using `npm run build`
2. Install the generated `plugin.zip` file in Acode
3. The plugin will have full access to your projects upon activation

## License

MIT License - see LICE
NSE file for details

o



