@interface CaptureMTLIndirectComputeCommand
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIndirectComputeCommand)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLIndirectComputeCommand)baseObject;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)clearBarrier;
- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dealloc;
- (void)reset;
- (void)setBarrier;
- (void)setComputePipelineState:(id)a3;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setStageInRegion:(id *)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)touch;
@end

@implementation CaptureMTLIndirectComputeCommand

- (CaptureMTLIndirectComputeCommand)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CaptureMTLIndirectComputeCommand;
  v8 = -[CaptureMTLIndirectComputeCommand init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_baseObject, a3);
    v9->_traceContext = a4;
    id v10 = DEVICEOBJECT(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9->_traceStream = (GTTraceStream *)GTTraceContext_openStream( (uint64_t)a4,  (unint64_t)v11,  (unint64_t)v9);
  }

  return v9;
}

- (MTLIndirectComputeCommand)baseObject
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLIndirectComputeCommand;
  uint64_t v3 = -[CaptureMTLIndirectComputeCommand description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLIndirectComputeCommand description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLIndirectComputeCommand conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (void)clearBarrier
{
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a4;
  -[MTLIndirectComputeCommand concurrentDispatchThreadgroups:threadsPerThreadgroup:]( baseObject,  "concurrentDispatchThreadgroups:threadsPerThreadgroup:",  &v21,  &v20);
  uint64_t v8 = v24;
  *(_DWORD *)(v24 + 8) = -15931;
  unsigned __int8 v9 = v27;
  if (v27 > 8uLL)
  {
    uint64_t v11 = *(void *)(v23 + 24);
    uint64_t v12 = v28++;
    id v10 = GTTraceMemPool_allocateBytes(v11, v25, v12 | 0x3800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    id v10 = (char *)(v8 + v27);
    v27 += 56;
  }

  *(_BYTE *)(v8 + 13) = v9;
  objc_super v13 = -[CaptureMTLIndirectComputeCommand traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = a3->var2;
  unint64_t v16 = a4->var2;
  *(void *)id v10 = var0;
  __int128 v17 = *(_OWORD *)&a4->var0;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)&a3->var0;
  *((void *)v10 + 3) = var2;
  *((_OWORD *)v10 + 2) = v17;
  *((void *)v10 + 6) = v16;
  s();
  *(void *)uint64_t v18 = v19;
  *(_BYTE *)(v18 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a4;
  -[MTLIndirectComputeCommand concurrentDispatchThreads:threadsPerThreadgroup:]( baseObject,  "concurrentDispatchThreads:threadsPerThreadgroup:",  &v6,  &v5);
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15935;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLIndirectComputeCommand traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)$F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLIndirectComputeCommand;
  -[CaptureMTLIndirectComputeCommand dealloc](&v12, "dealloc");
}

- (void)reset
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15905;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLIndirectComputeCommand traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)$F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
}

- (void)setBarrier
{
}

- (void)setComputePipelineState:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 baseObject]);
  -[MTLIndirectComputeCommand setComputePipelineState:](baseObject, "setComputePipelineState:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15934;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    uint64_t v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLIndirectComputeCommand traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v15 = (uint64_t *)[v5 traceStream];

  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLIndirectComputeCommand setKernelBuffer:offset:atIndex:]( baseObject,  "setKernelBuffer:offset:atIndex:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15933;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLIndirectComputeCommand traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v19 = (uint64_t *)[v9 traceStream];

  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  traceContext = self->_traceContext;
  id v11 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v25);
  baseObject = self->_baseObject;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  -[MTLIndirectComputeCommand setKernelBuffer:offset:attributeStride:atIndex:]( baseObject,  "setKernelBuffer:offset:attributeStride:atIndex:",  v13,  a4,  a5,  a6);

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15277;
  unsigned __int8 v15 = v29;
  if (v29 > 0x18uLL)
  {
    uint64_t v17 = *(void *)(v25[1] + 24LL);
    uint64_t v18 = v30++;
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x2800000000LL) + 16;
    unsigned __int8 v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v29);
    v29 += 40;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLIndirectComputeCommand traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = (uint64_t *)[v11 traceStream];

  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(_BYTE *)(v23 + 8) = v28;
  *(_BYTE *)(v26 + 15) |= 8u;
}

- (void)setStageInRegion:(id *)a3
{
  baseObject = self->_baseObject;
  __int128 v6 = *(_OWORD *)&a3->var0.var2;
  v18[0] = *(_OWORD *)&a3->var0.var0;
  v18[1] = v6;
  v18[2] = *(_OWORD *)&a3->var1.var1;
  -[MTLIndirectComputeCommand setStageInRegion:](baseObject, "setStageInRegion:", v18);
  uint64_t v7 = v21;
  *(_DWORD *)(v21 + 8) = -15926;
  unsigned __int8 v8 = v24;
  if (v24 > 8uLL)
  {
    uint64_t v10 = *(void *)(v20 + 24);
    uint64_t v11 = v25++;
    id v9 = GTTraceMemPool_allocateBytes(v10, v22, v11 | 0x3800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    id v9 = (char *)(v7 + v24);
    v24 += 56;
  }

  *(_BYTE *)(v7 + 13) = v8;
  uint64_t v12 = -[CaptureMTLIndirectComputeCommand traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v9 = var0;
  __int128 v14 = *(_OWORD *)&a3->var0.var2;
  __int128 v15 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v9 + 24) = v14;
  *(_OWORD *)(v9 + 40) = v15;
  s();
  *(void *)uint64_t v16 = v17;
  *(_BYTE *)(v16 + 8) = v23;
  *(_BYTE *)(v21 + 15) |= 8u;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15927;
  unsigned __int8 v8 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v10 = *(void *)(v16[1] + 24LL);
    uint64_t v11 = v21++;
    id v9 = GTTraceMemPool_allocateBytes(v10, v18, v11 | 0x1800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    id v9 = (char *)(v7 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v7 + 13) = v8;
  uint64_t v12 = -[CaptureMTLIndirectComputeCommand traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void).cxx_destruct
{
}

@end