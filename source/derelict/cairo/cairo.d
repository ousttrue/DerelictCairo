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
import std.regex;


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


// font face
class cairo_font_face_t{}
enum cairo_font_type_t {
    CAIRO_FONT_TYPE_TOY,
    CAIRO_FONT_TYPE_FT,
    CAIRO_FONT_TYPE_WIN32,
    CAIRO_FONT_TYPE_QUARTZ,
    CAIRO_FONT_TYPE_USER
};


// scaled font
class cairo_scaled_font_t{}
struct cairo_font_extents_t {
    double ascent;
    double descent;
    double height;
    double max_x_advance;
    double max_y_advance;
};
struct cairo_text_extents_t {
    double x_bearing;
    double y_bearing;
    double width;
    double height;
    double x_advance;
    double y_advance;
};


// cairo font options
class cairo_font_options_t{}
enum cairo_subpixel_order_t {
    CAIRO_SUBPIXEL_ORDER_DEFAULT,
    CAIRO_SUBPIXEL_ORDER_RGB,
    CAIRO_SUBPIXEL_ORDER_BGR,
    CAIRO_SUBPIXEL_ORDER_VRGB,
    CAIRO_SUBPIXEL_ORDER_VBGR
};
enum cairo_hint_style_t {
    CAIRO_HINT_STYLE_DEFAULT,
    CAIRO_HINT_STYLE_NONE,
    CAIRO_HINT_STYLE_SLIGHT,
    CAIRO_HINT_STYLE_MEDIUM,
    CAIRO_HINT_STYLE_FULL
};
enum cairo_hint_metrics_t {
    CAIRO_HINT_METRICS_DEFAULT,
    CAIRO_HINT_METRICS_OFF,
    CAIRO_HINT_METRICS_ON
};


// freetype
/*
class FT_Face;
class FcPattern;
*/


// http://cairographics.org/manual/cairo-text.html
struct cairo_glyph_t {
    //unsigned int index;
    ulong        index;
    double               x;
    double               y;
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
struct cairo_text_cluster_t {
    int        num_bytes;
    int        num_glyphs;
};
enum cairo_text_cluster_flags_t {
    CAIRO_TEXT_CLUSTER_FLAG_BACKWARD = 0x00000001
};


// raster sources
alias cairo_surface_t function (cairo_pattern_t *, void *, cairo_surface_t *, const cairo_rectangle_int_t *)
    cairo_raster_source_acquire_func_t;

alias void function (cairo_pattern_t *, void *, cairo_surface_t *)
    cairo_raster_source_release_func_t;

alias cairo_status_t function (cairo_pattern_t *, void *) 
    cairo_raster_source_snapshot_func_t;

alias cairo_status_t function  (cairo_pattern_t *, void *, const cairo_pattern_t *)
     cairo_raster_source_copy_func_t;

alias void function (cairo_pattern_t *, void *)
    cairo_raster_source_finish_func_t;


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
enum cairo_extend_t {
    CAIRO_EXTEND_NONE,
    CAIRO_EXTEND_REPEAT,
    CAIRO_EXTEND_REFLECT,
    CAIRO_EXTEND_PAD
};
enum cairo_filter_t {
    CAIRO_FILTER_FAST,
    CAIRO_FILTER_GOOD,
    CAIRO_FILTER_BEST,
    CAIRO_FILTER_NEAREST,
    CAIRO_FILTER_BILINEAR,
    CAIRO_FILTER_GAUSSIAN
};
enum cairo_pattern_type_t {
    CAIRO_PATTERN_TYPE_SOLID,
    CAIRO_PATTERN_TYPE_SURFACE,
    CAIRO_PATTERN_TYPE_LINEAR,
    CAIRO_PATTERN_TYPE_RADIAL,
    CAIRO_PATTERN_TYPE_MESH,
    CAIRO_PATTERN_TYPE_RASTER_SOURCE
};


// http://cairographics.org/manual/cairo-Regions.html
class cairo_region_t{}
struct cairo_rectangle_int_t {
    int x, y;
    int width, height;
};
enum  cairo_region_overlap_t {
    CAIRO_REGION_OVERLAP_IN,		/* completely inside region */
    CAIRO_REGION_OVERLAP_OUT,		/* completely outside region */
    CAIRO_REGION_OVERLAP_PART		/* partly inside region */
};


// http://cairographics.org/manual/cairo-cairo-surface-t.html
class cairo_surface_t{}

enum cairo_content_t {
    CAIRO_CONTENT_COLOR		= 0x1000,
    CAIRO_CONTENT_ALPHA		= 0x2000,
    CAIRO_CONTENT_COLOR_ALPHA = 0x3000
};


// transforms
struct cairo_matrix_t
{
    double xx; double yx;
    double xy; double yy;
    double x0; double y0;
};

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


// device
struct cairo_device_t;
enum cairo_device_type_t {
    CAIRO_DEVICE_TYPE_DRM,
    CAIRO_DEVICE_TYPE_GL,
    CAIRO_DEVICE_TYPE_SCRIPT,
    CAIRO_DEVICE_TYPE_XCB,
    CAIRO_DEVICE_TYPE_XLIB,
    CAIRO_DEVICE_TYPE_XML,
    CAIRO_DEVICE_TYPE_COGL,
    CAIRO_DEVICE_TYPE_WIN32,

    CAIRO_DEVICE_TYPE_INVALID = -1
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
    auto args=src[open+1..close].strip();

    auto return_name=src[0..open];
    return_name=return_name.stripRight();
    auto name_begin=return_name.lastIndexOf(' ');
    auto name=return_name[name_begin+1..$];
    auto ret=return_name[0..name_begin].strip();


    if(args=="" || args=="void"){
        return Decl(name, ret, "");
    }
    else{
        return Decl(name, ret
                , args.ctSplit(',').map!(arg => remove_a_symbol(arg)).join(",")
                );
    }
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


/*
string replaceUnsigned(string src)
{
    src=src.replaceAll(regex(r"unsigned\s+int"), "uint");
    src=src.replaceAll(regex(r"unsigned\s+long"), "long");

    return src;
}
*/


Decl[] toDecls(string src)
{
    return src.ctSplit(';').filter!(
            s => s.indexOf("(")!=-1).map!(s => toDecl(s.strip())).array();
}


Decl[] decls()
{
    Decl[] decls_manual=[
            Decl("cairo_image_surface_create", "cairo_surface_t*", "cairo_format_t, int, int"),
            Decl("cairo_surface_write_to_png", "void", "cairo_surface_t*, const char*"),
            Decl("cairo_surface_destroy", "void", "cairo_surface_t*"),
            ];

    /*
    string debug_str="";
    foreach(Decl d; cairo_t_delcs)
    {
        debug_str ~= 
                format("#[%s][%s][%s]\n", d.name, d.ret, d.args);
                //format("alias da_%s = %s function(%s) nothrow;", d.name, d.ret, d.args);
    }
    //assert(0, debug_str);
    {
        auto d=cairo_pattern_decls[19];
        //assert(0, format("#[%s][%s][%s]\n", d.name, d.ret, d.args));
    }
    */

    return 
        decls_manual
        ~ toDecls(import("cairo_t.h"))
        ~ toDecls(import("cairo_path.h"))
        ~ toDecls(import("cairo_pattern.h"))
        ~ toDecls(import("cairo_regions.h"))
        ~ toDecls(import("cairo_transformations.h"))
        ~ toDecls(import("cairo_text.h"))
        ~ toDecls(import("cairo_raster_sources.h"))
        ~ toDecls(import("cairo_font_face.h"))
        ~ toDecls(import("cairo_scaled_font.h"))
        ~ toDecls(import("cairo_font_options.h"))
        //~ toDecls(import("cairo_freetype_fonts.h"))
        ~ toDecls(import("cairo_device.h"))
        ;
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

