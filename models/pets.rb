require ('pg')
require_relative('../db/sql_runner')
# require('pry-byebug')

class Pet

    attr_accessor :id, :name, :type, :pet_store_id

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
        @type = options['type']
        @pet_store_id = options['pet_store_id'].to_i
    end

    def save
        sql = "INSERT INTO pets (name, type, pet_store_id) VALUES ('#{@name}', '#{@type}', '#{@pet_store_id}') RETURNING *"
        pet = SqlRunner.run(sql).first
        @id = pet['id']
    end
    
    def pet_store
        sql= "SELECT * FROM pet_stores WHERE id = #{@pet_store_id}"
        pet_store = SqlRunner.run(sql).first
        return PetStore.new( pet_store ) 
    end

    def update
        sql ="UPDATE pets SET
            name = '#{@name}', 
            type = '#{@type}',
            pet_store_id = #{@pet_store_id} 
        WHERE id = #{@id}"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM pets where id = #{@id}"
        SqlRunner.run(sql)
    end

    def self.all
        sql = "SELECT * FROM pets"
        all_pets = SqlRunner.run(sql).map {|pet| Pet.new(pet)}
        return all_pets
    end

    def self.find_pet_by_id(pet_id)
        Pet.all.find {|pet| pet.id == pet_id}
    end

    # binding.pry
end
# Pet.all

