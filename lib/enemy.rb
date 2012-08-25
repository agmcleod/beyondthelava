require 'sprite.rb'
require 'game_info.rb'

class Enemy < Sprite
  include GameInfo
  def initialize(attributes)
    super attributes
    @range = rand(10) + (TILE_X - 10)
  end

  def movement
    
  end
end