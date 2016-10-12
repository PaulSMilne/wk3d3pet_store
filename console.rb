require_relative('./models/pet_store')
require_relative('./models/pets')

require('pry-byebug')

petcetera = PetStore.new({'name' => "Petcetera", 'address' => "Vancouver, B.C. Canada", 'type' => "house pets"})

petcetera.save()

pet1 = Pet.new({'name' => "Minnie", 'type' => "cat", 'pet_store_id' => petcetera.id})

pet1.save()

binding.pry
nil