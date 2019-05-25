local Player = require 'src.player'
local bump = require 'libs.bump.bump'

function love.load()
  player = Player({
    x_position = 100,
    y_position = 50,
    image = love.graphics.newImage('assets/character.png'),
    x_velocity = 0,
    y_velocity = 0,
    acceleration = 100,
    gravity = 80
  })

  world = bump.newWorld(32)

  level_0 = {}

  world:add(
    player,
    player.get_position().x,
    player.get_position().y,
    player.get_image():getWidth(),
    player.get_image():getHeight()
  )
  world:add(level_0, 0, 448, 840, 32)
end

function love.update(dt)
  local player_x = player.get_position().x + player.get_velocity().x
  local player_y = player.get_position().y + player.get_velocity().y

  player.set_velocity({
    x = player.get_velocity().x * (1 - math.min(dt * 20, 1)),
    y = player.get_velocity().y * (1 - math.min(dt * 20, 1))
  })

  player.set_velocity({
    x = player.get_velocity().x,
    y = player.get_velocity().y + player.gravity * dt
  })

  if love.keyboard.isDown('right') then
    player.move_forward(dt)
  elseif love.keyboard.isDown('left') then
    player.move_back(dt)
  elseif love.keyboard.isDown('up') then
    y = y - 250 * dt
  elseif love.keyboard.isDown('down') then
    y = y + 250 * dt
  end

  player_x, player_y, collisions = world:move(player, player_x, player_y)

  player.set_position({
    x = player_x,
    y = player_y
  })
end

function love.draw()
  local x = player.get_position().x
  local y = player.get_position().y

  love.graphics.draw(player.get_image(), x, y)
  love.graphics.rectangle('fill', world:getRect(level_0))
end
