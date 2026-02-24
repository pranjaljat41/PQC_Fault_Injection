#include "api.h"
#include "hal.h"
#include <string.h>
#include <stdio.h>

static void print_cnt(int cnt) {
    char out[32];
    sprintf(out, "%d\n", cnt);
    hal_send_str(out);
}

int main(void)
{
  hal_setup(CLOCK_FAST);
  
  hal_send_str("INIT\n");

  while(1) {
      hal_send_str("WAIT\n");
      
      volatile int cnt = 0;
      hal_trigger_toggle(); 
      
      // Short loop to verify trigger and glitch
      // If glitch works, cnt will be != 10
      for(int i=0; i<10; i++) {
          cnt++; 
      }
      
      print_cnt(cnt); // Expected: 10
  }

  return 0;
}
