@interface MCMXPCMessageWithConcreteContainerBase
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (MCMXPCMessageWithConcreteContainerBase)initWithConcreteContainer:(id)a3 context:(id)a4;
- (MCMXPCMessageWithConcreteContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageWithConcreteContainerBase

- (MCMXPCMessageWithConcreteContainerBase)initWithConcreteContainer:(id)a3 context:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithConcreteContainerBase;
  v8 = -[MCMXPCMessageBase initWithContext:](&v11, sel_initWithContext_, a4);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_concreteContainerIdentity, a3);
  }

  return v9;
}

- (MCMXPCMessageWithConcreteContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithConcreteContainerBase;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v21, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (v10)
  {
    unint64_t v20 = 1LL;
    xpc_dictionary_get_dictionary(v8, "Container");
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = container_xpc_decode_container_object();
    if (!v12) {
      goto LABEL_4;
    }
    v13 = objc_alloc(&OBJC_CLASS___MCMConcreteContainerIdentityForLibsystem);
    [v9 clientIdentity];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 userIdentity];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 userIdentityCache];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = -[MCMConcreteContainerIdentityForLibsystem initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:]( v13,  "initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:",  v12,  v15,  v16,  &v20);
    concreteContainerIdentity = v10->_concreteContainerIdentity;
    v10->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v17;

    if (!v10->_concreteContainerIdentity)
    {
LABEL_4:

      v10 = 0LL;
    }

    if (a5 && v20 != 1) {
      *a5 = v20;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  MEMORY[0x1895CDD90](v12);

  return v10;
}

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithConcreteContainerBase;
  unsigned int v3 = -[MCMXPCMessageBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    v4 = -[MCMXPCMessageWithConcreteContainerBase concreteContainerIdentity](self, "concreteContainerIdentity");
    unsigned int v3 = [v4 disposition];
  }

  return v3;
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void).cxx_destruct
{
}

@end