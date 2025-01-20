@interface MCMResultBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)isCacheable;
- (MCMError)error;
- (MCMResultBase)init;
- (MCMResultBase)initWithError:(id)a3;
- (void)setCacheable:(BOOL)a3;
@end

@implementation MCMResultBase

- (MCMResultBase)init
{
  return -[MCMResultBase initWithError:](self, "initWithError:", 0LL);
}

- (MCMResultBase)initWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMResultBase;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_cacheable = 1;
  }

  return v7;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4 = a3;
  -[MCMResultBase error](self, "error");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    v7 = -[MCMResultBase error](self, "error");
    [v7 category];
    v8 = -[MCMResultBase error](self, "error");
    [v8 type];
    -[MCMResultBase error](self, "error");
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 path];
    [v10 fileSystemRepresentation];
    v11 = -[MCMResultBase error](self, "error");
    [v11 POSIXerrno];
    container_error_create();

    container_xpc_encode_error();
    container_error_free();
    xpc_dictionary_set_value(v4, "ReplyErrorExtended", v6);
  }

  xpc_dictionary_set_BOOL(v4, "ReplyCacheable", -[MCMResultBase isCacheable](self, "isCacheable"));

  return 1;
}

- (MCMError)error
{
  return self->_error;
}

- (BOOL)isCacheable
{
  return self->_cacheable;
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

- (void).cxx_destruct
{
}

@end