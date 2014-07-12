// http://cairographics.org/manual/cairo-FreeType-Fonts.html;
#define             CAIRO_HAS_FT_FONT;
#define             CAIRO_HAS_FC_FONT;
cairo_font_face_t * cairo_ft_font_face_create_for_ft_face
                                                        (FT_Face face,
                                                         int load_flags);
cairo_font_face_t * cairo_ft_font_face_create_for_pattern
                                                        (FcPattern *pattern);
void                cairo_ft_font_options_substitute    (const cairo_font_options_t *options,
                                                         FcPattern *pattern);
FT_Face             cairo_ft_scaled_font_lock_face      (cairo_scaled_font_t *scaled_font);
void                cairo_ft_scaled_font_unlock_face    (cairo_scaled_font_t *scaled_font);
enum                cairo_ft_synthesize_t;
uint        cairo_ft_font_face_get_synthesize   (cairo_font_face_t *font_face);
void                cairo_ft_font_face_set_synthesize   (cairo_font_face_t *font_face,
                                                         uint synth_flags);
void                cairo_ft_font_face_unset_synthesize (cairo_font_face_t *font_face,
                                                         uint synth_flags);
