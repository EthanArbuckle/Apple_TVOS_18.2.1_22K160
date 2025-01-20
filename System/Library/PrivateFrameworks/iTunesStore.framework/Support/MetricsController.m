@interface MetricsController
+ (id)sharedInstance;
- (BOOL)_hasEntitlements:(id)a3;
- (MetricsController)init;
- (id)_operationQueue;
- (void)_cancelBackoffRetry;
- (void)_cancelBackoffRetryTimer;
- (void)_reportEvents;
- (void)_reportEventsIfNeeded;
- (void)_scheduleBackoffRetry;
- (void)_sendUnentitledResponseToMessage:(id)a3 connection:(id)a4;
- (void)configureDuet;
- (void)dealloc;
- (void)getInternalSettingsWithMessage:(id)a3 connection:(id)a4;
- (void)insertEventWithMessage:(id)a3 connection:(id)a4;
- (void)observeXPCServer:(id)a3;
- (void)recordAnalyticsWithMetricsDialogEvent:(id)a3 forTopic:(id)a4;
- (void)recordAnalyticsWithMetricsDialogEventWithMessage:(id)a3 connection:(id)a4;
- (void)reportEventsWithMessage:(id)a3 connection:(id)a4;
- (void)setInternalSettingsWithMessage:(id)a3 connection:(id)a4;
@end

@implementation MetricsController

- (MetricsController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MetricsController;
  v2 = -[MetricsController init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.MetricsController", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___SSMetricsEventController);
    eventController = v2->_eventController;
    v2->_eventController = v5;

    v7 = objc_autoreleasePoolPush();
    id v8 = [[SSMetricsConfiguration alloc] initWithGlobalConfiguration:&off_10036E4B0];
    -[SSMetricsEventController setGlobalConfiguration:](v2->_eventController, "setGlobalConfiguration:", v8);

    objc_autoreleasePoolPop(v7);
    -[MetricsController configureDuet](v2, "configureDuet");
  }

  return v2;
}

- (void)dealloc
{
  backoffRetryTimer = self->_backoffRetryTimer;
  if (backoffRetryTimer) {
    dispatch_source_cancel((dispatch_source_t)backoffRetryTimer);
  }
  if (self->_operationQueue)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v4 removeKeepAliveOperationQueue:self->_operationQueue];

    -[ISOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MetricsController;
  -[MetricsController dealloc](&v5, "dealloc");
}

+ (id)sharedInstance
{
  if (qword_1003A34E8 != -1) {
    dispatch_once(&qword_1003A34E8, &stru_10034F6C0);
  }
  return (id)qword_1003A34E0;
}

- (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self selector:"getInternalSettingsWithMessage:connection:" forMessage:128];
  [v4 addObserver:self selector:"insertEventWithMessage:connection:" forMessage:110];
  [v4 addObserver:self selector:"reportEventsWithMessage:connection:" forMessage:114];
  [v4 addObserver:self selector:"recordAnalyticsWithMetricsDialogEventWithMessage:connection:" forMessage:197];
  [v4 addObserver:self selector:"setInternalSettingsWithMessage:connection:" forMessage:129];
}

- (void)recordAnalyticsWithMetricsDialogEvent:(id)a3 forTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    objc_super v10 = (AnalyticsRecordingOperation *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedDaemonConfig]( &OBJC_CLASS___SSLogConfig,  "sharedDaemonConfig"));
    if (!v10) {
      objc_super v10 = (AnalyticsRecordingOperation *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = -[AnalyticsRecordingOperation shouldLog](v10, "shouldLog");
    else {
      LODWORD(v13) = v12;
    }
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AnalyticsRecordingOperation OSLogObject](v10, "OSLogObject"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class(self);
      id v15 = v19;
      v16 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  16LL,  "%{public}@: Operation failed with no dialog event to report",  &v18,  12);

      if (!v16) {
        goto LABEL_17;
      }
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
      free(v16);
      SSFileLog(v10, @"%@");
    }

    goto LABEL_17;
  }

  id v8 = objc_alloc(&OBJC_CLASS___AnalyticsRecordingOperation);
  id v17 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  objc_super v10 = -[AnalyticsRecordingOperation initWithMetricsEvents:](v8, "initWithMetricsEvents:", v9);

  if (v7) {
    -[AnalyticsRecordingOperation setEventTopicOverride:](v10, "setEventTopicOverride:", v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v11 addOperation:v10];

LABEL_17:
}

- (void)configureDuet
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012FB34;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)getInternalSettingsWithMessage:(id)a3 connection:(id)a4
{
  connection = (_xpc_connection_s *)a4;
  id v6 = a3;
  if (-[MetricsController _hasEntitlements:](self, "_hasEntitlements:", connection))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);

    id v8 = (__CFString *)SSVMetricsInternalSettingReportingFrequency;
    v9 = (const __CFString *)kSSUserDefaultsIdentifier;
    CFPreferencesAppSynchronize(kSSUserDefaultsIdentifier);
    CFPropertyListRef v10 = CFPreferencesCopyAppValue(v8, v9);
    if (v10)
    {
      v11 = v10;
      SSXPCDictionarySetCFObject(reply, -[__CFString UTF8String](v8, "UTF8String"), v10);
      CFRelease(v11);
    }

    xpc_connection_send_message(connection, reply);
  }

  else
  {
    -[MetricsController _sendUnentitledResponseToMessage:connection:]( self,  "_sendUnentitledResponseToMessage:connection:",  v6,  connection);
    xpc_object_t reply = v6;
  }
}

- (void)insertEventWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  if (!-[MetricsController _hasEntitlements:](self, "_hasEntitlements:", v7))
  {
    -[MetricsController _sendUnentitledResponseToMessage:connection:]( self,  "_sendUnentitledResponseToMessage:connection:",  v6,  v7);
    goto LABEL_22;
  }

  id v8 = (void *)SSXPCConnectionCopyClientIdentifier(v7, &v28);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
  CFPropertyListRef v10 = (void *)SSXPCDictionaryCopyObjectWithClass(v6, "1", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v12 = [v11 shouldLog];
  else {
    LODWORD(v13) = v12;
  }
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    uint64_t v13 = v13;
  }
  else {
    v13 &= 2u;
  }
  if (!(_DWORD)v13) {
    goto LABEL_13;
  }
  id v15 = (void *)objc_opt_class(self);
  id v16 = v15;
  unsigned int v17 = [v10 count];
  int v29 = 138412802;
  v30 = v15;
  __int16 v31 = 1024;
  unsigned int v32 = v17;
  __int16 v33 = 2112;
  v34 = v8;
  int v18 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  1LL,  "[%@] Insert Events received through XPC: %d requested by [%@]",  &v29,  28);

  if (v18)
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
    free(v18);
    v26 = v14;
    SSFileLog(v11, @"%@");
LABEL_13:
  }

  eventController = self->_eventController;
  id v27 = 0LL;
  unsigned __int8 v20 = -[SSMetricsEventController insertEventSummaries:error:]( eventController,  "insertEventSummaries:error:",  v10,  &v27);
  id v21 = v27;
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  if ((v20 & 1) != 0)
  {
    uint64_t v23 = 0LL;
  }

  else
  {
    if (v21)
    {
      uint64_t v23 = (uint64_t)[v21 code];
    }

    else
    {
      uint64_t v23 = 100LL;
      uint64_t v24 = SSError(SSErrorDomain, 100LL, 0LL, 0LL);
      id v21 = (id)objc_claimAutoreleasedReturnValue(v24);
    }

    SSXPCDictionarySetObject(reply, "1", v21);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23, v26));
  SSXPCDictionarySetObject(reply, "0", v25);

  xpc_connection_send_message(v7, reply);
LABEL_22:
}

- (void)recordAnalyticsWithMetricsDialogEventWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  if (-[MetricsController _hasEntitlements:](self, "_hasEntitlements:", v7))
  {
    id v8 = objc_alloc(&OBJC_CLASS___SSMetricsDialogEvent);
    xpc_object_t value = xpc_dictionary_get_value(v6, "1");
    CFPropertyListRef v10 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v11 = [v8 initWithXPCEncoding:v10];

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v13 = (void *)SSXPCDictionaryCopyObjectWithClass(v6, "2", v12);
    if (v11)
    {
      v14 = objc_alloc(&OBJC_CLASS___AnalyticsRecordingOperation);
      id v26 = v11;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
      id v16 = -[AnalyticsRecordingOperation initWithMetricsEvents:](v14, "initWithMetricsEvents:", v15);

      if (v13) {
        -[AnalyticsRecordingOperation setEventTopicOverride:](v16, "setEventTopicOverride:", v13);
      }
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
      [v17 addOperation:v16];

      goto LABEL_19;
    }

    id v16 = (AnalyticsRecordingOperation *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedDaemonConfig]( &OBJC_CLASS___SSLogConfig,  "sharedDaemonConfig"));
    if (!v16) {
      id v16 = (AnalyticsRecordingOperation *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v18 = -[AnalyticsRecordingOperation shouldLog](v16, "shouldLog");
    else {
      LODWORD(v19) = v18;
    }
    unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AnalyticsRecordingOperation OSLogObject](v16, "OSLogObject"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      int v24 = 138543362;
      id v25 = (id)objc_opt_class(self);
      id v21 = v25;
      v22 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  16LL,  "%{public}@: Failed to find metrics dialog event",  &v24,  12);

      if (!v22)
      {
LABEL_19:

        xpc_object_t reply = xpc_dictionary_create_reply(v6);
        xpc_dictionary_set_BOOL(reply, "0", v11 != 0LL);
        xpc_connection_send_message(v7, reply);

        goto LABEL_20;
      }

      unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      SSFileLog(v16, @"%@");
    }

    goto LABEL_19;
  }

  -[MetricsController _sendUnentitledResponseToMessage:connection:]( self,  "_sendUnentitledResponseToMessage:connection:",  v6,  v7);
LABEL_20:
}

- (void)reportEventsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  if (-[MetricsController _hasEntitlements:](self, "_hasEntitlements:", v7))
  {
    id v8 = (void *)SSXPCConnectionCopyClientIdentifier(v7, &v27);
    backoffRetryTimer = self->_backoffRetryTimer;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    id v11 = (void *)v10;
    if (backoffRetryTimer)
    {
      if (!v10) {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v12 = [v11 shouldLog];
      else {
        LODWORD(v13) = v12;
      }
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v13 = v13;
      }
      else {
        v13 &= 2u;
      }
      if ((_DWORD)v13)
      {
        id v15 = (void *)objc_opt_class(self);
        int v28 = 138412546;
        int v29 = v15;
        __int16 v30 = 2112;
        __int16 v31 = v8;
        id v16 = v15;
        unsigned int v17 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[%@] Ignore report event for request during backoff for client: %@",  &v28,  22);

        if (!v17)
        {
LABEL_15:

LABEL_30:
          xpc_object_t reply = xpc_dictionary_create_reply(v6);
          SSXPCDictionarySetObject(reply, "0", &off_10036D908);
          xpc_connection_send_message(v7, reply);

          goto LABEL_31;
        }

        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
        free(v17);
        SSFileLog(v11, @"%@");
      }

      goto LABEL_15;
    }

    if (!v10) {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v18 = [v11 shouldLog];
    else {
      LODWORD(v19) = v18;
    }
    unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      id v21 = (void *)objc_opt_class(self);
      int v28 = 138412546;
      int v29 = v21;
      __int16 v30 = 2112;
      __int16 v31 = v8;
      id v22 = v21;
      uint64_t v23 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "[%@] Report Events requested by [%@]",  &v28,  22);

      if (!v23)
      {
LABEL_29:

        dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100130C5C;
        block[3] = &unk_10034AC30;
        block[4] = self;
        dispatch_async(dispatchQueue, block);
        goto LABEL_30;
      }

      unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      SSFileLog(v11, @"%@");
    }

    goto LABEL_29;
  }

  -[MetricsController _sendUnentitledResponseToMessage:connection:]( self,  "_sendUnentitledResponseToMessage:connection:",  v6,  v7);
LABEL_31:
}

- (void)setInternalSettingsWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t original = a3;
  id v6 = (_xpc_connection_s *)a4;
  if (-[MetricsController _hasEntitlements:](self, "_hasEntitlements:", v6))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    xpc_object_t value = xpc_dictionary_get_value(original, "1");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v10 = v9;
    if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
    {
      id v11 = (__CFString *)SSVMetricsInternalSettingReportingFrequency;
      unsigned int v12 = (const void *)SSXPCDictionaryCopyCFObject(v10, -[__CFString UTF8String](v11, "UTF8String"));
      if (v12)
      {
        uint64_t v13 = v12;
        CFTypeID v14 = CFGetTypeID(v12);
        CFTypeID TypeID = CFNullGetTypeID();
        id v16 = (const __CFString *)kSSUserDefaultsIdentifier;
        if (v14 == TypeID)
        {
          unsigned int v17 = v11;
          unsigned int v18 = 0LL;
        }

        else
        {
          unsigned int v17 = v11;
          unsigned int v18 = v13;
        }

        CFPreferencesSetAppValue(v17, v18, kSSUserDefaultsIdentifier);
        CFRelease(v13);
      }

      else
      {
        id v16 = (const __CFString *)kSSUserDefaultsIdentifier;
      }

      CFPreferencesAppSynchronize(v16);
    }

    xpc_connection_send_message(v6, reply);
  }

  else
  {
    -[MetricsController _sendUnentitledResponseToMessage:connection:]( self,  "_sendUnentitledResponseToMessage:connection:",  original,  v6);
  }
}

- (void)_cancelBackoffRetry
{
  self->_backoffRetryCount = 0LL;
}

- (void)_cancelBackoffRetryTimer
{
  backoffRetryTimer = self->_backoffRetryTimer;
  if (backoffRetryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)backoffRetryTimer);
    id v4 = self->_backoffRetryTimer;
    self->_backoffRetryTimer = 0LL;
  }

- (BOOL)_hasEntitlements:(id)a3
{
  uint64_t v3 = kSSITunesStorePrivateEntitlement;
  id v4 = a3;
  LOBYTE(v3) = SSXPCConnectionHasEntitlement(v4, v3);
  char HasEntitlement = SSXPCConnectionHasEntitlement(v4, kSSITunesStoreEntitlementMetrics);

  return v3 | HasEntitlement;
}

- (id)_operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    objc_super v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( self->_operationQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[ISOperationQueue setName:]( self->_operationQueue,  "setName:",  @"com.apple.itunesstored.MetricsController.report");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v6 addKeepAliveOperationQueue:self->_operationQueue];

    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)_reportEvents
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsController _operationQueue](self, "_operationQueue"));
  uint64_t v4 = (uint64_t)[v3 operationCount];

  if (v4 < 4)
  {
    objc_super v5 = -[AnalyticsReportingOperation initWithController:]( objc_alloc(&OBJC_CLASS___AnalyticsReportingOperation),  "initWithController:",  self->_eventController);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100131124;
    v12[3] = &unk_10034F6E8;
    v12[4] = self;
    -[AnalyticsReportingOperation setFinishBlock:](v5, "setFinishBlock:", v12);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MetricsController _operationQueue](self, "_operationQueue"));
    [v11 addOperation:v5];

    goto LABEL_15;
  }

  objc_super v5 = (AnalyticsReportingOperation *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedDaemonConfig]( &OBJC_CLASS___SSLogConfig,  "sharedDaemonConfig"));
  if (!v5) {
    objc_super v5 = (AnalyticsReportingOperation *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = -[AnalyticsReportingOperation shouldLog](v5, "shouldLog");
  else {
    LODWORD(v7) = v6;
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AnalyticsReportingOperation OSLogObject](v5, "OSLogObject"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_13;
  }
  int v13 = 138412546;
  id v14 = (id)objc_opt_class(self);
  __int16 v15 = 2112;
  id v16 = &off_10036D920;
  id v9 = v14;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "[%@] ignoring request to report events, since there already are %@ operations queued",  &v13,  22);

  if (v10)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
LABEL_13:
  }

- (void)_reportEventsIfNeeded
{
  uint64_t v4 = (uint64_t)-[SSMetricsEventController countUnreportedEventsBefore:]( self->_eventController,  "countUnreportedEventsBefore:",  (uint64_t)v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  unsigned int v6 = (void *)v5;
  if (v4 >= 501)
  {
    if (!v5) {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v18 = 138543618;
      id v19 = (id)objc_opt_class(self);
      __int16 v20 = 2048;
      uint64_t v21 = v4;
      id v10 = v19;
      id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%{public}@: Maximum event count reached. Flushing %ld unreported events",  &v18,  22);

      if (!v11)
      {
LABEL_14:

        -[MetricsController _reportEvents](self, "_reportEvents");
        return;
      }

      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_14;
  }

  if (!v5) {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v12 = [v6 shouldLog];
  else {
    LODWORD(v13) = v12;
  }
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    uint64_t v13 = v13;
  }
  else {
    v13 &= 2u;
  }
  if ((_DWORD)v13)
  {
    int v18 = 138543618;
    id v19 = (id)objc_opt_class(self);
    __int16 v20 = 2048;
    uint64_t v21 = v4;
    id v15 = v19;
    id v16 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  1LL,  "%{public}@: Event count: %ld",  &v18,  22);

    if (v16)
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
      free(v16);
      SSFileLog(v6, @"%@");
    }
  }

  else
  {
  }
}

- (void)_scheduleBackoffRetry
{
  int64_t backoffRetryCount = self->_backoffRetryCount;
  if (backoffRetryCount >= 4)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v4) {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v5 = [v4 shouldLog];
    else {
      LODWORD(v6) = v5;
    }
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      uint64_t v6 = v6;
    }
    else {
      v6 &= 2u;
    }
    if ((_DWORD)v6)
    {
      uint64_t v8 = (void *)objc_opt_class(self);
      int64_t v9 = self->_backoffRetryCount + 1;
      int v26 = 138412546;
      id v27 = v8;
      __int16 v28 = 2048;
      int64_t v29 = v9;
      id v10 = v8;
      id v11 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "[%@] Giving up after %ld retries",  &v26,  22);

      if (!v11)
      {
LABEL_14:

        -[MetricsController _cancelBackoffRetry](self, "_cancelBackoffRetry");
        return;
      }

      unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      SSFileLog(v4, @"%@");
    }

    goto LABEL_14;
  }

  int v12 = 2 << backoffRetryCount;
  -[MetricsController _cancelBackoffRetryTimer](self, "_cancelBackoffRetryTimer");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v13) {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  int64_t v14 = v12;
  unsigned int v15 = [v13 shouldLog];
  else {
    LODWORD(v16) = v15;
  }
  unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
    uint64_t v16 = v16;
  }
  else {
    v16 &= 2u;
  }
  if (!(_DWORD)v16) {
    goto LABEL_26;
  }
  int v26 = 138412546;
  id v27 = (id)objc_opt_class(self);
  __int16 v28 = 2048;
  int64_t v29 = v14;
  id v18 = v27;
  id v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "[%@] Scheduling backoff retry in %ld minutes",  &v26,  22);

  if (v19)
  {
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
    free(v19);
    SSFileLog(v13, @"%@");
LABEL_26:
  }

  __int16 v20 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  backoffRetryTimer = self->_backoffRetryTimer;
  self->_backoffRetryTimer = v20;

  id v22 = self->_backoffRetryTimer;
  dispatch_time_t v23 = dispatch_time(0LL, 60000000000LL * v14);
  dispatch_source_set_timer((dispatch_source_t)v22, v23, 0LL, 0LL);
  int v24 = self->_backoffRetryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1001317F0;
  handler[3] = &unk_10034AC30;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v24, handler);
  dispatch_resume((dispatch_object_t)self->_backoffRetryTimer);
  ++self->_backoffRetryCount;
}

- (void)_sendUnentitledResponseToMessage:(id)a3 connection:(id)a4
{
  uint64_t v6 = (_xpc_connection_s *)a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_12;
  }
  int v17 = 138412290;
  id v18 = (id)objc_opt_class(self);
  id v12 = v18;
  uint64_t v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "[%@] Connection refused because entitlements are missing",  &v17,  12);

  if (v13)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v8, @"%@");
LABEL_12:
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v7);
  uint64_t v15 = SSError(SSErrorDomain, 107LL, 0LL, 0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  SSXPCDictionarySetObject(reply, "0", &off_10036D938);
  SSXPCDictionarySetObject(reply, "1", v16);
  xpc_connection_send_message(v6, reply);
}

- (void).cxx_destruct
{
}

@end