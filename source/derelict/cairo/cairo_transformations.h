// http://www.cairographics.org/manual/cairo-Transformations.html;
void                cairo_translate                     (cairo_t *cr,
                                                         double tx,
                                                         double ty);
void                cairo_scale                         (cairo_t *cr,
                                                         double sx,
                                                         double sy);
void                cairo_rotate                        (cairo_t *cr,
                                                         double angle);
void                cairo_transform                     (cairo_t *cr,
                                                         const cairo_matrix_t *matrix);
void                cairo_set_matrix                    (cairo_t *cr,
                                                         const cairo_matrix_t *matrix);
void                cairo_get_matrix                    (cairo_t *cr,
                                                         cairo_matrix_t *matrix);
void                cairo_identity_matrix               (cairo_t *cr);
void                cairo_user_to_device                (cairo_t *cr,
                                                         double *x,
                                                         double *y);
void                cairo_user_to_device_distance       (cairo_t *cr,
                                                         double *dx,
                                                         double *dy);
void                cairo_device_to_user                (cairo_t *cr,
                                                         double *x,
                                                         double *y);
void                cairo_device_to_user_distance       (cairo_t *cr,
                                                         double *dx,
                                                         double *dy);
