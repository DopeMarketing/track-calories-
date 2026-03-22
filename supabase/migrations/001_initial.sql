-- Enable Row Level Security
alter table auth.users enable row level security;

-- Create food_entries table
create table if not exists public.food_entries (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  food_name text not null,
  calories integer not null check (calories >= 0),
  serving_size text,
  logged_at timestamp with time zone default timezone('utc'::text, now()) not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create user_profiles table for storing daily calorie goals
create table if not exists public.user_profiles (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade unique not null,
  daily_calorie_goal integer default 2000 check (daily_calorie_goal > 0),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create food_database table for common foods
create table if not exists public.food_database (
  id uuid default gen_random_uuid() primary key,
  name text unique not null,
  calories_per_100g integer not null check (calories_per_100g >= 0),
  common_serving_size text,
  common_serving_calories integer check (common_serving_calories >= 0),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Set up Row Level Security policies
create policy "Users can view own food entries" on public.food_entries
  for select using (auth.uid() = user_id);

create policy "Users can insert own food entries" on public.food_entries
  for insert with check (auth.uid() = user_id);

create policy "Users can update own food entries" on public.food_entries
  for update using (auth.uid() = user_id);

create policy "Users can delete own food entries" on public.food_entries
  for delete using (auth.uid() = user_id);

create policy "Users can view own profile" on public.user_profiles
  for select using (auth.uid() = user_id);

create policy "Users can insert own profile" on public.user_profiles
  for insert with check (auth.uid() = user_id);

create policy "Users can update own profile" on public.user_profiles
  for update using (auth.uid() = user_id);

create policy "All users can view food database" on public.food_database
  for select using (true);

-- Insert some common foods into the database
insert into public.food_database (name, calories_per_100g, common_serving_size, common_serving_calories) values
  ('Apple', 52, '1 medium (182g)', 95),
  ('Banana', 89, '1 medium (118g)', 105),
  ('White Rice (cooked)', 130, '1 cup (158g)', 205),
  ('Brown Rice (cooked)', 111, '1 cup (195g)', 216),
  ('Chicken Breast (grilled)', 165, '100g', 165),
  ('Salmon (grilled)', 206, '100g', 206),
  ('Whole Wheat Bread', 247, '1 slice (28g)', 69),
  ('Greek Yogurt (plain)', 59, '1 cup (245g)', 144),
  ('Almonds', 579, '1 oz (28g)', 162),
  ('Broccoli (steamed)', 34, '1 cup (156g)', 53);

-- Enable RLS on all tables
alter table public.food_entries enable row level security;
alter table public.user_profiles enable row level security;
alter table public.food_database enable row level security;

-- Create function to automatically create user profile
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.user_profiles (user_id)
  values (new.id);
  return new;
end;
$$;

-- Trigger to create profile when new user signs up
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();