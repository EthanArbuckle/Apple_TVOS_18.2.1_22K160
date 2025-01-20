@interface CaptureMTLResourceStateCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLResourceStateCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLResourceStateCommandEncoder)baseObject;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)copyMappingStateFromTexture:(id)a3 mipLevel:(unint64_t)a4 slice:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7 numTiles:(unint64_t)a8;
- (void)dealloc;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setLabel:(id)a3;
- (void)touch;
- (void)updateFence:(id)a3;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6;
- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7;
- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8;
- (void)waitForFence:(id)a3;
@end

@implementation CaptureMTLResourceStateCommandEncoder

- (CaptureMTLResourceStateCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CaptureMTLResourceStateCommandEncoder;
  v9 = -[CaptureMTLResourceStateCommandEncoder init](&v22, "init");
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

- (MTLResourceStateCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  traceContext = self->_traceContext;
  id v15 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v31);
  baseObject = self->_baseObject;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  -[MTLResourceStateCommandEncoderSPI updateTextureMappings:mode:regions:mipLevels:slices:numRegions:]( baseObject,  "updateTextureMappings:mode:regions:mipLevels:slices:numRegions:",  v17,  a4,  a5,  a6,  a7,  a8);

  uint64_t v18 = v32;
  *(_DWORD *)(v32 + 8) = -15782;
  unsigned __int8 v19 = v35;
  if (v35 > 0x18uLL)
  {
    uint64_t v21 = *(void *)(v31[1] + 24LL);
    uint64_t v22 = v36++;
    v20 = GTTraceMemPool_allocateBytes(v21, v33, v22 | 0x2800000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    v20 = (char *)(v18 + v35);
    v35 += 40;
  }

  *(_BYTE *)(v18 + 13) = v19;
  v23 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v25 = [v15 traceStream];

  if (v25) {
    v25 = (void *)*v25;
  }
  char v26 = TransferBytes((uint64_t)v31, (uint64_t *)a5, (const void *)(48 * a8));
  char v27 = TransferBytes((uint64_t)v31, (uint64_t *)a6, (const void *)(8 * a8));
  char v28 = TransferBytes((uint64_t)v31, (uint64_t *)a7, (const void *)(8 * a8));
  *(void *)v20 = var0;
  *((void *)v20 + 1) = v25;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a8;
  v20[32] = v26;
  v20[33] = v27;
  v20[34] = v28;
  *(_DWORD *)(v20 + 35) = 0;
  v20[39] = 0;
  s();
  *(void *)uint64_t v29 = v30;
  *(_BYTE *)(v29 + 8) = v34;
  *(_BYTE *)(v32 + 15) |= 8u;
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v15 = a3;
  id v16 = a8;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLResourceStateCommandEncoder_moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sou rceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin",  (uint64_t)"Fast Storage",  0LL,  0LL);
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

  baseObject = self->_baseObject;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v16 baseObject]);
  __int128 v27 = *(_OWORD *)&a6->var0;
  unint64_t var2 = a6->var2;
  __int128 v25 = *(_OWORD *)&a7->var0;
  unint64_t v26 = a7->var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a11;
  -[MTLResourceStateCommandEncoderSPI moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:]( baseObject,  "moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinatio nLevel:destinationOrigin:",  v20,  a4,  a5,  &v27,  &v25,  v21,  a9,  a10,  &v24);
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLResourceStateCommandEncoder;
  uint64_t v3 = -[CaptureMTLResourceStateCommandEncoder description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLResourceStateCommandEncoderSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLResourceStateCommandEncoderSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

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
  return (NSString *)-[MTLResourceStateCommandEncoderSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLResourceStateCommandEncoderSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15794;
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
  v10 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
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

- (void)copyMappingStateFromTexture:(id)a3 mipLevel:(unint64_t)a4 slice:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7 numTiles:(unint64_t)a8
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
    uint64_t v17 = self->_retainedObjects;
    if (v17) {
      -[NSMutableSet addObject:](v17, "addObject:", v15);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v34);
  baseObject = self->_baseObject;
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  -[MTLResourceStateCommandEncoderSPI copyMappingStateFromTexture:mipLevel:slice:toBuffer:offset:numTiles:]( baseObject,  "copyMappingStateFromTexture:mipLevel:slice:toBuffer:offset:numTiles:",  v19,  a4,  a5,  v20,  a7,  a8);

  uint64_t v21 = v35;
  *(_DWORD *)(v35 + 8) = -15792;
  unsigned __int8 v22 = v38;
  if (v38 > 8uLL)
  {
    uint64_t v24 = *(void *)(v34[1] + 24LL);
    uint64_t v25 = v39++;
    unsigned __int8 v23 = GTTraceMemPool_allocateBytes(v24, v36, v25 | 0x3800000000LL) + 16;
    unsigned __int8 v22 = v25;
  }

  else
  {
    unsigned __int8 v23 = (char *)(v21 + v38);
    v38 += 56;
  }

  *(_BYTE *)(v21 + 13) = v22;
  unint64_t v26 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v28 = (uint64_t *)[v14 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0LL;
  }
  uint64_t v30 = (uint64_t *)[v15 traceStream];
  if (v30) {
    uint64_t v31 = *v30;
  }
  else {
    uint64_t v31 = 0LL;
  }
  *(void *)unsigned __int8 v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = a4;
  *((void *)v23 + 3) = a5;
  *((void *)v23 + 4) = v31;
  *((void *)v23 + 5) = a7;
  *((void *)v23 + 6) = a8;
  s();
  *(void *)uint64_t v32 = v33;
  *(_BYTE *)(v32 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15790;
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
  uint64_t v8 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLResourceStateCommandEncoder;
  -[CaptureMTLResourceStateCommandEncoder dealloc](&v12, "dealloc");
}

- (void)endEncoding
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15789;
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
  uint64_t v8 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
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
  -[MTLResourceStateCommandEncoderSPI insertDebugSignpost:](self->_baseObject, "insertDebugSignpost:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15788;
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
  uint64_t v10 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
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
  *(_DWORD *)(v13 + 8) = -15787;
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
  uint64_t v8 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
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
  -[MTLResourceStateCommandEncoderSPI pushDebugGroup:](self->_baseObject, "pushDebugGroup:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15786;
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
  uint64_t v10 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLResourceStateCommandEncoderSPI updateFence:](baseObject, "updateFence:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15785;
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
  id v13 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
    }
  }

  [v11 touch];
  if (v11)
  {
    id v13 = self->_retainedObjects;
    if (v13) {
      -[NSMutableSet addObject:](v13, "addObject:", v11);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v30);
  baseObject = self->_baseObject;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  -[MTLResourceStateCommandEncoderSPI updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:]( baseObject,  "updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:",  v15,  a4,  v16,  a6);

  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -15784;
  unsigned __int8 v18 = v34;
  if (v34 > 0x18uLL)
  {
    uint64_t v20 = *(void *)(v30[1] + 24LL);
    uint64_t v21 = v35++;
    unsigned __int8 v19 = GTTraceMemPool_allocateBytes(v20, v32, v21 | 0x2800000000LL) + 16;
    unsigned __int8 v18 = v21;
  }

  else
  {
    unsigned __int8 v19 = (char *)(v17 + v34);
    v34 += 40;
  }

  *(_BYTE *)(v17 + 13) = v18;
  char v22 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v24 = (uint64_t *)[v10 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  unint64_t v26 = (uint64_t *)[v11 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  *(void *)unsigned __int8 v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = v27;
  *((void *)v19 + 4) = a6;
  s();
  *(void *)uint64_t v28 = v29;
  *(_BYTE *)(v28 + 8) = v33;
  *(_BYTE *)(v31 + 15) |= 8u;
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  id v12 = a3;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v30);
  baseObject = self->_baseObject;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  __int128 v16 = *(_OWORD *)&a5->var0.var2;
  v29[0] = *(_OWORD *)&a5->var0.var0;
  v29[1] = v16;
  v29[2] = *(_OWORD *)&a5->var1.var1;
  -[MTLResourceStateCommandEncoderSPI updateTextureMapping:mode:region:mipLevel:slice:]( baseObject,  "updateTextureMapping:mode:region:mipLevel:slice:",  v15,  a4,  v29,  a6,  a7);

  uint64_t v17 = v32;
  *(_DWORD *)(v32 + 8) = -15783;
  uint64_t v18 = *(void *)(v31 + 24);
  uint64_t v19 = v35++;
  Bytes = GTTraceMemPool_allocateBytes(v18, v33, v19 | 0x5800000000LL);
  *(_BYTE *)(v17 + 13) = v19;
  uint64_t v21 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v23 = (uint64_t *)[v12 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v24;
  *((void *)Bytes + 4) = a4;
  __int128 v25 = *(_OWORD *)&a5->var0.var2;
  __int128 v26 = *(_OWORD *)&a5->var1.var1;
  *(_OWORD *)(Bytes + 40) = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)(Bytes + 56) = v25;
  *(_OWORD *)(Bytes + 72) = v26;
  *((void *)Bytes + 11) = a6;
  *((void *)Bytes + 12) = a7;
  s();
  *(void *)uint64_t v27 = v28;
  *(_BYTE *)(v27 + 8) = v34;
  *(_BYTE *)(v32 + 15) |= 8u;
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLResourceStateCommandEncoderSPI waitForFence:](baseObject, "waitForFence:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15781;
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
  id v13 = -[CaptureMTLResourceStateCommandEncoder traceStream](self, "traceStream");
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

@end