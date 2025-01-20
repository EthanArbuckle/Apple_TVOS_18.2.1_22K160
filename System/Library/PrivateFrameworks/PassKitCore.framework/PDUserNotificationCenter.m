@interface PDUserNotificationCenter
+ (BOOL)supportsSecureCoding;
+ (void)alertNotificationsEnabled:(id)a3;
- (NSArray)existingLocalNotifications;
- (OS_dispatch_queue)processingQueue;
- (PDDatabaseManager)databaseManager;
- (PDUserNotificationCenter)init;
- (PDUserNotificationCenter)initWithCoder:(id)a3;
- (PDUserNotificationCenterDelegate)delegate;
- (PDUserNotificationIconStore)iconStore;
- (id)_activeUserNotificationsSortedByDateAscending:(BOOL)a3;
- (id)_headerTitleForNotification:(id)a3;
- (id)_init;
- (id)_notificationCategories;
- (id)_notificationRequestForUserNotification:(id)a3 shouldInterrupt:(BOOL)a4;
- (id)_serviceNotificationCategories;
- (id)applicationMessageContentForNotificationIdentifier:(id)a3;
- (id)fileURLForAsset:(int64_t)a3 passUniqueIdentifier:(id)a4;
- (id)fileURLForImage:(id)a3 identifier:(id)a4;
- (id)notificationSettings;
- (id)passWithUniqueIdentifier:(id)a3;
- (void)_addUserNotification:(id)a3 shouldSuppress:(BOOL)a4;
- (void)_insertUserNotification:(id)a3;
- (void)_processConnectionOperations;
- (void)_processServiceConnectionOperations;
- (void)_queue_userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4;
- (void)_removeUserNotificationsWithIdentifiers:(id)a3;
- (void)_synchronizeDeliveredNotificationsWithCompletion:(id)a3;
- (void)_updateUserNotification:(id)a3 withExistingNotification:(id)a4 shouldSuppress:(BOOL)a5;
- (void)connect;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)insertUserNotification:(id)a3;
- (void)promoteSuppressedUserNotificationsIfPossible;
- (void)removeAllUserNotifications;
- (void)removeUserNotification:(id)a3;
- (void)removeUserNotificationWithIdentifier:(id)a3;
- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3;
- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4;
- (void)removeUserNotificationsOfType:(unint64_t)a3;
- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3;
- (void)requestNotificationAuthorizationWithCompletion:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconStore:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)updateApplicationMessageContentForNotification:(id)a3;
- (void)updateUserNotificationsForUpdatedExpressPassConfigurations:(id)a3;
- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationWithIdentifier:(id)a3 completion:(id)a4;
- (void)userNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4 completion:(id)a5;
- (void)userNotificationsOfType:(unint64_t)a3 completion:(id)a4;
@end

@implementation PDUserNotificationCenter

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDUserNotificationCenter;
  v2 = -[PDUserNotificationCenter init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingNotifications = v2->_pendingNotifications;
    v2->_pendingNotifications = v3;
  }

  return v2;
}

- (PDUserNotificationCenter)init
{
  v2 = -[PDUserNotificationCenter _init](self, "_init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    userNotifications = v2->_userNotifications;
    v2->_userNotifications = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    inflightUserNotifications = v2->_inflightUserNotifications;
    v2->_inflightUserNotifications = v5;
  }

  return v2;
}

- (void)dealloc
{
  internalNotificationCenter = self->_internalNotificationCenter;
  self->_internalNotificationCenter = 0LL;

  internalServiceNotificationCenter = self->_internalServiceNotificationCenter;
  self->_internalServiceNotificationCenter = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDUserNotificationCenter;
  -[PDUserNotificationCenter dealloc](&v5, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDUserNotificationCenter)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v6 = -[PDUserNotificationCenter _init](self, "_init");
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v5);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
    v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v9,  objc_opt_class(&OBJC_CLASS___PDUserNotification, v10),  0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"userNotifications"]);
    userNotifications = v6->_userNotifications;
    v6->_userNotifications = (NSMutableDictionary *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"inflightUserNoticiations"]);
    v16 = v15;
    if (v15) {
      v17 = v15;
    }
    else {
      v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    inflightUserNotifications = v6->_inflightUserNotifications;
    v6->_inflightUserNotifications = v17;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  userNotifications = self->_userNotifications;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100230238;
  v13[3] = &unk_10064DEE0;
  id v14 = v5;
  id v10 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( userNotifications,  "enumerateKeysAndObjectsUsingBlock:",  v13);
  [v4 encodeObject:v10 forKey:@"userNotifications"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  inflightUserNotifications = self->_inflightUserNotifications;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100230290;
  v11[3] = &unk_10064DEE0;
  id v12 = v7;
  id v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( inflightUserNotifications,  "enumerateKeysAndObjectsUsingBlock:",  v11);
  [v4 encodeObject:v9 forKey:@"inflightUserNoticiations"];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100230390;
  block[3] = &unk_100639AF0;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)processingQueue, block);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "request", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 content]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 PKStringForKey:PKPassbookBulletinPassUniqueIdentifierKey]);

  if ([v7 length]) {
    PDOpenWalletUI(0LL, v7);
  }
}

- (id)passWithUniqueIdentifier:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained passWithUniqueIdentifier:v4]);

  return v6;
}

- (id)fileURLForAsset:(int64_t)a3 passUniqueIdentifier:(id)a4
{
  return -[PDUserNotificationIconStore fileURLForAsset:passUniqueIdentifier:]( self->_iconStore,  "fileURLForAsset:passUniqueIdentifier:",  a3,  a4);
}

- (id)fileURLForImage:(id)a3 identifier:(id)a4
{
  return -[PDUserNotificationIconStore fileURLForImage:identifier:]( self->_iconStore,  "fileURLForImage:identifier:",  a3,  a4);
}

- (id)notificationSettings
{
  return -[UNUserNotificationCenter notificationSettings](self->_internalNotificationCenter, "notificationSettings");
}

- (void)connect
{
  if (self->_internalNotificationCenter && self->_userCenterConnected)
  {
    self->_userCenterConnected = 1;
    -[PDUserNotificationCenter _processConnectionOperations](self, "_processConnectionOperations");
  }

  else
  {
    v3 = objc_alloc(&OBJC_CLASS___UNUserNotificationCenter);
    id v4 = -[UNUserNotificationCenter initWithBundleIdentifier:]( v3,  "initWithBundleIdentifier:",  PKUserNotificationsBundleIdentifier);
    internalNotificationCenter = self->_internalNotificationCenter;
    self->_internalNotificationCenter = v4;

    objc_super v6 = self->_internalNotificationCenter;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotificationCenter _notificationCategories](self, "_notificationCategories"));
    -[UNUserNotificationCenter setNotificationCategories:](v6, "setNotificationCategories:", v7);

    -[UNUserNotificationCenter setDelegate:](self->_internalNotificationCenter, "setDelegate:", self);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( self->_internalNotificationCenter,  "setWantsNotificationResponsesDelivered");
    id v8 = self->_internalNotificationCenter;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1002308E8;
    v16[3] = &unk_10064DF08;
    v16[4] = self;
    -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:]( v8,  "getNotificationSettingsWithCompletionHandler:",  v16);
  }

  if (self->_internalServiceNotificationCenter && self->_serviceCenterConnected)
  {
    self->_serviceCenterConnected = 1;
    -[PDUserNotificationCenter _processServiceConnectionOperations](self, "_processServiceConnectionOperations");
  }

  else
  {
    id v9 = objc_alloc(&OBJC_CLASS___UNUserNotificationCenter);
    id v10 = -[UNUserNotificationCenter initWithBundleIdentifier:]( v9,  "initWithBundleIdentifier:",  PKServiceNotificationsBundleIdentifier);
    internalServiceNotificationCenter = self->_internalServiceNotificationCenter;
    self->_internalServiceNotificationCenter = v10;

    id v12 = self->_internalServiceNotificationCenter;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotificationCenter _serviceNotificationCategories](self, "_serviceNotificationCategories"));
    -[UNUserNotificationCenter setNotificationCategories:](v12, "setNotificationCategories:", v13);

    -[UNUserNotificationCenter setDelegate:](self->_internalServiceNotificationCenter, "setDelegate:", self);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( self->_internalServiceNotificationCenter,  "setWantsNotificationResponsesDelivered");
    id v14 = self->_internalServiceNotificationCenter;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100230C14;
    v15[3] = &unk_10064DF08;
    v15[4] = self;
    -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:]( v14,  "getNotificationSettingsWithCompletionHandler:",  v15);
  }

- (id)applicationMessageContentForNotificationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_userNotifications,  "objectForKeyedSubscript:",  v4));
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationMessageContent]);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDUserNotificationCenter: cannot get applicationMessageContent since there is no user notification with identifier %@",  (uint8_t *)&v11,  0xCu);
    }

    id v7 = 0LL;
  }

  return v7;
}

- (void)updateApplicationMessageContentForNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    processingQueue = self->_processingQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002310B4;
    v7[3] = &unk_1006392B0;
    id v8 = v4;
    id v9 = self;
    dispatch_async((dispatch_queue_t)processingQueue, v7);
  }
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDUserNotificationCenter: requestAuthorizationWithOptions",  buf,  2u);
  }

  internalNotificationCenter = self->_internalNotificationCenter;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002311F0;
  v9[3] = &unk_10063B468;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:]( internalNotificationCenter,  "requestAuthorizationWithOptions:completionHandler:",  7LL,  v9);
}

- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4
{
  id v6 = a4;
  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100231408;
  block[3] = &unk_10063A858;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)processingQueue, block);
}

- (void)_queue_userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"dismiss";
    if (a3 != 1) {
      id v9 = 0LL;
    }
    if (a3 == 2) {
      id v9 = @"defaultAction";
    }
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDUserNotificationCenter _queue_userNotificationActionPerformed: %@, applicationMessageContentIdentifier: %@",  (uint8_t *)&v11,  0x16u);
  }

  if (v6 && a3 - 1 <= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained removeNotificationApplicationMessageWithIdentifier:v6];
  }
}

- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PDUserNotificationCenter: requestNotificationAuthorizationIfNecessaryWithCompletion",  buf,  2u);
  }

  internalNotificationCenter = self->_internalNotificationCenter;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002315F8;
  v9[3] = &unk_10064DF30;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:]( internalNotificationCenter,  "getNotificationSettingsWithCompletionHandler:",  v9);
}

- (void)_processConnectionOperations
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = self->_pendingNotifications;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray pk_removeObjectsPassingTest:]( self->_pendingNotifications,  "pk_removeObjectsPassingTest:",  &stru_10064DF70);
  -[PDUserNotificationCenter promoteSuppressedUserNotificationsIfPossible]( self,  "promoteSuppressedUserNotificationsIfPossible");
}

- (void)_processServiceConnectionOperations
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = self->_pendingNotifications;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray pk_removeObjectsPassingTest:]( self->_pendingNotifications,  "pk_removeObjectsPassingTest:",  &stru_10064DF90);
  -[PDUserNotificationCenter promoteSuppressedUserNotificationsIfPossible]( self,  "promoteSuppressedUserNotificationsIfPossible");
}

- (void)promoteSuppressedUserNotificationsIfPossible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v4 = [WeakRetained userNotificationCenterShouldSuppressUserNotifications:self];

  if ((v4 & 1) == 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100231AD4;
    v5[3] = &unk_100639300;
    v5[4] = self;
    -[PDUserNotificationCenter _synchronizeDeliveredNotificationsWithCompletion:]( self,  "_synchronizeDeliveredNotificationsWithCompletion:",  v5);
  }

- (void)insertUserNotification:(id)a3
{
  id v4 = a3;
  if ([v4 isValid])
  {
    if (!self->_userCenterConnected && ([v4 isServiceNotification] & 1) == 0)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412546;
        id v12 = v4;
        __int16 v13 = 2112;
        id v14 = self;
        id v7 = "Cannot insert User Notification: %@ in Notification Center: %@ as connecting has not completed yet.";
        goto LABEL_14;
      }

- (void)_insertUserNotification:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100231F04;
  v5[3] = &unk_1006392B0;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  -[PDUserNotificationCenter _synchronizeDeliveredNotificationsWithCompletion:]( self,  "_synchronizeDeliveredNotificationsWithCompletion:",  v5);
}

- (void)updateUserNotificationsForUpdatedExpressPassConfigurations:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating User Notifications to reflect new Express Pass State",  buf,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pk_setByApplyingBlock:", &stru_10064DFD0));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"NOT (passUniqueIdentifier IN %@) AND (notificationType == %ul OR notificationType = %ul)",  v7,  28LL,  32LL));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_userNotifications, "allValues"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v8]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pk_arrayByApplyingBlock:", &stru_10064E010));

  -[PDUserNotificationCenter _removeUserNotificationsWithIdentifiers:]( self,  "_removeUserNotificationsWithIdentifiers:",  v11);
}

- (void)removeUserNotificationWithIdentifier:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

    -[PDUserNotificationCenter _removeUserNotificationsWithIdentifiers:]( self,  "_removeUserNotificationsWithIdentifiers:",  v5,  v6);
  }

- (void)removeUserNotification:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 notificationIdentifier]);
    id v6 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    -[PDUserNotificationCenter _removeUserNotificationsWithIdentifiers:]( self,  "_removeUserNotificationsWithIdentifiers:",  v5);
  }

- (void)removeUserNotificationsOfType:(unint64_t)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 0x51) {
      id v7 = @"unknown";
    }
    else {
      id v7 = *(&off_10064E1E8 + a3);
    }
    *(_DWORD *)buf = 138412546;
    __int16 v13 = v7;
    __int16 v14 = 2112;
    id v15 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing User Notifications of type: %@ from Notification Center: %@",  buf,  0x16u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"notificationType == %ul",  a3));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_userNotifications, "allValues"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v8]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pk_arrayByApplyingBlock:", &stru_10064E030));

  -[PDUserNotificationCenter _removeUserNotificationsWithIdentifiers:]( self,  "_removeUserNotificationsWithIdentifiers:",  v11);
}

- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 > 0x51) {
      __int128 v9 = @"unknown";
    }
    else {
      __int128 v9 = *(&off_10064E1E8 + a4);
    }
    *(_DWORD *)buf = 138412802;
    id v15 = v6;
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Removing User Notifications for Pass: %@ of type: %@ from Notification Center: %@",  buf,  0x20u);
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"passUniqueIdentifier == %@ AND notificationType == %ul",  v6,  a4));
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_userNotifications, "allValues"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 filteredArrayUsingPredicate:v10]);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pk_arrayByApplyingBlock:", &stru_10064E050));

  -[PDUserNotificationCenter _removeUserNotificationsWithIdentifiers:]( self,  "_removeUserNotificationsWithIdentifiers:",  v13);
}

- (void)removeUserNotificationsForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing User Notifications for Pass: %@ from Notification Center: %@",  buf,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"passUniqueIdentifier == %@",  v4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_userNotifications, "allValues"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 filteredArrayUsingPredicate:v7]);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pk_arrayByApplyingBlock:", &stru_10064E070));

  -[PDUserNotificationCenter _removeUserNotificationsWithIdentifiers:]( self,  "_removeUserNotificationsWithIdentifiers:",  v10);
}

- (void)removeAllUserNotifications
{
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing all User Notifications from Notification Center: %@",  (uint8_t *)&v6,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_userNotifications, "allKeys"));
  -[PDUserNotificationCenter _removeUserNotificationsWithIdentifiers:]( self,  "_removeUserNotificationsWithIdentifiers:",  v5);
}

- (void)userNotificationsOfType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100232B30;
    v8[3] = &unk_10063AEB0;
    v8[4] = self;
    unint64_t v10 = a3;
    id v9 = v6;
    -[PDUserNotificationCenter _synchronizeDeliveredNotificationsWithCompletion:]( self,  "_synchronizeDeliveredNotificationsWithCompletion:",  v8);
  }
}

- (void)userNotificationsForPassUniqueIdentifier:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100232CA0;
    v10[3] = &unk_10063C928;
    unint64_t v14 = a4;
    id v11 = v8;
    id v12 = self;
    id v13 = v9;
    -[PDUserNotificationCenter _synchronizeDeliveredNotificationsWithCompletion:]( self,  "_synchronizeDeliveredNotificationsWithCompletion:",  v10);
  }
}

- (void)userNotificationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100232DDC;
    v8[3] = &unk_100639AF0;
    v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    -[PDUserNotificationCenter _synchronizeDeliveredNotificationsWithCompletion:]( self,  "_synchronizeDeliveredNotificationsWithCompletion:",  v8);
  }
}

+ (void)alertNotificationsEnabled:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___UNUserNotificationCenter);
    uint64_t v5 = -[UNUserNotificationCenter initWithBundleIdentifier:]( v4,  "initWithBundleIdentifier:",  PKUserNotificationsBundleIdentifier);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100232EC4;
    v6[3] = &unk_10064E0B8;
    id v7 = v3;
    -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:]( v5,  "getNotificationSettingsWithCompletionHandler:",  v6);
  }
}

- (NSArray)existingLocalNotifications
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_userNotifications, "allValues");
}

- (id)_headerTitleForNotification:(id)a3
{
  id v4 = a3;
  if (PDIsWalletUserNotificationType((uint64_t)[v4 notificationType]))
  {
    uint64_t v5 = PKLocalizedString(@"WALLET");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
LABEL_11:
    __int16 v16 = (void *)v6;
    goto LABEL_12;
  }

  id v7 = [v4 familyNotificationType];
  if (v7)
  {
    if (v7 == (id)2)
    {
      uint64_t v15 = PKLocalizedMadisonString(@"ACCOUNT_USER_NOTIFICATION_TITLE_FORMAT");
      uint64_t v6 = objc_claimAutoreleasedReturnValue(v15);
    }

    else
    {
      if (v7 != (id)1)
      {
        __int16 v16 = 0LL;
        goto LABEL_12;
      }

      uint64_t v8 = PKLocalizedPeerPaymentLexingtonString(&CFSTR("PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_TRANSACTION_USER_NOTIFICA"
                                                        "TION_TITLE_FORMAT").isa);
      uint64_t v6 = objc_claimAutoreleasedReturnValue(v8);
    }

    goto LABEL_11;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 passUniqueIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained passWithUniqueIdentifier:v10]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 notificationCenterTitle]);
  if (v12)
  {
    if (PKPassbookIsCurrentlyAvailable())
    {
      uint64_t v13 = PKLocalizedString(@"TRANSACTION_USER_NOTIFICATION_TITLE_FORMAT", @"%@", v12);
      id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
    }

    else
    {
      id v14 = v12;
    }
  }

  else
  {
    uint64_t v18 = PKLocalizedString(@"WALLET");
    id v14 = (id)objc_claimAutoreleasedReturnValue(v18);
  }

  __int16 v16 = v14;

LABEL_12:
  return v16;
}

- (id)_notificationCategories
{
  registeredCategories = self->_registeredCategories;
  if (!registeredCategories)
  {
    v60 = self;
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v5 = [&off_100691088 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v62;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v62 != v7) {
            objc_enumerationMutation(&off_100691088);
          }
          id v9 = PDUserNotificationCategoryForType((uint64_t)[*(id *)(*((void *)&v61 + 1) + 8 * (void)v8) integerValue]);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          if ([v10 length])
          {
            id v11 = [[UNMutableNotificationCategory alloc] initWithIdentifier:v10];
            [v11 setOptions:1];
            -[NSMutableSet addObject:](v4, "addObject:", v11);
          }

          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [&off_100691088 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }

      while (v6);
    }

    id v12 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    uint64_t v13 = PDUserNotificationCategoryForType(2LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = [v12 initWithIdentifier:v14];

    v59 = v15;
    [v15 setOptions:4];
    -[NSMutableSet addObject:](v4, "addObject:", v15);
    id v16 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    v17 = PDUserNotificationCategoryForType(3LL);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v58 = [v16 initWithIdentifier:v18];

    [v58 setOptions:4];
    -[NSMutableSet addObject:](v4, "addObject:", v58);
    id v19 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    v20 = PDUserNotificationCategoryForType(4LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v57 = [v19 initWithIdentifier:v21];

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedUserNotificationStringForKey:arguments:]( &OBJC_CLASS___NSString,  "localizedUserNotificationStringForKey:arguments:",  @"NOTIFICATION_SUMMARY_TRANSACTIONS",  0LL));
    [v57 setHiddenPreviewsBodyPlaceholder:v22];

    [v57 setOptions:4];
    -[NSMutableSet addObject:](v4, "addObject:", v57);
    id v23 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    v24 = PDUserNotificationCategoryForType(5LL);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    id v26 = [v23 initWithIdentifier:v25];

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedUserNotificationStringForKey:arguments:]( &OBJC_CLASS___NSString,  "localizedUserNotificationStringForKey:arguments:",  @"NOTIFICATION_SUMMARY_TRANSACTIONS",  0LL));
    [v26 setHiddenPreviewsBodyPlaceholder:v27];

    [v26 setOptions:4];
    -[NSMutableSet addObject:](v4, "addObject:", v26);
    id v28 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    v29 = PDUserNotificationCategoryForType(7LL);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    id v56 = [v28 initWithIdentifier:v30];

    [v56 setOptions:4];
    -[NSMutableSet addObject:](v4, "addObject:", v56);
    id v31 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    v32 = PDUserNotificationCategoryForType(6LL);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    id v34 = [v31 initWithIdentifier:v33];

    [v34 setListPriority:1];
    [v34 setOptions:131076];
    -[NSMutableSet addObject:](v4, "addObject:", v34);
    id v35 = [[UNMutableNotificationCategory alloc] initWithIdentifier:@"PDUserNotificationTypeAccountPaymentDue"];
    [v35 setOptions:131076];
    -[NSMutableSet addObject:](v4, "addObject:", v35);
    id v36 = [[UNMutableNotificationCategory alloc] initWithIdentifier:@"PDUserNotificationTypeAccountPaymentPastDue"];
    [v36 setOptions:0x20000];
    -[NSMutableSet addObject:](v4, "addObject:", v36);
    id v37 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    v38 = PDUserNotificationCategoryForType(42LL);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    id v40 = [v37 initWithIdentifier:v39];

    [v40 setOptions:4];
    -[NSMutableSet addObject:](v4, "addObject:", v40);
    id v41 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    v42 = PDUserNotificationCategoryForType(32LL);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    id v44 = [v41 initWithIdentifier:v43];

    [v44 setOptions:131076];
    -[NSMutableSet addObject:](v4, "addObject:", v44);
    id v45 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    v46 = PDUserNotificationCategoryForType(63LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    id v48 = [v45 initWithIdentifier:v47];

    [v48 setOptions:4];
    -[NSMutableSet addObject:](v4, "addObject:", v48);
    id v49 = objc_alloc(&OBJC_CLASS___UNMutableNotificationCategory);
    v50 = PDUserNotificationCategoryForType(79LL);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    id v52 = [v49 initWithIdentifier:v51];

    [v52 setOptions:131073];
    -[NSMutableSet addObject:](v4, "addObject:", v52);
    v53 = (NSMutableSet *)-[NSMutableSet copy](v4, "copy");
    v54 = v60->_registeredCategories;
    v60->_registeredCategories = v53;

    registeredCategories = v60->_registeredCategories;
  }

  return registeredCategories;
}

- (id)_serviceNotificationCategories
{
  registeredServiceCategories = self->_registeredServiceCategories;
  if (!registeredServiceCategories)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = (NSMutableSet *)-[NSMutableSet copy](v4, "copy");
    id v6 = self->_registeredServiceCategories;
    self->_registeredServiceCategories = v5;

    registeredServiceCategories = self->_registeredServiceCategories;
  }

  return registeredServiceCategories;
}

- (id)_notificationRequestForUserNotification:(id)a3 shouldInterrupt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 notificationContentWithDataSource:self]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);

  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotificationCenter _headerTitleForNotification:](self, "_headerTitleForNotification:", v6));
    [v7 setTitle:v9];
  }

  id v10 = PDUserNotificationCategoryForNotification(v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v7 setCategoryIdentifier:v11];
  char v12 = PDIsWalletUserNotificationType((uint64_t)[v6 notificationType]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 passUniqueIdentifier]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 accountIdentifier]);
  id v15 = (void *)v14;
  if ((v12 & 1) == 0)
  {
    if (v13)
    {
      BOOL v33 = v4;
      v32 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore fileURLForAsset:passUniqueIdentifier:]( self->_iconStore,  "fileURLForAsset:passUniqueIdentifier:",  [v6 assetType],  v13));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v32 path]);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconAtPath:](&OBJC_CLASS___UNNotificationIcon, "iconAtPath:", v16));

      [v7 setIcon:v17];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v13));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 paymentPass]);
      unsigned __int8 v20 = [v19 hasAssociatedPeerPaymentAccount];
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 associatedAccountServiceAccountIdentifier]);

      v22 = (void *)objc_claimAutoreleasedReturnValue([v18 rawIcon]);
      if (!v22 || (v20 & 1) != 0)
      {
      }

      else
      {

        if (!v21) {
          [v7 setShouldShowSubordinateIcon:1];
        }
      }

      [v7 setThreadIdentifier:v13];

      BOOL v4 = v33;
      v24 = v32;
    }

    else
    {
      if (!v14) {
        goto LABEL_16;
      }
      id v23 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore fileURLForAsset:accountIdentifier:]( self->_iconStore,  "fileURLForAsset:accountIdentifier:",  [v6 assetType],  v14));
      v24 = v23;
      if (v23)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
        id v26 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconAtPath:](&OBJC_CLASS___UNNotificationIcon, "iconAtPath:", v25));

        [v7 setIcon:v26];
      }

      [v7 setThreadIdentifier:v15];
    }
  }

- (void)_addUserNotification:(id)a3 shouldSuppress:(BOOL)a4
{
  LODWORD(v4) = a4;
  id v6 = (PDUserNotificationCenter *)a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationCenter _activeUserNotificationsSortedByDateAscending:]( self,  "_activeUserNotificationsSortedByDateAscending:",  0LL));
  if ((unint64_t)[v7 count] < 0xA
    || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]),
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotificationCenter date](v6, "date")),
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 date]),
        id v11 = [v9 compare:v10],
        v10,
        v9,
        v8,
        v11 == (id)1))
  {
    char v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotificationCenter notificationIdentifier](v6, "notificationIdentifier"));
    id v13 = -[PDUserNotificationCenter suppressionBehavior](v6, "suppressionBehavior");
    if (v13) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = 0LL;
    }
    if (-[PDUserNotificationCenter notificationType](v6, "notificationType") == (id)28 && v13 == (id)2)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v31 = (PDUserNotificationCenter *)objc_opt_class(v6, v16);
        __int16 v32 = 2048;
        BOOL v33 = v6;
        v17 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Sending demoted express notification to Notification Center without interruptive notification: <%@: %p>",  buf,  0x16u);
      }

      uint64_t v4 = 1LL;
    }

    -[PDUserNotificationCenter setSuppressed:](v6, "setSuppressed:", v4);
    uint64_t v18 = PKLogFacilityTypeGetObject(0LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v6;
      __int16 v32 = 2112;
      BOOL v33 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Adding User Notification: %@ in Notification Center: %@",  buf,  0x16u);
    }

    -[NSMutableDictionary setObject:forKey:](self->_inflightUserNotifications, "setObject:forKey:", v6, v12);
    objc_initWeak((id *)buf, self);
    unsigned int v20 = -[PDUserNotificationCenter isServiceNotification](v6, "isServiceNotification");
    uint64_t v21 = 1LL;
    if (v20) {
      uint64_t v21 = 2LL;
    }
    v22 = (&self->super.isa)[v21];
    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationCenter _notificationRequestForUserNotification:shouldInterrupt:]( self,  "_notificationRequestForUserNotification:shouldInterrupt:",  v6,  v4 ^ 1));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100233CA8;
    v26[3] = &unk_10064E100;
    objc_copyWeak(&v29, (id *)buf);
    id v24 = v12;
    id v27 = v24;
    id v28 = v6;
    -[objc_class addNotificationRequest:withCompletionHandler:]( v22,  "addNotificationRequest:withCompletionHandler:",  v23,  v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    uint64_t v25 = PKLogFacilityTypeGetObject(0LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v6;
      __int16 v32 = 2112;
      BOOL v33 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  OS_LOG_TYPE_DEFAULT,  "Cannot add User Notification: %@ in Notification Center: %@ due to notification age.",  buf,  0x16u);
    }
  }
}

- (void)_updateUserNotification:(id)a3 withExistingNotification:(id)a4 shouldSuppress:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 notificationIdentifier]);
  id v11 = [v8 suppressionBehavior];
  if (a5)
  {
    if (v11)
    {
      unsigned int v12 = 0;
      uint64_t v13 = 1LL;
      goto LABEL_7;
    }
  }

  else if (v11 == (id)1)
  {
    [v9 isSuppressed];
  }

  unsigned int v12 = [v8 reissueBannerOnUpdate];
  uint64_t v13 = 0LL;
LABEL_7:
  [v8 setSuppressed:v13];
  unsigned int v14 = [v8 isServiceNotification];
  uint64_t v15 = 1LL;
  if (v14) {
    uint64_t v15 = 2LL;
  }
  uint64_t v16 = (&self->super.isa)[v15];
  if (v12)
  {
    objc_initWeak(&location, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationCenter _notificationRequestForUserNotification:shouldInterrupt:]( self,  "_notificationRequestForUserNotification:shouldInterrupt:",  v8,  1LL));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100234190;
    v25[3] = &unk_10064E100;
    objc_copyWeak(&v28, &location);
    id v26 = v10;
    id v27 = v8;
    -[objc_class addNotificationRequest:withCompletionHandler:]( v16,  "addNotificationRequest:withCompletionHandler:",  v17,  v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationCenter _notificationRequestForUserNotification:shouldInterrupt:]( self,  "_notificationRequestForUserNotification:shouldInterrupt:",  v8,  0LL));
    objc_initWeak(&location, self);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v18 content]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10023428C;
    v21[3] = &unk_10064E100;
    objc_copyWeak(&v24, &location);
    id v22 = v10;
    id v23 = v8;
    -[objc_class replaceContentForRequestWithIdentifier:replacementContent:completionHandler:]( v16,  "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:",  v19,  v20,  v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)_removeUserNotificationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing User Notifications: %@ from Notification Center: %@",  (uint8_t *)&v8,  0x16u);
    }

    -[NSMutableDictionary removeObjectsForKeys:](self->_userNotifications, "removeObjectsForKeys:", v4);
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( self->_internalNotificationCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v4);
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( self->_internalServiceNotificationCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v4);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained userNotificationCenter:self removedUserNotificationIdentifiers:v4];
  }
}

- (void)_synchronizeDeliveredNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  internalServiceNotificationCenter = self->_internalServiceNotificationCenter;
  v31[0] = self->_internalNotificationCenter;
  v31[1] = internalServiceNotificationCenter;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  v29[3] = 0LL;
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x3032000000LL;
  v27[3] = sub_100234680;
  v27[4] = sub_100234690;
  id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100234698;
  v21[3] = &unk_10064E168;
  uint64_t v25 = v27;
  id v26 = v29;
  id v7 = v6;
  id v22 = v7;
  id v23 = self;
  id v8 = v4;
  id v24 = v8;
  id v9 = objc_retainBlock(v21);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        unsigned int v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v13);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_100234920;
        v15[3] = &unk_1006415E8;
        uint64_t v16 = v9;
        [v14 getDeliveredNotificationsWithCompletionHandler:v15];

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v30 count:16];
    }

    while (v11);
  }

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
}

- (id)_activeUserNotificationsSortedByDateAscending:(BOOL)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isActive == YES"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002349FC;
  v11[3] = &unk_10064E188;
  BOOL v12 = a3;
  id v6 = objc_retainBlock(v11);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_userNotifications, "allValues"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 filteredArrayUsingPredicate:v5]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingComparator:v6]);
  return v9;
}

- (PDUserNotificationCenterDelegate)delegate
{
  return (PDUserNotificationCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  self->_processingQueue = (OS_dispatch_queue *)a3;
}

- (PDUserNotificationIconStore)iconStore
{
  return self->_iconStore;
}

- (void)setIconStore:(id)a3
{
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end