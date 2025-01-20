@interface CaptureMTLAccelerationStructureCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4;
- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4;
- (CaptureMTLAccelerationStructureCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4 copyEventValue:(unint64_t)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLAccelerationStructureCommandEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6;
- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4;
- (void)dealloc;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7;
- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6;
- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5;
- (void)setLabel:(id)a3;
- (void)touch;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForFence:(id)a3;
- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5;
- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6;
- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6;
- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6;
- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5;
@end

@implementation CaptureMTLAccelerationStructureCommandEncoder

- (CaptureMTLAccelerationStructureCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4 copyEventValue:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CaptureMTLAccelerationStructureCommandEncoder;
  v11 = -[CaptureMTLAccelerationStructureCommandEncoder init](&v28, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_baseObject, a3);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 device]);
    captureDevice = v12->_captureDevice;
    v12->_captureDevice = (CaptureMTLDevice *)v13;

    objc_storeWeak((id *)&v12->_captureCommandBuffer, v10);
    v15 = (GTTraceContext *)[v10 traceContext];
    v12->_traceContext = v15;
    id v16 = DEVICEOBJECT(v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v12->_traceStream = (GTTraceStream *)GTTraceContext_openEncoderStream( (uint64_t)v15,  (unint64_t)v17,  *((void *)[v10 traceStream] + 3));

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 retainedObjects]);
    retainedObjects = v12->_retainedObjects;
    v12->_retainedObjects = (NSMutableSet *)v18;

    v12->_copyEventValue = a5;
    v20 = v12->_retainedObjects;
    id v21 = DEVICEOBJECT(v12->_baseObject);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[NSMutableSet addObject:](v20, "addObject:", v22);

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    retainedDescriptorObjectsByStreamRef = v12->_retainedDescriptorObjectsByStreamRef;
    v12->_retainedDescriptorObjectsByStreamRef = v23;

    if ((qword_23A448 & 0x10) != 0)
    {
      v25 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      blitOperations = v12->_blitOperations;
      v12->_blitOperations = v25;
    }
  }

  return v12;
}

- (MTLAccelerationStructureCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
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
    id v9 = self->_retainedObjects;
    if (v9) {
      -[NSMutableSet addObject:](v9, "addObject:", v7);
    }
  }

  RetainObjectForDescriptorDownloader(v6, self->_retainedDescriptorObjectsByStreamRef);
  RetainObjectForDescriptorDownloader(v7, self->_retainedDescriptorObjectsByStreamRef);
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v29);
  baseObject = self->_baseObject;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI copyAccelerationStructure:toAccelerationStructure:]( baseObject,  "copyAccelerationStructure:toAccelerationStructure:",  v11,  v12);

  uint64_t v13 = v30;
  *(_DWORD *)(v30 + 8) = -15646;
  unsigned __int8 v14 = v33;
  if (v33 > 0x28uLL)
  {
    uint64_t v16 = *(void *)(v29[1] + 24LL);
    uint64_t v17 = v34++;
    v15 = GTTraceMemPool_allocateBytes(v16, v31, v17 | 0x1800000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    v15 = (char *)(v13 + v33);
    v33 += 24;
  }

  *(_BYTE *)(v13 + 13) = v14;
  uint64_t v18 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v20 = (uint64_t *)[v6 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0LL;
  }
  v22 = (uint64_t *)[v7 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  *(void *)v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v23;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v25 = [WeakRetained isCapturing];
  v26 = (void *)objc_claimAutoreleasedReturnValue([v6 captureDescriptor]);
  SetCaptureDescriptor(v7, self, v25, v26);

  s();
  *(void *)uint64_t v27 = v28;
  *(_BYTE *)(v27 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
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
    id v9 = self->_retainedObjects;
    if (v9) {
      -[NSMutableSet addObject:](v9, "addObject:", v7);
    }
  }

  RetainObjectForDescriptorDownloader(v6, self->_retainedDescriptorObjectsByStreamRef);
  RetainObjectForDescriptorDownloader(v7, self->_retainedDescriptorObjectsByStreamRef);
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v29);
  baseObject = self->_baseObject;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI copyAndCompactAccelerationStructure:toAccelerationStructure:]( baseObject,  "copyAndCompactAccelerationStructure:toAccelerationStructure:",  v11,  v12);

  uint64_t v13 = v30;
  *(_DWORD *)(v30 + 8) = -15645;
  unsigned __int8 v14 = v33;
  if (v33 > 0x28uLL)
  {
    uint64_t v16 = *(void *)(v29[1] + 24LL);
    uint64_t v17 = v34++;
    v15 = GTTraceMemPool_allocateBytes(v16, v31, v17 | 0x1800000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    v15 = (char *)(v13 + v33);
    v33 += 24;
  }

  *(_BYTE *)(v13 + 13) = v14;
  uint64_t v18 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v20 = (uint64_t *)[v6 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0LL;
  }
  v22 = (uint64_t *)[v7 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  *(void *)v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v23;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v25 = [WeakRetained isCapturing];
  v26 = (void *)objc_claimAutoreleasedReturnValue([v6 captureDescriptor]);
  SetCaptureDescriptor(v7, self, v25, v26);

  s();
  *(void *)uint64_t v27 = v28;
  *(_BYTE *)(v27 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  [v11 touch];
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v11);
    }
  }

  [v13 touch];
  if (v13)
  {
    uint64_t v16 = self->_retainedObjects;
    if (v16) {
      -[NSMutableSet addObject:](v16, "addObject:", v13);
    }
  }

  [v14 touch];
  if (v14)
  {
    uint64_t v17 = self->_retainedObjects;
    if (v17) {
      -[NSMutableSet addObject:](v17, "addObject:", v14);
    }
  }

  RetainObjectForDescriptorDownloader(v11, self->_retainedDescriptorObjectsByStreamRef);
  RetainObjectForDescriptorDownloader(v13, self->_retainedDescriptorObjectsByStreamRef);
  RetainAccelerationStructureDescriptorObjects(self->_retainedObjects, self->_retainedDescriptorObjectsByStreamRef, v12);
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v54);
  baseObject = self->_baseObject;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  id v20 = unwrapMTLAccelerationStructureDescriptor(v12);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v13 baseObject]);
  v52 = v14;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:]( baseObject,  "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:",  v19,  v21,  v22,  v23,  a7);

  id v53 = v12;
  id v24 = v13;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  LODWORD(baseObject) = [WeakRetained isCapturing];
  unint64_t v26 = ((unint64_t)qword_23A448 >> 4) & 1;
  captureDevice = self->_captureDevice;
  blitOperations = self->_blitOperations;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v24 extraRetainedObjects]);
  id v30 = copyCaptureDescriptor( &v53,  (int)baseObject,  v26,  captureDevice,  blitOperations,  v29,  self->_retainedDescriptorObjectsByStreamRef);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  id v32 = v53;

  uint64_t v33 = v56;
  *(_DWORD *)(v56 + 8) = -15638;
  unsigned __int8 v34 = v59;
  if (v59 > 0x10uLL)
  {
    uint64_t v36 = *(void *)(v55 + 24);
    uint64_t v37 = v60++;
    v35 = GTTraceMemPool_allocateBytes(v36, v57, v37 | 0x3000000000LL) + 16;
    unsigned __int8 v34 = v37;
  }

  else
  {
    v35 = (char *)(v33 + v59);
    v59 += 48;
  }

  *(_BYTE *)(v33 + 13) = v34;
  v38 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream", &self->_captureCommandBuffer);
  if (v38) {
    unint64_t var0 = v38->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v40 = (uint64_t *)[v11 traceStream];
  if (v40) {
    uint64_t v41 = *v40;
  }
  else {
    uint64_t v41 = 0LL;
  }
  v42 = (uint64_t *)[v24 traceStream];
  if (v42) {
    uint64_t v43 = *v42;
  }
  else {
    uint64_t v43 = 0LL;
  }
  v44 = (uint64_t *)[v52 traceStream];
  if (v44) {
    uint64_t v45 = *v44;
  }
  else {
    uint64_t v45 = 0LL;
  }
  char v46 = SaveMTLAccelerationStructureDescriptor((uint64_t)v54, v32);
  *(void *)v35 = var0;
  *((void *)v35 + 1) = v41;
  *((void *)v35 + 2) = v43;
  *((void *)v35 + 3) = v45;
  *((void *)v35 + 4) = a7;
  v35[40] = v46;
  *(_DWORD *)(v35 + 41) = 0;
  *((_DWORD *)v35 + 11) = 0;
  id v47 = objc_loadWeakRetained(location);
  SetCaptureDescriptor(v24, self, (int)[v47 isCapturing], v31);

  s();
  *(void *)uint64_t v48 = v49;
  *(_BYTE *)(v48 + 8) = v58;
  *(_BYTE *)(v56 + 15) |= 8u;
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
    }
  }

  [v14 touch];
  if (v14)
  {
    uint64_t v17 = self->_retainedObjects;
    if (v17) {
      -[NSMutableSet addObject:](v17, "addObject:", v14);
    }
  }

  [v15 touch];
  if (v15)
  {
    uint64_t v18 = self->_retainedObjects;
    if (v18) {
      -[NSMutableSet addObject:](v18, "addObject:", v15);
    }
  }

  RetainObjectForDescriptorDownloader(v12, self->_retainedDescriptorObjectsByStreamRef);
  RetainObjectForDescriptorDownloader(v14, self->_retainedDescriptorObjectsByStreamRef);
  RetainAccelerationStructureDescriptorObjects(self->_retainedObjects, self->_retainedDescriptorObjectsByStreamRef, v13);
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v55);
  baseObject = self->_baseObject;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  id v21 = unwrapMTLAccelerationStructureDescriptor(v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  id v53 = v15;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:]( baseObject,  "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:",  v20,  v22,  v23,  v24,  a7,  a8);

  id v54 = v13;
  id v25 = v14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  LODWORD(v24) = [WeakRetained isCapturing];
  unint64_t v27 = ((unint64_t)qword_23A448 >> 4) & 1;
  captureDevice = self->_captureDevice;
  blitOperations = self->_blitOperations;
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v25 extraRetainedObjects]);
  id v31 = copyCaptureDescriptor( &v54,  (int)v24,  v27,  captureDevice,  blitOperations,  v30,  self->_retainedDescriptorObjectsByStreamRef);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  id v33 = v54;

  uint64_t v34 = v57;
  *(_DWORD *)(v57 + 8) = -15366;
  unsigned __int8 v35 = v60;
  if (v60 > 8uLL)
  {
    uint64_t v37 = *(void *)(v56 + 24);
    uint64_t v38 = v61++;
    uint64_t v36 = GTTraceMemPool_allocateBytes(v37, v58, v38 | 0x3800000000LL) + 16;
    unsigned __int8 v35 = v38;
  }

  else
  {
    uint64_t v36 = (char *)(v34 + v60);
    v60 += 56;
  }

  *(_BYTE *)(v34 + 13) = v35;
  v39 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v39) {
    unint64_t var0 = v39->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v41 = (uint64_t *)[v12 traceStream];
  if (v41) {
    uint64_t v42 = *v41;
  }
  else {
    uint64_t v42 = 0LL;
  }
  uint64_t v43 = (uint64_t *)[v25 traceStream];
  if (v43) {
    uint64_t v44 = *v43;
  }
  else {
    uint64_t v44 = 0LL;
  }
  uint64_t v45 = (uint64_t *)[v53 traceStream];
  if (v45) {
    uint64_t v46 = *v45;
  }
  else {
    uint64_t v46 = 0LL;
  }
  char v47 = SaveMTLAccelerationStructureDescriptor((uint64_t)v55, v33);
  *(void *)uint64_t v36 = var0;
  *((void *)v36 + 1) = v42;
  *((void *)v36 + 2) = v44;
  *((void *)v36 + 3) = v46;
  *((void *)v36 + 4) = a7;
  *((void *)v36 + 5) = a8;
  v36[48] = v47;
  *(_DWORD *)(v36 + 49) = 0;
  *((_DWORD *)v36 + 13) = 0;
  id v48 = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  SetCaptureDescriptor(v25, self, (int)[v48 isCapturing], v32);

  s();
  *(void *)uint64_t v49 = v50;
  *(_BYTE *)(v49 + 8) = v59;
  *(_BYTE *)(v57 + 15) |= 8u;
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 device]);
  unsigned __int8 v14 = [v13 captureRaytracingEnabled];

  if ((v14 & 1) != 0)
  {
    [v10 touch];
    if (v10)
    {
      retainedObjects = self->_retainedObjects;
      if (retainedObjects) {
        -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
      }
    }

    [v12 touch];
    if (v12)
    {
      uint64_t v16 = self->_retainedObjects;
      if (v16) {
        -[NSMutableSet addObject:](v16, "addObject:", v12);
      }
    }

    RetainObjectForDescriptorDownloader(v10, self->_retainedDescriptorObjectsByStreamRef);
    RetainAccelerationStructureDescriptorObjects( self->_retainedObjects,  self->_retainedDescriptorObjectsByStreamRef,  v11);
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v54);
    baseObject = self->_baseObject;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
    id v19 = unwrapMTLAccelerationStructureDescriptor(v11);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v51 = v12;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
    unint64_t v52 = a6;
    -[MTLAccelerationStructureCommandEncoderSPI buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:]( baseObject,  "buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:",  v18,  v20,  v21,  a6);

    id v53 = v11;
    id v22 = v10;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
    LODWORD(v18) = [WeakRetained isCapturing];
    unint64_t v24 = ((unint64_t)qword_23A448 >> 4) & 1;
    captureDevice = self->_captureDevice;
    blitOperations = self->_blitOperations;
    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v22 extraRetainedObjects]);
    id v28 = copyCaptureDescriptor( &v53,  (int)v18,  v24,  captureDevice,  blitOperations,  v27,  self->_retainedDescriptorObjectsByStreamRef);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    id v30 = v53;

    uint64_t v31 = v56;
    *(_DWORD *)(v56 + 8) = -15647;
    unsigned __int8 v32 = v59;
    if (v59 > 0x18uLL)
    {
      uint64_t v39 = *(void *)(v55 + 24);
      uint64_t v40 = v60++;
      id v33 = GTTraceMemPool_allocateBytes(v39, v57, v40 | 0x2800000000LL) + 16;
      unsigned __int8 v32 = v40;
    }

    else
    {
      id v33 = (char *)(v31 + v59);
      v59 += 40;
    }

    id v12 = v51;
    *(_BYTE *)(v31 + 13) = v32;
    uint64_t v41 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
    if (v41) {
      unint64_t var0 = v41->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v43 = (uint64_t *)[v22 traceStream];
    if (v43) {
      uint64_t v44 = *v43;
    }
    else {
      uint64_t v44 = 0LL;
    }
    uint64_t v45 = (uint64_t *)[v51 traceStream];
    if (v45) {
      uint64_t v46 = *v45;
    }
    else {
      uint64_t v46 = 0LL;
    }
    char v47 = SaveMTLAccelerationStructureDescriptor((uint64_t)v54, v30);
    *(void *)id v33 = var0;
    *((void *)v33 + 1) = v44;
    *((void *)v33 + 2) = v46;
    *((void *)v33 + 3) = v52;
    v33[32] = v47;
    *(_DWORD *)(v33 + 33) = 0;
    *((_DWORD *)v33 + 9) = 0;
    id v48 = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
    SetCaptureDescriptor(v22, self, (int)[v48 isCapturing], v29);

    s();
    *(void *)uint64_t v49 = v50;
    *(_BYTE *)(v49 + 8) = v58;
    *(_BYTE *)(v56 + 15) |= 8u;
  }

  else
  {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset",  (uint64_t)"Raytracing",  0LL,  0LL);
    uint64_t v34 = self->_baseObject;
    unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
    id v36 = unwrapMTLAccelerationStructureDescriptor(v11);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
    -[MTLAccelerationStructureCommandEncoderSPI buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:]( v34,  "buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:",  v35,  v37,  v38,  a6);

    id v30 = v11;
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  [v9 touch];
  if (v9)
  {
    id v11 = self->_retainedObjects;
    if (v11) {
      -[NSMutableSet addObject:](v11, "addObject:", v9);
    }
  }

  RetainObjectForDescriptorDownloader(v8, self->_retainedDescriptorObjectsByStreamRef);
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v31);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  baseObject = self->_baseObject;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:]( baseObject,  "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:",  v12,  v14,  a5);

  uint64_t v15 = v32;
  *(_DWORD *)(v32 + 8) = -15523;
  unsigned __int8 v16 = v35;
  if (v35 > 0x20uLL)
  {
    uint64_t v18 = *(void *)(v31[1] + 24LL);
    uint64_t v19 = v36++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v33, v19 | 0x2000000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v35);
    v35 += 32;
  }

  *(_BYTE *)(v15 + 13) = v16;
  id v20 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  unint64_t v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v27 = [WeakRetained isCapturing];
  id v28 = objc_alloc_init(&OBJC_CLASS___MTLPrimitiveAccelerationStructureDescriptor);
  SetCaptureDescriptor(v8, self, v27, v28);

  s();
  *(void *)uint64_t v29 = v30;
  *(_BYTE *)(v29 + 8) = v34;
  *(_BYTE *)(v32 + 15) |= 8u;
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
    }
  }

  RetainNSArray(self->_retainedObjects, v11);
  [v12 touch];
  if (v12)
  {
    unsigned __int8 v14 = self->_retainedObjects;
    if (v14) {
      -[NSMutableSet addObject:](v14, "addObject:", v12);
    }
  }

  RetainObjectForDescriptorDownloader(v10, self->_retainedDescriptorObjectsByStreamRef);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v15 = v11;
  id v16 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        RetainObjectForDescriptorDownloader( *(void **)(*((void *)&v48 + 1) + 8LL * (void)i),  self->_retainedDescriptorObjectsByStreamRef);
      }

      id v17 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }

    while (v17);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v42);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  baseObject = self->_baseObject;
  id v22 = unwrapNSArray(v15);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:]( baseObject,  "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:",  v20,  v23,  v24,  a6);

  uint64_t v25 = v43;
  *(_DWORD *)(v43 + 8) = -15524;
  unsigned __int8 v26 = v46;
  if (v46 > 0x18uLL)
  {
    uint64_t v28 = *(void *)(v42[1] + 24LL);
    uint64_t v29 = v47++;
    int v27 = GTTraceMemPool_allocateBytes(v28, v44, v29 | 0x2800000000LL) + 16;
    unsigned __int8 v26 = v29;
  }

  else
  {
    int v27 = (char *)(v25 + v46);
    v46 += 40;
  }

  *(_BYTE *)(v25 + 13) = v26;
  uint64_t v30 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v30) {
    unint64_t var0 = v30->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v32 = (uint64_t *)[v10 traceStream];
  if (v32) {
    uint64_t v33 = *v32;
  }
  else {
    uint64_t v33 = 0LL;
  }
  char v34 = (uint64_t *)[v12 traceStream];
  if (v34) {
    uint64_t v35 = *v34;
  }
  else {
    uint64_t v35 = 0LL;
  }
  char v36 = StreamMTLNameArray((uint64_t)v42, v15);
  *(void *)int v27 = var0;
  *((void *)v27 + 1) = v33;
  *((void *)v27 + 2) = v35;
  *((void *)v27 + 3) = a6;
  v27[32] = v36;
  *(_DWORD *)(v27 + 33) = 0;
  *((_DWORD *)v27 + 9) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v38 = [WeakRetained isCapturing];
  uint64_t v39 = objc_alloc_init(&OBJC_CLASS___MTLInstanceAccelerationStructureDescriptor);
  SetCaptureDescriptor(v10, self, v38, v39);

  s();
  *(void *)uint64_t v40 = v41;
  *(_BYTE *)(v40 + 8) = v45;
  *(_BYTE *)(v43 + 15) |= 8u;
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
    }
  }

  RetainNSArray(self->_retainedObjects, v11);
  [v12 touch];
  if (v12)
  {
    unsigned __int8 v14 = self->_retainedObjects;
    if (v14) {
      -[NSMutableSet addObject:](v14, "addObject:", v12);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v34);
  baseObject = self->_baseObject;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  id v17 = unwrapNSArray(v11);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI serializeInstanceAccelerationStructure:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:]( baseObject,  "serializeInstanceAccelerationStructure:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:",  v16,  v18,  v19,  a6);

  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -15522;
  unsigned __int8 v21 = v38;
  if (v38 > 0x18uLL)
  {
    uint64_t v23 = *(void *)(v34[1] + 24LL);
    uint64_t v24 = v39++;
    id v22 = GTTraceMemPool_allocateBytes(v23, v36, v24 | 0x2800000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    id v22 = (char *)(v20 + v38);
    v38 += 40;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  int v27 = (uint64_t *)[v10 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0LL;
  }
  uint64_t v29 = (uint64_t *)[v12 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  char v31 = StreamMTLNameArray((uint64_t)v34, v11);
  *(void *)id v22 = var0;
  *((void *)v22 + 1) = v28;
  *((void *)v22 + 2) = v30;
  *((void *)v22 + 3) = a6;
  v22[32] = v31;
  *(_DWORD *)(v22 + 33) = 0;
  *((_DWORD *)v22 + 9) = 0;
  s();
  *(void *)uint64_t v32 = v33;
  *(_BYTE *)(v32 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  [v11 touch];
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v11);
    }
  }

  RetainNSArray(self->_retainedObjects, v12);
  [v13 touch];
  if (v13)
  {
    id v16 = self->_retainedObjects;
    if (v16) {
      -[NSMutableSet addObject:](v16, "addObject:", v13);
    }
  }

  RetainObjectForDescriptorDownloader(v11, self->_retainedDescriptorObjectsByStreamRef);
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v57;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v57 != v20) {
          objc_enumerationMutation(v17);
        }
        RetainObjectForDescriptorDownloader( *(void **)(*((void *)&v56 + 1) + 8LL * (void)i),  self->_retainedDescriptorObjectsByStreamRef);
      }

      id v19 = [v17 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }

    while (v19);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v49);
  baseObject = self->_baseObject;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  id v24 = unwrapNSArray(v17);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v13 baseObject]);
  id v27 = unwrapMTLAccelerationStructureDescriptor(v14);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  -[MTLAccelerationStructureCommandEncoderSPI deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:]( baseObject,  "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:",  v23,  v25,  v26,  a6,  v28);

  uint64_t v29 = objc_alloc_init(&OBJC_CLASS___MTLInstanceAccelerationStructureDescriptor);
  [v11 setCaptureDescriptor:v29];

  uint64_t v30 = v51;
  *(_DWORD *)(v51 + 8) = -15466;
  unsigned __int8 v31 = v54;
  if (v54 > 0x18uLL)
  {
    uint64_t v33 = *(void *)(v50 + 24);
    uint64_t v34 = v55++;
    uint64_t v32 = GTTraceMemPool_allocateBytes(v33, v52, v34 | 0x2800000000LL) + 16;
    unsigned __int8 v31 = v34;
  }

  else
  {
    uint64_t v32 = (char *)(v30 + v54);
    v54 += 40;
  }

  *(_BYTE *)(v30 + 13) = v31;
  uint64_t v35 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v35) {
    unint64_t var0 = v35->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v37 = (uint64_t *)[v11 traceStream];
  if (v37) {
    uint64_t v38 = *v37;
  }
  else {
    uint64_t v38 = 0LL;
  }
  unsigned __int8 v39 = (uint64_t *)[v13 traceStream];
  if (v39) {
    uint64_t v40 = *v39;
  }
  else {
    uint64_t v40 = 0LL;
  }
  char v41 = StreamMTLNameArray((uint64_t)v49, v17);
  char v42 = SaveMTLAccelerationStructureDescriptor((uint64_t)v49, v14);
  *(void *)uint64_t v32 = var0;
  *((void *)v32 + 1) = v38;
  *((void *)v32 + 2) = v40;
  *((void *)v32 + 3) = a6;
  v32[32] = v41;
  v32[33] = v42;
  *(_DWORD *)(v32 + 34) = 0;
  *((_WORD *)v32 + 19) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  int v44 = [WeakRetained isCapturing];
  char v45 = objc_alloc_init(&OBJC_CLASS___MTLInstanceAccelerationStructureDescriptor);
  SetCaptureDescriptor(v11, self, v44, v45);

  s();
  *(void *)uint64_t v46 = v47;
  *(_BYTE *)(v46 + 8) = v53;
  *(_BYTE *)(v51 + 15) |= 8u;
}

- (void)endEncoding
{
  v2 = self;
  int v3 = GTAccelerationStructureDescriptorDownloader_needsDownloader((uint64_t)self->_traceStream);
  if (endEncoding_descriptorDownloaderToken != -1) {
    dispatch_once(&endEncoding_descriptorDownloaderToken, &__block_literal_global_6558);
  }
  -[MTLAccelerationStructureCommandEncoderSPI endEncoding](v2->_baseObject, "endEncoding");
  p_captureCommandBuffer = (id *)&v2->_captureCommandBuffer;
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_captureCommandBuffer);
  id v6 = DEVICEOBJECT(WeakRetained);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (-[NSMutableArray count](v2->_blitOperations, "count"))
  {
    int v76 = v3;
    v77 = &v2->_captureCommandBuffer;
    v78 = v7;
    context = (void *)objc_claimAutoreleasedReturnValue([v7 blitCommandEncoder]);
    [context setLabel:@"com.apple.gputools.ADSExtraBuffersBlit"];
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    v79 = v2;
    obj = v2->_blitOperations;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v91,  v95,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v92;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v92 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"srcBuffer"]);
          id v14 = DEVICEOBJECT(v13);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"srcOffset"]);
          id v17 = NumberToInt(v16);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"dstBuffer"]);
          id v19 = DEVICEOBJECT(v18);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"length"]);
          [context copyFromBuffer:v15 sourceOffset:v17 toBuffer:v20 destinationOffset:0 size:NumberToInt(v21)];
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v91,  v95,  16LL);
      }

      while (v9);
    }

    [context endEncoding];
    v2 = v79;
    id v22 = v79->_blitOperations;
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472LL;
    v89[2] = __60__CaptureMTLAccelerationStructureCommandEncoder_endEncoding__block_invoke_2;
    v89[3] = &unk_20E118;
    v90 = v22;
    uint64_t v23 = v22;
    id v7 = v78;
    [v78 addCompletedHandler:v89];
    blitOperations = v79->_blitOperations;
    v79->_blitOperations = 0LL;

    p_captureCommandBuffer = (id *)v77;
    int v3 = v76;
  }

  if (v3)
  {
    uint64_t v25 = objc_autoreleasePoolPush();
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v7 computeCommandEncoder]);
    [v26 setLabel:@"com.apple.gputools.GTAccelerationStructureDescriptorDownloader.copyCommandEncoder"];
    apr_pool_create_ex(newpool, 0LL, 0LL, 0LL);
    id v27 = apr_hash_make(newpool[0]);
    GTTraceMemPool_buildMemoryMap((uint64_t)v2->_traceStream->var3, v27);
    id v28 = objc_loadWeakRetained(p_captureCommandBuffer);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 device]);
    retainedDescriptorObjectsByStreamRef = v2->_retainedDescriptorObjectsByStreamRef;
    unsigned __int8 v31 = (apr_pool_t *)atomic_load(&v2->_traceContext->var2);
    uint64_t v32 = GTAccelerationStructureDescriptorDownloader_make( v29,  retainedDescriptorObjectsByStreamRef,  v27,  v31,  newpool[0]);

    unint64_t var0 = v2->_traceStream->var4.var0;
    contexta = v25;
    unsigned int v34 = 0;
    if (var0)
    {
      while (1)
      {
        unsigned int v35 = atomic_load((unsigned int *)var0 + 1);
        uint64_t v36 = v34 + (v35 >> 6) - 1;
        unint64_t var0 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)var0 + 5);
        unsigned int v34 = v36;
        if (!var0)
        {
          unsigned int v34 = v36;
          goto LABEL_18;
        }
      }
    }

    uint64_t v36 = 0LL;
LABEL_18:
    unint64_t v37 = v34 | (unint64_t)(v36 << 32);
LABEL_19:
    uint64_t v38 = (char *)var0 + 64;
    while (var0 && (v38[64 * (uint64_t)(HIDWORD(v37) - (int)v37) + 15] & 8) != 0)
    {
      GTAccelerationStructureDescriptorDownloader_preProcessFunc( (uint64_t)v32,  (uint64_t)&v38[64 * (uint64_t)(HIDWORD(v37) - (int)v37)]);
      unsigned int v39 = atomic_load((unsigned int *)var0 + 1);
      int v40 = v37 + (v39 >> 6);
      uint64_t v41 = (HIDWORD(v37) + 1);
      unint64_t v37 = (v41 << 32) | v37;
      if ((_DWORD)v41 == v40 - 1)
      {
        unint64_t v37 = (v41 << 32) | v41;
        unint64_t var0 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)var0 + 5);
        goto LABEL_19;
      }
    }

    id v42 = objc_loadWeakRetained(p_captureCommandBuffer);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 device]);
    id v44 = DEVICEOBJECT(v43);
    char v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    GTAccelerationStructureDescriptorDownloader_allocateStateBuffers((uint64_t)v32, v45);

    uint64_t v46 = v2->_traceStream->var4.var0;
    if (v46)
    {
      unsigned int v47 = 0;
      while (1)
      {
        unsigned int v48 = atomic_load((unsigned int *)v46 + 1);
        uint64_t v49 = v47 + (v48 >> 6) - 1;
        uint64_t v46 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)v46 + 5);
        unsigned int v47 = v49;
        if (!v46)
        {
          unsigned int v47 = v49;
          goto LABEL_31;
        }
      }
    }

    else
    {
      unsigned int v47 = 0;
    }

    uint64_t v49 = 0LL;
LABEL_31:
    unint64_t v50 = v47 | (unint64_t)(v49 << 32);
LABEL_32:
    uint64_t v51 = (char *)v46 + 64;
    while (v46 && (v51[64 * (uint64_t)(HIDWORD(v50) - (int)v50) + 15] & 8) != 0)
    {
      GTAccelerationStructureDescriptorDownloader_processFunc( (uint64_t)v32,  (uint64_t)&v51[64 * (uint64_t)(HIDWORD(v50) - (int)v50)],  v26);
      unsigned int v52 = atomic_load((unsigned int *)v46 + 1);
      int v53 = v50 + (v52 >> 6);
      uint64_t v54 = (HIDWORD(v50) + 1);
      unint64_t v50 = (v54 << 32) | v50;
      if ((_DWORD)v54 == v53 - 1)
      {
        unint64_t v50 = (v54 << 32) | v54;
        uint64_t v46 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)v46 + 5);
        goto LABEL_32;
      }
    }

    id v55 = objc_loadWeakRetained(p_captureCommandBuffer);
    __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 accelerationStructureDescriptorProcessEvent]);
    __int128 v57 = (void *)endEncoding_descriptorDownloaderEventListener;
    uint64_t copyEventValue = v2->_copyEventValue;
    __int128 v59 = p_captureCommandBuffer;
    id v60 = objc_loadWeakRetained(p_captureCommandBuffer);
    GTAccelerationStructureDescriptorDownloader_postProcess( (uint64_t)v32,  v56,  v57,  copyEventValue,  (char)[v60 isCapturing],  v2,  (uint64_t)v2->_traceContext);

    unsigned __int8 v61 = v32[3];
    v32[3] = 0LL;

    v62 = v32[4];
    v32[4] = 0LL;

    apr_pool_destroy(newpool[0]);
    [v26 endEncoding];
    id v63 = objc_loadWeakRetained(v59);
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 accelerationStructureDescriptorProcessEvent]);
    [v7 encodeSignalEvent:v64 value:v2->_copyEventValue];

    id v65 = objc_loadWeakRetained(v59);
    v66 = (void *)objc_claimAutoreleasedReturnValue([v65 accelerationStructureDescriptorProcessEvent]);
    [v7 encodeWaitForEvent:v66 value:v2->_copyEventValue + 1 timeout:GT_ENV];

    [v7 addCompletedHandler:&__block_literal_global_49];
    objc_autoreleasePoolPop(contexta);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)v2->_traceContext, (uint64_t)newpool);
  uint64_t v67 = v84;
  *(_DWORD *)(v84 + 8) = -15642;
  unsigned __int8 v68 = v87;
  if (v87 > 0x38uLL)
  {
    uint64_t v70 = *((void *)newpool[1] + 3);
    uint64_t v71 = v88++;
    v69 = GTTraceMemPool_allocateBytes(v70, v85, v71 | 0x800000000LL) + 16;
    unsigned __int8 v68 = v71;
  }

  else
  {
    v69 = (char *)(v67 + v87);
    v87 += 8;
  }

  *(_BYTE *)(v67 + 13) = v68;
  v72 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](v2, "traceStream");
  if (v72) {
    unint64_t v73 = v72->var0;
  }
  else {
    unint64_t v73 = 0LL;
  }
  *(void *)v69 = v73;
  s();
  *(void *)uint64_t v74 = v75;
  *(_BYTE *)(v74 + 8) = v86;
  *(_BYTE *)(v84 + 15) |= 8u;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLAccelerationStructureCommandEncoder;
  uint64_t v3 = -[CaptureMTLAccelerationStructureCommandEncoder description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLAccelerationStructureCommandEncoderSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLAccelerationStructureCommandEncoderSPI conformsToProtocol:]( baseObject,  "conformsToProtocol:",  v4);

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
  return (NSString *)-[MTLAccelerationStructureCommandEncoderSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLAccelerationStructureCommandEncoderSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15648;
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
  uint64_t v10 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  *(_DWORD *)(v15 + 8) = -15644;
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
  uint64_t v8 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLAccelerationStructureCommandEncoder;
  -[CaptureMTLAccelerationStructureCommandEncoder dealloc](&v12, "dealloc");
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
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
    uint64_t v14 = self->_retainedObjects;
    if (v14) {
      -[NSMutableSet addObject:](v14, "addObject:", v11);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v34);
  baseObject = self->_baseObject;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  char v17 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  id v18 = unwrapMTLAccelerationStructureDescriptor(v12);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[MTLAccelerationStructureCommandEncoderSPI deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:]( baseObject,  "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:",  v16,  v17,  a5,  v19);

  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -15465;
  unsigned __int8 v21 = v38;
  if (v38 > 0x18uLL)
  {
    uint64_t v23 = *(void *)(v34[1] + 24LL);
    uint64_t v24 = v39++;
    char v22 = GTTraceMemPool_allocateBytes(v23, v36, v24 | 0x2800000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    char v22 = (char *)(v20 + v38);
    v38 += 40;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v27 = (uint64_t *)[v10 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0LL;
  }
  uint64_t v29 = (uint64_t *)[v11 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  char v31 = SaveMTLAccelerationStructureDescriptor((uint64_t)v34, v12);

  *(void *)char v22 = var0;
  *((void *)v22 + 1) = v28;
  *((void *)v22 + 2) = v30;
  *((void *)v22 + 3) = a5;
  v22[32] = v31;
  *(_DWORD *)(v22 + 33) = 0;
  *((_DWORD *)v22 + 9) = 0;
  s();
  *(void *)uint64_t v32 = v33;
  *(_BYTE *)(v32 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
}

- (void)insertDebugSignpost:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLAccelerationStructureCommandEncoderSPI insertDebugSignpost:](self->_baseObject, "insertDebugSignpost:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15641;
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
  id v10 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  *(_DWORD *)(v13 + 8) = -15640;
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
  uint64_t v8 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  -[MTLAccelerationStructureCommandEncoderSPI pushDebugGroup:](self->_baseObject, "pushDebugGroup:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15639;
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
  uint64_t v10 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  -[MTLAccelerationStructureCommandEncoderSPI sampleCountersInBuffer:atSampleIndex:withBarrier:]( baseObject,  "sampleCountersInBuffer:atSampleIndex:withBarrier:",  v11,  a4,  v5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15637;
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
  uint64_t v17 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((_DWORD *)v14 + 6) = v5;
  *((_DWORD *)v14 + 7) = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  [v9 touch];
  if (v9)
  {
    uint64_t v11 = self->_retainedObjects;
    if (v11) {
      -[NSMutableSet addObject:](v11, "addObject:", v9);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI serializePrimitiveAccelerationStructure:toBuffer:serializedBufferOffset:]( baseObject,  "serializePrimitiveAccelerationStructure:toBuffer:serializedBufferOffset:",  v13,  v14,  a5);

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15521;
  unsigned __int8 v16 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v18 = *(void *)(v28[1] + 24LL);
    uint64_t v19 = v33++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v30, v19 | 0x2000000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v32);
    v32 += 32;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  uint64_t v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(_BYTE *)(v26 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
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
  -[MTLAccelerationStructureCommandEncoderSPI updateFence:](baseObject, "updateFence:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15635;
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
  unsigned __int8 v13 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)useHeap:(id)a3
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
  -[MTLAccelerationStructureCommandEncoderSPI useHeap:](baseObject, "useHeap:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15634;
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
  unsigned __int8 v13 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  unint64_t v9 = 8 * a4;
  __chkstk_darwin(v7, v10);
  if (a4)
  {
    uint64_t v11 = a3;
    uint64_t v12 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v13 = a4;
    do
    {
      id v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }

    while (v13);
  }

  -[MTLAccelerationStructureCommandEncoderSPI useHeaps:count:]( baseObject,  "useHeaps:count:",  &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4);
  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15633;
  unsigned __int8 v16 = v32;
  if (v32 > 0x28uLL)
  {
    uint64_t v18 = *(void *)(v28 + 24);
    uint64_t v19 = v33++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v30, v19 | 0x1800000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v32);
    v32 += 24;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v20, v21);
  char v23 = StreamArray((uint64_t)v27, &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, a4);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = a4;
  v17[16] = v23;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(_BYTE *)(v24 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  id v6 = a3;
  [v6 touch];
  if (v6)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v6);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  baseObject = self->_baseObject;
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI useResource:usage:](baseObject, "useResource:usage:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15632;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    uint64_t v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  uint64_t v15 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v17 = (uint64_t *)[v6 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0LL;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  unint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v29);
  baseObject = self->_baseObject;
  unint64_t v11 = 8 * a4;
  __chkstk_darwin(v9, v12);
  if (a4)
  {
    uint64_t v13 = a3;
    uint64_t v14 = &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v15 = a4;
    do
    {
      unsigned __int8 v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }

    while (v15);
  }

  -[MTLAccelerationStructureCommandEncoderSPI useResources:count:usage:]( baseObject,  "useResources:count:usage:",  &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4,  a5);
  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -15631;
  unsigned __int8 v18 = v34;
  if (v34 > 0x20uLL)
  {
    uint64_t v20 = *(void *)(v30 + 24);
    uint64_t v21 = v35++;
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v32, v21 | 0x2000000000LL) + 16;
    unsigned __int8 v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    v34 += 32;
  }

  *(_BYTE *)(v17 + 13) = v18;
  uint64_t v22 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v22, v23);
  char v25 = StreamArray((uint64_t)v29, &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, a4);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = a4;
  *((void *)v19 + 2) = a5;
  v19[24] = v25;
  *(_DWORD *)(v19 + 25) = 0;
  *((_DWORD *)v19 + 7) = 0;
  s();
  *(void *)uint64_t v26 = v27;
  *(_BYTE *)(v26 + 8) = v33;
  *(_BYTE *)(v31 + 15) |= 8u;
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
  -[MTLAccelerationStructureCommandEncoderSPI waitForFence:](baseObject, "waitForFence:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15630;
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
  uint64_t v13 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v15 = (uint64_t *)[v4 traceStream];
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

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  [v9 touch];
  if (v9)
  {
    uint64_t v11 = self->_retainedObjects;
    if (v11) {
      -[NSMutableSet addObject:](v11, "addObject:", v9);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI writeAccelerationStructureSerializationData:toBuffer:offset:]( baseObject,  "writeAccelerationStructureSerializationData:toBuffer:offset:",  v13,  v14,  a5);

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15365;
  unsigned __int8 v16 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v18 = *(void *)(v28[1] + 24LL);
    uint64_t v19 = v33++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v30, v19 | 0x2000000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v32);
    v32 += 32;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  unsigned __int8 v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(_BYTE *)(v26 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  [v9 touch];
  if (v9)
  {
    uint64_t v11 = self->_retainedObjects;
    if (v11) {
      -[NSMutableSet addObject:](v11, "addObject:", v9);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI writeAccelerationStructureTraversalDepth:toBuffer:offset:]( baseObject,  "writeAccelerationStructureTraversalDepth:toBuffer:offset:",  v13,  v14,  a5);

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15287;
  unsigned __int8 v16 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v18 = *(void *)(v28[1] + 24LL);
    uint64_t v19 = v33++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v30, v19 | 0x2000000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v32);
    v32 += 32;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  unsigned __int8 v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(_BYTE *)(v26 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  [v9 touch];
  if (v9)
  {
    uint64_t v11 = self->_retainedObjects;
    if (v11) {
      -[NSMutableSet addObject:](v11, "addObject:", v9);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI writeCompactedAccelerationStructureSize:toBuffer:offset:]( baseObject,  "writeCompactedAccelerationStructureSize:toBuffer:offset:",  v13,  v14,  a5);

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15629;
  unsigned __int8 v16 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v18 = *(void *)(v28[1] + 24LL);
    uint64_t v19 = v33++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v30, v19 | 0x2000000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v32);
    v32 += 32;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  unsigned __int8 v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(_BYTE *)(v26 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
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
    uint64_t v13 = self->_retainedObjects;
    if (v13) {
      -[NSMutableSet addObject:](v13, "addObject:", v11);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v30);
  baseObject = self->_baseObject;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:]( baseObject,  "writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:",  v15,  v16,  a5,  a6);

  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -15502;
  unsigned __int8 v18 = v34;
  if (v34 > 0x18uLL)
  {
    uint64_t v20 = *(void *)(v30[1] + 24LL);
    uint64_t v21 = v35++;
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v32, v21 | 0x2800000000LL) + 16;
    unsigned __int8 v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    v34 += 40;
  }

  *(_BYTE *)(v17 + 13) = v18;
  char v22 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  uint64_t v26 = (uint64_t *)[v11 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = v27;
  *((void *)v19 + 3) = a5;
  *((void *)v19 + 4) = a6;
  s();
  *(void *)uint64_t v28 = v29;
  *(_BYTE *)(v28 + 8) = v33;
  *(_BYTE *)(v31 + 15) |= 8u;
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
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
    uint64_t v13 = self->_retainedObjects;
    if (v13) {
      -[NSMutableSet addObject:](v13, "addObject:", v11);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v30);
  baseObject = self->_baseObject;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI writeDeserializedAccelerationStructureSize:serializedOffset:toBuffer:sizeBufferOffset:]( baseObject,  "writeDeserializedAccelerationStructureSize:serializedOffset:toBuffer:sizeBufferOffset:",  v15,  a4,  v16,  a6);

  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -15592;
  unsigned __int8 v18 = v34;
  if (v34 > 0x18uLL)
  {
    uint64_t v20 = *(void *)(v30[1] + 24LL);
    uint64_t v21 = v35++;
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v32, v21 | 0x2800000000LL) + 16;
    unsigned __int8 v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    v34 += 40;
  }

  *(_BYTE *)(v17 + 13) = v18;
  char v22 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  uint64_t v26 = (uint64_t *)[v11 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = v27;
  *((void *)v19 + 4) = a6;
  s();
  *(void *)uint64_t v28 = v29;
  *(_BYTE *)(v28 + 8) = v33;
  *(_BYTE *)(v31 + 15) |= 8u;
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
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
    uint64_t v13 = self->_retainedObjects;
    if (v13) {
      -[NSMutableSet addObject:](v13, "addObject:", v11);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v30);
  baseObject = self->_baseObject;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI writeDeserializedPrimitiveAccelerationStructureSizes:serializedOffset:toBuffer:sizesBufferOffset:]( baseObject,  "writeDeserializedPrimitiveAccelerationStructureSizes:serializedOffset:toBuffer:sizesBufferOffset:",  v15,  a4,  v16,  a6);

  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -15591;
  unsigned __int8 v18 = v34;
  if (v34 > 0x18uLL)
  {
    uint64_t v20 = *(void *)(v30[1] + 24LL);
    uint64_t v21 = v35++;
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v32, v21 | 0x2800000000LL) + 16;
    unsigned __int8 v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    v34 += 40;
  }

  *(_BYTE *)(v17 + 13) = v18;
  char v22 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
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
  uint64_t v26 = (uint64_t *)[v11 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = v27;
  *((void *)v19 + 4) = a6;
  s();
  *(void *)uint64_t v28 = v29;
  *(_BYTE *)(v28 + 8) = v33;
  *(_BYTE *)(v31 + 15) |= 8u;
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
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

  baseObject = self->_baseObject;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  id v11 = unwrapMTLGenericBVHBuffersSPI(v7);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  unsigned __int8 v13 = -[MTLAccelerationStructureCommandEncoderSPI writeGenericBVHStructureOfAccelerationStructure:into:]( baseObject,  "writeGenericBVHStructureOfAccelerationStructure:into:",  v10,  v12);
  return v13;
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
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

  baseObject = self->_baseObject;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  LOBYTE(baseObject) = -[MTLAccelerationStructureCommandEncoderSPI writeGenericBVHStructureSizesOfAccelerationStructure:into:]( baseObject,  "writeGenericBVHStructureSizesOfAccelerationStructure:into:",  v10,  v7);

  return (char)baseObject;
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  [v9 touch];
  if (v9)
  {
    id v11 = self->_retainedObjects;
    if (v11) {
      -[NSMutableSet addObject:](v11, "addObject:", v9);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLAccelerationStructureCommandEncoderSPI writeSerializedAccelerationStructureSize:toBuffer:sizeBufferOffset:]( baseObject,  "writeSerializedAccelerationStructureSize:toBuffer:sizeBufferOffset:",  v13,  v14,  a5);

  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15588;
  unsigned __int8 v16 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v18 = *(void *)(v28[1] + 24LL);
    uint64_t v19 = v33++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v30, v19 | 0x2000000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v32);
    v32 += 32;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  unsigned __int8 v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  s();
  *(void *)uint64_t v26 = v27;
  *(_BYTE *)(v26 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
}

- (void).cxx_destruct
{
}

id __60__CaptureMTLAccelerationStructureCommandEncoder_endEncoding__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) count];
}

void __60__CaptureMTLAccelerationStructureCommandEncoder_endEncoding__block_invoke(id a1)
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.gputools.ADSDescriptorDownloader", 0LL);
  v1 = -[MTLSharedEventListener initWithDispatchQueue:]( objc_alloc(&OBJC_CLASS___MTLSharedEventListener),  "initWithDispatchQueue:",  v3);
  v2 = (void *)endEncoding_descriptorDownloaderEventListener;
  endEncoding_descriptorDownloaderEventListener = (uint64_t)v1;
}

@end