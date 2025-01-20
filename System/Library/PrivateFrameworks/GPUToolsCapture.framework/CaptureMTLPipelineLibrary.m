@interface CaptureMTLPipelineLibrary
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)disableRunTimeCompilation;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLPipelineLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLPipelineCache)functionCache;
- (MTLPipelineCache)pipelineCache;
- (MTLPipelineLibrary)baseObject;
- (NSArray)metallibPaths;
- (NSArray)pipelineNames;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)setDisableRunTimeCompilation:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLPipelineLibrary

- (CaptureMTLPipelineLibrary)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CaptureMTLPipelineLibrary;
  v9 = -[CaptureMTLPipelineLibrary init](&v16, "init");
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

    Class v14 = NSClassFromString(@"MTLDebugPipelineLibrary");
    v10->_isBaseObjectDebugDevice = objc_opt_isKindOfClass(v7, v14) & 1;
  }

  return v10;
}

- (MTLPipelineLibrary)baseObject
{
  return self->_baseObject;
}

- (id)newComputePipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  baseObject = self->_baseObject;
  unint64_t v44 = a4;
  if (self->_isBaseObjectDebugDevice) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = 65539LL;
  }
  id v59 = 0LL;
  id v12 = -[MTLPipelineLibrarySPI newComputePipelineStateWithName:options:reflection:error:]( baseObject,  "newComputePipelineStateWithName:options:reflection:error:",  v9,  v11,  &v59,  a6);
  id v13 = v59;
  v47 = v12;
  if (v12) {
    v48 = -[CaptureMTLComputePipelineState initWithBaseObject:capturePipelineLibrary:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputePipelineState),  "initWithBaseObject:capturePipelineLibrary:",  v12,  self);
  }
  else {
    v48 = 0LL;
  }
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v16 = __ldaxr(p_var2);
  while (__stlxr(v16 + 1, p_var2));
  v50 = traceContext;
  uint64_t v51 = 0LL;
  uint64_t v52 = 0LL;
  unint64_t v53 = v16;
  s();
  v18 = v17;
  uint64_t v19 = *v17;
  uint64_t *v17 = v20;
  uint64_t v54 = v19;
  char v55 = *((_BYTE *)v17 + 8);
  __int16 v56 = 16400;
  int v57 = 0;
  char v58 = 0;
  GTTraceEncoder_setStream((uint64_t *)&v50, (uint64_t)-[CaptureMTLComputePipelineState traceStream](v48, "traceStream"));
  uint64_t v21 = v52;
  *(_DWORD *)(v52 + 8) = -15740;
  char v22 = v56;
  if (v56 > 0x18uLL)
  {
    uint64_t v24 = *(void *)(v51 + 24);
    uint64_t v25 = HIBYTE(v56);
    ++HIBYTE(v56);
    v23 = GTTraceMemPool_allocateBytes(v24, v53, v25 | 0x2800000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    v23 = (char *)(v21 + v56);
    LOBYTE(v56) = v56 + 40;
  }

  *(_BYTE *)(v21 + 13) = v22;
  SaveMTLComputePipelineReflection((uint64_t)&v50, v47, v13, 0LL, 0LL);
  v26 = -[CaptureMTLPipelineLibrary traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v28 = -[CaptureMTLComputePipelineState traceStream](v48, "traceStream");
  if (v28) {
    unint64_t v29 = v28->var0;
  }
  else {
    unint64_t v29 = 0LL;
  }
  v45 = v13;
  if (a6) {
    id v30 = *a6;
  }
  else {
    id v30 = 0LL;
  }
  v43 = a6;
  id v31 = v9;
  id v32 = [v31 UTF8String];
  if (v32)
  {
    id v33 = v31;
    unint64_t v34 = var0;
    id v35 = [v33 UTF8String];
    size_t v36 = strlen((const char *)[v33 UTF8String]);
    v37 = v35;
    unint64_t var0 = v34;
    LOBYTE(v32) = GTTraceEncoder_storeBytes((uint64_t)&v50, v37, v36 + 1);
  }

  *(void *)v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = v44;
  *((void *)v23 + 3) = v30;
  v23[32] = (char)v32;
  *(_DWORD *)(v23 + 33) = 0;
  *((_DWORD *)v23 + 9) = 0;
  if (v44)
  {
    id v38 = v45;
    if (a5)
    {
      if ((~(_BYTE)v44 & 3) != 0 && !self->_isBaseObjectDebugDevice)
      {
        id v39 = DEVICEOBJECT(self->_baseObject);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        id v49 = v45;
        id v41 = [v40 newComputePipelineStateWithName:v31 options:v44 reflection:&v49 error:v43];
        id v38 = v49;
      }

      id v38 = v38;
      *a5 = v38;
    }
  }

  else
  {
    id v38 = v45;
  }

  uint64_t *v18 = v54;
  *((_BYTE *)v18 + 8) = v55;
  *(_BYTE *)(v52 + 15) |= 8u;

  return v48;
}

- (id)newRenderPipelineStateWithName:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  baseObject = self->_baseObject;
  unint64_t v44 = a4;
  if (self->_isBaseObjectDebugDevice) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = 65539LL;
  }
  id v59 = 0LL;
  id v12 = -[MTLPipelineLibrarySPI newRenderPipelineStateWithName:options:reflection:error:]( baseObject,  "newRenderPipelineStateWithName:options:reflection:error:",  v9,  v11,  &v59,  a6);
  id v13 = v59;
  v47 = v12;
  if (v12) {
    v48 = -[CaptureMTLRenderPipelineState initWithBaseObject:capturePipelineLibrary:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:capturePipelineLibrary:",  v12,  self);
  }
  else {
    v48 = 0LL;
  }
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v16 = __ldaxr(p_var2);
  while (__stlxr(v16 + 1, p_var2));
  v50 = traceContext;
  uint64_t v51 = 0LL;
  uint64_t v52 = 0LL;
  unint64_t v53 = v16;
  s();
  v18 = v17;
  uint64_t v19 = *v17;
  uint64_t *v17 = v20;
  uint64_t v54 = v19;
  char v55 = *((_BYTE *)v17 + 8);
  __int16 v56 = 16400;
  int v57 = 0;
  char v58 = 0;
  GTTraceEncoder_setStream((uint64_t *)&v50, (uint64_t)-[CaptureMTLRenderPipelineState traceStream](v48, "traceStream"));
  uint64_t v21 = v52;
  *(_DWORD *)(v52 + 8) = -15738;
  char v22 = v56;
  if (v56 > 0x18uLL)
  {
    uint64_t v24 = *(void *)(v51 + 24);
    uint64_t v25 = HIBYTE(v56);
    ++HIBYTE(v56);
    v23 = GTTraceMemPool_allocateBytes(v24, v53, v25 | 0x2800000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    v23 = (char *)(v21 + v56);
    LOBYTE(v56) = v56 + 40;
  }

  *(_BYTE *)(v21 + 13) = v22;
  SaveMTLRenderPipelineReflection((uint64_t)&v50, v47, v13, 0LL);
  v26 = -[CaptureMTLPipelineLibrary traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v28 = -[CaptureMTLRenderPipelineState traceStream](v48, "traceStream");
  if (v28) {
    unint64_t v29 = v28->var0;
  }
  else {
    unint64_t v29 = 0LL;
  }
  v45 = v13;
  if (a6) {
    id v30 = *a6;
  }
  else {
    id v30 = 0LL;
  }
  v43 = a6;
  id v31 = v9;
  id v32 = [v31 UTF8String];
  if (v32)
  {
    id v33 = v31;
    unint64_t v34 = var0;
    id v35 = [v33 UTF8String];
    size_t v36 = strlen((const char *)[v33 UTF8String]);
    v37 = v35;
    unint64_t var0 = v34;
    LOBYTE(v32) = GTTraceEncoder_storeBytes((uint64_t)&v50, v37, v36 + 1);
  }

  *(void *)v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = v44;
  *((void *)v23 + 3) = v30;
  v23[32] = (char)v32;
  *(_DWORD *)(v23 + 33) = 0;
  *((_DWORD *)v23 + 9) = 0;
  if (v44)
  {
    id v38 = v45;
    if (a5)
    {
      if ((~(_BYTE)v44 & 3) != 0 && !self->_isBaseObjectDebugDevice)
      {
        id v39 = DEVICEOBJECT(self->_baseObject);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        id v49 = v45;
        id v41 = [v40 newRenderPipelineStateWithName:v31 options:v44 reflection:&v49 error:v43];
        id v38 = v49;
      }

      id v38 = v38;
      *a5 = v38;
    }
  }

  else
  {
    id v38 = v45;
  }

  uint64_t *v18 = v54;
  *((_BYTE *)v18 + 8) = v55;
  *(_BYTE *)(v52 + 15) |= 8u;

  return v48;
}

- (id)newComputePipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  return -[MTLPipelineLibrarySPI newComputePipelineDescriptorWithName:error:]( self->_baseObject,  "newComputePipelineDescriptorWithName:error:",  a3,  a4);
}

- (id)newRenderPipelineDescriptorWithName:(id)a3 error:(id *)a4
{
  return -[MTLPipelineLibrarySPI newRenderPipelineDescriptorWithName:error:]( self->_baseObject,  "newRenderPipelineDescriptorWithName:error:",  a3,  a4);
}

- (void)setDisableRunTimeCompilation:(BOOL)a3
{
  BOOL v3 = a3;
  -[MTLPipelineLibrarySPI setDisableRunTimeCompilation:](self->_baseObject, "setDisableRunTimeCompilation:");
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15744;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    id v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    id v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  v10 = -[CaptureMTLPipelineLibrary traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  -[MTLPipelineLibrarySPI setLabel:](self->_baseObject, "setLabel:", v4);
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15743;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    id v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    id v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  v10 = -[CaptureMTLPipelineLibrary traceStream](self, "traceStream");
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

  *(void *)id v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLPipelineLibrary;
  uint64_t v3 = -[CaptureMTLPipelineLibrary description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLPipelineLibrarySPI description](self->_baseObject, "description"));
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
  id v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLPipelineLibrarySPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

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

- (BOOL)disableRunTimeCompilation
{
  return -[MTLPipelineLibrarySPI disableRunTimeCompilation]( self->_baseObject,  "disableRunTimeCompilation");
}

- (MTLPipelineCache)functionCache
{
  return (MTLPipelineCache *)-[MTLPipelineLibrarySPI functionCache](self->_baseObject, "functionCache");
}

- (NSString)label
{
  return (NSString *)-[MTLPipelineLibrarySPI label](self->_baseObject, "label");
}

- (NSArray)metallibPaths
{
  return (NSArray *)-[MTLPipelineLibrarySPI metallibPaths](self->_baseObject, "metallibPaths");
}

- (MTLPipelineCache)pipelineCache
{
  return (MTLPipelineCache *)-[MTLPipelineLibrarySPI pipelineCache](self->_baseObject, "pipelineCache");
}

- (NSArray)pipelineNames
{
  return (NSArray *)-[MTLPipelineLibrarySPI pipelineNames](self->_baseObject, "pipelineNames");
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15742;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    unsigned __int8 v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    unsigned __int8 v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  objc_super v8 = -[CaptureMTLPipelineLibrary traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLPipelineLibrary;
  -[CaptureMTLPipelineLibrary dealloc](&v12, "dealloc");
}

- (void).cxx_destruct
{
}

@end