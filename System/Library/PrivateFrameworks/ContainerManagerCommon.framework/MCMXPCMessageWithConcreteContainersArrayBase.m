@interface MCMXPCMessageWithConcreteContainersArrayBase
- (MCMXPCMessageWithConcreteContainersArrayBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSArray)concreteContainerIdentities;
@end

@implementation MCMXPCMessageWithConcreteContainersArrayBase

- (MCMXPCMessageWithConcreteContainersArrayBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  v30[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  unint64_t v29 = 0LL;
  v30[0] = 1LL;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithConcreteContainersArrayBase;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v28, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (v10)
  {
    xpc_dictionary_get_array(v8, "ContainersArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t container_object_array = container_xpc_decode_create_container_object_array();
    if (container_object_array)
    {
      uint64_t v13 = container_object_array;
      [MEMORY[0x189603FA8] arrayWithCapacity:v29];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v25 = v11;
        id v26 = v8;
        v27 = a5;
        uint64_t v15 = 0LL;
        while (1)
        {
          v16 = objc_alloc(&OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem);
          uint64_t v17 = *(void *)(v13 + 8 * v15);
          [v9 clientIdentity];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 userIdentity];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 userIdentityCache];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[MCMConcreteContainerIdentityForLibsystem initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:]( v16,  "initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:",  v17,  v19,  v20,  v30);

          if (!v21) {
            break;
          }
          [v14 addObject:v21];

          if (++v15 >= v29)
          {
            id v8 = v26;
            a5 = v27;
            goto LABEL_10;
          }
        }

        v30[0] = 38LL;

        v10 = 0LL;
        id v8 = v26;
        a5 = v27;
LABEL_10:
        v11 = v25;
      }

      if (v30[0] == 1LL)
      {
        uint64_t v22 = [v14 copy];
        concreteContainerIdentities = v10->_concreteContainerIdentities;
        v10->_concreteContainerIdentities = (NSArray *)v22;
      }

      container_free_array_of_containers();
    }

    else
    {

      v10 = 0LL;
    }
  }

  if (a5 && v30[0] != 1LL) {
    *a5 = v30[0];
  }

  return v10;
}

- (NSArray)concreteContainerIdentities
{
  return self->_concreteContainerIdentities;
}

- (void).cxx_destruct
{
}

@end