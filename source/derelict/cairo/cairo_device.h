// http://cairographics.org/manual/cairo-cairo-device-t.html;
typedef             cairo_device_t;
cairo_device_t *    cairo_device_reference              (cairo_device_t *device);
void                cairo_device_destroy                (cairo_device_t *device);
cairo_status_t      cairo_device_status                 (cairo_device_t *device);
void                cairo_device_finish                 (cairo_device_t *device);
void                cairo_device_flush                  (cairo_device_t *device);
enum                cairo_device_type_t;
cairo_device_type_t cairo_device_get_type               (cairo_device_t *device);
uint        cairo_device_get_reference_count    (cairo_device_t *device);
cairo_status_t      cairo_device_set_user_data          (cairo_device_t *device,
                                                         const cairo_user_data_key_t *key,
                                                         void *user_data,
                                                         cairo_destroy_func_t destroy);
void *              cairo_device_get_user_data          (cairo_device_t *device,
                                                         const cairo_user_data_key_t *key);
cairo_status_t      cairo_device_acquire                (cairo_device_t *device);
void                cairo_device_release                (cairo_device_t *device);
