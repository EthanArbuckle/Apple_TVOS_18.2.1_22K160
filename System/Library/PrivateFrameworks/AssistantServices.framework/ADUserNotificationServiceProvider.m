@interface ADUserNotificationServiceProvider
+ (id)personalDomainNotificationProvider;
- (ADUserNotificationServiceProvider)initWithConnection:(id)a3 bundleIdentifier:(id)a4 notificationCategories:(id)a5;
- (BOOL)_isMonitoringUnlockActivity;
- (void)_clearNotificationWithIdentifier:(id)a3;
- (void)_snoozeNotifications;
- (void)_startMonitoringUnlockActivity;
- (void)_stopMonitoringUnlockActivity;
- (void)postNotificationRequest:(id)a3 completion:(id)a4;
- (void)postNotificationRequest:(id)a3 options:(unint64_t)a4 responseHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)withdrawNotificationRequestWithIdentifier:(id)a3;
@end

@implementation ADUserNotificationServiceProvider

- (ADUserNotificationServiceProvider)initWithConnection:(id)a3 bundleIdentifier:(id)a4 notificationCategories:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ADUserNotificationServiceProvider;
  v11 = -[ADUserNotificationServiceProvider init](&v31, "init");
  if (v11)
  {
    v12 = (void *)kAssistantNotificationBundleID;
    if (v9) {
      v12 = v9;
    }
    id v13 = v12;
    v14 = (objc_class *)objc_opt_class(v11);
    v15 = NSStringFromClass(v14);
    id v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (const char *)[v16 UTF8String];
    dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
    dispatch_queue_t v20 = dispatch_queue_create(v17, v19);

    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v20;

    v22 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  v13);
    notificationCenter = v11->_notificationCenter;
    v11->_notificationCenter = v22;

    -[UNUserNotificationCenter setDelegate:](v11->_notificationCenter, "setDelegate:", v11);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( v11->_notificationCenter,  "setWantsNotificationResponsesDelivered");
    -[UNUserNotificationCenter setNotificationCategories:](v11->_notificationCenter, "setNotificationCategories:", v10);
    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    responseHandlersByNotificationID = v11->_responseHandlersByNotificationID;
    v11->_responseHandlersByNotificationID = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    notificationsToBeSnoozed = v11->_notificationsToBeSnoozed;
    v11->_notificationsToBeSnoozed = v26;

    v28 = (NSXPCConnection *)v8;
    connection = v11->_connection;
    v11->_connection = v28;
  }

  return v11;
}

- (void)postNotificationRequest:(id)a3 completion:(id)a4
{
}

- (void)withdrawNotificationRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002E578C;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_isMonitoringUnlockActivity
{
  return self->_layoutMonitor != 0LL;
}

- (void)_startMonitoringUnlockActivity
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor]( &OBJC_CLASS___FBSDisplayLayoutMonitorConfiguration,  "configurationForDefaultMainDisplayMonitor"));
  [v3 setNeedsUserInteractivePriority:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002E5508;
  v6[3] = &unk_1004FAF10;
  v6[4] = self;
  [v3 setTransitionHandler:v6];
  id v4 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitor monitorWithConfiguration:]( &OBJC_CLASS___FBSDisplayLayoutMonitor,  "monitorWithConfiguration:",  v3));
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v4;
}

- (void)_stopMonitoringUnlockActivity
{
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = 0LL;
}

- (void)_snoozeNotifications
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_notificationsToBeSnoozed, "allKeys"));
  id v3 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        notificationCenter = self->_notificationCenter;
        uint64_t v19 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v6);
        uint64_t v7 = v19;
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
        -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( notificationCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v9);

        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_notificationsToBeSnoozed, "objectForKey:", v7));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1002E542C;
        v13[3] = &unk_1004FBD90;
        id v14 = v10;
        id v11 = v10;
        -[ADUserNotificationServiceProvider postNotificationRequest:completion:]( self,  "postNotificationRequest:completion:",  v11,  v13);

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v4);
  }

  -[ADUserNotificationServiceProvider _stopMonitoringUnlockActivity](self, "_stopMonitoringUnlockActivity");
  -[NSMutableDictionary removeAllObjects](self->_notificationsToBeSnoozed, "removeAllObjects");
}

- (void)_clearNotificationWithIdentifier:(id)a3
{
  responseHandlersByNotificationID = self->_responseHandlersByNotificationID;
  id v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](responseHandlersByNotificationID, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_notificationsToBeSnoozed, "removeObjectForKey:", v5);

  if (!-[NSMutableDictionary count](self->_notificationsToBeSnoozed, "count")) {
    -[ADUserNotificationServiceProvider _stopMonitoringUnlockActivity](self, "_stopMonitoringUnlockActivity");
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002E5420;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)postNotificationRequest:(id)a3 options:(unint64_t)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002E50BC;
  v13[3] = &unk_1004FBA38;
  id v14 = v8;
  __int128 v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (os_log_s *)AFSiriLogContextUtility;
  if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v17 = "-[ADUserNotificationServiceProvider userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E4DDC;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

+ (id)personalDomainNotificationProvider
{
  if (qword_1005786C8 != -1) {
    dispatch_once(&qword_1005786C8, &stru_1004FDC00);
  }
  return (id)qword_1005786D0;
}

@end