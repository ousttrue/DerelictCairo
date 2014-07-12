// http://cairographics.org/manual/cairo-Image-Surfaces.html;
#define             CAIRO_HAS_IMAGE_SURFACE
//;
enum                cairo_format_t;
int                 cairo_format_stride_for_width       (cairo_format_t format,
                                                         int width);
cairo_surface_t *   cairo_image_surface_create          (cairo_format_t format,
                                                         int width,
                                                         int height);
cairo_surface_t *   cairo_image_surface_create_for_data (ubyte *data,
                                                         cairo_format_t format,
                                                         int width,
                                                         int height,
                                                         int stride);
ubyte *     cairo_image_surface_get_data        (cairo_surface_t *surface);
cairo_format_t      cairo_image_surface_get_format      (cairo_surface_t *surface);
int                 cairo_image_surface_get_width       (cairo_surface_t *surface);
int                 cairo_image_surface_get_height      (cairo_surface_t *surface);
int                 cairo_image_surface_get_stride      (cairo_surface_t *surface);
