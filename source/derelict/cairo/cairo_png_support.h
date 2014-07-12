//http://cairographics.org/manual/cairo-PNG-Support.html;
#define             CAIRO_HAS_PNG_FUNCTIONS
//;
cairo_surface_t *   cairo_image_surface_create_from_png (const char *filename);
cairo_surface_t *   cairo_image_surface_create_from_png_stream
                                                        (cairo_read_func_t read_func,
                                                         void *closure);
cairo_status_t      cairo_surface_write_to_png          (cairo_surface_t *surface,
                                                         const char *filename);
cairo_status_t      cairo_surface_write_to_png_stream   (cairo_surface_t *surface,
                                                         cairo_write_func_t write_func,
                                                         void *closure);
