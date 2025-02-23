@interface IDSDeviceOnlineMonitor
- (BOOL)isAssertingPresence;
- (BOOL)isMonitoring;
- (IDSDeviceOnlineMonitor)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 queue:(id)a5;
- (IDSDeviceOnlineMonitorDelegate)delegate;
- (NSString)presenceID;
- (OS_dispatch_queue)queue;
- (SKPresence)presence;
- (unsigned)status;
- (void)_assertPresence;
- (void)_releasePresence;
- (void)_subscribe;
- (void)_unsubscribe;
- (void)assertPresence;
- (void)initSKPresenceObject;
- (void)invitedHandlesChangedForPresence:(id)a3;
- (void)presenceAssertionForPresence:(id)a3 completedSuccessfully:(BOOL)a4 error:(id)a5;
- (void)presenceDaemonDisconnected:(id)a3;
- (void)presentDevicesChangedForPresence:(id)a3;
- (void)releasePresence;
- (void)releaseSKPresenceObjectIfPossible;
- (void)setDelegate:(id)a3;
- (void)setIsAssertingPresence:(BOOL)a3;
- (void)setIsMonitoring:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation IDSDeviceOnlineMonitor

- (IDSDeviceOnlineMonitor)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___IDSDeviceOnlineMonitor;
  v12 = -[IDSDeviceOnlineMonitor init](&v25, "init");
  if (v12)
  {
    v13 = (objc_class *)IMWeakLinkClass(@"SKPresence", @"StatusKit");
    uint64_t v14 = IMWeakLinkClass(@"SKPresenceOptions", @"StatusKit");
    if (v13 && (v15 = (objc_class *)v14) != 0LL)
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.ids.OnlineMonitor",  v10));
      presenceID = v12->_presenceID;
      v12->_presenceID = (NSString *)v16;

      id v18 = [[v15 alloc] initWithServiceIdentifier:@"com.apple.ids.OnlineMonitor"];
      [v18 setIsPersonal:1];
      v19 = (SKPresence *)[[v13 alloc] initWithPresenceIdentifier:v12->_presenceID options:v18];
      presence = v12->_presence;
      v12->_presence = v19;

      -[SKPresence addDelegate:queue:](v12->_presence, "addDelegate:queue:", v12, v11);
      v12->_isMonitoring = 0;
      v12->_status = 1;
    }

    else
    {
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "IDSDeviceOnlineMonitor: StatusKit framework not available on this platform",  buf,  2u);
      }

      v22 = v12->_presence;
      v12->_presence = 0LL;

      v12->_isMonitoring = 0;
      v12->_status = 1;
    }

    objc_storeStrong((id *)&v12->_delegate, a3);
    objc_storeStrong((id *)&v12->_queue, a5);
  }

  return v12;
}

- (void)startMonitoring
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSDeviceOnlineMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FB288;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)stopMonitoring
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSDeviceOnlineMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FB348;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)assertPresence
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSDeviceOnlineMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FB408;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)releasePresence
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSDeviceOnlineMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FB4C8;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)initSKPresenceObject
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSDeviceOnlineMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (objc_class *)IMWeakLinkClass(@"SKPresence", @"StatusKit");
  v5 = (objc_class *)IMWeakLinkClass(@"SKPresenceOptions", @"StatusKit");
  if (v4 && v5)
  {
    id v6 = [[v5 alloc] initWithServiceIdentifier:@"com.apple.ids.OnlineMonitor"];
    [v6 setIsPersonal:1];
    v7 = (SKPresence *)[[v4 alloc] initWithPresenceIdentifier:self->_presenceID options:v6];
    presence = self->_presence;
    self->_presence = v7;

    -[SKPresence addDelegate:queue:](self->_presence, "addDelegate:queue:", self, self->_queue);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = self->_presence;
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "initSKPresenceObject: new SKPresence object %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "IDSDeviceOnlineMonitor: StatusKit framework not available on this platform",  (uint8_t *)&v11,  2u);
    }
  }
}

- (void)releaseSKPresenceObjectIfPossible
{
  presence = (SKPresence *)objc_claimAutoreleasedReturnValue(-[IDSDeviceOnlineMonitor presence](self, "presence"));
  if (!presence) {
    goto LABEL_6;
  }
  v5 = presence;
  if (-[IDSDeviceOnlineMonitor isMonitoring](self, "isMonitoring"))
  {

    return;
  }

  unsigned __int8 v4 = -[IDSDeviceOnlineMonitor isAssertingPresence](self, "isAssertingPresence");

  if ((v4 & 1) == 0)
  {
    presence = self->_presence;
    self->_presence = 0LL;
LABEL_6:
  }

- (void)_assertPresence
{
  presence = self->_presence;
  if (presence)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1001FB788;
    v4[3] = &unk_1008F8C80;
    v4[4] = self;
    -[SKPresence assertPresenceWithCompletion:](presence, "assertPresenceWithCompletion:", v4);
  }

- (void)_releasePresence
{
  presence = self->_presence;
  if (presence)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKPresence presenceIdentifier](presence, "presenceIdentifier"));
    v5 = self->_presence;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001FB9D4;
    v7[3] = &unk_1008F8C80;
    id v8 = v4;
    id v6 = v4;
    -[SKPresence releasePresenceWithCompletion:](v5, "releasePresenceWithCompletion:", v7);
  }

- (void)_subscribe
{
  presence = self->_presence;
  if (presence)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1001FBB1C;
    v4[3] = &unk_1008F8C80;
    v4[4] = self;
    -[SKPresence retainTransientSubscriptionAssertionWithCompletion:]( presence,  "retainTransientSubscriptionAssertionWithCompletion:",  v4);
  }

- (void)_unsubscribe
{
  presence = self->_presence;
  if (presence)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKPresence presenceIdentifier](presence, "presenceIdentifier"));
    v5 = self->_presence;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001FBDD4;
    v7[3] = &unk_1008F8C80;
    id v8 = v4;
    id v6 = v4;
    -[SKPresence releaseTransientSubscriptionAssertionWithCompletion:]( v5,  "releaseTransientSubscriptionAssertionWithCompletion:",  v7);
  }

- (void)presentDevicesChangedForPresence:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 presentDevices]);
    int v13 = 138412290;
    uint64_t v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "presence: list of present devices changed: %@",  (uint8_t *)&v13,  0xCu);
  }

  self->_status = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 presentDevices]);
  id v8 = [v7 count];

  if (v8 == (id)2)
  {
    unsigned int v9 = 3;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 presentDevices]);
    id v11 = [v10 count];

    if (v11 == (id)1) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = 1;
    }
  }

  self->_status = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceOnlineMonitor delegate](self, "delegate"));
  [v12 idsDeviceOnlineMonitor:self statusChanged:self->_status];
}

- (void)presenceDaemonDisconnected:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "presence: daemon disconnected for %@",  (uint8_t *)&v6,  0xCu);
  }

  self->_status = 1;
  *(_WORD *)&self->_isMonitoring = 0;
}

- (void)invitedHandlesChangedForPresence:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "presence: invitedHandlesChangedForPresence called for %@",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)presenceAssertionForPresence:(id)a3 completedSuccessfully:(BOOL)a4 error:(id)a5
{
  id v5 = a3;
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IPsecLink](&OBJC_CLASS___IDSFoundationLog, "IPsecLink"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "presenceAssertionForPresence called for %@",  (uint8_t *)&v7,  0xCu);
  }
}

- (unsigned)status
{
  return self->_status;
}

- (IDSDeviceOnlineMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (SKPresence)presence
{
  return self->_presence;
}

- (NSString)presenceID
{
  return self->_presenceID;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

- (BOOL)isAssertingPresence
{
  return self->_isAssertingPresence;
}

- (void)setIsAssertingPresence:(BOOL)a3
{
  self->_isAssertingPresence = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end