// http://cairographics.org/manual/cairo-cairo-font-face-t.html;
typedef             cairo_font_face_t;
cairo_font_face_t * cairo_font_face_reference           (cairo_font_face_t *font_face);
void                cairo_font_face_destroy             (cairo_font_face_t *font_face);
cairo_status_t      cairo_font_face_status              (cairo_font_face_t *font_face);
enum                cairo_font_type_t;
cairo_font_type_t   cairo_font_face_get_type            (cairo_font_face_t *font_face);
uint        cairo_font_face_get_reference_count (cairo_font_face_t *font_face);
cairo_status_t      cairo_font_face_set_user_data       (cairo_font_face_t *font_face,
                                                         const cairo_user_data_key_t *key,
                                                         void *user_data,
                                                         cairo_destroy_func_t destroy);
void *              cairo_font_face_get_user_data       (cairo_font_face_t *font_face,
                                                         const cairo_user_data_key_t *key);
