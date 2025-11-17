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

# Install npm if not already installed
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

# Install Zed editor if not already installed
echo "Step 2: Checking Zed editor installation..."
if command_exists zed; then
    echo "✓ Zed editor is already installed"
else
    echo "Installing Zed editor..."
    curl -f https://zed.dev/install.sh | sh
    if command_exists zed; then
        echo "✓ Zed editor installed successfully"
    else
        echo "✗ Zed editor installation failed. Please check your system and try again." >&2
        exit 1
    fi
fi
echo ""

# Clone acodex_server repository if it doesn't exist
echo "Step 3: Checking acodex_server repository..."
if [ -d "acodex_server" ]; then
    echo "✓ acodex_server repository already exists"
    echo "  Updating repository..."
    cd acodex_server
    git pull || echo "Warning: Could not update repository"
    cd ..
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
echo "  npm run dev    - Start development server"
echo "  npm run build  - Build for production"
echo ""
