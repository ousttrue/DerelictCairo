// http://www.cairographics.org/manual/cairo-text.html;
                    cairo_glyph_t;
enum                cairo_font_slant_t;
enum                cairo_font_weight_t;
                    cairo_text_cluster_t;
enum                cairo_text_cluster_flags_t;
void                cairo_select_font_face              (cairo_t *cr,
                                                         const char *family,
                                                         cairo_font_slant_t slant,
                                                         cairo_font_weight_t weight);
void                cairo_set_font_size                 (cairo_t *cr,
                                                         double size);
void                cairo_set_font_matrix               (cairo_t *cr,
                                                         const cairo_matrix_t *matrix);
void                cairo_get_font_matrix               (cairo_t *cr,
                                                         cairo_matrix_t *matrix);
void                cairo_set_font_options              (cairo_t *cr,
                                                         const cairo_font_options_t *options);
void                cairo_get_font_options              (cairo_t *cr,
                                                         cairo_font_options_t *options);
void                cairo_set_font_face                 (cairo_t *cr,
                                                         cairo_font_face_t *font_face);
cairo_font_face_t * cairo_get_font_face                 (cairo_t *cr);
void                cairo_set_scaled_font               (cairo_t *cr,
                                                         const cairo_scaled_font_t *scaled_font);
cairo_scaled_font_t * cairo_get_scaled_font             (cairo_t *cr);
void                cairo_show_text                     (cairo_t *cr,
                                                         const char *utf8);
void                cairo_show_glyphs                   (cairo_t *cr,
                                                         const cairo_glyph_t *glyphs,
                                                         int num_glyphs);
void                cairo_show_text_glyphs              (cairo_t *cr,
                                                         const char *utf8,
                                                         int utf8_len,
                                                         const cairo_glyph_t *glyphs,
                                                         int num_glyphs,
                                                         const cairo_text_cluster_t *clusters,
                                                         int num_clusters,
                                                         cairo_text_cluster_flags_t cluster_flags);
void                cairo_font_extents                  (cairo_t *cr,
                                                         cairo_font_extents_t *extents);
void                cairo_text_extents                  (cairo_t *cr,
                                                         const char *utf8,
                                                         cairo_text_extents_t *extents);
void                cairo_glyph_extents                 (cairo_t *cr,
                                                         const cairo_glyph_t *glyphs,
                                                         int num_glyphs,
                                                         cairo_text_extents_t *extents);
cairo_font_face_t * cairo_toy_font_face_create          (const char *family,
                                                         cairo_font_slant_t slant,
                                                         cairo_font_weight_t weight);
const char *        cairo_toy_font_face_get_family      (cairo_font_face_t *font_face);
cairo_font_slant_t  cairo_toy_font_face_get_slant       (cairo_font_face_t *font_face);
cairo_font_weight_t cairo_toy_font_face_get_weight      (cairo_font_face_t *font_face);
cairo_glyph_t *     cairo_glyph_allocate                (int num_glyphs);
void                cairo_glyph_free                    (cairo_glyph_t *glyphs);
cairo_text_cluster_t * cairo_text_cluster_allocate      (int num_clusters);
void                cairo_text_cluster_free             (cairo_text_cluster_t *clusters);
