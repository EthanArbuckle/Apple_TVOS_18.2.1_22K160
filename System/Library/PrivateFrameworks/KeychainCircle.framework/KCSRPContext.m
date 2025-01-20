@interface KCSRPContext
+ (id)createWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6;
- (BOOL)isAuthenticated;
- (KCSRPContext)initWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6;
- (NSString)user;
- (ccrng_state)rng;
- (ccsrp_ctx)context;
- (const)userNameString;
- (id)dataForPassword:(id)a3;
- (id)getKey;
- (void)dealloc;
- (void)setContext:(ccsrp_ctx *)a3;
- (void)setRng:(ccrng_state *)a3;
- (void)setUser:(id)a3;
@end

@implementation KCSRPContext

- (id)dataForPassword:(id)a3
{
  return (id)[a3 dataUsingEncoding:4];
}

- (const)userNameString
{
  id v2 = -[KCSRPContext user](self, "user");
  v3 = (const char *)[v2 cStringUsingEncoding:4];

  return v3;
}

- (KCSRPContext)initWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___KCSRPContext;
  v10 = -[KCSRPContext init](&v13, sel_init);
  if (v10)
  {
    uint64_t v11 = ccdh_ccn_size();
    -[KCSRPContext setContext:](v10, "setContext:", malloc(4 * (a4->var0 + v11) + 48));
    -[KCSRPContext context](v10, "context");
    ccsrp_ctx_init();
    -[KCSRPContext setUser:](v10, "setUser:", v9);
    -[KCSRPContext setRng:](v10, "setRng:", a6);
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KCSRPContext;
  -[KCSRPContext dealloc](&v3, sel_dealloc);
}

- (id)getKey
{
  session_key = (void *)ccsrp_get_session_key();
  if (session_key) {
    session_key = (void *)[MEMORY[0x189603F48] _newZeroingDataWithBytes:session_key length:0];
  }
  return session_key;
}

- (BOOL)isAuthenticated
{
  return ccsrp_is_authenticated();
}

- (ccsrp_ctx)context
{
  return self->_context;
}

- (void)setContext:(ccsrp_ctx *)a3
{
  self->_context = a3;
}

- (ccrng_state)rng
{
  return self->_rng;
}

- (void)setRng:(ccrng_state *)a3
{
  self->_rng = a3;
}

- (NSString)user
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUser:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)createWithUser:(id)a3 digestInfo:(const ccdigest_info *)a4 group:(ccdh_gp *)a5 randomSource:(ccrng_state *)a6
{
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithUser:v10 digestInfo:a4 group:a5 randomSource:a6];

  return v11;
}

@end