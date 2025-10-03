#!/bin/bash

# Security Audit Script for ReactJS Template
# This script runs various security checks on both frontend and backend

set -e

echo "🔒 Running Security Audit for ReactJS Template"
echo "=============================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if dependencies are installed
check_dependencies() {
    print_status "Checking required dependencies..."
    
    # Check Node.js and npm
    if ! command -v node &> /dev/null; then
        print_error "Node.js is not installed"
        exit 1
    fi
    
    if ! command -v npm &> /dev/null; then
        print_error "npm is not installed"
        exit 1
    fi
    
    # Check Python
    if ! command -v python3 &> /dev/null && ! command -v python &> /dev/null; then
        print_error "Python is not installed"
        exit 1
    fi
    
    print_status "All dependencies are available"
}

# Frontend Security Audit
audit_frontend() {
    print_status "Running Frontend Security Audit..."
    
    cd frontend
    
    # Install dependencies if needed
    if [ ! -d "node_modules" ]; then
        print_status "Installing frontend dependencies..."
        npm install
    fi
    
    # Run npm audit
    print_status "Running npm audit..."
    npm audit --audit-level=moderate || print_warning "npm audit found vulnerabilities"
    
    # Check for security-sensitive packages
    print_status "Checking for security-sensitive packages..."
    if npm list | grep -E "(eval|vm2|serialize-javascript)" > /dev/null; then
        print_warning "Potentially unsafe packages detected"
    fi
    
    # Check for outdated packages
    print_status "Checking for outdated packages..."
    npm outdated || print_warning "Some packages are outdated"
    
    cd ..
}

# Backend Security Audit
audit_backend() {
    print_status "Running Backend Security Audit..."
    
    cd backend
    
    # Check if virtual environment exists
    if [ ! -d "venv" ] && [ ! -d ".venv" ]; then
        print_warning "Virtual environment not found. Creating one..."
        python3 -m venv venv
        source venv/bin/activate
        pip install -r requirements.txt
    else
        # Activate virtual environment
        if [ -d "venv" ]; then
            source venv/bin/activate
        else
            source .venv/bin/activate
        fi
    fi
    
    # Install security tools if not present
    print_status "Installing security tools..."
    pip install bandit safety semgrep 2>/dev/null || print_warning "Some security tools failed to install"
    
    # Run bandit security scanner
    print_status "Running Bandit security scanner..."
    if command -v bandit &> /dev/null; then
        bandit -r . -f json -o bandit-report.json || print_warning "Bandit found security issues"
        bandit -r . || print_warning "Bandit found security issues"
    else
        print_warning "Bandit not available"
    fi
    
    # Run safety check for known vulnerabilities
    print_status "Running Safety check for known vulnerabilities..."
    if command -v safety &> /dev/null; then
        safety check --json --output safety-report.json || print_warning "Safety found vulnerabilities"
        safety check || print_warning "Safety found vulnerabilities"
    else
        print_warning "Safety not available"
    fi
    
    # Check for hardcoded secrets
    print_status "Checking for hardcoded secrets..."
    if grep -r -i -E "(password|secret|key|token|api_key)" . --exclude-dir=venv --exclude-dir=.venv --exclude="*.json" --exclude="*.log" --include="*.py" | grep -v "example" | grep -v "template"; then
        print_warning "Potential hardcoded secrets found"
    fi
    
    cd ..
}

# Check environment files
check_env_files() {
    print_status "Checking environment file security..."
    
    # Check if .env files exist and are properly protected
    for env_file in .env frontend/.env backend/.env; do
        if [ -f "$env_file" ]; then
            permissions=$(ls -la "$env_file" | cut -d' ' -f1)
            if [[ "$permissions" != *"------"* ]]; then
                print_warning "$env_file has overly permissive permissions"
            fi
        fi
    done
    
    # Check if example env files exist
    if [ ! -f "frontend/.env.example" ]; then
        print_warning "frontend/.env.example not found"
    fi
    
    if [ ! -f "backend/.env.example" ]; then
        print_warning "backend/.env.example not found"
    fi
}

# Check Git security
check_git_security() {
    print_status "Checking Git security..."
    
    # Check if .env files are in .gitignore
    if ! grep -q "\.env" .gitignore; then
        print_error ".env files are not in .gitignore"
    fi
    
    # Check for secrets in git history
    print_status "Checking for secrets in git history..."
    if git log --all --full-history --grep="password\|secret\|key\|token" | head -5; then
        print_warning "Potential secrets found in git history"
    fi
}

# Generate security report
generate_report() {
    print_status "Generating security report..."
    
    report_file="security-audit-report-$(date +%Y%m%d-%H%M%S).md"
    
    cat > "$report_file" << EOF
# Security Audit Report

**Date**: $(date)
**Project**: ReactJS Template

## Summary

This report contains the results of the security audit performed on the ReactJS Template project.

## Frontend Security

- npm audit results: See above output
- Package vulnerabilities: Checked
- Outdated packages: Checked

## Backend Security

- Bandit scan: $([ -f "backend/bandit-report.json" ] && echo "Completed" || echo "Not run")
- Safety check: $([ -f "backend/safety-report.json" ] && echo "Completed" || echo "Not run")
- Secret detection: Checked

## Environment Security

- Environment file permissions: Checked
- .gitignore configuration: Checked

## Recommendations

1. Regularly update dependencies
2. Use environment variables for secrets
3. Enable dependabot alerts
4. Run security audits before deployments
5. Implement proper authentication and authorization
6. Use HTTPS in production
7. Implement rate limiting
8. Add security headers

## Next Steps

1. Review and fix any identified vulnerabilities
2. Update dependencies to latest secure versions
3. Implement missing security measures
4. Schedule regular security audits

EOF

    print_status "Security report generated: $report_file"
}

# Main execution
main() {
    print_status "Starting security audit..."
    
    check_dependencies
    audit_frontend
    audit_backend
    check_env_files
    check_git_security
    generate_report
    
    print_status "Security audit completed!"
    print_status "Review the generated report and address any findings."
}

# Run main function
main "$@"
