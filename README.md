DerelictCairo
=============

Dynamic bindings to [Cairo][1] and its satellite libraries for the D Programming Language.

For information on how to build cairo.dll for windows, please see the [repository][2].

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
[2]: https://github.com/ousttrue/cairo-ft

