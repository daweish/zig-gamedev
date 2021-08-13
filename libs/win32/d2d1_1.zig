const std = @import("std");
usingnamespace std.os.windows;
usingnamespace @import("misc.zig");
usingnamespace @import("dcommon.zig");
usingnamespace @import("d2d1.zig");
usingnamespace @import("dxgi.zig");

pub const ID2D1Bitmap1 = extern struct {
    const Self = @This();
    v: *const extern struct {
        unknown: IUnknown.VTable(Self),
        resource: ID2D1Resource.VTable(Self),
        image: ID2D1Image.VTable(Self),
        bitmap: ID2D1Bitmap.VTable(Self),
        bitmap1: VTable(Self),
    },
    usingnamespace IUnknown.Methods(Self);
    usingnamespace ID2D1Resource.Methods(Self);
    usingnamespace ID2D1Image.Methods(Self);
    usingnamespace ID2D1Bitmap.Methods(Self);
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        _ = T;
        return extern struct {};
    }

    pub fn VTable(comptime T: type) type {
        _ = T;
        return extern struct {
            GetColorContext: *c_void,
            GetOptions: *c_void,
            GetSurface: *c_void,
            Map: *c_void,
            Unmap: *c_void,
        };
    }
};

pub const ID2D1ColorContext = extern struct {
    const Self = @This();
    v: *const extern struct {
        unknown: IUnknown.VTable(Self),
        resource: ID2D1Resource.VTable(Self),
        colorctx: VTable(Self),
    },
    usingnamespace IUnknown.Methods(Self);
    usingnamespace ID2D1Resource.Methods(Self);
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        _ = T;
        return extern struct {};
    }

    pub fn VTable(comptime T: type) type {
        _ = T;
        return extern struct {
            GetColorSpace: *c_void,
            GetProfileSize: *c_void,
            GetProfile: *c_void,
        };
    }
};

pub const D2D1_DEVICE_CONTEXT_OPTIONS = UINT;
pub const D2D1_DEVICE_CONTEXT_OPTIONS_NONE = 0;
pub const D2D1_DEVICE_CONTEXT_OPTIONS_ENABLE_MULTITHREADED_OPTIMIZATIONS = 0x1;

pub const D2D1_BITMAP_OPTIONS = UINT;
pub const D2D1_BITMAP_OPTIONS_NONE = 0;
pub const D2D1_BITMAP_OPTIONS_TARGET = 0x1;
pub const D2D1_BITMAP_OPTIONS_CANNOT_DRAW = 0x2;
pub const D2D1_BITMAP_OPTIONS_CPU_READ = 0x4;
pub const D2D1_BITMAP_OPTIONS_GDI_COMPATIBLE = 0x8;

pub const D2D1_BITMAP_PROPERTIES1 = extern struct {
    pixelFormat: D2D1_PIXEL_FORMAT,
    dpiX: FLOAT,
    dpiY: FLOAT,
    bitmapOptions: D2D1_BITMAP_OPTIONS,
    colorContext: ?*ID2D1ColorContext,
};

pub const ID2D1DeviceContext = extern struct {
    const Self = @This();
    v: *const extern struct {
        unknown: IUnknown.VTable(Self),
        resource: ID2D1Resource.VTable(Self),
        rendertarget: ID2D1RenderTarget.VTable(Self),
        devctx: VTable(Self),
    },
    usingnamespace IUnknown.Methods(Self);
    usingnamespace ID2D1Resource.Methods(Self);
    usingnamespace ID2D1RenderTarget.Methods(Self);
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return extern struct {
            pub inline fn CreateBitmapFromDxgiSurface(
                self: *T,
                surface: *IDXGISurface,
                properties: ?*const D2D1_BITMAP_PROPERTIES1,
                bitmap: *?*ID2D1Bitmap1,
            ) HRESULT {
                return self.v.devctx.CreateBitmapFromDxgiSurface(self, surface, properties, bitmap);
            }
            pub inline fn SetTarget(self: *T, image: ?*ID2D1Image) void {
                self.v.devctx.SetTarget(self, image);
            }
        };
    }

    pub fn VTable(comptime T: type) type {
        return extern struct {
            CreateBitmap1: *c_void,
            CreateBitmapFromWicBitmap1: *c_void,
            CreateColorContext: *c_void,
            CreateColorContextFromFilename: *c_void,
            CreateColorContextFromWicColorContext: *c_void,
            CreateBitmapFromDxgiSurface: fn (
                *T,
                *IDXGISurface,
                ?*const D2D1_BITMAP_PROPERTIES1,
                *?*ID2D1Bitmap1,
            ) callconv(WINAPI) HRESULT,
            CreateEffect: *c_void,
            CreateGradientStopCollection1: *c_void,
            CreateImageBrush: *c_void,
            CreateBitmapBrush1: *c_void,
            CreateCommandList: *c_void,
            IsDxgiFormatSupported: *c_void,
            IsBufferPrecisionSupported: *c_void,
            GetImageLocalBounds: *c_void,
            GetImageWorldBounds: *c_void,
            GetGlyphRunWorldBounds: *c_void,
            GetDevice: *c_void,
            SetTarget: fn (*T, ?*ID2D1Image) callconv(WINAPI) void,
            GetTarget: *c_void,
            SetRenderingControls: *c_void,
            GetRenderingControls: *c_void,
            SetPrimitiveBlend: *c_void,
            GetPrimitiveBlend: *c_void,
            SetUnitMode: *c_void,
            GetUnitMode: *c_void,
            DrawGlyphRun1: *c_void,
            DrawImage: *c_void,
            DrawGdiMetafile: *c_void,
            DrawBitmap1: *c_void,
            PushLayer1: *c_void,
            InvalidateEffectInputRectangle: *c_void,
            GetEffectInvalidRectangleCount: *c_void,
            GetEffectInvalidRectangles: *c_void,
            GetEffectRequiredInputRectangles: *c_void,
            FillOpacityMask1: *c_void,
        };
    }
};

pub const ID2D1Factory1 = extern struct {
    const Self = @This();
    v: *const extern struct {
        unknown: IUnknown.VTable(Self),
        factory: ID2D1Factory.VTable(Self),
        factory1: VTable(Self),
    },
    usingnamespace IUnknown.Methods(Self);
    usingnamespace ID2D1Factory.Methods(Self);
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        _ = T;
        return extern struct {};
    }

    pub fn VTable(comptime T: type) type {
        _ = T;
        return extern struct {
            CreateDevice: *c_void,
            CreateStrokeStyle1: *c_void,
            CreatePathGeometry1: *c_void,
            CreateDrawingStateBlock1: *c_void,
            CreateGdiMetafile: *c_void,
            RegisterEffectFromStream: *c_void,
            RegisterEffectFromString: *c_void,
            UnregisterEffect: *c_void,
            GetRegisteredEffects: *c_void,
            GetEffectProperties: *c_void,
        };
    }
};

pub const ID2D1Device = extern struct {
    const Self = @This();
    v: *const extern struct {
        unknown: IUnknown.VTable(Self),
        resource: ID2D1Resource.VTable(Self),
        device: VTable(Self),
    },
    usingnamespace IUnknown.Methods(Self);
    usingnamespace ID2D1Resource.Methods(Self);
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        _ = T;
        return extern struct {};
    }

    pub fn VTable(comptime T: type) type {
        _ = T;
        return extern struct {
            CreateDeviceContext: *c_void,
            CreatePrintControl: *c_void,
            SetMaximumTextureMemory: *c_void,
            GetMaximumTextureMemory: *c_void,
            ClearResources: *c_void,
        };
    }
};
