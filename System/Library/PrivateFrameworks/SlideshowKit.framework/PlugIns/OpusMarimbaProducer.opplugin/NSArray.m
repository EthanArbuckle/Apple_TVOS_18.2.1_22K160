@interface NSArray
- (void)removeImages;
@end

@implementation NSArray

- (void)removeImages
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(self);
        }
        objc_msgSend( objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "objectForKey:", @"image"),  "removingFromCollection");
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }

@end