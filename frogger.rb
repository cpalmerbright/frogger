require 'ruby2d'

tilesize = 50
set width: tilesize * 9, height: tilesize * 9, background: 'navy'

frog = Square.new(size: tilesize, x: tilesize * 4, y: tilesize * 8)
frog.color = 'olive'

on :key_down do |event|
  puts event.key
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

show