#ifndef __TUI_H__
#define __TUI_H__
#include <ncurses.h>

void draw_sample();
void set_screen_dimension(WINDOW *stdscr, int *y, int *x);

#endif //__TUI_H__