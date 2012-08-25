java_import org.lwjgl.input.Keyboard
java_import org.lwjgl.opengl.Display
java_import org.lwjgl.opengl.GL11
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.state.GameState
java_import org.newdawn.slick.state.StateBasedGame
java_import org.newdawn.slick.tiled.TiledMap

class GamePlayState 
  include GameState
  include GameInfo


  attr_accessor :state_id, :maps, :player

  def initialize(state_id)
    self.state_id = state_id
    player_sheet = Image.new "resources/playersheet.png"
    self.player = Sprite.new :x => 100, :y => 0, :graphics => {
      :standing => player_sheet.getSubImage 0, 0, TILE_SIZE * 4, TILE_SIZE * 4,
      :attacking => player_sheet.getSubImage TILE_SIZE * 4, 0, TILE_SIZE * 8, TILE_SIZE * 4
    }
  end

  def getID
    @state_id
  end

  def enter(gc, sbg)
  end

  def init(gc, sbg)
    self.maps = [
      TiledMap.new "resources/lava.tmx", "resources"
    ]
  end

  def render(gc, sbg, g)
    self.maps[0].render 0, (TILE_Y - 1) * TILE_SIZE
  end

  def update(gc, sbg, delta)

  end

  def isAcceptingInput
    false
  end

  def leave(gc, sbg)
    
  end

  def inputEnded
    
  end

  def setInput(arg)
    
  end

  def keyPressed(keyval, keyChar)
    
  end

  def keyReleased(keyval, keyChar)
    
  end


  def controllerButtonPressed(arg0, arg1)
  end

  def controllerButtonReleased(arg0, arg1)
  end

  def controllerDownPressed(arg0)
  end

  def controllerDownReleased(arg0)
  end

  def controllerLeftPressed(arg0)
  end

  def controllerLeftReleased(arg0)
  end

  def controllerRightPressed(arg0)
  end

  def controllerRightReleased(arg0)
  end

  def controllerUpPressed(arg0)
  end

  def controllerUpReleased(arg0)
  end

  def mouseClicked(arg0, arg1, arg2, arg3)
  end

  def mouseMoved(arg0, arg1, arg2, arg3)
  end

  def mousePressed(arg0, arg1, arg2, arg3)
  end

  def mouseReleased(arg0, arg1, arg2, arg3)
  end

  def mouseWheelMoved(arg0)
  end
end