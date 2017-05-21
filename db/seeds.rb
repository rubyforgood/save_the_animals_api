# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.find_or_create_by(
  email: "test@test.com"
)
user.update(
  password: "password",
  password_confirmation: "password"
)

e = Ethogram.find_or_create_by(
  name: "Observations May 2017"
)

e.ethogram_structures << EthogramStructure.new(
  structure: {
    "subjects": [
      "Betsy",
      "Carl",
      "Lulu",
      "Miles",
      "Minerva",
      "Momo",
    ],
    "behaviors": [
      {
        "name": "battling",
        "hasTarget": true,
        "modifiers": [
          "badly",
          "boldly",
          "brilliantly",
        ]
      },
      {
        "name": "collecting",
        "hasTarget": true,
        "modifiers": [
          "calmly",
          "cautiously",
          "curiously"
        ]
      },
      {
        "name": "eating",
        "hasTarget": true,
        "modifiers": [ ]
      },
      {
        "name": "fighting",
        "hasTarget": true,
        "modifiers": [ ]
      },
      {
        "name": "walking",
        "hasTarget": false,
        "modifiers": [
          "quickly",
          "slowly"
        ]
      },
    ]
  }
)

os1 = ObservationSession.new(
  user: user,
)
os1.observations << Observation.new(
  details: {
    subject: "Carl",
    modifier: "calmly",
    behavior: "collecting",
    target: "cephalopods",
    timestamp: Time.current,
  }
)
os1.observations << Observation.new(
  details: {
    subject: "Betsy",
    modifier: "boldly",
    behavior: "battling",
    target: "beetles",
    timestamp: Time.current,
  }
)
os1.save
