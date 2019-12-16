require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "models/magical_creature.rb"

set :bind, '0.0.0.0'  # bind to all interfaces

# The MAGICAL_CREATURES variable is an array of hashes, and can be accessed from an of your routes.
MAGICAL_CREATURES = [
  {
    name: "unicorn",
    ability: "Its horn is said to have the power to render poisoned water potable and heal sickness.",
    age: 140
  },
  {
    name: "dragon",
    ability: "Breathes fire and has a hide of scales that is near impenetrable.",
    age: 587
  },
  {
    name: "phoenix",
    ability: "When it is old and weary, its body ignites in flame and it arises anew from the ashes of its predecessor.",
    age: nil
  }
]

# You may define your routes here. Start with the root path, and designate an appropriately named erb template!

# Example:
# get "/wizards" do
#   erb :wizards
# end
get "/" do
  erb :home
end

get "/creatures" do
  @creatures = MAGICAL_CREATURES
  @creatures_array = []
  @creatures.each do |creature|
    @creatures_array << MagicalCreature.new(creature[:name], creature[:ability], creature[:age])
  end
  erb :creatures
end

get "/creatures/:creatures_name" do
  @creatures = MAGICAL_CREATURES.find{|creature| creature[:name] == params[:creatures_name]}
  @new_creature = MagicalCreature.new(@creatures[:name], @creatures[:ability], @creatures[:age])
  erb :show
end
