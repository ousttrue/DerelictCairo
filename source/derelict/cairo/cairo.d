/*

   Boost Software License - Version 1.0 - August 17th, 2003

   Permission is hereby granted, free of charge, to any person or organization
   obtaining a copy of the software and accompanying documentation covered by
   this license (the "Software") to use, reproduce, display, distribute,
   execute, and transmit the Software, and to prepare derivative works of the
   Software, and to permit third-parties to whom the Software is furnished to
   do so, all subject to the following:

   The copyright notices in the Software and this entire statement, including
   the above license grant, this restriction and the following disclaimer,
   must be included in all copies of the Software, in whole or in part, and
   all derivative works of the Software, unless such copies or derivative
   works are solely in the form of machine-executable object code generated by
   a source language processor.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
   SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
   FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
   ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
   DEALINGS IN THE SOFTWARE.

 */
module derelict.cairo.cairo;
import std.string;
import std.array;
import std.algorithm;
import std.stdio;


private {
    import derelict.util.loader;
    import derelict.util.system;

    static if( Derelict_OS_Windows )
        enum libNames = "cairo.dll";
    /*
       else static if( Derelict_OS_Mac )
       enum libNames = "libcairo.3.dylib,libcairo.dylib";
       else static if( Derelict_OS_Posix )
       enum libNames = "libcairo.so,libcairoso.3,/usr/local/lib/libcairo.so,/usr/local/lib/libcairoso.3";
     */
    else
        static assert( 0, "Need to implement Cairo libNames for this operating system." );
}


// http://cairographics.org/manual/cairo-Types.html
alias int cairo_bool_t;
struct cairo_user_data_key_t {
    int unused;
};
alias void function (void *) cairo_destroy_func_t;


// http://cairographics.org/manual/cairo-Paths.html
struct cairo_path_t {
    cairo_status_t status;
    cairo_path_data_t *data;
    int num_data;
};
enum cairo_path_data_type_t {
    CAIRO_PATH_MOVE_TO,
    CAIRO_PATH_LINE_TO,
    CAIRO_PATH_CURVE_TO,
    CAIRO_PATH_CLOSE_PATH
};
union cairo_path_data_t {
    struct header {
        cairo_path_data_type_t type;
        int length;
    };
    struct point {
        double x, y;
    };
};


// http://cairographics.org/manual/cairo-text.html
struct cairo_glyph_t {
    //unsigned int index;
    ulong        index;
    double               x;
    double               y;
};


// http://cairographics.org/manual/cairo-cairo-t.html
class cairo_t{}
enum cairo_antialias_t {
    CAIRO_ANTIALIAS_DEFAULT,

    /* method */
    CAIRO_ANTIALIAS_NONE,
    CAIRO_ANTIALIAS_GRAY,
    CAIRO_ANTIALIAS_SUBPIXEL,

    /* hints */
    CAIRO_ANTIALIAS_FAST,
    CAIRO_ANTIALIAS_GOOD,
    CAIRO_ANTIALIAS_BEST
};
enum cairo_fill_rule_t {
    CAIRO_FILL_RULE_WINDING,
    CAIRO_FILL_RULE_EVEN_ODD
};
enum cairo_line_cap_t {
    CAIRO_LINE_CAP_BUTT,
    CAIRO_LINE_CAP_ROUND,
    CAIRO_LINE_CAP_SQUARE
};
enum cairo_line_join_t {
    CAIRO_LINE_JOIN_MITER,
    CAIRO_LINE_JOIN_ROUND,
    CAIRO_LINE_JOIN_BEVEL
};
enum cairo_operator_t {
    CAIRO_OPERATOR_CLEAR,

    CAIRO_OPERATOR_SOURCE,
    CAIRO_OPERATOR_OVER,
    CAIRO_OPERATOR_IN,
    CAIRO_OPERATOR_OUT,
    CAIRO_OPERATOR_ATOP,

    CAIRO_OPERATOR_DEST,
    CAIRO_OPERATOR_DEST_OVER,
    CAIRO_OPERATOR_DEST_IN,
    CAIRO_OPERATOR_DEST_OUT,
    CAIRO_OPERATOR_DEST_ATOP,

    CAIRO_OPERATOR_XOR,
    CAIRO_OPERATOR_ADD,
    CAIRO_OPERATOR_SATURATE,

    CAIRO_OPERATOR_MULTIPLY,
    CAIRO_OPERATOR_SCREEN,
    CAIRO_OPERATOR_OVERLAY,
    CAIRO_OPERATOR_DARKEN,
    CAIRO_OPERATOR_LIGHTEN,
    CAIRO_OPERATOR_COLOR_DODGE,
    CAIRO_OPERATOR_COLOR_BURN,
    CAIRO_OPERATOR_HARD_LIGHT,
    CAIRO_OPERATOR_SOFT_LIGHT,
    CAIRO_OPERATOR_DIFFERENCE,
    CAIRO_OPERATOR_EXCLUSION,
    CAIRO_OPERATOR_HSL_HUE,
    CAIRO_OPERATOR_HSL_SATURATION,
    CAIRO_OPERATOR_HSL_COLOR,
    CAIRO_OPERATOR_HSL_LUMINOSITY
};
struct cairo_rectangle_t
{
    double x, y, width, height;
};
struct cairo_rectangle_list_t
{
    cairo_status_t     status;
    cairo_rectangle_t *rectangles;
    int                num_rectangles;
};


enum cairo_format_t {
    CAIRO_FORMAT_INVALID   = -1,
    CAIRO_FORMAT_ARGB32    = 0,
    CAIRO_FORMAT_RGB24     = 1,
    CAIRO_FORMAT_A8        = 2,
    CAIRO_FORMAT_A1        = 3,
    CAIRO_FORMAT_RGB16_565 = 4,
    CAIRO_FORMAT_RGB30     = 5
}


// http://cairographics.org/manual/cairo-cairo-pattern-t.html
class cairo_pattern_t{}


// http://cairographics.org/manual/cairo-cairo-surface-t.html
class cairo_surface_t{}

enum cairo_content_t {
    CAIRO_CONTENT_COLOR		= 0x1000,
    CAIRO_CONTENT_ALPHA		= 0x2000,
    CAIRO_CONTENT_COLOR_ALPHA = 0x3000
};


enum cairo_font_slant_t {
    CAIRO_FONT_SLANT_NORMAL,
    CAIRO_FONT_SLANT_ITALIC,
    CAIRO_FONT_SLANT_OBLIQUE
}


enum cairo_font_weight_t {
    CAIRO_FONT_WEIGHT_NORMAL,
    CAIRO_FONT_WEIGHT_BOLD
}


// http://cairographics.org/manual/cairo-Error-handling.html
enum cairo_status_t  {
    CAIRO_STATUS_SUCCESS = 0,

    CAIRO_STATUS_NO_MEMORY,
    CAIRO_STATUS_INVALID_RESTORE,
    CAIRO_STATUS_INVALID_POP_GROUP,
    CAIRO_STATUS_NO_CURRENT_POINT,
    CAIRO_STATUS_INVALID_MATRIX,
    CAIRO_STATUS_INVALID_STATUS,
    CAIRO_STATUS_NULL_POINTER,
    CAIRO_STATUS_INVALID_STRING,
    CAIRO_STATUS_INVALID_PATH_DATA,
    CAIRO_STATUS_READ_ERROR,
    CAIRO_STATUS_WRITE_ERROR,
    CAIRO_STATUS_SURFACE_FINISHED,
    CAIRO_STATUS_SURFACE_TYPE_MISMATCH,
    CAIRO_STATUS_PATTERN_TYPE_MISMATCH,
    CAIRO_STATUS_INVALID_CONTENT,
    CAIRO_STATUS_INVALID_FORMAT,
    CAIRO_STATUS_INVALID_VISUAL,
    CAIRO_STATUS_FILE_NOT_FOUND,
    CAIRO_STATUS_INVALID_DASH,
    CAIRO_STATUS_INVALID_DSC_COMMENT,
    CAIRO_STATUS_INVALID_INDEX,
    CAIRO_STATUS_CLIP_NOT_REPRESENTABLE,
    CAIRO_STATUS_TEMP_FILE_ERROR,
    CAIRO_STATUS_INVALID_STRIDE,
    CAIRO_STATUS_FONT_TYPE_MISMATCH,
    CAIRO_STATUS_USER_FONT_IMMUTABLE,
    CAIRO_STATUS_USER_FONT_ERROR,
    CAIRO_STATUS_NEGATIVE_COUNT,
    CAIRO_STATUS_INVALID_CLUSTERS,
    CAIRO_STATUS_INVALID_SLANT,
    CAIRO_STATUS_INVALID_WEIGHT,
    CAIRO_STATUS_INVALID_SIZE,
    CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED,
    CAIRO_STATUS_DEVICE_TYPE_MISMATCH,
    CAIRO_STATUS_DEVICE_ERROR,
    CAIRO_STATUS_INVALID_MESH_CONSTRUCTION,
    CAIRO_STATUS_DEVICE_FINISHED,

    CAIRO_STATUS_LAST_STATUS
};


private struct Decl{
    string name;
    string ret;
    string args;
}


string remove_a_symbol(string arg)
{
    arg=arg.strip();
    while(true)
    {
        auto last=arg[$-1];
        if(!std.ascii.isAlphaNum(last) && last!='_'){
            break;
        }
        arg=arg[0 .. $-1];
    }
    return arg;
}


Decl toDecl(string src)
{
    auto open=src.indexOf('(');
    auto close=src.lastIndexOf(')');
    auto args=src[open+1..close];

    auto return_name=src[0..open];
    return_name=return_name.stripRight();
    auto name_begin=return_name.lastIndexOf(' ');
    auto name=return_name[name_begin+1..$];
    auto ret=return_name[0..name_begin].strip();


    return Decl(name, ret
            , args.ctSplit(',').map!(arg => remove_a_symbol(arg)).join(",")
            );
}


string[] ctSplit(string src, char delimiter)
{
    string[] splited=[];
    while(true){
        auto index=src.indexOf(delimiter);
        if(index==-1){
            splited~=src;
            break;
        }
        splited~=src[0 .. index];
        src=src[index+1 .. $];
    }
    return splited;
}


Decl[] decls()
{
    // http://cairographics.org/manual/cairo-cairo-t.html
    string cairo_t_src="
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
";

    // http://cairographics.org/manual/cairo-Paths.html
    string cairo_path_src="
                    cairo_path_t;
union               cairo_path_data_t;
enum                cairo_path_data_type_t;
cairo_path_t *      cairo_copy_path                     (cairo_t *cr);
cairo_path_t *      cairo_copy_path_flat                (cairo_t *cr);
void                cairo_path_destroy                  (cairo_path_t *path);
void                cairo_append_path                   (cairo_t *cr,
                                                         const cairo_path_t *path);
cairo_bool_t        cairo_has_current_point             (cairo_t *cr);
void                cairo_get_current_point             (cairo_t *cr,
                                                         double *x,
                                                         double *y);
void                cairo_new_path                      (cairo_t *cr);
void                cairo_new_sub_path                  (cairo_t *cr);
void                cairo_close_path                    (cairo_t *cr);
void                cairo_arc                           (cairo_t *cr,
                                                         double xc,
                                                         double yc,
                                                         double radius,
                                                         double angle1,
                                                         double angle2);
void                cairo_arc_negative                  (cairo_t *cr,
                                                         double xc,
                                                         double yc,
                                                         double radius,
                                                         double angle1,
                                                         double angle2);
void                cairo_curve_to                      (cairo_t *cr,
                                                         double x1,
                                                         double y1,
                                                         double x2,
                                                         double y2,
                                                         double x3,
                                                         double y3);
void                cairo_line_to                       (cairo_t *cr,
                                                         double x,
                                                         double y);
void                cairo_move_to                       (cairo_t *cr,
                                                         double x,
                                                         double y);
void                cairo_rectangle                     (cairo_t *cr,
                                                         double x,
                                                         double y,
                                                         double width,
                                                         double height);
void                cairo_glyph_path                    (cairo_t *cr,
                                                         const cairo_glyph_t *glyphs,
                                                         int num_glyphs);
void                cairo_text_path                     (cairo_t *cr,
                                                         const char *utf8);
void                cairo_rel_curve_to                  (cairo_t *cr,
                                                         double dx1,
                                                         double dy1,
                                                         double dx2,
                                                         double dy2,
                                                         double dx3,
                                                         double dy3);
void                cairo_rel_line_to                   (cairo_t *cr,
                                                         double dx,
                                                         double dy);
void                cairo_rel_move_to                   (cairo_t *cr,
                                                         double dx,
                                                         double dy);
void                cairo_path_extents                  (cairo_t *cr,
                                                         double *x1,
                                                         double *y1,
                                                         double *x2,
                                                         double *y2);
";

    Decl[] cairo_t_delcs=cairo_t_src.ctSplit(';').filter!(
            s => s.indexOf("(")!=-1).map!(s => toDecl(s.strip())).array();

    Decl[] cairo_path_decls=cairo_path_src.ctSplit(';').filter!(
            s => s.indexOf("(")!=-1).map!(s => toDecl(s.strip())).array();

    Decl[] decls_manual=[
            Decl("cairo_image_surface_create", "cairo_surface_t*", "cairo_format_t, int, int"),
            Decl("cairo_select_font_face", "void", "cairo_t*, const char*, cairo_font_slant_t, cairo_font_weight_t"),
            Decl("cairo_set_font_size", "void", "cairo_t*, double"),
            Decl("cairo_show_text", "void", "cairo_t*, const char*"),
            Decl("cairo_surface_write_to_png", "void", "cairo_surface_t*, const char*"),
            Decl("cairo_surface_destroy", "void", "cairo_surface_t*"),
            ];

    string debug_str="";
    foreach(Decl d; cairo_t_delcs)
    {
        debug_str ~= 
                format("#[%s][%s][%s]\n", d.name, d.ret, d.args);
                //format("alias da_%s = %s function(%s) nothrow;", d.name, d.ret, d.args);
    }
    //assert(0, debug_str);
    {
        auto d=cairo_path_decls[1];
        //assert(0, format("#[%s][%s][%s]\n", d.name, d.ret, d.args));
    }

    return cairo_t_delcs ~ cairo_path_decls ~ decls_manual;
}


extern( C ) {
    mixin(decls().map!(d => 
                format("alias da_%s = %s function(%s) nothrow;", d.name, d.ret, d.args)
                ).join());
}


__gshared {
    mixin(decls().map!(d => 
                format("da_%s %s;", d.name, d.name)
                ).join());
}


class DerelictCairoLoader : SharedLibLoader {
    public this() {
        super( libNames );
    }
    protected override void loadSymbols() {
        mixin(decls().map!(d => 
                    format("bindFunc(cast(void**)&%s, \"%s\");", d.name, d.name)
                    ).join());
    }
}


__gshared DerelictCairoLoader DerelictCairo;


shared static this() {
    DerelictCairo = new DerelictCairoLoader();
}

