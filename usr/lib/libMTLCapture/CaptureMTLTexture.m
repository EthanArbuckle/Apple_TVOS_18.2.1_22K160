@interface CaptureMTLTexture
- ($14D77461FF5D83CAEC4252578BA76F85)swizzle;
- (BOOL)allowGPUOptimizedContents;
- (BOOL)canGenerateMipmapLevels;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isCompressed;
- (BOOL)isDrawable;
- (BOOL)isFramebufferOnly;
- (BOOL)isPurgeable;
- (BOOL)isShareable;
- (BOOL)isSparse;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureBuffer:(id)a4;
- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureHeap:(id)a4;
- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureTexture:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)buffer;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLResource)rootResource;
- (MTLResourceID)gpuResourceID;
- (MTLTexture)baseObject;
- (MTLTexture)parentTexture;
- (NSString)description;
- (NSString)label;
- (__IOSurface)iosurface;
- (id)_quicklookData;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newSharedTextureHandle;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8;
- (id)originalObject;
- (int)responsibleProcess;
- (int64_t)compressionFeedback;
- (int64_t)compressionType;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)arrayLength;
- (unint64_t)bufferBytesPerRow;
- (unint64_t)bufferOffset;
- (unint64_t)colorSpaceConversionMatrix;
- (unint64_t)compressionFootprint;
- (unint64_t)cpuCacheMode;
- (unint64_t)depth;
- (unint64_t)firstMipmapInTail;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)height;
- (unint64_t)iosurfacePlane;
- (unint64_t)mipmapLevelCount;
- (unint64_t)numFaces;
- (unint64_t)parentRelativeLevel;
- (unint64_t)parentRelativeSlice;
- (unint64_t)pixelFormat;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)rotation;
- (unint64_t)sampleCount;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)sparseSurfaceDefaultValue;
- (unint64_t)storageMode;
- (unint64_t)streamReference;
- (unint64_t)tailSize;
- (unint64_t)tailSizeInBytes;
- (unint64_t)textureType;
- (unint64_t)unfilteredResourceOptions;
- (unint64_t)uniqueIdentifier;
- (unint64_t)usage;
- (unint64_t)width;
- (unsigned)swizzleKey;
- (void)dealloc;
- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6;
- (void)makeAliasable;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)touch;
- (void)waitUntilComplete;
@end

@implementation CaptureMTLTexture

- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLTexture;
  v9 = -[CaptureMTLTexture init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v11,  (unint64_t)v13,  (unint64_t)v10);
  }

  return v10;
}

- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureHeap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CaptureMTLTexture;
  v9 = -[CaptureMTLTexture init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    objc_storeStrong((id *)&v10->_captureHeap, a4);
    v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    id v14 = DEVICEOBJECT(v7);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v13,  (unint64_t)v15,  (unint64_t)v10);

    [v8 usedSize];
    [v8 currentAllocatedSize];
  }

  return v10;
}

- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CaptureMTLTexture;
  v9 = -[CaptureMTLTexture init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 heap]);
    captureHeap = v10->_captureHeap;
    v10->_captureHeap = (MTLHeap *)v13;

    objc_storeStrong((id *)&v10->_captureRootResource, a4);
    objc_super v15 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v15;
    id v16 = DEVICEOBJECT(v7);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v15,  (unint64_t)v17,  (unint64_t)v10);
  }

  return v10;
}

- (CaptureMTLTexture)initWithBaseObject:(id)a3 captureTexture:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CaptureMTLTexture;
  v9 = -[CaptureMTLTexture init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (MTLDevice *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 heap]);
    captureHeap = v10->_captureHeap;
    v10->_captureHeap = (MTLHeap *)v13;

    objc_storeStrong((id *)&v10->_captureRootResource, a4);
    objc_super v15 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v15;
    id v16 = DEVICEOBJECT(v7);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v15,  (unint64_t)v17,  (unint64_t)v10);
  }

  return v10;
}

- (void)dealloc
{
  baseObject = self->_baseObject;
  self->_baseObject = 0LL;

  -[MTLHeap usedSize](self->_captureHeap, "usedSize");
  -[MTLHeap currentAllocatedSize](self->_captureHeap, "currentAllocatedSize");
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  uint64_t v4 = v16;
  *(_DWORD *)(v16 + 8) = -16238;
  unsigned __int8 v5 = v19;
  if (v19 > 0x38uLL)
  {
    uint64_t v7 = *(void *)(v15 + 24);
    uint64_t v8 = v20++;
    v6 = GTTraceMemPool_allocateBytes(v7, v17, v8 | 0x800000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    v6 = (char *)(v4 + v19);
    v19 += 8;
  }

  *(_BYTE *)(v4 + 13) = v5;
  v9 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v6 = var0;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CaptureMTLTexture;
  -[CaptureMTLTexture dealloc](&v13, "dealloc");
}

- (MTLTexture)baseObject
{
  return self->_baseObject;
}

- (MTLBuffer)buffer
{
  if (-[MTLResource conformsToProtocol:]( self->_captureRootResource,  "conformsToProtocol:",  &OBJC_PROTOCOL___MTLBuffer)) {
    captureRootResource = self->_captureRootResource;
  }
  else {
    captureRootResource = 0LL;
  }
  return captureRootResource;
}

- (MTLHeap)heap
{
  return self->_captureHeap;
}

- (MTLTexture)parentTexture
{
  if (-[MTLResource conformsToProtocol:]( self->_captureRootResource,  "conformsToProtocol:",  &OBJC_PROTOCOL___MTLTexture)) {
    captureRootResource = self->_captureRootResource;
  }
  else {
    captureRootResource = 0LL;
  }
  return captureRootResource;
}

- (MTLResource)rootResource
{
  return self->_captureRootResource;
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v17 = atomic_load(p_var1);
    while (1)
    {
      unint64_t v18 = __ldaxr(p_var1);
      if (v18 != v17) {
        break;
      }
      if (__stlxr(v17 | 2, p_var1)) {
        goto LABEL_7;
      }
      int v19 = 1;
LABEL_8:
      unint64_t v17 = v18;
      if (v19) {
        goto LABEL_9;
      }
    }

    __clrex();
LABEL_7:
    int v19 = 0;
    goto LABEL_8;
  }

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v13 = atomic_load(p_var1);
    while (1)
    {
      unint64_t v14 = __ldaxr(p_var1);
      if (v14 != v13) {
        break;
      }
      if (__stlxr(v13 | 2, p_var1)) {
        goto LABEL_7;
      }
      int v15 = 1;
LABEL_8:
      unint64_t v13 = v14;
      if (v15) {
        goto LABEL_9;
      }
    }

    __clrex();
LABEL_7:
    int v15 = 0;
    goto LABEL_8;
  }

- (id)newSharedTextureHandle
{
  id v3 = -[MTLTextureSPI newSharedTextureHandle](self->_baseObject, "newSharedTextureHandle");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -15910;
  unsigned __int8 v5 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v7 = *(void *)(v14[1] + 24LL);
    uint64_t v8 = v19++;
    v6 = GTTraceMemPool_allocateBytes(v7, v16, v8 | 0x1000000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    v6 = (char *)(v4 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v4 + 13) = v5;
  v9 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v6 = var0;
  *((void *)v6 + 1) = v3;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  return v3;
}

- (id)formattedDescription:(unint64_t)a3
{
  return -[MTLTextureSPI formattedDescription:](self->_baseObject, "formattedDescription:", a3);
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8
{
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_var1 = &traceStream[1].var1;
    unint64_t v17 = atomic_load(p_var1);
    while (1)
    {
      unint64_t v18 = __ldaxr(p_var1);
      if (v18 != v17) {
        break;
      }
      if (__stlxr(v17 | 1, p_var1)) {
        goto LABEL_7;
      }
      int v19 = 1;
LABEL_8:
      unint64_t v17 = v18;
      if (v19) {
        goto LABEL_9;
      }
    }

    __clrex();
LABEL_7:
    int v19 = 0;
    goto LABEL_8;
  }

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
  traceStream = self->_traceStream;
  if (traceStream)
  {
    p_unint64_t var1 = &traceStream[1].var1;
    unint64_t v13 = atomic_load(p_var1);
    while (1)
    {
      unint64_t v14 = __ldaxr(p_var1);
      if (v14 != v13) {
        break;
      }
      if (__stlxr(v13 | 1, p_var1)) {
        goto LABEL_7;
      }
      int v15 = 1;
LABEL_8:
      unint64_t v13 = v14;
      if (v15) {
        goto LABEL_9;
      }
    }

    __clrex();
LABEL_7:
    int v15 = 0;
    goto LABEL_8;
  }

- (unint64_t)tailSize
{
  return (unint64_t)-[MTLTextureSPI tailSizeInBytes](self->_baseObject, "tailSizeInBytes");
}

- (BOOL)isShareable
{
  return -[MTLTextureSPI isShareable](self->_baseObject, "isShareable");
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    p_unint64_t var1 = &traceStream[1].var1;
    unint64_t v5 = atomic_load(&traceStream[1].var1);
    while (1)
    {
      unint64_t v6 = __ldaxr(p_var1);
      if (v6 != v5) {
        break;
      }
      if (__stlxr(v5 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0LL, p_var1)) {
        goto LABEL_7;
      }
      int v7 = 1;
LABEL_8:
      unint64_t v5 = v6;
      if (v7) {
        return;
      }
    }

    __clrex();
LABEL_7:
    int v7 = 0;
    goto LABEL_8;
  }

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0LL;
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLTexture;
  uint64_t v3 = -[CaptureMTLTexture description](&v8, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLTextureSPI description](self->_baseObject, "description"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ -> %@", v4, v5));

  return (NSString *)v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  uint64_t v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLTextureSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLTextureSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (unint64_t)allocationID
{
  return (unint64_t)-[MTLTextureSPI allocationID](self->_baseObject, "allocationID");
}

- (BOOL)allowGPUOptimizedContents
{
  return -[MTLTextureSPI allowGPUOptimizedContents](self->_baseObject, "allowGPUOptimizedContents");
}

- (unint64_t)arrayLength
{
  return (unint64_t)-[MTLTextureSPI arrayLength](self->_baseObject, "arrayLength");
}

- (unint64_t)bufferBytesPerRow
{
  return (unint64_t)-[MTLTextureSPI bufferBytesPerRow](self->_baseObject, "bufferBytesPerRow");
}

- (unint64_t)bufferOffset
{
  return (unint64_t)-[MTLTextureSPI bufferOffset](self->_baseObject, "bufferOffset");
}

- (unint64_t)colorSpaceConversionMatrix
{
  return (unint64_t)-[MTLTextureSPI colorSpaceConversionMatrix](self->_baseObject, "colorSpaceConversionMatrix");
}

- (int64_t)compressionFeedback
{
  return (int64_t)-[MTLTextureSPI compressionFeedback](self->_baseObject, "compressionFeedback");
}

- (unint64_t)compressionFootprint
{
  return (unint64_t)-[MTLTextureSPI compressionFootprint](self->_baseObject, "compressionFootprint");
}

- (int64_t)compressionType
{
  return (int64_t)-[MTLTextureSPI compressionType](self->_baseObject, "compressionType");
}

- (unint64_t)cpuCacheMode
{
  return (unint64_t)-[MTLTextureSPI cpuCacheMode](self->_baseObject, "cpuCacheMode");
}

- (unint64_t)depth
{
  return (unint64_t)-[MTLTextureSPI depth](self->_baseObject, "depth");
}

- (MTLDevice)device
{
  return self->_captureDevice;
}

- (unint64_t)firstMipmapInTail
{
  return (unint64_t)-[MTLTextureSPI firstMipmapInTail](self->_baseObject, "firstMipmapInTail");
}

- (BOOL)isFramebufferOnly
{
  return -[MTLTextureSPI isFramebufferOnly](self->_baseObject, "isFramebufferOnly");
}

- (unint64_t)gpuAddress
{
  return (unint64_t)-[MTLTextureSPI gpuAddress](self->_baseObject, "gpuAddress");
}

- (unint64_t)gpuHandle
{
  return (unint64_t)-[MTLTextureSPI gpuHandle](self->_baseObject, "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLTextureSPI gpuResourceID](self->_baseObject, "gpuResourceID");
}

- (unint64_t)hazardTrackingMode
{
  return (unint64_t)-[MTLTextureSPI hazardTrackingMode](self->_baseObject, "hazardTrackingMode");
}

- (unint64_t)heapOffset
{
  return (unint64_t)-[MTLTextureSPI heapOffset](self->_baseObject, "heapOffset");
}

- (unint64_t)height
{
  return (unint64_t)-[MTLTextureSPI height](self->_baseObject, "height");
}

- (__IOSurface)iosurface
{
  return (__IOSurface *)-[MTLTextureSPI iosurface](self->_baseObject, "iosurface");
}

- (unint64_t)iosurfacePlane
{
  return (unint64_t)-[MTLTextureSPI iosurfacePlane](self->_baseObject, "iosurfacePlane");
}

- (BOOL)isCompressed
{
  return -[MTLTextureSPI isCompressed](self->_baseObject, "isCompressed");
}

- (BOOL)isDrawable
{
  return -[MTLTextureSPI isDrawable](self->_baseObject, "isDrawable");
}

- (BOOL)isSparse
{
  return -[MTLTextureSPI isSparse](self->_baseObject, "isSparse");
}

- (NSString)label
{
  return (NSString *)-[MTLTextureSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLTextureSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16240;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    int v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    int v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  v10 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v12 = v4;
  id v13 = [v12 UTF8String];
  if (v13)
  {
    id v14 = v12;
    id v15 = [v14 UTF8String];
    size_t v16 = strlen((const char *)[v14 UTF8String]);
    LOBYTE(v13) = GTTraceEncoder_storeBytes((uint64_t)v19, v15, v16 + 1);
  }

  *(void *)int v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (unint64_t)mipmapLevelCount
{
  return (unint64_t)-[MTLTextureSPI mipmapLevelCount](self->_baseObject, "mipmapLevelCount");
}

- (unint64_t)numFaces
{
  return (unint64_t)-[MTLTextureSPI numFaces](self->_baseObject, "numFaces");
}

- (unint64_t)parentRelativeLevel
{
  return (unint64_t)-[MTLTextureSPI parentRelativeLevel](self->_baseObject, "parentRelativeLevel");
}

- (unint64_t)parentRelativeSlice
{
  return (unint64_t)-[MTLTextureSPI parentRelativeSlice](self->_baseObject, "parentRelativeSlice");
}

- (unint64_t)pixelFormat
{
  return (unint64_t)-[MTLTextureSPI pixelFormat](self->_baseObject, "pixelFormat");
}

- (unint64_t)resourceIndex
{
  return (unint64_t)-[MTLTextureSPI resourceIndex](self->_baseObject, "resourceIndex");
}

- (unint64_t)resourceOptions
{
  return (unint64_t)-[MTLTextureSPI resourceOptions](self->_baseObject, "resourceOptions");
}

- (int)responsibleProcess
{
  return -[MTLTextureSPI responsibleProcess](self->_baseObject, "responsibleProcess");
}

- (void)setResponsibleProcess:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLTextureSPI setResponsibleProcess:](self->_baseObject, "setResponsibleProcess:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16239;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    int v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    int v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  v10 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)int v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (unint64_t)rotation
{
  return (unint64_t)-[MTLTextureSPI rotation](self->_baseObject, "rotation");
}

- (unint64_t)sampleCount
{
  return (unint64_t)-[MTLTextureSPI sampleCount](self->_baseObject, "sampleCount");
}

- (unint64_t)sparseSurfaceDefaultValue
{
  return (unint64_t)-[MTLTextureSPI sparseSurfaceDefaultValue](self->_baseObject, "sparseSurfaceDefaultValue");
}

- (unint64_t)storageMode
{
  return (unint64_t)-[MTLTextureSPI storageMode](self->_baseObject, "storageMode");
}

- ($14D77461FF5D83CAEC4252578BA76F85)swizzle
{
  return ($14D77461FF5D83CAEC4252578BA76F85)-[MTLTextureSPI swizzle](self->_baseObject, "swizzle");
}

- (unsigned)swizzleKey
{
  return -[MTLTextureSPI swizzleKey](self->_baseObject, "swizzleKey");
}

- (unint64_t)tailSizeInBytes
{
  return (unint64_t)-[MTLTextureSPI tailSizeInBytes](self->_baseObject, "tailSizeInBytes");
}

- (unint64_t)textureType
{
  return (unint64_t)-[MTLTextureSPI textureType](self->_baseObject, "textureType");
}

- (unint64_t)unfilteredResourceOptions
{
  return (unint64_t)-[MTLTextureSPI unfilteredResourceOptions](self->_baseObject, "unfilteredResourceOptions");
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)-[MTLTextureSPI uniqueIdentifier](self->_baseObject, "uniqueIdentifier");
}

- (unint64_t)usage
{
  return (unint64_t)-[MTLTextureSPI usage](self->_baseObject, "usage");
}

- (unint64_t)width
{
  return (unint64_t)-[MTLTextureSPI width](self->_baseObject, "width");
}

- (BOOL)canGenerateMipmapLevels
{
  return -[MTLTextureSPI canGenerateMipmapLevels](self->_baseObject, "canGenerateMipmapLevels");
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, a2);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v9 = (char *)&v15 - v8;
  if (v10)
  {
    uint64_t v11 = (uint64_t *)((char *)&v15 - v8);
    unint64_t v12 = a4;
    do
    {
      uint64_t v13 = (void *)*a3++;
      *v11++ = [v13 baseObject];
      --v12;
    }

    while (v12);
  }

  return -[MTLTextureSPI doesAliasAllResources:count:]( baseObject,  "doesAliasAllResources:count:",  v9,  a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(self, a2);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v9 = (char *)&v15 - v8;
  if (v10)
  {
    uint64_t v11 = (uint64_t *)((char *)&v15 - v8);
    unint64_t v12 = a4;
    do
    {
      uint64_t v13 = (void *)*a3++;
      *v11++ = [v13 baseObject];
      --v12;
    }

    while (v12);
  }

  return -[MTLTextureSPI doesAliasAnyResources:count:]( baseObject,  "doesAliasAnyResources:count:",  v9,  a4);
}

- (BOOL)doesAliasResource:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  LOBYTE(baseObject) = -[MTLTextureSPI doesAliasResource:](baseObject, "doesAliasResource:", v4);

  return (char)baseObject;
}

- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4
{
}

- (BOOL)isAliasable
{
  unsigned int v3 = -[MTLTextureSPI isAliasable](self->_baseObject, "isAliasable");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16108;
  unsigned __int8 v5 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v7 = *(void *)(v14[1] + 24LL);
    uint64_t v8 = v19++;
    unsigned __int8 v6 = GTTraceMemPool_allocateBytes(v7, v16, v8 | 0x1000000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    unsigned __int8 v6 = (char *)(v4 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v4 + 13) = v5;
  uint64_t v9 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  return v3;
}

- (BOOL)isComplete
{
  return -[MTLTextureSPI isComplete](self->_baseObject, "isComplete");
}

- (BOOL)isPurgeable
{
  unsigned int v3 = -[MTLTextureSPI isPurgeable](self->_baseObject, "isPurgeable");
  uint64_t v4 = v15;
  *(_DWORD *)(v15 + 8) = -16231;
  unsigned __int8 v5 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v7 = *(void *)(v14[1] + 24LL);
    uint64_t v8 = v19++;
    unsigned __int8 v6 = GTTraceMemPool_allocateBytes(v7, v16, v8 | 0x1000000000LL) + 16;
    unsigned __int8 v5 = v8;
  }

  else
  {
    unsigned __int8 v6 = (char *)(v4 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v4 + 13) = v5;
  uint64_t v9 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v9) {
    unint64_t var0 = v9->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v6 = var0;
  *((_DWORD *)v6 + 2) = v3;
  *((_DWORD *)v6 + 3) = 0;
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  return v3;
}

- (void)makeAliasable
{
  if (!qword_23A440)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v12);
    -[MTLTextureSPI makeAliasable](self->_baseObject, "makeAliasable");
    -[MTLHeap usedSize](self->_captureHeap, "usedSize");
    -[MTLHeap currentAllocatedSize](self->_captureHeap, "currentAllocatedSize");
    uint64_t v3 = v13;
    *(_DWORD *)(v13 + 8) = -16114;
    unsigned __int8 v4 = v16;
    if (v16 > 0x38uLL)
    {
      uint64_t v6 = *(void *)(v12[1] + 24LL);
      uint64_t v7 = v17++;
      unsigned __int8 v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
      unsigned __int8 v4 = v7;
    }

    else
    {
      unsigned __int8 v5 = (char *)(v3 + v16);
      v16 += 8;
    }

    *(_BYTE *)(v3 + 13) = v4;
    uint64_t v8 = -[CaptureMTLTexture traceStream](self, "traceStream");
    if (v8) {
      unint64_t var0 = v8->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    *(void *)unsigned __int8 v5 = var0;
    s();
    *(void *)uint64_t v10 = v11;
    *(_BYTE *)(v10 + 8) = v15;
    *(_BYTE *)(v13 + 15) |= 8u;
  }

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  id v7 = -[MTLTextureSPI newCompressedTextureViewWithPixelFormat:textureType:level:slice:]( self->_baseObject,  "newCompressedTextureViewWithPixelFormat:textureType:level:slice:",  a3,  a4,  a5,  a6);
  if (v7) {
    uint64_t v8 = -[CaptureMTLTexture initWithBaseObject:captureTexture:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureTexture:",  v7,  self);
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unsigned __int8 v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v28 = v10;
  char v29 = *((_BYTE *)v8 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  id v12 = -[MTLTextureSPI newTextureViewWithPixelFormat:](self->_baseObject, "newTextureViewWithPixelFormat:", a3);
  if (v12) {
    uint64_t v13 = -[CaptureMTLTexture initWithBaseObject:captureTexture:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureTexture:",  v12,  self);
  }
  else {
    uint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLTexture traceStream](v13, "traceStream"));
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -16233;
  char v15 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v25 + 24);
    uint64_t v18 = HIBYTE(v30);
    ++HIBYTE(v30);
    unsigned __int8 v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    unsigned __int8 v16 = (char *)(v14 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  SaveMTLTextureInfo((uint64_t)&v24, v12);
  unsigned __int8 v19 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = -[CaptureMTLTexture traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)unsigned __int8 v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v26 = traceContext;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v30 = v12;
  char v31 = *((_BYTE *)v10 + 8);
  __int16 v32 = 16400;
  int v33 = 0;
  char v34 = 0;
  id v14 = -[MTLTextureSPI newTextureViewWithPixelFormat:resourceIndex:]( self->_baseObject,  "newTextureViewWithPixelFormat:resourceIndex:",  a3,  a4);
  if (v14) {
    char v15 = -[CaptureMTLTexture initWithBaseObject:captureTexture:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureTexture:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLTexture traceStream](v15, "traceStream"));
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15690;
  char v17 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v27 + 24);
    uint64_t v20 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v32);
    LOBYTE(v32) = v32 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  SaveMTLTextureInfo((uint64_t)&v26, v14);
  uint64_t v21 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v23 = -[CaptureMTLTexture traceStream](v15, "traceStream");
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0LL;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a3;
  *((void *)v18 + 3) = a4;
  uint64_t *v11 = v30;
  *((_BYTE *)v11 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  NSUInteger location = a5.location;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  char v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v12;
  s();
  id v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v38 = v15;
  char v39 = *((_BYTE *)v13 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  uint64_t v31 = v17;
  uint64_t v32 = v18;
  uint64_t v33 = v19;
  id v20 = -[MTLTextureSPI newTextureViewWithPixelFormat:textureType:levels:slices:]( self->_baseObject,  "newTextureViewWithPixelFormat:textureType:levels:slices:",  a3,  a4,  location);
  if (v20) {
    uint64_t v21 = -[CaptureMTLTexture initWithBaseObject:captureTexture:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureTexture:",  v20,  self);
  }
  else {
    uint64_t v21 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)-[CaptureMTLTexture traceStream](v21, "traceStream"));
  unint64_t v22 = (char *)v36;
  *(_DWORD *)(v36 + 8) = -16196;
  if ((_BYTE)v40)
  {
    uint64_t v23 = *(void *)(v35 + 24);
    uint64_t v24 = HIBYTE(v40);
    ++HIBYTE(v40);
    uint64_t v25 = GTTraceMemPool_allocateBytes(v23, v37, v24 | 0x4000000000LL) + 16;
  }

  else
  {
    LOBYTE(v24) = 0;
    LOBYTE(v40) = 64;
    uint64_t v25 = v22;
  }

  v22[13] = v24;
  SaveMTLTextureInfo((uint64_t)&v34, v20);
  uint64_t v26 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v28 = -[CaptureMTLTexture traceStream](v21, "traceStream");
  if (v28) {
    unint64_t v29 = v28->var0;
  }
  else {
    unint64_t v29 = 0LL;
  }
  *(void *)uint64_t v25 = var0;
  *((void *)v25 + 1) = v29;
  *((void *)v25 + 2) = a3;
  *((void *)v25 + 3) = a4;
  *((void *)v25 + 4) = location;
  *((void *)v25 + 5) = v31;
  *((void *)v25 + 6) = v32;
  *((void *)v25 + 7) = v33;
  *id v14 = v38;
  *((_BYTE *)v14 + 8) = v39;
  *(_BYTE *)(v36 + 15) |= 8u;

  return v21;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  uint64_t v36 = traceContext;
  uint64_t v37 = 0LL;
  uint64_t v38 = 0LL;
  unint64_t v39 = v12;
  s();
  id v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v40 = v15;
  char v41 = *((_BYTE *)v13 + 8);
  __int16 v42 = 16400;
  int v43 = 0;
  char v44 = 0;
  uint64_t v32 = v17;
  uint64_t v33 = v18;
  uint64_t v34 = v19;
  uint64_t v35 = v20;
  id v21 = -[MTLTextureSPI newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:]( self->_baseObject,  "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:",  a3,  a4,  a7);
  if (v21) {
    unint64_t v22 = -[CaptureMTLTexture initWithBaseObject:captureTexture:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureTexture:",  v21,  self);
  }
  else {
    unint64_t v22 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v36, (uint64_t)-[CaptureMTLTexture traceStream](v22, "traceStream"));
  uint64_t v23 = v38;
  *(_DWORD *)(v38 + 8) = -15689;
  uint64_t v24 = *(void *)(v37 + 24);
  uint64_t v25 = HIBYTE(v42);
  ++HIBYTE(v42);
  Bytes = GTTraceMemPool_allocateBytes(v24, v39, v25 | 0x4800000000LL);
  *(_BYTE *)(v23 + 13) = v25;
  SaveMTLTextureInfo((uint64_t)&v36, v21);
  uint64_t v27 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v29 = -[CaptureMTLTexture traceStream](v22, "traceStream");
  if (v29) {
    unint64_t v30 = v29->var0;
  }
  else {
    unint64_t v30 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v30;
  *((void *)Bytes + 4) = a3;
  *((void *)Bytes + 5) = a4;
  *((void *)Bytes + 6) = v32;
  *((void *)Bytes + 7) = v33;
  *((void *)Bytes + 8) = v34;
  *((void *)Bytes + 9) = v35;
  *((void *)Bytes + 10) = a7;
  *id v14 = v40;
  *((_BYTE *)v14 + 8) = v41;
  *(_BYTE *)(v38 + 15) |= 8u;

  return v22;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  uint64_t v36 = traceContext;
  uint64_t v37 = 0LL;
  uint64_t v38 = 0LL;
  unint64_t v39 = v12;
  s();
  id v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v40 = v15;
  char v41 = *((_BYTE *)v13 + 8);
  __int16 v42 = 16400;
  int v43 = 0;
  char v44 = 0;
  uint64_t v32 = v17;
  uint64_t v33 = v18;
  uint64_t v34 = v19;
  uint64_t v35 = v20;
  id v21 = -[MTLTextureSPI newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:]( self->_baseObject,  "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:",  a3,  a4,  *(unsigned int *)&a7);
  if (v21) {
    unint64_t v22 = -[CaptureMTLTexture initWithBaseObject:captureTexture:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureTexture:",  v21,  self);
  }
  else {
    unint64_t v22 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v36, (uint64_t)-[CaptureMTLTexture traceStream](v22, "traceStream"));
  uint64_t v23 = v38;
  *(_DWORD *)(v38 + 8) = -15775;
  uint64_t v24 = *(void *)(v37 + 24);
  uint64_t v25 = HIBYTE(v42);
  ++HIBYTE(v42);
  Bytes = GTTraceMemPool_allocateBytes(v24, v39, v25 | 0x4800000000LL);
  *(_BYTE *)(v23 + 13) = v25;
  SaveMTLTextureInfo((uint64_t)&v36, v21);
  uint64_t v27 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v29 = -[CaptureMTLTexture traceStream](v22, "traceStream");
  if (v29) {
    unint64_t v30 = v29->var0;
  }
  else {
    unint64_t v30 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v30;
  *((void *)Bytes + 4) = a3;
  *((void *)Bytes + 5) = a4;
  *((void *)Bytes + 6) = v32;
  *((void *)Bytes + 7) = v33;
  *((void *)Bytes + 8) = v34;
  *((void *)Bytes + 9) = v35;
  *(($14D77461FF5D83CAEC4252578BA76F85 *)Bytes + 20) = a7;
  *((_DWORD *)Bytes + 21) = 0;
  *id v14 = v40;
  *((_BYTE *)v14 + 8) = v41;
  *(_BYTE *)(v38 + 15) |= 8u;

  return v22;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  uint64_t v40 = traceContext;
  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  unint64_t v43 = v12;
  s();
  id v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v44 = v15;
  char v45 = *((_BYTE *)v13 + 8);
  __int16 v46 = 16400;
  int v47 = 0;
  char v48 = 0;
  uint64_t v35 = v18;
  uint64_t v36 = v17;
  uint64_t v37 = v19;
  uint64_t v38 = v20;
  uint64_t v39 = v21;
  uint64_t v23 = v22;
  id v24 = -[MTLTextureSPI newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:]( self->_baseObject,  "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:",  a3,  *(unsigned int *)&a7,  v18);
  if (v24) {
    uint64_t v25 = -[CaptureMTLTexture initWithBaseObject:captureTexture:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureTexture:",  v24,  self);
  }
  else {
    uint64_t v25 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v40, (uint64_t)-[CaptureMTLTexture traceStream](v25, "traceStream"));
  uint64_t v26 = v42;
  *(_DWORD *)(v42 + 8) = -15688;
  uint64_t v27 = *(void *)(v41 + 24);
  uint64_t v28 = HIBYTE(v46);
  ++HIBYTE(v46);
  Bytes = GTTraceMemPool_allocateBytes(v27, v43, v28 | 0x5000000000LL);
  *(_BYTE *)(v26 + 13) = v28;
  SaveMTLTextureInfo((uint64_t)&v40, v24);
  unint64_t v30 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v30) {
    unint64_t var0 = v30->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v32 = -[CaptureMTLTexture traceStream](v25, "traceStream");
  if (v32) {
    unint64_t v33 = v32->var0;
  }
  else {
    unint64_t v33 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v33;
  *((void *)Bytes + 4) = a3;
  *((void *)Bytes + 5) = v36;
  *((void *)Bytes + 6) = v37;
  *((void *)Bytes + 7) = v38;
  *((void *)Bytes + 8) = v39;
  *((void *)Bytes + 9) = v23;
  *((void *)Bytes + 10) = v35;
  *(($14D77461FF5D83CAEC4252578BA76F85 *)Bytes + 22) = a7;
  *((_DWORD *)Bytes + 23) = 0;
  *id v14 = v44;
  *((_BYTE *)v14 + 8) = v45;
  *(_BYTE *)(v42 + 15) |= 8u;

  return v25;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  id v5 = -[MTLTextureSPI setPurgeableState:](self->_baseObject, "setPurgeableState:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16232;
  unsigned __int8 v7 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v9 = *(void *)(v16[1] + 24LL);
    uint64_t v10 = v21++;
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, v18, v10 | 0x1800000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    uint64_t v8 = (char *)(v6 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLTexture traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- (void)waitUntilComplete
{
}

- (id)_quicklookData
{
  return GTMTLQL_EncodeTexture((uint64_t)self->_traceContext, self);
}

- (void).cxx_destruct
{
}

@end