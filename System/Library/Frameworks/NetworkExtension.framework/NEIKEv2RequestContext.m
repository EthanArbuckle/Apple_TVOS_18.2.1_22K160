@interface NEIKEv2RequestContext
- (NEIKEv2RequestContext)initWithRequestType:(int)a3;
- (id)description;
- (void)dealloc;
- (void)releasePowerAssertionIfNeeded;
- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4;
@end

@implementation NEIKEv2RequestContext

- (NEIKEv2RequestContext)initWithRequestType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEIKEv2RequestContext;
  result = -[NEIKEv2RequestContext init](&v5, sel_init);
  if (result) {
    result->_requestType = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEIKEv2RequestContext;
  -[NEIKEv2RequestContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  if (self) {
    LODWORD(self) = self->_requestType;
  }
  return NEIKEv2RequestContextTypeString(self);
}

- (void)sendCallbackSuccess:(BOOL)a3 session:(id)a4
{
  objc_super v5 = a4;
  -[NEIKEv2RequestContext releasePowerAssertionIfNeeded]((uint64_t)self);
  if (self && self->_requestInitiator)
  {
    if (v5)
    {
      v5[15] = 0;
      Property = (dispatch_queue_s *)objc_getProperty(v5, v6, 368LL, 1);
    }

    else
    {
      Property = 0LL;
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __53__NEIKEv2RequestContext_sendCallbackSuccess_session___block_invoke;
    block[3] = &unk_18A090390;
    v9 = v5;
    dispatch_async(Property, block);
  }
}

- (void).cxx_destruct
{
}

- (void)releasePowerAssertionIfNeeded
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1 && *(void *)(a1 + 16))
  {
    ne_log_obj();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 16);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating power assertion %@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 16) invalidate];
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0LL;
  }

void __53__NEIKEv2RequestContext_sendCallbackSuccess_session___block_invoke(uint64_t a1, const char *a2)
{
}

@end