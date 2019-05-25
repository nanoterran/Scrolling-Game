describe("player", function()
  local Player = require 'player'

  it('should allow to get the players position', function()
    local player = Player({
      x_position = 5,
      y_position = 5
    })

    assert.equal(5, player.get_position().x)
    assert.equal(5, player.get_position().y)
  end)

  it('should allow to set the players position', function()
    local player = Player({
      x_position = 5,
      y_position = 5
    })

    player.set_position({
      x = 100,
      y = 50
    })

    assert.equal(100, player.get_position().x)
    assert.equal(50, player.get_position().y)
  end)

  it('should be able to move forward', function()
    local player = Player({
      x_position = 0,
      y_position = 0,
      acceleration = 250
    })

    player.move_forward(1)

    assert.equal(250, player.get_position().x)
  end)

  it('should be able to move back', function()
    local player = Player({
      x_position = 0,
      y_position = 0,
      acceleration = 250
    })

    player.move_back(1)

    assert.equal(-250, player.get_position().x)
  end)

  it('should be able to jump', function()
    local player = Player({
      x_position = 0,
      y_position = 0,
      acceleration = 250
    })
  end)
end)
