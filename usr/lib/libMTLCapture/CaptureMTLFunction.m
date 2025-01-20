@interface CaptureMTLFunction
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLFunction)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLFunction)initWithBaseObject:(id)a3 captureLibrary:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLFunction)baseObject;
- (MTLFunctionHandle)functionHandle;
- (MTLLibrary)captureLibrary;
- (MTLType)returnType;
- (NSArray)arguments;
- (NSArray)importedLibraries;
- (NSArray)importedSymbols;
- (NSArray)relocations;
- (NSArray)stageInputAttributes;
- (NSArray)vertexAttributes;
- (NSDictionary)functionConstantsDictionary;
- (NSString)description;
- (NSString)filePath;
- (NSString)label;
- (NSString)name;
- (NSString)unpackedFilePath;
- (const)bitCodeHash;
- (id)bitcodeData;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5;
- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4;
- (id)originalObject;
- (id)reflectionWithOptions:(unint64_t)a3;
- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4;
- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4;
- (int64_t)lineNumber;
- (int64_t)patchControlPointCount;
- (unint64_t)functionType;
- (unint64_t)options;
- (unint64_t)patchType;
- (unint64_t)renderTargetArrayIndexType;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)setRelocations:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLFunction

- (CaptureMTLFunction)initWithBaseObject:(id)a3 captureLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CaptureMTLFunction;
  v9 = -[CaptureMTLFunction init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureLibrary, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    id v14 = DEVICEOBJECT(v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v13,  (unint64_t)v15,  (unint64_t)v10);
  }

  return v10;
}

- (CaptureMTLFunction)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLFunction;
  v9 = -[CaptureMTLFunction init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    objc_storeStrong((id *)&v10->_captureDevice, a4);
    uint64_t v11 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v11;
    id v12 = DEVICEOBJECT(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)v11,  (unint64_t)v13,  (unint64_t)v10);
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16293;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  id v8 = -[CaptureMTLFunction traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLFunction;
  -[CaptureMTLFunction dealloc](&v12, "dealloc");
}

- (MTLFunction)baseObject
{
  return self->_baseObject;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v8 = __ldaxr(p_var2);
  while (__stlxr(v8 + 1, p_var2));
  v25 = traceContext;
  uint64_t v26 = 0LL;
  uint64_t v27 = 0LL;
  unint64_t v28 = v8;
  s();
  uint64_t v10 = v9;
  uint64_t v11 = *v9;
  uint64_t *v9 = v12;
  uint64_t v29 = v11;
  char v30 = *((_BYTE *)v9 + 8);
  __int16 v31 = 16400;
  int v32 = 0;
  char v33 = 0;
  id v13 = -[MTLFunctionSPI newArgumentEncoderWithBufferIndex:reflection:]( self->_baseObject,  "newArgumentEncoderWithBufferIndex:reflection:",  a3);
  if (v13) {
    uint64_t v14 = -[CaptureMTLArgumentEncoder initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLArgumentEncoder),  "initWithBaseObject:captureDevice:",  v13,  self->_captureDevice);
  }
  else {
    uint64_t v14 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)-[CaptureMTLArgumentEncoder traceStream](v14, "traceStream"));
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -16052;
  char v16 = v31;
  if (v31 > 0x28uLL)
  {
    uint64_t v18 = *(void *)(v26 + 24);
    uint64_t v19 = HIBYTE(v31);
    ++HIBYTE(v31);
    char v17 = GTTraceMemPool_allocateBytes(v18, v28, v19 | 0x1800000000LL) + 16;
    char v16 = v19;
  }

  else
  {
    char v17 = (char *)(v15 + v31);
    LOBYTE(v31) = v31 + 24;
  }

  *(_BYTE *)(v15 + 13) = v16;
  v20 = -[CaptureMTLFunction traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v22 = -[CaptureMTLArgumentEncoder traceStream](v14, "traceStream");
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0LL;
  }
  *(void *)char v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = a3;
  uint64_t *v10 = v29;
  *((_BYTE *)v10 + 8) = v30;
  *(_BYTE *)(v27 + 15) |= 8u;

  return v14;
}

- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = -[MTLFunctionSPI newFunctionWithPluginData:bitcodeType:]( self->_baseObject,  "newFunctionWithPluginData:bitcodeType:",  v6,  v4);
  if (v7)
  {
    unint64_t v8 = -[CaptureMTLFunction initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunction),  "initWithBaseObject:captureDevice:",  v7,  self->_captureDevice);
    traceContext = self->_traceContext;
    -[CaptureMTLFunction traceStream](v8, "traceStream");
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v23);
    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -15830;
    unsigned __int8 v11 = v27;
    if (v27 > 0x28uLL)
    {
      uint64_t v13 = *(void *)(v23[1] + 24LL);
      uint64_t v14 = v28++;
      uint64_t v12 = GTTraceMemPool_allocateBytes(v13, v25, v14 | 0x1800000000LL) + 16;
      unsigned __int8 v11 = v14;
    }

    else
    {
      uint64_t v12 = (char *)(v10 + v27);
      v27 += 24;
    }

    *(_BYTE *)(v10 + 13) = v11;
    SaveMTLFunctionInfo((uint64_t)v23, v7, 0LL);
    uint64_t v15 = -[CaptureMTLFunction traceStream](self, "traceStream");
    if (v15) {
      unint64_t var0 = v15->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    char v17 = -[CaptureMTLFunction traceStream](v8, "traceStream");
    if (v17) {
      unint64_t v18 = v17->var0;
    }
    else {
      unint64_t v18 = 0LL;
    }
    char v19 = SaveNSData((uint64_t)v23, v6);
    *(void *)uint64_t v12 = var0;
    *((void *)v12 + 1) = v18;
    v12[16] = v19;
    v12[17] = v4;
    *((_WORD *)v12 + 9) = 0;
    *((_DWORD *)v12 + 5) = 0;
    s();
    *(void *)uint64_t v20 = v21;
    *(_BYTE *)(v20 + 8) = v26;
    *(_BYTE *)(v24 + 15) |= 8u;
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  return v8;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  baseObject = self->_baseObject;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  id v11 = -[MTLFunctionSPI newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:]( baseObject,  "newArgumentEncoderWithBufferIndex:reflection:pipelineLibrary:",  a3,  a4,  v10);

  if (v11)
  {
    uint64_t v12 = objc_alloc(&OBJC_CLASS___CaptureMTLArgumentEncoder);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLFunction device](self, "device"));
    uint64_t v14 = -[CaptureMTLArgumentEncoder initWithBaseObject:captureDevice:]( v12,  "initWithBaseObject:captureDevice:",  v11,  v13);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v17 = __ldaxr(p_var2);
  while (__stlxr(v17 + 1, p_var2));
  v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v17;
  s();
  char v19 = v18;
  uint64_t v20 = *v18;
  *unint64_t v18 = v21;
  uint64_t v38 = v20;
  char v39 = *((_BYTE *)v18 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)-[CaptureMTLArgumentEncoder traceStream](v14, "traceStream"));
  uint64_t v22 = v36;
  *(_DWORD *)(v36 + 8) = -15714;
  char v23 = v40;
  if (v40 > 0x18uLL)
  {
    uint64_t v25 = *(void *)(v35 + 24);
    uint64_t v26 = HIBYTE(v40);
    ++HIBYTE(v40);
    uint64_t v24 = GTTraceMemPool_allocateBytes(v25, v37, v26 | 0x2800000000LL) + 16;
    char v23 = v26;
  }

  else
  {
    uint64_t v24 = (char *)(v22 + v40);
    LOBYTE(v40) = v40 + 40;
  }

  *(_BYTE *)(v22 + 13) = v23;
  unsigned __int8 v27 = -[CaptureMTLFunction traceStream](self, "traceStream");
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v29 = -[CaptureMTLArgumentEncoder traceStream](v14, "traceStream");
  if (v29) {
    unint64_t v30 = v29->var0;
  }
  else {
    unint64_t v30 = 0LL;
  }
  __int16 v31 = (uint64_t *)[v9 traceStream];

  if (v31) {
    uint64_t v32 = *v31;
  }
  else {
    uint64_t v32 = 0LL;
  }
  *(void *)uint64_t v24 = var0;
  *((void *)v24 + 1) = v30;
  *((void *)v24 + 2) = a3;
  *((void *)v24 + 3) = v32;
  *((void *)v24 + 4) = 0LL;
  *char v19 = v38;
  *((_BYTE *)v19 + 8) = v39;
  *(_BYTE *)(v36 + 15) |= 8u;

  return v14;
}

- (id)reflectionWithOptions:(unint64_t)a3 binaryArchives:(id)a4
{
  id v6 = a4;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLFunction_reflectionWithOptions_binaryArchives",  (uint64_t)"Binary Linking",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v8 = unwrapNSArray(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTLFunctionSPI reflectionWithOptions:binaryArchives:]( baseObject,  "reflectionWithOptions:binaryArchives:",  a3,  v9));
  return v10;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  id v8 = a5;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_reflection_binaryArchives",  (uint64_t)"Binary Linking",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v10 = unwrapNSArray(v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  id v12 = -[MTLFunctionSPI newArgumentEncoderWithBufferIndex:reflection:binaryArchives:]( baseObject,  "newArgumentEncoderWithBufferIndex:reflection:binaryArchives:",  a3,  a4,  v11);
  if (v12)
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___CaptureMTLArgumentEncoder);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLFunction device](self, "device"));
    uint64_t v15 = -[CaptureMTLArgumentEncoder initWithBaseObject:captureDevice:]( v13,  "initWithBaseObject:captureDevice:",  v12,  v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLFunction;
  uint64_t v3 = -[CaptureMTLFunction description](&v8, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLFunctionSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLFunctionSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (NSArray)arguments
{
  return (NSArray *)-[MTLFunctionSPI arguments](self->_baseObject, "arguments");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (NSString)filePath
{
  return (NSString *)-[MTLFunctionSPI filePath](self->_baseObject, "filePath");
}

- (NSDictionary)functionConstantsDictionary
{
  return (NSDictionary *)-[MTLFunctionSPI functionConstantsDictionary](self->_baseObject, "functionConstantsDictionary");
}

- (MTLFunctionHandle)functionHandle
{
  return (MTLFunctionHandle *)-[MTLFunctionSPI functionHandle](self->_baseObject, "functionHandle");
}

- (unint64_t)functionType
{
  return (unint64_t)-[MTLFunctionSPI functionType](self->_baseObject, "functionType");
}

- (NSArray)importedLibraries
{
  return (NSArray *)-[MTLFunctionSPI importedLibraries](self->_baseObject, "importedLibraries");
}

- (NSArray)importedSymbols
{
  return (NSArray *)-[MTLFunctionSPI importedSymbols](self->_baseObject, "importedSymbols");
}

- (NSString)label
{
  return (NSString *)-[MTLFunctionSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLFunctionSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16123;
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
  id v10 = -[CaptureMTLFunction traceStream](self, "traceStream");
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

- (int64_t)lineNumber
{
  return (int64_t)-[MTLFunctionSPI lineNumber](self->_baseObject, "lineNumber");
}

- (NSString)name
{
  return (NSString *)-[MTLFunctionSPI name](self->_baseObject, "name");
}

- (unint64_t)options
{
  return (unint64_t)-[MTLFunctionSPI options](self->_baseObject, "options");
}

- (int64_t)patchControlPointCount
{
  return (int64_t)-[MTLFunctionSPI patchControlPointCount](self->_baseObject, "patchControlPointCount");
}

- (unint64_t)patchType
{
  return (unint64_t)-[MTLFunctionSPI patchType](self->_baseObject, "patchType");
}

- (NSArray)relocations
{
  return (NSArray *)-[MTLFunctionSPI relocations](self->_baseObject, "relocations");
}

- (void)setRelocations:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLFunction_setRelocations",  (uint64_t)"Relocations",  0LL,  0LL);
  -[MTLFunctionSPI setRelocations:](self->_baseObject, "setRelocations:", v4);
}

- (unint64_t)renderTargetArrayIndexType
{
  return (unint64_t)-[MTLFunctionSPI renderTargetArrayIndexType](self->_baseObject, "renderTargetArrayIndexType");
}

- (MTLType)returnType
{
  return (MTLType *)-[MTLFunctionSPI returnType](self->_baseObject, "returnType");
}

- (NSArray)stageInputAttributes
{
  return (NSArray *)-[MTLFunctionSPI stageInputAttributes](self->_baseObject, "stageInputAttributes");
}

- (NSString)unpackedFilePath
{
  return (NSString *)-[MTLFunctionSPI unpackedFilePath](self->_baseObject, "unpackedFilePath");
}

- (NSArray)vertexAttributes
{
  return (NSArray *)-[MTLFunctionSPI vertexAttributes](self->_baseObject, "vertexAttributes");
}

- (const)bitCodeHash
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)-[MTLFunctionSPI bitCodeHash](self->_baseObject, "bitCodeHash");
}

- (id)bitcodeData
{
  return -[MTLFunctionSPI bitcodeData](self->_baseObject, "bitcodeData");
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  uint64_t v26 = traceContext;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v30 = v10;
  char v31 = *((_BYTE *)v8 + 8);
  __int16 v32 = 16400;
  int v33 = 0;
  char v34 = 0;
  id v12 = -[MTLFunctionSPI newArgumentEncoderWithBufferIndex:]( self->_baseObject,  "newArgumentEncoderWithBufferIndex:",  a3);
  if (v12)
  {
    id v13 = objc_alloc(&OBJC_CLASS___CaptureMTLArgumentEncoder);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLFunction device](self, "device"));
    id v15 = -[CaptureMTLArgumentEncoder initWithBaseObject:captureDevice:]( v13,  "initWithBaseObject:captureDevice:",  v12,  v14);
  }

  else
  {
    id v15 = 0LL;
  }

  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLArgumentEncoder traceStream](v15, "traceStream"));
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16052;
  char v17 = v32;
  if (v32 > 0x28uLL)
  {
    uint64_t v19 = *(void *)(v27 + 24);
    uint64_t v20 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x1800000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v32);
    LOBYTE(v32) = v32 + 24;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLFunction traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v23 = -[CaptureMTLArgumentEncoder traceStream](v15, "traceStream");
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0LL;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a3;
  uint64_t *v9 = v30;
  *((_BYTE *)v9 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  id v6 = a4;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  __int16 v32 = traceContext;
  uint64_t v33 = 0LL;
  uint64_t v34 = 0LL;
  unint64_t v35 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v36 = v12;
  char v37 = *((_BYTE *)v10 + 8);
  __int16 v38 = 16400;
  int v39 = 0;
  char v40 = 0;
  baseObject = self->_baseObject;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  id v16 = -[MTLFunctionSPI newArgumentEncoderWithBufferIndex:pipelineLibrary:]( baseObject,  "newArgumentEncoderWithBufferIndex:pipelineLibrary:",  a3,  v15);

  if (v16)
  {
    char v17 = objc_alloc(&OBJC_CLASS___CaptureMTLArgumentEncoder);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLFunction device](self, "device"));
    uint64_t v19 = -[CaptureMTLArgumentEncoder initWithBaseObject:captureDevice:]( v17,  "initWithBaseObject:captureDevice:",  v16,  v18);
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)-[CaptureMTLArgumentEncoder traceStream](v19, "traceStream"));
  uint64_t v20 = v34;
  *(_DWORD *)(v34 + 8) = -15715;
  char v21 = v38;
  if (v38 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v33 + 24);
    uint64_t v24 = HIBYTE(v38);
    ++HIBYTE(v38);
    char v22 = GTTraceMemPool_allocateBytes(v23, v35, v24 | 0x2000000000LL) + 16;
    char v21 = v24;
  }

  else
  {
    char v22 = (char *)(v20 + v38);
    LOBYTE(v38) = v38 + 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLFunction traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v27 = -[CaptureMTLArgumentEncoder traceStream](v19, "traceStream");
  if (v27) {
    unint64_t v28 = v27->var0;
  }
  else {
    unint64_t v28 = 0LL;
  }
  unint64_t v29 = (uint64_t *)[v6 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  *(void *)char v22 = var0;
  *((void *)v22 + 1) = v28;
  *((void *)v22 + 2) = a3;
  *((void *)v22 + 3) = v30;
  *uint64_t v11 = v36;
  *((_BYTE *)v11 + 8) = v37;
  *(_BYTE *)(v34 + 15) |= 8u;

  return v19;
}

- (id)reflectionWithOptions:(unint64_t)a3
{
  return -[MTLFunctionSPI reflectionWithOptions:](self->_baseObject, "reflectionWithOptions:", a3);
}

- (id)reflectionWithOptions:(unint64_t)a3 pipelineLibrary:(id)a4
{
  baseObject = self->_baseObject;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 baseObject]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTLFunctionSPI reflectionWithOptions:pipelineLibrary:]( baseObject,  "reflectionWithOptions:pipelineLibrary:",  a3,  v6));

  return v7;
}

- (MTLLibrary)captureLibrary
{
  return (MTLLibrary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end