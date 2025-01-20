@interface VMUMallocZoneAggregate
- (VMUMallocZoneAggregate)initWithZoneName:(id)a3 options:(id)a4;
- (id)_classDisplayName:(id)a3;
- (id)classInfosSortedByName;
- (id)classInfosSortedBySizeOrCount:(unsigned int)a3;
- (id)classInfosSortedByTotalInternalFragmentation;
- (unint64_t)allocatedSize;
- (unint64_t)virtualSize;
- (unsigned)blockCount;
- (void)dealloc;
- (void)enumerateAllocationSizesWithBlock:(id)a3;
- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4;
- (void)incrementAllocationCountForClassInfo:(id)a3 size:(unint64_t)a4;
- (void)incrementVirtualSize:(int64_t)a3;
- (void)modifySize:(int64_t)a3 count:(int64_t)a4 forClassInfo:(id)a5;
@end

@implementation VMUMallocZoneAggregate

- (VMUMallocZoneAggregate)initWithZoneName:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___VMUMallocZoneAggregate;
  v9 = -[VMUMallocZoneAggregate init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heapAndVMOptions, a4);
    objc_storeStrong((id *)&v10->_zoneName, a3);
    uint64_t v11 = objc_opt_new();
    quantaCounter = v10->_quantaCounter;
    v10->_quantaCounter = (NSCountedSet *)v11;

    uint64_t v13 = [MEMORY[0x189607920] mapTableWithKeyOptions:0 valueOptions:259];
    classInfoToClassCountDataMap = v10->_classInfoToClassCountDataMap;
    v10->_classInfoToClassCountDataMap = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x189607920] mapTableWithKeyOptions:0 valueOptions:259];
    binaryNameToBinaryCountDataMap = v10->_binaryNameToBinaryCountDataMap;
    v10->_binaryNameToBinaryCountDataMap = (NSMapTable *)v15;
  }

  return v10;
}

- (void)dealloc
{
  value = 0LL;
  while (NSNextMapEnumeratorPair(&enumerator, 0LL, &value))
  {
    v3 = (void *)*((void *)value + 4);
    if (v3)
    {
      free(v3);
      *((void *)value + 4) = 0LL;
    }
  }

  NSEndMapTableEnumeration(&enumerator);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VMUMallocZoneAggregate;
  -[VMUMallocZoneAggregate dealloc](&v4, sel_dealloc);
}

- (void)incrementVirtualSize:(int64_t)a3
{
  self->_virtualSize += a3;
}

- (void)incrementAllocationCountForClassInfo:(id)a3 size:(unint64_t)a4
{
  self->_allocatedSize += a4;
  ++self->_blockCount;
  quantaCounter = self->_quantaCounter;
  id v7 = (void *)MEMORY[0x189607968];
  id v9 = a3;
  [v7 numberWithUnsignedLongLong:a4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](quantaCounter, "addObject:", v8);

  -[VMUMallocZoneAggregate modifySize:count:forClassInfo:](self, "modifySize:count:forClassInfo:", a4, 1LL, v9);
}

- (void)modifySize:(int64_t)a3 count:(int64_t)a4 forClassInfo:(id)a5
{
  id key = a5;
  id v8 = (void *)MEMORY[0x186E32E40]();
  if (a3 >= 0) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = -a3;
  }
  v10 = NSMapGet(self->_classInfoToClassCountDataMap, key);
  if (!v10)
  {
    v10 = malloc(0x30uLL);
    void *v10 = 0LL;
    v10[1] = 0LL;
    *((_DWORD *)v10 + 10) = [key ivarGapForClassHierarchy];
    v10[3] = 0LL;
    v10[4] = 0LL;
    v10[2] = 0LL;
    NSMapInsert(self->_classInfoToClassCountDataMap, key, v10);
  }

  [key binaryName];
  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v11, "length"))
  {

    uint64_t v11 = @"non-object";
  }

  v12 = NSMapGet(self->_binaryNameToBinaryCountDataMap, v11);
  if (!v12)
  {
    v12 = malloc(0x18uLL);
    void *v12 = 0LL;
    v12[1] = 0LL;
    NSMapInsert(self->_binaryNameToBinaryCountDataMap, v11, v12);
  }

  BOOL v13 = -[VMUHeapAndVMAggregatorOptions showSizes](self->_heapAndVMOptions, "showSizes");
  unint64_t v14 = *v10;
  if (v13 && v14)
  {
    uint64_t v15 = v10[3];
    if (!v15)
    {
      unint64_t v16 = v10[1] / v14;
      if (v16 == v9)
      {
        uint64_t v15 = 0LL;
      }

      else
      {
        v17 = malloc(0x40uLL);
        v10[4] = v17;
        *((_OWORD *)v10 + 1) = xmmword_18616BD80;
        void *v17 = v16;
        v17[1] = v14;
        uint64_t v15 = 4LL;
      }
    }

    unint64_t v18 = v10[2];
    if (v18)
    {
      unint64_t v19 = 0LL;
      v20 = (void *)v10[4];
      unsigned int v21 = 1;
      while (v18 != v19)
      {
        unint64_t v22 = v20[2 * v19];
        if (v9 < v22) {
          goto LABEL_24;
        }
        if (v9 == v22)
        {
          v20[2 * v19 + 1] += a4;
          goto LABEL_30;
        }

        unint64_t v19 = v21;
        if (v18 < v21++) {
          goto LABEL_30;
        }
      }

      unint64_t v19 = v10[2];
LABEL_24:
      if (v18 == v15)
      {
        v10[3] = 4 * v15;
        v20 = realloc(v20, v15 << 6);
        v10[4] = v20;
        unint64_t v18 = v10[2];
      }

      if (v18 > v19)
      {
        memmove(&v20[2 * v21], &v20[2 * v19], 16 * (v18 - v19));
        v20 = (void *)v10[4];
        unint64_t v18 = v10[2];
      }

      v24 = &v20[2 * v19];
      unint64_t *v24 = v9;
      v24[1] = a4;
      v10[2] = v18 + 1;
      unint64_t v14 = *v10;
    }
  }

- (id)_classDisplayName:(id)a3
{
  heapAndVMOptions = self->_heapAndVMOptions;
  id v4 = a3;
  if (-[VMUHeapAndVMAggregatorOptions showRawClassNames](heapAndVMOptions, "showRawClassNames")) {
    [v4 className];
  }
  else {
    [v4 displayName];
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)classInfosSortedBySizeOrCount:(unsigned int)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __56__VMUMallocZoneAggregate_classInfosSortedBySizeOrCount___block_invoke;
  v8[3] = &unk_189DFFF88;
  v8[4] = self;
  unsigned int v9 = a3;
  [v5 sortedArrayUsingComparator:v8];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__VMUMallocZoneAggregate_classInfosSortedBySizeOrCount___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 56LL);
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)[v5 objectForKey:v7];
  unsigned int v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v6];
  uint64_t v10 = v8[1];
  uint64_t v11 = *v8 - *v9;
  uint64_t v12 = v10 - v9[1];
  int v13 = *(_DWORD *)(a1 + 40);
  [*(id *)(a1 + 32) _classDisplayName:v7];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) _classDisplayName:v6];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = _compareSizeCount(v13, v11, v12, v14, v15);
  return v16;
}

- (id)classInfosSortedByName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __48__VMUMallocZoneAggregate_classInfosSortedByName__block_invoke;
  v6[3] = &unk_189DFFFB0;
  v6[4] = self;
  [v3 sortedArrayUsingComparator:v6];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __48__VMUMallocZoneAggregate_classInfosSortedByName__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 _classDisplayName:a2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _classDisplayName:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (id)classInfosSortedByTotalInternalFragmentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __70__VMUMallocZoneAggregate_classInfosSortedByTotalInternalFragmentation__block_invoke;
  v6[3] = &unk_189DFFFB0;
  v6[4] = self;
  [v3 sortedArrayUsingComparator:v6];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __70__VMUMallocZoneAggregate_classInfosSortedByTotalInternalFragmentation__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v5];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v6];
  uint64_t v9 = *(void *)v8 * *(unsigned int *)(v8 + 40) - *(void *)v7 * *(unsigned int *)(v7 + 40);
  if (v9 <= 0)
  {
    if (v9 < 0)
    {
      uint64_t v10 = -1LL;
    }

    else
    {
      [*(id *)(a1 + 32) _classDisplayName:v5];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) _classDisplayName:v6];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v11 compare:v12];
    }
  }

  else
  {
    uint64_t v10 = 1LL;
  }

  return v10;
}

- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  if (v4 < 2)
  {
    -[VMUMallocZoneAggregate classInfosSortedBySizeOrCount:](self, "classInfosSortedBySizeOrCount:", v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if ((_DWORD)v4 == 2)
  {
    -[VMUMallocZoneAggregate classInfosSortedByName](self, "classInfosSortedByName");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if ((_DWORD)v4 != 3) {
      -[VMUMallocZoneAggregate enumerateHeapAndVMSortedBy:withBlock:].cold.1();
    }
    -[VMUMallocZoneAggregate classInfosSortedByTotalInternalFragmentation]( self,  "classInfosSortedByTotalInternalFragmentation");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v14 = -[NSMapTable objectForKey:](self->_classInfoToClassCountDataMap, "objectForKey:", v13, (void)v18);
        if (-[VMUHeapAndVMAggregatorOptions showSizes](self->_heapAndVMOptions, "showSizes") && v14[2])
        {
          uint64_t v15 = 0LL;
          unsigned int v16 = 1;
          do
          {
            (*((void (**)(id, uint64_t, void, void))v6 + 2))( v6,  v13,  *(void *)(v14[4] + 16 * v15 + 8),  *(void *)(v14[4] + 16 * v15) * *(void *)(v14[4] + 16 * v15 + 8));
            uint64_t v15 = v16;
          }

          while (v14[2] > (unint64_t)v16++);
        }

        else
        {
          (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, v13, *v14, v14[1]);
        }
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }
}

- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  NSAllMapTableKeys(self->_binaryNameToBinaryCountDataMap);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __69__VMUMallocZoneAggregate_enumerateBinaryCountDataSortedBy_withBlock___block_invoke;
  v19[3] = &unk_189DFFFD8;
  v19[4] = self;
  unsigned int v20 = a3;
  [v7 sortedArrayUsingComparator:v19];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v14 = -[NSMapTable objectForKey:](self->_binaryNameToBinaryCountDataMap, "objectForKey:", v13);
        (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, v13, *v14, v14[1]);
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v10);
  }
}

uint64_t __69__VMUMallocZoneAggregate_enumerateBinaryCountDataSortedBy_withBlock___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 64LL);
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)[v5 objectForKey:v7];
  uint64_t v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) objectForKey:v6];
  uint64_t v10 = _compareSizeCount(*(_DWORD *)(a1 + 40), *v8 - *v9, v8[1] - v9[1], v7, v6);

  return v10;
}

- (void)enumerateAllocationSizesWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, uint64_t, NSUInteger))a3;
  -[NSCountedSet allObjects](self->_quantaCounter, "allObjects");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 sortedArrayUsingComparator:&__block_literal_global_18];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2]( v4,  [*(id *)(*((void *)&v12 + 1) + 8 * v11) unsignedLongLongValue],  -[NSCountedSet countForObject:]( self->_quantaCounter,  "countForObject:",  *(void *)(*((void *)&v12 + 1) + 8 * v11)));
        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

uint64_t __60__VMUMallocZoneAggregate_enumerateAllocationSizesWithBlock___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 unsignedLongLongValue];
  uint64_t v6 = [v4 unsignedLongLongValue];

  if (v5 - v6 >= 1) {
    return 1LL;
  }
  else {
    return (v5 - v6) >> 63;
  }
}

- (unint64_t)virtualSize
{
  return self->_virtualSize;
}

- (unint64_t)allocatedSize
{
  return self->_allocatedSize;
}

- (unsigned)blockCount
{
  return self->_blockCount;
}

- (void).cxx_destruct
{
}

- (void)enumerateHeapAndVMSortedBy:withBlock:.cold.1()
{
}

@end