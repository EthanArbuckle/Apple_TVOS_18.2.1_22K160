@interface NSDictionary
- (id)cl_deepCopy;
- (id)cl_deepMutableCopy;
@end

@implementation NSDictionary

- (id)cl_deepCopy
{
  id v2 = -[NSDictionary cl_deepMutableCopy](self, "cl_deepMutableCopy");
  v3 = -[NSDictionary initWithDictionary:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithDictionary:", v2);

  return v3;
}

- (id)cl_deepMutableCopy
{
  v3 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSDictionary count](self, "count"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  NSUInteger v4 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    NSUInteger v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(self);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "cl_deepCopy");
        id v9 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v8), "cl_deepCopy");
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, v8);

        ++v7;
      }

      while (v5 != v7);
      NSUInteger v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  return v3;
}

@end