// http://cairographics.org/manual/cairo-cairo-font-options-t.html;
typedef             cairo_font_options_t;
cairo_font_options_t * cairo_font_options_create        (void);
cairo_font_options_t * cairo_font_options_copy          (const cairo_font_options_t *original);
void                cairo_font_options_destroy          (cairo_font_options_t *options);
cairo_status_t      cairo_font_options_status           (cairo_font_options_t *options);
void                cairo_font_options_merge            (cairo_font_options_t *options,
                                                         const cairo_font_options_t *other);
ulong       cairo_font_options_hash             (const cairo_font_options_t *options);
cairo_bool_t        cairo_font_options_equal            (const cairo_font_options_t *options,
                                                         const cairo_font_options_t *other);
void                cairo_font_options_set_antialias    (cairo_font_options_t *options,
                                                         cairo_antialias_t antialias);
cairo_antialias_t   cairo_font_options_get_antialias    (const cairo_font_options_t *options);
enum                cairo_subpixel_order_t;
void                cairo_font_options_set_subpixel_order
                                                        (cairo_font_options_t *options,
                                                         cairo_subpixel_order_t subpixel_order);
cairo_subpixel_order_t cairo_font_options_get_subpixel_order
                                                        (const cairo_font_options_t *options);
enum                cairo_hint_style_t;
void                cairo_font_options_set_hint_style   (cairo_font_options_t *options,
                                                         cairo_hint_style_t hint_style);
cairo_hint_style_t  cairo_font_options_get_hint_style   (const cairo_font_options_t *options);
enum                cairo_hint_metrics_t;
void                cairo_font_options_set_hint_metrics (cairo_font_options_t *options,
                                                         cairo_hint_metrics_t hint_metrics);
cairo_hint_metrics_t cairo_font_options_get_hint_metrics
                                                        (const cairo_font_options_t *options);
