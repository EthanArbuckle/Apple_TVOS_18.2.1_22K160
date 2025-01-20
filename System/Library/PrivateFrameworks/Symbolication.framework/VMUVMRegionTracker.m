@interface VMUVMRegionTracker
+ (BOOL)supportsSecureCoding;
- (VMUVMRegionTracker)init;
- (VMUVMRegionTracker)initWithCoder:(id)a3;
- (VMUVMRegionTracker)initWithStackLogReader:(id)a3;
- (id)vmRegionRangeInfoForRange:(_VMURange)a3;
- (int64_t)regionCount;
- (unint64_t)_regionIndexForAddress:(unint64_t)a3;
- (unint64_t)handleStackLogType:(unsigned int)a3 address:(unint64_t)a4 size:(unint64_t)a5 stackID:(unint64_t)a6;
- (void)convertStackIDs:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VMUVMRegionTracker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUVMRegionTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VMUVMRegionTracker;
  v2 = -[VMUVMRegionTracker init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    regionInfoArray = v2->_regionInfoArray;
    v2->_regionInfoArray = v3;
  }

  return v2;
}

- (VMUVMRegionTracker)initWithStackLogReader:(id)a3
{
  id v4 = a3;
  v5 = -[VMUVMRegionTracker init](self, "init");
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_stackLogReader, v4);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __45__VMUVMRegionTracker_initWithStackLogReader___block_invoke;
    v9[3] = &unk_189DFDAB8;
    v10 = v6;
    [v4 enumerateMSLRecordsAndPayloads:v9];
  }

  return v6;
}

uint64_t __45__VMUVMRegionTracker_initWithStackLogReader___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) handleStackLogType:a2 address:a3 size:a4 stackID:msl_payload_get_uniquing_table_index()];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"classVersion"];

  objc_super v6 = (void *)objc_opt_new();
  [v6 serialize32:[self regionCount]];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = self->_regionInfoArray;
  uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v6 serialize64:[v12 address]];
        [v6 serialize64:[v12 size]];
        [v6 serialize32:[v12 stackIdentifier]];
        [v6 serialize32:[v12 userTag]];
      }

      uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v9);
  }

  v13 = (void *)[v6 copyContiguousData];
  [v4 encodeObject:v13 forKey:@"simpleSerializerData"];
}

- (VMUVMRegionTracker)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___VMUVMRegionTracker;
  v5 = -[VMUVMRegionTracker init](&v26, sel_init);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classVersion"];
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = [v6 unsignedIntValue];

    if (v7 != 1)
    {
LABEL_14:
      uint64_t v19 = 0LL;
      goto LABEL_15;
    }

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simpleSerializerData"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[VMUSimpleDeserializer initWithData:](objc_alloc(&OBJC_CLASS___VMUSimpleDeserializer), "initWithData:", v8);
    id v25 = 0LL;
    unsigned int v10 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v25);
    id v11 = v25;
    if (v11)
    {
LABEL_13:

      goto LABEL_14;
    }

    uint64_t v12 = [MEMORY[0x189603FA8] arrayWithCapacity:v10];
    regionInfoArray = v5->_regionInfoArray;
    v5->_regionInfoArray = (NSMutableArray *)v12;

    if (v10)
    {
      while (1)
      {
        __int128 v14 = (void *)objc_opt_new();
        id v24 = 0LL;
        uint64_t v15 = -[VMUSimpleDeserializer deserialize64WithError:](v9, "deserialize64WithError:", &v24);
        id v11 = v24;
        [v14 setAddress:v15];
        if (v11) {
          break;
        }
        id v23 = 0LL;
        uint64_t v16 = -[VMUSimpleDeserializer deserialize64WithError:](v9, "deserialize64WithError:", &v23);
        id v11 = v23;
        [v14 setSize:v16];
        if (v11) {
          break;
        }
        id v22 = 0LL;
        unsigned int v17 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v22);
        id v11 = v22;
        [v14 setStackIdentifier:v17];
        if (v11) {
          break;
        }
        id v21 = 0LL;
        uint64_t v18 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v21);
        id v11 = v21;
        [v14 setUserTag:v18];
        if (v11) {
          break;
        }
        -[NSMutableArray addObject:](v5->_regionInfoArray, "addObject:", v14);

        if (!--v10) {
          goto LABEL_10;
        }
      }

      goto LABEL_13;
    }

- (int64_t)regionCount
{
  return -[NSMutableArray count](self->_regionInfoArray, "count");
}

- (unint64_t)_regionIndexForAddress:(unint64_t)a3
{
  uint64_t v5 = -[NSMutableArray count](self->_regionInfoArray, "count");
  if (!v5) {
    return 0LL;
  }
  unint64_t v6 = v5;
  unint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  while (1)
  {
    uint64_t v9 = v8;
    unint64_t v10 = v7 + (v6 >> 1);
    -[NSMutableArray objectAtIndexedSubscript:](self->_regionInfoArray, "objectAtIndexedSubscript:", v10);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    unint64_t v11 = [v8 range];
    if (a3 - v11 < v12) {
      break;
    }
    if (a3 >= v11) {
      v6 += ~(v6 >> 1);
    }
    else {
      v6 >>= 1;
    }
    if (a3 >= v11) {
      unint64_t v7 = v10 + 1;
    }
    if (!v6) {
      goto LABEL_13;
    }
  }

  v7 += v6 >> 1;
LABEL_13:

  return v7;
}

- (unint64_t)handleStackLogType:(unsigned int)a3 address:(unint64_t)a4 size:(unint64_t)a5 stackID:(unint64_t)a6
{
  if ((a3 & 0x30) == 0) {
    return 0LL;
  }
  unint64_t v7 = a5;
  if (a5 % *MEMORY[0x1895FD590]) {
    unint64_t v7 = ~*MEMORY[0x1895FD578] & (*MEMORY[0x1895FD578] + a5);
  }
  unint64_t v11 = -[VMUVMRegionTracker _regionIndexForAddress:](self, "_regionIndexForAddress:", a4);
  if (v11 >= -[NSMutableArray count](self->_regionInfoArray, "count"))
  {
    __int128 v14 = 0LL;
    unint64_t v12 = 0LL;
  }

  else
  {
    unint64_t v12 = 0LL;
    unint64_t v13 = v7 + a4;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_regionInfoArray, "objectAtIndex:", v11);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v15 = [v14 range];
      BOOL v17 = VMURangeContainsRange(a4, v7, v15, v16);
      unint64_t v18 = [v14 range];
      if (!v17) {
        break;
      }
      v12 -= v19;

      -[NSMutableArray removeObjectAtIndex:](self->_regionInfoArray, "removeObjectAtIndex:", v11);
      if (v11 >= -[NSMutableArray count](self->_regionInfoArray, "count"))
      {
        __int128 v14 = 0LL;
        goto LABEL_11;
      }
    }

    if (VMURangeIntersectsRange(a4, v7, v18, v19))
    {
      unint64_t v22 = [v14 range] - a4;
      uint64_t v23 = [v14 range];
      if (v22 >= v7)
      {
        if (v24 + ~a4 + v23 >= v7)
        {
          v28 = objc_alloc_init(&OBJC_CLASS___VMUVMRegionRangeInfo);
          -[VMUVMRegionRangeInfo setAddress:](v28, "setAddress:", v7 + a4);
          uint64_t v29 = [v14 range];
          -[VMUVMRegionRangeInfo setSize:](v28, "setSize:", v30 - v13 + v29);
          -[VMUVMRegionRangeInfo setStackIdentifier:](v28, "setStackIdentifier:", [v14 stackIdentifier]);
          -[VMUVMRegionRangeInfo setUserTag:](v28, "setUserTag:", [v14 userTag]);
          -[NSMutableArray insertObject:atIndex:](self->_regionInfoArray, "insertObject:atIndex:", v28, ++v11);
          [v14 setSize:[v14 range] - a4 + [v14 size]];

          unint64_t v25 = v7;
        }

        else
        {
          uint64_t v26 = [v14 range];
          unint64_t v25 = v27 - a4 + v26;
          [v14 setSize:[v14 size] - v25];
          ++v11;
        }
      }

      else
      {
        unint64_t v25 = v13 - v23;
        [v14 setAddress:v25 + [v14 address]];
        [v14 setSize:[v14 size] - v25];
      }

      v12 -= v25;
    }
  }

- (void)convertStackIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = (uint64_t (**)(id, uint64_t))a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = self->_regionInfoArray;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * v9),  "setStackIdentifier:",  v4[2](v4, objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "stackIdentifier", (void)v10)));
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (id)vmRegionRangeInfoForRange:(_VMURange)a3
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  unint64_t v6 = -[VMUVMRegionTracker _regionIndexForAddress:](self, "_regionIndexForAddress:");
  if (v6 >= -[NSMutableArray count](self->_regionInfoArray, "count"))
  {
    id v12 = 0LL;
  }

  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_regionInfoArray, "objectAtIndexedSubscript:", v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = [v7 range];
    if (VMURangeContainsRange(v8, v9, location, length)
      || (unint64_t v10 = [v7 range], VMURangeIntersectsRange(v10, v11, location, length)))
    {
      id v12 = v7;
    }

    else
    {
      id v12 = 0LL;
    }
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end