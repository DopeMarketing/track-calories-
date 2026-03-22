import Link from 'next/link'

export default function Home() {
  return (
    <main className="min-h-screen bg-gradient-to-br from-green-400 to-blue-500">
      <div className="container mx-auto px-4 py-16">
        <div className="text-center text-white">
          <h1 className="text-6xl font-bold mb-8">Track Calories</h1>
          <p className="text-xl mb-12 max-w-2xl mx-auto">
            A simple and intuitive app to help you monitor your daily calorie consumption. 
            Set goals, log food, and track your progress with ease.
          </p>
          
          <div className="grid md:grid-cols-3 gap-8 mb-16 max-w-4xl mx-auto">
            <div className="bg-white/10 backdrop-blur rounded-lg p-6">
              <h3 className="text-xl font-semibold mb-4">Easy Food Logging</h3>
              <p>Quickly log your meals and snacks with our simple food entry system and built-in database lookup.</p>
            </div>
            <div className="bg-white/10 backdrop-blur rounded-lg p-6">
              <h3 className="text-xl font-semibold mb-4">Daily Goal Setting</h3>
              <p>Set personalized daily calorie targets and track your progress throughout the day.</p>
            </div>
            <div className="bg-white/10 backdrop-blur rounded-lg p-6">
              <h3 className="text-xl font-semibold mb-4">Progress Tracking</h3>
              <p>View your daily and weekly summaries to stay motivated and maintain healthy eating habits.</p>
            </div>
          </div>

          <div className="space-x-4">
            <Link 
              href="/login" 
              className="bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-colors inline-block"
            >
              Sign In
            </Link>
            <Link 
              href="/signup" 
              className="bg-blue-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors inline-block"
            >
              Get Started
            </Link>
          </div>
        </div>
      </div>
    </main>
  )
}