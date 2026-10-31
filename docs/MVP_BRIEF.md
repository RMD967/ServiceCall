# ServiceCall Pro — MVP brief

Idea from Damian (2026-10-30): “like UberEats, but for service pros” — a marketplace where customers find and book trusted blue-collar pros: plumbers, masonry, landscaping, electricians, HVAC, painters, handymen, cleaners, pest control, appliance repair, roofers, carpenters and similar local services.

Priority note: Damian said ServiceCall Pro can go first. Artekha/GHL is parked for later.

## Product shape
Two-sided marketplace:
- **Customers** search by service + location, compare pros by rating, price signal, distance and availability, request/book a job, chat, pay, track status, and leave a review.
- **Pros** create a business profile, choose trades/service areas, set availability, receive job requests, accept/decline, quote, mark en route/arrived/completed, get paid, and build reviews.
- **Admin** verifies pros, moderates disputes/reviews, manages categories, sees bookings, payments, commissions and growth by city/category.

## MVP scope (first version that can actually launch)
1. Landing + search by category and city/ZIP, with location permission optional.
2. Category grid: Plumbing, Electrical, Masonry, Landscaping/Garden, HVAC, Painting, Handyman, Cleaning, Carpentry, Roofing, Pest Control, Appliance Repair.
3. Pro profiles: photo/logo, trades, service radius, about, photos of work, starting price / quote-only flag, rating, review count, jobs completed, response time, badges (verified, background-check pending/approved if applicable), availability calendar.
4. Booking/request flow: choose category → describe problem → photos → address → preferred time window → instant book if pro offers it or request quotes → customer confirms.
5. Matching/dispatch: show request to matching pros by category + radius + availability; first-accept wins for urgent jobs, or customer chooses among quotes for planned jobs.
6. Job statuses: Requested → Accepted → On the way → Arrived → In progress → Completed → Paid → Reviewed; cancellation states included.
7. In-app chat between customer and pro with job context; push/email/SMS notifications for status changes.
8. Payments: card payment/hold at booking, release/charge on completion, platform commission, pro payout schedule; Stripe is the default choice if launching US-first; Mexico-first needs a decision on Stripe MX vs Mercado Pago/Conekta and cash option.
9. Ratings/reviews after completed jobs only; pros can respond.
10. Pro onboarding: account, trade categories, service area map/radius, ID/contact verification, pricing mode (fixed services, hourly, quote-only), availability, payout setup.
11. Admin dashboard: users, pros, verification queue, jobs, disputes, refunds, categories, cities, commission settings.
12. Trust & safety basics: verified phone/email, pro profile verification, clear cancellation policy, dispute/report flow, no off-platform payment encouragement in chat warnings.

## Not in MVP
Native iOS/Android apps (start responsive web/PWA), live GPS tracking of pros, complex dynamic pricing, subscriptions for customers, franchise/city manager portals, insurance claims handling, multi-country launch.

## Recommended build route
Same stack as Artekha plan: Ruby on Rails 8 monolith + PostgreSQL/PostGIS, Hotwire, Tailwind, Stripe (or local payment provider after market decision), background jobs, email/SMS/push notifications, S3 storage, admin dashboard. Marketplace logic is very Rails-friendly: users/roles, pro profiles, service categories, jobs/requests, quotes, messages, payments, reviews, admin.

## Decisions needed before coding
1. **Launch market first:** Puebla/Cholula + Mexico (Spanish-first, MXN) or US-first (English, USD, Stripe/background checks)? Recommendation: Puebla/Cholula first to recruit pros through Tonakayo's local network and prove the loop small.
2. **Repo name:** `servicecall-pro` recommended.
3. **Booking model for MVP:** recommendation: hybrid — urgent categories use first-accept dispatch; planned projects use request-a-quote and customer picks.
4. **Commission:** placeholder 10–15% for planning; final number needs Damian's call.

## First GitHub build steps once market/repo are confirmed
1. Damian creates empty private repo `servicecall-pro` (GitHub App cannot create repos; same limitation as Artekha/ai-bot-hub).
2. Scaffold Rails app: auth + roles (customer/pro/admin), categories, pro profiles, search.
3. Jobs/requests + quotes + status flow.
4. Chat + notifications.
5. Payments + reviews + admin.
6. Seed demo city with categories and sample pros/jobs; tests for booking, matching, payment webhook, and review gating.
