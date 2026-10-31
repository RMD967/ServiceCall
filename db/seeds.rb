# ServiceCall Pro — seed data (idempotent, safe to run more than once)
# Demo market: Puebla / Cholula, México. All demo passwords are "password".

puts "Seeding ServiceCall Pro..."

categories = [
  "Plomería", "Albañilería", "Jardinería", "Electricidad",
  "HVAC", "Pintura", "Handyman", "Limpieza"
]
categories.each do |name|
  ServiceCategory.find_or_create_by!(name: name)
end

customer = User.find_or_create_by!(email: "cliente@demo.mx") do |u|
  u.password = "password"
end

pros = [
  { email: "mario.plomero@demo.mx", category: "Plomería", city: "Puebla",
    area: "Puebla Centro", years: 8, verified: true,
    bio: "Plomero con 8 años de experiencia en fugas, boilers e instalaciones completas.",
    listing: "Reparación de fugas y plomería general", price: 450 },
  { email: "roca.construccion@demo.mx", category: "Albañilería", city: "Cholula",
    area: "San Pedro Cholula", years: 12, verified: true,
    bio: "Equipo de albañilería para remodelaciones, muros, losas y acabados.",
    listing: "Albañilería y remodelación por proyecto", price: nil },
  { email: "verdevivo@demo.mx", category: "Jardinería", city: "Puebla",
    area: "Angelópolis", years: 5, verified: false,
    bio: "Mantenimiento de jardines, poda y diseño de áreas verdes.",
    listing: "Mantenimiento mensual de jardín", price: 600 }
]

pros.each do |data|
  user = User.find_or_create_by!(email: data[:email]) do |u|
    u.password = "password"
  end

  professional = Professional.find_or_create_by!(user: user) do |p|
    p.bio = data[:bio]
    p.city = data[:city]
    p.service_area = data[:area]
    p.years_experience = data[:years]
    p.verified = data[:verified]
  end

  category = ServiceCategory.find_by!(name: data[:category])

  ServiceListing.find_or_create_by!(
    professional: professional,
    service_category: category,
    title: data[:listing]
  ) do |listing|
    listing.price = data[:price]
    listing.price_unit = data[:price] ? "fixed" : "quote"
    listing.active = true
  end
end

puts "Seed complete: #{ServiceCategory.count} categories, " \
     "#{User.count} users, #{Professional.count} professionals, " \
     "#{ServiceListing.count} listings. Demo customer: #{customer.email}"
