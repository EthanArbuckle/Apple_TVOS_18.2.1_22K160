@interface NSArray
- (id)cl_deepCopy;
- (id)cl_deepMutableCopy;
@end

@implementation NSArray

- (id)cl_deepCopy
{
  id v2 = -[NSArray cl_deepMutableCopy](self, "cl_deepMutableCopy");
  v3 = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", v2);

  return v3;
}

- (id)cl_deepMutableCopy
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self, "count"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v7), "cl_deepCopy");
        -[NSMutableArray addObject:](v3, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  return v3;
}

@end