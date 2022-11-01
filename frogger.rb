require 'ruby2d'

tilesize = 50
set width: tilesize * 9, height: tilesize * 9, background: 'navy'

frog = Square.new(size: tilesize, x: tilesize * 4, y: tilesize * 8)
frog.color = 'olive'

show