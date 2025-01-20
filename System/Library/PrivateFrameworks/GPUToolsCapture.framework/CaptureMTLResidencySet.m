@interface CaptureMTLResidencySet
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)containsAllocation:(id)a3;
- (BOOL)containsHeap:(id)a3;
- (BOOL)containsResource:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLResidencySet)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLResidencySet)baseObject;
- (NSArray)allAllocations;
- (NSArray)allCommittedAllocations;
- (NSString)description;
- (NSString)label;
- (id)allCommittedHeaps;
- (id)allCommittedResources;
- (id)allHeaps;
- (id)allResources;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)allocatedSize;
- (unint64_t)allocationCount;
- (unint64_t)countForHeap:(id)a3;
- (unint64_t)countForResource:(id)a3;
- (unint64_t)currentGeneration;
- (unint64_t)expiredGeneration;
- (unint64_t)generationForAllocation:(id)a3;
- (unint64_t)generationForHeap:(id)a3;
- (unint64_t)generationForResource:(id)a3;
- (unint64_t)streamReference;
- (void)addAllocation:(id)a3;
- (void)addAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)commit;
- (void)dealloc;
- (void)endResidency;
- (void)removeAllAllocations;
- (void)removeAllocation:(id)a3;
- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)requestResidency;
- (void)setCurrentGeneration:(unint64_t)a3;
- (void)setExpiredGeneration:(unint64_t)a3;
- (void)touch;
@end

@implementation CaptureMTLResidencySet

- (CaptureMTLResidencySet)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CaptureMTLResidencySet;
  v9 = -[CaptureMTLResidencySet init](&v18, "init");
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

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    tempAllocations = v10->_tempAllocations;
    v10->_tempAllocations = (NSMutableSet *)v14;

    committedAllocations = v10->_committedAllocations;
    v10->_committedAllocations = 0LL;

    v10->_snapshotCreated = (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2;
  }

  return v10;
}

- (MTLResidencySet)baseObject
{
  return self->_baseObject;
}

- (void)addAllocation:(id)a3
{
  id v4 = a3;
  ResidencySetTakeSnapshotInternal(self, 0);
  -[NSMutableSet addObject:](self->_tempAllocations, "addObject:", v4);
  baseObject = self->_baseObject;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLResidencySetSPI addAllocation:](baseObject, "addAllocation:", v6);

  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
    uint64_t v7 = v19;
    *(_DWORD *)(v19 + 8) = -15212;
    unsigned __int8 v8 = v22;
    if (v22 > 0x30uLL)
    {
      uint64_t v10 = *(void *)(v18[1] + 24LL);
      uint64_t v11 = v23++;
      v9 = GTTraceMemPool_allocateBytes(v10, v20, v11 | 0x1000000000LL) + 16;
      unsigned __int8 v8 = v11;
    }

    else
    {
      v9 = (char *)(v7 + v22);
      v22 += 16;
    }

    *(_BYTE *)(v7 + 13) = v8;
    id v12 = -[CaptureMTLResidencySet traceStream](self, "traceStream");
    if (v12) {
      unint64_t var0 = v12->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v14 = (uint64_t *)[v4 traceStream];
    if (v14) {
      uint64_t v15 = *v14;
    }
    else {
      uint64_t v15 = 0LL;
    }
    *(void *)v9 = var0;
    *((void *)v9 + 1) = v15;
    s();
    *(void *)uint64_t v16 = v17;
    *(_BYTE *)(v16 + 8) = v21;
    *(_BYTE *)(v19 + 15) |= 8u;
  }
}

- (void)addAllocations:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v7 = 0LL;
  if (a4)
  {
    do
      id v8 = -[NSMutableSet addObject:](self->_tempAllocations, "addObject:", a3[v7++]);
    while (a4 != v7);
    baseObject = self->_baseObject;
    unint64_t v7 = 8 * a4;
    __chkstk_darwin(v8, v9);
    uint64_t v11 = &v24[-((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v12 = 0LL;
    do
    {
      *(void *)&v11[8 * v12] = [(id)a3[v12] baseObject];
      ++v12;
    }

    while (a4 != v12);
  }

  else
  {
    baseObject = self->_baseObject;
    uint64_t v11 = &v31;
  }

  -[MTLResidencySetSPI addAllocations:count:](baseObject, "addAllocations:count:", v11, a4);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v24);
    uint64_t v13 = v26;
    *(_DWORD *)(v26 + 8) = -15211;
    unsigned __int8 v14 = v29;
    if (v29 > 0x28uLL)
    {
      uint64_t v16 = *(void *)(v25 + 24);
      uint64_t v17 = v30++;
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v27, v17 | 0x1800000000LL) + 16;
      unsigned __int8 v14 = v17;
    }

    else
    {
      uint64_t v15 = (char *)(v13 + v29);
      v29 += 24;
    }

    *(_BYTE *)(v13 + 13) = v14;
    objc_super v18 = -[CaptureMTLResidencySet traceStream](self, "traceStream");
    if (v18) {
      unint64_t var0 = v18->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v18, v19);
    char v21 = StreamArray((uint64_t)v24, &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)], (id *)a3, a4);
    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = a4;
    v15[16] = v21;
    *(_DWORD *)(v15 + 17) = 0;
    *((_DWORD *)v15 + 5) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(_BYTE *)(v22 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

- (void)removeAllocation:(id)a3
{
  id v4 = a3;
  ResidencySetTakeSnapshotInternal(self, 0);
  -[NSMutableSet removeObject:](self->_tempAllocations, "removeObject:", v4);
  baseObject = self->_baseObject;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLResidencySetSPI removeAllocation:](baseObject, "removeAllocation:", v6);

  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
    uint64_t v7 = v19;
    *(_DWORD *)(v19 + 8) = -15207;
    unsigned __int8 v8 = v22;
    if (v22 > 0x30uLL)
    {
      uint64_t v10 = *(void *)(v18[1] + 24LL);
      uint64_t v11 = v23++;
      uint64_t v9 = GTTraceMemPool_allocateBytes(v10, v20, v11 | 0x1000000000LL) + 16;
      unsigned __int8 v8 = v11;
    }

    else
    {
      uint64_t v9 = (char *)(v7 + v22);
      v22 += 16;
    }

    *(_BYTE *)(v7 + 13) = v8;
    uint64_t v12 = -[CaptureMTLResidencySet traceStream](self, "traceStream");
    if (v12) {
      unint64_t var0 = v12->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    unsigned __int8 v14 = (uint64_t *)[v4 traceStream];
    if (v14) {
      uint64_t v15 = *v14;
    }
    else {
      uint64_t v15 = 0LL;
    }
    *(void *)uint64_t v9 = var0;
    *((void *)v9 + 1) = v15;
    s();
    *(void *)uint64_t v16 = v17;
    *(_BYTE *)(v16 + 8) = v21;
    *(_BYTE *)(v19 + 15) |= 8u;
  }
}

- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v7 = 0LL;
  if (a4)
  {
    do
      id v8 = -[NSMutableSet removeObject:](self->_tempAllocations, "removeObject:", a3[v7++]);
    while (a4 != v7);
    baseObject = self->_baseObject;
    unint64_t v7 = 8 * a4;
    __chkstk_darwin(v8, v9);
    uint64_t v11 = &v24[-((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v12 = 0LL;
    do
    {
      *(void *)&v11[8 * v12] = [(id)a3[v12] baseObject];
      ++v12;
    }

    while (a4 != v12);
  }

  else
  {
    baseObject = self->_baseObject;
    uint64_t v11 = &v31;
  }

  -[MTLResidencySetSPI removeAllocations:count:](baseObject, "removeAllocations:count:", v11, a4);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v24);
    uint64_t v13 = v26;
    *(_DWORD *)(v26 + 8) = -15206;
    unsigned __int8 v14 = v29;
    if (v29 > 0x28uLL)
    {
      uint64_t v16 = *(void *)(v25 + 24);
      uint64_t v17 = v30++;
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v27, v17 | 0x1800000000LL) + 16;
      unsigned __int8 v14 = v17;
    }

    else
    {
      uint64_t v15 = (char *)(v13 + v29);
      v29 += 24;
    }

    *(_BYTE *)(v13 + 13) = v14;
    objc_super v18 = -[CaptureMTLResidencySet traceStream](self, "traceStream");
    if (v18) {
      unint64_t var0 = v18->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    __chkstk_darwin(v18, v19);
    char v21 = StreamArray((uint64_t)v24, &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)], (id *)a3, a4);
    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = a4;
    v15[16] = v21;
    *(_DWORD *)(v15 + 17) = 0;
    *((_DWORD *)v15 + 5) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(_BYTE *)(v22 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

- (void)removeAllAllocations
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v12);
    uint64_t v3 = v13;
    *(_DWORD *)(v13 + 8) = -15208;
    unsigned __int8 v4 = v16;
    if (v16 > 0x38uLL)
    {
      uint64_t v6 = *(void *)(v12[1] + 24LL);
      uint64_t v7 = v17++;
      v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
      unsigned __int8 v4 = v7;
    }

    else
    {
      v5 = (char *)(v3 + v16);
      v16 += 8;
    }

    *(_BYTE *)(v3 + 13) = v4;
    id v8 = -[CaptureMTLResidencySet traceStream](self, "traceStream");
    if (v8) {
      unint64_t var0 = v8->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    *(void *)v5 = var0;
    s();
    *(void *)uint64_t v10 = v11;
    *(_BYTE *)(v10 + 8) = v15;
    *(_BYTE *)(v13 + 15) |= 8u;
  }

- (NSArray)allAllocations
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_tempAllocations, "allObjects"));
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (NSArray)allCommittedAllocations
{
  return (NSArray *)-[NSArray copy](self->_committedAllocations, "copy");
}

- (void)commit
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_tempAllocations, "allObjects"));
  unsigned __int8 v4 = (NSArray *)[v3 copy];
  committedAllocations = self->_committedAllocations;
  self->_committedAllocations = v4;

  -[MTLResidencySetSPI commit](self->_baseObject, "commit");
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v15);
    uint64_t v6 = v16;
    *(_DWORD *)(v16 + 8) = -15220;
    unsigned __int8 v7 = v19;
    if (v19 > 0x38uLL)
    {
      uint64_t v9 = *(void *)(v15[1] + 24LL);
      uint64_t v10 = v20++;
      id v8 = GTTraceMemPool_allocateBytes(v9, v17, v10 | 0x800000000LL) + 16;
      unsigned __int8 v7 = v10;
    }

    else
    {
      id v8 = (char *)(v6 + v19);
      v19 += 8;
    }

    *(_BYTE *)(v6 + 13) = v7;
    uint64_t v11 = -[CaptureMTLResidencySet traceStream](self, "traceStream");
    if (v11) {
      unint64_t var0 = v11->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    *(void *)id v8 = var0;
    s();
    *(void *)uint64_t v13 = v14;
    *(_BYTE *)(v13 + 8) = v18;
    *(_BYTE *)(v16 + 15) |= 8u;
  }

- (id)allCommittedHeaps
{
  return &__NSArray0__struct;
}

- (id)allCommittedResources
{
  return &__NSArray0__struct;
}

- (id)allHeaps
{
  return &__NSArray0__struct;
}

- (id)allResources
{
  return &__NSArray0__struct;
}

- (BOOL)containsHeap:(id)a3
{
  return 0;
}

- (BOOL)containsResource:(id)a3
{
  return 0;
}

- (unint64_t)countForHeap:(id)a3
{
  return 0LL;
}

- (unint64_t)countForResource:(id)a3
{
  return 0LL;
}

- (unint64_t)generationForHeap:(id)a3
{
  return 0LL;
}

- (unint64_t)generationForResource:(id)a3
{
  return 0LL;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLResidencySet;
  uint64_t v3 = -[CaptureMTLResidencySet description](&v8, "description");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLResidencySetSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLResidencySetSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (unint64_t)allocatedSize
{
  return (unint64_t)-[MTLResidencySetSPI allocatedSize](self->_baseObject, "allocatedSize");
}

- (unint64_t)allocationCount
{
  return (unint64_t)-[MTLResidencySetSPI allocationCount](self->_baseObject, "allocationCount");
}

- (unint64_t)currentGeneration
{
  return (unint64_t)-[MTLResidencySetSPI currentGeneration](self->_baseObject, "currentGeneration");
}

- (void)setCurrentGeneration:(unint64_t)a3
{
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)expiredGeneration
{
  return (unint64_t)-[MTLResidencySetSPI expiredGeneration](self->_baseObject, "expiredGeneration");
}

- (void)setExpiredGeneration:(unint64_t)a3
{
}

- (NSString)label
{
  return (NSString *)-[MTLResidencySetSPI label](self->_baseObject, "label");
}

- (BOOL)containsAllocation:(id)a3
{
  baseObject = self->_baseObject;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  LOBYTE(baseObject) = -[MTLResidencySetSPI containsAllocation:](baseObject, "containsAllocation:", v4);

  return (char)baseObject;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -15231;
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
  objc_super v8 = -[CaptureMTLResidencySet traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLResidencySet;
  -[CaptureMTLResidencySet dealloc](&v12, "dealloc");
}

- (void)endResidency
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15230;
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
  objc_super v8 = -[CaptureMTLResidencySet traceStream](self, "traceStream");
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

- (unint64_t)generationForAllocation:(id)a3
{
  baseObject = self->_baseObject;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  id v5 = -[MTLResidencySetSPI generationForAllocation:](baseObject, "generationForAllocation:", v4);

  return (unint64_t)v5;
}

- (void)requestResidency
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15223;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    id v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    id v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  objc_super v8 = -[CaptureMTLResidencySet traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
}

- (void).cxx_destruct
{
}

@end