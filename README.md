DerelictCairo
=============

Dynamic bindings to Cairo[^1] and its satellite libraries for the D Programming Language.

```D
import derelict.cairo.cairo;

void main() {
    // Load the Cairo library.
    DerelictCairo.load();
    
    // Now Cairo functions can be called.
    ...
}
```

[1]: http://cairographics.org/
