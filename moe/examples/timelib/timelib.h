#include <time.h>

static inline int cpspc_time(void) {
  return clock() * 1000 / CLOCKS_PER_SEC;
}
