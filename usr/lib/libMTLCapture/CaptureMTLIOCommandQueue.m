@interface CaptureMTLIOCommandQueue
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIOCommandQueue)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLIOCommandQueue)baseObject;
- (NSString)description;
- (NSString)label;
- (id)commandBuffer;
- (id)commandBufferWithUnretainedReferences;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)globalTraceObjectID;
- (unint64_t)streamReference;
- (void)barrier;
- (void)dealloc;
- (void)enqueueBarrier;
- (void)setLabel:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLIOCommandQueue

- (CaptureMTLIOCommandQueue)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLIOCommandQueue;
  v9 = -[CaptureMTLIOCommandQueue init](&v15, "init");
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

- (unint64_t)globalTraceObjectID
{
  return (unint64_t)-[MTLIOCommandQueueSPI globalTraceObjectID](self->_baseObject, "globalTraceObjectID");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLIOCommandQueueSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15307;
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
  v10 = -[CaptureMTLIOCommandQueue traceStream](self, "traceStream");
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

- (MTLIOCommandQueue)baseObject
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLIOCommandQueue;
  uint64_t v3 = -[CaptureMTLIOCommandQueue description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLIOCommandQueueSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLIOCommandQueueSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

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
  return (NSString *)-[MTLIOCommandQueueSPI label](self->_baseObject, "label");
}

- (void)barrier
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15334;
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
  objc_super v8 = -[CaptureMTLIOCommandQueue traceStream](self, "traceStream");
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

- (id)commandBuffer
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  v25 = traceContext;
  uint64_t v26 = 0LL;
  uint64_t v27 = 0LL;
  unint64_t v28 = v5;
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  uint64_t v29 = v8;
  char v30 = *((_BYTE *)v6 + 8);
  __int16 v31 = 16400;
  int v32 = 0;
  char v33 = 0;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLIOCommandQueueSPI commandBuffer](self->_baseObject, "commandBuffer"));
  if (v10) {
    uint64_t v11 = -[CaptureMTLIOCommandBuffer initWithBaseObject:captureIOCommandQueue:]( objc_alloc(&OBJC_CLASS___CaptureMTLIOCommandBuffer),  "initWithBaseObject:captureIOCommandQueue:",  v10,  self);
  }
  else {
    uint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)-[CaptureMTLIOCommandBuffer traceStream](v11, "traceStream"));
  uint64_t v12 = v27;
  *(_DWORD *)(v27 + 8) = -15333;
  char v13 = v31;
  if (v31 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v26 + 24);
    uint64_t v16 = HIBYTE(v31);
    ++HIBYTE(v31);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v28, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v31);
    LOBYTE(v31) = v31 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  unsigned __int8 v17 = -[CaptureMTLIOCommandQueue traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v19 = -[CaptureMTLIOCommandBuffer traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  unsigned __int8 __src = -[CaptureMTLIOCommandBuffer isCapturing](v11, "isCapturing");
  char v21 = GTTraceEncoder_storeBytes((uint64_t)&v25, &__src, 1uLL);
  uint64_t v22 = v27;
  *(_BYTE *)(v27 + 14) = v21;
  *uint64_t v7 = v29;
  *((_BYTE *)v7 + 8) = v30;
  *(_BYTE *)(v22 + 15) |= 8u;

  return v11;
}

- (id)commandBufferWithUnretainedReferences
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  v25 = traceContext;
  uint64_t v26 = 0LL;
  uint64_t v27 = 0LL;
  unint64_t v28 = v5;
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  uint64_t v29 = v8;
  char v30 = *((_BYTE *)v6 + 8);
  __int16 v31 = 16400;
  int v32 = 0;
  char v33 = 0;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTLIOCommandQueueSPI commandBufferWithUnretainedReferences]( self->_baseObject,  "commandBufferWithUnretainedReferences"));
  if (v10) {
    uint64_t v11 = -[CaptureMTLIOCommandBuffer initWithBaseObject:captureIOCommandQueue:]( objc_alloc(&OBJC_CLASS___CaptureMTLIOCommandBuffer),  "initWithBaseObject:captureIOCommandQueue:",  v10,  self);
  }
  else {
    uint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)-[CaptureMTLIOCommandBuffer traceStream](v11, "traceStream"));
  uint64_t v12 = v27;
  *(_DWORD *)(v27 + 8) = -15306;
  char v13 = v31;
  if (v31 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v26 + 24);
    uint64_t v16 = HIBYTE(v31);
    ++HIBYTE(v31);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v28, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v31);
    LOBYTE(v31) = v31 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  unsigned __int8 v17 = -[CaptureMTLIOCommandQueue traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v19 = -[CaptureMTLIOCommandBuffer traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  unsigned __int8 __src = -[CaptureMTLIOCommandBuffer isCapturing](v11, "isCapturing");
  char v21 = GTTraceEncoder_storeBytes((uint64_t)&v25, &__src, 1uLL);
  uint64_t v22 = v27;
  *(_BYTE *)(v27 + 14) = v21;
  *uint64_t v7 = v29;
  *((_BYTE *)v7 + 8) = v30;
  *(_BYTE *)(v22 + 15) |= 8u;

  return v11;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15332;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    unint64_t v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    unint64_t v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLIOCommandQueue traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLIOCommandQueue;
  -[CaptureMTLIOCommandQueue dealloc](&v12, "dealloc");
}

- (void)enqueueBarrier
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15291;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    unint64_t v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    unint64_t v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLIOCommandQueue traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unint64_t v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
}

- (void).cxx_destruct
{
}

@end