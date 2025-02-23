@interface MCMXPCMessageWithContainerClassBase
- (MCMContainerConfiguration)containerConfig;
- (MCMXPCMessageWithContainerClassBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageWithContainerClassBase

- (MCMXPCMessageWithContainerClassBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithContainerClassBase;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v20, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    v10 = v9;
    xpc_dictionary_get_uint64(v8, "ContainerClass");
    uint64_t v11 = container_class_normalized();
    v12 = -[MCMXPCMessageBase context](v10, "context");
    [v12 globalConfiguration];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 staticConfig];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 configForContainerClass:v11];
    containerConfig = v10->_containerConfig;
    v10->_containerConfig = (MCMContainerConfiguration *)v15;

    v17 = v10->_containerConfig;
    if (v17)
    {
      if (-[MCMContainerConfiguration supportedOnPlatform](v17, "supportedOnPlatform")) {
        goto LABEL_10;
      }
      unint64_t v18 = 72LL;
    }

    else
    {
      unint64_t v18 = 20LL;
    }
  }

  else
  {
    unint64_t v18 = 1LL;
  }

  v10 = 0LL;
  if (a5) {
    *a5 = v18;
  }
LABEL_10:

  return v10;
}

- (unsigned)disposition
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithContainerClassBase;
  unsigned int v3 = -[MCMXPCMessageBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    v4 = -[MCMXPCMessageWithContainerClassBase containerConfig](self, "containerConfig");
    unsigned int v3 = [v4 disposition];
  }

  return v3;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (void).cxx_destruct
{
}

@end