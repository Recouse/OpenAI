# Examples

This directory contains example applications demonstrating how to use the OpenAI package.

## OpenAI Example App

A SwiftUI example app that demonstrates the core functionality of the OpenAI package.

### Setup

#### Configure API Keys

The app uses a configuration file to store API keys securely. Create a `Config.xcconfig` file in the `OpenAI Example/` directory.

Create `Config.xcconfig` with your configuration:
```
// OpenAI API Key - Get this from https://platform.openai.com/api-keys
OPENAI_API_KEY = your_openai_api_key_here

// Optional: OpenAI Organization ID
OPENAI_ORGANIZATION_ID = your_organization_id_here
```

> **Note**: The `Config.xcconfig` file is already added to `.gitignore` and will not be committed to version control.
