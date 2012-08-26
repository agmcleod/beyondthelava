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
    @paused = false
    @counter = 0
    self.state_id = state_id

    # initialize player stuff
    player_sheet = Image.new "resources/player.png"
    self.player = Sprite.new :x => 100, :y => 0, :graphics => {
      :standing => player_sheet.getSubImage(0, 0, TILE_SIZE * 2, TILE_SIZE * 4),
      :attacking => player_sheet.getSubImage(TILE_SIZE * 2, 0, TILE_SIZE * 6, TILE_SIZE * 4)
    }, :immunity_level => 0

    @sprites = [self.player]

    # initialize death areas
    self.death_blocks = [
      {
        :x => 0, :y => (TILE_Y - 1) * TILE_SIZE, :right_x => 800, :bottom_y => TILE_Y * TILE_SIZE
      }
    ]

    # initialize enemy stuff
    enemy_sheet = Image.new "resources/enemy.png"
    @sprites << Enemy.new(:x => 600, :y => 300, :graphics => {
      :standing_left => enemy_sheet.getSubImage(0, 0, TILE_SIZE * 2, TILE_SIZE * 3),
      :moving_left => enemy_sheet.getSubImage(TILE_SIZE * 2, 0, TILE_SIZE * 4, TILE_SIZE * 3),
      :moving_right => enemy_sheet.getSubImage(TILE_SIZE * 4, 0, TILE_SIZE * 6, TILE_SIZE * 3),
      :standing_right => enemy_sheet.getSubImage(TILE_SIZE * 6, 0, TILE_SIZE * 8, TILE_SIZE * 3),
      :dead_left => enemy_sheet.getSubImage(TILE_SIZE * 8, 0, TILE_SIZE * 10, TILE_SIZE * 3),
      :dead_right => enemy_sheet.getSubImage(TILE_SIZE * 10, 0, TILE_SIZE * 12, TILE_SIZE * 3)
    }, :state => :standing_left)
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
    @sprites.each do |sprite|
      sprite.draw
    end
    
  end

  def update(gc, sbg, delta)
    input = gc.getInput
    @counter += delta

    if !@paused
      if input.isMousePressed(0)
        teleport_action input
      end

      @sprites.each do |sprite|
        colliding = false
        death_blocks.each do |block|
          if sprite.intersects(block[:x], block[:y], block[:right_x], block[:bottom_y])
            sprite.y = block[:y] - sprite.height
            colliding = true
          end
        end

        if colliding
          if sprite.immunity_level == 0
            sprite.kill
          end
          if @counter >= 1000 && sprite.immunity_level > 0
            sprite.immunity_level -= 1
          end
        else
          if @counter >= 1000 && sprite.immunity_level > 0
            sprite.increase_immunity
          end
          sprite.fall delta
        end

      end

      if @counter > 300
        player.teleporting = false
      end

      if @counter > 1000
        @counter -= 1000
      end
    end

    if input.isKeyPressed(Input::KEY_SPACE)
      @paused = !@paused
    end

    if !player.alive || input.isKeyPressed(Input::KEY_ESCAPE)
      gc.exit
    end
    
  end

  def teleport_action(input)
    player.x = input.getMouseX - (player.width / 2)
    player.y = input.getMouseY - (player.height / 2)
    player.teleporting = true

    @sprites.each do |sprite|
      if sprite.is_a? Enemy
        if player.intersects sprite.x, sprite.y, sprite.right_x, sprite.bottom_y
          sprite.kill
          player.max_immunity += 3
          player.y = 150
        end
      end
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
    
  end

  def mouseMoved(arg0, arg1, arg2, arg3)
  end

  def mousePressed(button, x, y, count)
  end

  def mouseReleased(arg0, arg1, arg2, arg3)
  end

  def mouseWheelMoved(arg0)
  end
end