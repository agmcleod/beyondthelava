java_import org.newdawn.slick.UnicodeFont
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
java_import org.newdawn.slick.Color
java_import org.newdawn.slick.font.effects.ColorEffect
java_import java.awt.Font

class BeginGameState 
  include GameState

  def initialize(state_id)
    arial = Font.new "Arial", Font::PLAIN, 24
    @font = UnicodeFont.new arial
    @font.addAsciiGlyphs
    @font.addGlyphs 400, 600
    @font.getEffects.add ColorEffect.new(java.awt.Color::BLUE)
    @font.loadGlyphs
  end

  def getID
    @state_id
  end

  def enter(gc, sbg)
  end

  def init(gc, sbg)
    
  end

  def render(gc, sbg, g)
    @font.drawString 30, 100, "The idea is to not touch the lava"
    @font.drawString 30, 130, "Just click to teleport and click to kill"
    @font.drawString 30, 160, "The more you kill the stronger you are against the lava"
    @font.drawString 30, 210, "Press enter to continue"
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