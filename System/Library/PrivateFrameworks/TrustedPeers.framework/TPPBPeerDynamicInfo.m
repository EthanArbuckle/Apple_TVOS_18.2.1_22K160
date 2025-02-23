@interface TPPBPeerDynamicInfo
+ (Class)dispositionsType;
+ (Class)excludedType;
+ (Class)includedType;
+ (Class)preapprovalsType;
- (BOOL)hasClock;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)dispositions;
- (NSMutableArray)excludeds;
- (NSMutableArray)includeds;
- (NSMutableArray)preapprovals;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dispositionsAtIndex:(unint64_t)a3;
- (id)excludedAtIndex:(unint64_t)a3;
- (id)includedAtIndex:(unint64_t)a3;
- (id)preapprovalsAtIndex:(unint64_t)a3;
- (unint64_t)clock;
- (unint64_t)dispositionsCount;
- (unint64_t)excludedsCount;
- (unint64_t)hash;
- (unint64_t)includedsCount;
- (unint64_t)preapprovalsCount;
- (void)addDispositions:(id)a3;
- (void)addExcluded:(id)a3;
- (void)addIncluded:(id)a3;
- (void)addPreapprovals:(id)a3;
- (void)clearDispositions;
- (void)clearExcludeds;
- (void)clearIncludeds;
- (void)clearPreapprovals;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClock:(unint64_t)a3;
- (void)setDispositions:(id)a3;
- (void)setExcludeds:(id)a3;
- (void)setHasClock:(BOOL)a3;
- (void)setIncludeds:(id)a3;
- (void)setPreapprovals:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPeerDynamicInfo

- (void)setClock:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clock = a3;
}

- (void)setHasClock:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClock
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearIncludeds
{
}

- (void)addIncluded:(id)a3
{
  id v4 = a3;
  includeds = self->_includeds;
  id v8 = v4;
  if (!includeds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_includeds;
    self->_includeds = v6;

    id v4 = v8;
    includeds = self->_includeds;
  }

  -[NSMutableArray addObject:](includeds, "addObject:", v4);
}

- (unint64_t)includedsCount
{
  return -[NSMutableArray count](self->_includeds, "count");
}

- (id)includedAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_includeds, "objectAtIndex:", a3);
}

- (void)clearExcludeds
{
}

- (void)addExcluded:(id)a3
{
  id v4 = a3;
  excludeds = self->_excludeds;
  id v8 = v4;
  if (!excludeds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_excludeds;
    self->_excludeds = v6;

    id v4 = v8;
    excludeds = self->_excludeds;
  }

  -[NSMutableArray addObject:](excludeds, "addObject:", v4);
}

- (unint64_t)excludedsCount
{
  return -[NSMutableArray count](self->_excludeds, "count");
}

- (id)excludedAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_excludeds, "objectAtIndex:", a3);
}

- (void)clearDispositions
{
}

- (void)addDispositions:(id)a3
{
  id v4 = a3;
  dispositions = self->_dispositions;
  id v8 = v4;
  if (!dispositions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_dispositions;
    self->_dispositions = v6;

    id v4 = v8;
    dispositions = self->_dispositions;
  }

  -[NSMutableArray addObject:](dispositions, "addObject:", v4);
}

- (unint64_t)dispositionsCount
{
  return -[NSMutableArray count](self->_dispositions, "count");
}

- (id)dispositionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dispositions, "objectAtIndex:", a3);
}

- (void)clearPreapprovals
{
}

- (void)addPreapprovals:(id)a3
{
  id v4 = a3;
  preapprovals = self->_preapprovals;
  id v8 = v4;
  if (!preapprovals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_preapprovals;
    self->_preapprovals = v6;

    id v4 = v8;
    preapprovals = self->_preapprovals;
  }

  -[NSMutableArray addObject:](preapprovals, "addObject:", v4);
}

- (unint64_t)preapprovalsCount
{
  return -[NSMutableArray count](self->_preapprovals, "count");
}

- (id)preapprovalsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_preapprovals, "objectAtIndex:", a3);
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPeerDynamicInfo;
  -[TPPBPeerDynamicInfo description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBPeerDynamicInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_clock];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v4 forKey:@"clock"];
  }

  includeds = self->_includeds;
  if (includeds) {
    [v3 setObject:includeds forKey:@"included"];
  }
  excludeds = self->_excludeds;
  if (excludeds) {
    [v3 setObject:excludeds forKey:@"excluded"];
  }
  if (-[NSMutableArray count](self->_dispositions, "count"))
  {
    v7 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_dispositions, "count"));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    objc_super v8 = self->_dispositions;
    uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 addObject:v13];
        }

        uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v10);
    }

    [v3 setObject:v7 forKey:@"dispositions"];
  }

  preapprovals = self->_preapprovals;
  if (preapprovals) {
    [v3 setObject:preapprovals forKey:@"preapprovals"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerDynamicInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field();
  }
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v5 = self->_includeds;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v37,  v44,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v37,  v44,  16LL);
    }

    while (v7);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v10 = self->_excludeds;
  uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
    }

    while (v12);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  v15 = self->_dispositions;
  uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v42,  16LL);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }

      while (v17 != v19);
      uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v42,  16LL);
    }

    while (v17);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v20 = self->_preapprovals;
  uint64_t v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v25,  v41,  16LL);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0LL;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }

      while (v22 != v24);
      uint64_t v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v25,  v41,  16LL);
    }

    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_clock;
    *((_BYTE *)v4 + 48) |= 1u;
  }

  id v21 = v4;
  if (-[TPPBPeerDynamicInfo includedsCount](self, "includedsCount"))
  {
    [v21 clearIncludeds];
    unint64_t v5 = -[TPPBPeerDynamicInfo includedsCount](self, "includedsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        -[TPPBPeerDynamicInfo includedAtIndex:](self, "includedAtIndex:", i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 addIncluded:v8];
      }
    }
  }

  if (-[TPPBPeerDynamicInfo excludedsCount](self, "excludedsCount"))
  {
    [v21 clearExcludeds];
    unint64_t v9 = -[TPPBPeerDynamicInfo excludedsCount](self, "excludedsCount");
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0LL; j != v10; ++j)
      {
        -[TPPBPeerDynamicInfo excludedAtIndex:](self, "excludedAtIndex:", j);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 addExcluded:v12];
      }
    }
  }

  if (-[TPPBPeerDynamicInfo dispositionsCount](self, "dispositionsCount"))
  {
    [v21 clearDispositions];
    unint64_t v13 = -[TPPBPeerDynamicInfo dispositionsCount](self, "dispositionsCount");
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0LL; k != v14; ++k)
      {
        -[TPPBPeerDynamicInfo dispositionsAtIndex:](self, "dispositionsAtIndex:", k);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 addDispositions:v16];
      }
    }
  }

  if (-[TPPBPeerDynamicInfo preapprovalsCount](self, "preapprovalsCount"))
  {
    [v21 clearPreapprovals];
    unint64_t v17 = -[TPPBPeerDynamicInfo preapprovalsCount](self, "preapprovalsCount");
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0LL; m != v18; ++m)
      {
        v20 = -[TPPBPeerDynamicInfo preapprovalsAtIndex:](self, "preapprovalsAtIndex:", m);
        [v21 addPreapprovals:v20];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(void *)(v5 + 8) = self->_clock;
    *(_BYTE *)(v5 + 48) |= 1u;
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  uint64_t v7 = self->_includeds;
  uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v44,  v51,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addIncluded:v12];

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v44,  v51,  16LL);
    }

    while (v9);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  unint64_t v13 = self->_excludeds;
  uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v40,  v50,  16LL);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addExcluded:v18];

        ++v17;
      }

      while (v15 != v17);
      uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v40,  v50,  16LL);
    }

    while (v15);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v19 = self->_dispositions;
  uint64_t v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v36,  v49,  16LL);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * v23) copyWithZone:a3];
        [v6 addDispositions:v24];

        ++v23;
      }

      while (v21 != v23);
      uint64_t v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v36,  v49,  16LL);
    }

    while (v21);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v25 = self->_preapprovals;
  uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v32,  v48,  16LL);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      uint64_t v29 = 0LL;
      do
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        __int128 v30 = (void *)objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v29), "copyWithZone:", a3, (void)v32);
        [v6 addPreapprovals:v30];

        ++v29;
      }

      while (v27 != v29);
      uint64_t v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v32,  v48,  16LL);
    }

    while (v27);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_clock != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }

  includeds = self->_includeds;
  if ((unint64_t)includeds | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](includeds, "isEqual:"))
  {
    goto LABEL_15;
  }

  excludeds = self->_excludeds;
  if ((unint64_t)excludeds | *((void *)v4 + 3))
  {
  }

  dispositions = self->_dispositions;
  if ((unint64_t)dispositions | *((void *)v4 + 2))
  {
  }

  preapprovals = self->_preapprovals;
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v3 = 2654435761u * self->_clock;
  }
  else {
    unint64_t v3 = 0LL;
  }
  uint64_t v4 = -[NSMutableArray hash](self->_includeds, "hash") ^ v3;
  uint64_t v5 = -[NSMutableArray hash](self->_excludeds, "hash");
  uint64_t v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_dispositions, "hash");
  return v6 ^ -[NSMutableArray hash](self->_preapprovals, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_clocuint64_t k = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        -[TPPBPeerDynamicInfo addIncluded:](self, "addIncluded:", *(void *)(*((void *)&v38 + 1) + 8 * v10++));
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }

    while (v8);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v11 = v5[3];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        -[TPPBPeerDynamicInfo addExcluded:](self, "addExcluded:", *(void *)(*((void *)&v34 + 1) + 8 * v15++));
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }

    while (v13);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v16 = v5[2];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        -[TPPBPeerDynamicInfo addDispositions:]( self,  "addDispositions:",  *(void *)(*((void *)&v30 + 1) + 8 * v20++));
      }

      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }

    while (v18);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v21 = v5[5];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[TPPBPeerDynamicInfo addPreapprovals:]( self,  "addPreapprovals:",  *(void *)(*((void *)&v26 + 1) + 8 * v25++),  (void)v26);
      }

      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }

    while (v23);
  }
}

- (unint64_t)clock
{
  return self->_clock;
}

- (NSMutableArray)includeds
{
  return self->_includeds;
}

- (void)setIncludeds:(id)a3
{
}

- (NSMutableArray)excludeds
{
  return self->_excludeds;
}

- (void)setExcludeds:(id)a3
{
}

- (NSMutableArray)dispositions
{
  return self->_dispositions;
}

- (void)setDispositions:(id)a3
{
}

- (NSMutableArray)preapprovals
{
  return self->_preapprovals;
}

- (void)setPreapprovals:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)includedType
{
  return (Class)objc_opt_class();
}

+ (Class)excludedType
{
  return (Class)objc_opt_class();
}

+ (Class)dispositionsType
{
  return (Class)objc_opt_class();
}

+ (Class)preapprovalsType
{
  return (Class)objc_opt_class();
}

@end