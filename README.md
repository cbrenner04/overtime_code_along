# Overtime app code along

<https://stackskills.com/courses/professional-rails-code-along/>

## Requirements

Company needs documentation that salaried employees did or did not get overtime
each week

## Models

- [x] Post --> date:date rationale:text
- [x] User --> Devise
- [x] AdminUser --> STI

## Features

- [ ] Approval workflow
- [ ] SMS Sending --> link to approval or overtime input
- [x] Administrate admin dashboard
- [x] Block non admin and guest users from admin dashboard
- [ ] Email summary to managers for approval
- [ ] Needs to be documented if employee did not log overtime

## UI

- [x] Bootstrap --> formatting
- [ ] Icons from Font Awesome
- [x] Update the styles for forms

## Refactor TODOs

- Refactor user association integration in features/posts_spec.rb
- Refactor posts/_form for admin user with status
