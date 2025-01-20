@interface MCMXPCMessageWithOwnersAndGroupsBase
- (MCMXPCMessageWithOwnersAndGroupsBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSSet)groupIdentifiers;
- (NSSet)ownerIdentifiers;
- (unint64_t)containerClass;
@end

@implementation MCMXPCMessageWithOwnersAndGroupsBase

- (MCMXPCMessageWithOwnersAndGroupsBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithOwnersAndGroupsBase;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v32, sel_initWithXPCObject_context_error_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    uint64_t v31 = 1LL;
    v9->_containerClass = 0LL;
    ownerIdentifiers = v9->_ownerIdentifiers;
    v9->_ownerIdentifiers = 0LL;

    groupIdentifiers = v10->_groupIdentifiers;
    v10->_groupIdentifiers = 0LL;

    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "ContainerClass");
    v10->_containerClass = uint64;
    if (uint64 - 1 >= 0xE)
    {
      v14 = 0LL;
      v22 = 0LL;
      unint64_t v23 = 20LL;
LABEL_29:
      uint64_t v31 = v23;
      goto LABEL_30;
    }

    v10->_containerClass = container_class_normalized();
    v14 = -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:]( v10,  "nsObjectFromXPCObject:key:error:",  v8,  "OwnerIdentifiersArray",  &v31);
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = 0LL;
LABEL_28:
        unint64_t v23 = 110LL;
        goto LABEL_29;
      }

      v30 = v14;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      v15 = v14;
      uint64_t v16 = -[NSSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v39,  v38,  16LL);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0LL; i != v17; ++i)
          {
            if (*(void *)v40 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v22 = 0LL;
              uint64_t v31 = 110LL;
              goto LABEL_38;
            }
          }

          uint64_t v17 = -[NSSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v39,  v38,  16LL);
          if (v17) {
            continue;
          }
          break;
        }
      }

      uint64_t v20 = [MEMORY[0x189604010] setWithArray:v15];
      v21 = v10->_ownerIdentifiers;
      v10->_ownerIdentifiers = (NSSet *)v20;
    }

    else
    {
      unint64_t v23 = v31;
      if (v31 != 1)
      {
        v14 = 0LL;
        v22 = 0LL;
        goto LABEL_30;
      }
    }

    -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:]( v10,  "nsObjectFromXPCObject:key:error:",  v8,  "GroupIdentifiers",  &v31);
    v22 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if (!v22) {
      goto LABEL_39;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v14;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      v22 = v22;
      uint64_t v24 = -[NSSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v34,  v33,  16LL);
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v35;
        while (2)
        {
          for (uint64_t j = 0LL; j != v25; ++j)
          {
            if (*(void *)v35 != v26) {
              objc_enumerationMutation(v22);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v31 = 110LL;
              v15 = v22;
              goto LABEL_38;
            }
          }

          uint64_t v25 = -[NSSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v34,  v33,  16LL);
          if (v25) {
            continue;
          }
          break;
        }
      }

      uint64_t v28 = [MEMORY[0x189604010] setWithArray:v22];
      v15 = v10->_groupIdentifiers;
      v10->_groupIdentifiers = (NSSet *)v28;
LABEL_38:

      v14 = v30;
LABEL_39:
      unint64_t v23 = v31;
      if (v31 == 1)
      {
LABEL_33:

        goto LABEL_34;
      }

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSSet)ownerIdentifiers
{
  return self->_ownerIdentifiers;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (void).cxx_destruct
{
}

@end