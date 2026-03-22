# Track Calories

A simple and intuitive calorie tracking application built with Next.js and Supabase.

## Features

- **Easy Food Logging**: Quickly log your meals and snacks with a simple interface
- **Daily Goal Setting**: Set personalized daily calorie targets
- **Progress Tracking**: View daily and weekly summaries of your calorie consumption
- **Food Database**: Built-in database of common foods with calorie information
- **User Authentication**: Secure sign-up and sign-in functionality

## Technology Stack

- **Frontend**: Next.js 15 with App Router, TypeScript, Tailwind CSS
- **Backend**: Supabase (Database, Authentication, Real-time)
- **Deployment**: Vercel (recommended)

## Getting Started

### Prerequisites

- Node.js 18.17 or later
- A Supabase account and project

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd track-calories
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
```bash
cp .env.example .env.local
```

Fill in your Supabase credentials in `.env.local`:
- `NEXT_PUBLIC_SUPABASE_URL`: Your Supabase project URL
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`: Your Supabase anonymous key
- `SUPABASE_SERVICE_ROLE_KEY`: Your Supabase service role key

4. Run database migrations:
Navigate to your Supabase dashboard and run the SQL migration in `supabase/migrations/001_initial.sql`

5. Start the development server:
```bash
npm run dev
```

6. Open [http://localhost:3000](http://localhost:3000) in your browser.

## Project Structure

```
├── app/                    # Next.js app directory
│   ├── (auth)/            # Authentication pages
│   ├── dashboard/         # Dashboard pages
│   ├── globals.css        # Global styles
│   ├── layout.tsx         # Root layout
│   └── page.tsx          # Homepage
├── lib/                   # Shared utilities
│   └── supabase/         # Supabase client configuration
├── supabase/             # Database migrations
└── middleware.ts         # Next.js middleware for auth
```

## Features Roadmap

### Current Features
- User authentication (sign up, sign in, sign out)
- Basic app structure and navigation

### Planned Features
- Food entry logging with calorie tracking
- Daily calorie goal management
- Food database search and selection
- Daily and weekly progress views
- Calorie consumption analytics
- Historical data visualization

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.