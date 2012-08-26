java_import org.newdawn.slick.AngelCodeFont
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

class BeginGameState 
  include GameState

  def initialize(state_id)
    
  end

  def getID
    @state_id
  end

  def enter(gc, sbg)
  end

  def init(gc, sbg)
    
  end

  def render(gc, sbg, g)
        
  end

  def update(gc, sbg, delta)    
    input = gc.getInput
    if input.keyPressed(Input::KEY_ENTER)
      sbg.enterState 2
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