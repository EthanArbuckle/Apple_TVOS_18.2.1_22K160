@interface SECSFARules
+ (Class)eventFilterType;
+ (Class)eventRulesType;
- (BOOL)hasAllowedBuilds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)eventFilters;
- (NSMutableArray)eventRules;
- (SECSFAVersionMatch)allowedBuilds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventFilterAtIndex:(unint64_t)a3;
- (id)eventRulesAtIndex:(unint64_t)a3;
- (unint64_t)eventFiltersCount;
- (unint64_t)eventRulesCount;
- (unint64_t)hash;
- (void)addEventFilter:(id)a3;
- (void)addEventRules:(id)a3;
- (void)clearEventFilters;
- (void)clearEventRules;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowedBuilds:(id)a3;
- (void)setEventFilters:(id)a3;
- (void)setEventRules:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFARules

- (void)clearEventRules
{
}

- (void)addEventRules:(id)a3
{
  id v4 = a3;
  eventRules = self->_eventRules;
  id v8 = v4;
  if (!eventRules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_eventRules;
    self->_eventRules = v6;

    id v4 = v8;
    eventRules = self->_eventRules;
  }

  -[NSMutableArray addObject:](eventRules, "addObject:", v4);
}

- (unint64_t)eventRulesCount
{
  return -[NSMutableArray count](self->_eventRules, "count");
}

- (id)eventRulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_eventRules, "objectAtIndex:", a3);
}

- (BOOL)hasAllowedBuilds
{
  return self->_allowedBuilds != 0LL;
}

- (void)clearEventFilters
{
}

- (void)addEventFilter:(id)a3
{
  id v4 = a3;
  eventFilters = self->_eventFilters;
  id v8 = v4;
  if (!eventFilters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_eventFilters;
    self->_eventFilters = v6;

    id v4 = v8;
    eventFilters = self->_eventFilters;
  }

  -[NSMutableArray addObject:](eventFilters, "addObject:", v4);
}

- (unint64_t)eventFiltersCount
{
  return -[NSMutableArray count](self->_eventFilters, "count");
}

- (id)eventFilterAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_eventFilters, "objectAtIndex:", a3);
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFARules;
  -[SECSFARules description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SECSFARules dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_eventRules, "count"))
  {
    id v4 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_eventRules, "count"));
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    v5 = self->_eventRules;
    uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v10];
        }

        uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"eventRules"];
  }

  allowedBuilds = self->_allowedBuilds;
  if (allowedBuilds)
  {
    v12 = -[SECSFAVersionMatch dictionaryRepresentation](allowedBuilds, "dictionaryRepresentation");
    [v3 setObject:v12 forKey:@"allowedBuilds"];
  }

  if (-[NSMutableArray count](self->_eventFilters, "count"))
  {
    v13 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_eventFilters, "count"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v14 = self->_eventFilters;
    uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0LL; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addObject:v19];
        }

        uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
      }

      while (v16);
    }

    [v3 setObject:v13 forKey:@"eventFilter"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x189611CF0];
  v5 = (int *)MEMORY[0x189611CE8];
  uint64_t v6 = (int *)MEMORY[0x189611CE0];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x189611CF0]) < *(void *)((char *)a3 + (int)*MEMORY[0x189611CE8]))
  {
    uint64_t v8 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6)) {
        return *((_BYTE *)a3 + *v6) == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0LL;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        char v14 = *(_BYTE *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0LL;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }

      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6)) {
        unint64_t v11 = 0LL;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        return *((_BYTE *)a3 + *v6) == 0;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 4)
      {
        v19 = objc_alloc_init(&OBJC_CLASS___SECSFAEventFilter);
        -[SECSFARules addEventFilter:](self, "addEventFilter:", v19);
        if (!PBReaderPlaceMark() || (SECSFAEventFilterReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
        {
LABEL_34:

          return 0;
        }

        goto LABEL_29;
      }

      if ((_DWORD)v18 == 3) {
        break;
      }
      if ((_DWORD)v18 == 2)
      {
        v19 = objc_alloc_init(&OBJC_CLASS___SECSFAEventRule);
        -[SECSFARules addEventRules:](self, "addEventRules:", v19);
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
    }

    v19 = objc_alloc_init(&OBJC_CLASS___SECSFAVersionMatch);
    objc_storeStrong((id *)&self->_allowedBuilds, v19);
    goto LABEL_29;
  }

  return *((_BYTE *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v5 = self->_eventRules;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    }

    while (v7);
  }

  if (self->_allowedBuilds) {
    PBDataWriterWriteSubmessage();
  }
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  unsigned int v10 = self->_eventFilters;
  uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
    }

    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (-[SECSFARules eventRulesCount](self, "eventRulesCount"))
  {
    [v12 clearEventRules];
    unint64_t v4 = -[SECSFARules eventRulesCount](self, "eventRulesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        -[SECSFARules eventRulesAtIndex:](self, "eventRulesAtIndex:", i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 addEventRules:v7];
      }
    }
  }

  if (self->_allowedBuilds) {
    objc_msgSend(v12, "setAllowedBuilds:");
  }
  if (-[SECSFARules eventFiltersCount](self, "eventFiltersCount"))
  {
    [v12 clearEventFilters];
    unint64_t v8 = -[SECSFARules eventFiltersCount](self, "eventFiltersCount");
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0LL; j != v9; ++j)
      {
        -[SECSFARules eventFilterAtIndex:](self, "eventFilterAtIndex:", j);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 addEventFilter:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  unint64_t v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v6 = self->_eventRules;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addEventRules:v11];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v8);
  }

  id v12 = -[SECSFAVersionMatch copyWithZone:](self->_allowedBuilds, "copyWithZone:", a3);
  uint64_t v13 = (void *)v5[1];
  v5[1] = v12;

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v14 = self->_eventFilters;
  uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        __int128 v19 = (void *)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addEventFilter:v19];

        ++v18;
      }

      while (v16 != v18);
      uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    }

    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((eventRules = self->_eventRules, !((unint64_t)eventRules | v4[3]))
     || -[NSMutableArray isEqual:](eventRules, "isEqual:"))
    && ((allowedBuilds = self->_allowedBuilds, !((unint64_t)allowedBuilds | v4[1]))
     || -[SECSFAVersionMatch isEqual:](allowedBuilds, "isEqual:")))
  {
    eventFilters = self->_eventFilters;
    else {
      char v8 = 1;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSMutableArray hash](self->_eventRules, "hash");
  unint64_t v4 = -[SECSFAVersionMatch hash](self->_allowedBuilds, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_eventFilters, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  unint64_t v4 = (id *)a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SECSFARules addEventRules:](self, "addEventRules:", *(void *)(*((void *)&v21 + 1) + 8 * i));
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v7);
  }

  allowedBuilds = self->_allowedBuilds;
  id v11 = v4[1];
  if (allowedBuilds)
  {
    if (v11) {
      -[SECSFAVersionMatch mergeFrom:](allowedBuilds, "mergeFrom:");
    }
  }

  else if (v11)
  {
    -[SECSFARules setAllowedBuilds:](self, "setAllowedBuilds:");
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v12 = v4[2];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0LL; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SECSFARules addEventFilter:](self, "addEventFilter:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v14);
  }
}

- (NSMutableArray)eventRules
{
  return self->_eventRules;
}

- (void)setEventRules:(id)a3
{
}

- (SECSFAVersionMatch)allowedBuilds
{
  return self->_allowedBuilds;
}

- (void)setAllowedBuilds:(id)a3
{
}

- (NSMutableArray)eventFilters
{
  return self->_eventFilters;
}

- (void)setEventFilters:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)eventRulesType
{
  return (Class)objc_opt_class();
}

+ (Class)eventFilterType
{
  return (Class)objc_opt_class();
}

@end