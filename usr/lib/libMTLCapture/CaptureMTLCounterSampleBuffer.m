@interface CaptureMTLCounterSampleBuffer
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLCounterSampleBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLCounterSampleBuffer)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (id)resolveCounterRange:(_NSRange)a3;
- (unint64_t)sampleCount;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)touch;
@end

@implementation CaptureMTLCounterSampleBuffer

- (CaptureMTLCounterSampleBuffer)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLCounterSampleBuffer;
  v9 = -[CaptureMTLCounterSampleBuffer init](&v15, "init");
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

- (MTLCounterSampleBuffer)baseObject
{
  return self->_baseObject;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15867;
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
  id v8 = -[CaptureMTLCounterSampleBuffer traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLCounterSampleBuffer;
  -[CaptureMTLCounterSampleBuffer dealloc](&v12, "dealloc");
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLCounterSampleBuffer;
  uint64_t v3 = -[CaptureMTLCounterSampleBuffer description](&v8, "description");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCounterSampleBuffer description](self->_baseObject, "description"));
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
  unsigned __int8 v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = -[MTLCounterSampleBuffer conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

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
  return (NSString *)-[MTLCounterSampleBuffer label](self->_baseObject, "label");
}

- (unint64_t)sampleCount
{
  return (unint64_t)-[MTLCounterSampleBuffer sampleCount](self->_baseObject, "sampleCount");
}

- (id)resolveCounterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) != 2) {
    return (id)objc_claimAutoreleasedReturnValue( -[MTLCounterSampleBuffer resolveCounterRange:]( self->_baseObject,  "resolveCounterRange:",  a3.location,  a3.length));
  }
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCounterSampleBuffer resolveCounterRange:]( self->_baseObject,  "resolveCounterRange:",  location,  length));
  uint64_t v7 = v19;
  *(_DWORD *)(v19 + 8) = -15753;
  unsigned __int8 v8 = v22;
  if (v22 > 0x20uLL)
  {
    uint64_t v11 = *(void *)(v18[1] + 24LL);
    uint64_t v12 = v23++;
    v9 = GTTraceMemPool_allocateBytes(v11, v20, v12 | 0x2000000000LL) + 16;
    unsigned __int8 v8 = v12;
  }

  else
  {
    v9 = (char *)(v7 + v22);
    v22 += 32;
  }

  *(_BYTE *)(v7 + 13) = v8;
  v13 = -[CaptureMTLCounterSampleBuffer traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v15 = SaveNSData((uint64_t)v18, v6);
  *(void *)v9 = var0;
  *((void *)v9 + 1) = location;
  *((void *)v9 + 2) = length;
  v9[24] = v15;
  *(_DWORD *)(v9 + 25) = 0;
  *((_DWORD *)v9 + 7) = 0;
  s();
  *(void *)uint64_t v16 = v17;
  *(_BYTE *)(v16 + 8) = v21;
  *(_BYTE *)(v19 + 15) |= 8u;
  return v6;
}

- (void).cxx_destruct
{
}

@end