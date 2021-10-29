# Makefile Project Template

## Overview
A starter template for a Makefile project supporting multiple binary outputs in a UNIX environment.

### Directory Structure

```
.
├── Makefile
├── Common
│   ├── Makefile
│   ├── inc
│   │   └── shared.h
│   ├── obj
│   │   └── shared.o
│   └── src
│       └── shared.c
├── FirstProject
│   ├── Makefile
│   ├── bin
│   │   └── first-application
│   ├── inc
│   │   └── header.h
│   ├── obj
│   │   └── main.o
│   └── src
│       └── main.c
└── SecondProject
    ├── Makefile
    ├── bin
    │   └── second-application
    ├── inc
    │   └── header.h
    ├── obj
    │   └── main.o
    └── src
        └── main.c
```

Each sub-project outputs a seperate application binary, and can be built individually using its respective Makefile or altogether using the top-level Makefile. The structure includes a "Common" sub-project for header and source files that are shared through the entire project.

## License
Licensed under [MIT](LICENSE).
