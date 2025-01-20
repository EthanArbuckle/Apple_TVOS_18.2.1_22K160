@interface DMDUserNotificationController
+ (DMDUserNotificationController)sharedController;
- (CATOperationQueue)queue;
- (NSMutableArray)notifications;
- (NSMutableDictionary)completionsByIdentifier;
- (id)_dictFromNotification:(id)a3;
- (id)initPrivate;
- (void)_completeNotification:(id)a3 response:(unint64_t)a4;
- (void)_notificationRef:(__CFUserNotification *)a3 wasDismissedWithFlags:(unint64_t)a4;
- (void)_showNextNotification;
- (void)showNotification:(id)a3 completion:(id)a4;
@end

@implementation DMDUserNotificationController

+ (DMDUserNotificationController)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005D11C;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCE88 != -1) {
    dispatch_once(&qword_1000CCE88, block);
  }
  return (DMDUserNotificationController *)(id)qword_1000CCE80;
}

- (id)initPrivate
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DMDUserNotificationController;
  v2 = -[DMDUserNotificationController init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___CATOperationQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    -[CATOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1LL);
    -[CATOperationQueue setSuspended:](v2->_queue, "setSuspended:", 0LL);
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    notifications = v2->_notifications;
    v2->_notifications = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    completionsByIdentifier = v2->_completionsByIdentifier;
    v2->_completionsByIdentifier = v7;
  }

  return v2;
}

- (void)showNotification:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"DMDUserNotificationController.m", 69, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](&OBJC_CLASS___DMDDeviceController, "shared"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 isInSingleAppMode]);
  unsigned int v11 = [v10 BOOLValue];

  BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Not displaying notification in limited app mode",  buf,  2u);
    }

    if (v8) {
      v8[2](v8, 4LL);
    }
  }

  else
  {
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Start user notification: %{public}@",  buf,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController queue](self, "queue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10005D420;
    v17[3] = &unk_10009E3F0;
    id v18 = v7;
    v19 = self;
    v20 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  v17));
    [v14 addOperation:v15];
  }
}

- (id)_dictFromNotification:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 header]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v5,  kCFUserNotificationAlertHeaderKey);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 message]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v6,  kCFUserNotificationAlertMessageKey);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 defaultButtonTitle]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v7,  kCFUserNotificationDefaultButtonTitleKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 alternateButtonTitle]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v8,  kCFUserNotificationAlternateButtonTitleKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 otherButtonTitle]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v9,  kCFUserNotificationOtherButtonTitleKey);

  id v10 = [v3 displayWhenLocked];
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v11,  kCFUserNotificationAlertTopMostKey);

  id v12 = -[NSMutableDictionary copy](v4, "copy");
  return v12;
}

- (void)_showNextNotification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005D768;
  v5[3] = &unk_10009E070;
  v5[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  v5));
  [v3 addOperation:v4];
}

- (void)_completeNotification:(id)a3 response:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Removing user notification: %{public}@",  (uint8_t *)&v12,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController completionsByIdentifier](self, "completionsByIdentifier"));
  v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  if (v9) {
    v9[2](v9, a4);
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController notifications](self, "notifications"));
  [v10 removeObject:v6];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController completionsByIdentifier](self, "completionsByIdentifier"));
  [v11 setObject:0 forKeyedSubscript:v7];

  -[DMDUserNotificationController _showNextNotification](self, "_showNextNotification");
}

- (void)_notificationRef:(__CFUserNotification *)a3 wasDismissedWithFlags:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDUserNotificationController queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005DBE4;
  v9[3] = &unk_10009F4A8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  v9));
  [v7 addOperation:v8];
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (NSMutableArray)notifications
{
  return self->_notifications;
}

- (NSMutableDictionary)completionsByIdentifier
{
  return self->_completionsByIdentifier;
}

- (void).cxx_destruct
{
}

@end