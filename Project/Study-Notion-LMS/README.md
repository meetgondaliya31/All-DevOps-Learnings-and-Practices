
# StudyNotion LMS

StudyNotion is a full-stack ed-tech platform built with the MERN stack. It allows students to browse and enroll in courses, while instructors can create and manage course content, sections, media, ratings, and progress tracking.

## Key Features

- User authentication and authorization
- OTP-based verification and password reset flow
- Student and instructor roles with separate dashboards
- Course creation, update, deletion, and section management
- Media upload integration with Cloudinary
- Course purchase and payment handling with Razorpay
- Ratings, reviews, and course progress tracking

## Tech Stack

### Frontend
- React.js
- Vite
- Redux Toolkit
- Tailwind CSS
- Framer Motion
- React Router DOM

### Backend
- Node.js
- Express.js
- MongoDB with Mongoose
- JWT authentication
- Cloudinary for media uploads
- Razorpay for payments
- Nodemailer for email delivery

## Prerequisites

Before running the application, make sure you have:

- Node.js 18+ and npm
- MongoDB running locally or a MongoDB Atlas connection string
- A Cloudinary account
- A Razorpay account
- SMTP mail credentials (for OTP and email features)

## 1. Clone the Repository

```bash
git clone <your-repository-url>
cd Study-Notion-LMS
```

## 2. Backend Setup

```bash
cd backend
npm install
```

Create a file named `.env` inside the `backend` folder with the following variables:

```env
PORT=5000
DATABASE_URL=mongodb://127.0.0.1:27017/studynotion
JWT_SECRET=your_jwt_secret_here
FOLDER_NAME=StudyNotion

CLOUD_NAME=your_cloud_name
API_KEY=your_cloudinary_api_key
API_SECRET=your_cloudinary_api_secret

RAZORPAY_KEY=your_razorpay_key
RAZORPAY_SECRET=your_razorpay_secret

MAIL_HOST=smtp.gmail.com
MAIL_USER=your_email@gmail.com
MAIL_PASS=your_app_password
```

Start the backend server:

```bash
npm run dev
```

The backend will run on:

```text
http://localhost:5000
```

## 3. Frontend Setup

Open a new terminal and run:

```bash
cd frontend
npm install
```

Create a file named `.env` inside the `frontend` folder with:

```env
VITE_APP_BASE_URL=http://localhost:5000/api/v1
VITE_APP_RAZORPAY_KEY=your_razorpay_key
```

Start the frontend development server:

```bash
npm run dev
```

The frontend will run on:

```text
http://localhost:5173
```

## 4. Open the Application

Open your browser and visit:

```text
http://localhost:5173
```

You can now sign up, log in, create courses, and explore the platform.

## Project Structure

```text
backend/   - Express server, API routes, controllers, models, and configs
frontend/  - React app, pages, services, Redux slices, and UI components
```

## Useful Commands

### Backend
```bash
cd backend
npm run dev
```

### Frontend
```bash
cd frontend
npm run dev
```

### Build frontend for production
```bash
cd frontend
npm run build
```

## Notes for Full Functionality

To make the app fully functional, make sure you configure:

- MongoDB connection string
- Cloudinary credentials for image/video uploads
- Razorpay keys for course purchases
- SMTP credentials for OTP and email verification

## Troubleshooting

- If the frontend cannot connect to the backend, verify that the backend is running and that `VITE_APP_BASE_URL` points to the correct address.
- If MongoDB throws connection errors, confirm that your database is running and that the `DATABASE_URL` is correct.
- If uploads fail, check your Cloudinary credentials.
- If emails are not sent, confirm your SMTP host, username, and password.

## License

This project is licensed under the ISC License.













 
