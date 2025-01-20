@interface DAHIDEventMonitor
+ (id)sharedInstance;
- (BOOL)currentlyMonitoring;
- (BOOL)findServiceClientForHIDEvent:(id)a3;
- (BOOL)serviceClientSetPropertyValue:(void *)a3 forKey:(__CFString *)a4 forHIDEvent:(unint64_t)a5;
- (BOOL)startMonitoringWithHIDEvents:(id)a3;
- (BOOL)systemClientSetupWithHIDEvents:(id)a3;
- (DAHIDEventMonitor)init;
- (DAHIDEventMonitorDelegate)delegate;
- (NSMutableArray)HIDEvents;
- (OS_dispatch_queue)mHIDEventQueue;
- (__IOHIDEventSystemClient)HIDSystemClient;
- (void)cleanUpSystemClient;
- (void)setCurrentlyMonitoring:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHIDEvents:(id)a3;
- (void)setHIDSystemClient:(__IOHIDEventSystemClient *)a3;
- (void)setMHIDEventQueue:(id)a3;
- (void)stopMonitoring;
@end

@implementation DAHIDEventMonitor

- (DAHIDEventMonitor)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___DAHIDEventMonitor;
  v2 = -[DAHIDEventMonitor init](&v22, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 8LL));
    HIDEvents = v2->_HIDEvents;
    v2->_HIDEvents = (NSMutableArray *)v3;

    v37[0] = @"usagePage";
    v37[1] = @"usage";
    v38[0] = &off_100008408;
    v38[1] = &off_100008420;
    v37[2] = @"needServiceClient";
    v38[2] = &__kCFBooleanTrue;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));
    id v6 = [v5 mutableCopy];
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v6, 0LL);

    v35[0] = @"usagePage";
    v35[1] = @"usage";
    v36[0] = &off_100008408;
    v36[1] = &off_100008438;
    v35[2] = @"needServiceClient";
    v36[2] = &__kCFBooleanTrue;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  3LL));
    id v8 = [v7 mutableCopy];
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v8, 1LL);

    v33[0] = @"usagePage";
    v33[1] = @"usage";
    v34[0] = &off_100008450;
    v34[1] = &off_100008468;
    v33[2] = @"needServiceClient";
    v34[2] = &__kCFBooleanFalse;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
    id v10 = [v9 mutableCopy];
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v10, 2LL);

    v31[0] = @"usagePage";
    v31[1] = @"usage";
    v32[0] = &off_100008480;
    v32[1] = &off_100008498;
    v31[2] = @"needServiceClient";
    v32[2] = &__kCFBooleanFalse;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
    id v12 = [v11 mutableCopy];
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v12, 3LL);

    v29[0] = @"usagePage";
    v29[1] = @"usage";
    v30[0] = &off_100008408;
    v30[1] = &off_1000084B0;
    v29[2] = @"needServiceClient";
    v30[2] = &__kCFBooleanTrue;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
    id v14 = [v13 mutableCopy];
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v14, 4LL);

    v27[0] = @"usagePage";
    v27[1] = @"usage";
    v28[0] = &off_1000084C8;
    v28[1] = &off_1000084E0;
    v27[2] = @"needServiceClient";
    v28[2] = &__kCFBooleanTrue;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));
    id v16 = [v15 mutableCopy];
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v16, 5LL);

    v25[0] = @"usagePage";
    v25[1] = @"usage";
    v26[0] = &off_100008408;
    v26[1] = &off_100008468;
    v25[2] = @"needServiceClient";
    v26[2] = &__kCFBooleanTrue;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));
    id v18 = [v17 mutableCopy];
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v18, 6LL);

    v23[0] = @"usagePage";
    v23[1] = @"usage";
    v24[0] = &off_100008408;
    v24[1] = &off_1000084F8;
    v23[2] = @"needServiceClient";
    v24[2] = &__kCFBooleanFalse;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  3LL));
    id v20 = [v19 mutableCopy];
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v20, 7LL);

    v2->_currentlyMonitoring = 0;
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_10000CAA0 != -1) {
    dispatch_once(&qword_10000CAA0, &stru_100008258);
  }
  return (id)qword_10000CA98;
}

- (BOOL)systemClientSetupWithHIDEvents:(id)a3
{
  id v4 = a3;
  if (-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      id v24 = v4;
      uint64_t v9 = *(void *)v26;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v12 = [v11 unsignedIntegerValue];
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](self, "HIDEvents"));
          id v14 = [v13 count];

          if (v12 >= v14)
          {
            uint64_t v21 = DiagnosticLogHandleForCategory(3LL);
            objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_100006484();
            }

            id v4 = v24;
            goto LABEL_14;
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](self, "HIDEvents"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue")));

          v29[0] = @"PrimaryUsagePage";
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"usagePage"]);
          v29[1] = @"PrimaryUsage";
          v30[0] = v17;
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"usage"]);
          v30[1] = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
          [v5 addObject:v19];
        }

        id v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }

      IOHIDEventSystemClientSetMatchingMultiple(-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"), v5);
      BOOL v20 = 1;
      id v4 = v24;
    }

    else
    {
LABEL_14:

      BOOL v20 = 0;
    }
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)findServiceClientForHIDEvent:(id)a3
{
  id v4 = a3;
  v5 = IOHIDEventSystemClientCopyServices(-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"));
  if (v5)
  {
    id v6 = v5;
    if (CFArrayGetCount(v5) < 1)
    {
      CFRelease(v6);
    }

    else
    {
      CFIndex v7 = 0LL;
      char v19 = 0;
      do
      {
        ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v6, v7);
        uint64_t v9 = (void *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"PrimaryUsage");
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](self, "HIDEvents"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v4, "unsignedIntegerValue")));

        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"usage"]);
        id v13 = [v12 unsignedIntegerValue];

        if (v9 && [v9 unsignedIntegerValue] == v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", ValueAtIndex));
          [v11 setObject:v14 forKeyedSubscript:@"HIDServiceClient"];

          char v19 = 1;
        }

        ++v7;
      }

      while (CFArrayGetCount(v6) > v7);
      CFRelease(v6);
      if ((v19 & 1) != 0)
      {
        BOOL v15 = 1;
        goto LABEL_14;
      }
    }
  }

  uint64_t v16 = DiagnosticLogHandleForCategory(3LL);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1000064B0();
  }

  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)serviceClientSetPropertyValue:(void *)a3 forKey:(__CFString *)a4 forHIDEvent:(unint64_t)a5
{
  uint64_t v14 = 0LL;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](self, "mHIDEventQueue"));

  if (v9)
  {
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](self, "mHIDEventQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005494;
    block[3] = &unk_100008280;
    block[4] = self;
    block[5] = &v14;
    block[6] = a5;
    block[7] = a4;
    block[8] = a3;
    dispatch_sync(v10, block);
  }

  char v11 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (BOOL)startMonitoringWithHIDEvents:(id)a3
{
  id v4 = a3;
  -[DAHIDEventMonitor setHIDSystemClient:]( self,  "setHIDSystemClient:",  IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1LL, 0LL));
  if (!-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"))
  {
    uint64_t v18 = DiagnosticLogHandleForCategory(3LL);
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100006508();
    }

    CFRelease(-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"));
    goto LABEL_25;
  }

  v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = -[DAHIDEventMonitor currentlyMonitoring](v5, "currentlyMonitoring");
  objc_sync_exit(v5);

  if ((v6 & 1) != 0)
  {
LABEL_25:
    BOOL v20 = 0;
    goto LABEL_35;
  }

  id v30 = v4;
  if (!-[DAHIDEventMonitor systemClientSetupWithHIDEvents:](v5, "systemClientSetupWithHIDEvents:", v4))
  {
    uint64_t v21 = DiagnosticLogHandleForCategory(3LL);
    objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000065A8();
    }

    goto LABEL_29;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v8)
  {

    goto LABEL_33;
  }

  uint64_t v9 = *(void *)v35;
  char v31 = 1;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(v7);
      }
      char v11 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](v5, "HIDEvents"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue")));

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"needServiceClient"]);
      if ([v14 BOOLValue])
      {
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"HIDServiceClient"]);
        BOOL v16 = v15 == 0LL;

        if (!v16) {
          goto LABEL_18;
        }
        if ((v31 & 1) != 0
          && -[DAHIDEventMonitor findServiceClientForHIDEvent:](v5, "findServiceClientForHIDEvent:", v11))
        {
          char v31 = 1;
          goto LABEL_18;
        }

        uint64_t v17 = DiagnosticLogHandleForCategory(3LL);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
          sub_10000656C(&buf, v33, (os_log_t)v14);
        }
        char v31 = 0;
      }

LABEL_18:
    }

    id v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  }

  while (v8);

  if ((v31 & 1) != 0)
  {
LABEL_33:
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.Diagnostics.hideventmonitor", 0LL);
    -[DAHIDEventMonitor setMHIDEventQueue:](v5, "setMHIDEventQueue:", v25);

    __int128 v26 = -[DAHIDEventMonitor HIDSystemClient](v5, "HIDSystemClient");
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](v5, "mHIDEventQueue"));
    IOHIDEventSystemClientScheduleWithDispatchQueue(v26, v27);

    IOHIDEventSystemClientRegisterEventFilterCallback( -[DAHIDEventMonitor HIDSystemClient](v5, "HIDSystemClient"),  _HIDEventFilterCallback,  v5,  v5);
    __int128 v28 = v5;
    objc_sync_enter(v28);
    -[DAHIDEventMonitor setCurrentlyMonitoring:](v28, "setCurrentlyMonitoring:", 1LL);
    objc_sync_exit(v28);

    BOOL v20 = 1;
    goto LABEL_34;
  }

- (void)stopMonitoring
{
  v2 = self;
  objc_sync_enter(v2);
  -[DAHIDEventMonitor setCurrentlyMonitoring:](v2, "setCurrentlyMonitoring:", 0LL);
  objc_sync_exit(v2);

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](v2, "mHIDEventQueue"));
  if (v3)
  {
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](v2, "mHIDEventQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005AF8;
    block[3] = &unk_1000082A8;
    block[4] = v2;
    dispatch_sync(v4, block);
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](v2, "HIDEvents", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) removeObjectForKey:@"HIDServiceClient"];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }

    while (v6);
  }
}

- (void)cleanUpSystemClient
{
  uint64_t v3 = -[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient");
  if (v3)
  {
    id v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](self, "mHIDEventQueue"));

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](self, "mHIDEventQueue"));
      IOHIDEventSystemClientUnscheduleFromDispatchQueue(v4, v6);
    }

    IOHIDEventSystemClientUnregisterEventFilterCallback(v4, _HIDEventFilterCallback, self, self);
    CFRelease(v4);
    -[DAHIDEventMonitor setHIDSystemClient:](self, "setHIDSystemClient:", 0LL);
  }

- (DAHIDEventMonitorDelegate)delegate
{
  return (DAHIDEventMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)currentlyMonitoring
{
  return self->_currentlyMonitoring;
}

- (void)setCurrentlyMonitoring:(BOOL)a3
{
  self->_currentlyMonitoring = a3;
}

- (OS_dispatch_queue)mHIDEventQueue
{
  return self->_mHIDEventQueue;
}

- (void)setMHIDEventQueue:(id)a3
{
}

- (NSMutableArray)HIDEvents
{
  return self->_HIDEvents;
}

- (void)setHIDEvents:(id)a3
{
}

- (__IOHIDEventSystemClient)HIDSystemClient
{
  return self->_HIDSystemClient;
}

- (void)setHIDSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_HIDSystemClient = a3;
}

- (void).cxx_destruct
{
}

@end