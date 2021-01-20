// -*- coding: utf-8, tab-width: 2 -*-

#include <cstdio>     // import printf
#include <cstring>    // import strlen

int hello(int argc, char** argv) { return 23; }

typedef unsigned long int uli;

int main(int argc, char** argv) {
  printf("fopen:  %lu\n", (uli)fopen("package.json", "r"));
  const char* moo = "moo";
  printf("strlen: %lu\n", (uli)strlen(moo));
  printf("hello:  %d\n", hello(argc, argv));
  return 0;
}
