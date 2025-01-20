@interface PPSPBCadence
+ (Class)cadencesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cadences;
- (id)cadencesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)cadencesCount;
- (unint64_t)hash;
- (void)addCadences:(id)a3;
- (void)clearCadences;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCadences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPSPBCadence

- (void)clearCadences
{
}

- (void)addCadences:(id)a3
{
  id v4 = a3;
  cadences = self->_cadences;
  id v8 = v4;
  if (!cadences)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_cadences;
    self->_cadences = v6;

    id v4 = v8;
    cadences = self->_cadences;
  }

  -[NSMutableArray addObject:](cadences, "addObject:", v4);
}

- (unint64_t)cadencesCount
{
  return -[NSMutableArray count](self->_cadences, "count");
}

- (id)cadencesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cadences, "objectAtIndex:", a3);
}

+ (Class)cadencesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PPSPBCadence;
  -[PPSPBCadence description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPSPBCadence dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_cadences, "count"))
  {
    id v4 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_cadences, "count"));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v5 = self->_cadences;
    uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "dictionaryRepresentation", (void)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v10];

          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"cadences"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPSPBCadenceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_cadences;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (-[PPSPBCadence cadencesCount](self, "cadencesCount"))
  {
    [v8 clearCadences];
    unint64_t v4 = -[PPSPBCadence cadencesCount](self, "cadencesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        -[PPSPBCadence cadencesAtIndex:](self, "cadencesAtIndex:", i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addCadences:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unint64_t v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = self->_cadences;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = (void *)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addCadences:v11];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    cadences = self->_cadences;
    else {
      char v6 = 1;
    }
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_cadences, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[PPSPBCadence addCadences:](self, "addCadences:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (NSMutableArray)cadences
{
  return self->_cadences;
}

- (void)setCadences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end