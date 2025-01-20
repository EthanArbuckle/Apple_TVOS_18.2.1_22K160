@interface MCMXPCMessageWithContainerBase
- (MCMContainerIdentity)containerIdentity;
- (MCMXPCMessageWithContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (id)containerIdentityFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageWithContainerBase

- (MCMXPCMessageWithContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithContainerBase;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v15, sel_initWithXPCObject_context_error_, v8, v9, a5);
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = -[MCMXPCMessageWithContainerBase containerIdentityFromXPCObject:context:error:]( v10,  "containerIdentityFromXPCObject:context:error:",  v8,  v9,  a5);
    containerIdentity = v11->_containerIdentity;
    v11->_containerIdentity = (MCMContainerIdentity *)v12;

    if (!v11->_containerIdentity)
    {

      v11 = 0LL;
    }
  }

  return v11;
}

- (id)containerIdentityFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  v27[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v27[0] = 1LL;
  [v9 clientIdentity];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t uint64 = xpc_dictionary_get_uint64(v8, "Platform");
  [v10 codeSignInfo];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 identifier];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MCMXPCMessageBase identifierFromXPCObject:elseClientIdentifier:]( self,  "identifierFromXPCObject:elseClientIdentifier:",  v8,  v13);
  if (!v14)
  {
    v20 = 0LL;
    v22 = 0LL;
    v18 = 0LL;
    uint64_t v23 = 18LL;
    goto LABEL_10;
  }

  uint64_t v26 = uint64;
  uint64_t v15 = xpc_dictionary_get_uint64(v8, "ContainerClass");
  [v9 globalConfiguration];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 staticConfig];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 configForContainerClass:v15];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v20 = 0LL;
    v22 = 0LL;
    uint64_t v23 = 20LL;
    goto LABEL_10;
  }

  if (([v18 supportedOnPlatform] & 1) == 0)
  {
    v20 = 0LL;
    v22 = 0LL;
    uint64_t v23 = 72LL;
LABEL_10:
    v27[0] = v23;
    if (!a5) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  BOOL v19 = xpc_dictionary_get_BOOL(v8, "Transient");
  [(id)objc_opt_class() userIdentityForContainerIdentifier:v14 clientIdentity:v10 containerClass:v15 error:v27];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    [v9 userIdentityCache];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v20,  v14,  v18,  v26,  v19,  v21,  v27);
    if (!a5) {
      goto LABEL_13;
    }
  }

  else
  {
    v22 = 0LL;
    if (!a5) {
      goto LABEL_13;
    }
  }

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithContainerBase;
  unsigned int v3 = -[MCMXPCMessageBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    v4 = -[MCMXPCMessageWithContainerBase containerIdentity](self, "containerIdentity");
    unsigned int v3 = [v4 disposition];
  }

  return v3;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void).cxx_destruct
{
}

@end