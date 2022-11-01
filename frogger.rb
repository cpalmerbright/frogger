require 'ruby2d'

tilesize = 50
set width: tilesize * 9, height: tilesize * 9, background: 'navy'

Rectangle.new(width: tilesize * 9, height: tilesize, x: 0, y: tilesize * 6, color: 'gray')
taxis = []

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

tick = 0

update do
  taxis.each do |taxi|
    taxi.x = taxi.x + 2
  end
  if tick % 120 == 0
    taxis << Rectangle.new(width: tilesize * 2, height: tilesize, x: -tilesize * 2, y: tilesize * 6, color: 'yellow')
  end
  tick = tick + 1
end

show