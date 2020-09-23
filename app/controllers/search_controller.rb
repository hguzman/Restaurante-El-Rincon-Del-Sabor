class SearchController < ApplicationController
def results
    @categories = Category.buscador(params[:termino])
    @dishes = Dish.buscador(params[:termino])
end
end
