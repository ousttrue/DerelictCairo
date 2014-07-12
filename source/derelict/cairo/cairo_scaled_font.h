// http://cairographics.org/manual/cairo-cairo-scaled-font-t.html;
typedef             cairo_scaled_font_t;
cairo_scaled_font_t * cairo_scaled_font_create          (cairo_font_face_t *font_face,
                                                         const cairo_matrix_t *font_matrix,
                                                         const cairo_matrix_t *ctm,
                                                         const cairo_font_options_t *options);
cairo_scaled_font_t * cairo_scaled_font_reference       (cairo_scaled_font_t *scaled_font);
void                cairo_scaled_font_destroy           (cairo_scaled_font_t *scaled_font);
cairo_status_t      cairo_scaled_font_status            (cairo_scaled_font_t *scaled_font);
                    cairo_font_extents_t;
void                cairo_scaled_font_extents           (cairo_scaled_font_t *scaled_font,
                                                         cairo_font_extents_t *extents);
                    cairo_text_extents_t;
void                cairo_scaled_font_text_extents      (cairo_scaled_font_t *scaled_font,
                                                         const char *utf8,
                                                         cairo_text_extents_t *extents);
void                cairo_scaled_font_glyph_extents     (cairo_scaled_font_t *scaled_font,
                                                         const cairo_glyph_t *glyphs,
                                                         int num_glyphs,
                                                         cairo_text_extents_t *extents);
cairo_status_t      cairo_scaled_font_text_to_glyphs    (cairo_scaled_font_t *scaled_font,
                                                         double x,
                                                         double y,
                                                         const char *utf8,
                                                         int utf8_len,
                                                         cairo_glyph_t **glyphs,
                                                         int *num_glyphs,
                                                         cairo_text_cluster_t **clusters,
                                                         int *num_clusters,
                                                         cairo_text_cluster_flags_t *cluster_flags);
cairo_font_face_t * cairo_scaled_font_get_font_face     (cairo_scaled_font_t *scaled_font);
void                cairo_scaled_font_get_font_options  (cairo_scaled_font_t *scaled_font,
                                                         cairo_font_options_t *options);
void                cairo_scaled_font_get_font_matrix   (cairo_scaled_font_t *scaled_font,
                                                         cairo_matrix_t *font_matrix);
void                cairo_scaled_font_get_ctm           (cairo_scaled_font_t *scaled_font,
                                                         cairo_matrix_t *ctm);
void                cairo_scaled_font_get_scale_matrix  (cairo_scaled_font_t *scaled_font,
                                                         cairo_matrix_t *scale_matrix);
cairo_font_type_t   cairo_scaled_font_get_type          (cairo_scaled_font_t *scaled_font);
uint        cairo_scaled_font_get_reference_count
                                                        (cairo_scaled_font_t *scaled_font);
cairo_status_t      cairo_scaled_font_set_user_data     (cairo_scaled_font_t *scaled_font,
                                                         const cairo_user_data_key_t *key,
                                                         void *user_data,
                                                         cairo_destroy_func_t destroy);
void *              cairo_scaled_font_get_user_data     (cairo_scaled_font_t *scaled_font,
                                                         const cairo_user_data_key_t *key);
