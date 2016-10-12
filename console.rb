require_relative('./models/pet_store')

require('pry-byebug')

petcetera = PetStore.new({'name' => "Petcetera", 'address' => "Vancouver, B.C. Canada", 'type' => "house pets"})

petcetera.save()

binding.pry
nil