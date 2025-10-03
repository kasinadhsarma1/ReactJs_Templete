# Contributing to ReactJs Template

We love your input! We want to make contributing to this project as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## Development Process

We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

## How to Contribute

### 1. Fork the Repository

Fork the repository and create your branch from `master`:

```bash
git clone https://github.com/your-username/my-app.git
cd my-app
git checkout -b feature/AmazingFeature
```

### 2. Set Up Development Environment

#### Backend Setup

```bash
cd backend

# Create a virtual environment
python -m venv venv

# Activate virtual environment
# On Linux/Mac:
source venv/bin/activate
# On Windows:
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

#### Frontend Setup

```bash
cd frontend

# Install dependencies
npm install
# or
yarn install
```

### 3. Make Your Changes

- Write clean, readable code
- Follow the existing code style
- Add tests for new functionality
- Update documentation as needed

### 4. Test Your Changes

#### Frontend Tests

```bash
cd frontend
npm test
```

#### Backend Tests

```bash
cd backend
pytest
```

### 5. Submit a Pull Request

1. Commit your changes with a clear commit message
2. Push to your fork
3. Open a Pull Request with a clear title and description

## Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a build
2. Update the README.md with details of changes to the interface, this includes new environment variables, exposed ports, useful file locations and container parameters
3. Increase the version numbers in any examples files and the README.md to the new version that this Pull Request would represent
4. Your Pull Request will be reviewed by maintainers, who may ask for changes

## Code Style Guidelines

### JavaScript/React
- Use ESLint + Prettier for code formatting
- Follow React best practices and hooks patterns
- Use functional components with hooks
- Write meaningful component and variable names

### Python/FastAPI
- Use Black for code formatting
- Follow PEP 8 style guide
- Use type hints where appropriate
- Write docstrings for functions and classes

### Commit Messages
- Use Conventional Commits format
- Examples:
  - `feat: add user authentication`
  - `fix: resolve CORS issue in API`
  - `docs: update installation instructions`
  - `refactor: improve error handling`

## Reporting Bugs

We use GitHub issues to track public bugs. Report a bug by opening a new issue.

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

## Feature Requests

We use GitHub issues to track feature requests as well. When submitting a feature request:

- Provide a clear and detailed explanation of the feature
- Explain why this feature would be useful
- Include examples or mockups if applicable

## Development Guidelines

### Adding New Dependencies

Before adding new dependencies:
- Check if the functionality can be achieved with existing dependencies
- Ensure the dependency is actively maintained
- Check for security vulnerabilities
- Update both `package.json` and `requirements.txt` as needed

### Adding shadcn/ui Components

```bash
cd frontend
npx shadcn-ui@latest add [component-name]
```

### Database Changes

- Always create migration scripts for database schema changes
- Test migrations thoroughly before submitting
- Update documentation for any API changes

## Code Review Process

All submissions require review. We use GitHub pull requests for this purpose. Consult GitHub Help for more information on using pull requests.

## Community

- Be respectful and inclusive
- Help others learn and grow
- Share knowledge and best practices
- Follow our Code of Conduct

## Questions?

Don't hesitate to ask questions by opening an issue or reaching out to the maintainers.

## Recognition

Contributors will be recognized in the project README and release notes.

Thank you for contributing! 🎉
