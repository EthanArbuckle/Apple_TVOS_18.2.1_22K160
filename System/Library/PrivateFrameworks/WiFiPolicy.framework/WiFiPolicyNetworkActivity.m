@interface WiFiPolicyNetworkActivity
- (BOOL)hasStarted;
- (WiFiPolicyNetworkActivity)initWithLabel:(int64_t)a3 parent:(id)a4;
- (id)description;
- (id)nwActivity;
- (id)nwActivityToken;
- (int64_t)getState;
- (int64_t)parentLabel;
- (void)_cancelActivityTimer;
- (void)_networkActivityState:(int64_t)a3;
- (void)_startActivityTimer;
- (void)_startMaxActivityLifetime;
- (void)activate;
- (void)addConnection:(id)a3;
- (void)removeConnection:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)stopWithCompletionReason:(int)a3 withClientMetric:(const char *)a4 withClientDict:(id)a5 andError:(id)a6;
@end

@implementation WiFiPolicyNetworkActivity

- (WiFiPolicyNetworkActivity)initWithLabel:(int64_t)a3 parent:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___WiFiPolicyNetworkActivity;
  v8 = -[WiFiPolicyNetworkActivity init](&v15, sel_init);
  if (v8)
  {
    if (a3)
    {
      _labelDescription(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: Creating activity label: %@ hasParent %d",  "-[WiFiPolicyNetworkActivity initWithLabel:parent:]",  v9,  v7 != 0LL);

      uint64_t v10 = nw_activity_create();
      if (v7)
      {
        nw_activity_set_parent_activity();
        v8->_parentLabel = nw_activity_get_label();
        objc_storeStrong((id *)&v8->_parentActivity, a4);
      }

      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
      connections = v8->_connections;
      v8->_connections = v11;

      activity = v8->_activity;
      v8->_activity = (OS_nw_activity *)v10;
    }

    v8->_state = 0LL;
    v8->_hasStarted = 0;
  }

  return v8;
}

- (void)activate
{
  if (self->_state <= 0)
  {
    -[WiFiPolicyNetworkActivity _networkActivityState:](self, "_networkActivityState:", 1LL);
    if (self->_state == 1)
    {
      NSLog(@"%s: Activating activity", "-[WiFiPolicyNetworkActivity activate]");
      nw_activity_activate();
      return;
    }

    -[OS_nw_activity description](self->_activity, "description");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Failed to activate %@ bad _state %ld",  "-[WiFiPolicyNetworkActivity activate]",  v3,  self->_state);
  }

  else
  {
    -[OS_nw_activity description](self->_activity, "description");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Failed to activate %@ incorrect _state %ld",  "-[WiFiPolicyNetworkActivity activate]",  v3,  self->_state);
  }
}

- (void)addConnection:(id)a3
{
  id v5 = a3;
  int64_t state = self->_state;
  if (state > 1)
  {
    if (state == 2)
    {
LABEL_6:
      NSLog(@"%s: Starting activity", "-[WiFiPolicyNetworkActivity addConnection:]");
      nw_connection_start_activity();
      -[NSMutableSet addObject:](self->_connections, "addObject:", v5);
      goto LABEL_7;
    }

    NSLog( @"%s: Failed to addConnection. Activity %@ has _state %ld",  "-[WiFiPolicyNetworkActivity addConnection:]",  self->_activity,  state);
  }

  else
  {
    NSLog( @"%s: Activity has _state %ld, moving to WiFiPolicyNetworkActivityTracingStarted",  "-[WiFiPolicyNetworkActivity addConnection:]",  state);
    -[WiFiPolicyNetworkActivity _networkActivityState:](self, "_networkActivityState:", 2LL);
  }

  if (self->_state == 2) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)removeConnection:(id)a3
{
  id v5 = a3;
  int64_t state = self->_state;
  if (state == 2)
  {
    NSLog(@"%s: Ending activity due to remove", "-[WiFiPolicyNetworkActivity removeConnection:]");
    nw_connection_end_activity();
    -[NSMutableSet removeObject:](self->_connections, "removeObject:", v5);
  }

  else
  {
    NSLog( @"%s: Failed to removeConnection. Activity %@ has _state %ld",  "-[WiFiPolicyNetworkActivity removeConnection:]",  self->_activity,  state);
  }
}

- (void)stopWithCompletionReason:(int)a3 withClientMetric:(const char *)a4 withClientDict:(id)a5 andError:(id)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  id v10 = a6;
  if (a4 && v9)
  {
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke;
    v27[3] = &unk_18A16E6F8;
    id v28 = v11;
    id v12 = v11;
    [v9 enumerateKeysAndObjectsUsingBlock:v27];
    NSLog( @"%s: Adding Client Metrics %s: %@",  "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]",  a4,  v9);
    nw_activity_submit_metrics();
  }

  -[WiFiPolicyNetworkActivity _networkActivityState:](self, "_networkActivityState:", 3LL);
  if (-[NSMutableSet count](self->_connections, "count"))
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v13 = self->_connections;
    uint64_t v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v23,  v29,  16LL);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          NSLog( @"%s: Ending activity with connection",  "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]");
          nw_connection_end_activity();
          ++v17;
        }

        while (v15 != v17);
        uint64_t v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v23,  v29,  16LL);
      }

      while (v15);
    }
  }

  if (v10)
  {
    uint64_t v18 = [v10 code];
    [v10 userInfo];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      [v10 userInfo];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 objectForKey:*MEMORY[0x189607798]];
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21) {
        uint64_t v22 = [v21 code];
      }
      else {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
    }

    else
    {
      uint64_t v22 = 0xFFFFFFFFLL;
    }

    NSLog( @"%s: Reporting to nw_activity that WiFiPolicyNetworkActivity failed with error code %d and underlying error code %d",  "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]",  v18,  v22);
    nw_activity_complete_with_reason_and_underlying_error();
  }

  else
  {
    nw_activity_complete_with_reason();
  }
}

void __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    id v7 = v11;
    id v8 = v5;
    id v9 = (const char *)[v7 UTF8String];
    [v8 doubleValue];
    xpc_dictionary_set_double(v6, v9, v10);
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke_cold_1( (uint64_t)v11,  (uint64_t)v5);
    }
    xpc_dictionary_set_string( *(xpc_object_t *)(a1 + 32), (const char *)[v11 UTF8String], (const char *)objc_msgSend(v5, "UTF8String"));
  }
}

- (void)_startMaxActivityLifetime
{
  id v3 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_queue);
  dispatch_time_t v4 = dispatch_time(0LL, 100000000000LL);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __54__WiFiPolicyNetworkActivity__startMaxActivityLifetime__block_invoke;
  handler[3] = &unk_18A16C908;
  uint64_t v11 = 100LL;
  id v5 = v3;
  id v9 = v5;
  double v10 = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  activityTimer = self->_activityTimer;
  self->_activityTimer = (OS_dispatch_source *)v5;
  id v7 = v5;
}

void __54__WiFiPolicyNetworkActivity__startMaxActivityLifetime__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == *(void **)(v3 + 56))
  {
    *(void *)(v3 + 56) = 0LL;
  }

  id v6 = (id)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.wifi.policy.nwactivity" code:1 userInfo:0];
  [*(id *)(a1 + 40) description];
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s: Cancelling activity due to timeout %@",  "-[WiFiPolicyNetworkActivity _startMaxActivityLifetime]_block_invoke",  v4);

  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 networkActivityStop:nw_activity_get_label() withReason:4 withClientMetric:0 withClientDict:0 andError:v6];
}

- (void)_startActivityTimer
{
}

- (void)_cancelActivityTimer
{
  activityTimer = self->_activityTimer;
  if (activityTimer)
  {
    dispatch_source_cancel((dispatch_source_t)activityTimer);
    dispatch_time_t v4 = self->_activityTimer;
    self->_activityTimer = 0LL;
  }

- (id)nwActivity
{
  return self->_activity;
}

- (id)nwActivityToken
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  nw_activity_get_token();
  if (uuid_is_null(uu)) {
    return 0LL;
  }
  else {
    return (id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uu];
  }
}

- (int64_t)parentLabel
{
  return self->_parentLabel;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
  if (a3) {
    -[WiFiPolicyNetworkActivity _startActivityTimer](self, "_startActivityTimer");
  }
  else {
    -[WiFiPolicyNetworkActivity _cancelActivityTimer](self, "_cancelActivityTimer");
  }
}

- (void)setQueue:(id)a3
{
}

- (int64_t)getState
{
  return self->_state;
}

- (id)description
{
  parentActivity = self->_parentActivity;
  uint64_t v4 = (void *)NSString;
  uint64_t domain = nw_activity_get_domain();
  uint64_t label = nw_activity_get_label();
  uint64_t v7 = -[WiFiPolicyNetworkActivity nwActivityToken](self, "nwActivityToken");
  id v8 = (void *)v7;
  if (parentActivity)
  {
    uint64_t v9 = nw_activity_get_domain();
    uint64_t v10 = nw_activity_get_label();
    -[OS_nw_activity description](self->_parentActivity, "description");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"nw_activity %d:%d[%@] parent nw_activity %d:%d[%@]", domain, label, v8, v9, v10, v11];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v13 = (id)[v4 stringWithFormat:@"nw_activity %d:%d[%@]", domain, label, v7];
    id v12 = 0LL;
  }

  return v12;
}

- (void)_networkActivityState:(int64_t)a3
{
  int64_t v3 = a3;
  switch(self->_state)
  {
    case 0LL:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
        int64_t v3 = 0LL;
      }
      break;
    case 1LL:
      if (!a3) {
        goto LABEL_8;
      }
      break;
    case 2LL:
      if ((unint64_t)a3 >= 2)
      {
        if (a3 == 2)
        {
          -[WiFiPolicyNetworkActivity _networkActivityRestart](self, "_networkActivityRestart");
          int64_t v3 = 0LL;
        }
      }

      else
      {
LABEL_8:
        -[WiFiPolicyNetworkActivity _networkActivityAbort](self, "_networkActivityAbort");
      }

      break;
    case 3LL:
      break;
    default:
      break;
  }

  self->_int64_t state = v3;
}

- (void).cxx_destruct
{
}

void __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
}

@end