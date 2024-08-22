#include "../include/tui.h"
#include <stdio.h>

static WINDOW *main;

int main(void) {
  // draw_sample();
  initscr(); // Initialize the ncurses library
  cbreak();  // Disable line buffering
  noecho();

  int screen_width, screen_height;
  set_screen_dimension(stdscr, &screen_height, &screen_width);

  // printf("x: %d y: %d\n", screen_width, screen_height);
  return 0;
}
