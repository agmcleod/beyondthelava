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


  attr_accessor :state_id, :maps, :player, :death_blocks

  def initialize(state_id)
    self.state_id = state_id
    player_sheet = Image.new "resources/player.png"
    self.player = Sprite.new :x => 100, :y => 0, :graphics => {
      :standing => player_sheet.getSubImage(0, 0, TILE_SIZE * 2, TILE_SIZE * 4),
      :attacking => player_sheet.getSubImage(TILE_SIZE * 2, 0, TILE_SIZE * 6, TILE_SIZE * 4)
    }, :immunity_level => 0

    @sprites = [self.player]

    self.death_blocks = [
      {
        :x => 0, :y => (TILE_Y - 1) * TILE_SIZE, :right_x => 800, :bottom_y => TILE_Y * TILE_SIZE
      }
    ]
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
    # minus 1 to render one tile space above bottom
    self.maps[0].render 0, (TILE_Y - 1) * TILE_SIZE
    self.player.draw
  end

  def update(gc, sbg, delta)
    @sprites.each do |sprite|
      death_blocks.each do |block|
        if sprite.intersects(block[:x], block[:y], block[:right_x], block[:bottom_y])
          if sprite.immunity_level != -1
            sprite.kill
          end
        else
          sprite.fall delta
        end
      end
    end

    unless player.alive
      gc.exit
    end
    
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

  def mouseClicked(button, x, y, count)
    puts "clicked"
  end

  def mouseMoved(arg0, arg1, arg2, arg3)
  end

  def mousePressed(button, x, y, count)
    puts "pressed"
    self.player.x = x
    self.player.y = y
  end

  def mouseReleased(arg0, arg1, arg2, arg3)
    puts "released"
  end

  def mouseWheelMoved(arg0)
  end
end