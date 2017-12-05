# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ClientFile.destroy_all

ClientFile.create!([{
  file_format: "ali_lol_12052017.txt",
  regex: "DHP_Grp",
  client_id: 1
},
{
  file_format: "ali_lxl_12052017.txt",
  regex: "DHP_Grp",
  client_id: 1
},
{
  file_format: "moe_lol_12052017.txt",
  regex: "DHP_Grp",
  client_id: 2
},
{
  file_format: "moe_lxl_12052017.txt",
  regex: "DHP_Grp",
  client_id: 2
}])

p "Created #{ClientFile.count} files"
