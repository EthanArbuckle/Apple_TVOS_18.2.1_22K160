@interface CaptureMTLDynamicLibrary
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)shaderValidationEnabled;
- (CaptureMTLDynamicLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLDynamicLibrary)baseObject;
- (MTLLibrary)parentLibrary;
- (NSArray)relocations;
- (NSString)description;
- (NSString)label;
- (NSString)libraryPath;
- (OS_dispatch_data)binaryData;
- (id)formattedDescription:(unint64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)setParentLibrary:(id)a3;
- (void)setRelocations:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLDynamicLibrary

- (CaptureMTLDynamicLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLDynamicLibrary;
  v9 = -[CaptureMTLDynamicLibrary init](&v15, "init");
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

- (MTLDynamicLibrary)baseObject
{
  return self->_baseObject;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v24);
  unsigned int v7 = -[MTLDynamicLibrarySPI serializeToURL:error:](self->_baseObject, "serializeToURL:error:", v6, a4);
  uint64_t v8 = v25;
  *(_DWORD *)(v25 + 8) = -15674;
  unsigned __int8 v9 = v28;
  if (v28 > 0x28uLL)
  {
    uint64_t v11 = *(void *)(v24[1] + 24LL);
    uint64_t v12 = v29++;
    v10 = GTTraceMemPool_allocateBytes(v11, v26, v12 | 0x1800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    v10 = (char *)(v8 + v28);
    v28 += 24;
  }

  *(_BYTE *)(v8 + 13) = v9;
  v13 = -[CaptureMTLDynamicLibrary traceStream](self, "traceStream");
  if (v13)
  {
    unint64_t var0 = v13->var0;
    if (a4)
    {
LABEL_6:
      id v15 = *a4;
      goto LABEL_9;
    }
  }

  else
  {
    unint64_t var0 = 0LL;
    if (a4) {
      goto LABEL_6;
    }
  }

  id v15 = 0LL;
LABEL_9:
  id v16 = v6;
  id v17 = [v16 fileSystemRepresentation];
  if (v17)
  {
    id v18 = v16;
    id v19 = [v18 fileSystemRepresentation];
    size_t v20 = strlen((const char *)[v18 fileSystemRepresentation]);
    LOBYTE(v17) = GTTraceEncoder_storeBytes((uint64_t)v24, v19, v20 + 1);
  }

  *(void *)v10 = var0;
  *((void *)v10 + 1) = v15;
  *((_DWORD *)v10 + 4) = v7;
  v10[20] = (char)v17;
  *(_WORD *)(v10 + 21) = 0;
  v10[23] = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v27;
  *(_BYTE *)(v25 + 15) |= 8u;

  return v7;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLDynamicLibrary;
  uint64_t v3 = -[CaptureMTLDynamicLibrary description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLDynamicLibrarySPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLDynamicLibrarySPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (OS_dispatch_data)binaryData
{
  return (OS_dispatch_data *)-[MTLDynamicLibrarySPI binaryData](self->_baseObject, "binaryData");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (NSString)label
{
  return (NSString *)-[MTLDynamicLibrarySPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLDynamicLibrarySPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15676;
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
  v10 = -[CaptureMTLDynamicLibrary traceStream](self, "traceStream");
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

- (NSString)libraryPath
{
  return (NSString *)-[MTLDynamicLibrarySPI libraryPath](self->_baseObject, "libraryPath");
}

- (NSArray)relocations
{
  return (NSArray *)-[MTLDynamicLibrarySPI relocations](self->_baseObject, "relocations");
}

- (void)setRelocations:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDynamicLibrary_setRelocations",  (uint64_t)"Relocations",  0LL,  0LL);
  -[MTLDynamicLibrarySPI setRelocations:](self->_baseObject, "setRelocations:", v4);
}

- (BOOL)shaderValidationEnabled
{
  return -[MTLDynamicLibrarySPI shaderValidationEnabled](self->_baseObject, "shaderValidationEnabled");
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15675;
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
  uint64_t v8 = -[CaptureMTLDynamicLibrary traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLDynamicLibrary;
  -[CaptureMTLDynamicLibrary dealloc](&v12, "dealloc");
}

- (id)formattedDescription:(unint64_t)a3
{
  return -[MTLDynamicLibrarySPI formattedDescription:](self->_baseObject, "formattedDescription:", a3);
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDynamicLibrary_serializeToURL_options_error",  (uint64_t)"Dynamic Libraries",  0LL,  0LL);
  LOBYTE(a5) = -[MTLDynamicLibrarySPI serializeToURL:options:error:]( self->_baseObject,  "serializeToURL:options:error:",  v8,  a4,  a5);

  return (char)a5;
}

- (MTLLibrary)parentLibrary
{
  return self->parentLibrary;
}

- (void)setParentLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end