@interface AXAssetsXPCActivity
- (AXAssetsXPCActivity)initWithActivity:(id)a3;
- (BOOL)deferIfNeeded;
- (BOOL)shouldDefer;
- (BOOL)updateState:(int64_t)a3;
- (OS_xpc_object)activity;
- (id)_debugNameForXPCActivityState:(int64_t)a3;
- (id)description;
- (int64_t)state;
- (void)setActivity:(id)a3;
@end

@implementation AXAssetsXPCActivity

- (AXAssetsXPCActivity)initWithActivity:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXAssetsXPCActivity;
  v5 = -[AXAssetsXPCActivity init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[AXAssetsXPCActivity setActivity:](v5, "setActivity:", v4);
  }

  return v6;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[AXAssetsXPCActivity _debugNameForXPCActivityState:]( self,  "_debugNameForXPCActivityState:",  -[AXAssetsXPCActivity state](self, "state")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCActivity activity](self, "activity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCActivity activity](self, "activity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AXAssetsXPCActivity<%p> [State: %@] [xpc_activity_t<%p> %@]",  self,  v3,  v4,  v5));

  return v6;
}

- (int64_t)state
{
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCActivity activity](self, "activity"));
  xpc_activity_state_t state = xpc_activity_get_state(v2);

  return state;
}

- (BOOL)updateState:(int64_t)a3
{
  int64_t v5 = -[AXAssetsXPCActivity state](self, "state");
  v6 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCActivity activity](self, "activity"));
  BOOL v7 = xpc_activity_set_state(v6, a3);

  uint64_t v9 = AXLogAssetDaemon(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (!v7)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCActivity _debugNameForXPCActivityState:](self, "_debugNameForXPCActivityState:", v5));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCActivity _debugNameForXPCActivityState:](self, "_debugNameForXPCActivityState:", a3));
    int v15 = 138412802;
    v16 = v12;
    __int16 v17 = 2112;
    v18 = v13;
    __int16 v19 = 2112;
    v20 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "XPC Activity state change failed: '%@' -> '%@'. %@",  (uint8_t *)&v15,  0x20u);
    goto LABEL_4;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCActivity _debugNameForXPCActivityState:](self, "_debugNameForXPCActivityState:", v5));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCActivity _debugNameForXPCActivityState:](self, "_debugNameForXPCActivityState:", a3));
    int v15 = 138412802;
    v16 = v12;
    __int16 v17 = 2112;
    v18 = v13;
    __int16 v19 = 2112;
    v20 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "XPC Activity state change succeeded '%@' -> '%@'. %@",  (uint8_t *)&v15,  0x20u);
LABEL_4:
  }

- (BOOL)shouldDefer
{
  v3 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCActivity activity](self, "activity"));
  BOOL should_defer = xpc_activity_should_defer(v3);

  uint64_t v6 = AXLogAssetDaemon(v5);
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2048;
    BOOL v12 = should_defer;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asking if we should defer activity: %@. Defer: %ld",  (uint8_t *)&v9,  0x16u);
  }

  return should_defer;
}

- (BOOL)deferIfNeeded
{
  BOOL v3 = -[AXAssetsXPCActivity shouldDefer](self, "shouldDefer");
  if (v3) {
    LOBYTE(v3) = -[AXAssetsXPCActivity updateState:](self, "updateState:", 3LL);
  }
  return v3;
}

- (id)_debugNameForXPCActivityState:(int64_t)a3
{
  else {
    return *(&off_100020A90 + a3);
  }
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end