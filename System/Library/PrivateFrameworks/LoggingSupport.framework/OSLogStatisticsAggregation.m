@interface OSLogStatisticsAggregation
+ (id)_labelFromProxy:(id)a3 forTier:(unsigned __int8)a4;
+ (id)_stringForTier:(unsigned __int8)a3;
- (NSMutableDictionary)labelToChildTiers;
- (NSNumber)senderOffset;
- (NSString)formatString;
- (NSString)label;
- (NSString)tierString;
- (NSUUID)senderUUID;
- (OSLogStatisticsAggregation)initWithLabel:(id)a3 tier:(unsigned __int8)a4;
- (OSLogStatisticsAggregation)initWithOSLogProxy:(id)a3 tier:(unsigned __int8)a4;
- (id)_descendingChildren;
- (id)_descriptionTierCap:(unsigned __int8)a3 withDepth:(unint64_t)a4;
- (id)_dictRepresentation:(unsigned __int8)a3;
- (id)_tracePointSizeString;
- (id)aggregationForTier:(unsigned __int8)a3 withLabel:(id)a4;
- (id)aggregationsForTier:(unsigned __int8)a3;
- (id)descriptionWithTierCap:(unsigned __int8)a3;
- (id)jsonDescription:(unint64_t)a3;
- (id)jsonDescription:(unint64_t)a3 tierCap:(unsigned __int8)a4;
- (unint64_t)eventBytes;
- (unint64_t)eventCount;
- (unsigned)_childTier;
- (unsigned)tier;
- (void)_addToChildren:(id)a3;
- (void)_addTraceEvent:(id)a3;
- (void)setEventBytes:(unint64_t)a3;
- (void)setEventCount:(unint64_t)a3;
@end

@implementation OSLogStatisticsAggregation

- (unsigned)_childTier
{
  return self->_tier + 1;
}

- (NSString)tierString
{
  return (NSString *)[(id)objc_opt_class() _stringForTier:self->_tier];
}

- (OSLogStatisticsAggregation)initWithLabel:(id)a3 tier:(unsigned __int8)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___OSLogStatisticsAggregation;
  v8 = -[OSLogStatisticsAggregation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_label, a3);
    v9->_tier = a4;
  }

  return v9;
}

- (OSLogStatisticsAggregation)initWithOSLogProxy:(id)a3 tier:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [(id)objc_opt_class() _labelFromProxy:v6 forTier:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[OSLogStatisticsAggregation initWithLabel:tier:](self, "initWithLabel:tier:", v7, v4);
  if (!v8) {
    goto LABEL_10;
  }
  switch((_DWORD)v4)
  {
    case 3:
      [v6 processImageUUID];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v14 = v17;
      uint64_t v18 = [v17 copy];
      senderUUID = v8->_senderUUID;
      v8->_senderUUID = (NSUUID *)v18;
      goto LABEL_9;
    case 4:
      [v6 senderImageUUID];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 8:
      [v6 senderImageUUID];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 copy];
      objc_super v11 = v8->_senderUUID;
      v8->_senderUUID = (NSUUID *)v10;

      uint64_t v12 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v6, "senderImageOffset"));
      senderOffset = v8->_senderOffset;
      v8->_senderOffset = (NSNumber *)v12;

      [v6 formatString];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 copy];
      senderUUID = (NSUUID *)v8->_formatString;
      v8->_formatString = (NSString *)v15;
LABEL_9:

      break;
  }

- (void)_addToChildren:(id)a3
{
  id v12 = a3;
  uint64_t v4 = -[OSLogStatisticsAggregation _childTier](self, "_childTier");
  [(id)objc_opt_class() _labelFromProxy:v12 forTier:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogStatisticsAggregation labelToChildTiers](self, "labelToChildTiers");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    labelToChildTiers = self->_labelToChildTiers;
    self->_labelToChildTiers = v7;
  }
  v9 = -[OSLogStatisticsAggregation labelToChildTiers](self, "labelToChildTiers");
  [v9 objectForKeyedSubscript:v5];
  uint64_t v10 = (OSLogStatisticsAggregation *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    uint64_t v10 = -[OSLogStatisticsAggregation initWithOSLogProxy:tier:]( objc_alloc(&OBJC_CLASS___OSLogStatisticsAggregation),  "initWithOSLogProxy:tier:",  v12,  v4);
    -[OSLogStatisticsAggregation labelToChildTiers](self, "labelToChildTiers");
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v10 forKeyedSubscript:v5];
  }

  -[OSLogStatisticsAggregation _addTraceEvent:](v10, "_addTraceEvent:", v12);
}

- (void)_addTraceEvent:(id)a3
{
  id v4 = a3;
  if (-[OSLogStatisticsAggregation tier](self, "tier") >= 9)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

  else
  {
    -[OSLogStatisticsAggregation setEventCount:]( self,  "setEventCount:",  -[OSLogStatisticsAggregation eventCount](self, "eventCount") + 1);
    -[OSLogStatisticsAggregation setEventBytes:]( self,  "setEventBytes:",  -[OSLogStatisticsAggregation eventBytes](self, "eventBytes") + [v4 size]);
    if (-[OSLogStatisticsAggregation tier](self, "tier") != 8) {
      -[OSLogStatisticsAggregation _addToChildren:](self, "_addToChildren:", v4);
    }
  }

- (id)_descendingChildren
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allValues];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 sortedArrayUsingComparator:&__block_literal_global_1909];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dictRepresentation:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v33[4] = *MEMORY[0x1895F89C0];
  v32[0] = @"eventCount";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogStatisticsAggregation eventCount](self, "eventCount"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v6;
  v32[1] = @"eventBytes";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogStatisticsAggregation eventBytes](self, "eventBytes"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v7;
  v32[2] = @"tier";
  v8 = -[OSLogStatisticsAggregation tierString](self, "tierString");
  v33[2] = v8;
  v32[3] = @"label";
  v9 = -[OSLogStatisticsAggregation label](self, "label");
  v33[3] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:v32 count:4];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v11 = (void *)[v10 mutableCopy];

  -[OSLogStatisticsAggregation senderUUID](self, "senderUUID");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = -[OSLogStatisticsAggregation senderUUID](self, "senderUUID");
    [v13 UUIDString];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v14 forKeyedSubscript:@"senderUUID"];

    -[OSLogStatisticsAggregation senderOffset](self, "senderOffset");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v15 forKeyedSubscript:@"senderOffset"];
  }
  v16 = -[OSLogStatisticsAggregation formatString](self, "formatString");
  if (v16)
  {
    v17 = -[OSLogStatisticsAggregation formatString](self, "formatString");
    [v11 setObject:v17 forKeyedSubscript:@"formatString"];
  }

  if (-[OSLogStatisticsAggregation _childTier](self, "_childTier") <= v3)
  {
    [MEMORY[0x189603FA8] array];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[OSLogStatisticsAggregation _descendingChildren](self, "_descendingChildren");
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        uint64_t v23 = 0LL;
        do
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * v23) _dictRepresentation:v3];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24) {
            [v18 addObject:v24];
          }

          ++v23;
        }

        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v21);
    }

    v25 = (void *)[v18 copy];
    [v11 setObject:v25 forKeyedSubscript:@"childAggregations"];
  }

  v26 = (void *)[v11 copy];

  return v26;
}

- (id)jsonDescription:(unint64_t)a3 tierCap:(unsigned __int8)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v9 = 0LL;
    [MEMORY[0x1896078D8] dataWithJSONObject:v5 options:a3 error:&v9];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6) {
      id v7 = (__CFString *)[objc_alloc(NSString) initWithData:v6 encoding:4];
    }
    else {
      id v7 = &stru_189F108F0;
    }
  }

  else
  {
    id v7 = &stru_189F108F0;
  }

  return v7;
}

- (id)jsonDescription:(unint64_t)a3
{
  return -[OSLogStatisticsAggregation jsonDescription:tierCap:](self, "jsonDescription:tierCap:", a3, 8LL);
}

- (id)_tracePointSizeString
{
  return (id)objc_msgSend( MEMORY[0x189607800],  "stringFromByteCount:countStyle:",  -[OSLogStatisticsAggregation eventBytes](self, "eventBytes"),  0);
}

- (id)_descriptionTierCap:(unsigned __int8)a3 withDepth:(unint64_t)a4
{
  uint64_t v5 = a3;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v7 = &stru_189F108F0;
  if (-[OSLogStatisticsAggregation tier](self, "tier") <= a3)
  {
    [MEMORY[0x189607940] string];
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      unsigned int v8 = 1;
      do
      {
        -[__CFString appendString:](v7, "appendString:", @"  ");
        unint64_t v9 = v8++;
      }

      while (v9 < a4);
    }

    -[OSLogStatisticsAggregation label](self, "label");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogStatisticsAggregation _tracePointSizeString](self, "_tracePointSizeString");
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v12 = -[OSLogStatisticsAggregation eventCount](self, "eventCount");
    unint64_t v13 = -[OSLogStatisticsAggregation eventCount](self, "eventCount");
    v14 = @"s";
    if (v13 <= 1) {
      v14 = &stru_189F108F0;
    }
    -[__CFString appendFormat:](v7, "appendFormat:", @"%@: %@ (%llu event%@)\n", v10, v11, v12, v14);

    if (-[OSLogStatisticsAggregation _childTier](self, "_childTier") <= v5)
    {
      -[OSLogStatisticsAggregation _descendingChildren](self, "_descendingChildren");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
        unint64_t v19 = a4 + 1;
        do
        {
          uint64_t v20 = 0LL;
          do
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * v20) _descriptionTierCap:v5 withDepth:v19];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v7, "appendString:", v21);

            ++v20;
          }

          while (v17 != v20);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v17);
      }
    }
  }

  return v7;
}

- (id)descriptionWithTierCap:(unsigned __int8)a3
{
  return -[OSLogStatisticsAggregation _descriptionTierCap:withDepth:](self, "_descriptionTierCap:withDepth:", a3, 0LL);
}

- (id)aggregationsForTier:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v20[1] = *MEMORY[0x1895F89C0];
  if (-[OSLogStatisticsAggregation tier](self, "tier") == (_DWORD)v3)
  {
    v20[0] = self;
    [MEMORY[0x189603F18] arrayWithObjects:v20 count:1];
    return (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    -[OSLogStatisticsAggregation labelToChildTiers](self, "labelToChildTiers", 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 allValues];
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v12) aggregationsForTier:v3];
          unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13) {
            [v6 addObjectsFromArray:v13];
          }

          ++v12;
        }

        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }

    v14 = (void *)[v6 copy];
    return v14;
  }

- (id)aggregationForTier:(unsigned __int8)a3 withLabel:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  -[OSLogStatisticsAggregation aggregationsForTier:](self, "aggregationsForTier:", v4);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        objc_msgSend(v11, "label", (void)v15);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        char v13 = [v12 isEqualToString:v6];

        if ((v13 & 1) != 0)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }

      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (NSMutableDictionary)labelToChildTiers
{
  return self->_labelToChildTiers;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(unint64_t)a3
{
  self->_eventCount = a3;
}

- (unint64_t)eventBytes
{
  return self->_eventBytes;
}

- (void)setEventBytes:(unint64_t)a3
{
  self->_eventBytes = a3;
}

- (unsigned)tier
{
  return self->_tier;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSString)label
{
  return self->_label;
}

- (NSUUID)senderUUID
{
  return self->_senderUUID;
}

- (NSNumber)senderOffset
{
  return self->_senderOffset;
}

- (void).cxx_destruct
{
}

uint64_t __49__OSLogStatisticsAggregation__descendingChildren__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 eventBytes];
  if (v6 <= [v5 eventBytes])
  {
    uint64_t v8 = [v4 eventBytes];
    uint64_t v7 = v8 != [v5 eventBytes];
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  return v7;
}

+ (id)_stringForTier:(unsigned __int8)a3
{
  if (a3 > 8u) {
    return @"Unexpected";
  }
  else {
    return (id)*((void *)&off_189F0F578 + a3);
  }
}

+ (id)_labelFromProxy:(id)a3 forTier:(unsigned __int8)a4
{
  int v4 = a4;
  id v5 = a3;
  unint64_t v6 = v5;
  uint64_t v7 = 0LL;
  switch(v4)
  {
    case 0:
      goto LABEL_14;
    case 1:
      uint64_t v7 = @"All";
      goto LABEL_14;
    case 2:
      if ([v5 type] == 1536)
      {
        uint64_t v7 = @"os_signpost";
      }

      else if ([v6 type] == 1024)
      {
        uint64_t v7 = @"os_log";
      }

      else
      {
        uint64_t v7 = @"Unexpected";
      }

      goto LABEL_14;
    case 3:
      uint64_t v8 = [v5 process];
      goto LABEL_10;
    case 4:
      uint64_t v8 = [v5 sender];
      goto LABEL_10;
    case 5:
      uint64_t v8 = [v5 subsystem];
      goto LABEL_10;
    case 6:
      uint64_t v8 = [v5 category];
LABEL_10:
      uint64_t v9 = (void *)v8;
      uint64_t v10 = @"Unknown";
      if (v8) {
        uint64_t v10 = (__CFString *)v8;
      }
      uint64_t v7 = v10;
      goto LABEL_13;
    case 7:
      if ([v5 type] == 1536)
      {
        unint64_t v12 = [v6 signpostType];
        if (v12 <= 2)
        {
          uint64_t v7 = (__CFString *)*((void *)&off_189F0F5C0 + v12);
          goto LABEL_14;
        }

        goto LABEL_33;
      }

      if ([v6 type] != 1024)
      {
LABEL_33:
        uint64_t v7 = @"Unexpected";
        goto LABEL_14;
      }

      uint64_t v18 = [v6 logType];
      if (v18 <= 1)
      {
        if (v18)
        {
          if (v18 == 1)
          {
            uint64_t v7 = @"Info";
            goto LABEL_14;
          }

          goto LABEL_33;
        }

        uint64_t v7 = @"Default";
      }

      else
      {
        switch(v18)
        {
          case 2LL:
            uint64_t v7 = @"Debug";
            break;
          case 16LL:
            uint64_t v7 = @"Error";
            break;
          case 17LL:
            uint64_t v7 = @"Fault";
            break;
          default:
            goto LABEL_33;
        }
      }

@end