// -*- coding: utf-8, tab-width: 2 -*-

// Make RTLD_NEXT work:
#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#include <dlfcn.h>    // import dlsym:
#include <cstdio>     // import printf

typedef int (*MainFunc)(int argc, char** argv);

int main(int argc, char** argv) {
  printf("%u args:", argc);
  for (int i = 0; i < argc; i += 1) {
    printf(" '%s'", argv[i]);
  }
  printf("\n");
  MainFunc main_fptr = (MainFunc)dlsym(RTLD_NEXT,
    "main");
  return (*main_fptr)(argc, argv);
}
