@interface CaptureMTLParallelRenderCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLCommandBuffer)commandBuffer;
- (CaptureMTLParallelRenderCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLParallelRenderCommandEncoder)baseObject;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (id)renderCommandEncoder;
- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setDepthStoreActionOptions:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setStencilStoreActionOptions:(unint64_t)a3;
- (void)touch;
@end

@implementation CaptureMTLParallelRenderCommandEncoder

- (MTLParallelRenderCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLCommandBuffer)commandBuffer
{
  return (CaptureMTLCommandBuffer *)objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
}

- (CaptureMTLParallelRenderCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CaptureMTLParallelRenderCommandEncoder;
  v9 = -[CaptureMTLParallelRenderCommandEncoder init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    id v14 = DEVICEOBJECT(v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openEncoderStream( (uint64_t)v13,  (unint64_t)v15,  *((void *)[v8 traceStream] + 3));

    objc_storeWeak((id *)&v10->_captureCommandBuffer, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 retainedObjects]);
    id v17 = DEVICEOBJECT(v10->_baseObject);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v16 addObject:v18];
  }

  return v10;
}

- (id)renderCommandEncoder
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v5;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v32 = v8;
  char v33 = *((_BYTE *)v6 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLParallelRenderCommandEncoderSPI renderCommandEncoder](self->_baseObject, "renderCommandEncoder"));
  if (v10) {
    uint64_t v11 = -[CaptureMTLRenderCommandEncoder initWithBaseObject:captureParallelRenderCommandEncoder:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderCommandEncoder),  "initWithBaseObject:captureParallelRenderCommandEncoder:",  v10,  self);
  }
  else {
    uint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLRenderCommandEncoder traceStream](v11, "traceStream"));
  uint64_t v12 = v30;
  *(_DWORD *)(v30 + 8) = -16286;
  char v13 = v34;
  if (v34 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v29 + 24);
    uint64_t v16 = HIBYTE(v34);
    ++HIBYTE(v34);
    id v14 = GTTraceMemPool_allocateBytes(v15, v31, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v34);
    LOBYTE(v34) = v34 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  id v17 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v19 = -[CaptureMTLRenderCommandEncoder traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  traceStream = self->_traceStream;
  *(_BYTE *)(v30 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v22 = v30;
  __int128 v23 = *(_OWORD *)(v30 + 16);
  __int128 v25 = *(_OWORD *)(v30 + 32);
  __int128 v24 = *(_OWORD *)(v30 + 48);
  _OWORD *v26 = *(_OWORD *)v30;
  v26[1] = v23;
  v26[2] = v25;
  v26[3] = v24;
  *id v7 = v32;
  *((_BYTE *)v7 + 8) = v33;
  *(_BYTE *)(v22 + 15) |= 8u;

  return v11;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLParallelRenderCommandEncoder;
  uint64_t v3 = -[CaptureMTLParallelRenderCommandEncoder description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLParallelRenderCommandEncoderSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLParallelRenderCommandEncoderSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

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

- (NSString)label
{
  return (NSString *)-[MTLParallelRenderCommandEncoderSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLParallelRenderCommandEncoderSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16288;
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
  v10 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16287;
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
  uint64_t v8 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLParallelRenderCommandEncoder;
  -[CaptureMTLParallelRenderCommandEncoder dealloc](&v12, "dealloc");
}

- (void)endEncoding
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16285;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    uint64_t v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
}

- (void)insertDebugSignpost:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLParallelRenderCommandEncoderSPI insertDebugSignpost:](self->_baseObject, "insertDebugSignpost:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16284;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
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

  *(void *)uint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)popDebugGroup
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16282;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    uint64_t v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLParallelRenderCommandEncoderSPI pushDebugGroup:](self->_baseObject, "pushDebugGroup:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16283;
  unsigned __int8 v6 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
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

  *(void *)uint64_t v7 = var0;
  v7[8] = (char)v13;
  *(_DWORD *)(v7 + 9) = 0;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  return -[MTLParallelRenderCommandEncoderSPI sampledRenderCommandEncoderWithProgramInfoBuffer:capacity:]( self->_baseObject,  "sampledRenderCommandEncoderWithProgramInfoBuffer:capacity:",  a3,  a4);
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16162;
  unsigned __int8 v8 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v10 = *(void *)(v16[1] + 24LL);
    uint64_t v11 = v21++;
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, v18, v11 | 0x1800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    uint64_t v9 = (char *)(v7 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v7 + 13) = v8;
  id v12 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16028;
  unsigned __int8 v8 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v10 = *(void *)(v16[1] + 24LL);
    uint64_t v11 = v21++;
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, v18, v11 | 0x1800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    uint64_t v9 = (char *)(v7 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v7 + 13) = v8;
  id v12 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16161;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16027;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16160;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16026;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLParallelRenderCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void).cxx_destruct
{
}

@end