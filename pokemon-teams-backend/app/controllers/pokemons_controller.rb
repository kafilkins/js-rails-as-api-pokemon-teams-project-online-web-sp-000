class PokemonsController < ApplicationController

    def index 
        pokemons = Pokemon.all 
        render json: pokemons
    end

    def show 
        pokemon = Pokemon.find_by(id: params[:id])
        render json: pokemon
    end

    def create 
        trainer = Trainer.find(params[:trainer_id])
        pokemon = trainer.pokemons.build({
            nickname: Faker::Name.first_name,
            species: Faker::Games::Pokemon.name
        })
        byebug
        if pokemon.save 
            render json: pokemon 
        else
            render json: {message: pokemon.errors.messages[:team_limit]}
        end
    end

    def destroy 
        pokemon = Pokemon.find(params[:id]) 
        pokemon.destroy 
    end

end
