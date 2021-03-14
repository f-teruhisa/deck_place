10.times do |i|
  User.seed(
    { id: i, app_name: "user#{i}", email: "test#{i}@example.com", provider: "google_oauth2", uid: i, app_id: i }
  )
end
