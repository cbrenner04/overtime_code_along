# Overtime app code along

<https://stackskills.com/courses/professional-rails-code-along/>

## Requirements

Company needs documentation that salaried employees did or did not get overtime
each week

## Models

- [x] Post --> date:date rationale:text
- [x] User --> Devise
- [x] AdminUser --> STI
- [x] AuditLog

## Features

- [x] Approval workflow
- [x] SMS Sending --> link to approval or overtime input
- [x] Administrate admin dashboard
- [x] Block non admin and guest users from admin dashboard
- [x] Email summary to managers for approval
- [x] Needs to be documented if employee did not log overtime
- [x] Create audit log for each text message
- [ ] Update end_date when confirmed
- [ ] Update audit log status when overtime rejected
- [ ] Update buttons on employee homepage
- [ ] Update buttons to include time span
- [ ] Update button sort order on employee homepage
- [ ] Remove unnecessary navbar buttons for managers
- [ ] Implement honeybadger for error reporting
- [ ] Implement new relic to keep site alive

## TODOs
