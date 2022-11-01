require 'ruby2d'

tilesize = 50
set width: tilesize * 9, height: tilesize * 9, background: 'navy'
gamestate = 'playing'

Rectangle.new(width: tilesize * 9, height: tilesize, x: 0, y: tilesize * 6, color: 'gray')
taxis = []

frog = Square.new(size: tilesize, x: tilesize * 4, y: tilesize * 8)
frog.color = 'olive'
message = nil

on :key_down do |event|
  if gamestate == 'playing'
    if event.key == 'left'
      frog.x = frog.x - tilesize
    elsif event.key == 'right'
      frog.x = frog.x + tilesize
    elsif event.key == 'up'
      frog.y = frog.y - tilesize
    elsif event.key == 'down'
      frog.y = frog.y + tilesize
    elsif event.key == 'backspace'
      frog.x = tilesize * 4
      frog.y = tilesize * 8
    end
  end
end

tick = 0

update do
  if gamestate == 'playing'
    taxis.each do |taxi|
      taxi.x = taxi.x + 2
      if (taxi.y == frog.y && frog.x < taxi.x + taxi.width && frog.x + frog.width > taxi.x)
        gamestate = 'lost'
      end
    end
    if tick % 120 == 0
      taxis << Rectangle.new(width: tilesize * 2, height: tilesize, x: -tilesize * 2, y: tilesize * 6, color: 'yellow')
    end
    if frog.y == 0
      gamestate = 'won'
    end
    tick = tick + 1
  elsif gamestate == 'won' && message.nil?
    message = Text.new('You won!', x: tilesize * 3, y: tilesize * 4, size: 40, color: 'purple')
  elsif gamestate == 'lost' && message.nil?
    message = Text.new('Splat!', x: tilesize * 3, y: tilesize * 4, size: 50, color: 'red')
  end
end

show