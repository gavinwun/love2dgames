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

function Ball:collides(paddle)
    -- AABB Collision Detection
    -- check if left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    -- check if bottom edge of either is higher than the top
    -- edge of the other
    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end

    -- collision detected
    return true
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