@interface SafeguardsClient
+ (void)initialize;
- (BOOL)featureEnabled;
- (BOOL)interrupted;
- (NSXPCConnection)connection;
- (SafeguardsClient)init;
- (void)setConnection:(id)a3;
- (void)setFeatureEnabled:(BOOL)a3;
- (void)setInterrupted:(BOOL)a3;
@end

@implementation SafeguardsClient

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.computesafeguards", "safeguardsclient");
  v3 = (void *)logger;
  logger = (uint64_t)v2;
}

- (SafeguardsClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SafeguardsClient;
  os_log_t v2 = -[SafeguardsClient init](&v9, sel_init);
  os_log_t v3 = os_log_create("com.apple.computesafeguards", "safeguardsclient");
  v4 = (void *)logger;
  logger = (uint64_t)v3;

  if (v2)
  {
    char v5 = _os_feature_enabled_impl();
    v2->_featureEnabled = v5;
    if ((v5 & 1) == 0)
    {
      v6 = (os_log_s *)logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl( &dword_186654000,  v6,  OS_LOG_TYPE_INFO,  "Not setting up connection as feature is not enabled.",  v8,  2u);
      }
    }
  }

  return v2;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (BOOL)featureEnabled
{
  return self->_featureEnabled;
}

- (void)setFeatureEnabled:(BOOL)a3
{
  self->_featureEnabled = a3;
}

- (void).cxx_destruct
{
}

@end