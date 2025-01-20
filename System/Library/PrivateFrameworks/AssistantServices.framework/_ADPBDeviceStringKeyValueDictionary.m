@interface _ADPBDeviceStringKeyValueDictionary
+ (Class)pairsType;
+ (id)_ad_keyValueDictionaryWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)pairs;
- (id)_ad_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pairsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pairsCount;
- (void)addPairs:(id)a3;
- (void)clearPairs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPairs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceStringKeyValueDictionary

- (void)clearPairs
{
}

- (void)addPairs:(id)a3
{
  id v4 = a3;
  pairs = self->_pairs;
  id v8 = v4;
  if (!pairs)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_pairs;
    self->_pairs = v6;

    id v4 = v8;
    pairs = self->_pairs;
  }

  -[NSMutableArray addObject:](pairs, "addObject:", v4);
}

- (unint64_t)pairsCount
{
  return (unint64_t)-[NSMutableArray count](self->_pairs, "count");
}

- (id)pairsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_pairs, "objectAtIndex:", a3);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBDeviceStringKeyValueDictionary;
  id v3 = -[_ADPBDeviceStringKeyValueDictionary description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStringKeyValueDictionary dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[NSMutableArray count](self->_pairs, "count"))
  {
    id v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_pairs, "count"));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v5 = self->_pairs;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v9),  "dictionaryRepresentation",  (void)v12));
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"pairs"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10033727C(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_pairs;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9), 1LL);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (-[_ADPBDeviceStringKeyValueDictionary pairsCount](self, "pairsCount"))
  {
    [v8 clearPairs];
    unint64_t v4 = -[_ADPBDeviceStringKeyValueDictionary pairsCount](self, "pairsCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStringKeyValueDictionary pairsAtIndex:](self, "pairsAtIndex:", i));
        [v8 addPairs:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = self->_pairs;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v13);
        [v5 addPairs:v11];

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)])
  {
    pairs = self->_pairs;
    else {
      unsigned __int8 v6 = 1;
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableArray hash](self->_pairs, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = *((id *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[_ADPBDeviceStringKeyValueDictionary addPairs:]( self,  "addPairs:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8),  (void)v9);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (NSMutableArray)pairs
{
  return self->_pairs;
}

- (void)setPairs:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)pairsType
{
  return (Class)objc_opt_class(&OBJC_CLASS____ADPBDeviceStringKeyValuePair);
}

- (id)_ad_dictionaryRepresentation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceStringKeyValueDictionary pairs](self, "pairs", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 value]);
        if (v10)
        {
          __int128 v11 = (void *)v10;
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 key]);

          if (v12)
          {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 value]);
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 key]);
            -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v13, v14);
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  id v15 = -[NSMutableDictionary copy](v3, "copy");
  return v15;
}

+ (id)_ad_keyValueDictionaryWithDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceStringKeyValueDictionary);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
          __int128 v11 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceStringKeyValuePair);
          -[_ADPBDeviceStringKeyValuePair setKey:](v11, "setKey:", v10, (void)v14);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v10]);
          -[_ADPBDeviceStringKeyValuePair setValue:](v11, "setValue:", v12);

          -[_ADPBDeviceStringKeyValueDictionary addPairs:](v4, "addPairs:", v11);
        }

        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v7);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

@end