@interface _PFFreeMapEntry
- (_PFFreeMapEntry)init;
- (void)dealloc;
@end

@implementation _PFFreeMapEntry

- (_PFFreeMapEntry)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PFFreeMapEntry;
  v2 = -[_PFFreeMapEntry init](&v4, sel_init);
  if (v2) {
    v2->_owners = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  owners = self->_owners;
  uint64_t v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( owners,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(owners);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) invalidate];
      }

      uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( owners,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____PFFreeMapEntry;
  -[_PFFreeMapEntry dealloc](&v8, sel_dealloc);
}

@end