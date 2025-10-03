# JavaScript Template

A full-stack JavaScript application template with React frontend and FastAPI backend, featuring MongoDB integration.

## 📋 Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [Technology Stack](#technology-stack)
- [Features](#features)
- [Development](#development)
- [API Documentation](#api-documentation)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

This is a modern full-stack JavaScript/Python template project that includes:
- **React Frontend**: Modern UI with comprehensive component library
- **FastAPI Backend**: High-performance Python backend with async support
- **MongoDB Integration**: NoSQL database for flexible data storage
- **shadcn/ui Components**: Beautiful, accessible UI components

This template is designed to help you quickly bootstrap full-stack applications with best practices and modern tooling.

## 📁 Project Structure

```
Javascript_Template/
├── backend/                 # FastAPI backend service
│   ├── main.py             # Main FastAPI application
│   └── requirements.txt    # Python dependencies
├── frontend/               # React frontend application
│   ├── public/            # Static assets
│   ├── src/
│   │   ├── components/    # React components
│   │   │   └── ui/       # shadcn/ui component library (50+ components)
│   │   ├── App.js        # Main App component
│   │   ├── index.js      # Application entry point
│   │   └── index.css     # Global styles
│   ├── package.json      # Node.js dependencies
│   └── tests/            # Frontend tests
├── tests/                 # Backend tests
├── .gitignore            # Git ignore rules
└── README.md             # Project documentation
```

## 🔧 Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v16 or higher)
- **npm** (v8 or higher) or **yarn** (v1.22 or higher)
- **Python** (v3.9 or higher)
- **pip** (Python package manager)
- **MongoDB** (v5.0 or higher) - Local or Atlas cloud instance

## 📦 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/kasinadhsarma1/Javascript_Template.git
cd Javascript_Template
```

### 2. Backend Setup

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

### 3. Frontend Setup

```bash
cd frontend

# Install dependencies
npm install
# or
yarn install
```

### 4. Environment Configuration

Create a `.env` file in the backend directory:

```env
MONGODB_URL=mongodb://localhost:27017/your_database
DATABASE_NAME=your_database
SECRET_KEY=your_secret_key_here
PORT=8000
```

Create a `.env` file in the frontend directory (if needed):

```env
REACT_APP_API_URL=http://localhost:8000
```

## 🚀 Running the Application

### Start the Backend Server

```bash
cd backend
source venv/bin/activate  # Activate virtual environment

# Run with uvicorn
uvicorn main:app --reload --host 0.0.0.0 --port 8000

# Or run directly
python main.py
```

The backend API will be available at `http://localhost:8000`

### Start the Frontend Development Server

```bash
cd frontend

# Start React development server
npm start
# or
yarn start
```

The frontend will automatically open at `http://localhost:3000`

## 🛠️ Technology Stack

### Frontend (97.4% JavaScript)
- **React 18** - UI library with hooks
- **React Router** - Client-side routing
- **shadcn/ui** - Accessible component library based on Radix UI
- **Tailwind CSS** - Utility-first CSS framework
- **Axios/Fetch** - HTTP client for API calls

### Backend
- **Python/FastAPI** - Modern, fast web framework
- **MongoDB** - NoSQL database
- **Motor** - Async MongoDB driver
- **Pydantic** - Data validation
- **uvicorn** - ASGI server

### UI Component Library (50+ Components)

The template includes a comprehensive set of shadcn/ui components:

**Layout & Navigation:**
- Accordion, Breadcrumb, Card, Carousel
- Navigation Menu, Menubar, Tabs, Sheet

**Forms & Inputs:**
- Button, Input, Checkbox, Radio Group
- Select, Textarea, Form, Label
- Calendar, Input OTP, Slider, Switch

**Feedback & Overlays:**
- Alert, Alert Dialog, Dialog, Drawer
- Toast, Sonner, Tooltip, Hover Card
- Progress, Skeleton

**Data Display:**
- Avatar, Badge, Table, Pagination
- Aspect Ratio, Separator

**Advanced:**
- Command, Context Menu, Dropdown Menu
- Collapsible, Popover, Resizable
- Scroll Area, Toggle, Toggle Group

## ✨ Features

- ✅ Modern React 18 with functional components and hooks
- ✅ FastAPI backend with automatic API documentation
- ✅ MongoDB integration with async operations
- ✅ Comprehensive UI component library (shadcn/ui)
- ✅ Responsive and accessible design
- ✅ Hot reload for both frontend and backend
- ✅ Type-safe API with Pydantic models
- ✅ Easy to extend and customize
- ✅ Production-ready structure

## 💻 Development

### Frontend Development

```bash
cd frontend

# Start development server
npm start

# Run tests
npm test

# Build for production
npm run build

# Run tests with coverage
npm test -- --coverage
```

### Backend Development

```bash
cd backend

# Start with auto-reload
uvicorn main:app --reload

# Run tests
pytest

# Run tests with coverage
pytest --cov=.

# Format code
black .

# Lint code
flake8 .
```

### Adding New shadcn/ui Components

```bash
cd frontend

# Add a specific component
npx shadcn-ui@latest add [component-name]

# Example: Add a data table component
npx shadcn-ui@latest add data-table
```

## 📚 API Documentation

FastAPI provides automatic interactive API documentation:

- **Swagger UI**: `http://localhost:8000/docs`
- **ReDoc**: `http://localhost:8000/redoc`
- **OpenAPI JSON**: `http://localhost:8000/openapi.json`

## 🧪 Testing

### Frontend Tests

```bash
cd frontend
npm test
```

Tests are located in:
- `src/**/*.test.js`
- `src/**/*.spec.js`

### Backend Tests

```bash
cd backend
pytest
```

Tests are located in:
- `tests/`

## 🏗️ Building for Production

### Frontend

```bash
cd frontend
npm run build
```

The optimized production build will be in the `frontend/build/` directory.

### Backend

```bash
cd backend

# Install production dependencies only
pip install -r requirements.txt --no-dev

# Run with production settings
uvicorn main:app --host 0.0.0.0 --port 8000 --workers 4
```

## 🚢 Deployment

### Frontend Deployment Options
- Vercel
- Netlify
- AWS S3 + CloudFront
- GitHub Pages

### Backend Deployment Options
- Heroku
- AWS EC2/ECS
- Google Cloud Run
- DigitalOcean App Platform
- Railway

### Database
- MongoDB Atlas (recommended for production)
- Self-hosted MongoDB

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Code Style

- **JavaScript**: ESLint + Prettier
- **Python**: Black + Flake8
- **Commits**: Conventional Commits

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Author

**kasinadhsarma1**
- GitHub: [@kasinadhsarma1](https://github.com/kasinadhsarma1)

## 🙏 Acknowledgments

- [React](https://reactjs.org/) - The web framework used
- [FastAPI](https://fastapi.tiangolo.com/) - Modern Python web framework
- [shadcn/ui](https://ui.shadcn.com/) - Beautiful component library
- [Tailwind CSS](https://tailwindcss.com/) - Utility-first CSS framework
- [MongoDB](https://www.mongodb.com/) - Database

## 📞 Support

If you have any questions or issues, please:
- Open an issue on GitHub
- Check existing issues and discussions