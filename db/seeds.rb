# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hashes = [
  { file_format: "ali_lol_12052017.txt", regex: "DHP_Grp", client_id: 1 },
  { file_format: "ali_lkl_12052017.txt", regex: "DHP_Grp", client_id: 1 },
  { file_format: "ali_ldl_12052017.txt", regex: "DHP_Grp", client_id: 2  },
  { file_format: "ali_lhl_12052017.txt", regex: "DHP_Grp", client_id: 2  }
]

hashes.each do |hash|
  ClientFile.find_or_create_by(hash)
end
p "Created #{ClientFile.count} files"
