@interface CaptureMTLBlitCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLBlitCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBlitCommandEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12;
- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10;
- (void)copyFromTexture:(id)a3 toTexture:(id)a4;
- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6;
- (void)dealloc;
- (void)endEncoding;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5;
- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7;
- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8;
- (void)generateMipmapsForTexture:(id)a3;
- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9;
- (void)insertDebugSignpost:(id)a3;
- (void)invalidateCompressedTexture:(id)a3;
- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForCPUAccess:(id)a3;
- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeContentsForGPUAccess:(id)a3;
- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6;
- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setLabel:(id)a3;
- (void)touch;
- (void)updateFence:(id)a3;
- (void)waitForFence:(id)a3;
@end

@implementation CaptureMTLBlitCommandEncoder

- (CaptureMTLBlitCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CaptureMTLBlitCommandEncoder;
  v9 = -[CaptureMTLBlitCommandEncoder init](&v22, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    objc_storeWeak((id *)&v10->_captureCommandBuffer, v8);
    v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    id v14 = DEVICEOBJECT(v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openEncoderStream( (uint64_t)v13,  (unint64_t)v15,  *((void *)[v8 traceStream] + 3));

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v8 retainedObjects]);
    retainedObjects = v10->_retainedObjects;
    v10->_retainedObjects = (NSMutableSet *)v16;

    v18 = v10->_retainedObjects;
    id v19 = DEVICEOBJECT(v10->_baseObject);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[NSMutableSet addObject:](v18, "addObject:", v20);
  }

  return v10;
}

- (MTLBlitCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  [v11 touch];
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v11);
    }
  }

  [v12 touch];
  if (v12)
  {
    id v14 = self->_retainedObjects;
    if (v14) {
      -[NSMutableSet addObject:](v14, "addObject:", v12);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v51);
  baseObject = self->_baseObject;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLBlitCommandEncoderSPI resolveCounters:inRange:destinationBuffer:destinationOffset:]( baseObject,  "resolveCounters:inRange:destinationBuffer:destinationOffset:",  v16,  location,  length,  v17,  a6);

  uint64_t v18 = v53;
  *(_DWORD *)(v53 + 8) = -15756;
  unsigned __int8 v19 = v56;
  if (v56 > 8uLL)
  {
    uint64_t v21 = *(void *)(v52 + 24);
    uint64_t v22 = v57++;
    v20 = GTTraceMemPool_allocateBytes(v21, v54, v22 | 0x3800000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    v20 = (char *)(v18 + v56);
    v56 += 56;
  }

  *(_BYTE *)(v18 + 13) = v19;
  v23 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v25 = (uint64_t *)[v11 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0LL;
  }
  v27 = (uint64_t *)[v12 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0LL;
  }
  *(void *)v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = location;
  *((void *)v20 + 3) = length;
  *((void *)v20 + 4) = v28;
  *((void *)v20 + 5) = a6;
  p_captureCommandBuffer = &self->_captureCommandBuffer;
  *((void *)v20 + 6) = 0LL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  unsigned int v31 = [WeakRetained isCapturing];

  if (v31)
  {
    id v32 = DEVICEOBJECT(v12);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    id v34 = [v33 length];
    uint64_t v35 = *(void *)(v52 + 24);
    uint64_t v36 = v57++;
    Bytes = GTTraceMemPool_allocateBytes(v35, v54, v36 | ((void)v34 << 32) | 0x100);
    v20[48] = Bytes[8];
    id v38 = DEVICEOBJECT(self->_baseObject);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 device]);
    id v41 = [v40 newBufferWithLength:v34 options:0];
    [v39 copyFromBuffer:v33 sourceOffset:0 toBuffer:v41 destinationOffset:0 size:v34];
    id v42 = objc_loadWeakRetained((id *)p_captureCommandBuffer);
    id v43 = DEVICEOBJECT(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = __92__CaptureMTLBlitCommandEncoder_resolveCounters_inRange_destinationBuffer_destinationOffset___block_invoke;
    v48[3] = &unk_20E0A0;
    id v49 = v41;
    v50 = Bytes;
    id v45 = v41;
    [v44 addCompletedHandler:v48];
  }

  s();
  *(void *)uint64_t v46 = v47;
  *(_BYTE *)(v46 + 8) = v55;
  *(_BYTE *)(v53 + 15) |= 8u;
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  id v15 = a3;
  [v15 touch];
  if (v15)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v15);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v33);
  baseObject = self->_baseObject;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  __int128 v19 = *(_OWORD *)&a6->var0.var2;
  v32[0] = *(_OWORD *)&a6->var0.var0;
  v32[1] = v19;
  v32[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLBlitCommandEncoderSPI fillTexture:level:slice:region:color:]( baseObject,  "fillTexture:level:slice:region:color:",  v18,  a4,  a5,  v32,  var0,  var1,  var2,  var3);

  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -15472;
  uint64_t v21 = *(void *)(v34 + 24);
  uint64_t v22 = v38++;
  Bytes = GTTraceMemPool_allocateBytes(v21, v36, v22 | 0x7000000000LL);
  *(_BYTE *)(v20 + 13) = v22;
  v24 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  uint64_t v26 = (uint64_t *)[v15 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  *((void *)Bytes + 2) = v25;
  *((void *)Bytes + 3) = v27;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  __int128 v28 = *(_OWORD *)&a6->var0.var2;
  __int128 v29 = *(_OWORD *)&a6->var1.var1;
  *((_OWORD *)Bytes + 3) = *(_OWORD *)&a6->var0.var0;
  *((_OWORD *)Bytes + 4) = v28;
  *((_OWORD *)Bytes + 5) = v29;
  *((double *)Bytes + 12) = var0;
  *((double *)Bytes + 13) = var1;
  *((double *)Bytes + 14) = var2;
  *((double *)Bytes + 15) = var3;
  s();
  *(void *)uint64_t v30 = v31;
  *(_BYTE *)(v30 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  double var3 = a7.var3;
  double var2 = a7.var2;
  double var1 = a7.var1;
  double var0 = a7.var0;
  id v17 = a3;
  [v17 touch];
  if (v17)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v17);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v35);
  baseObject = self->_baseObject;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 baseObject]);
  __int128 v21 = *(_OWORD *)&a6->var0.var2;
  v34[0] = *(_OWORD *)&a6->var0.var0;
  v34[1] = v21;
  v34[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLBlitCommandEncoderSPI fillTexture:level:slice:region:color:pixelFormat:]( baseObject,  "fillTexture:level:slice:region:color:pixelFormat:",  v20,  a4,  a5,  v34,  a8,  var0,  var1,  var2,  var3);

  uint64_t v22 = v37;
  *(_DWORD *)(v37 + 8) = -15471;
  uint64_t v23 = *(void *)(v36 + 24);
  uint64_t v24 = v40++;
  Bytes = GTTraceMemPool_allocateBytes(v23, v38, v24 | 0x7800000000LL);
  *(_BYTE *)(v22 + 13) = v24;
  uint64_t v26 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0LL;
  }
  __int128 v28 = (uint64_t *)[v17 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0LL;
  }
  *((void *)Bytes + 2) = v27;
  *((void *)Bytes + 3) = v29;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  __int128 v30 = *(_OWORD *)&a6->var0.var2;
  __int128 v31 = *(_OWORD *)&a6->var1.var1;
  *((_OWORD *)Bytes + 3) = *(_OWORD *)&a6->var0.var0;
  *((_OWORD *)Bytes + 4) = v30;
  *((_OWORD *)Bytes + 5) = v31;
  *((double *)Bytes + 12) = var0;
  *((double *)Bytes + 13) = var1;
  *((double *)Bytes + 14) = var2;
  *((double *)Bytes + 15) = var3;
  *((void *)Bytes + 16) = a8;
  s();
  *(void *)uint64_t v32 = v33;
  *(_BYTE *)(v32 + 8) = v39;
  *(_BYTE *)(v37 + 15) |= 8u;
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
    p_double var1 = &traceStream[1].var1;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLBlitCommandEncoder;
  uint64_t v3 = -[CaptureMTLBlitCommandEncoder description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBlitCommandEncoderSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLBlitCommandEncoderSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

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
  return (NSString *)-[MTLBlitCommandEncoderSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLBlitCommandEncoderSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16384;
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
  v10 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
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

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v16 = a3;
  id v17 = a8;
  [v16 touch];
  if (v16)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v16);
    }
  }

  [v17 touch];
  if (v17)
  {
    __int128 v19 = self->_retainedObjects;
    if (v19) {
      -[NSMutableSet addObject:](v19, "addObject:", v17);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v47);
  baseObject = self->_baseObject;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v16 baseObject]);
  char v22 = (void *)objc_claimAutoreleasedReturnValue([v17 baseObject]);
  __int128 v45 = *(_OWORD *)&a7->var0;
  unint64_t var2 = a7->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v44 = *a11;
  unint64_t v42 = a5;
  unint64_t v23 = a5;
  unint64_t v24 = a6;
  -[MTLBlitCommandEncoderSPI copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:]( baseObject,  "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationL evel:destinationOrigin:",  v21,  a4,  v23,  a6,  &v45,  v22,  a9,  a10,  &v44);

  uint64_t v25 = v49;
  *(_DWORD *)(v49 + 8) = -16381;
  uint64_t v26 = *(void *)(v48 + 24);
  uint64_t v27 = v52++;
  Bytes = GTTraceMemPool_allocateBytes(v26, v50, v27 | 0x7000000000LL);
  *(_BYTE *)(v25 + 13) = v27;
  uint64_t v29 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v31 = (uint64_t *)[v16 traceStream];
  if (v31) {
    uint64_t v32 = *v31;
  }
  else {
    uint64_t v32 = 0LL;
  }
  unint64_t v33 = a7->var0;
  unint64_t var1 = a7->var1;
  unint64_t v35 = a7->var2;
  uint64_t v36 = (uint64_t *)[v17 traceStream];
  if (v36) {
    uint64_t v37 = *v36;
  }
  else {
    uint64_t v37 = 0LL;
  }
  unint64_t v38 = a11->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v32;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = v42;
  *((void *)Bytes + 6) = v24;
  *((void *)Bytes + 10) = v37;
  *((void *)Bytes + 11) = a9;
  *((void *)Bytes + 12) = a10;
  __int128 v39 = *(_OWORD *)&a11->var0;
  *((void *)Bytes + 7) = v33;
  *((void *)Bytes + 8) = var1;
  *((void *)Bytes + 9) = v35;
  *(_OWORD *)(Bytes + 104) = v39;
  *((void *)Bytes + 15) = v38;
  s();
  *(void *)uint64_t v40 = v41;
  *(_BYTE *)(v40 + 8) = v51;
  *(_BYTE *)(v49 + 15) |= 8u;
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  id v17 = a3;
  id v18 = a8;
  [v17 touch];
  if (v17)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v17);
    }
  }

  [v18 touch];
  if (v18)
  {
    uint64_t v20 = self->_retainedObjects;
    if (v20) {
      -[NSMutableSet addObject:](v20, "addObject:", v18);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v48);
  baseObject = self->_baseObject;
  char v22 = (void *)objc_claimAutoreleasedReturnValue([v17 baseObject]);
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 baseObject]);
  __int128 v46 = *(_OWORD *)&a7->var0;
  unint64_t var2 = a7->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v45 = *a11;
  unint64_t v43 = a5;
  unint64_t v24 = a5;
  unint64_t v25 = a6;
  -[MTLBlitCommandEncoderSPI copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:]( baseObject,  "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationL evel:destinationOrigin:options:",  v22,  a4,  v24,  a6,  &v46,  v23,  a9,  a10,  &v45,  a12);

  uint64_t v26 = v50;
  *(_DWORD *)(v50 + 8) = -16210;
  uint64_t v27 = *(void *)(v49 + 24);
  uint64_t v28 = v53++;
  Bytes = GTTraceMemPool_allocateBytes(v27, v51, v28 | 0x7800000000LL);
  *(_BYTE *)(v26 + 13) = v28;
  __int128 v30 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v30) {
    unint64_t var0 = v30->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v32 = (uint64_t *)[v17 traceStream];
  if (v32) {
    uint64_t v33 = *v32;
  }
  else {
    uint64_t v33 = 0LL;
  }
  unint64_t v34 = a7->var0;
  unint64_t var1 = a7->var1;
  unint64_t v36 = a7->var2;
  uint64_t v37 = (uint64_t *)[v18 traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0LL;
  }
  unint64_t v39 = a11->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v33;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = v43;
  *((void *)Bytes + 6) = v25;
  *((void *)Bytes + 10) = v38;
  *((void *)Bytes + 11) = a9;
  *((void *)Bytes + 12) = a10;
  __int128 v40 = *(_OWORD *)&a11->var0;
  *((void *)Bytes + 7) = v34;
  *((void *)Bytes + 8) = var1;
  *((void *)Bytes + 9) = v36;
  *(_OWORD *)(Bytes + 104) = v40;
  *((void *)Bytes + 15) = v39;
  *((void *)Bytes + 16) = a12;
  s();
  *(void *)uint64_t v41 = v42;
  *(_BYTE *)(v41 + 8) = v52;
  *(_BYTE *)(v50 + 15) |= 8u;
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
    }
  }

  [v13 touch];
  if (v13)
  {
    id v15 = self->_retainedObjects;
    if (v15) {
      -[NSMutableSet addObject:](v15, "addObject:", v13);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v32);
  baseObject = self->_baseObject;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 baseObject]);
  -[MTLBlitCommandEncoderSPI copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:]( baseObject,  "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:",  v17,  a4,  v18,  a6,  a7);

  uint64_t v19 = v33;
  *(_DWORD *)(v33 + 8) = -16377;
  unsigned __int8 v20 = v36;
  if (v36 > 0x10uLL)
  {
    uint64_t v22 = *(void *)(v32[1] + 24LL);
    uint64_t v23 = v37++;
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v34, v23 | 0x3000000000LL) + 16;
    unsigned __int8 v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    v36 += 48;
  }

  *(_BYTE *)(v19 + 13) = v20;
  unint64_t v24 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v26 = (uint64_t *)[v12 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  uint64_t v28 = (uint64_t *)[v13 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0LL;
  }
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  *((void *)v21 + 3) = v29;
  *((void *)v21 + 4) = a6;
  *((void *)v21 + 5) = a7;
  s();
  *(void *)uint64_t v30 = v31;
  *(_BYTE *)(v30 + 8) = v35;
  *(_BYTE *)(v33 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  id v17 = a3;
  id v18 = a8;
  [v17 touch];
  if (v17)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v17);
    }
  }

  [v18 touch];
  if (v18)
  {
    unsigned __int8 v20 = self->_retainedObjects;
    if (v20) {
      -[NSMutableSet addObject:](v20, "addObject:", v18);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v48);
  baseObject = self->_baseObject;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 baseObject]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 baseObject]);
  __int128 v46 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  __int128 v44 = *(_OWORD *)&a7->var0;
  unint64_t v45 = a7->var2;
  unint64_t v42 = a4;
  unint64_t v43 = a5;
  -[MTLBlitCommandEncoderSPI copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:]( baseObject,  "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:de stinationBytesPerImage:",  v22,  a4,  a5,  &v46,  &v44,  v23,  a9,  a10,  a11);

  uint64_t v24 = v50;
  *(_DWORD *)(v50 + 8) = -16380;
  uint64_t v25 = *(void *)(v49 + 24);
  uint64_t v26 = v53++;
  Bytes = GTTraceMemPool_allocateBytes(v25, v51, v26 | 0x7000000000LL);
  *(_BYTE *)(v24 + 13) = v26;
  uint64_t v28 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v29 = (uint64_t *)[v17 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  unint64_t v32 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t v33 = a6->var2;
  unint64_t v34 = a7->var0;
  unint64_t v35 = a7->var1;
  unint64_t v36 = a7->var2;
  unsigned __int8 v37 = (uint64_t *)[v18 traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v30;
  *((void *)Bytes + 4) = v42;
  *((void *)Bytes + 5) = v43;
  *((void *)Bytes + 6) = v32;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = v33;
  *((void *)Bytes + 9) = v34;
  *((void *)Bytes + 10) = v35;
  *((void *)Bytes + 11) = v36;
  *((void *)Bytes + 12) = v38;
  *((void *)Bytes + 13) = a9;
  *((void *)Bytes + 14) = a10;
  *((void *)Bytes + 15) = a11;
  s();
  *(void *)uint64_t v39 = v40;
  *(_BYTE *)(v39 + 8) = v52;
  *(_BYTE *)(v50 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  id v18 = a3;
  id v19 = a8;
  [v18 touch];
  if (v18)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v18);
    }
  }

  [v19 touch];
  if (v19)
  {
    uint64_t v21 = self->_retainedObjects;
    if (v21) {
      -[NSMutableSet addObject:](v21, "addObject:", v19);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v49);
  baseObject = self->_baseObject;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 baseObject]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v19 baseObject]);
  __int128 v47 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  __int128 v45 = *(_OWORD *)&a7->var0;
  unint64_t v46 = a7->var2;
  unint64_t v43 = a4;
  unint64_t v44 = a5;
  -[MTLBlitCommandEncoderSPI copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:]( baseObject,  "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:de stinationBytesPerImage:options:",  v23,  a4,  a5,  &v47,  &v45,  v24,  a9,  a10,  a11,  a12);

  uint64_t v25 = v51;
  *(_DWORD *)(v51 + 8) = -16209;
  uint64_t v26 = *(void *)(v50 + 24);
  uint64_t v27 = v54++;
  Bytes = GTTraceMemPool_allocateBytes(v26, v52, v27 | 0x7800000000LL);
  *(_BYTE *)(v25 + 13) = v27;
  uint64_t v29 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v30 = (uint64_t *)[v18 traceStream];
  if (v30) {
    uint64_t v31 = *v30;
  }
  else {
    uint64_t v31 = 0LL;
  }
  unint64_t v33 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t v34 = a6->var2;
  unint64_t v35 = a7->var0;
  unint64_t v36 = a7->var1;
  unint64_t v37 = a7->var2;
  uint64_t v38 = (uint64_t *)[v19 traceStream];
  if (v38) {
    uint64_t v39 = *v38;
  }
  else {
    uint64_t v39 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v31;
  *((void *)Bytes + 4) = v43;
  *((void *)Bytes + 5) = v44;
  *((void *)Bytes + 6) = v33;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = v34;
  *((void *)Bytes + 9) = v35;
  *((void *)Bytes + 10) = v36;
  *((void *)Bytes + 11) = v37;
  *((void *)Bytes + 12) = v39;
  *((void *)Bytes + 13) = a9;
  *((void *)Bytes + 14) = a10;
  *((void *)Bytes + 15) = a11;
  *((void *)Bytes + 16) = a12;
  s();
  *(void *)uint64_t v40 = v41;
  *(_BYTE *)(v40 + 8) = v53;
  *(_BYTE *)(v51 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v16 = a3;
  id v17 = a8;
  [v16 touch];
  if (v16)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v16);
    }
  }

  [v17 touch];
  if (v17)
  {
    id v19 = self->_retainedObjects;
    if (v19) {
      -[NSMutableSet addObject:](v19, "addObject:", v17);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v51);
  baseObject = self->_baseObject;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v16 baseObject]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 baseObject]);
  __int128 v49 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  __int128 v47 = *(_OWORD *)&a7->var0;
  unint64_t v48 = a7->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v46 = *a11;
  unint64_t v43 = a5;
  -[MTLBlitCommandEncoderSPI copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:]( baseObject,  "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:",  v21,  a4,  a5,  &v49,  &v47,  v22,  a9,  a10,  &v46);

  uint64_t v23 = v53;
  *(_DWORD *)(v53 + 8) = -16382;
  uint64_t v24 = *(void *)(v52 + 24);
  uint64_t v25 = v56++;
  Bytes = GTTraceMemPool_allocateBytes(v24, v54, v25 | 0x8000000000LL);
  *(_BYTE *)(v23 + 13) = v25;
  uint64_t v27 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v29 = (uint64_t *)[v16 traceStream];
  unint64_t v44 = v16;
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  unint64_t v32 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t v33 = a6->var2;
  unint64_t v35 = a7->var0;
  unint64_t v34 = a7->var1;
  unint64_t v36 = a7->var2;
  unint64_t v37 = (uint64_t *)[v17 traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0LL;
  }
  unint64_t v39 = a11->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v30;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = v43;
  *((void *)Bytes + 12) = v38;
  *((void *)Bytes + 13) = a9;
  *((void *)Bytes + 14) = a10;
  __int128 v40 = *(_OWORD *)&a11->var0;
  *((void *)Bytes + 6) = v32;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = v33;
  *((void *)Bytes + 9) = v35;
  *((void *)Bytes + 10) = v34;
  *((void *)Bytes + 11) = v36;
  *(_OWORD *)(Bytes + 120) = v40;
  *((void *)Bytes + 17) = v39;
  s();
  *(void *)uint64_t v41 = v42;
  *(_BYTE *)(v41 + 8) = v55;
  *(_BYTE *)(v53 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  id v17 = a3;
  id v18 = a8;
  [v17 touch];
  if (v17)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v17);
    }
  }

  [v18 touch];
  if (v18)
  {
    unsigned __int8 v20 = self->_retainedObjects;
    if (v20) {
      -[NSMutableSet addObject:](v20, "addObject:", v18);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v52);
  baseObject = self->_baseObject;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 baseObject]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 baseObject]);
  __int128 v50 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  __int128 v48 = *(_OWORD *)&a7->var0;
  unint64_t v49 = a7->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v47 = *a11;
  unint64_t v44 = a5;
  -[MTLBlitCommandEncoderSPI copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:]( baseObject,  "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinat ionOrigin:options:",  v22,  a4,  a5,  &v50,  &v48,  v23,  a9,  a10,  &v47,  a12);

  uint64_t v24 = v54;
  *(_DWORD *)(v54 + 8) = -16211;
  uint64_t v25 = *(void *)(v53 + 24);
  uint64_t v26 = v57++;
  Bytes = GTTraceMemPool_allocateBytes(v25, v55, v26 | 0x8800000000LL);
  *(_BYTE *)(v24 + 13) = v26;
  uint64_t v28 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v30 = (uint64_t *)[v17 traceStream];
  __int128 v45 = v17;
  if (v30) {
    uint64_t v31 = *v30;
  }
  else {
    uint64_t v31 = 0LL;
  }
  unint64_t v33 = a6->var0;
  unint64_t var1 = a6->var1;
  unint64_t v34 = a6->var2;
  unint64_t v36 = a7->var0;
  unint64_t v35 = a7->var1;
  unint64_t v37 = a7->var2;
  uint64_t v38 = (uint64_t *)[v18 traceStream];
  if (v38) {
    uint64_t v39 = *v38;
  }
  else {
    uint64_t v39 = 0LL;
  }
  unint64_t v40 = a11->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v31;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = v44;
  *((void *)Bytes + 12) = v39;
  *((void *)Bytes + 13) = a9;
  *((void *)Bytes + 14) = a10;
  __int128 v41 = *(_OWORD *)&a11->var0;
  *((void *)Bytes + 6) = v33;
  *((void *)Bytes + 7) = var1;
  *((void *)Bytes + 8) = v34;
  *((void *)Bytes + 9) = v36;
  *((void *)Bytes + 10) = v35;
  *((void *)Bytes + 11) = v37;
  *(_OWORD *)(Bytes + 120) = v41;
  *((void *)Bytes + 17) = v40;
  *((void *)Bytes + 18) = a12;
  s();
  *(void *)uint64_t v42 = v43;
  *(_BYTE *)(v42 + 8) = v56;
  *(_BYTE *)(v54 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  id v14 = a3;
  id v15 = a6;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v14);
    }
  }

  [v15 touch];
  if (v15)
  {
    id v17 = self->_retainedObjects;
    if (v17) {
      -[NSMutableSet addObject:](v17, "addObject:", v15);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v35);
  baseObject = self->_baseObject;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  -[MTLBlitCommandEncoderSPI copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:]( baseObject,  "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:",  v19,  a4,  a5,  v20,  a7,  a8,  a9,  a10);

  uint64_t v21 = v37;
  *(_DWORD *)(v37 + 8) = -15878;
  uint64_t v22 = *(void *)(v36 + 24);
  uint64_t v23 = v40++;
  Bytes = GTTraceMemPool_allocateBytes(v22, v38, v23 | 0x4800000000LL);
  *(_BYTE *)(v21 + 13) = v23;
  uint64_t v25 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v27 = (uint64_t *)[v14 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0LL;
  }
  uint64_t v29 = (uint64_t *)[v15 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v28;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v30;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = a8;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  s();
  *(void *)uint64_t v31 = v32;
  *(_BYTE *)(v31 + 8) = v39;
  *(_BYTE *)(v37 + 15) |= 8u;
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v6);
    }
  }

  [v7 touch];
  if (v7)
  {
    uint64_t v9 = self->_retainedObjects;
    if (v9) {
      -[NSMutableSet addObject:](v9, "addObject:", v7);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v26);
  baseObject = self->_baseObject;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  -[MTLBlitCommandEncoderSPI copyFromTexture:toTexture:](baseObject, "copyFromTexture:toTexture:", v11, v12);

  uint64_t v13 = v27;
  *(_DWORD *)(v27 + 8) = -15877;
  unsigned __int8 v14 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v16 = *(void *)(v26[1] + 24LL);
    uint64_t v17 = v31++;
    id v15 = GTTraceMemPool_allocateBytes(v16, v28, v17 | 0x1800000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    id v15 = (char *)(v13 + v30);
    v30 += 24;
  }

  *(_BYTE *)(v13 + 13) = v14;
  id v18 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v20 = (uint64_t *)[v6 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0LL;
  }
  uint64_t v22 = (uint64_t *)[v7 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  *(void *)id v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v23;
  s();
  *(void *)uint64_t v24 = v25;
  *(_BYTE *)(v24 + 8) = v29;
  *(_BYTE *)(v27 + 15) |= 8u;
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  [v11 touch];
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v11);
    }
  }

  [v12 touch];
  if (v12)
  {
    unsigned __int8 v14 = self->_retainedObjects;
    if (v14) {
      -[NSMutableSet addObject:](v14, "addObject:", v12);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v31);
  baseObject = self->_baseObject;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLBlitCommandEncoderSPI copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:]( baseObject,  "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:",  v16,  location,  length,  v17,  a6);

  uint64_t v18 = v32;
  *(_DWORD *)(v32 + 8) = -15959;
  unsigned __int8 v19 = v35;
  if (v35 > 0x10uLL)
  {
    uint64_t v21 = *(void *)(v31[1] + 24LL);
    uint64_t v22 = v36++;
    unsigned __int8 v20 = GTTraceMemPool_allocateBytes(v21, v33, v22 | 0x3000000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    unsigned __int8 v20 = (char *)(v18 + v35);
    v35 += 48;
  }

  *(_BYTE *)(v18 + 13) = v19;
  uint64_t v23 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v25 = (uint64_t *)[v11 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0LL;
  }
  uint64_t v27 = (uint64_t *)[v12 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0LL;
  }
  *(void *)unsigned __int8 v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = location;
  *((void *)v20 + 3) = length;
  *((void *)v20 + 4) = v28;
  *((void *)v20 + 5) = a6;
  s();
  *(void *)uint64_t v29 = v30;
  *(_BYTE *)(v29 + 8) = v34;
  *(_BYTE *)(v32 + 15) |= 8u;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16383;
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
  uint64_t v8 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLBlitCommandEncoder;
  -[CaptureMTLBlitCommandEncoder dealloc](&v12, "dealloc");
}

- (void)endEncoding
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16376;
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
  uint64_t v8 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
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

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  [v9 touch];
  if (v9)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v9);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v24);
  baseObject = self->_baseObject;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLBlitCommandEncoderSPI fillBuffer:range:pattern4:]( baseObject,  "fillBuffer:range:pattern4:",  v12,  location,  length,  v5);

  uint64_t v13 = v25;
  *(_DWORD *)(v25 + 8) = -15474;
  unsigned __int8 v14 = v28;
  if (v28 > 0x18uLL)
  {
    uint64_t v16 = *(void *)(v24[1] + 24LL);
    uint64_t v17 = v29++;
    char v15 = GTTraceMemPool_allocateBytes(v16, v26, v17 | 0x2800000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    char v15 = (char *)(v13 + v28);
    v28 += 40;
  }

  *(_BYTE *)(v13 + 13) = v14;
  unsigned __int8 v18 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v20 = (uint64_t *)[v9 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0LL;
  }
  *(void *)char v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = location;
  *((void *)v15 + 3) = length;
  *((_DWORD *)v15 + 8) = v5;
  *((_DWORD *)v15 + 9) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(_BYTE *)(v22 + 8) = v27;
  *(_BYTE *)(v25 + 15) |= 8u;
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  [v9 touch];
  if (v9)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v9);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v24);
  baseObject = self->_baseObject;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLBlitCommandEncoderSPI fillBuffer:range:value:](baseObject, "fillBuffer:range:value:", v12, location, length, v5);

  uint64_t v13 = v25;
  *(_DWORD *)(v25 + 8) = -16378;
  unsigned __int8 v14 = v28;
  if (v28 > 0x18uLL)
  {
    uint64_t v16 = *(void *)(v24[1] + 24LL);
    uint64_t v17 = v29++;
    char v15 = GTTraceMemPool_allocateBytes(v16, v26, v17 | 0x2800000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    char v15 = (char *)(v13 + v28);
    v28 += 40;
  }

  *(_BYTE *)(v13 + 13) = v14;
  unsigned __int8 v18 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v20 = (uint64_t *)[v9 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0LL;
  }
  *(void *)char v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = location;
  *((void *)v15 + 3) = length;
  v15[32] = v5;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(_BYTE *)(v22 + 8) = v27;
  *(_BYTE *)(v25 + 15) |= 8u;
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  id v14 = a3;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v14);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v37);
  baseObject = self->_baseObject;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  __int128 v18 = *(_OWORD *)&a6->var0.var2;
  v36[0] = *(_OWORD *)&a6->var0.var0;
  v36[1] = v18;
  v36[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLBlitCommandEncoderSPI fillTexture:level:slice:region:bytes:length:]( baseObject,  "fillTexture:level:slice:region:bytes:length:",  v17,  a4,  a5,  v36,  a7,  a8);

  uint64_t v19 = v39;
  *(_DWORD *)(v39 + 8) = -15473;
  uint64_t v20 = *(void *)(v38 + 24);
  uint64_t v21 = v42++;
  Bytes = GTTraceMemPool_allocateBytes(v20, v40, v21 | 0x6000000000LL);
  *(_BYTE *)(v19 + 13) = v21;
  uint64_t v23 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v25 = (uint64_t *)[v14 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0LL;
  }
  __int128 v27 = *(_OWORD *)&a6->var0.var0;
  __int128 v28 = *(_OWORD *)&a6->var0.var2;
  __int128 v29 = *(_OWORD *)&a6->var1.var1;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    __int128 v34 = *(_OWORD *)&a6->var0.var2;
    __int128 v35 = *(_OWORD *)&a6->var0.var0;
    __int128 v33 = *(_OWORD *)&a6->var1.var1;
    char v30 = GTTraceEncoder_storeBlob((uint64_t)v37, a7, a8);
    __int128 v29 = v33;
    __int128 v28 = v34;
    __int128 v27 = v35;
  }

  else
  {
    char v30 = 0;
  }

  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v26;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((_OWORD *)Bytes + 3) = v27;
  *((_OWORD *)Bytes + 4) = v28;
  *((_OWORD *)Bytes + 5) = v29;
  *((void *)Bytes + 12) = a8;
  Bytes[104] = v30;
  *(_DWORD *)(Bytes + 105) = 0;
  *((_DWORD *)Bytes + 27) = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(_BYTE *)(v31 + 8) = v41;
  *(_BYTE *)(v39 + 15) |= 8u;
}

- (void)generateMipmapsForTexture:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLBlitCommandEncoderSPI generateMipmapsForTexture:](baseObject, "generateMipmapsForTexture:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16379;
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
  uint64_t v13 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v15 = (uint64_t *)[v4 traceStream];
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

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a8;
  [v15 touch];
  if (v15)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v15);
    }
  }

  [v16 touch];
  if (v16)
  {
    uint64_t v18 = self->_retainedObjects;
    if (v18) {
      -[NSMutableSet addObject:](v18, "addObject:", v16);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v46);
  baseObject = self->_baseObject;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v16 baseObject]);
  __int128 v22 = *(_OWORD *)&a4->var0.var2;
  v45[0] = *(_OWORD *)&a4->var0.var0;
  v45[1] = v22;
  v45[2] = *(_OWORD *)&a4->var1.var1;
  unint64_t v43 = a6;
  BOOL v44 = v10;
  -[MTLBlitCommandEncoderSPI getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:]( baseObject,  "getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:",  v20,  v45,  a5,  a6,  v10,  v21,  a9);

  uint64_t v23 = v48;
  *(_DWORD *)(v48 + 8) = -15977;
  uint64_t v24 = *(void *)(v47 + 24);
  uint64_t v25 = v51++;
  Bytes = GTTraceMemPool_allocateBytes(v24, v49, v25 | 0x6800000000LL);
  *(_BYTE *)(v23 + 13) = v25;
  __int128 v27 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v42 = v15;
  __int128 v28 = (uint64_t *)[v15 traceStream];
  unint64_t v29 = a5;
  if (v28) {
    uint64_t v30 = *v28;
  }
  else {
    uint64_t v30 = 0LL;
  }
  unint64_t v32 = a4->var0.var0;
  unint64_t var1 = a4->var0.var1;
  unint64_t var2 = a4->var0.var2;
  unint64_t v33 = a4->var1.var0;
  unint64_t v36 = a4->var1.var1;
  unint64_t v35 = a4->var1.var2;
  uint64_t v37 = (uint64_t *)[v16 traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v30;
  *((void *)Bytes + 4) = v32;
  *((void *)Bytes + 5) = var1;
  *((void *)Bytes + 6) = var2;
  *((void *)Bytes + 7) = v33;
  *((void *)Bytes + 8) = v36;
  *((void *)Bytes + 9) = v35;
  *((void *)Bytes + 10) = v29;
  *((void *)Bytes + 11) = v43;
  *((void *)Bytes + 12) = v38;
  *((void *)Bytes + 13) = a9;
  *((_DWORD *)Bytes + 28) = v44;
  *((_DWORD *)Bytes + 29) = 0;
  s();
  *(void *)uint64_t v39 = v40;
  *(_BYTE *)(v39 + 8) = v50;
  *(_BYTE *)(v48 + 15) |= 8u;
}

- (void)insertDebugSignpost:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLBlitCommandEncoderSPI insertDebugSignpost:](self->_baseObject, "insertDebugSignpost:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16375;
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
  BOOL v10 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
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

- (void)invalidateCompressedTexture:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLBlitCommandEncoderSPI invalidateCompressedTexture:](baseObject, "invalidateCompressedTexture:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15470;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    BOOL v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    BOOL v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  id v13 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)BOOL v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLBlitCommandEncoderSPI invalidateCompressedTexture:slice:level:]( baseObject,  "invalidateCompressedTexture:slice:level:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15469;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLBlitCommandEncoderSPI optimizeContentsForCPUAccess:](baseObject, "optimizeContentsForCPUAccess:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15993;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    BOOL v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    BOOL v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  unsigned __int8 v13 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)BOOL v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLBlitCommandEncoderSPI optimizeContentsForCPUAccess:slice:level:]( baseObject,  "optimizeContentsForCPUAccess:slice:level:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15992;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLBlitCommandEncoderSPI optimizeContentsForGPUAccess:](baseObject, "optimizeContentsForGPUAccess:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15995;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    BOOL v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    BOOL v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  unsigned __int8 v13 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)BOOL v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLBlitCommandEncoderSPI optimizeContentsForGPUAccess:slice:level:]( baseObject,  "optimizeContentsForGPUAccess:slice:level:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15994;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [v7 touch];
  if (v7)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v7);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v22);
  baseObject = self->_baseObject;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  -[MTLBlitCommandEncoderSPI optimizeIndirectCommandBuffer:withRange:]( baseObject,  "optimizeIndirectCommandBuffer:withRange:",  v10,  location,  length);

  uint64_t v11 = v23;
  *(_DWORD *)(v23 + 8) = -15958;
  unsigned __int8 v12 = v26;
  if (v26 > 0x20uLL)
  {
    uint64_t v14 = *(void *)(v22[1] + 24LL);
    uint64_t v15 = v27++;
    unsigned __int8 v13 = GTTraceMemPool_allocateBytes(v14, v24, v15 | 0x2000000000LL) + 16;
    unsigned __int8 v12 = v15;
  }

  else
  {
    unsigned __int8 v13 = (char *)(v11 + v26);
    v26 += 32;
  }

  *(_BYTE *)(v11 + 13) = v12;
  uint64_t v16 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v18 = (uint64_t *)[v7 traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  *(void *)unsigned __int8 v13 = var0;
  *((void *)v13 + 1) = v19;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  s();
  *(void *)uint64_t v20 = v21;
  *(_BYTE *)(v20 + 8) = v25;
  *(_BYTE *)(v23 + 15) |= 8u;
}

- (void)popDebugGroup
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16373;
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
  id v8 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
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
  -[MTLBlitCommandEncoderSPI pushDebugGroup:](self->_baseObject, "pushDebugGroup:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16374;
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
  uint64_t v10 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
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

- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [v7 touch];
  if (v7)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v7);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v22);
  baseObject = self->_baseObject;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  -[MTLBlitCommandEncoderSPI resetCommandsInBuffer:withRange:]( baseObject,  "resetCommandsInBuffer:withRange:",  v10,  location,  length);

  uint64_t v11 = v23;
  *(_DWORD *)(v23 + 8) = -15960;
  unsigned __int8 v12 = v26;
  if (v26 > 0x20uLL)
  {
    uint64_t v14 = *(void *)(v22[1] + 24LL);
    uint64_t v15 = v27++;
    id v13 = GTTraceMemPool_allocateBytes(v14, v24, v15 | 0x2000000000LL) + 16;
    unsigned __int8 v12 = v15;
  }

  else
  {
    id v13 = (char *)(v11 + v26);
    v26 += 32;
  }

  *(_BYTE *)(v11 + 13) = v12;
  size_t v16 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v18 = (uint64_t *)[v7 traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  *(void *)id v13 = var0;
  *((void *)v13 + 1) = v19;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  s();
  *(void *)uint64_t v20 = v21;
  *(_BYTE *)(v20 + 8) = v25;
  *(_BYTE *)(v23 + 15) |= 8u;
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  __int128 v14 = *(_OWORD *)&a4->var0.var2;
  v27[0] = *(_OWORD *)&a4->var0.var0;
  v27[1] = v14;
  v27[2] = *(_OWORD *)&a4->var1.var1;
  -[MTLBlitCommandEncoderSPI resetTextureAccessCounters:region:mipLevel:slice:]( baseObject,  "resetTextureAccessCounters:region:mipLevel:slice:",  v13,  v27,  a5,  a6);

  uint64_t v15 = v30;
  *(_DWORD *)(v30 + 8) = -15976;
  uint64_t v16 = *(void *)(v29 + 24);
  uint64_t v17 = v33++;
  Bytes = GTTraceMemPool_allocateBytes(v16, v31, v17 | 0x5000000000LL);
  *(_BYTE *)(v15 + 13) = v17;
  uint64_t v19 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = (uint64_t *)[v10 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v22;
  __int128 v23 = *(_OWORD *)&a4->var0.var2;
  __int128 v24 = *(_OWORD *)&a4->var1.var1;
  *((_OWORD *)Bytes + 2) = *(_OWORD *)&a4->var0.var0;
  *((_OWORD *)Bytes + 3) = v23;
  *((_OWORD *)Bytes + 4) = v24;
  *((void *)Bytes + 10) = a5;
  *((void *)Bytes + 11) = a6;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLBlitCommandEncoderSPI sampleCountersInBuffer:atSampleIndex:withBarrier:]( baseObject,  "sampleCountersInBuffer:atSampleIndex:withBarrier:",  v11,  a4,  v5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15755;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    __int128 v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    __int128 v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)__int128 v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((_DWORD *)v14 + 6) = v5;
  *((_DWORD *)v14 + 7) = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)updateFence:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLBlitCommandEncoderSPI updateFence:](baseObject, "updateFence:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16124;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    id v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    id v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  unsigned __int8 v13 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)id v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)waitForFence:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLBlitCommandEncoderSPI waitForFence:](baseObject, "waitForFence:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16131;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    id v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    id v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  unsigned __int8 v13 = -[CaptureMTLBlitCommandEncoder traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)id v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void).cxx_destruct
{
}

void *__92__CaptureMTLBlitCommandEncoder_resolveCounters_inRange_destinationBuffer_destinationOffset___block_invoke( uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  if (v3) {
    BOOL v5 = (void *)(v3 + 16);
  }
  else {
    BOOL v5 = 0LL;
  }
  return memcpy( v5, [v2 contents], (size_t)objc_msgSend(*(id *)(a1 + 32), "length"));
}

@end