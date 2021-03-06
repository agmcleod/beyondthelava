$:.push File.expand_path('../../vendor/slick', __FILE__)
$:.push File.expand_path('../../lib', __FILE__)

require 'java'
require 'lwjgl.jar'
require 'slick.jar'

Dir[File.expand_path('../../lib/*.rb', __FILE__)].each do |fn|
  require fn
end

java_import org.newdawn.slick.AppGameContainer
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.state.StateBasedGame

class BeyondTheLava < StateBasedGame
  def initialize
    super "LD48 - Slick - BeyondTheLava"
  end

  def initStatesList(gc)
    addState BeginGameState.new(1)
    addState GamePlayState.new(2)
  end
end

app = AppGameContainer.new(BeyondTheLava.new)
app.setDisplayMode 800, 640, false
app.setVSync true
app.start()