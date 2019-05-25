local Player = require 'src.player'

function love.load()
  player = Player({
    x_position = 100,
    y_position = 50,
    image = love.graphics.newImage('assets/character.png'),
    acceleration = 250
  })
end

function love.update(dt)
  if love.keyboard.isDown('right') then
    player.move_forward(dt)
  elseif love.keyboard.isDown('left') then
    player.move_back(dt)
  elseif love.keyboard.isDown('up') then
    y = y - 250 * dt
  elseif love.keyboard.isDown('down') then
    y = y + 250 * dt
  end
end

function love.draw()
  local x = player.get_position().x
  local y = player.get_position().y

  love.graphics.draw(player.get_image(), x, y)

end
