@interface RBSXPCMessageContext
+ (id)currentContext;
+ (void)handoffContextOnQueue:(id)a3 block:(id)a4;
+ (void)runWithoutContext:(id)a3;
- (OS_xpc_object)connection;
- (void)_initWithHandoffToken:(void *)a1;
- (void)_set;
- (void)_unset;
- (void)handoffToQueue:(id)a3 block:(id)a4;
@end

@implementation RBSXPCMessageContext

- (void)_initWithHandoffToken:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___RBSXPCMessageContext;
    id v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      uint64_t v6 = xpc_dictionary_get_remote_connection(v4);
      v7 = (void *)a1[2];
      a1[2] = v6;
    }
  }

  return a1;
}

+ (id)currentContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 threadDictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"RBSXPCCurrentContext"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)runWithoutContext:(id)a3
{
  id v5 = (void (**)(void))a3;
  v3 = +[RBSXPCMessageContext currentContext](&OBJC_CLASS___RBSXPCMessageContext, "currentContext");
  id v4 = v3;
  if (v3)
  {
    -[RBSXPCMessageContext _unset](v3);
    v5[2]();
    -[RBSXPCMessageContext _set]((uint64_t)v4);
  }

  else
  {
    v5[2]();
  }
}

- (void)_unset
{
  if (a1)
  {
    [MEMORY[0x189607A40] currentThread];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 threadDictionary];
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    [v4 objectForKey:@"RBSXPCCurrentContext"];
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == a1) {
      [v4 removeObjectForKey:@"RBSXPCCurrentContext"];
    }
  }

- (void)_set
{
  if (a1)
  {
    [MEMORY[0x189607A40] currentThread];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 threadDictionary];
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    [v5 objectForKey:@"RBSXPCCurrentContext"];
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 handleFailureInMethod:sel__set object:a1 file:@"RBSXPCUtilities.m" lineNumber:89 description:@"must not have an existing message context"];
    }

    [v5 setObject:a1 forKey:@"RBSXPCCurrentContext"];
  }

+ (void)handoffContextOnQueue:(id)a3 block:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (dispatch_queue_s *)a3;
  v7 = +[RBSXPCMessageContext currentContext](&OBJC_CLASS___RBSXPCMessageContext, "currentContext");
  id v8 = v7;
  if (v7) {
    [v7 handoffToQueue:v6 block:v5];
  }
  else {
    dispatch_async(v6, v5);
  }
}

- (void)handoffToQueue:(id)a3 block:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  +[RBSXPCMessageContext currentContext](&OBJC_CLASS___RBSXPCMessageContext, "currentContext");
  objc_super v9 = (RBSXPCMessageContext *)objc_claimAutoreleasedReturnValue();

  if (v9 != self)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2 object:self file:@"RBSXPCUtilities.m" lineNumber:77 description:@"current context does not match context being handed off"];
  }

  -[RBSXPCMessageContext _unset](self);
  id v10 = v7;
  xpc_dictionary_handoff_reply();
}

void __45__RBSXPCMessageContext_handoffToQueue_block___block_invoke(uint64_t a1)
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end