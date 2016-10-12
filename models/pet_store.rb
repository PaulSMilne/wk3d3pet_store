require_relative('../db/sql_runner')

class PetStore

    attr_reader :id, :name, :address, :type

    def initialize (options)
        @id     = options['id'].to_i
        @name   = options['name']
        @address= options['address']
        @type   = options['type']
    end

    def save
        sql = "INSERT INTO pet_stores (name, address, type) VALUES ('#{@name}', '#{@address}', '#{@type}') RETURNING *"
        pet_store = SqlRunner.run(sql).first
        @id = pet_store['id']
    end


end