@interface CaptureMTLArgumentEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLArgumentEncoder)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLArgumentEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3;
- (id)originalObject;
- (unint64_t)alignment;
- (unint64_t)encodedLength;
- (unint64_t)streamReference;
- (void)constantDataAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4;
- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
- (void)setLabel:(id)a3;
- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
- (void)touch;
@end

@implementation CaptureMTLArgumentEncoder

- (CaptureMTLArgumentEncoder)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CaptureMTLArgumentEncoder;
  v9 = -[CaptureMTLArgumentEncoder init](&v15, "init");
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

- (MTLArgumentEncoder)baseObject
{
  return self->_baseObject;
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    id v8 = (unint64_t *)[v6 traceStream];
    if (v8)
    {
      v9 = v8 + 7;
      unint64_t v10 = atomic_load(v8 + 7);
      while (1)
      {
        unint64_t v11 = __ldaxr(v9);
        if (v11 != v10) {
          break;
        }
        if (__stlxr(v10 | 2, v9)) {
          goto LABEL_8;
        }
        int v12 = 1;
LABEL_9:
        unint64_t v10 = v11;
        if (v12) {
          goto LABEL_10;
        }
      }

      __clrex();
LABEL_8:
      int v12 = 0;
      goto LABEL_9;
    }

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    unint64_t v10 = (unint64_t *)[v8 traceStream];
    if (v10)
    {
      unint64_t v11 = v10 + 7;
      unint64_t v12 = atomic_load(v10 + 7);
      while (1)
      {
        unint64_t v13 = __ldaxr(v11);
        if (v13 != v12) {
          break;
        }
        if (__stlxr(v12 | 2, v11)) {
          goto LABEL_8;
        }
        int v14 = 1;
LABEL_9:
        unint64_t v12 = v13;
        if (v14) {
          goto LABEL_10;
        }
      }

      __clrex();
LABEL_8:
      int v14 = 0;
      goto LABEL_9;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLArgumentEncoder;
  uint64_t v3 = -[CaptureMTLArgumentEncoder description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLArgumentEncoder description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLArgumentEncoder conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)alignment
{
  return (unint64_t)-[MTLArgumentEncoder alignment](self->_baseObject, "alignment");
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)encodedLength
{
  return (unint64_t)-[MTLArgumentEncoder encodedLength](self->_baseObject, "encodedLength");
}

- (NSString)label
{
  return (NSString *)-[MTLArgumentEncoder label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLArgumentEncoder setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16063;
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
  unint64_t v10 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
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

- (void)constantDataAtIndex:(unint64_t)a3
{
  return -[MTLArgumentEncoder constantDataAtIndex:](self->_baseObject, "constantDataAtIndex:", a3);
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16062;
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
  uint64_t v8 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLArgumentEncoder;
  -[CaptureMTLArgumentEncoder dealloc](&v12, "dealloc");
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
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
  id v12 = -[MTLArgumentEncoder newArgumentEncoderForBufferAtIndex:]( self->_baseObject,  "newArgumentEncoderForBufferAtIndex:",  a3);
  if (v12)
  {
    id v13 = objc_alloc(&OBJC_CLASS___CaptureMTLArgumentEncoder);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLArgumentEncoder device](self, "device"));
    uint64_t v15 = -[CaptureMTLArgumentEncoder initWithBaseObject:captureDevice:]( v13,  "initWithBaseObject:captureDevice:",  v12,  v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLArgumentEncoder traceStream](v15, "traceStream"));
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16053;
  char v17 = v32;
  if (v32 > 0x28uLL)
  {
    uint64_t v19 = *(void *)(v27 + 24);
    uint64_t v20 = HIBYTE(v32);
    ++HIBYTE(v32);
    unsigned __int8 v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x1800000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    unsigned __int8 v18 = (char *)(v16 + v32);
    LOBYTE(v32) = v32 + 24;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
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
  *(void *)unsigned __int8 v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a3;
  uint64_t *v9 = v30;
  *((_BYTE *)v9 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v15;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v25);
    baseObject = self->_baseObject;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
    -[MTLArgumentEncoder setBuffer:offset:atIndex:](baseObject, "setBuffer:offset:atIndex:", v11, a4, a5);

    uint64_t v12 = v26;
    *(_DWORD *)(v26 + 8) = -16060;
    unsigned __int8 v13 = v29;
    if (v29 > 0x20uLL)
    {
      uint64_t v17 = *(void *)(v25[1] + 24LL);
      uint64_t v18 = v30++;
      uint64_t v14 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x2000000000LL) + 16;
      unsigned __int8 v13 = v18;
    }

    else
    {
      uint64_t v14 = (char *)(v12 + v29);
      v29 += 32;
    }

    *(_BYTE *)(v12 + 13) = v13;
    uint64_t v19 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v21 = (uint64_t *)[v9 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0LL;
    }
    *(void *)uint64_t v14 = var0;
    *((void *)v14 + 1) = v22;
    *((void *)v14 + 2) = a4;
    *((void *)v14 + 3) = a5;
    s();
    *(void *)uint64_t v23 = v24;
    *(_BYTE *)(v23 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

  else
  {
    uint64_t v15 = self->_baseObject;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
    -[MTLArgumentEncoder setBuffer:offset:atIndex:](v15, "setBuffer:offset:atIndex:", v16, a4, a5);
  }
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    NSUInteger v38 = a5.location;
    uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v39);
    baseObject = self->_baseObject;
    uint64_t v12 = 8 * length;
    __chkstk_darwin(v10, v13);
    if (length)
    {
      uint64_t v14 = a3;
      uint64_t v15 = &v39[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
      NSUInteger v16 = length;
      do
      {
        uint64_t v17 = (void *)*v14++;
        *v15++ = objc_msgSend(v17, "baseObject", v38);
        --v16;
      }

      while (v16);
    }

    NSUInteger v18 = v38;
    -[MTLArgumentEncoder setBuffers:offsets:withRange:]( baseObject,  "setBuffers:offsets:withRange:",  &v39[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4,  v38,  length,  v38);
    uint64_t v19 = v41;
    *(_DWORD *)(v41 + 8) = -16059;
    unsigned __int8 v20 = v44;
    if (v44 > 0x20uLL)
    {
      uint64_t v29 = *(void *)(v40 + 24);
      uint64_t v30 = v45++;
      uint64_t v21 = GTTraceMemPool_allocateBytes(v29, v42, v30 | 0x2000000000LL) + 16;
      unsigned __int8 v20 = v30;
    }

    else
    {
      uint64_t v21 = (char *)(v19 + v44);
      v44 += 32;
    }

    *(_BYTE *)(v19 + 13) = v20;
    char v31 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v31) {
      unint64_t var0 = v31->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v31, v32);
    char v34 = StreamArray((uint64_t)v39, &v39[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
    char v35 = GTTraceEncoder_storeBytes((uint64_t)v39, (void *)a4, 8 * length);
    *(void *)uint64_t v21 = var0;
    *((void *)v21 + 1) = v18;
    *((void *)v21 + 2) = length;
    v21[24] = v34;
    v21[25] = v35;
    *(_DWORD *)(v21 + 26) = 0;
    *((_WORD *)v21 + 15) = 0;
    s();
    *(void *)uint64_t v36 = v37;
    *(_BYTE *)(v36 + 8) = v43;
    *(_BYTE *)(v41 + 15) |= 8u;
  }

  else
  {
    uint64_t v22 = self->_baseObject;
    __chkstk_darwin(self, a2);
    unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v25 = &v39[-v24 - 8];
    if (length)
    {
      uint64_t v26 = &v39[-v24 - 8];
      NSUInteger v27 = length;
      do
      {
        char v28 = (void *)*a3++;
        *v26++ = [v28 baseObject];
        --v27;
      }

      while (v27);
    }

    -[MTLArgumentEncoder setBuffers:offsets:withRange:](v22, "setBuffers:offsets:withRange:", v25, a4, location, length);
  }

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  baseObject = self->_baseObject;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  -[MTLArgumentEncoder setComputePipelineState:atIndex:](baseObject, "setComputePipelineState:atIndex:", v6, a4);
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  baseObject = self->_baseObject;
  __chkstk_darwin(self, a2);
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v10 = (char *)&v15 - v9;
  if (v11)
  {
    uint64_t v12 = (uint64_t *)((char *)&v15 - v9);
    NSUInteger v13 = length;
    do
    {
      uint64_t v14 = (void *)*a3++;
      *v12++ = [v14 baseObject];
      --v13;
    }

    while (v13);
  }

  -[MTLArgumentEncoder setComputePipelineStates:withRange:]( baseObject,  "setComputePipelineStates:withRange:",  v10,  location,  length);
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
    baseObject = self->_baseObject;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
    -[MTLArgumentEncoder setIndirectCommandBuffer:atIndex:](baseObject, "setIndirectCommandBuffer:atIndex:", v9, a4);

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -15916;
    unsigned __int8 v11 = v27;
    if (v27 > 0x28uLL)
    {
      uint64_t v15 = *(void *)(v23[1] + 24LL);
      uint64_t v16 = v28++;
      uint64_t v12 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1800000000LL) + 16;
      unsigned __int8 v11 = v16;
    }

    else
    {
      uint64_t v12 = (char *)(v10 + v27);
      v27 += 24;
    }

    *(_BYTE *)(v10 + 13) = v11;
    uint64_t v17 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0LL;
    }
    *(void *)uint64_t v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(_BYTE *)(v21 + 8) = v26;
    *(_BYTE *)(v24 + 15) |= 8u;
  }

  else
  {
    NSUInteger v13 = self->_baseObject;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLArgumentEncoder setIndirectCommandBuffer:atIndex:](v13, "setIndirectCommandBuffer:atIndex:", v14, a4);
  }
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v35);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    if (length)
    {
      uint64_t v12 = a3;
      NSUInteger v13 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }

      while (v14);
    }

    -[MTLArgumentEncoder setIndirectCommandBuffers:withRange:]( baseObject,  "setIndirectCommandBuffers:withRange:",  &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
    uint64_t v16 = v37;
    *(_DWORD *)(v37 + 8) = -15915;
    unsigned __int8 v17 = v40;
    if (v40 > 0x20uLL)
    {
      uint64_t v26 = *(void *)(v36 + 24);
      uint64_t v27 = v41++;
      NSUInteger v18 = GTTraceMemPool_allocateBytes(v26, v38, v27 | 0x2000000000LL) + 16;
      unsigned __int8 v17 = v27;
    }

    else
    {
      NSUInteger v18 = (char *)(v16 + v40);
      v40 += 32;
    }

    *(_BYTE *)(v16 + 13) = v17;
    unsigned __int8 v28 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v28) {
      unint64_t var0 = v28->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v28, v29);
    char v31 = StreamArray((uint64_t)v35, &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
    *(void *)NSUInteger v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v31;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v32 = v33;
    *(_BYTE *)(v32 + 8) = v39;
    *(_BYTE *)(v37 + 15) |= 8u;
  }

  else
  {
    uint64_t v19 = self->_baseObject;
    __chkstk_darwin(self, a2);
    unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v22 = &v35[-v21 - 8];
    if (length)
    {
      uint64_t v23 = &v35[-v21 - 8];
      NSUInteger v24 = length;
      do
      {
        uint64_t v25 = (void *)*a3++;
        *v23++ = [v25 baseObject];
        --v24;
      }

      while (v24);
    }

    -[MTLArgumentEncoder setIndirectCommandBuffers:withRange:]( v19,  "setIndirectCommandBuffers:withRange:",  v22,  location,  length);
  }

- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
    baseObject = self->_baseObject;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
    -[MTLArgumentEncoder setIntersectionFunctionTable:atIndex:]( baseObject,  "setIntersectionFunctionTable:atIndex:",  v9,  a4);

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -15539;
    unsigned __int8 v11 = v27;
    if (v27 > 0x28uLL)
    {
      uint64_t v15 = *(void *)(v23[1] + 24LL);
      uint64_t v16 = v28++;
      uint64_t v12 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1800000000LL) + 16;
      unsigned __int8 v11 = v16;
    }

    else
    {
      uint64_t v12 = (char *)(v10 + v27);
      v27 += 24;
    }

    *(_BYTE *)(v10 + 13) = v11;
    unsigned __int8 v17 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0LL;
    }
    *(void *)uint64_t v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(_BYTE *)(v21 + 8) = v26;
    *(_BYTE *)(v24 + 15) |= 8u;
  }

  else
  {
    NSUInteger v13 = self->_baseObject;
    NSUInteger v14 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLArgumentEncoder setIntersectionFunctionTable:atIndex:](v13, "setIntersectionFunctionTable:atIndex:", v14, a4);
  }
}

- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v35);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    if (length)
    {
      uint64_t v12 = a3;
      NSUInteger v13 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }

      while (v14);
    }

    -[MTLArgumentEncoder setIntersectionFunctionTables:withRange:]( baseObject,  "setIntersectionFunctionTables:withRange:",  &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
    uint64_t v16 = v37;
    *(_DWORD *)(v37 + 8) = -15538;
    unsigned __int8 v17 = v40;
    if (v40 > 0x20uLL)
    {
      uint64_t v26 = *(void *)(v36 + 24);
      uint64_t v27 = v41++;
      NSUInteger v18 = GTTraceMemPool_allocateBytes(v26, v38, v27 | 0x2000000000LL) + 16;
      unsigned __int8 v17 = v27;
    }

    else
    {
      NSUInteger v18 = (char *)(v16 + v40);
      v40 += 32;
    }

    *(_BYTE *)(v16 + 13) = v17;
    unsigned __int8 v28 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v28) {
      unint64_t var0 = v28->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v28, v29);
    char v31 = StreamArray((uint64_t)v35, &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
    *(void *)NSUInteger v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v31;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v32 = v33;
    *(_BYTE *)(v32 + 8) = v39;
    *(_BYTE *)(v37 + 15) |= 8u;
  }

  else
  {
    uint64_t v19 = self->_baseObject;
    __chkstk_darwin(self, a2);
    unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v22 = &v35[-v21 - 8];
    if (length)
    {
      uint64_t v23 = &v35[-v21 - 8];
      NSUInteger v24 = length;
      do
      {
        uint64_t v25 = (void *)*a3++;
        *v23++ = [v25 baseObject];
        --v24;
      }

      while (v24);
    }

    -[MTLArgumentEncoder setIntersectionFunctionTables:withRange:]( v19,  "setIntersectionFunctionTables:withRange:",  v22,  location,  length);
  }

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
    baseObject = self->_baseObject;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
    -[MTLArgumentEncoder setRenderPipelineState:atIndex:](baseObject, "setRenderPipelineState:atIndex:", v9, a4);

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -16002;
    unsigned __int8 v11 = v27;
    if (v27 > 0x28uLL)
    {
      uint64_t v15 = *(void *)(v23[1] + 24LL);
      uint64_t v16 = v28++;
      uint64_t v12 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1800000000LL) + 16;
      unsigned __int8 v11 = v16;
    }

    else
    {
      uint64_t v12 = (char *)(v10 + v27);
      v27 += 24;
    }

    *(_BYTE *)(v10 + 13) = v11;
    unsigned __int8 v17 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0LL;
    }
    *(void *)uint64_t v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(_BYTE *)(v21 + 8) = v26;
    *(_BYTE *)(v24 + 15) |= 8u;
  }

  else
  {
    NSUInteger v13 = self->_baseObject;
    NSUInteger v14 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLArgumentEncoder setRenderPipelineState:atIndex:](v13, "setRenderPipelineState:atIndex:", v14, a4);
  }
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v35);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    if (length)
    {
      uint64_t v12 = a3;
      NSUInteger v13 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }

      while (v14);
    }

    -[MTLArgumentEncoder setRenderPipelineStates:withRange:]( baseObject,  "setRenderPipelineStates:withRange:",  &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
    uint64_t v16 = v37;
    *(_DWORD *)(v37 + 8) = -16001;
    unsigned __int8 v17 = v40;
    if (v40 > 0x20uLL)
    {
      uint64_t v26 = *(void *)(v36 + 24);
      uint64_t v27 = v41++;
      NSUInteger v18 = GTTraceMemPool_allocateBytes(v26, v38, v27 | 0x2000000000LL) + 16;
      unsigned __int8 v17 = v27;
    }

    else
    {
      NSUInteger v18 = (char *)(v16 + v40);
      v40 += 32;
    }

    *(_BYTE *)(v16 + 13) = v17;
    unsigned __int8 v28 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v28) {
      unint64_t var0 = v28->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v28, v29);
    char v31 = StreamArray((uint64_t)v35, &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
    *(void *)NSUInteger v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v31;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v32 = v33;
    *(_BYTE *)(v32 + 8) = v39;
    *(_BYTE *)(v37 + 15) |= 8u;
  }

  else
  {
    uint64_t v19 = self->_baseObject;
    __chkstk_darwin(self, a2);
    unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v22 = &v35[-v21 - 8];
    if (length)
    {
      uint64_t v23 = &v35[-v21 - 8];
      NSUInteger v24 = length;
      do
      {
        uint64_t v25 = (void *)*a3++;
        *v23++ = [v25 baseObject];
        --v24;
      }

      while (v24);
    }

    -[MTLArgumentEncoder setRenderPipelineStates:withRange:]( v19,  "setRenderPipelineStates:withRange:",  v22,  location,  length);
  }

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
    baseObject = self->_baseObject;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
    -[MTLArgumentEncoder setSamplerState:atIndex:](baseObject, "setSamplerState:atIndex:", v9, a4);

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -16056;
    unsigned __int8 v11 = v27;
    if (v27 > 0x28uLL)
    {
      uint64_t v15 = *(void *)(v23[1] + 24LL);
      uint64_t v16 = v28++;
      uint64_t v12 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1800000000LL) + 16;
      unsigned __int8 v11 = v16;
    }

    else
    {
      uint64_t v12 = (char *)(v10 + v27);
      v27 += 24;
    }

    *(_BYTE *)(v10 + 13) = v11;
    unsigned __int8 v17 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0LL;
    }
    *(void *)uint64_t v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(_BYTE *)(v21 + 8) = v26;
    *(_BYTE *)(v24 + 15) |= 8u;
  }

  else
  {
    NSUInteger v13 = self->_baseObject;
    NSUInteger v14 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLArgumentEncoder setSamplerState:atIndex:](v13, "setSamplerState:atIndex:", v14, a4);
  }
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v35);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    if (length)
    {
      uint64_t v12 = a3;
      NSUInteger v13 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }

      while (v14);
    }

    -[MTLArgumentEncoder setSamplerStates:withRange:]( baseObject,  "setSamplerStates:withRange:",  &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
    uint64_t v16 = v37;
    *(_DWORD *)(v37 + 8) = -16055;
    unsigned __int8 v17 = v40;
    if (v40 > 0x20uLL)
    {
      uint64_t v26 = *(void *)(v36 + 24);
      uint64_t v27 = v41++;
      NSUInteger v18 = GTTraceMemPool_allocateBytes(v26, v38, v27 | 0x2000000000LL) + 16;
      unsigned __int8 v17 = v27;
    }

    else
    {
      NSUInteger v18 = (char *)(v16 + v40);
      v40 += 32;
    }

    *(_BYTE *)(v16 + 13) = v17;
    unsigned __int8 v28 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v28) {
      unint64_t var0 = v28->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v28, v29);
    char v31 = StreamArray((uint64_t)v35, &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
    *(void *)NSUInteger v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v31;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v32 = v33;
    *(_BYTE *)(v32 + 8) = v39;
    *(_BYTE *)(v37 + 15) |= 8u;
  }

  else
  {
    uint64_t v19 = self->_baseObject;
    __chkstk_darwin(self, a2);
    unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v22 = &v35[-v21 - 8];
    if (length)
    {
      uint64_t v23 = &v35[-v21 - 8];
      NSUInteger v24 = length;
      do
      {
        uint64_t v25 = (void *)*a3++;
        *v23++ = [v25 baseObject];
        --v24;
      }

      while (v24);
    }

    -[MTLArgumentEncoder setSamplerStates:withRange:](v19, "setSamplerStates:withRange:", v22, location, length);
  }

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
    baseObject = self->_baseObject;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
    -[MTLArgumentEncoder setTexture:atIndex:](baseObject, "setTexture:atIndex:", v9, a4);

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -16058;
    unsigned __int8 v11 = v27;
    if (v27 > 0x28uLL)
    {
      uint64_t v15 = *(void *)(v23[1] + 24LL);
      uint64_t v16 = v28++;
      uint64_t v12 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1800000000LL) + 16;
      unsigned __int8 v11 = v16;
    }

    else
    {
      uint64_t v12 = (char *)(v10 + v27);
      v27 += 24;
    }

    *(_BYTE *)(v10 + 13) = v11;
    unsigned __int8 v17 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0LL;
    }
    *(void *)uint64_t v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(_BYTE *)(v21 + 8) = v26;
    *(_BYTE *)(v24 + 15) |= 8u;
  }

  else
  {
    NSUInteger v13 = self->_baseObject;
    NSUInteger v14 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLArgumentEncoder setTexture:atIndex:](v13, "setTexture:atIndex:", v14, a4);
  }
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v35);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    if (length)
    {
      uint64_t v12 = a3;
      NSUInteger v13 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }

      while (v14);
    }

    -[MTLArgumentEncoder setTextures:withRange:]( baseObject,  "setTextures:withRange:",  &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
    uint64_t v16 = v37;
    *(_DWORD *)(v37 + 8) = -16057;
    unsigned __int8 v17 = v40;
    if (v40 > 0x20uLL)
    {
      uint64_t v26 = *(void *)(v36 + 24);
      uint64_t v27 = v41++;
      NSUInteger v18 = GTTraceMemPool_allocateBytes(v26, v38, v27 | 0x2000000000LL) + 16;
      unsigned __int8 v17 = v27;
    }

    else
    {
      NSUInteger v18 = (char *)(v16 + v40);
      v40 += 32;
    }

    *(_BYTE *)(v16 + 13) = v17;
    unsigned __int8 v28 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v28) {
      unint64_t var0 = v28->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v28, v29);
    char v31 = StreamArray((uint64_t)v35, &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
    *(void *)NSUInteger v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v31;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v32 = v33;
    *(_BYTE *)(v32 + 8) = v39;
    *(_BYTE *)(v37 + 15) |= 8u;
  }

  else
  {
    uint64_t v19 = self->_baseObject;
    __chkstk_darwin(self, a2);
    unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v22 = &v35[-v21 - 8];
    if (length)
    {
      uint64_t v23 = &v35[-v21 - 8];
      NSUInteger v24 = length;
      do
      {
        uint64_t v25 = (void *)*a3++;
        *v23++ = [v25 baseObject];
        --v24;
      }

      while (v24);
    }

    -[MTLArgumentEncoder setTextures:withRange:](v19, "setTextures:withRange:", v22, location, length);
  }

- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
    baseObject = self->_baseObject;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
    -[MTLArgumentEncoder setVisibleFunctionTable:atIndex:](baseObject, "setVisibleFunctionTable:atIndex:", v9, a4);

    uint64_t v10 = v24;
    *(_DWORD *)(v24 + 8) = -15537;
    unsigned __int8 v11 = v27;
    if (v27 > 0x28uLL)
    {
      uint64_t v15 = *(void *)(v23[1] + 24LL);
      uint64_t v16 = v28++;
      uint64_t v12 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1800000000LL) + 16;
      unsigned __int8 v11 = v16;
    }

    else
    {
      uint64_t v12 = (char *)(v10 + v27);
      v27 += 24;
    }

    *(_BYTE *)(v10 + 13) = v11;
    unsigned __int8 v17 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v19 = (uint64_t *)[v7 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0LL;
    }
    *(void *)uint64_t v12 = var0;
    *((void *)v12 + 1) = v20;
    *((void *)v12 + 2) = a4;
    s();
    *(void *)uint64_t v21 = v22;
    *(_BYTE *)(v21 + 8) = v26;
    *(_BYTE *)(v24 + 15) |= 8u;
  }

  else
  {
    NSUInteger v13 = self->_baseObject;
    NSUInteger v14 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLArgumentEncoder setVisibleFunctionTable:atIndex:](v13, "setVisibleFunctionTable:atIndex:", v14, a4);
  }
}

- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v35);
    baseObject = self->_baseObject;
    uint64_t v10 = 8 * length;
    __chkstk_darwin(v8, v11);
    if (length)
    {
      uint64_t v12 = a3;
      NSUInteger v13 = &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
      NSUInteger v14 = length;
      do
      {
        uint64_t v15 = (void *)*v12++;
        *v13++ = [v15 baseObject];
        --v14;
      }

      while (v14);
    }

    -[MTLArgumentEncoder setVisibleFunctionTables:withRange:]( baseObject,  "setVisibleFunctionTables:withRange:",  &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
    uint64_t v16 = v37;
    *(_DWORD *)(v37 + 8) = -15536;
    unsigned __int8 v17 = v40;
    if (v40 > 0x20uLL)
    {
      uint64_t v26 = *(void *)(v36 + 24);
      uint64_t v27 = v41++;
      NSUInteger v18 = GTTraceMemPool_allocateBytes(v26, v38, v27 | 0x2000000000LL) + 16;
      unsigned __int8 v17 = v27;
    }

    else
    {
      NSUInteger v18 = (char *)(v16 + v40);
      v40 += 32;
    }

    *(_BYTE *)(v16 + 13) = v17;
    unsigned __int8 v28 = -[CaptureMTLArgumentEncoder traceStream](self, "traceStream");
    if (v28) {
      unint64_t var0 = v28->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v28, v29);
    char v31 = StreamArray((uint64_t)v35, &v35[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
    *(void *)NSUInteger v18 = var0;
    *((void *)v18 + 1) = location;
    *((void *)v18 + 2) = length;
    v18[24] = v31;
    *(_DWORD *)(v18 + 25) = 0;
    *((_DWORD *)v18 + 7) = 0;
    s();
    *(void *)uint64_t v32 = v33;
    *(_BYTE *)(v32 + 8) = v39;
    *(_BYTE *)(v37 + 15) |= 8u;
  }

  else
  {
    uint64_t v19 = self->_baseObject;
    __chkstk_darwin(self, a2);
    unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v22 = &v35[-v21 - 8];
    if (length)
    {
      uint64_t v23 = &v35[-v21 - 8];
      NSUInteger v24 = length;
      do
      {
        uint64_t v25 = (void *)*a3++;
        *v23++ = [v25 baseObject];
        --v24;
      }

      while (v24);
    }

    -[MTLArgumentEncoder setVisibleFunctionTables:withRange:]( v19,  "setVisibleFunctionTables:withRange:",  v22,  location,  length);
  }

- (void).cxx_destruct
{
}

@end