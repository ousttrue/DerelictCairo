// http://cairographics.org/manual/cairo-cairo-matrix-t.html;
                    cairo_matrix_t;
void                cairo_matrix_init                   (cairo_matrix_t *matrix,
                                                         double xx,
                                                         double yx,
                                                         double xy,
                                                         double yy,
                                                         double x0,
                                                         double y0);
void                cairo_matrix_init_identity          (cairo_matrix_t *matrix);
void                cairo_matrix_init_translate         (cairo_matrix_t *matrix,
                                                         double tx,
                                                         double ty);
void                cairo_matrix_init_scale             (cairo_matrix_t *matrix,
                                                         double sx,
                                                         double sy);
void                cairo_matrix_init_rotate            (cairo_matrix_t *matrix,
                                                         double radians);
void                cairo_matrix_translate              (cairo_matrix_t *matrix,
                                                         double tx,
                                                         double ty);
void                cairo_matrix_scale                  (cairo_matrix_t *matrix,
                                                         double sx,
                                                         double sy);
void                cairo_matrix_rotate                 (cairo_matrix_t *matrix,
                                                         double radians);
cairo_status_t      cairo_matrix_invert                 (cairo_matrix_t *matrix);
void                cairo_matrix_multiply               (cairo_matrix_t *result,
                                                         const cairo_matrix_t *a,
                                                         const cairo_matrix_t *b);
void                cairo_matrix_transform_distance     (const cairo_matrix_t *matrix,
                                                         double *dx,
                                                         double *dy);
void                cairo_matrix_transform_point        (const cairo_matrix_t *matrix,
                                                         double *x,
                                                         double *y);
