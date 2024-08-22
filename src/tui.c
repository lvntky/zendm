#include "../include/tui.h"

void draw_sample() {
  initscr();            // Initialize the ncurses library
  cbreak();             // Disable line buffering
  noecho();             // Do not display typed characters
  keypad(stdscr, TRUE); // Enable special keys (e.g., arrows)
  int height = 10;
  int width = 20;
  int starty = 5;
  int startx = 5;

  // Create a new window
  WINDOW *win = newwin(height, width, starty, startx);

  // Draw a box around the window
  box(win, 0, 0); // 0, 0 draws the default box (ACS_VLINE and ACS_HLINE)

  // Refresh the window to show the box
  wrefresh(win);

  // Wait for user input before exiting
  getch();

  // Clean up
  delwin(win);
  endwin();
}