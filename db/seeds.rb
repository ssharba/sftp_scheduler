# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
client_hashes = [
  {
    name: 'ALI',
    client_files_attributes: [
      {
        file_format: 'DHP_GrpYYYYMMDDXXXXXX',
        regex: 'DHP_Grp'
      },
      {
        file_format: 'DHP_Medical_ClaimsYYYYMMDDXXXXXX',
        regex: 'DHP_Medical_Claims'
      }
    ]
  },
  {
    name: 'MOE',
    client_files_attributes: [
      {
        file_format: 'DCClaimsRecovery.MMDDYYYY',
        regex: 'DCClaimsRecovery'
      },
      {
        file_format: 'LACClaimsRecovery.MMDDYYYY',
        regex: 'LACClaimsRecovery'
      }
    ]
  }
]
Client.delete_all
ClientFile.delete_all

client_hashes.each do |hash|
  Client.create! hash
end
p "Created #{ClientFile.count} files"
