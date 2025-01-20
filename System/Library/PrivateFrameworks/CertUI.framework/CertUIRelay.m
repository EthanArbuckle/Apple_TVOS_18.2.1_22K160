@interface CertUIRelay
- (CertUIRelay)init;
- (id)_relayCenter;
- (id)_uniqueDigest;
- (void)_centerDiedWithNotification:(id)a3;
- (void)_registerNewRequest;
- (void)_registerReply;
- (void)_showNextPrompt;
- (void)_shutdown;
- (void)_trustInfoMessageReceived:(id)a3 userInfo:(id)a4 auditToken:(id *)a5;
@end

@implementation CertUIRelay

- (id)_relayCenter
{
  return +[CPDistributedMessagingCenter centerNamed:]( &OBJC_CLASS___CPDistributedMessagingCenter,  "centerNamed:",  kCertUIMessagingCenterRelayName);
}

- (void)_shutdown
{
  v3 = (os_log_s *)_CertUILogObjects[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CertUIRelay shutting down", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CertUIRelay _relayCenter](self, "_relayCenter"));
  [v5 stopServer];

  exit(0);
}

- (void)_centerDiedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)_CertUILogObjects[1];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Center died %@", (uint8_t *)&v9, 0xCu);
  }

  if (!-[NSMutableDictionary count](self->_promptsForDigest, "count")) {
    -[CertUIRelay _shutdown](self, "_shutdown");
  }
}

- (void)_registerNewRequest
{
  int64_t outstandingRequestCount = self->_outstandingRequestCount;
  killTimer = self->_killTimer;
  self->_int64_t outstandingRequestCount = outstandingRequestCount + 1;
  -[NSTimer invalidate](killTimer, "invalidate");
  v5 = self->_killTimer;
  self->_killTimer = 0LL;
}

- (void)_registerReply
{
  int64_t outstandingRequestCount = self->_outstandingRequestCount;
  self->_int64_t outstandingRequestCount = outstandingRequestCount - 1;
  if (outstandingRequestCount <= 1 && !self->_killTimer)
  {
    id v4 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_killTimerFired",  0LL,  0LL,  5.0));
    killTimer = self->_killTimer;
    self->_killTimer = v4;
  }

- (void)_showNextPrompt
{
  self->_waitingOnPrompt = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_promptsForDigest, "allKeys"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_promptsForDigest, "objectForKey:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
  dispatch_time_t v7 = dispatch_time(0LL, 0LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100001460;
  v13[3] = &unk_100004308;
  id v14 = v6;
  v15 = self;
  id v16 = v5;
  v8 = v4;
  v17 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_after(v7, &_dispatch_main_q, v13);
  previousPromptDigest = self->_previousPromptDigest;
  self->_previousPromptDigest = v8;
  v12 = v8;
}

- (id)_uniqueDigest
{
  v2 = CFUUIDCreate(0LL);
  v3 = (__CFString *)CFUUIDCreateString(0LL, v2);
  if (!v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
    if (!v2) {
      return v5;
    }
    goto LABEL_3;
  }

  id v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v3, "dataUsingEncoding:", 4LL));
  CFRelease(v4);
  if (v2) {
LABEL_3:
  }
    CFRelease(v2);
  return v5;
}

- (void)_trustInfoMessageReceived:(id)a3 userInfo:(id)a4 auditToken:(id *)a5
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[CertUIUtilities bundleIDFromAuditToken:]( &OBJC_CLASS___CertUIUtilities,  "bundleIDFromAuditToken:",  a5));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CertUIUtilities localizedAppTitleForBundleID:]( &OBJC_CLASS___CertUIUtilities,  "localizedAppTitleForBundleID:",  v8));
  id v10 = (os_log_s *)_CertUILogObjects[1];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543618;
    v20 = v8;
    __int16 v21 = 2114;
    v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Alert message received from app (%{public}@, %{public}@)",  (uint8_t *)&v19,  0x16u);
  }

  -[CertUIRelay _registerNewRequest](self, "_registerNewRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CertUIRelay _relayCenter](self, "_relayCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 delayReply]);

  v13 = -[CertUIRelayPrompt initWithMessageInfo:localizedOriginatingAppName:replyContext:]( objc_alloc(&OBJC_CLASS___CertUIRelayPrompt),  "initWithMessageInfo:localizedOriginatingAppName:replyContext:",  v7,  v9,  v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CertUIRelayPrompt trustDigest](v13, "trustDigest"));
  v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(-[CertUIRelay _uniqueDigest](self, "_uniqueDigest"));
  }
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_promptsForDigest, "objectForKey:", v17));
  if (!v18)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKey:](self->_promptsForDigest, "setObject:forKey:", v18, v17);
  }

  [v18 addObject:v13];
  if (!self->_waitingOnPrompt) {
    -[CertUIRelay _showNextPrompt](self, "_showNextPrompt");
  }
}

- (CertUIRelay)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CertUIRelay;
  v2 = -[CertUIRelay init](&v14, "init");
  if (v2)
  {
    v3 = (os_log_s *)_CertUILogObjects[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CertUIRelay starting", v13, 2u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CertUIRelay _relayCenter](v2, "_relayCenter"));
    [v4 registerForMessageName:kCertUIPresentTrustInfoMessage target:v2 selector:"_trustInfoMessageReceived:userInfo:auditToken:"];
    [v4 runServerOnCurrentThread];
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  v2,  "_killTimerFired",  0LL,  0LL,  5.0));
    killTimer = v2->_killTimer;
    v2->_killTimer = (NSTimer *)v5;

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_centerDiedWithNotification:" name:CPDistributedMessagingCenterServerDidTerminateNotification object:0];

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    promptsForDigest = v2->_promptsForDigest;
    v2->_promptsForDigest = v8;

    id v10 = objc_alloc_init(&OBJC_CLASS___NSData);
    previousPromptDigest = v2->_previousPromptDigest;
    v2->_previousPromptDigest = v10;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end