@interface NSSet
- (id)cl_deepCopy;
- (id)cl_deepMutableCopy;
@end

@implementation NSSet

- (id)cl_deepCopy
{
  id v2 = -[NSSet cl_deepMutableCopy](self, "cl_deepMutableCopy");
  v3 = -[NSSet initWithSet:](objc_alloc(&OBJC_CLASS___NSSet), "initWithSet:", v2);

  return v3;
}

- (id)cl_deepMutableCopy
{
  v3 = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSSet count](self, "count"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
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
        -[NSMutableSet addObject:](v3, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  return v3;
}

@end