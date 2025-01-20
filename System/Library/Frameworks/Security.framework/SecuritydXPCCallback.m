@interface SecuritydXPCCallback
- (SecuritydXPCCallback)initWithCallback:(id)a3;
- (id)callback;
- (void)callCallback:(BOOL)a3 error:(id)a4;
- (void)setCallback:(id)a3;
@end

@implementation SecuritydXPCCallback

- (SecuritydXPCCallback)initWithCallback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SecuritydXPCCallback;
  v5 = -[SecuritydXPCCallback init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    id callback = v5->_callback;
    v5->_id callback = v6;
  }

  return v5;
}

- (void)callCallback:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  -[SecuritydXPCCallback callback](self, "callback");
  v7 = (void (**)(id, BOOL, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v4, v6);
}

- (id)callback
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end