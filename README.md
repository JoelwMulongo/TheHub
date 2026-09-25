# TheHub (VolunteerHub)

A Ruby on Rails app for managing volunteer events.

## Features

- Session-based user authentication (`has_secure_password` / bcrypt)
- Event creation and signup
- File uploads for event resources (PDF, images, CSVs) via Active Storage
- Organizer and volunteer views
- GitHub Actions CI (RSpec + RuboCop)

## Requirements

- Ruby 3.1.x (see `.ruby-version`)
- PostgreSQL running locally (or update `config/database.yml` to use `sqlite3` instead — swap the `pg` gem for `sqlite3` in the Gemfile if you do)

## Setup

```bash
bundle install
bin/rails db:create db:migrate
bin/rails db:seed   # optional demo data: organizer@example.com / password123
bin/rails server
```

Then visit http://localhost:3000.

## Running tests

```bash
bundle exec rspec
bundle exec rubocop
```

## Notes on this scaffold

This app doesn't use Rails credentials (`config/credentials.yml.enc`). In
development and test, Rails auto-generates a local secret key
(`tmp/development_secret.txt`), so nothing to configure. **In production**,
set the `SECRET_KEY_BASE` environment variable yourself (e.g.
`bin/rails secret` to generate one), since Rails will refuse to boot in
production without it.

The original Gemfile listed `devise` but the app doesn't actually use it —
authentication is hand-rolled in `SessionsController` with `has_secure_password`.
It's been removed to keep the dependency list honest; add it back (and wire
up its generators/config) if you'd rather switch to Devise later.
