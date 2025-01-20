@interface TPPBPolicyIntroducersByCategory
+ (Class)introducersType;
+ (id)TPPBPolicyIntroducersByCategoryWithCategory:(id)a3 introducers:(id)a4;
- (BOOL)hasCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)introducers;
- (NSString)category;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)introducersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)introducersCount;
- (void)addIntroducers:(id)a3;
- (void)clearIntroducers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(id)a3;
- (void)setIntroducers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyIntroducersByCategory

- (BOOL)hasCategory
{
  return self->_category != 0LL;
}

- (void)clearIntroducers
{
}

- (void)addIntroducers:(id)a3
{
  id v4 = a3;
  introducers = self->_introducers;
  id v8 = v4;
  if (!introducers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_introducers;
    self->_introducers = v6;

    id v4 = v8;
    introducers = self->_introducers;
  }

  -[NSMutableArray addObject:](introducers, "addObject:", v4);
}

- (unint64_t)introducersCount
{
  return -[NSMutableArray count](self->_introducers, "count");
}

- (id)introducersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_introducers, "objectAtIndex:", a3);
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPolicyIntroducersByCategory;
  -[TPPBPolicyIntroducersByCategory description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBPolicyIntroducersByCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  category = self->_category;
  if (category) {
    [v3 setObject:category forKey:@"category"];
  }
  introducers = self->_introducers;
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyIntroducersByCategoryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_category) {
    PBDataWriterWriteStringField();
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v5 = self->_introducers;
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
        PBDataWriterWriteStringField();
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
  if (self->_category) {
    objc_msgSend(v8, "setCategory:");
  }
  if (-[TPPBPolicyIntroducersByCategory introducersCount](self, "introducersCount"))
  {
    [v8 clearIntroducers];
    unint64_t v4 = -[TPPBPolicyIntroducersByCategory introducersCount](self, "introducersCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        -[TPPBPolicyIntroducersByCategory introducersAtIndex:](self, "introducersAtIndex:", i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addIntroducers:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  unint64_t v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = self->_introducers;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
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
        __int128 v13 = (void *)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addIntroducers:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((category = self->_category, !((unint64_t)category | v4[1]))
     || -[NSString isEqual:](category, "isEqual:")))
  {
    introducers = self->_introducers;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_category, "hash");
  return -[NSMutableArray hash](self->_introducers, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[TPPBPolicyIntroducersByCategory setCategory:](self, "setCategory:");
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[TPPBPolicyIntroducersByCategory addIntroducers:]( self,  "addIntroducers:",  *(void *)(*((void *)&v10 + 1) + 8 * i),  (void)v10);
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSMutableArray)introducers
{
  return self->_introducers;
}

- (void)setIntroducers:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)introducersType
{
  return (Class)objc_opt_class();
}

+ (id)TPPBPolicyIntroducersByCategoryWithCategory:(id)a3 introducers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyIntroducersByCategory);
  -[TPPBPolicyIntroducersByCategory setCategory:](v7, "setCategory:", v6);

  uint64_t v8 = (void *)[v5 mutableCopy];
  -[TPPBPolicyIntroducersByCategory setIntroducers:](v7, "setIntroducers:", v8);

  return v7;
}

@end