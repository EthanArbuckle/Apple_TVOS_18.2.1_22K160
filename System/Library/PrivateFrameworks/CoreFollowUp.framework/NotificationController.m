@interface NotificationController
+ (id)sharedController;
- (NotificationProvider)notificationProvider;
- (double)_timeTilNextActivityForItems:(id)a3;
- (id)_activityCriteriaWithFrequency:(double)a3;
- (id)_itemsWithEligibleNotifications;
- (id)providerForFollowUpItem:(id)a3;
- (id)xpcConnectionForClientWithMachServiceName:(id)a3;
- (void)_deliverNotificationsForItem:(id)a3 forceDelivery:(BOOL)a4;
- (void)_handleActivateActionFromSource:(unint64_t)a3 item:(id)a4;
- (void)_handleExtensionAction:(id)a3 forItem:(id)a4;
- (void)_handleNotificationAction:(id)a3 forItem:(id)a4 activationSource:(unint64_t)a5;
- (void)_monitorUnlockEvents;
- (void)_processFollowUpItemNotificationWithExtension:(id)a3 activatedAction:(id)a4;
- (void)_processPendingItem:(id)a3 completion:(id)a4;
- (void)_processPendingNotifications:(id)a3;
- (void)_registerActivityForItems:(id)a3;
- (void)deliverNotificationsForItem:(id)a3;
- (void)didActivateHSA2LoginNotificationNotification:(id)a3;
- (void)provider:(id)a3 didActivateNotification:(id)a4 forFollowUpItemWithIdentifier:(id)a5 activationSource:(unint64_t)a6;
- (void)provider:(id)a3 didActivateNotificationForFollowUpItemWithIdentifier:(id)a4 activationSource:(unint64_t)a5;
- (void)provider:(id)a3 didClearNotificationsForFollowUpItemsWithIdentifiers:(id)a4 activationSource:(unint64_t)a5;
- (void)provider:(id)a3 didDismissNotificationForFollowUpItemWithIdentifier:(id)a4 activationSource:(unint64_t)a5;
- (void)setNotificationProvider:(id)a3;
- (void)start;
- (void)tearDownNotificationForItem:(id)a3;
- (void)updateNotificationDeliveryDateForItem:(id)a3;
- (void)updateRepeatingActivityState;
@end

@implementation NotificationController

+ (id)sharedController
{
  if (qword_10001E3A8 != -1) {
    dispatch_once(&qword_10001E3A8, &stru_1000189E8);
  }
  return (id)qword_10001E3A0;
}

- (void)start
{
  uint64_t v3 = _FLLogSystem(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting notification controller...", buf, 2u);
  }

  -[NotificationController _monitorUnlockEvents](self, "_monitorUnlockEvents");
  v5 = (void *)os_transaction_create("com.apple.followup.notification");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000A9C8;
  v9[3] = &unk_100018A10;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)_monitorUnlockEvents
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000AA98;
  handler[3] = &unk_100018A38;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, handler);
}

- (void)updateRepeatingActivityState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationController _itemsWithEligibleNotifications](self, "_itemsWithEligibleNotifications"));
  if ([v3 count])
  {
    -[NotificationController _registerActivityForItems:](self, "_registerActivityForItems:", v3);
    -[NotificationController _processPendingItem:completion:](self, "_processPendingItem:completion:", v3, 0LL);
  }

  else
  {
    uint64_t v5 = _FLLogSystem(0LL, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unregistering any active activities", v7, 2u);
    }

    xpc_activity_unregister("com.apple.followup.notify");
  }
}

- (id)_itemsWithEligibleNotifications
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100018A78));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[FLItemStoreDecorator itemsMatchingPredicate:]( self->_itemStoreDecorator,  "itemsMatchingPredicate:",  v3));

  return v4;
}

- (double)_timeTilNextActivityForItems:(id)a3
{
  id v3 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10000B01C;
  v29 = sub_10000B02C;
  id v30 = 0LL;
  uint64_t v21 = 0LL;
  v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000LL;
  uint64_t v24 = 0LL;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000B034;
  v16[3] = &unk_100018AA0;
  v16[4] = &v21;
  v16[5] = &v17;
  v16[6] = &v25;
  [v3 enumerateObjectsUsingBlock:v16];
  uint64_t v4 = (void *)v26[5];
  uint64_t v5 = v22;
  if (v4)
  {
    double v6 = v22[3];
    if (v6 == 0.0)
    {
LABEL_5:
      [v4 timeIntervalSinceNow];
      uint64_t v5 = v22;
      *((void *)v22 + 3) = v8;
      goto LABEL_6;
    }

    [v4 timeIntervalSinceNow];
    if (v6 > v7)
    {
      uint64_t v4 = (void *)v26[5];
      goto LABEL_5;
    }

    uint64_t v5 = v22;
  }

- (void)_registerActivityForItems:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FLLogSystem(v4, v5);
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Starting a repeating activity based on items: %@",  buf,  0xCu);
  }

  id v8 = -[NotificationController _timeTilNextActivityForItems:](self, "_timeTilNextActivityForItems:", v4);
  if (v10 <= 0.0)
  {
    uint64_t v16 = _FLLogSystem(v8, v9);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unregistering any active activities",  buf,  2u);
    }

    xpc_activity_unregister("com.apple.followup.notify");
  }

  else
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationController _activityCriteriaWithFrequency:](self, "_activityCriteriaWithFrequency:"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000B48C;
    handler[3] = &unk_100018A38;
    handler[4] = self;
    xpc_activity_register("com.apple.followup.notify", v11, handler);

    uint64_t v14 = _FLLogSystem(v12, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Registered for XPC events", buf, 2u);
    }
  }
}

- (id)_activityCriteriaWithFrequency:(double)a3
{
  uint64_t v4 = _FLLogSystem(self, a2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    double v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Scheduling XPC activity with interval %f",  (uint8_t *)&v9,  0xCu);
  }

  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  double v7 = (double)XPC_ACTIVITY_INTERVAL_1_DAY;
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, (uint64_t)v7);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  return v6;
}

- (void)_processPendingNotifications:(id)a3
{
  itemStoreDecorator = self->_itemStoreDecorator;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[FLItemStoreDecorator followUpItems](itemStoreDecorator, "followUpItems"));
  -[NotificationController _processPendingItem:completion:](self, "_processPendingItem:completion:", v6, v5);
}

- (void)_processPendingItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (uint64_t (**)(id, id))a4;
  uint64_t v9 = _FLLogSystem(v7, v8);
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Processing pending notifications...", buf, 2u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000B9E4;
  v15[3] = &unk_1000186C8;
  v15[4] = self;
  id v11 = [v6 enumerateObjectsUsingBlock:v15];
  if (v7) {
    id v11 = (id)v7[2](v7, [v6 count]);
  }
  uint64_t v13 = _FLLogSystem(v11, v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Processed pending notifications...", buf, 2u);
  }
}

- (void)deliverNotificationsForItem:(id)a3
{
}

- (void)_deliverNotificationsForItem:(id)a3 forceDelivery:(BOOL)a4
{
  id v6 = a3;
  uint64_t v8 = _FLLogSystem(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    *(_DWORD *)buf = 138412290;
    id v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Deliverying notification for item with identifier: %@",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 notification]);
  if (v11 && ([v6 isExpired] & 1) == 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NotificationController providerForFollowUpItem:](self, "providerForFollowUpItem:", v6));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000BB8C;
    v14[3] = &unk_100018AF0;
    BOOL v18 = a4;
    id v15 = v11;
    id v16 = v12;
    id v17 = v6;
    id v13 = v12;
    [v13 shouldUpdateExistingForItem:v17 completionHandler:v14];
  }

  else
  {
    -[NotificationController tearDownNotificationForItem:](self, "tearDownNotificationForItem:", v6);
  }
}

- (void)tearDownNotificationForItem:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NotificationController providerForFollowUpItem:](self, "providerForFollowUpItem:", v4));
  [v5 tearDownNotificationsForFollowUpItem:v4];
}

- (id)providerForFollowUpItem:(id)a3
{
  return self->_notificationProvider;
}

- (void)provider:(id)a3 didActivateNotification:(id)a4 forFollowUpItemWithIdentifier:(id)a5 activationSource:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = _FLLogSystem(v10, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Activated notification for %@ - %@",  buf,  0x16u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[FLItemStoreDecorator itemsMatchingIdentifier:]( self->_itemStoreDecorator,  "itemsMatchingIdentifier:",  v10));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000BD90;
    v22[3] = &unk_100018B18;
    uint64_t v23 = (os_log_s *)v9;
    uint64_t v24 = self;
    unint64_t v25 = a6;
    [v15 enumerateObjectsUsingBlock:v22];

    uint64_t v14 = v23;
  }

  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_10000EC30((uint64_t)self, v14, v16, v17, v18, v19, v20, v21);
  }
}

- (void)provider:(id)a3 didActivateNotificationForFollowUpItemWithIdentifier:(id)a4 activationSource:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v9 = _FLLogSystem(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Activated notification for %@", buf, 0xCu);
    }

    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[FLItemStoreDecorator itemsMatchingIdentifier:]( self->_itemStoreDecorator,  "itemsMatchingIdentifier:",  v7));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000C044;
    v18[3] = &unk_100018B40;
    v18[4] = self;
    v18[5] = a5;
    -[os_log_s enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v18);
  }

  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_10000EC30((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
  }
}

- (void)_handleActivateActionFromSource:(unint64_t)a3 item:(id)a4
{
  id v12 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[FLTelemetryFactory sharedTelemetryController]( &OBJC_CLASS___FLTelemetryFactory,  "sharedTelemetryController"));
  [v6 captureActionForItem:v12 withEvent:2 source:a3];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 notification]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
  unsigned int v9 = [v8 containsObject:FLNotificationOptionExtensionActions];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 notification]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activateAction]);
  if (v9) {
    -[NotificationController _handleExtensionAction:forItem:](self, "_handleExtensionAction:forItem:", v11, v12);
  }
  else {
    -[NotificationController _handleNotificationAction:forItem:activationSource:]( self,  "_handleNotificationAction:forItem:activationSource:",  v11,  v12,  a3);
  }
}

- (void)provider:(id)a3 didClearNotificationsForFollowUpItemsWithIdentifiers:(id)a4 activationSource:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v9 = _FLLogSystem(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Clearing notifications for %@", buf, 0xCu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[FLItemStoreDecorator itemsMatchingIdentifiers:]( self->_itemStoreDecorator,  "itemsMatchingIdentifiers:",  v7));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000C288;
  v12[3] = &unk_100018B40;
  v12[4] = self;
  v12[5] = a5;
  [v11 enumerateObjectsUsingBlock:v12];
}

- (void)provider:(id)a3 didDismissNotificationForFollowUpItemWithIdentifier:(id)a4 activationSource:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v9 = _FLLogSystem(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Dismissing notification: %@", buf, 0xCu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[FLItemStoreDecorator itemsMatchingIdentifier:]( self->_itemStoreDecorator,  "itemsMatchingIdentifier:",  v7));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000C42C;
  v12[3] = &unk_100018B40;
  v12[4] = self;
  v12[5] = a5;
  [v11 enumerateObjectsUsingBlock:v12];
}

- (void)_handleNotificationAction:(id)a3 forItem:(id)a4 activationSource:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = _FLLogSystem(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
    *(_DWORD *)buf = 138412546;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Handling notification action %@ for item identifier %@",  buf,  0x16u);
  }

  -[NotificationController updateNotificationDeliveryDateForItem:](self, "updateNotificationDeliveryDateForItem:", v9);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 extensionIdentifier]);
  if (v14
    && (uint64_t v15 = (void *)v14,
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[FLEnvironment currentEnvironment](&OBJC_CLASS___FLEnvironment, "currentEnvironment")),
        unsigned int v17 = [v16 followUpExtensionSupportEnabled],
        v16,
        v15,
        v17))
  {
    uint64_t v18 = (void *)os_transaction_create("com.apple.followup.notification.action");
    uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[FLHeadlessExtensionLoader sharedExtensionQueue]( &OBJC_CLASS___FLHeadlessExtensionLoader,  "sharedExtensionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000C6BC;
    block[3] = &unk_100018B90;
    unint64_t v26 = a5;
    id v22 = v9;
    uint64_t v23 = self;
    id v24 = v8;
    id v25 = v18;
    id v20 = v18;
    dispatch_async(v19, block);
  }

  else if (a5 == 5)
  {
    -[NotificationController _processFollowUpItemNotificationWithExtension:activatedAction:]( self,  "_processFollowUpItemNotificationWithExtension:activatedAction:",  v9,  v8);
  }
}

- (void)_handleExtensionAction:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _FLLogSystem(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Handling notification action %@ for item identifier %@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 notification]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 options]);
  id v14 = [v13 mutableCopy];

  [v14 removeObject:FLNotificationOptionForce];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 notification]);
  [v15 setOptions:v14];

  -[NotificationController updateNotificationDeliveryDateForItem:](self, "updateNotificationDeliveryDateForItem:", v7);
  if (v6)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    uint64_t v23 = sub_10000B01C;
    id v24 = sub_10000B02C;
    id v25 = [[FLHeadlessActionHandler alloc] initWithItem:v7];
    uint64_t v16 = (void *)os_transaction_create("com.apple.followup.notification.action");
    [v6 setEventSource:1];
    unsigned int v17 = *(void **)(*(void *)&buf[8] + 40LL);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000CAF0;
    v19[3] = &unk_100018BB8;
    uint64_t v21 = buf;
    id v18 = v16;
    id v20 = v18;
    [v17 handleAction:v6 completion:v19];

    _Block_object_dispose(buf, 8);
  }
}

- (void)_processFollowUpItemNotificationWithExtension:(id)a3 activatedAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = _FLLogSystem(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_processFollowUpItemNotificationWithExtension: %@ ",  (uint8_t *)&v10,  0xCu);
  }

  [v6 _loadActionURL];
}

- (void)updateNotificationDeliveryDateForItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 notification]);
  id v6 = (void *)v4;
  if (v4)
  {
    uint64_t v7 = _FLLogSystem(v4, v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Resetting notification target date to now",  v11,  2u);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v6 setPreviousNotificationActionDate:v9];

    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[ItemStore sharedInstance](&OBJC_CLASS___ItemStore, "sharedInstance"));
    [v10 updateNotificationForFollowUpItem:v3];
  }
}

- (void)didActivateHSA2LoginNotificationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NotificationController xpcConnectionForClientWithMachServiceName:]( self,  "xpcConnectionForClientWithMachServiceName:",  @"com.apple.akd.followup"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000CDA0;
  v7[3] = &unk_100018BE0;
  v7[4] = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v7]);
  [v6 didActivateHSA2LoginNotification:v4];
}

- (id)xpcConnectionForClientWithMachServiceName:(id)a3
{
  id v3 = a3;
  id v4 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  v3,  0LL);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___FLFollowUpControllerDelegate));
  -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", v5);
  -[NSXPCConnection resume](v4, "resume");

  return v4;
}

- (NotificationProvider)notificationProvider
{
  return self->_notificationProvider;
}

- (void)setNotificationProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end