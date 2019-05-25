return function(config)
  local position = {
    x = config.y_position,
    y = config.x_position
  }
  local acceleration = config.acceleration
  local image = config.image

  local function get_position()
    return position
  end

  local function set_position(new_position)
    position = new_position
  end

  local function move_forward(dt)
    position.x = position.x + acceleration * dt
  end

  local function move_back(dt)
    position.x = position.x - acceleration * dt
  end

  local function get_image()
    return image
  end

  return {
    get_position = get_position,
    set_position = set_position,
    move_forward = move_forward,
    move_back = move_back,
    get_image = get_image
  }
end
