@interface CaptureMTLIndirectRenderCommand
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)hasBarrier;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLIndirectRenderCommand)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLIndirectRenderCommand)baseObject;
- (NSString)description;
- (id)drawArguments;
- (id)drawIndexedArguments;
- (id)drawIndexedPatchesArguments;
- (id)drawMeshThreadgroupsArguments;
- (id)drawMeshThreadsArguments;
- (id)drawPatchesArguments;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)getTessellationFactorArguments;
- (id)originalObject;
- (unint64_t)getCommandType;
- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3;
- (unint64_t)getOptimizedStatus;
- (unint64_t)getPipelineStateUniqueIdentifier;
- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3;
- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)streamReference;
- (void)clearBarrier;
- (void)dealloc;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)getFragmentBufferAtIndex:(unint64_t)a3;
- (void)getVertexBufferAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setBarrier;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineState:(id)a3;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)touch;
@end

@implementation CaptureMTLIndirectRenderCommand

- (CaptureMTLIndirectRenderCommand)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CaptureMTLIndirectRenderCommand;
  v8 = -[CaptureMTLIndirectRenderCommand init](&v13, "init");
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

- (MTLIndirectRenderCommand)baseObject
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLIndirectRenderCommand;
  uint64_t v3 = -[CaptureMTLIndirectRenderCommand description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLIndirectRenderCommandSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLIndirectRenderCommandSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

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

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15957;
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
  objc_super v8 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLIndirectRenderCommand;
  -[CaptureMTLIndirectRenderCommand dealloc](&v12, "dealloc");
}

- (id)drawArguments
{
  return -[MTLIndirectRenderCommandSPI drawArguments](self->_baseObject, "drawArguments");
}

- (id)drawIndexedArguments
{
  return -[MTLIndirectRenderCommandSPI drawIndexedArguments](self->_baseObject, "drawIndexedArguments");
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11 tessellationFactorBuffer:(id)a12 tessellationFactorBufferOffset:(unint64_t)a13 tessellationFactorBufferInstanceStride:(unint64_t)a14
{
  traceContext = self->_traceContext;
  id v18 = a12;
  id v19 = a8;
  id v20 = a6;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v44);
  baseObject = self->_baseObject;
  v40 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 baseObject]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v19 baseObject]);
  v41 = v18;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v18 baseObject]);
  -[MTLIndirectRenderCommandSPI drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:]( baseObject,  "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPoin tIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFa ctorBufferInstanceStride:",  a3,  a4,  a5,  v22,  a9,  a10,  a11,  v24,  a13,  a14);

  uint64_t v25 = v46;
  *(_DWORD *)(v46 + 8) = -15950;
  uint64_t v26 = *(void *)(v45 + 24);
  uint64_t v27 = v49++;
  Bytes = GTTraceMemPool_allocateBytes(v26, v47, v27 | 0x6800000000LL);
  *(_BYTE *)(v25 + 13) = v27;
  v29 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v31 = (uint64_t *)[v40 traceStream];

  if (v31) {
    uint64_t v32 = *v31;
  }
  else {
    uint64_t v32 = 0LL;
  }
  v33 = [v19 traceStream];

  if (v33) {
    v33 = (void *)*v33;
  }
  v34 = (uint64_t *)[v41 traceStream];

  if (v34) {
    uint64_t v35 = *v34;
  }
  else {
    uint64_t v35 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v32;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = v33;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  *((void *)Bytes + 11) = a11;
  *((void *)Bytes + 12) = v35;
  *((void *)Bytes + 13) = a13;
  *((void *)Bytes + 14) = a14;
  s();
  *(void *)uint64_t v36 = v37;
  *(_BYTE *)(v36 + 8) = v48;
  *(_BYTE *)(v46 + 15) |= 8u;
}

- (id)drawIndexedPatchesArguments
{
  return -[MTLIndirectRenderCommandSPI drawIndexedPatchesArguments](self->_baseObject, "drawIndexedPatchesArguments");
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  traceContext = self->_traceContext;
  id v16 = a6;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v31);
  baseObject = self->_baseObject;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 baseObject]);
  unint64_t v30 = a8;
  -[MTLIndirectRenderCommandSPI drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:]( baseObject,  "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:",  a3,  a4,  a5,  v18,  a7,  a8,  a9,  a10);

  uint64_t v19 = v33;
  *(_DWORD *)(v33 + 8) = -15948;
  uint64_t v20 = *(void *)(v32 + 24);
  uint64_t v21 = v36++;
  Bytes = GTTraceMemPool_allocateBytes(v20, v34, v21 | 0x4800000000LL);
  *(_BYTE *)(v19 + 13) = v21;
  v23 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v25 = (uint64_t *)[v16 traceStream];

  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v26;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = v30;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  s();
  *(void *)uint64_t v27 = v28;
  *(_BYTE *)(v27 + 8) = v35;
  *(_BYTE *)(v33 + 15) |= 8u;
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a5;
  -[MTLIndirectRenderCommandSPI drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]( baseObject,  "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:",  &v25,  &v24,  &v23);
  uint64_t v10 = v28;
  *(_DWORD *)(v28 + 8) = -15266;
  uint64_t v11 = *(void *)(v27 + 24);
  uint64_t v12 = v31++;
  Bytes = GTTraceMemPool_allocateBytes(v11, v29, v12 | 0x5000000000LL);
  *(_BYTE *)(v10 + 13) = v12;
  uint64_t v14 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = a3->var2;
  unint64_t v17 = a4->var2;
  unint64_t v18 = a5->var2;
  *((void *)Bytes + 2) = var0;
  __int128 v19 = *(_OWORD *)&a4->var0;
  __int128 v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = var2;
  *((_OWORD *)Bytes + 3) = v19;
  *((void *)Bytes + 8) = v17;
  *(_OWORD *)(Bytes + 72) = v20;
  *((void *)Bytes + 11) = v18;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (id)drawMeshThreadgroupsArguments
{
  return -[MTLIndirectRenderCommandSPI drawMeshThreadgroupsArguments]( self->_baseObject,  "drawMeshThreadgroupsArguments");
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a5;
  -[MTLIndirectRenderCommandSPI drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]( baseObject,  "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:",  &v25,  &v24,  &v23);
  uint64_t v10 = v28;
  *(_DWORD *)(v28 + 8) = -15265;
  uint64_t v11 = *(void *)(v27 + 24);
  uint64_t v12 = v31++;
  Bytes = GTTraceMemPool_allocateBytes(v11, v29, v12 | 0x5000000000LL);
  *(_BYTE *)(v10 + 13) = v12;
  uint64_t v14 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = a3->var2;
  unint64_t v17 = a4->var2;
  unint64_t v18 = a5->var2;
  *((void *)Bytes + 2) = var0;
  __int128 v19 = *(_OWORD *)&a4->var0;
  __int128 v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = var2;
  *((_OWORD *)Bytes + 3) = v19;
  *((void *)Bytes + 8) = v17;
  *(_OWORD *)(Bytes + 72) = v20;
  *((void *)Bytes + 11) = v18;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (id)drawMeshThreadsArguments
{
  return -[MTLIndirectRenderCommandSPI drawMeshThreadsArguments](self->_baseObject, "drawMeshThreadsArguments");
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9 tessellationFactorBuffer:(id)a10 tessellationFactorBufferOffset:(unint64_t)a11 tessellationFactorBufferInstanceStride:(unint64_t)a12
{
  traceContext = self->_traceContext;
  id v17 = a10;
  id v18 = a6;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v37);
  baseObject = self->_baseObject;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 baseObject]);
  unsigned __int8 v36 = v17;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 baseObject]);
  -[MTLIndirectRenderCommandSPI drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:]( baseObject,  "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFac torBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:",  a3,  a4,  a5,  v20,  a7,  a8,  a9,  v21,  a11,  a12);

  uint64_t v22 = v39;
  *(_DWORD *)(v39 + 8) = -15952;
  uint64_t v23 = *(void *)(v38 + 24);
  uint64_t v24 = v42++;
  Bytes = GTTraceMemPool_allocateBytes(v23, v40, v24 | 0x5800000000LL);
  *(_BYTE *)(v22 + 13) = v24;
  uint64_t v26 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v28 = [v18 traceStream];

  if (v28) {
    uint64_t v28 = (void *)*v28;
  }
  uint64_t v29 = (uint64_t *)[v36 traceStream];

  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v28;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = a8;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = v30;
  *((void *)Bytes + 11) = a11;
  *((void *)Bytes + 12) = a12;
  s();
  *(void *)uint64_t v31 = v32;
  *(_BYTE *)(v31 + 8) = v41;
  *(_BYTE *)(v39 + 15) |= 8u;
}

- (id)drawPatchesArguments
{
  return -[MTLIndirectRenderCommandSPI drawPatchesArguments](self->_baseObject, "drawPatchesArguments");
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  uint64_t v13 = v23;
  *(_DWORD *)(v23 + 8) = -15949;
  unsigned __int8 v14 = v26;
  if (v26 > 0x10uLL)
  {
    uint64_t v16 = *(void *)(v22[1] + 24LL);
    uint64_t v17 = v27++;
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v24, v17 | 0x3000000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + v26);
    v26 += 48;
  }

  *(_BYTE *)(v13 + 13) = v14;
  id v18 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v15 = var0;
  *((void *)v15 + 1) = a3;
  *((void *)v15 + 2) = a4;
  *((void *)v15 + 3) = a5;
  *((void *)v15 + 4) = a6;
  *((void *)v15 + 5) = a7;
  s();
  *(void *)uint64_t v20 = v21;
  *(_BYTE *)(v20 + 8) = v25;
  *(_BYTE *)(v23 + 15) |= 8u;
}

- (unint64_t)getCommandType
{
  return (unint64_t)-[MTLIndirectRenderCommandSPI getCommandType](self->_baseObject, "getCommandType");
}

- (unint64_t)getFragmentBufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)-[MTLIndirectRenderCommandSPI getFragmentBufferAddressAtIndex:]( self->_baseObject,  "getFragmentBufferAddressAtIndex:",  a3);
}

- (void)getFragmentBufferAtIndex:(unint64_t)a3
{
  return -[MTLIndirectRenderCommandSPI getFragmentBufferAtIndex:](self->_baseObject, "getFragmentBufferAtIndex:", a3);
}

- (unint64_t)getMeshBufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)-[MTLIndirectRenderCommandSPI getMeshBufferAddressAtIndex:]( self->_baseObject,  "getMeshBufferAddressAtIndex:",  a3);
}

- (unint64_t)getObjectBufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)-[MTLIndirectRenderCommandSPI getObjectBufferAddressAtIndex:]( self->_baseObject,  "getObjectBufferAddressAtIndex:",  a3);
}

- (unint64_t)getObjectThreadgroupMemoryLengthAtIndex:(unint64_t)a3
{
  return (unint64_t)-[MTLIndirectRenderCommandSPI getObjectThreadgroupMemoryLengthAtIndex:]( self->_baseObject,  "getObjectThreadgroupMemoryLengthAtIndex:",  a3);
}

- (unint64_t)getOptimizedStatus
{
  return (unint64_t)-[MTLIndirectRenderCommandSPI getOptimizedStatus](self->_baseObject, "getOptimizedStatus");
}

- (unint64_t)getPipelineStateUniqueIdentifier
{
  return (unint64_t)-[MTLIndirectRenderCommandSPI getPipelineStateUniqueIdentifier]( self->_baseObject,  "getPipelineStateUniqueIdentifier");
}

- (id)getTessellationFactorArguments
{
  return -[MTLIndirectRenderCommandSPI getTessellationFactorArguments]( self->_baseObject,  "getTessellationFactorArguments");
}

- (unint64_t)getVertexAttributeStrideAtIndex:(unint64_t)a3
{
  return (unint64_t)-[MTLIndirectRenderCommandSPI getVertexAttributeStrideAtIndex:]( self->_baseObject,  "getVertexAttributeStrideAtIndex:",  a3);
}

- (unint64_t)getVertexBufferAddressAtIndex:(unint64_t)a3
{
  return (unint64_t)-[MTLIndirectRenderCommandSPI getVertexBufferAddressAtIndex:]( self->_baseObject,  "getVertexBufferAddressAtIndex:",  a3);
}

- (void)getVertexBufferAtIndex:(unint64_t)a3
{
  return -[MTLIndirectRenderCommandSPI getVertexBufferAtIndex:](self->_baseObject, "getVertexBufferAtIndex:", a3);
}

- (BOOL)hasBarrier
{
  return -[MTLIndirectRenderCommandSPI hasBarrier](self->_baseObject, "hasBarrier");
}

- (void)reset
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15906;
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
  objc_super v8 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
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

- (void)setBarrier
{
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLIndirectRenderCommandSPI setFragmentBuffer:offset:atIndex:]( baseObject,  "setFragmentBuffer:offset:atIndex:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15954;
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
  unsigned __int8 v17 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v19 = (uint64_t *)[v9 traceStream];

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

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLIndirectRenderCommandSPI setMeshBuffer:offset:atIndex:](baseObject, "setMeshBuffer:offset:atIndex:", v11, a4, a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15264;
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
  unsigned __int8 v17 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v19 = (uint64_t *)[v9 traceStream];

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

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLIndirectRenderCommandSPI setObjectBuffer:offset:atIndex:]( baseObject,  "setObjectBuffer:offset:atIndex:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15263;
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
  unsigned __int8 v17 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v19 = (uint64_t *)[v9 traceStream];

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

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15262;
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
  uint64_t v12 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
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

- (void)setRenderPipelineState:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 baseObject]);
  -[MTLIndirectRenderCommandSPI setRenderPipelineState:](baseObject, "setRenderPipelineState:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15956;
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
  unsigned __int8 v13 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v15 = (uint64_t *)[v5 traceStream];

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

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  traceContext = self->_traceContext;
  id v9 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLIndirectRenderCommandSPI setVertexBuffer:offset:atIndex:]( baseObject,  "setVertexBuffer:offset:atIndex:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15955;
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
  uint64_t v17 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v19 = (uint64_t *)[v9 traceStream];

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

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  traceContext = self->_traceContext;
  id v11 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v25);
  baseObject = self->_baseObject;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  -[MTLIndirectRenderCommandSPI setVertexBuffer:offset:attributeStride:atIndex:]( baseObject,  "setVertexBuffer:offset:attributeStride:atIndex:",  v13,  a4,  a5,  a6);

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15276;
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
  char v19 = -[CaptureMTLIndirectRenderCommand traceStream](self, "traceStream");
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

- (void).cxx_destruct
{
}

@end