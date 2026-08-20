# FeedbackHub (Self-MSDE Website)

This repository contains the FeedbackHub web application split into two projects:

- `feedbackhub-backend/`: Express API server with Prisma and PostgreSQL.
- `feedbackhub-frontend/`: React + Vite frontend application.

## Prerequisites

- Node.js 20+ (or compatible modern Node version)
- npm
- PostgreSQL database (for the backend)

## Repository Structure

```
Feedback-Hub/
  feedbackhub-backend/
  feedbackhub-frontend/
```

## Backend Setup (`feedbackhub-backend`)

### 1. Install dependencies

```bash
cd feedbackhub-backend
npm install
```

### 2. Configure environment variables

The backend uses a `.env` file in `feedbackhub-backend/` with the following variables:

```env
PORT=5000
JWT_SECRET="feedbackhub_jwt_secret_key_2026_production_grade"
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/feedbackhub_db?schema=public"
```

Update `DATABASE_URL` to match your PostgreSQL credentials and database name.

### 3. Generate Prisma client

```bash
npx prisma generate
```

### 4. Run database migrations

```bash
npx prisma migrate dev --name init
```

> If you do not have PostgreSQL available, the backend includes fallback memory data for development in some routes, but full database storage requires PostgreSQL.

### 5. Start the backend server

```bash
npm run dev
```

The API will run by default at:

- `http://localhost:5000`

Health check endpoint:

- `http://localhost:5000/api/health`

## Frontend Setup (`feedbackhub-frontend`)

### 1. Install dependencies

```bash
cd ../feedbackhub-frontend
npm install
```

### 2. Start the frontend dev server

```bash
npm run dev
```

The app will start with Vite and typically be available at:

- `http://localhost:5173`

## Frontend / Backend Integration

The frontend is configured to call the backend API at:

- `http://localhost:5000/api`

This is defined in `feedbackhub-frontend/src/api/axios.js`.

If you change the backend port or host, update `baseURL` there accordingly.

## Available Scripts

### Backend scripts

- `npm start` - start the backend from `src/index.js`
- `npm run dev` - start the backend with Node watch mode
- `npm run prisma:generate` - generate Prisma client
- `npm run prisma:migrate` - apply Prisma migrations

### Frontend scripts

- `npm run dev` - start Vite dev server
- `npm run build` - build production frontend
- `npm run preview` - preview production build

## Notes

- Authentication uses JWT tokens and the backend expects `Authorization: Bearer <token>` for protected routes.
- The frontend includes registration, login, dashboard, forms management, responses, analytics, and public feedback pages.
- The backend API endpoints are mounted under `/api`, with public-facing form routes under `/api/public`.

## Quick Start

1. Start the backend:

```bash
cd feedbackhub-backend
npm install
npx prisma generate
npx prisma migrate dev --name init
npm run dev
```

2. Start the frontend:

```bash
cd ../feedbackhub-frontend
npm install
npm run dev
```

3. Open the frontend in your browser at `http://localhost:5173`.

## Troubleshooting

- If the backend cannot connect to PostgreSQL, verify `DATABASE_URL` and that the database exists.
- If the frontend cannot reach the API, ensure the backend is running and `feedbackhub-frontend/src/api/axios.js` points to the correct backend URL.
- Use the health check endpoint to confirm backend availability: `http://localhost:5000/api/health`.
