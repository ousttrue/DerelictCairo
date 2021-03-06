// http://cairographics.org/manual/cairo-cairo-t.html;
typedef             cairo_t;
cairo_t *           cairo_create                        (cairo_surface_t *target);
cairo_t *           cairo_reference                     (cairo_t *cr);
void                cairo_destroy                       (cairo_t *cr);
cairo_status_t      cairo_status                        (cairo_t *cr);
void                cairo_save                          (cairo_t *cr);
void                cairo_restore                       (cairo_t *cr);
cairo_surface_t *   cairo_get_target                    (cairo_t *cr);
void                cairo_push_group                    (cairo_t *cr);
void                cairo_push_group_with_content       (cairo_t *cr,
                                                         cairo_content_t content);
cairo_pattern_t *   cairo_pop_group                     (cairo_t *cr);
void                cairo_pop_group_to_source           (cairo_t *cr);
cairo_surface_t *   cairo_get_group_target              (cairo_t *cr);
void                cairo_set_source_rgb                (cairo_t *cr,
                                                         double red,
                                                         double green,
                                                         double blue);
void                cairo_set_source_rgba               (cairo_t *cr,
                                                         double red,
                                                         double green,
                                                         double blue,
                                                         double alpha);
void                cairo_set_source                    (cairo_t *cr,
                                                         cairo_pattern_t *source);
void                cairo_set_source_surface            (cairo_t *cr,
                                                         cairo_surface_t *surface,
                                                         double x,
                                                         double y);
cairo_pattern_t *   cairo_get_source                    (cairo_t *cr);
enum                cairo_antialias_t;
void                cairo_set_antialias                 (cairo_t *cr,
                                                         cairo_antialias_t antialias);
cairo_antialias_t   cairo_get_antialias                 (cairo_t *cr);
void                cairo_set_dash                      (cairo_t *cr,
                                                         const double *dashes,
                                                         int num_dashes,
                                                         double offset);
int                 cairo_get_dash_count                (cairo_t *cr);
void                cairo_get_dash                      (cairo_t *cr,
                                                         double *dashes,
                                                         double *offset);
enum                cairo_fill_rule_t;
void                cairo_set_fill_rule                 (cairo_t *cr,
                                                         cairo_fill_rule_t fill_rule);
cairo_fill_rule_t   cairo_get_fill_rule                 (cairo_t *cr);
enum                cairo_line_cap_t;
void                cairo_set_line_cap                  (cairo_t *cr,
                                                         cairo_line_cap_t line_cap);
cairo_line_cap_t    cairo_get_line_cap                  (cairo_t *cr);
enum                cairo_line_join_t;
void                cairo_set_line_join                 (cairo_t *cr,
                                                         cairo_line_join_t line_join);
cairo_line_join_t   cairo_get_line_join                 (cairo_t *cr);
void                cairo_set_line_width                (cairo_t *cr,
                                                         double width);
double              cairo_get_line_width                (cairo_t *cr);
void                cairo_set_miter_limit               (cairo_t *cr,
                                                         double limit);
double              cairo_get_miter_limit               (cairo_t *cr);
enum                cairo_operator_t;
void                cairo_set_operator                  (cairo_t *cr,
                                                         cairo_operator_t op);
cairo_operator_t    cairo_get_operator                  (cairo_t *cr);
void                cairo_set_tolerance                 (cairo_t *cr,
                                                         double tolerance);
double              cairo_get_tolerance                 (cairo_t *cr);
void                cairo_clip                          (cairo_t *cr);
void                cairo_clip_preserve                 (cairo_t *cr);
void                cairo_clip_extents                  (cairo_t *cr,
                                                         double *x1,
                                                         double *y1,
                                                         double *x2,
                                                         double *y2);
cairo_bool_t        cairo_in_clip                       (cairo_t *cr,
                                                         double x,
                                                         double y);
void                cairo_reset_clip                    (cairo_t *cr);
                    cairo_rectangle_t;
                    cairo_rectangle_list_t;
void                cairo_rectangle_list_destroy        (cairo_rectangle_list_t *rectangle_list);
cairo_rectangle_list_t * cairo_copy_clip_rectangle_list (cairo_t *cr);
void                cairo_fill                          (cairo_t *cr);
void                cairo_fill_preserve                 (cairo_t *cr);
void                cairo_fill_extents                  (cairo_t *cr,
                                                         double *x1,
                                                         double *y1,
                                                         double *x2,
                                                         double *y2);
cairo_bool_t        cairo_in_fill                       (cairo_t *cr,
                                                         double x,
                                                         double y);
void                cairo_mask                          (cairo_t *cr,
                                                         cairo_pattern_t *pattern);
void                cairo_mask_surface                  (cairo_t *cr,
                                                         cairo_surface_t *surface,
                                                         double surface_x,
                                                         double surface_y);
void                cairo_paint                         (cairo_t *cr);
void                cairo_paint_with_alpha              (cairo_t *cr,
                                                         double alpha);
void                cairo_stroke                        (cairo_t *cr);
void                cairo_stroke_preserve               (cairo_t *cr);
void                cairo_stroke_extents                (cairo_t *cr,
                                                         double *x1,
                                                         double *y1,
                                                         double *x2,
                                                         double *y2);
cairo_bool_t        cairo_in_stroke                     (cairo_t *cr,
                                                         double x,
                                                         double y);
void                cairo_copy_page                     (cairo_t *cr);
void                cairo_show_page                     (cairo_t *cr);
uint        cairo_get_reference_count           (cairo_t *cr);
cairo_status_t      cairo_set_user_data                 (cairo_t *cr,
                                                         const cairo_user_data_key_t *key,
                                                         void *user_data,
                                                         cairo_destroy_func_t destroy);
void *              cairo_get_user_data                 (cairo_t *cr,
                                                         const cairo_user_data_key_t *key);
