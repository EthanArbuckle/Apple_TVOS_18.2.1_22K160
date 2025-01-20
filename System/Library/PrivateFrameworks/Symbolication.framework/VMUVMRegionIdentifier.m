@interface VMUVMRegionIdentifier
+ (id)descriptionForRange:(_VMURange)a3 inSortedRegions:(id)a4 options:(unint64_t)a5;
- ($B3784314699B2BBEAD7DAC31D728563A)computedStatisticsForZoneWithName:(SEL)a3;
- ($B3784314699B2BBEAD7DAC31D728563A)summaryStatisticsOfAllZones;
- (BOOL)didPhysFootprintDirtyAccounting;
- (BOOL)hasFractionalPageSizes;
- (BOOL)recordedPhysFootprint;
- (NSArray)zoneNames;
- (NSDictionary)ledger;
- (VMUVMRegionIdentifier)init;
- (VMUVMRegionIdentifier)initWithGraph:(id)a3 options:(unint64_t)a4;
- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3;
- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 options:(unint64_t)a4;
- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 pid:(int)a4 options:(unint64_t)a5;
- (VMUVMRegionIdentifier)initWithVMUTask:(id)a3 options:(unint64_t)a4;
- (id)descriptionForMallocZoneTotals:(unint64_t)a3;
- (id)descriptionForMallocZoneTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4;
- (id)descriptionForRange:(_VMURange)a3;
- (id)descriptionForRange:(_VMURange)a3 options:(unint64_t)a4;
- (id)descriptionForRegionTotals:(unint64_t)a3;
- (id)descriptionForRegionTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4;
- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4;
- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4 maximumLength:(unint64_t)a5 memorySizeDivisor:(unsigned int)a6;
- (id)nonSubmapRegionContainingAddress:(unint64_t)a3;
- (id)regions;
- (id)taskThreadStates;
- (int)_recordRegionsAroundAddress:(unint64_t)a3 regionDescriptionOptions:(unint64_t)a4;
- (void)_computeStatistics:(id *)a3;
@end

@implementation VMUVMRegionIdentifier

- (VMUVMRegionIdentifier)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VMUVMRegionIdentifier;
  v2 = -[VMUVMRegionIdentifier init](&v8, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    regions = v2->_regions;
    v2->_regions = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x189607920] mapTableWithKeyOptions:0 valueOptions:259];
    mallocZoneStatisticsMap = v2->_mallocZoneStatisticsMap;
    v2->_mallocZoneStatisticsMap = (NSMapTable *)v5;
  }

  return v2;
}

- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 pid:(int)a4 options:(unint64_t)a5
{
  v7 = -[VMUTask initWithTask:](objc_alloc(&OBJC_CLASS___VMUTask), "initWithTask:", *(void *)&a3);
  objc_super v8 = -[VMUVMRegionIdentifier initWithVMUTask:options:](self, "initWithVMUTask:options:", v7, a5);

  return v8;
}

- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  v6 = -[VMUTask initWithTask:](objc_alloc(&OBJC_CLASS___VMUTask), "initWithTask:", *(void *)&a3);
  v7 = -[VMUVMRegionIdentifier initWithVMUTask:options:](self, "initWithVMUTask:options:", v6, a4);

  return v7;
}

- (VMUVMRegionIdentifier)initWithVMUTask:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  objc_super v8 = -[VMUVMRegionIdentifier init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_task, a3);
    v10 = -[VMUTaskThreadStates initWithVMUTask:](objc_alloc(&OBJC_CLASS___VMUTaskThreadStates), "initWithVMUTask:", v7);
    threadStates = v9->_threadStates;
    v9->_threadStates = v10;

    uint64_t v12 = +[VMUProcessLedger ledgerForVMUTask:](&OBJC_CLASS___VMUProcessLedger, "ledgerForVMUTask:", v9->_task);
    ledger = v9->_ledger;
    v9->_ledger = (NSDictionary *)v12;

    if (-[VMUTask isCore](v9->_task, "isCore")
      || (unsigned int v14 = -[VMUTask taskPort](v9->_task, "taskPort"), (a4 & 0x1000) == 0) && v14)
    {
      if (-[VMUVMRegionIdentifier _recordRegionsAroundAddress:regionDescriptionOptions:]( v9,  "_recordRegionsAroundAddress:regionDescriptionOptions:",  0LL,  a4))
      {

        v9 = 0LL;
      }
    }
  }

  return v9;
}

- (VMUVMRegionIdentifier)initWithTask:(unsigned int)a3
{
  return -[VMUVMRegionIdentifier initWithTask:options:](self, "initWithTask:options:", *(void *)&a3, 0LL);
}

- (VMUVMRegionIdentifier)initWithGraph:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = -[VMUVMRegionIdentifier init](self, "init");
  if (v7)
  {
    int v8 = [v6 zoneCount];
    uint64_t v9 = MEMORY[0x1895F87A8];
    if (v8)
    {
      v10 = malloc(8 * [v6 zoneCount]);
      if ([v6 zoneCount])
      {
        unint64_t v11 = 0LL;
        do
        {
          v10[v11] = calloc(1uLL, 0x50uLL);
          NSMapInsertKnownAbsent( v7->_mallocZoneStatisticsMap,  (const void *)[v6 zoneNameForIndex:v11],  (const void *)v10[v11]);
          ++v11;
        }

        while (v11 < [v6 zoneCount]);
      }

      v24[0] = v9;
      v24[1] = 3221225472LL;
      v24[2] = __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke;
      v24[3] = &unk_189DFED78;
      id v25 = v6;
      v26 = v10;
      VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v25, v24);
    }

    else
    {
      v10 = 0LL;
    }

    uint64_t v12 = [v6 vmPageSize] - 1;
    v22[0] = 0LL;
    v22[1] = v22;
    v22[2] = 0x3032000000LL;
    v22[3] = __Block_byref_object_copy__7;
    v22[4] = __Block_byref_object_dispose__7;
    id v23 = 0LL;
    v15[0] = v9;
    v15[1] = 3221225472LL;
    v15[2] = __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke_98;
    v15[3] = &unk_189DFEDA0;
    v13 = v7;
    v16 = v13;
    id v17 = v6;
    v18 = v22;
    v19 = v10;
    unint64_t v20 = a4;
    uint64_t v21 = v12;
    [v17 enumerateRegionsWithBlock:v15];
    coalesceIdenticalRegions(v13->_regions, a4);
    free(v10);
    v13->_recordedPhysFootprint = BYTE2(a4) & 1;
    if ((a4 & 0x10000) != 0) {
      v13->_didPhysFootprintDirtyAccounting = 1;
    }

    _Block_object_dispose(v22, 8);
  }

  return v7;
}

int64x2_t __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  unsigned int *a4)
{
  if (*(void *)(a3 + 8) >> 60 == 1LL)
  {
    uint64_t v7 = a4[37];
    if ((_DWORD)v7 != -1 && v7 >= [*(id *)(a1 + 32) zoneCount])
    {
      uint64_t v8 = [*(id *)(a1 + 32) zoneCount];
      [a4 description];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(@"Malloc zone count is %u but zoneIndex is %u for %@\n", v8, v7, v9);
    }

    if (v7 < [*(id *)(a1 + 32) zoneCount])
    {
      unint64_t v11 = *(int64x2_t **)(*(void *)(a1 + 40) + 8 * v7);
      int64x2_t v12 = vdupq_n_s64(1uLL);
      v12.i64[0] = *(void *)(a3 + 8) & 0xFFFFFFFFFFFFFFFLL;
      int64x2_t result = vaddq_s64(*v11, v12);
      *unint64_t v11 = result;
    }
  }

  return result;
}

void __47__VMUVMRegionIdentifier_initWithGraph_options___block_invoke_98(uint64_t a1, void *a2)
{
  v16 = a2;
  v4 = (void *)MEMORY[0x186E32E40]();
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:v16];
  int v5 = [*(id *)(a1 + 40) zoneCount];
  id v6 = v16;
  if (!v5) {
    goto LABEL_13;
  }
  unsigned int v7 = v16[37];
  unsigned int v8 = [*(id *)(a1 + 40) zoneCount];
  id v6 = v16;
  if (v7 >= v8 || v16[37] == -1 || !*((void *)v16 + 17) && !v16[36]) {
    goto LABEL_13;
  }
  uint64_t v9 = [*(id *)(a1 + 40) zoneNameForIndex:];
  v10 = (void *)*((void *)v16 + 5);
  *((void *)v16 + 5) = v9;

  addMallocRegionPageStatistics(v16, *(void **)(*(void *)(a1 + 56) + 8LL * v16[37]));
  id v6 = v16;
  unint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (!v11) {
    goto LABEL_13;
  }
  if ((*(_BYTE *)(a1 + 64) & 0x80) == 0)
  {
    id v12 = v11;
    v13 = v16;
    if (shouldProbablyCoalesceRegions(v12, v13) && [v12 hasSameInfoAsRegion:v13])
    {

      id v6 = v16;
      goto LABEL_13;
    }

    id v6 = v16;
  }

  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL * v6[37]);
  ++*(void *)(v14 + 56);
LABEL_13:
  setTypeIfMallocRegion(v6);
  uint64_t v15 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v15 + 48)) {
    *(_BYTE *)(v15 + 48) = ((*((void *)v16 + 20) | *((void *)v16 + 2) | *((void *)v16 + 23)) & *(void *)(a1 + 72)) != 0LL;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  objc_autoreleasePoolPop(v4);
}

- (id)regions
{
  return self->_regions;
}

- (id)taskThreadStates
{
  return self->_threadStates;
}

- (id)nonSubmapRegionContainingAddress:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_regions;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isSubmap", (void)v12) & 1) == 0 && a3 - v9[1] < v9[2])
        {
          v10 = v9;
          goto LABEL_12;
        }
      }

      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  v10 = 0LL;
LABEL_12:

  return v10;
}

- (BOOL)hasFractionalPageSizes
{
  return self->_hasFractionalPageSizes;
}

- (int)_recordRegionsAroundAddress:(unint64_t)a3 regionDescriptionOptions:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (_recordRegionsAroundAddress_regionDescriptionOptions__onceToken != -1) {
    dispatch_once(&_recordRegionsAroundAddress_regionDescriptionOptions__onceToken, &__block_literal_global_13);
  }
  uint64_t v7 = getprogname();
  int v8 = strcmp(v7, "ReportCrash");
  unint64_t v9 = a4 | 0x500;
  if (v8) {
    unint64_t v9 = a4;
  }
  uint64_t v10 = v9 & 0x30000;
  unint64_t v11 = v9 & 0xFFFFFFFFFFFDFFFFLL;
  if ((v9 & 0x30000) == 0) {
    v9 |= 0x10000uLL;
  }
  if (v10 == 196608) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v9;
  }
  self->_recordedPhysFootprint = BYTE2(v12) & 1;
  if ((v12 & 0x10000) != 0) {
    self->_didPhysFootprintDirtyAccounting = 1;
  }
  [(id)_recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock lock];
  int v13 = recordRegions( self->_task,  a3,  self->_regions,  self->_threadStates,  self->_mallocZoneStatisticsMap,  self->_ledger,  v12);
  [(id)_recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock unlock];
  if (!v13)
  {
    if (*MEMORY[0x1895FD560] >= *MEMORY[0x1895FD578]) {
      uint64_t v14 = *MEMORY[0x1895FD578];
    }
    else {
      uint64_t v14 = *MEMORY[0x1895FD560];
    }
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v15 = self->_regions;
    uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
LABEL_18:
      uint64_t v19 = 0LL;
      while (1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        if (!self->_hasFractionalPageSizes)
        {
          uint64_t v20 = (*(void *)(*(void *)(*((void *)&v22 + 1) + 8 * v19) + 160LL) | *(void *)(*(void *)(*((void *)&v22 + 1) + 8 * v19)
                                                                                               + 16LL) | *(void *)(*(void *)(*((void *)&v22 + 1) + 8 * v19) + 184LL)) & v14;
          self->_hasFractionalPageSizes = v20 != 0;
          if (v20) {
            break;
          }
        }

        if (v17 == ++v19)
        {
          uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
          if (v17) {
            goto LABEL_18;
          }
          break;
        }
      }
    }

    return 0;
  }

  return v13;
}

void __78__VMUVMRegionIdentifier__recordRegionsAroundAddress_regionDescriptionOptions___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607910]);
  v1 = (void *)_recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock;
  _recordRegionsAroundAddress_regionDescriptionOptions__recordRegionsLock = (uint64_t)v0;
}

- (NSArray)zoneNames
{
  mallocZoneStatisticsMap = self->_mallocZoneStatisticsMap;
  if (mallocZoneStatisticsMap)
  {
    NSAllMapTableKeys(mallocZoneStatisticsMap);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- ($B3784314699B2BBEAD7DAC31D728563A)computedStatisticsForZoneWithName:(SEL)a3
{
  id v8 = a4;
  uint64_t v6 = NSMapGet(self->_mallocZoneStatisticsMap, v8);
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  if (v6)
  {
    *(_OWORD *)&retstr->var0 = *v6;
    *(_OWORD *)&retstr->var2 = v6[1];
    *(_OWORD *)&retstr->var4 = v6[2];
    *(_OWORD *)&retstr->var6 = v6[3];
  }

  else
  {
    NSLog(@"No malloc zone statistics available for malloc zone %@\n", v8);
  }

  -[VMUVMRegionIdentifier _computeStatistics:](self, "_computeStatistics:", retstr);

  return result;
}

- ($B3784314699B2BBEAD7DAC31D728563A)summaryStatisticsOfAllZones
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  -[VMUVMRegionIdentifier zoneNames](self, "zoneNames");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  int64x2_t v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v17;
    int64x2_t v13 = 0u;
    int64x2_t v14 = 0u;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = (char *)NSMapGet(self->_mallocZoneStatisticsMap, *(const void **)(*((void *)&v16 + 1) + 8 * v10));
        if (v11)
        {
          int64x2_t v14 = vaddq_s64(v14, *((int64x2_t *)v11 + 1));
          *(int64x2_t *)&retstr->var2 = v14;
          int64x2_t v13 = vaddq_s64(v13, *(int64x2_t *)(v11 + 40));
          *(int64x2_t *)&retstr->var5 = v13;
          int64x2_t v15 = vaddq_s64(v15, *(int64x2_t *)v11);
          *(int64x2_t *)&retstr->var0 = v15;
          v8 += *((void *)v11 + 7);
          retstr->var7 = v8;
        }

        ++v10;
      }

      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  -[VMUVMRegionIdentifier _computeStatistics:](self, "_computeStatistics:", retstr, *(_OWORD *)&v13, *(_OWORD *)&v14);

  return result;
}

- (void)_computeStatistics:(id *)a3
{
  if (a3)
  {
    unint64_t var0 = a3->var0;
    unint64_t v4 = a3->var5 + a3->var6;
    if (v4) {
      BOOL v5 = v4 > var0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      unint64_t v6 = 100 - 100 * var0 / v4;
      unint64_t v7 = v4 - var0;
    }

    else
    {
      unint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
    }

    a3->var8 = v6;
    a3->var9 = v7;
  }

+ (id)descriptionForRange:(_VMURange)a3 inSortedRegions:(id)a4 options:(unint64_t)a5
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  id v7 = a4;
  [MEMORY[0x189607940] string];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v7 count];
  if (v9)
  {
    unint64_t v10 = v9;
    unint64_t v11 = 0LL;
    int v12 = 0;
    unint64_t v24 = location + length;
    unint64_t v23 = length;
    do
    {
      uint64_t v13 = [v7 objectAtIndexedSubscript:v11];
      if (VMURangeIntersectsRange(location, length, *(void *)(v13 + 8), *(void *)(v13 + 16)))
      {
        if ([(id)v13 isSubmap])
        {
          unint64_t v11 = (v12 + 1);
          if (v10 > v11)
          {
            uint64_t v21 = [(id)v13 address];
            [v7 objectAtIndexedSubscript:(v12 + 1)];
            int64x2_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v15 = [v14 address];

            BOOL v16 = v21 == v15;
            unint64_t length = v23;
            if (v16) {
              goto LABEL_12;
            }
          }
        }

        uint64_t v17 = [v8 length];
        if (v17) {
          uint64_t v17 = [v8 appendString:@"\n"];
        }
        __int128 v18 = (void *)MEMORY[0x186E32E40](v17);
        [(id)v13 descriptionWithOptions:a5 maximumLength:0];
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 appendString:v19];

        objc_autoreleasePoolPop(v18);
        unint64_t length = v23;
      }

      if (*(void *)(v13 + 8) >= v24)
      {

        break;
      }

      unint64_t v11 = (v12 + 1);
LABEL_12:

      int v12 = v11;
    }

    while (v10 > v11);
  }

  return v8;
}

- (id)descriptionForRange:(_VMURange)a3
{
  return +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:]( &OBJC_CLASS___VMUVMRegionIdentifier,  "descriptionForRange:inSortedRegions:options:",  a3.location,  a3.length,  self->_regions,  1LL);
}

- (id)descriptionForRange:(_VMURange)a3 options:(unint64_t)a4
{
  return +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:]( &OBJC_CLASS___VMUVMRegionIdentifier,  "descriptionForRange:inSortedRegions:options:",  a3.location,  a3.length,  self->_regions,  a4);
}

- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4
{
  return -[VMUVMRegionIdentifier descriptionOfRegionsAroundAddress:options:maximumLength:memorySizeDivisor:]( self,  "descriptionOfRegionsAroundAddress:options:maximumLength:memorySizeDivisor:",  a3,  a4,  0LL,  1LL);
}

- (id)descriptionOfRegionsAroundAddress:(unint64_t)a3 options:(unint64_t)a4 maximumLength:(unint64_t)a5 memorySizeDivisor:(unsigned int)a6
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (!-[NSMutableArray count](self->_regions, "count"))
  {
    a4 |= 0x80uLL;
    -[VMUVMRegionIdentifier _recordRegionsAroundAddress:regionDescriptionOptions:]( self,  "_recordRegionsAroundAddress:regionDescriptionOptions:",  a3,  a4);
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  v34 = self;
  unint64_t v10 = self->_regions;
  uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
  unint64_t v33 = a4;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0LL;
    int64x2_t v14 = 0LL;
    uint64_t v15 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v18 = v17[1];
        unint64_t v19 = v17[2];
        if (v18 + v19 - 1 >= a3)
        {
          if (a3 - v18 >= v19)
          {
            __int128 v22 = v17;
            goto LABEL_16;
          }

          uint64_t v20 = v13;
          uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        }

        else
        {
          uint64_t v20 = v14;
          int64x2_t v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        }

        uint64_t v21 = v17;
      }

      uint64_t v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v44,  v48,  16LL);
      if (v12) {
        continue;
      }
      break;
    }

    __int128 v22 = 0LL;
LABEL_16:
    a4 = v33;
  }

  else
  {
    __int128 v22 = 0LL;
    uint64_t v13 = 0LL;
    int64x2_t v14 = 0LL;
  }

  [MEMORY[0x189607940] string];
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 <= 0x50) {
    unint64_t v24 = a5;
  }
  else {
    unint64_t v24 = a5 - 6;
  }
  uint64_t v25 = MEMORY[0x1895F87A8];
  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  v38[2] = __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke;
  v38[3] = &unk_189DFEDE8;
  id v26 = v23;
  unint64_t v41 = a4;
  unint64_t v42 = v24;
  unsigned int v43 = a6;
  id v39 = v26;
  v40 = v34;
  uint64_t v27 = (void (**)(void, void, void))MEMORY[0x186E33044](v38);
  v36[0] = v25;
  v36[1] = 3221225472LL;
  v36[2] = __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke_2;
  v36[3] = &unk_189DFEE10;
  id v28 = v26;
  id v37 = v28;
  v29 = (void (**)(void, void, void, void))MEMORY[0x186E33044](v36);
  if (v13)
  {
    [v28 appendFormat:@"%#llx is in %#llx-%#llx;  bytes after start: %llu  bytes before end: %llu\n"];
      a3,
      v13[1],
      v13[2] + v13[1],
      a3 - v13[1],
      v13[2] + v13[1] + ~a3);
  }

  else
  {
    [v28 appendFormat:@"%#llx is not in any region.  "];
    if (v14) {
      [v28 appendFormat:@"Bytes after previous region: %llu  "];
    }
    if (v22) {
      [v28 appendFormat:@"Bytes before following region: %llu" v22[1] - a3];
    }
    [v28 appendString:@"\n"];
  }

  [v28 appendString:@"\n"];
  v30 = +[VMUVMRegion columnHeadersWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:]( &OBJC_CLASS___VMUVMRegion,  "columnHeadersWithOptions:maximumLength:memorySizeDivisor:hasFractionalPageSizes:",  v33,  v24,  a6,  v34->_hasFractionalPageSizes);
  [v28 appendFormat:@"%s%@\n", "      ", v30];

  if (v14) {
    ((void (**)(void, const char *, void *))v27)[2](v27, "      ", v14);
  }
  else {
    [v28 appendFormat:@"%sUNUSED SPACE AT START\n", "      "];
  }
  ((void (**)(void, const char *, void *, void *))v29)[2](v29, "      ", v14, v13);
  if (v13)
  {
    ((void (**)(void, const char *, void *))v27)[2](v27, "--->  ", v13);
  }

  else
  {
    if (v22 && v14)
    {
      ((void (**)(void, const char *, void *, void *))v29)[2](v29, "--->  ", v14, v22);
      ((void (**)(void, const char *, void, void *))v29)[2](v29, "      ", 0LL, v22);
      goto LABEL_38;
    }

    [v28 appendFormat:@"%s\n", "--->  "];
  }

  ((void (**)(void, const char *, void *, void *))v29)[2](v29, "      ", v13, v22);
  if (!v22)
  {
    [v28 appendFormat:@"%sUNUSED SPACE AT END\n", "      "];
    goto LABEL_40;
  }

void __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  if (a3)
  {
    [a3 descriptionWithOptions:*(void *)(a1 + 48) maximumLength:*(void *)(a1 + 56) memorySizeDivisor:*(unsigned int *)(a1 + 64) hasFractionalPageSizes:*(unsigned __int8 *)(*(void *)(a1 + 40) + 48)];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 appendFormat:@"%s%@\n", a2, v5];
  }

  else
  {
    [v4 appendFormat:@"%s%@\n", a2, &stru_189E010C8];
  }

void __99__VMUVMRegionIdentifier_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7)
    {
      unint64_t v8 = v12[2] + v12[1];
      unint64_t v9 = v7[1];
      BOOL v10 = v9 > v8;
      uint64_t v11 = v9 - v8;
      if (v10) {
        [*(id *)(a1 + 32) appendFormat:@"%sGAP OF %#llx BYTES\n" a2 v11];
      }
    }
  }
}

- (id)descriptionForMallocZoneTotals:(unint64_t)a3
{
  return -[VMUVMRegionIdentifier descriptionForMallocZoneTotals:memorySizeDivisor:]( self,  "descriptionForMallocZoneTotals:memorySizeDivisor:",  a3,  1LL);
}

- (id)descriptionForMallocZoneTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4
{
  int v4 = a3;
  uint64_t v58 = *MEMORY[0x1895F89C0];
  unint64_t v6 = (void *)objc_opt_new();
  -[VMUVMRegionIdentifier zoneNames](self, "zoneNames");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1895F87A8];
  v54[1] = 3221225472LL;
  v54[2] = __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke;
  v54[3] = &__block_descriptor_33_e22_Q16__0____QQQQQQQQQQ_8l;
  BOOL v55 = (v4 & 0x100000) != 0;
  v52[0] = MEMORY[0x1895F87A8];
  v52[1] = 3221225472LL;
  v52[2] = __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke_2;
  v52[3] = &unk_189DFEE58;
  v52[4] = self;
  id v32 = (id)MEMORY[0x186E33044](v54);
  id v53 = v32;
  [v7 sortedArrayUsingComparator:v52];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v48 objects:v57 count:16];
  uint64_t v11 = v6;
  if (v10)
  {
    uint64_t v12 = v10;
    unsigned int v13 = 0;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v9);
        }
        BOOL v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      }

      uint64_t v12 = [v9 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }

    while (v12);

    if (v13 <= 0xB) {
      unsigned int v17 = 11;
    }
    else {
      unsigned int v17 = v13;
    }
    if (v17 >= 0x3C) {
      uint64_t v18 = 60LL;
    }
    else {
      uint64_t v18 = v17;
    }
    unint64_t v6 = v11;
  }

  else
  {

    uint64_t v18 = 11LL;
  }

  appendMallocZoneTextLine( v6,  v4,  v18,  (uint64_t)",  (uint64_t)"VIRTUAL",  (uint64_t)"RESIDENT",  (uint64_t)"DIRTY",  (uint64_t)"SWAPPED",  (uint64_t)"DIRTY+SWAP",  (uint64_t)"ALLOCATION",  (uint64_t)"BYTES",  (uint64_t)"DIRTY+SWAP",  (uint64_t)",  (uint64_t)"REGION");
  if (a4 <= 1) {
    unint64_t v19 = "SIZE";
  }
  else {
    unint64_t v19 = "PAGES";
  }
  appendMallocZoneTextLine( v6,  v4,  v18,  (uint64_t)"MALLOC ZONE",  (uint64_t)v19,  (uint64_t)v19,  (uint64_t)v19,  (uint64_t)v19,  (uint64_t)v19,  (uint64_t)"COUNT",  (uint64_t)"ALLOCATED",  (uint64_t)"FRAG SIZE",  (uint64_t)"% FRAG",  (uint64_t)"COUNT");
  uint64_t v20 = (void *)objc_opt_new();
  appendMallocZoneTextLine( v20,  v4,  v18,  (uint64_t)"===========",  (uint64_t)"=======",  (uint64_t)"=========",  (uint64_t)"=========",  (uint64_t)"=========",  (uint64_t)"=========",  (uint64_t)"=========",  (uint64_t)"=========",  (uint64_t)"=========",  (uint64_t)"======",  (uint64_t)"======");
  id v31 = v20;
  [v6 appendString:v20];
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v21 = v9;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v45;
    do
    {
      for (uint64_t j = 0LL; j != v23; ++j)
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        -[VMUVMRegionIdentifier computedStatisticsForZoneWithName:](self, "computedStatisticsForZoneWithName:", v26);
        char hasFractionalPageSizes = self->_hasFractionalPageSizes;
        uint64_t v28 = [v26 UTF8String];
        __int128 v36 = v41;
        __int128 v37 = v42;
        __int128 v38 = v43;
        __int128 v34 = v39;
        __int128 v35 = v40;
        unint64_t v6 = v11;
        appendMallocZoneStatsLine(v11, v4, a4, hasFractionalPageSizes, v18, v28, (unint64_t *)&v34);
      }

      uint64_t v23 = [v21 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }

    while (v23);
  }

  if (![v21 count])
  {
    [v6 appendString:@"No malloc zones in target process\n"];
    *(void *)&__int128 v39 = 0LL;
    -[VMUTask hasStartedWithErrorString:](self->_task, "hasStartedWithErrorString:", &v39);
    if ((void)v39) {
      [v6 appendFormat:@"%s\n", v39];
    }
  }

  if (-[NSMapTable count](self->_mallocZoneStatisticsMap, "count") >= 2)
  {
    [v6 appendString:v31];
    -[VMUVMRegionIdentifier summaryStatisticsOfAllZones](self, "summaryStatisticsOfAllZones");
    char v29 = self->_hasFractionalPageSizes;
    __int128 v36 = v41;
    __int128 v37 = v42;
    __int128 v38 = v43;
    __int128 v34 = v39;
    __int128 v35 = v40;
    appendMallocZoneStatsLine(v6, v4, a4, v29, v18, (uint64_t)"TOTAL", (unint64_t *)&v34);
  }

  return v6;
}

uint64_t __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke( uint64_t a1,  void *a2)
{
  if (!a2) {
    return 0LL;
  }
  if (*(_BYTE *)(a1 + 32)) {
    return a2[5] + a2[6];
  }
  return a2[2];
}

uint64_t __74__VMUVMRegionIdentifier_descriptionForMallocZoneTotals_memorySizeDivisor___block_invoke_2( uint64_t a1,  const void *a2,  void *a3)
{
  id v5 = *(NSMapTable **)(*(void *)(a1 + 32) + 40LL);
  id v6 = a3;
  NSMapGet(v5, a2);
  NSMapGet(*(NSMapTable **)(*(void *)(a1 + 32) + 40LL), v6);

  unint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  else {
    return v8;
  }
}

- (id)descriptionForRegionTotals:(unint64_t)a3
{
  return -[VMUVMRegionIdentifier descriptionForRegionTotals:memorySizeDivisor:]( self,  "descriptionForRegionTotals:memorySizeDivisor:",  a3,  1LL);
}

- (id)descriptionForRegionTotals:(unint64_t)a3 memorySizeDivisor:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = self;
  v122[16] = *MEMORY[0x1895F89C0];
  if (!-[NSMutableArray count](self->_regions, "count"))
  {
    __int128 v35 = &stru_189E010C8;
    return v35;
  }

  unint64_t v7 = getprogname();
  if (!strcmp(v7, "ReportCrash")) {
    unint64_t v8 = a3 | 0x100;
  }
  else {
    unint64_t v8 = a3;
  }
  unint64_t v9 = (__CFString *)objc_opt_new();
  v122[0] = 0LL;
  unint64_t v115 = 0LL;
  *(void *)&__int128 v116 = 0LL;
  cumulateLibraries(v6->_regions, @"__TEXT", v122, &v116, &v115);
  cumulateLibraries(v6->_regions, @"__LINKEDIT", v122, &v116, &v115);
  unint64_t v10 = v122[0];
  if (v122[0])
  {
    uint64_t v11 = memorySizeString(v122[0]);
    unint64_t v12 = v116;
    uint64_t v13 = memorySizeString(v116);
    -[__CFString appendFormat:]( v9,  "appendFormat:",  @"ReadOnly portion of Libraries: Total=%s resident=%s(%.0f%%) swapped_out_or_unallocated=%s(%.0f%%)\n",  v11,  v13,  (float)((float)((float)v12 * 100.0) / (float)v10),  memorySizeString(v115),  (float)((float)((float)v115 * 100.0) / (float)v10));
  }

  unint64_t v101 = v8;
  v98 = v9;
  uint64_t v14 = v6->_regions;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v116,  v122,  16LL);
  unsigned int v97 = v4;
  v99 = (char *)v6;
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v17 = 0LL;
    unint64_t v18 = 0LL;
    unint64_t v19 = 0LL;
    unint64_t v20 = 0LL;
    unint64_t v21 = 0LL;
    uint64_t v22 = *(void *)v117;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v117 != v22) {
          objc_enumerationMutation(v14);
        }
        uint64_t v24 = *(void *)(*((void *)&v116 + 1) + 8 * i);
        if (!*(_BYTE *)(v24 + 48) && (*(_BYTE *)(v24 + 24) & 2) != 0 && !*(_BYTE *)(v24 + 49))
        {
          if (*(_BYTE *)(v24 + 50) == 2)
          {
            uint64_t v25 = *(void *)(v24 + 160);
            uint64_t v26 = *(void *)(v24 + 176);
            uint64_t v27 = v26 + v25;
            unint64_t v28 = v20;
            unint64_t v20 = v26 + v25;
          }

          else
          {
            unint64_t v28 = *(void *)(v24 + 168);
            uint64_t v25 = *(void *)(v24 + 160);
            uint64_t v26 = *(void *)(v24 + 176);
            uint64_t v27 = v25 + v26;
          }

          uint64_t v29 = *(void *)(v24 + 16);
          v21 += v29;
          v20 += v28;
          v19 += v25;
          v17 += v26;
          unint64_t v18 = v29 + v18 - v27;
          *(_BYTE *)(v24 + 48) = 1;
        }
      }

      uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v116,  v122,  16LL);
    }

    while (v16);

    uint64_t v4 = v97;
    id v6 = (VMUVMRegionIdentifier *)v99;
    if (v21)
    {
      uint64_t v30 = memorySizeString(v21);
      uint64_t v31 = memorySizeString(v20);
      uint64_t v32 = memorySizeString(v19);
      double v33 = (float)((float)((float)v19 * 100.0) / (float)v21);
      uint64_t v34 = memorySizeString(v17);
      -[__CFString appendFormat:]( v98,  "appendFormat:",  @"Writable regions: Total=%s written=%s(%.0f%%) resident=%s(%.0f%%) swapped_out=%s(%.0f%%) unallocated=%s(%.0f%%)\n",  v30,  v31,  (float)((float)((float)v20 * 100.0) / (float)v21),  v32,  *(void *)&v33,  v34,  (float)((float)((float)v17 * 100.0) / (float)v21),  memorySizeString(v18),  (float)((float)((float)v18 * 100.0) / (float)v21));
    }
  }

  else
  {
  }

  __int128 v36 = v6->_regions;
  [MEMORY[0x189603FC8] dictionary];
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  __int128 v37 = v36;
  uint64_t v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v116,  v122,  16LL);
  if (!v38)
  {
    unsigned int v92 = 0;
    unint64_t v90 = 0LL;
    unint64_t v91 = 0LL;
    unint64_t v40 = 0LL;
    unint64_t v88 = 0LL;
    unint64_t v89 = 0LL;
    unint64_t v41 = 0LL;
    unint64_t v42 = 0LL;
    unint64_t v44 = v101;
    goto LABEL_56;
  }

  uint64_t v39 = v38;
  unsigned int v92 = 0;
  unint64_t v90 = 0LL;
  unint64_t v91 = 0LL;
  unint64_t v40 = 0LL;
  unint64_t v88 = 0LL;
  unint64_t v89 = 0LL;
  unint64_t v41 = 0LL;
  unint64_t v42 = 0LL;
  uint64_t v43 = *(void *)v117;
  unint64_t v44 = v101;
  v105 = v37;
  do
  {
    for (uint64_t j = 0LL; j != v39; ++j)
    {
      if (*(void *)v117 != v43) {
        objc_enumerationMutation(v37);
      }
      uint64_t v46 = *(void *)(*((void *)&v116 + 1) + 8 * j);
      if ((*(_BYTE *)(v46 + 132) & 1) == 0
        && ([*(id *)(*((void *)&v116 + 1) + 8 * j) isNullRegion] & 1) == 0
        && ((v44 & 0x40) != 0
         || (*(_BYTE *)(v46 + 132) & 8) != 0
         || ([*(id *)(v46 + 32) hasPrefix:VMUunusedSharedLibLabelPrefix] & 1) == 0))
      {
        unint64_t v47 = v40;
        unint64_t v48 = v41;
        __int128 v49 = *(__CFString **)(v46 + 32);
        if (!v49) {
          __int128 v49 = @"unknown type";
        }
        __int128 v50 = v49;
        if ((-[__CFString hasPrefix:](v50, "hasPrefix:", @"MALLOC") & 1) != 0)
        {
          if ((v44 & 0x100) == 0)
          {
LABEL_45:
            if ((*(_BYTE *)(v46 + 132) & 8) != 0)
            {

              __int128 v50 = @"unused but dirty shlib __DATA";
            }

            [v102 objectForKey:v50];
            v52 = (VMUVMRegion *)objc_claimAutoreleasedReturnValue();
            if (!v52)
            {
              v52 = objc_alloc_init(&OBJC_CLASS___VMUVMRegion);
              objc_storeStrong((id *)&v52->type, v50);
              [v102 setObject:v52 forKey:v50];
            }

            -[VMUVMRegion addInfoFromRegion:](v52, "addInfoFromRegion:", v46);
            if (([(id)v46 isAnalysisToolRegion] & 1) == 0)
            {
              v47 += *(void *)(v46 + 16);
              v91 += *(void *)(v46 + 160);
              v90 += *(void *)(v46 + 184);
              v89 += *(void *)(v46 + 176);
              v48 += *(void *)(v46 + 192);
              ++v92;
              v88 += *(void *)(v46 + 200);
              v42 += *(void *)(v46 + 208);
            }

            unint64_t v44 = v101;
            unint64_t v41 = v48;
            unint64_t v40 = v47;
            __int128 v37 = v105;
            continue;
          }
        }

        else
        {
          char v51 = -[__CFString hasPrefix:](v50, "hasPrefix:", @"TC malloc");
          if ((v44 & 0x100) == 0 || (v51 & 1) == 0) {
            goto LABEL_45;
          }
        }

        if (*(_DWORD *)(v46 + 24) && *(_BYTE *)(v46 + 50) != 3)
        {

          __int128 v50 = @"MALLOC";
        }

        goto LABEL_45;
      }
    }

    uint64_t v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v116,  v122,  16LL);
  }

  while (v39);
LABEL_56:
  unint64_t v84 = v42;

  __int128 v35 = v98;
  -[__CFString appendString:](v98, "appendString:", @"\n");
  unint64_t v86 = v41;
  if ((v44 & 0x100000) != 0)
  {
    [v102 keysSortedByValueUsingComparator:&__block_literal_global_167];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v102 allKeys];
    id v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 sortedArrayUsingSelector:sel_compare_];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }

  unint64_t v85 = v40;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  id v55 = v54;
  uint64_t v56 = [v55 countByEnumeratingWithState:&v111 objects:v121 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    unsigned int v58 = 0;
    uint64_t v59 = *(void *)v112;
    do
    {
      for (uint64_t k = 0LL; k != v57; ++k)
      {
        if (*(void *)v112 != v59) {
          objc_enumerationMutation(v55);
        }
        v61 = *(void **)(*((void *)&v111 + 1) + 8 * k);
      }

      uint64_t v57 = [v55 countByEnumeratingWithState:&v111 objects:v121 count:16];
    }

    while (v57);
  }

  else
  {
    unsigned int v58 = 0;
  }

  if (v58 >= 0x3C) {
    unsigned int v62 = 60;
  }
  else {
    unsigned int v62 = v58;
  }
  unsigned int v63 = [@"TOTAL, minus reserved VM space" length];
  if (v62 <= v63) {
    uint64_t v64 = v63;
  }
  else {
    uint64_t v64 = v62;
  }
  else {
    v65 = "PAGES";
  }
  appendTextLine( v98,  v44,  v4 > 1,  v64,  (uint64_t)",  (uint64_t)"VIRTUAL",  (uint64_t)"RESIDENT",  (uint64_t)"DIRTY",  (uint64_t)"SWAPPED",  (uint64_t)"VOLATILE",  (uint64_t)"NONVOL",  (uint64_t)"EMPTY",  (uint64_t)" REGION",  (uint64_t)");
  appendTextLine( v98,  v44,  v4 > 1,  v64,  (uint64_t)"REGION TYPE",  (uint64_t)v65,  (uint64_t)v65,  (uint64_t)v65,  (uint64_t)v65,  (uint64_t)v65,  (uint64_t)v65,  (uint64_t)v65,  (uint64_t)"   COUNT (non-coalesced)",  (uint64_t)"");
  v66 = (void *)objc_opt_new();
  appendTextLine( v66,  v44,  v4 > 1,  v64,  (uint64_t)"===========",  (uint64_t)"=======",  (uint64_t)"========",  (uint64_t)"=====",  (uint64_t)"=======",  (uint64_t)"========",  (uint64_t)"======",  (uint64_t)"=====",  (uint64_t)"=======",  (uint64_t)"");
  v87 = v66;
  -[__CFString appendString:](v98, "appendString:", v66);
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  obuint64_t j = v55;
  uint64_t v100 = [obj countByEnumeratingWithState:&v107 objects:v120 count:16];
  unsigned int v96 = v64;
  if (v100)
  {
    uint64_t v93 = 0LL;
    uint64_t v95 = *(void *)v108;
    do
    {
      for (uint64_t m = 0LL; m != v100; ++m)
      {
        if (*(void *)v108 != v95) {
          objc_enumerationMutation(obj);
        }
        uint64_t v68 = [v102 objectForKeyedSubscript:*(void *)(*((void *)&v107 + 1) + 8 * m)];
        uint64_t v69 = v68;
        if ((v44 & 0x100) != 0 || ([*(id *)(v68 + 32) hasPrefix:@"MALLOC_"] & 1) == 0)
        {
          if ([*(id *)(v69 + 32) hasPrefix:off_18C689DC0[0]])
          {
            v70 = @"        not counted in TOTAL below";
          }

          else if ([*(id *)(v69 + 32) hasSuffix:VMUreservedLabelSuffix])
          {
            [NSString stringWithFormat:@"        %@", VMUreservedVMaddressSpaceString];
            v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v93 += *(void *)(v69 + 16);
          }

          else
          {
            v70 = &stru_189E010C8;
          }
        }

        else
        {
          v70 = @"        see MALLOC ZONE table below";
        }

        char v106 = v99[48];
        uint64_t v104 = [*(id *)(v69 + 32) UTF8String];
        unint64_t v103 = *(void *)(v69 + 16);
        unint64_t v71 = *(void *)(v69 + 160);
        unint64_t v72 = *(void *)(v69 + 184);
        unint64_t v73 = *(void *)(v69 + 176);
        unint64_t v74 = *(void *)(v69 + 192);
        uint64_t v64 = *(void *)(v69 + 200);
        unint64_t v75 = *(void *)(v69 + 208);
        unsigned int v76 = *(_DWORD *)(v69 + 152);
        v77 = v70;
        unsigned int v83 = v76;
        unint64_t v82 = v64;
        unint64_t v81 = v73;
        unint64_t v80 = v72;
        __int128 v35 = v98;
        unint64_t v44 = v101;
        LODWORD(v64) = v96;
        uint64_t v4 = v97;
        appendStatsLine( v98,  v101,  v97,  v106,  v96,  v104,  v103,  v71,  v80,  v81,  v74,  v82,  v75,  v83,  -[__CFString UTF8String](v77, "UTF8String"));
      }

      uint64_t v100 = [obj countByEnumeratingWithState:&v107 objects:v120 count:16];
    }

    while (v100);
  }

  else
  {
    uint64_t v93 = 0LL;
  }

  -[__CFString appendString:](v35, "appendString:", v87);
  appendStatsLine(v35, v44, v4, v99[48], v64, (uint64_t)"TOTAL", v85, v91, v90, v89, v86, v88, v84, v92, (uint64_t)"");
  if (v93) {
    appendStatsLine( v35,  v44,  v4,  v99[48],  v96,  [@"TOTAL, minus reserved VM space" UTF8String],  v85 - v93,  v91,  v90,  v89,  v86,  v88,  v84,  v92,  (uint64_t)"");
  }

  if ((v44 & 0x100) == 0)
  {
    -[__CFString appendString:](v35, "appendString:", @"\n");
    [v99 descriptionForMallocZoneTotals:v44 memorySizeDivisor:v4];
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendString:](v35, "appendString:", v78);
  }

  return v35;
}

BOOL __70__VMUVMRegionIdentifier_descriptionForRegionTotals_memorySizeDivisor___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return *(void *)(a3 + 176) + *(void *)(a3 + 184) > *(void *)(a2 + 176) + *(void *)(a2 + 184);
}

- (BOOL)recordedPhysFootprint
{
  return self->_recordedPhysFootprint;
}

- (BOOL)didPhysFootprintDirtyAccounting
{
  return self->_didPhysFootprintDirtyAccounting;
}

- (NSDictionary)ledger
{
  return self->_ledger;
}

- (void).cxx_destruct
{
}

@end