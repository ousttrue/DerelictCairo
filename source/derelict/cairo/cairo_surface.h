// http://cairographics.org/manual/cairo-cairo-surface-t.html;
#define             CAIRO_HAS_MIME_SURFACE
#define             CAIRO_MIME_TYPE_JP2
#define             CAIRO_MIME_TYPE_JPEG
#define             CAIRO_MIME_TYPE_PNG
#define             CAIRO_MIME_TYPE_URI
#define             CAIRO_MIME_TYPE_UNIQUE_ID
//;
typedef             cairo_surface_t;
enum                cairo_content_t;
cairo_surface_t *   cairo_surface_create_similar        (cairo_surface_t *other,
                                                         cairo_content_t content,
                                                         int width,
                                                         int height);
cairo_surface_t *   cairo_surface_create_similar_image  (cairo_surface_t *other,
                                                         cairo_format_t format,
                                                         int width,
                                                         int height);
cairo_surface_t *   cairo_surface_create_for_rectangle  (cairo_surface_t *target,
                                                         double x,
                                                         double y,
                                                         double width,
                                                         double height);
cairo_surface_t *   cairo_surface_reference             (cairo_surface_t *surface);
void                cairo_surface_destroy               (cairo_surface_t *surface);
cairo_status_t      cairo_surface_status                (cairo_surface_t *surface);
void                cairo_surface_finish                (cairo_surface_t *surface);
void                cairo_surface_flush                 (cairo_surface_t *surface);
cairo_device_t *    cairo_surface_get_device            (cairo_surface_t *surface);
void                cairo_surface_get_font_options      (cairo_surface_t *surface,
                                                         cairo_font_options_t *options);
cairo_content_t     cairo_surface_get_content           (cairo_surface_t *surface);
void                cairo_surface_mark_dirty            (cairo_surface_t *surface);
void                cairo_surface_mark_dirty_rectangle  (cairo_surface_t *surface,
                                                         int x,
                                                         int y,
                                                         int width,
                                                         int height);
void                cairo_surface_set_device_offset     (cairo_surface_t *surface,
                                                         double x_offset,
                                                         double y_offset);
void                cairo_surface_get_device_offset     (cairo_surface_t *surface,
                                                         double *x_offset,
                                                         double *y_offset);
void                cairo_surface_set_fallback_resolution
                                                        (cairo_surface_t *surface,
                                                         double x_pixels_per_inch,
                                                         double y_pixels_per_inch);
void                cairo_surface_get_fallback_resolution
                                                        (cairo_surface_t *surface,
                                                         double *x_pixels_per_inch,
                                                         double *y_pixels_per_inch);
enum                cairo_surface_type_t;
cairo_surface_type_t cairo_surface_get_type             (cairo_surface_t *surface);
uint        cairo_surface_get_reference_count   (cairo_surface_t *surface);
cairo_status_t      cairo_surface_set_user_data         (cairo_surface_t *surface,
                                                         const cairo_user_data_key_t *key,
                                                         void *user_data,
                                                         cairo_destroy_func_t destroy);
void *              cairo_surface_get_user_data         (cairo_surface_t *surface,
                                                         const cairo_user_data_key_t *key);
void                cairo_surface_copy_page             (cairo_surface_t *surface);
void                cairo_surface_show_page             (cairo_surface_t *surface);
cairo_bool_t        cairo_surface_has_show_text_glyphs  (cairo_surface_t *surface);
cairo_status_t      cairo_surface_set_mime_data         (cairo_surface_t *surface,
                                                         const char *mime_type,
                                                         const ubyte *data,
                                                         ulong  length,
                                                         cairo_destroy_func_t destroy,
                                                         void *closure);
void                cairo_surface_get_mime_data         (cairo_surface_t *surface,
                                                         const char *mime_type,
                                                         const ubyte **data,
                                                         ulong *length);
cairo_bool_t        cairo_surface_supports_mime_type    (cairo_surface_t *surface,
                                                         const char *mime_type);
cairo_surface_t *   cairo_surface_map_to_image          (cairo_surface_t *surface,
                                                         const cairo_rectangle_int_t *extents);
void                cairo_surface_unmap_image           (cairo_surface_t *surface,
                                                         cairo_surface_t *image);
