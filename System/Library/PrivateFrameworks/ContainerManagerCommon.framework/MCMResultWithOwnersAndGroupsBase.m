@interface MCMResultWithOwnersAndGroupsBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultWithOwnersAndGroupsBase)init;
- (NSArray)groupIdentifiers;
- (NSArray)ownerIdentifiers;
- (void)addOwner:(id)a3 group:(id)a4;
@end

@implementation MCMResultWithOwnersAndGroupsBase

- (NSArray)ownerIdentifiers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableOwnerIdentifiers, "copy");
}

- (NSArray)groupIdentifiers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableGroupIdentifiers, "copy");
}

- (void)addOwner:(id)a3 group:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = -[NSMutableArray indexOfObject:](self->_mutableOwnerIdentifiers, "indexOfObject:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = -[NSMutableArray count](self->_mutableOwnerIdentifiers, "count");
    -[NSMutableArray addObject:](self->_mutableOwnerIdentifiers, "addObject:", v10);
  }

  uint64_t v8 = -[NSMutableArray indexOfObject:](self->_mutableGroupIdentifiers, "indexOfObject:", v6, v10);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = -[NSMutableArray count](self->_mutableGroupIdentifiers, "count");
    -[NSMutableArray addObject:](self->_mutableGroupIdentifiers, "addObject:", v6);
  }

  v9 = -[MCMResultWithOwnersAndGroupsBaseFact initWithOwnerIndex:groupIndex:]( objc_alloc(&OBJC_CLASS___MCMResultWithOwnersAndGroupsBaseFact),  "initWithOwnerIndex:groupIndex:",  v7,  v8);
  -[NSMutableSet addObject:](self->_facts, "addObject:", v9);
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCMResultWithOwnersAndGroupsBase;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v23, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      BOOL v20 = v5;
      size_t v7 = -[NSMutableSet count](self->_facts, "count");
      if (v7 <= 1) {
        size_t v7 = 1LL;
      }
      bytes = (char *)calloc(v7, 0x10uLL);
      __s = bytes;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      uint64_t v19 = 5LL;
      uint64_t v8 = self->_facts;
      uint64_t v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = 0LL;
        uint64_t v12 = *(void *)v26;
        do
        {
          uint64_t v13 = 0LL;
          v14 = &bytes[16 * v11 + 8];
          do
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v8);
            }
            v15 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
            *((void *)v14 - 1) = objc_msgSend(v15, "ownerIndex", v19 * 8);
            *(void *)v14 = [v15 groupIndex];
            v14 += 16;
            ++v13;
          }

          while (v10 != v13);
          v11 += v13;
          uint64_t v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
        }

        while (v10);
      }

      xpc_dictionary_set_data(v4, "ReplyFacts", bytes, 16 * -[objc_class count]((&self->super.super.isa)[v19], "count"));
      v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v16) {
        xpc_dictionary_set_value(v4, "ReplyOwnerIdentifiers", v16);
      }
      v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      LOBYTE(v5) = v20;
      if (v17) {
        xpc_dictionary_set_value(v4, "ReplyGroupIdentifiers", v17);
      }
      if (bytes)
      {
        free(bytes);
        memset_s(&__s, 8uLL, 0, 8uLL);
      }
    }
  }

  return v5;
}

- (MCMResultWithOwnersAndGroupsBase)init
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCMResultWithOwnersAndGroupsBase;
  v2 = -[MCMResultBase init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    mutableOwnerIdentifiers = v2->_mutableOwnerIdentifiers;
    v2->_mutableOwnerIdentifiers = v3;

    BOOL v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    mutableGroupIdentifiers = v2->_mutableGroupIdentifiers;
    v2->_mutableGroupIdentifiers = v5;

    size_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    facts = v2->_facts;
    v2->_facts = v7;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end