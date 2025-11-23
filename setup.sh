#!/bin/bash

# Setup script for Acode Plugin Development Environment
# This script installs required tools and dependencies

set -e  # Exit on error

echo "=========================================="
echo "Acode Plugin Development Setup"
echo "=========================================="
echo ""

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check npm installation
echo "Step 1: Checking npm installation..."
if command_exists npm; then
    echo "✓ npm is already installed (version: $(npm --version))"
else
    echo "npm is not installed."
    echo "For security reasons, this script does not install npm automatically."
    echo "Please install Node.js and npm using your system's package manager or a version manager like nvm."
    echo ""
    echo "Examples:"
    echo "  On Ubuntu/Debian: sudo apt update && sudo apt install nodejs npm"
    echo "  On macOS: brew install node"
    echo "  Using nvm: https://github.com/nvm-sh/nvm"
    echo ""
    echo "After installing Node.js and npm, re-run this setup script."
    exit 1
fi
echo ""

# Check Zed editor installation
echo "Step 2: Checking Zed editor installation..."
if command_exists zed; then
    echo "✓ Zed editor is already installed"
else
    echo "Zed editor is not installed."
    echo "For security reasons, this script does not install Zed editor automatically."
    echo "Please install Zed editor manually from the official website:"
    echo "  https://zed.dev/download"
    echo ""
    echo "After installing Zed editor, re-run this setup script."
    exit 1
fi
echo ""

# Clone acodex_server repository if it doesn't exist
echo "Step 3: Checking acodex_server repository..."
if [ -d "acodex_server" ]; then
    echo "✓ acodex_server repository already exists"
    echo "  Updating repository..."
    cd acodex_server
    if ! git pull 2>git_pull_error.log; then
        echo "✗ Could not update repository. See details below:" >&2
        cat git_pull_error.log >&2
        echo "Please manually review the repository for issues such as merge conflicts, network problems, or uncommitted changes." >&2
        echo "You may need to resolve these issues before continuing." >&2
        rm -f git_pull_error.log
        cd .. || { echo "Error: Failed to change directory from acodex_server to parent directory."; exit 1; }
        exit 1
    fi
    rm -f git_pull_error.log
    cd .. || { echo "Error: Failed to change directory from acodex_server to parent directory."; exit 1; }
else
    echo "Cloning acodex_server repository..."
    if command_exists gh; then
        gh repo clone bajrangCoder/acodex_server
    else
        git clone https://github.com/bajrangCoder/acodex_server.git
    fi
    echo "✓ acodex_server repository cloned successfully"
fi
echo ""

# Install project dependencies
echo "Step 4: Installing project dependencies..."
npm install
echo "✓ Dependencies installed successfully"
echo ""

# Build the project
echo "Step 5: Building the project..."
npm run build
echo "✓ Project built successfully"
echo ""

echo "=========================================="
echo "Setup completed successfully!"
echo "=========================================="
echo ""
echo "You can now start development with:"
echo "  npm run dev    - Start development build (esbuild serve mode)"
echo "  npm run build  - Build for production"
echo ""
