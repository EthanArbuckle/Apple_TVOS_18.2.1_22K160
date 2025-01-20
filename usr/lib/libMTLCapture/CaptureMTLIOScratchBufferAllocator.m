@interface CaptureMTLIOScratchBufferAllocator
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIOScratchBufferAllocator)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLIOScratchBufferAllocator)baseObject;
- (NSString)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newScratchBufferWithMinimumSize:(unint64_t)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)dealloc;
- (void)touch;
@end

@implementation CaptureMTLIOScratchBufferAllocator

- (CaptureMTLIOScratchBufferAllocator)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CaptureMTLIOScratchBufferAllocator;
  v8 = -[CaptureMTLIOScratchBufferAllocator init](&v13, "init");
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

- (MTLIOScratchBufferAllocator)baseObject
{
  return self->_baseObject;
}

- (id)newScratchBufferWithMinimumSize:(unint64_t)a3
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v7;
  s();
  v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v28 = v10;
  char v29 = *((_BYTE *)v8 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  id v12 = -[MTLIOScratchBufferAllocator newScratchBufferWithMinimumSize:]( self->_baseObject,  "newScratchBufferWithMinimumSize:",  a3);
  if (v12) {
    objc_super v13 = -[CaptureMTLIOScratchBuffer initWithBaseObject:captureContext:captureBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLIOScratchBuffer),  "initWithBaseObject:captureContext:captureBuffer:",  v12,  self->_traceContext,  0LL);
  }
  else {
    objc_super v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLIOScratchBuffer traceStream](v13, "traceStream"));
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15299;
  char v15 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v25 + 24);
    uint64_t v18 = HIBYTE(v30);
    ++HIBYTE(v30);
    v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    v16 = (char *)(v14 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  v19 = -[CaptureMTLIOScratchBufferAllocator traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v21 = -[CaptureMTLIOScratchBuffer traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLIOScratchBufferAllocator;
  uint64_t v3 = -[CaptureMTLIOScratchBufferAllocator description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLIOScratchBufferAllocator description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLIOScratchBufferAllocator conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15329;
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
  objc_super v8 = -[CaptureMTLIOScratchBufferAllocator traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLIOScratchBufferAllocator;
  -[CaptureMTLIOScratchBufferAllocator dealloc](&v12, "dealloc");
}

- (void).cxx_destruct
{
}

@end