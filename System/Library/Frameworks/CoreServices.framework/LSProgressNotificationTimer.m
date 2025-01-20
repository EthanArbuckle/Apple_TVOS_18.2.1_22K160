@interface LSProgressNotificationTimer
- (LSProgressNotificationTimer)initWithQueue:(id)a3;
- (NSDate)lastFiredDate;
- (NSMutableSet)applications;
- (NSTimer)timer;
- (SEL)appObserverSelector;
- (double)latency;
- (double)minInterval;
- (id)description;
- (void)addApplication:(id)a3;
- (void)clear;
- (void)dealloc;
- (void)notifyObservers:(id)a3 withApplications:(id)a4;
- (void)removeApplication:(id)a3;
- (void)sendMessage:(id)a3;
- (void)setAppObserverSelector:(SEL)a3;
- (void)setApplications:(id)a3;
- (void)setLastFiredDate:(id)a3;
- (void)setTimer:(id)a3;
- (void)stopTimer;
@end

@implementation LSProgressNotificationTimer

- (LSProgressNotificationTimer)initWithQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LSProgressNotificationTimer;
  v6 = -[LSProgressNotificationTimer init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    timer = v6->_timer;
    v6->_timer = 0LL;

    uint64_t v9 = [objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:0];
    applications = v7->_applications;
    v7->_applications = (NSMutableSet *)v9;

    v11 = (NSDate *)objc_alloc_init(MEMORY[0x189603F50]);
    lastFiredDate = v7->_lastFiredDate;
    v7->_lastFiredDate = v11;

    *(_OWORD *)&v7->_minInterval = xmmword_183FBF690;
    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSProgressNotificationTimer;
  -[LSProgressNotificationTimer dealloc](&v3, sel_dealloc);
}

- (void)stopTimer
{
  uint64_t v3 = -[LSProgressNotificationTimer timer](self, "timer");
  if (v3)
  {
    v4 = (void *)v3;
    -[LSProgressNotificationTimer timer](self, "timer");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v5 isValid];

    if (v6)
    {
      -[NSTimer invalidate](self->_timer, "invalidate");
      -[LSProgressNotificationTimer setTimer:](self, "setTimer:", 0LL);
    }
  }

- (void)addApplication:(id)a3
{
  applications = self->_applications;
  [a3 bundleIdentifier];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](applications, "addObject:", v4);
}

- (void)removeApplication:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  applications = v4->_applications;
  [v13 bundleIdentifier];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(applications) = -[NSMutableSet containsObject:](applications, "containsObject:", v6);

  if ((_DWORD)applications)
  {
    v7 = v4->_applications;
    [v13 bundleIdentifier];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v7, "removeObject:", v8);

    -[LSProgressNotificationTimer applications](v4, "applications");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 count]
      || (-[LSProgressNotificationTimer timer](v4, "timer"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
    {
    }

    else
    {
      v11 = -[LSProgressNotificationTimer timer](v4, "timer");
      int v12 = [v11 isValid];

      if (v12) {
        MEMORY[0x186E2AFE0](-[LSProgressNotificationTimer stopTimer](v4, "stopTimer"));
      }
    }
  }

  objc_sync_exit(v4);
}

- (void)clear
{
}

- (void)notifyObservers:(id)a3 withApplications:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && [v7 count])
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          -[LSProgressNotificationTimer addApplication:]( v9,  "addApplication:",  *(void *)(*((void *)&v25 + 1) + 8 * v13++),  (void)v25);
        }

        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v11);
    }

    -[LSProgressNotificationTimer timer](v9, "timer");
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = v14 == 0LL;

    if (!v15) {
      goto LABEL_19;
    }
    MEMORY[0x186E2AFD4]();
    [MEMORY[0x189603F50] date];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[LSProgressNotificationTimer lastFiredDate](v9, "lastFiredDate");
    -[LSProgressNotificationTimer minInterval](v9, "minInterval");
    objc_msgSend(v17, "dateByAddingTimeInterval:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[LSProgressNotificationTimer minInterval](v9, "minInterval");
    objc_msgSend(v16, "dateByAddingTimeInterval:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v16 compare:v18];
    if (v20 == -1)
    {
      if ([v19 compare:v18] == -1)
      {
        id v21 = v19;
        goto LABEL_17;
      }
    }

    else if (v20 == 1)
    {
      -[LSProgressNotificationTimer latency](v9, "latency");
      objc_msgSend(v16, "dateByAddingTimeInterval:");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v22 = v21;

      goto LABEL_18;
    }

    v22 = v18;
LABEL_18:
    v23 = (void *)[objc_alloc(MEMORY[0x189604028]) initWithFireDate:v22 interval:v9 target:sel_sendMessage_ selector:v6 userInfo:0 repeats:0.0];
    -[LSProgressNotificationTimer setTimer:](v9, "setTimer:", v23);
    [MEMORY[0x189604008] mainRunLoop];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 addTimer:v23 forMode:*MEMORY[0x189603A40]];

LABEL_19:
    objc_sync_exit(v9);
  }
}

- (void)sendMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v18 = a3;
  _LSProgressLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSProgressNotificationTimer sendMessage:].cold.1(self, v4);
  }

  id v5 = self;
  objc_sync_enter(v5);
  -[LSProgressNotificationTimer timer](v5, "timer");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = v6 == 0LL;

  if (!v7)
  {
    [MEMORY[0x189603F50] date];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSProgressNotificationTimer setLastFiredDate:](v5, "setLastFiredDate:", v8);

    [v18 userInfo];
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
          uint64_t v13 = (void *)MEMORY[0x186E2A59C]();
          [v12 connection];
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1895F87A8];
          v20[1] = 3221225472LL;
          v20[2] = __43__LSProgressNotificationTimer_sendMessage___block_invoke;
          v20[3] = &unk_189D73308;
          v20[4] = v12;
          [v14 remoteObjectProxyWithErrorHandler:v20];
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[LSProgressNotificationTimer applications](v5, "applications");
          [v16 allObjects];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 applicationInstallsDidChange:v17];

          objc_autoreleasePoolPop(v13);
          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v9);
    }

    -[LSProgressNotificationTimer clear](v5, "clear");
    MEMORY[0x186E2AFE0](-[LSProgressNotificationTimer setTimer:](v5, "setTimer:", 0LL));
  }

  objc_sync_exit(v5);
}

void __43__LSProgressNotificationTimer_sendMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSProgressLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)description
{
  v2 = (void *)NSString;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LSProgressNotificationTimer;
  -[LSProgressNotificationTimer description](&v6, sel_description);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"<LSProgressNotificationTimer: %@>", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSDate)lastFiredDate
{
  return self->_lastFiredDate;
}

- (void)setLastFiredDate:(id)a3
{
}

- (NSMutableSet)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
}

- (double)minInterval
{
  return self->_minInterval;
}

- (double)latency
{
  return self->_latency;
}

- (SEL)appObserverSelector
{
  return self->_appObserverSelector;
}

- (void)setAppObserverSelector:(SEL)a3
{
  self->_appObserverSelector = a3;
}

- (void).cxx_destruct
{
}

- (void)sendMessage:(void *)a1 .cold.1(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 applications];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_183E58000, a2, v4, "sendMessage <applicationInstallsDidChange> timer fired with %@", v5);

  OUTLINED_FUNCTION_5_0();
}

@end