@interface PDUserNotificationManager
- (BOOL)_notificationRequirementsAreSatisfied:(id)a3;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)hasNotificationApplicationMessageWithIdentifier:(id)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (BOOL)updatePassAssetsWithPassUniqueID:(id)a3;
- (BOOL)userNotificationCenterShouldSuppressUserNotifications:(id)a3;
- (PDUserNotificationManager)initWithArchiveFileURL:(id)a3 databaseManager:(id)a4 assertionManager:(id)a5 paymentWebService:(id)a6 paymentWebServiceCoordinator:(id)a7 applicationMessageManager:(id)a8 delegate:(id)a9;
- (id)_badgeCountItemsForPayLaterWithAccount:(id)a3;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (id)badgeCountItems;
- (id)passWithUniqueIdentifier:(id)a3;
- (id)pendingNotificationDescriptionsWithIdentifier:(id)a3;
- (id)scheduledNotificationActivitiesForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4;
- (id)scheduledNotificationActivitiesOfType:(unint64_t)a3;
- (id)scheduledNotificationActivityWithIdentifier:(id)a3;
- (void)_archiveUserNotifications;
- (void)_removeScheduledActivitiesForPassUniqueIdentifier:(id)a3;
- (void)_removeScheduledActivitiesForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4;
- (void)_removeScheduledActivitiesOfType:(unint64_t)a3;
- (void)alertNotificationsEnabled:(id)a3;
- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4;
- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4;
- (void)connect;
- (void)connectApplicationMessageSink:(id)a3;
- (void)dealloc;
- (void)insertUserNotification:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4 activityContext:(id)a5;
- (void)removeAllUserNotifications;
- (void)removeNotificationApplicationMessageWithIdentifier:(id)a3;
- (void)removeNotificationAssetsForPassWithUniqueIdentifier:(id)a3;
- (void)removeUserNotification:(id)a3;
- (void)removeUserNotificationWithIdentifier:(id)a3;
- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3;
- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4;
- (void)removeUserNotificationsOfType:(unint64_t)a3;
- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3;
- (void)requestNotificationAuthorizationWithCompletion:(id)a3;
- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4;
- (void)updateDeviceAssessmentEducationVisibility;
- (void)updateNotificationApplicationMessageWithNotification:(id)a3;
- (void)updateUserNotificationsForUpdatedExpressPassConfigurations:(id)a3;
- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4;
- (void)userNotificationCenter:(id)a3 insertedOrUpdatedUserNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 removedUserNotificationIdentifiers:(id)a4;
- (void)userNotificationWithIdentifier:(id)a3 completion:(id)a4;
- (void)userNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4 completion:(id)a5;
- (void)userNotificationsOfType:(unint64_t)a3 completion:(id)a4;
@end

@implementation PDUserNotificationManager

- (PDUserNotificationManager)initWithArchiveFileURL:(id)a3 databaseManager:(id)a4 assertionManager:(id)a5 paymentWebService:(id)a6 paymentWebServiceCoordinator:(id)a7 applicationMessageManager:(id)a8 delegate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PDUserNotificationManager;
  v22 = -[PDUserNotificationManager init](&v36, "init");
  if (v22)
  {
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.usernotificationmanager", 0LL);
    userNotificationManagerQueue = v22->_userNotificationManagerQueue;
    v22->_userNotificationManagerQueue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v22->_applicationMessageManager, a8);
    objc_storeStrong((id *)&v22->_paymentWebServiceCoordinator, a7);
    -[PDPaymentWebServiceCoordinator registerObserver:](v22->_paymentWebServiceCoordinator, "registerObserver:", v22);
    sub_10030C3AC((uint64_t)v22->_applicationMessageManager, 4LL, v22);
    v25 = (dispatch_queue_s *)v22->_userNotificationManagerQueue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100246E28;
    v29[3] = &unk_100640CE0;
    v26 = v22;
    v30 = v26;
    id v31 = v15;
    id v32 = v16;
    id v33 = v17;
    id v34 = v18;
    id v35 = v21;
    dispatch_sync(v25, v29);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v26,  (CFNotificationCallback)sub_100246EC8,  PKWalletPreferencesChangedNotification,  0LL,  (CFNotificationSuspensionBehavior)0LL);
  }

  return v22;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDUserNotificationManager;
  -[PDUserNotificationManager dealloc](&v4, "dealloc");
}

- (id)passWithUniqueIdentifier:(id)a3
{
  return -[PDDatabaseManager passWithUniqueIdentifier:](self->_databaseManager, "passWithUniqueIdentifier:", a3);
}

- (BOOL)userNotificationCenterShouldSuppressUserNotifications:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDAssertionManager assertionsOfType:](self->_assertionManager, "assertionsOfType:", 4LL));
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)userNotificationCenter:(id)a3 insertedOrUpdatedUserNotification:(id)a4
{
  id v9 = a4;
  -[PDUserNotificationManager _archiveUserNotifications](self, "_archiveUserNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationMessageContent]);

  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___PKApplicationMessageRequest);
    objc_msgSend(v6, "setBadge:", objc_msgSend(v9, "applicationMessageBadge"));
    applicationMessageSink = self->_applicationMessageSink;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v9 notificationIdentifier]);
    -[PKApplicationMessageSink registerOrUpdateMessageForIdentifier:withRequest:]( applicationMessageSink,  "registerOrUpdateMessageForIdentifier:withRequest:",  v8,  v6);
  }
}

- (void)userNotificationCenter:(id)a3 removedUserNotificationIdentifiers:(id)a4
{
  id v5 = a4;
  -[PDUserNotificationManager _archiveUserNotifications](self, "_archiveUserNotifications");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PKApplicationMessageSink unregisterMessageForIdentifier:]( self->_applicationMessageSink,  "unregisterMessageForIdentifier:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  (void)v11);
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4 activityContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    -[PDUserNotificationManager insertUserNotification:](self, "insertUserNotification:", v10);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Scheduled activity missing context %@",  (uint8_t *)&v13,  0xCu);
    }
  }
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return a3 == 4;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return 1;
}

- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4
{
  id v5 = a3;
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100247298;
  v8[3] = &unk_1006392B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)userNotificationManagerQueue, v8);
}

- (void)connectApplicationMessageSink:(id)a3
{
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "key", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationCenter applicationMessageContentForNotificationIdentifier:]( self->_notificationCenter,  "applicationMessageContentForNotificationIdentifier:",  v6));
  return v7;
}

- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "key", a3));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 identifier]);

  -[PKApplicationMessageSink unregisterMessageForIdentifier:]( self->_applicationMessageSink,  "unregisterMessageForIdentifier:",  v6);
}

- (void)connect
{
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100247418;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)userNotificationManagerQueue, block);
}

- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002474FC;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)userNotificationManagerQueue, v7);
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v4 = a3;
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10024759C;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)userNotificationManagerQueue, v7);
}

- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4
{
  id v6 = a4;
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024764C;
  block[3] = &unk_10063A858;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)userNotificationManagerQueue, block);
}

- (void)insertUserNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002476EC;
    v7[3] = &unk_1006392B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)userNotificationManagerQueue, v7);
  }
}

- (void)updateUserNotificationsForUpdatedExpressPassConfigurations:(id)a3
{
}

- (void)removeUserNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100247968;
    v7[3] = &unk_1006392B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)userNotificationManagerQueue, v7);
  }
}

- (void)removeUserNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100247A30;
    v7[3] = &unk_1006392B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)userNotificationManagerQueue, v7);
  }
}

- (void)removeUserNotificationsOfType:(unint64_t)a3
{
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100247AD8;
  v4[3] = &unk_10063A8A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)userNotificationManagerQueue, v4);
}

- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100247B94;
    block[3] = &unk_10063A858;
    block[4] = self;
    id v10 = v6;
    unint64_t v11 = a4;
    dispatch_async((dispatch_queue_t)userNotificationManagerQueue, block);
  }
}

- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100247C54;
    v7[3] = &unk_1006392B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)userNotificationManagerQueue, v7);
  }
}

- (void)removeAllUserNotifications
{
  userNotificationManagerQueue = self->_userNotificationManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100247CD8;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)userNotificationManagerQueue, block);
}

- (void)removeNotificationAssetsForPassWithUniqueIdentifier:(id)a3
{
}

- (BOOL)updatePassAssetsWithPassUniqueID:(id)a3
{
  return -[PDUserNotificationIconStore updatePassAssetsWithPassUniqueID:]( self->_iconStore,  "updatePassAssetsWithPassUniqueID:",  a3);
}

- (id)scheduledNotificationActivitiesForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationManager scheduledNotificationActivitiesOfType:]( self,  "scheduledNotificationActivitiesOfType:",  a4));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100247EA8;
  v11[3] = &unk_100639950;
  id v12 = v6;
  id v8 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pk_objectsPassingTest:", v11));

  return v9;
}

- (id)scheduledNotificationActivitiesOfType:(unint64_t)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = PDScheduledActivitiesForClient(@"PDWalletUserNotificationManager");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t Context = PDScheduledActivityGetContext( @"PDWalletUserNotificationManager",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(Context);
        if (objc_msgSend(v12, "notificationType", (void)v15) == (id)a3) {
          -[NSMutableArray addObject:](v4, "addObject:", v12);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  id v13 = -[NSMutableArray copy](v4, "copy");
  return v13;
}

- (id)scheduledNotificationActivityWithIdentifier:(id)a3
{
  id v3 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v4 = PDScheduledActivitiesForClient(@"PDWalletUserNotificationManager");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t Context = PDScheduledActivityGetContext( @"PDWalletUserNotificationManager",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)i));
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(Context);
        id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "notificationIdentifier", (void)v17));
        id v13 = v3;
        id v14 = v13;
        if (v12 == v13)
        {

          goto LABEL_16;
        }

        if (v3 && v12)
        {
          unsigned __int8 v15 = [v12 isEqualToString:v13];

          if ((v15 & 1) != 0) {
            goto LABEL_16;
          }
        }

        else
        {
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  unint64_t v11 = 0LL;
LABEL_16:

  return v11;
}

- (void)userNotificationsOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002482A4;
    block[3] = &unk_10063AEB0;
    block[4] = self;
    id v10 = v6;
    unint64_t v11 = a3;
    dispatch_async((dispatch_queue_t)userNotificationManagerQueue, block);
  }
}

- (void)userNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10024838C;
    v12[3] = &unk_100645F00;
    v12[4] = self;
    id v14 = v9;
    id v13 = v8;
    unint64_t v15 = a4;
    dispatch_async((dispatch_queue_t)userNotificationManagerQueue, v12);
  }
}

- (void)userNotificationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100248468;
    block[3] = &unk_10063C450;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async((dispatch_queue_t)userNotificationManagerQueue, block);
  }
}

- (void)alertNotificationsEnabled:(id)a3
{
}

- (id)pendingNotificationDescriptionsWithIdentifier:(id)a3
{
  id v3 = a3;
  v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateStyle:](v4, "setDateStyle:", 2LL);
  v45 = v4;
  -[NSDateFormatter setTimeStyle:](v4, "setTimeStyle:", 3LL);
  uint64_t v5 = PDScheduledActivitiesForClient(@"PDWalletUserNotificationManager");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        if (![v3 length]) {
          goto LABEL_13;
        }
        id v13 = v3;
        id v14 = v12;
        if (v14 == v13)
        {

LABEL_13:
          uint64_t Context = PDScheduledActivityGetContext(@"PDWalletUserNotificationManager", v12);
          id v13 = (id)objc_claimAutoreleasedReturnValue(Context);
          -[NSMutableArray safelyAddObject:](v7, "safelyAddObject:", v13);
LABEL_15:

          continue;
        }

        unint64_t v15 = v14;
        if (!v3 || !v14)
        {

          goto LABEL_15;
        }

        unsigned int v16 = [v13 isEqualToString:v14];

        if (v16) {
          goto LABEL_13;
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }

    while (v9);
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"date",  1LL));
  v56 = v18;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
  -[NSMutableArray sortUsingDescriptors:](v7, "sortUsingDescriptors:", v19);

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  v41 = v7;
  id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v47,  v55,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v43 = *(void *)v48;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        id v23 = v3;
        if (*(void *)v48 != v43) {
          objc_enumerationMutation(v41);
        }
        v24 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 notificationContentWithDataSource:self->_notificationCenter]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v24 date]);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v45, "stringFromDate:", v26));

        v28 = (void *)objc_claimAutoreleasedReturnValue([v25 title]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v25 subtitle]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v25 body]);
        id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Notification: %@\nLocal fire date: %@\nTitle: %@\nSubtitle: %@\nBody: %@",  v24,  v27,  v28,  v29,  v30));

        uint64_t v33 = objc_opt_class(&OBJC_CLASS___PDAccountPaymentDueUserNotification, v32);
        if ((objc_opt_isKindOfClass(v24, v33) & 1) != 0
          || (uint64_t v35 = objc_opt_class(&OBJC_CLASS___PDAccountPaymentPastDueUserNotification, v34),
              (objc_opt_isKindOfClass(v24, v35) & 1) != 0))
        {
          unsigned int v36 = [v24 preventAutomaticDismissal];
          v37 = @"NO";
          if (v36) {
            v37 = @"YES";
          }
          uint64_t v38 = objc_claimAutoreleasedReturnValue([v31 stringByAppendingFormat:@"\nSticky: %@", v37]);

          id v31 = (void *)v38;
        }

        id v3 = v23;
        -[NSMutableArray addObject:](v46, "addObject:", v31);
      }

      id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v47,  v55,  16LL);
    }

    while (v21);
  }

  id v39 = -[NSMutableArray copy](v46, "copy");
  return v39;
}

- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[PDUserNotificationManager scheduledNotificationActivityWithIdentifier:]( self,  "scheduledNotificationActivityWithIdentifier:",  a4));
  [v7 setDate:v6];

  -[PDUserNotificationManager insertUserNotification:](self, "insertUserNotification:", v7);
}

- (void)updateDeviceAssessmentEducationVisibility
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", 1LL));
  v6[1] = 3221225472LL;
  v6[2] = sub_100248ABC;
  v6[3] = &unk_10064F048;
  v6[4] = self;
  id v5 = v3;
  v6[0] = _NSConcreteStackBlock;
  unsigned int v4 = objc_msgSend(v3, "pk_hasObjectPassingTest:", v6);
  if (self->_isDeviceAssessmentEducationVisible != v4)
  {
    self->_isDeviceAssessmentEducationVisible = v4;
    -[PDUserNotificationManager updateWalletBadgeCount](self, "updateWalletBadgeCount");
  }
}

- (void)removeNotificationApplicationMessageWithIdentifier:(id)a3
{
  if (a3) {
    -[PKApplicationMessageSink unregisterMessageForIdentifier:]( self->_applicationMessageSink,  "unregisterMessageForIdentifier:");
  }
}

- (BOOL)hasNotificationApplicationMessageWithIdentifier:(id)a3
{
  if (a3) {
    return -[PKApplicationMessageSink hasMessageWithIdentifier:]( self->_applicationMessageSink,  "hasMessageWithIdentifier:");
  }
  else {
    return 0;
  }
}

- (void)updateNotificationApplicationMessageWithNotification:(id)a3
{
  if (a3)
  {
    notificationCenter = self->_notificationCenter;
    id v5 = a3;
    -[PDUserNotificationCenter updateApplicationMessageContentForNotification:]( notificationCenter,  "updateApplicationMessageContentForNotification:",  v5);
    id v8 = objc_alloc_init(&OBJC_CLASS___PKApplicationMessageRequest);
    objc_msgSend(v8, "setBadge:", objc_msgSend(v5, "applicationMessageBadge"));
    applicationMessageSink = self->_applicationMessageSink;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 notificationIdentifier]);

    -[PKApplicationMessageSink updateMessageForIdentifier:withRequest:]( applicationMessageSink,  "updateMessageForIdentifier:withRequest:",  v7,  v8);
  }

- (void)_removeScheduledActivitiesForPassUniqueIdentifier:(id)a3
{
  id v3 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v4 = PDScheduledActivitiesForClient(@"PDWalletUserNotificationManager");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t Context = PDScheduledActivityGetContext(@"PDWalletUserNotificationManager", v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(Context);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "passUniqueIdentifier", (void)v15));
        unsigned int v14 = [v13 isEqualToString:v3];

        if (v14) {
          PDScheduledActivityRemove(@"PDWalletUserNotificationManager", v10);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }
}

- (void)_removeScheduledActivitiesOfType:(unint64_t)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v4 = PDScheduledActivitiesForClient(@"PDWalletUserNotificationManager");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t Context = PDScheduledActivityGetContext(@"PDWalletUserNotificationManager", v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(Context);
        if (objc_msgSend(v12, "notificationType", (void)v13) == (id)a3) {
          PDScheduledActivityRemove(@"PDWalletUserNotificationManager", v10);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }
}

- (void)_removeScheduledActivitiesForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4
{
  id v16 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v5 = PDScheduledActivitiesForClient(@"PDWalletUserNotificationManager");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t Context = PDScheduledActivityGetContext(@"PDWalletUserNotificationManager", v11);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(Context);
        if ([v13 notificationType] == (id)a4)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 passUniqueIdentifier]);
          unsigned int v15 = [v14 isEqualToString:v16];

          if (v15) {
            PDScheduledActivityRemove(@"PDWalletUserNotificationManager", v11);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }
}

- (void)_archiveUserNotifications
{
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_archiveSemaphore, 0LL))
  {
    dispatch_time_t v3 = dispatch_time(0LL, 2000000000LL);
    uint64_t v4 = (void *)PDOSTransactionCreate("PDUserNotificationManager");
    userNotificationManagerQueue = self->_userNotificationManagerQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100249038;
    v7[3] = &unk_1006392B0;
    id v8 = v4;
    uint64_t v9 = self;
    id v6 = v4;
    dispatch_after(v3, (dispatch_queue_t)userNotificationManagerQueue, v7);
  }

- (BOOL)_notificationRequirementsAreSatisfied:(id)a3
{
  id v4 = a3;
  id v5 = [v4 insertionRequirements];
  if (!v5)
  {
    BOOL v10 = 1;
    goto LABEL_40;
  }

  char v6 = (char)v5;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (void *)v7;
  if ((v6 & 2) != 0
    && (uint64_t v7 = -[PDDatabaseManager passExistsWithPassType:](self->_databaseManager, "passExistsWithPassType:", -1LL),
        (v7 & 1) == 0))
  {
    uint64_t v7 = (uint64_t)[v8 addObject:@"'Passes Exist'"];
    int v9 = 0;
    if ((v6 & 4) == 0) {
      goto LABEL_10;
    }
  }

  else
  {
    int v9 = 1;
    if ((v6 & 4) == 0) {
      goto LABEL_10;
    }
  }

  uint64_t v7 = -[PDDatabaseManager passExistsWithPassType:](self->_databaseManager, "passExistsWithPassType:", -1LL);
  v9 &= v7 ^ 1;
LABEL_10:
  if ((v6 & 8) != 0)
  {
    uint64_t v7 = -[PDDatabaseManager passExistsWithPassType:](self->_databaseManager, "passExistsWithPassType:", 1LL);
    int v9 = v9 ? v7 : 0;
    if ((v7 & 1) == 0) {
      uint64_t v7 = (uint64_t)[v8 addObject:@"'Payment Passes Exist'"];
    }
  }

  if ((v6 & 0x10) != 0)
  {
    uint64_t v7 = -[PDDatabaseManager passExistsWithPassType:](self->_databaseManager, "passExistsWithPassType:", 1LL);
    int v9 = v9 ? v7 ^ 1 : 0;
  }

  if ((v6 & 0x20) != 0)
  {
    uint64_t v7 = PKHandsOnDemoModeEnabled(v7);
    if ((v7 & 1) == 0)
    {
      uint64_t v7 = PKUIOnlyDemoModeEnabled(v7);
      if (!(_DWORD)v7)
      {
        uint64_t v7 = PKStoreDemoModeEnabled(v7, v11);
        int v9 = v9 ? v7 : 0;
        if ((v7 & 1) == 0) {
          uint64_t v7 = (uint64_t)[v8 addObject:@"Demo Mode Active'"];
        }
      }
    }
  }

  if ((v6 & 0x40) == 0) {
    goto LABEL_35;
  }
  uint64_t v12 = PKHandsOnDemoModeEnabled(v7);
  if ((v12 & 1) != 0 || (uint64_t v13 = PKUIOnlyDemoModeEnabled(v12), (v13 & 1) != 0))
  {
    int v9 = 0;
  }

  else
  {
    int v24 = PKStoreDemoModeEnabled(v13, v14) ^ 1;
    if (v9) {
      int v9 = v24;
    }
    else {
      int v9 = 0;
    }
    if ((v24 & 1) != 0) {
      goto LABEL_35;
    }
  }

  [v8 addObject:@"'No Demo Mode Active'"];
LABEL_35:
  if (!v9)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));
      int v25 = 138412546;
      v26 = v17;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Insertion Requirements (%@) failed for User Notification: %@",  (uint8_t *)&v25,  0x16u);
    }
  }

  BOOL v10 = v9 != 0;
LABEL_40:
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v4 passUniqueIdentifier]);
  if (v18 && -[PDDatabaseManager passExistsWithUniqueID:](self->_databaseManager, "passExistsWithUniqueID:", v18))
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passAnnotationsForPassUniqueIdentifier:]( self->_databaseManager,  "passAnnotationsForPassUniqueIdentifier:",  v18));
    __int128 v20 = v19;
    if (v19 && [v19 sortingState] == (id)1)
    {
      uint64_t v21 = PKLogFacilityTypeGetObject(0LL);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Attempting to insert User Notification for pass that is in expired section, force fail notification insertion requirements",  (uint8_t *)&v25,  2u);
      }

      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)badgeCountItems
{
  uint64_t v8 = 0LL;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_100249570;
  uint64_t v12 = sub_100249580;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100249588;
  v7[3] = &unk_100646260;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_time_t v3 = objc_retainBlock(v7);
  id v4 = objc_autoreleasePoolPush();
  -[PDDatabaseManager accessDatabaseUsingBlock:](self->_databaseManager, "accessDatabaseUsingBlock:", v3);
  objc_autoreleasePoolPop(v4);
  [(id)v9[5] sortUsingComparator:&stru_10064F088];
  id v5 = [(id)v9[5] copy];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_badgeCountItemsForPayLaterWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (databaseManager = self->_databaseManager,
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 associatedPassUniqueID]),
        LODWORD(databaseManager) = -[PDDatabaseManager passExistsWithUniqueID:]( databaseManager,  "passExistsWithUniqueID:",  v7),  v7,  (_DWORD)databaseManager))
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    id v23 = sub_100249570;
    int v24 = sub_100249580;
    id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if ([v5 stateReason] == (id)5)
    {
      uint64_t v8 = (void *)v21[5];
      int v9 = objc_alloc(&OBJC_CLASS___PKBadgeCountItem);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
      uint64_t v11 = -[PKBadgeCountItem initWithTitle:subtitle:count:]( v9,  "initWithTitle:subtitle:count:",  @"Pay Later Account fraud suspected",  v10,  1LL);
      [v8 addObject:v11];
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10024A06C;
    v19[3] = &unk_10064F0B0;
    v19[4] = self;
    v19[5] = &v20;
    uint64_t v12 = objc_retainBlock(v19);
    ((void (*)(void *, uint64_t, void))v12[2])( v12,  2LL,  PKSharedCachePayLaterPlanDisputeEvidenceRequiredPrefix);
    ((void (*)(void *, uint64_t, void))v12[2])(v12, 5LL, PKSharedCachePayLaterPlanDisputeSplitPrefix);
    ((void (*)(void *, uint64_t, void))v12[2])(v12, 4LL, PKSharedCachePayLaterPlanDisputeRejectedPrefix);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager financingPlanIdentifiersThatContainInstallmentWithStatus:]( self->_databaseManager,  "financingPlanIdentifiersThatContainInstallmentWithStatus:",  4LL));
    id v14 = [v13 count];

    unsigned int v15 = (void *)v21[5];
    id v16 = -[PKBadgeCountItem initWithTitle:subtitle:count:]( objc_alloc(&OBJC_CLASS___PKBadgeCountItem),  "initWithTitle:subtitle:count:",  @"Pay Later installments with status",  0LL,  v14);
    [v15 addObject:v16];

    id v17 = [(id)v21[5] copy];
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    id v17 = &__NSArray0__struct;
  }

  return v17;
}

- (void).cxx_destruct
{
}

@end