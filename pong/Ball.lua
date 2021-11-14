Ball = Class{}

-- initial state of the ball on first creation
function Ball:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    -- track velocity of the ball
    self.dx = math.random(2) == 1 and -100 or 100
    self.dy = math.random(-50, 50)
end

-- set the initial position of the ball
function Ball:reset(v_width, v_height)
    self.x = v_width / 2 - 2
    self.y = v_height / 2 - 2
    self.dx = math.random(2) == 1 and -100 or 100
    self.dy = math.random(-50, 50)
end

-- apply velocity to position, scaled by deltaTime
function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Ball:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end