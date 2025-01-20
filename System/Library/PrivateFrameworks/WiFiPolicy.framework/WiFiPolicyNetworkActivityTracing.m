@interface WiFiPolicyNetworkActivityTracing
+ (id)sharedNetworkActivityTracing;
- (BOOL)hasActivitiesRunning;
- (WiFiPolicyNetworkActivityTracing)init;
- (void)_networkActivityActivate:(int64_t)a3;
- (void)_networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4;
- (void)_networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5;
- (void)_networkActivityStart:(int64_t)a3 activate:(BOOL)a4;
- (void)_networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7;
- (void)_networkActivityTracingCancel;
- (void)currentNetworkActivityTokenWithCompletion:(id)a3;
- (void)networkActivityActivate:(int64_t)a3;
- (void)networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4;
- (void)networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5;
- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4;
- (void)networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7;
- (void)networkActivityTracingCompleteConnectionsActivities;
@end

@implementation WiFiPolicyNetworkActivityTracing

+ (id)sharedNetworkActivityTracing
{
  if (sharedNetworkActivityTracing_sActivityTracerInitToken != -1) {
    dispatch_once(&sharedNetworkActivityTracing_sActivityTracerInitToken, &__block_literal_global_14);
  }
  return (id)sharedNetworkActivityTracing_sActivityTracer;
}

void __64__WiFiPolicyNetworkActivityTracing_sharedNetworkActivityTracing__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___WiFiPolicyNetworkActivityTracing);
  v1 = (void *)sharedNetworkActivityTracing_sActivityTracer;
  sharedNetworkActivityTracing_sActivityTracer = (uint64_t)v0;
}

- (WiFiPolicyNetworkActivityTracing)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___WiFiPolicyNetworkActivityTracing;
  v2 = -[WiFiPolicyNetworkActivityTracing init](&v12, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:11];
    activities = v2->_activities;
    v2->_activities = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:4];
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_t v9 = dispatch_queue_create("network.activity.tracing", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }

  return v2;
}

- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__WiFiPolicyNetworkActivityTracing_networkActivityStart_activate___block_invoke;
  block[3] = &unk_18A16D330;
  block[4] = self;
  block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(queue, block);
}

uint64_t __66__WiFiPolicyNetworkActivityTracing_networkActivityStart_activate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityStart:*(void *)(a1 + 40) activate:*(unsigned __int8 *)(a1 + 48)];
}

- (void)networkActivityActivate:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __60__WiFiPolicyNetworkActivityTracing_networkActivityActivate___block_invoke;
  v4[3] = &unk_18A16D6A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __60__WiFiPolicyNetworkActivityTracing_networkActivityActivate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityActivate:*(void *)(a1 + 40)];
}

- (void)networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  if (a3 == 1) {
    NSLog( @"%s: LinkTest %@",  "-[WiFiPolicyNetworkActivityTracing networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  @"linkTest");
  }
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __108__WiFiPolicyNetworkActivityTracing_networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke;
  block[3] = &unk_18A16E618;
  int v22 = a4;
  int64_t v20 = a3;
  v21 = a5;
  block[4] = self;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(queue, block);
}

uint64_t __108__WiFiPolicyNetworkActivityTracing_networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityStop:*(void *)(a1 + 56) withReason:*(unsigned int *)(a1 + 72) withClientMetric:*(void *)(a1 + 64) withClientDict:*(void *)(a1 + 40) andError:*(void *)(a1 + 48)];
}

- (void)networkActivityTracingCompleteConnectionsActivities
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __87__WiFiPolicyNetworkActivityTracing_networkActivityTracingCompleteConnectionsActivities__block_invoke;
  block[3] = &unk_18A16C770;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __87__WiFiPolicyNetworkActivityTracing_networkActivityTracingCompleteConnectionsActivities__block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityTracingCancel];
}

- (void)networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __87__WiFiPolicyNetworkActivityTracing_networkActivityAddNWConnection_toActivityWithLabel___block_invoke;
  block[3] = &unk_18A16C908;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __87__WiFiPolicyNetworkActivityTracing_networkActivityAddNWConnection_toActivityWithLabel___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityAddNWConnection:*(void *)(a1 + 40) toActivityWithLabel:*(void *)(a1 + 48)];
}

- (void)networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __103__WiFiPolicyNetworkActivityTracing_networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke;
  v13[3] = &unk_18A16E640;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __103__WiFiPolicyNetworkActivityTracing_networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityRemoveNWConnection:*(void *)(a1 + 40) fromActivityWithLabel:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)currentNetworkActivityTokenWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __78__WiFiPolicyNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke;
  v7[3] = &unk_18A16D150;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __78__WiFiPolicyNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  if (v2)
  {
    [v2 nwActivityToken];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }

  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
}

- (BOOL)hasActivitiesRunning
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __56__WiFiPolicyNetworkActivityTracing_hasActivitiesRunning__block_invoke;
  v5[3] = &unk_18A16E2A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__WiFiPolicyNetworkActivityTracing_hasActivitiesRunning__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (result) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  return result;
}

- (void)_networkActivityStart:(int64_t)a3 activate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  _labelDescription(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_activities, "objectForKey:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (a3 == 1)
    {
      id v11 = -[WiFiPolicyNetworkActivity initWithLabel:parent:]( objc_alloc(&OBJC_CLASS___WiFiPolicyNetworkActivity),  "initWithLabel:parent:",  1LL,  0LL);
      if (v11)
      {
LABEL_5:
        -[NSMutableDictionary setObject:forKey:](self->_activities, "setObject:forKey:", v11, v7);
        if (v4) {
          -[WiFiPolicyNetworkActivityTracing _networkActivityActivate:](self, "_networkActivityActivate:", a3);
        }
        if (-[NSMutableSet count](self->_connections, "count"))
        {
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          id v12 = self->_connections;
          uint64_t v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v25;
            do
            {
              for (uint64_t i = 0LL; i != v14; ++i)
              {
                if (*(void *)v25 != v15) {
                  objc_enumerationMutation(v12);
                }
                -[WiFiPolicyNetworkActivity addConnection:]( v11,  "addConnection:",  *(void *)(*((void *)&v24 + 1) + 8 * i));
              }

              uint64_t v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
            }

            while (v14);
          }
        }

        -[WiFiPolicyNetworkActivity setQueue:](v11, "setQueue:", self->_queue);
        v17 = v11;
        goto LABEL_23;
      }
    }

    else
    {
      -[NSMutableDictionary objectForKey:](self->_activities, "objectForKey:", @"linkTest");
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v19 = v18;
      if (v18)
      {
        [v18 nwActivity];
        int64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        id v11 = -[WiFiPolicyNetworkActivity initWithLabel:parent:]( objc_alloc(&OBJC_CLASS___WiFiPolicyNetworkActivity),  "initWithLabel:parent:",  a3,  v20);
      }

      else
      {
        id v11 = 0LL;
      }

      if (v11) {
        goto LABEL_5;
      }
    }

    if ([0 hasStarted])
    {
LABEL_24:
      _labelDescription(a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      activities = self->_activities;
      v23 = -[WiFiPolicyNetworkActivity description](v11, "description");
      NSLog( @"%s: Start activity with label %@ _activities %@ %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStart:activate:]",  v21,  activities,  v23);

      goto LABEL_25;
    }

    v17 = 0LL;
LABEL_23:
    -[WiFiPolicyNetworkActivity setHasStarted:](v17, "setHasStarted:", 1LL);
    goto LABEL_24;
  }

  _labelDescription(a3);
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 description];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog( @"%s: Failed to start Existing Activity with label %@, activityExists %@ _activities %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStart:activate:]",  v9,  v10,  self->_activities);

LABEL_25:
}

- (void)_networkActivityActivate:(int64_t)a3
{
  activities = self->_activities;
  _labelDescription(a3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activities, "objectForKey:", v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (!v9)
  {
    _labelDescription(a3);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Failed to find activity with label %@ _activities %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityActivate:]",  v8,  self->_activities);

    v7 = 0LL;
  }

  [v7 activate];
}

- (void)_networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 0;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = __Block_byref_object_copy__7;
  v42 = __Block_byref_object_dispose__7;
  [MEMORY[0x189603FA8] array];
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  activities = self->_activities;
  _labelDescription(a3);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activities, "objectForKey:", v15);
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  _labelDescription(a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    id v18 = self->_activities;
    [v16 description];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Stopping activity with label %@ _activities %@ %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  v17,  v18,  v19);
  }

  else
  {
    NSLog( @"%s: Failed to find activity with label %@ _activities %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  v17,  self->_activities);
  }

  if (a3 == 1)
  {
    _labelDescription(1uLL);
    int64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 description];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Stopping Parent Activity %@ %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  v20,  v21);

    int v22 = self->_activities;
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __109__WiFiPolicyNetworkActivityTracing__networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke;
    v29[3] = &unk_18A16E668;
    uint64_t v35 = 1LL;
    v36 = a5;
    id v30 = v12;
    id v31 = v16;
    int v37 = v9;
    id v32 = v13;
    v33 = &v44;
    v34 = &v38;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v29);
  }

  if ([v16 hasStarted])
  {
    if (a5 && v12)
    {
      _labelDescription(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: Stopping network activity %@ with completion %d clientMetric %s clientDict %@ and error: %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  v23,  v9,  a5,  v12,  v13);
    }

    else
    {
      _labelDescription(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: Stopping network activity %@ with completion %d and error: %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  v23,  v9,  v13);
    }

    [v16 setHasStarted:0];
    [v16 stopWithCompletionReason:v9 withClientMetric:a5 withClientDict:v12 andError:v13];
    *((_BYTE *)v45 + 24) = 1;
    if ([v16 getState] == 3)
    {
      _labelDescription(a3);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 description];
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: Will Remove Ended Activity %@ %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  v24,  v25);

      __int128 v26 = (void *)v39[5];
      _labelDescription(a3);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 addObject:v27];
    }
  }

  if (!*((_BYTE *)v45 + 24))
  {
    _labelDescription(a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Failed to stop activity with label %@ _activities %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  v28,  self->_activities);
  }

  if ([(id)v39[5] count])
  {
    -[NSMutableDictionary removeObjectsForKeys:](self->_activities, "removeObjectsForKeys:", v39[5]);
    NSLog( @"%s: There are %lu remaining activities _activities %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  -[NSMutableDictionary count](self->_activities, "count"),  self->_activities);
  }

  if (a3 == 1)
  {
    if (-[NSMutableDictionary count](self->_activities, "count")) {
      NSLog( @"%s: When stopping parent activity - there are %lu remaining activities _activities %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]",  -[NSMutableDictionary count](self->_activities, "count"),  self->_activities);
    }
    -[WiFiPolicyNetworkActivityTracing _networkActivityTracingCancel](self, "_networkActivityTracingCancel");
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
}

void __109__WiFiPolicyNetworkActivityTracing__networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v5 parentLabel] == *(void *)(a1 + 72) && objc_msgSend(v5, "hasStarted"))
  {
    if (*(void *)(a1 + 80) && *(void *)(a1 + 32))
    {
      [*(id *)(a1 + 40) description];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: Stopping network Child Activity %@ with coompletion %d clientMetric %s clientDict %@ and error: %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke",  v6,  *(unsigned int *)(a1 + 88),  *(void *)(a1 + 80),  *(void *)(a1 + 32),  *(void *)(a1 + 48));
    }

    else
    {
      [*(id *)(a1 + 40) description];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: Stopping network Child Activity %@ with coompletion %d and error: %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke",  v6,  *(unsigned int *)(a1 + 88),  *(void *)(a1 + 48));
    }

    [v5 setHasStarted:0];
    [v5 stopWithCompletionReason:*(unsigned int *)(a1 + 88) withClientMetric:*(void *)(a1 + 80) withClientDict:*(void *)(a1 + 32) andError:*(void *)(a1 + 48)];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    if ([v5 getState] == 3)
    {
      _labelDescription(*(void *)(a1 + 72));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) description];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: Will Remove Ended Child Activity %@ %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke",  v8,  v9);

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v10];
    }
  }

  else if ([v5 parentLabel] == *(void *)(a1 + 72) && (objc_msgSend(v5, "hasStarted") & 1) == 0)
  {
    [*(id *)(a1 + 40) description];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: Failed to stop network notStarted Child Activity %@ with coompletion %d and error: %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke",  v7,  *(unsigned int *)(a1 + 88),  *(void *)(a1 + 48));
  }
}

- (void)_networkActivityTracingCancel
{
}

void __65__WiFiPolicyNetworkActivityTracing__networkActivityTracingCancel__block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v3 = a3;
  unsigned int v4 = [v3 hasStarted];
  [v3 description];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  NSLog( @"%s: Failed to properly end activity: hasStarted %d %@",  "-[WiFiPolicyNetworkActivityTracing _networkActivityTracingCancel]_block_invoke",  v4,  v5);
}

- (void)_networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4
{
  id v7 = a3;
  if ((-[NSMutableSet containsObject:](self->_connections, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_connections, "addObject:", v7);
    activities = self->_activities;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __88__WiFiPolicyNetworkActivityTracing__networkActivityAddNWConnection_toActivityWithLabel___block_invoke;
    v8[3] = &unk_18A16E6D0;
    int64_t v10 = a4;
    id v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activities, "enumerateKeysAndObjectsUsingBlock:", v8);
  }
}

void __88__WiFiPolicyNetworkActivityTracing__networkActivityAddNWConnection_toActivityWithLabel___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v7 = a3;
  [v7 nwActivity];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  int label = nw_activity_get_label();
  uint64_t v6 = *(void *)(a1 + 40);

  if (v6 == label) {
    [v7 addConnection:*(void *)(a1 + 32)];
  }
}

- (void)_networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5
{
  id v10 = a3;
  uint64_t v8 = (void (**)(void))a5;
  if (-[NSMutableSet containsObject:](self->_connections, "containsObject:", v10))
  {
    -[NSMutableSet removeObject:](self->_connections, "removeObject:", v10);
    activities = self->_activities;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __104__WiFiPolicyNetworkActivityTracing__networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke;
    v11[3] = &unk_18A16E6D0;
    int64_t v13 = a4;
    id v12 = v10;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activities, "enumerateKeysAndObjectsUsingBlock:", v11);
  }

  if (v8) {
    v8[2](v8);
  }
}

void __104__WiFiPolicyNetworkActivityTracing__networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v7 = a3;
  [v7 nwActivity];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  int label = nw_activity_get_label();
  uint64_t v6 = *(void *)(a1 + 40);

  if (v6 == label) {
    [v7 removeConnection:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
}

@end