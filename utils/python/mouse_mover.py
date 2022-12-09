# Move mouse if not active
# author: tiberlas1997
# run script: python3 mouse_mover.py

import mouse  #  https://github.com/boppreh/mouse
import schedule  # https://github.com/dbader/schedule
import time
import math


def mouse_draw_pentagram (alpha, radius, speed):
  '''
    Mouse cursor draws pentagram 
  '''
  for n in [0, 3, 1, 4, 2]:
    x = radius*math.cos(math.radians(alpha+n*72))
    y = radius*math.sin(math.radians(alpha+n*72))
    mouse.move(x, y, False, speed / 5)


def mouse_draw_rhomb (length, speed):
  '''
    Mouse cursor makes a rhomb around the current position 
  '''
  mouse.move(length, length, False, speed / 4)
  mouse.move(length, -length, False, speed / 4)
  mouse.move(-length, -length, False, speed / 4)
  mouse.move(-length, length, False, speed / 4)


last_known_position = (0, 0)


def check_sleeping_mouse ():
  '''
    Asserts current mouse position with last mouse position.
    If mouse didn't move move it.
  '''
  global last_known_position
  # print("mouse: ", last_known_position)
  current_position = mouse.get_position()

  if last_known_position == current_position:
    # mouse_draw_rhomb(20, 1)
    mouse_draw_pentagram(0, 120, 0.8)

  last_known_position = current_position

schedule.every(2).minutes.do(check_sleeping_mouse)

while 1:
    schedule.run_pending()
    time.sleep(1)
