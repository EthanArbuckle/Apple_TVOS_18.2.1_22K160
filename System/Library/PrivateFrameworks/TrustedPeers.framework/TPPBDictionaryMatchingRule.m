@interface TPPBDictionaryMatchingRule
+ (Class)andType;
+ (Class)orType;
- (BOOL)hasExists;
- (BOOL)hasMatch;
- (BOOL)hasNot;
- (BOOL)hasType;
- (BOOL)invertMatch:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3 error:(id *)a4;
- (BOOL)performAndMatch:(id)a3 error:(id *)a4;
- (BOOL)performOrMatch:(id)a3 error:(id *)a4;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)ands;
- (NSMutableArray)ors;
- (TPPBDictionaryMatchingRule)not;
- (TPPBDictionaryMatchingRuleFieldExists)exists;
- (TPPBDictionaryMatchingRuleFieldRegexMatch)match;
- (id)andAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)orAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)andsCount;
- (unint64_t)hash;
- (unint64_t)orsCount;
- (void)addAnd:(id)a3;
- (void)addOr:(id)a3;
- (void)clearAnds;
- (void)clearOrs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnds:(id)a3;
- (void)setExists:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMatch:(id)a3;
- (void)setNot:(id)a3;
- (void)setOrs:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBDictionaryMatchingRule

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"AND_RULE"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"OR_RULE"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"NOT_RULE"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"MATCH_RULE"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"FIELD_EXISTS"])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:@"TRUE_RULE"])
  {
    int v4 = 6;
  }

  else if ([v3 isEqualToString:@"FALSE_RULE"])
  {
    int v4 = 7;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearAnds
{
}

- (void)addAnd:(id)a3
{
  id v4 = a3;
  ands = self->_ands;
  id v8 = v4;
  if (!ands)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_ands;
    self->_ands = v6;

    id v4 = v8;
    ands = self->_ands;
  }

  -[NSMutableArray addObject:](ands, "addObject:", v4);
}

- (unint64_t)andsCount
{
  return -[NSMutableArray count](self->_ands, "count");
}

- (id)andAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ands, "objectAtIndex:", a3);
}

- (void)clearOrs
{
}

- (void)addOr:(id)a3
{
  id v4 = a3;
  ors = self->_ors;
  id v8 = v4;
  if (!ors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_ors;
    self->_ors = v6;

    id v4 = v8;
    ors = self->_ors;
  }

  -[NSMutableArray addObject:](ors, "addObject:", v4);
}

- (unint64_t)orsCount
{
  return -[NSMutableArray count](self->_ors, "count");
}

- (id)orAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ors, "objectAtIndex:", a3);
}

- (BOOL)hasNot
{
  return self->_not != 0LL;
}

- (BOOL)hasMatch
{
  return self->_match != 0LL;
}

- (BOOL)hasExists
{
  return self->_exists != 0LL;
}

- (id)description
{
  id v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBDictionaryMatchingRule;
  -[TPPBDictionaryMatchingRule description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBDictionaryMatchingRule dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v5 = off_18A22BF40[type];
    }

    [v3 setObject:v5 forKey:@"type"];
  }

  if (-[NSMutableArray count](self->_ands, "count"))
  {
    v6 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_ands, "count"));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v7 = self->_ands;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 addObject:v12];
        }

        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
      }

      while (v9);
    }

    [v3 setObject:v6 forKey:@"and"];
  }

  if (-[NSMutableArray count](self->_ors, "count"))
  {
    v13 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_ors, "count"));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    v14 = self->_ors;
    uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t j = 0LL; j != v16; ++j)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * j) dictionaryRepresentation];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addObject:v19];
        }

        uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
      }

      while (v16);
    }

    [v3 setObject:v13 forKey:@"or"];
  }

  not = self->_not;
  if (not)
  {
    v21 = -[TPPBDictionaryMatchingRule dictionaryRepresentation](not, "dictionaryRepresentation");
    [v3 setObject:v21 forKey:@"not"];
  }

  match = self->_match;
  if (match)
  {
    v23 = -[TPPBDictionaryMatchingRuleFieldRegexMatch dictionaryRepresentation](match, "dictionaryRepresentation");
    [v3 setObject:v23 forKey:@"match"];
  }

  exists = self->_exists;
  if (exists)
  {
    v25 = -[TPPBDictionaryMatchingRuleFieldExists dictionaryRepresentation](exists, "dictionaryRepresentation");
    [v3 setObject:v25 forKey:@"exists"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDictionaryMatchingRuleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field();
  }
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v5 = self->_ands;
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

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v10 = self->_ors;
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

  if (self->_not) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_match) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_exists) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_type;
    *((_BYTE *)v4 + 52) |= 1u;
  }

  id v14 = v4;
  if (-[TPPBDictionaryMatchingRule andsCount](self, "andsCount"))
  {
    [v14 clearAnds];
    unint64_t v5 = -[TPPBDictionaryMatchingRule andsCount](self, "andsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        -[TPPBDictionaryMatchingRule andAtIndex:](self, "andAtIndex:", i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 addAnd:v8];
      }
    }
  }

  if (-[TPPBDictionaryMatchingRule orsCount](self, "orsCount"))
  {
    [v14 clearOrs];
    unint64_t v9 = -[TPPBDictionaryMatchingRule orsCount](self, "orsCount");
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0LL; j != v10; ++j)
      {
        -[TPPBDictionaryMatchingRule orAtIndex:](self, "orAtIndex:", j);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 addOr:v12];
      }
    }
  }

  if (self->_not) {
    objc_msgSend(v14, "setNot:");
  }
  uint64_t v13 = v14;
  if (self->_match)
  {
    objc_msgSend(v14, "setMatch:");
    uint64_t v13 = v14;
  }

  if (self->_exists)
  {
    objc_msgSend(v14, "setExists:");
    uint64_t v13 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(_BYTE *)(v5 + 52) |= 1u;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v7 = self->_ands;
  uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addAnd:v12];

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
    }

    while (v9);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v13 = self->_ors;
  uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        __int128 v18 = (void *)objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v17), "copyWithZone:", a3, (void)v26);
        [v6 addOr:v18];

        ++v17;
      }

      while (v15 != v17);
      uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
    }

    while (v15);
  }

  id v19 = -[TPPBDictionaryMatchingRule copyWithZone:](self->_not, "copyWithZone:", a3);
  __int128 v20 = (void *)v6[4];
  v6[4] = v19;

  id v21 = -[TPPBDictionaryMatchingRuleFieldRegexMatch copyWithZone:](self->_match, "copyWithZone:", a3);
  __int128 v22 = (void *)v6[3];
  v6[3] = v21;

  id v23 = -[TPPBDictionaryMatchingRuleFieldExists copyWithZone:](self->_exists, "copyWithZone:", a3);
  v24 = (void *)v6[2];
  v6[2] = v23;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }

  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }

  ands = self->_ands;
  ors = self->_ors;
  if ((unint64_t)ors | *((void *)v4 + 5))
  {
  }

  not = self->_not;
  if ((unint64_t)not | *((void *)v4 + 4))
  {
    if (!-[TPPBDictionaryMatchingRule isEqual:](not, "isEqual:")) {
      goto LABEL_17;
    }
  }

  match = self->_match;
  if ((unint64_t)match | *((void *)v4 + 3))
  {
    if (!-[TPPBDictionaryMatchingRuleFieldRegexMatch isEqual:](match, "isEqual:")) {
      goto LABEL_17;
    }
  }

  exists = self->_exists;
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_type;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = -[NSMutableArray hash](self->_ands, "hash") ^ v3;
  uint64_t v5 = -[NSMutableArray hash](self->_ors, "hash");
  unint64_t v6 = v4 ^ v5 ^ -[TPPBDictionaryMatchingRule hash](self->_not, "hash");
  unint64_t v7 = -[TPPBDictionaryMatchingRuleFieldRegexMatch hash](self->_match, "hash");
  return v6 ^ v7 ^ -[TPPBDictionaryMatchingRuleFieldExists hash](self->_exists, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        -[TPPBDictionaryMatchingRule addAnd:](self, "addAnd:", *(void *)(*((void *)&v26 + 1) + 8 * i));
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v8);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v11 = v5[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        -[TPPBDictionaryMatchingRule addOr:](self, "addOr:", *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v13);
  }

  not = self->_not;
  id v17 = v5[4];
  if (not)
  {
    if (v17) {
      -[TPPBDictionaryMatchingRule mergeFrom:](not, "mergeFrom:");
    }
  }

  else if (v17)
  {
    -[TPPBDictionaryMatchingRule setNot:](self, "setNot:");
  }

  match = self->_match;
  id v19 = v5[3];
  if (match)
  {
    if (v19) {
      -[TPPBDictionaryMatchingRuleFieldRegexMatch mergeFrom:](match, "mergeFrom:");
    }
  }

  else if (v19)
  {
    -[TPPBDictionaryMatchingRule setMatch:](self, "setMatch:");
  }

  exists = self->_exists;
  id v21 = v5[2];
  if (exists)
  {
    if (v21) {
      -[TPPBDictionaryMatchingRuleFieldExists mergeFrom:](exists, "mergeFrom:");
    }
  }

  else if (v21)
  {
    -[TPPBDictionaryMatchingRule setExists:](self, "setExists:");
  }
}

- (NSMutableArray)ands
{
  return self->_ands;
}

- (void)setAnds:(id)a3
{
}

- (NSMutableArray)ors
{
  return self->_ors;
}

- (void)setOrs:(id)a3
{
}

- (TPPBDictionaryMatchingRule)not
{
  return self->_not;
}

- (void)setNot:(id)a3
{
}

- (TPPBDictionaryMatchingRuleFieldRegexMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (TPPBDictionaryMatchingRuleFieldExists)exists
{
  return self->_exists;
}

- (void)setExists:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)andType
{
  return (Class)objc_opt_class();
}

+ (Class)orType
{
  return (Class)objc_opt_class();
}

- (BOOL)matches:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[TPPBDictionaryMatchingRule hasType](self, "hasType"))
  {
    char v7 = 1;
    switch(-[TPPBDictionaryMatchingRule type](self, "type"))
    {
      case 1:
        BOOL v8 = -[TPPBDictionaryMatchingRule performAndMatch:error:](self, "performAndMatch:error:", v6, a4);
        goto LABEL_12;
      case 2:
        BOOL v8 = -[TPPBDictionaryMatchingRule performOrMatch:error:](self, "performOrMatch:error:", v6, a4);
        goto LABEL_12;
      case 3:
        BOOL v8 = -[TPPBDictionaryMatchingRule invertMatch:error:](self, "invertMatch:error:", v6, a4);
LABEL_12:
        char v7 = v8;
        goto LABEL_24;
      case 4:
        -[TPPBDictionaryMatchingRule match](self, "match");
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[TPPBDictionaryMatchingRule match](self, "match");
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }

        if (!a4) {
          goto LABEL_23;
        }
        uint64_t v9 = (void *)MEMORY[0x189607870];
        char v10 = @"No 'match' subrule present";
        goto LABEL_22;
      case 5:
        -[TPPBDictionaryMatchingRule exists](self, "exists");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[TPPBDictionaryMatchingRule exists](self, "exists");
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
          uint64_t v15 = v13;
          char v7 = [v13 matches:v6 error:a4];

          goto LABEL_24;
        }

        if (!a4) {
          goto LABEL_23;
        }
        uint64_t v9 = (void *)MEMORY[0x189607870];
        char v10 = @"No 'exists' subrule present";
LABEL_22:
        uint64_t v11 = 2LL;
        break;
      case 6:
        goto LABEL_24;
      case 7:
        goto LABEL_23;
      default:
        if (!a4) {
          goto LABEL_23;
        }
        uint64_t v9 = (void *)MEMORY[0x189607870];
        char v10 = @"Rule type is unknown";
        goto LABEL_6;
    }
  }

  else
  {
    if (!a4)
    {
LABEL_23:
      char v7 = 0;
      goto LABEL_24;
    }

    uint64_t v9 = (void *)MEMORY[0x189607870];
    char v10 = @"Rule has no type";
LABEL_6:
    uint64_t v11 = 0LL;
  }

  [v9 errorWithDomain:@"CKKSMatcherError" code:v11 description:v10];
  char v7 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v7;
}

- (BOOL)performAndMatch:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = -[TPPBDictionaryMatchingRule ands](self, "ands");
  if (v7
    && (BOOL v8 = (void *)v7,
        -[TPPBDictionaryMatchingRule ands](self, "ands"),
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8,
        v10))
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    -[TPPBDictionaryMatchingRule ands](self, "ands");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v22 = 0LL;
          int v17 = [v16 matches:v6 error:&v22];
          id v18 = v22;
          if (v18)
          {
            __int128 v20 = v18;
            if (a4) {
              *a4 = v18;
            }

LABEL_20:
            BOOL v19 = 0;
            goto LABEL_21;
          }

          if (!v17) {
            goto LABEL_20;
          }
        }

        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        BOOL v19 = 1;
        if (v13) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v19 = 1;
    }

- (BOOL)performOrMatch:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = -[TPPBDictionaryMatchingRule ors](self, "ors");
  if (v7)
  {
    BOOL v8 = (void *)v7;
    -[TPPBDictionaryMatchingRule ors](self, "ors");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 count];

    if (v10)
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      -[TPPBDictionaryMatchingRule ors](self, "ors");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v22 = 0LL;
            char v17 = [v16 matches:v6 error:&v22];
            id v18 = v22;
            BOOL v19 = v18 == 0LL;
            if (v18)
            {
              __int128 v20 = v18;
              if (a4) {
                *a4 = v18;
              }

LABEL_19:
              goto LABEL_20;
            }

            if ((v17 & 1) != 0) {
              goto LABEL_19;
            }
          }

          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      goto LABEL_15;
    }
  }

  if (!a4)
  {
LABEL_15:
    BOOL v19 = 0;
    goto LABEL_20;
  }

  [MEMORY[0x189607870] errorWithDomain:@"CKKSMatcherError" code:2 description:@"No 'or' subrules present"];
  BOOL v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v19;
}

- (BOOL)invertMatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[TPPBDictionaryMatchingRule not](self, "not");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TPPBDictionaryMatchingRule not](self, "not");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = 0LL;
    char v9 = [v8 matches:v6 error:&v13];
    id v10 = v13;

    if (v10)
    {
      char v11 = 0;
      if (a4) {
        *a4 = v10;
      }
    }

    else
    {
      char v11 = v9 ^ 1;
    }
  }

  else if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CKKSMatcherError" code:2 description:@"No 'not' subrule present"];
    char v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

@end