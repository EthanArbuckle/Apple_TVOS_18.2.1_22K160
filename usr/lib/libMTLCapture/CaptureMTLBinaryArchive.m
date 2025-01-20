@interface CaptureMTLBinaryArchive
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5;
- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)enumerateArchivesFromBackingFile:(id)a3;
- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)storeComputePipelineDescriptor:(id)a3;
- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3;
- (BOOL)storeRenderPipelineDescriptor:(id)a3;
- (BOOL)storeTileRenderPipelineDescriptor:(id)a3;
- (CaptureMTLBinaryArchive)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBinaryArchive)baseObject;
- (MTLDevice)device;
- (MTLPipelineCollection)pipelineCollection;
- (NSArray)keys;
- (NSString)description;
- (NSString)label;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)options;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLBinaryArchive

- (CaptureMTLBinaryArchive)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLBinaryArchive;
  v9 = -[CaptureMTLBinaryArchive init](&v15, "init");
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

- (MTLBinaryArchive)baseObject
{
  return self->_baseObject;
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
    p_var1 = &traceStream[1].var1;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLBinaryArchive;
  uint64_t v3 = -[CaptureMTLBinaryArchive description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveSPI description](self->_baseObject, "description"));
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
  v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLBinaryArchiveSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (NSArray)keys
{
  return (NSArray *)-[MTLBinaryArchiveSPI keys](self->_baseObject, "keys");
}

- (NSString)label
{
  return (NSString *)-[MTLBinaryArchiveSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLBinaryArchiveSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15668;
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
  v10 = -[CaptureMTLBinaryArchive traceStream](self, "traceStream");
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

- (unint64_t)options
{
  return (unint64_t)-[MTLBinaryArchiveSPI options](self->_baseObject, "options");
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v24);
  baseObject = self->_baseObject;
  id v9 = unwrapMTLComputePipelineDescriptor(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned int v11 = -[MTLBinaryArchiveSPI addComputePipelineFunctionsWithDescriptor:error:]( baseObject,  "addComputePipelineFunctionsWithDescriptor:error:",  v10,  a4);

  uint64_t v12 = v25;
  *(_DWORD *)(v25 + 8) = -15666;
  unsigned __int8 v13 = v28;
  if (v28 > 0x28uLL)
  {
    uint64_t v15 = *(void *)(v24[1] + 24LL);
    uint64_t v16 = v29++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v26, v16 | 0x1800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v28);
    v28 += 24;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLBinaryArchive traceStream](self, "traceStream");
  if (!v17)
  {
    unint64_t var0 = 0LL;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    id v19 = 0LL;
    goto LABEL_9;
  }

  unint64_t var0 = v17->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  id v19 = *a4;
LABEL_9:
  char v20 = SaveMTLComputePipelineDescriptor((uint64_t)v24, v7);

  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v19;
  *((_DWORD *)v14 + 4) = v11;
  v14[20] = v20;
  *(_WORD *)(v14 + 21) = 0;
  v14[23] = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v27;
  *(_BYTE *)(v25 + 15) |= 8u;
  return v11;
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_addComputePipelineFunctionsWithDescriptor_options_error",  (uint64_t)"Binary Archives SPI",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v10 = unwrapMTLComputePipelineDescriptor(v8);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  LOBYTE(a5) = -[MTLBinaryArchiveSPI addComputePipelineFunctionsWithDescriptor:options:error:]( baseObject,  "addComputePipelineFunctionsWithDescriptor:options:error:",  v11,  a4,  a5);
  return (char)a5;
}

- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_addFunctionWithDescriptor_library_error",  (uint64_t)"Binary Linking",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v11 = unwrapMTLFunctionDescriptor(v9);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  LOBYTE(a5) = -[MTLBinaryArchiveSPI addFunctionWithDescriptor:library:error:]( baseObject,  "addFunctionWithDescriptor:library:error:",  v12,  v13,  a5);

  return (char)a5;
}

- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v24);
  baseObject = self->_baseObject;
  id v9 = unwrapMTLStitchedLibraryDescriptor(v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned int v11 = -[MTLBinaryArchiveSPI addLibraryWithDescriptor:error:]( baseObject,  "addLibraryWithDescriptor:error:",  v10,  a4);

  uint64_t v12 = v25;
  *(_DWORD *)(v25 + 8) = -15426;
  unsigned __int8 v13 = v28;
  if (v28 > 0x28uLL)
  {
    uint64_t v15 = *(void *)(v24[1] + 24LL);
    uint64_t v16 = v29++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v26, v16 | 0x1800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v28);
    v28 += 24;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLBinaryArchive traceStream](self, "traceStream");
  if (!v17)
  {
    unint64_t var0 = 0LL;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    id v19 = 0LL;
    goto LABEL_9;
  }

  unint64_t var0 = v17->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  id v19 = *a4;
LABEL_9:
  char v20 = SaveMTLStitchedLibraryDescriptor((uint64_t)v24, v7);

  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v19;
  *((_DWORD *)v14 + 4) = v11;
  v14[20] = v20;
  *(_WORD *)(v14 + 21) = 0;
  v14[23] = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v27;
  *(_BYTE *)(v25 + 15) |= 8u;
  return v11;
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_addMeshRenderPipelineFunctionsWithDescriptor_error",  (uint64_t)"Mesh Shaders with Binary Archives",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v8 = unwrapMTLMeshRenderPipelineDescriptor(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  LOBYTE(a4) = -[MTLBinaryArchiveSPI addMeshRenderPipelineFunctionsWithDescriptor:error:]( baseObject,  "addMeshRenderPipelineFunctionsWithDescriptor:error:",  v9,  a4);
  return (char)a4;
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_addMeshRenderPipelineFunctionsWithDescriptor_options_error",  (uint64_t)"Mesh Shaders with Binary Archives",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v10 = unwrapMTLMeshRenderPipelineDescriptor(v8);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  LOBYTE(a5) = -[MTLBinaryArchiveSPI addMeshRenderPipelineFunctionsWithDescriptor:options:error:]( baseObject,  "addMeshRenderPipelineFunctionsWithDescriptor:options:error:",  v11,  a4,  a5);
  return (char)a5;
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v24);
  baseObject = self->_baseObject;
  id v9 = unwrapMTLRenderPipelineDescriptor(v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned int v11 = -[MTLBinaryArchiveSPI addRenderPipelineFunctionsWithDescriptor:error:]( baseObject,  "addRenderPipelineFunctionsWithDescriptor:error:",  v10,  a4);

  uint64_t v12 = v25;
  *(_DWORD *)(v25 + 8) = -15665;
  unsigned __int8 v13 = v28;
  if (v28 > 0x28uLL)
  {
    uint64_t v15 = *(void *)(v24[1] + 24LL);
    uint64_t v16 = v29++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v26, v16 | 0x1800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v28);
    v28 += 24;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLBinaryArchive traceStream](self, "traceStream");
  if (!v17)
  {
    unint64_t var0 = 0LL;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    id v19 = 0LL;
    goto LABEL_9;
  }

  unint64_t var0 = v17->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  id v19 = *a4;
LABEL_9:
  char v20 = SaveMTLRenderPipelineDescriptor((uint64_t)v24, v7);

  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v19;
  *((_DWORD *)v14 + 4) = v11;
  v14[20] = v20;
  *(_WORD *)(v14 + 21) = 0;
  v14[23] = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v27;
  *(_BYTE *)(v25 + 15) |= 8u;
  return v11;
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_addRenderPipelineFunctionsWithDescriptor_options_error",  (uint64_t)"Binary Archives SPI",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v10 = unwrapMTLRenderPipelineDescriptor(v8);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  LOBYTE(a5) = -[MTLBinaryArchiveSPI addRenderPipelineFunctionsWithDescriptor:options:error:]( baseObject,  "addRenderPipelineFunctionsWithDescriptor:options:error:",  v11,  a4,  a5);
  return (char)a5;
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  traceContext = self->_traceContext;
  id v7 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v24);
  baseObject = self->_baseObject;
  id v9 = unwrapMTLTileRenderPipelineDescriptor(v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned int v11 = -[MTLBinaryArchiveSPI addTileRenderPipelineFunctionsWithDescriptor:error:]( baseObject,  "addTileRenderPipelineFunctionsWithDescriptor:error:",  v10,  a4);

  uint64_t v12 = v25;
  *(_DWORD *)(v25 + 8) = -15664;
  unsigned __int8 v13 = v28;
  if (v28 > 0x28uLL)
  {
    uint64_t v15 = *(void *)(v24[1] + 24LL);
    uint64_t v16 = v29++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v26, v16 | 0x1800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v28);
    v28 += 24;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLBinaryArchive traceStream](self, "traceStream");
  if (!v17)
  {
    unint64_t var0 = 0LL;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    id v19 = 0LL;
    goto LABEL_9;
  }

  unint64_t var0 = v17->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  id v19 = *a4;
LABEL_9:
  char v20 = SaveMTLTileRenderPipelineDescriptor((uint64_t)v24, v7);

  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v19;
  *((_DWORD *)v14 + 4) = v11;
  v14[20] = v20;
  *(_WORD *)(v14 + 21) = 0;
  v14[23] = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v27;
  *(_BYTE *)(v25 + 15) |= 8u;
  return v11;
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_addTileRenderPipelineFunctionsWithDescriptor_options_error",  (uint64_t)"Binary Archives SPI",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v10 = unwrapMTLTileRenderPipelineDescriptor(v8);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  LOBYTE(a5) = -[MTLBinaryArchiveSPI addTileRenderPipelineFunctionsWithDescriptor:options:error:]( baseObject,  "addTileRenderPipelineFunctionsWithDescriptor:options:error:",  v11,  a4,  a5);
  return (char)a5;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15685;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    uint64_t v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  id v8 = -[CaptureMTLBinaryArchive traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLBinaryArchive;
  -[CaptureMTLBinaryArchive dealloc](&v12, "dealloc");
}

- (BOOL)enumerateArchivesFromBackingFile:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_enumerateArchivesFromBackingFile",  (uint64_t)"Binary Linking",  0LL,  0LL);
  LOBYTE(self) = -[MTLBinaryArchiveSPI enumerateArchivesFromBackingFile:]( self->_baseObject,  "enumerateArchivesFromBackingFile:",  v4);

  return (char)self;
}

- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_enumerateArchivesFromPipelineCollection",  (uint64_t)"Binary Linking",  0LL,  0LL);
  LOBYTE(self) = -[MTLBinaryArchiveSPI enumerateArchivesFromPipelineCollection:]( self->_baseObject,  "enumerateArchivesFromPipelineCollection:",  v4);

  return (char)self;
}

- (id)formattedDescription:(unint64_t)a3
{
  return -[MTLBinaryArchiveSPI formattedDescription:](self->_baseObject, "formattedDescription:", a3);
}

- (MTLPipelineCollection)pipelineCollection
{
  return (MTLPipelineCollection *)-[MTLBinaryArchiveSPI pipelineCollection](self->_baseObject, "pipelineCollection");
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return -[MTLBinaryArchiveSPI serializeToURL:error:]( self->_baseObject,  "serializeToURL:error:",  a3,  a4);
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_serializeToURL_options_error",  (uint64_t)"Binary Archives SPI",  0LL,  0LL);
  LOBYTE(a5) = -[MTLBinaryArchiveSPI serializeToURL:options:error:]( self->_baseObject,  "serializeToURL:options:error:",  v8,  a4,  a5);

  return (char)a5;
}

- (BOOL)storeComputePipelineDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_storeComputePipelineDescriptor",  (uint64_t)"Binary Linking",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v6 = unwrapMTLComputePipelineDescriptor(v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  LOBYTE(baseObject) = -[MTLBinaryArchiveSPI storeComputePipelineDescriptor:]( baseObject,  "storeComputePipelineDescriptor:",  v7);
  return (char)baseObject;
}

- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_storeMeshRenderPipelineDescriptor",  (uint64_t)"Mesh Shaders with Binary Archives",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v6 = unwrapMTLMeshRenderPipelineDescriptor(v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  LOBYTE(baseObject) = -[MTLBinaryArchiveSPI storeMeshRenderPipelineDescriptor:]( baseObject,  "storeMeshRenderPipelineDescriptor:",  v7);
  return (char)baseObject;
}

- (BOOL)storeRenderPipelineDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_storeRenderPipelineDescriptor",  (uint64_t)"Binary Linking",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v6 = unwrapMTLRenderPipelineDescriptor(v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  LOBYTE(baseObject) = -[MTLBinaryArchiveSPI storeRenderPipelineDescriptor:]( baseObject,  "storeRenderPipelineDescriptor:",  v7);
  return (char)baseObject;
}

- (BOOL)storeTileRenderPipelineDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLBinaryArchive_storeTileRenderPipelineDescriptor",  (uint64_t)"Binary Linking",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v6 = unwrapMTLTileRenderPipelineDescriptor(v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  LOBYTE(baseObject) = -[MTLBinaryArchiveSPI storeTileRenderPipelineDescriptor:]( baseObject,  "storeTileRenderPipelineDescriptor:",  v7);
  return (char)baseObject;
}

- (void).cxx_destruct
{
}

@end