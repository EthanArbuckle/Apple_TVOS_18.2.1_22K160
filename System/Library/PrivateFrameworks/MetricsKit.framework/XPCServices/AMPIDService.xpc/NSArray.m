@interface NSArray
- (id)mt_condensedArray;
- (id)mt_deepCopy;
- (id)mt_map:(id)a3;
- (void)mt_verifyEventData;
@end

@implementation NSArray

- (void)mt_verifyEventData
{
  if (-[NSArray count](self, "count"))
  {
    unint64_t v3 = 0LL;
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v3));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      if (v4 == v5 || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
      {
      }

      else
      {
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___MTPromise);
        char isKindOfClass = objc_opt_isKindOfClass(v4, v7);

        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class(v4);
          id v15 =  MTConfigurationError( 108LL,  @"Event data item at index %ld is of invalid type %@. Event data items must be of NSDictionary or MTPromise type.",  v9,  v10,  v11,  v12,  v13,  v14,  v3);
        }
      }

      ++v3;
    }

    while (v3 < -[NSArray count](self, "count"));
  }

- (id)mt_map:(id)a3
{
  v4 = (uint64_t (**)(id, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSArray count](self, "count")));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v6 = self;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8LL * (void)i));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        if (v12)
        {
          [v5 addObject:v12];
        }

        else
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", (void)v15));
          [v5 addObject:v13];
        }
      }

      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (id)mt_deepCopy
{
  NSUInteger v3 = -[NSArray count](self, "count");
  uint64_t v4 = 8 * v3;
  v5 = (char *)&v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v5, 8 * v3);
  if (v3)
  {
    for (uint64_t i = 0LL; i != v3; ++i)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", i));
      if ((objc_opt_respondsToSelector(v7, "mt_deepCopy") & 1) != 0)
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mt_deepCopy"));

        id v7 = (void *)v8;
      }

      uint64_t v9 = *(void **)&v5[8 * i];
      *(void *)&v5[8 * i] = v7;
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, v3));
  if (v3)
  {
    do
    {

      v4 -= 8LL;
    }

    while (v4);
  }

  return v10;
}

- (id)mt_condensedArray
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSArray count](self, "count")));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v4 = self;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (!v5)
  {

    uint64_t v8 = 0LL;
LABEL_25:
    id v7 = 0LL;
    goto LABEL_26;
  }

  id v6 = v5;
  id v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = *(void *)v19;
  do
  {
    for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        if (!v7 && v8) {
          id v7 = [v8 mutableCopy];
        }
        if (v7)
        {
          [v7 addEntriesFromDictionary:v11];
        }

        else
        {
          id v14 = v11;

          uint64_t v8 = v14;
        }
      }

      else
      {
        if (v7)
        {
          id v13 = [v7 copy];
          [v3 addObject:v13];
        }

        else if (v8)
        {
          objc_msgSend(v3, "addObject:", v8, (void)v18);
        }

        [v3 addObject:v11];
        id v7 = 0LL;
        uint64_t v8 = 0LL;
      }
    }

    id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  }

  while (v6);

  if (!v7)
  {
    if (v8) {
      [v3 addObject:v8];
    }
    goto LABEL_25;
  }

  id v15 = [v7 copy];
  [v3 addObject:v15];

LABEL_26:
  id v16 = objc_msgSend(v3, "copy", (void)v18);

  return v16;
}

@end