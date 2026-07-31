# Cren

A gamified daily planner built for Hack Club stuff and school, so nothing gets lost between a late coding session and a physics exam.

## Why

I kept missing deadlines — not because I forgot to think about them, but because by the time I was actually free to fill out a form or write a devlog, I was too tired, and then exams took over the next morning. Cren keeps everything in one place on my phone instead of scattered across a calendar app, sticky notes, and half-remembered plans.

## What it does

- **Crew screen** — today's date, plus every active project or exam as a card
- **Project cards** — break work into "where you are," "what's next," and a Hack Club submission status
- **Exam cards** — syllabus notes, a study video link, and the date
- **Pomodoro timer** — built in, no separate app needed
- **Hack Club status tracking** — set manually for now, OAuth-based auto-sync coming once I have a registered client ID

## Stack

- Flutter (Dart)
- Hive for local storage — no backend, no login, no account system
- Shipped as a straight APK, no Play Store

## Running it

\`\`\`bash
git clone https://github.com/MUCKSUCK-Oss/CREN.git
cd CREN
flutter pub get
flutter run
\`\`\`

Needs the Flutter SDK installed and a device or emulator connected.

## What's next

- Real Hack Club OAuth, so status pulls automatically instead of manual entry
- Maybe a backup/export option, since local-only storage means a lost phone means lost data
