# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
client_hashes = [
  { name: "ALI" }, { name: "MOE" }
]

client_file_hashes = [
  { file_format: "GrpYYYYMMDDXXXXXX", regex: "DHP_Grp" },
  { file_format: "DHP_Medical_ClaimsYYYYMMDDXXXXXX", regex: "DHP_Medical_Claims" },
  { file_format: "DCClaimsRecovery.MMDDYYYY", regex: "DCClaimsRecovery" },
  { file_format: "LACClaimsRecovery.MMDDYYYY", regex: "LACClaimsRecovery" }
]

clients = client_hashes.map do |client|
  Client.create(client)
end

client_file_hashes.each_with_index do |file, index|
  if index <= 1
    ClientFile.create(file.merge(client: clients[0]))
  else
    ClientFile.create(file.merge(client: clients[1]))
  end
end
p "Created #{ClientFile.count} files"
