return function(config)
  local position = {
    x = config.y_position,
    y = config.x_position
  }
  local velocity = {
    x = config.x_velocity,
    y = config.y_velocity
  }
  local acceleration = config.acceleration
  local image = config.image
  gravity = config.gravity

  local function get_position()
    return position
  end

  local function set_position(new_position)
    position = new_position
  end

  local function move_forward(dt)
    velocity.x = velocity.x + acceleration * dt
  end

  local function move_back(dt)
    velocity.x = velocity.x - acceleration * dt
  end

  local function get_image()
    return image
  end

  local function get_velocity()
    return velocity
  end

  local function set_velocity(new_velocity)
    velocity.x = new_velocity.x
    velocity.y = new_velocity.y
  end

  return {
    get_position = get_position,
    set_position = set_position,
    move_forward = move_forward,
    move_back = move_back,
    get_image = get_image,
    get_velocity = get_velocity,
    set_velocity = set_velocity,
    gravity = gravity
  }
end
