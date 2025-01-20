@interface PushNotificationDisplayOperation
+ (BOOL)_shouldUseBulletinBoardForNotification:(id)a3;
- (BOOL)_URLHandlerExists;
- (BOOL)_clientExistsWithIdentifier:(id)a3;
- (BOOL)requiresClientIdentifier;
- (NSDictionary)notificationUserInfo;
- (PushNotificationDisplayOperation)init;
- (PushNotificationDisplayOperation)initWithNotificationUserInfo:(id)a3;
- (id)_clientIdentifierForDownloadKinds:(id)a3;
- (int64_t)_notificationClass;
- (void)_displayAlert;
- (void)_displayBadge;
- (void)_loadNotificationDownloadManifest;
- (void)_openNotificationURL;
- (void)_performNotificationAction:(BOOL)a3;
- (void)run;
@end

@implementation PushNotificationDisplayOperation

- (PushNotificationDisplayOperation)init
{
  return -[PushNotificationDisplayOperation initWithNotificationUserInfo:](self, "initWithNotificationUserInfo:", 0LL);
}

- (PushNotificationDisplayOperation)initWithNotificationUserInfo:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"PushNotificationDisplayOperation.m" lineNumber:59 description:@"Must provide user info"];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PushNotificationDisplayOperation;
  v6 = -[PushNotificationDisplayOperation init](&v11, "init");
  if (v6)
  {
    v7 = -[SSRemoteNotification initWithNotificationUserInfo:]( objc_alloc(&OBJC_CLASS___SSRemoteNotification),  "initWithNotificationUserInfo:",  v5);
    notification = v6->_notification;
    v6->_notification = v7;
  }

  return v6;
}

- (NSDictionary)notificationUserInfo
{
  return (NSDictionary *)-[SSRemoteNotification notificationUserInfo](self->_notification, "notificationUserInfo");
}

- (BOOL)requiresClientIdentifier
{
  unint64_t v2 = (unint64_t)-[SSRemoteNotification actionType](self->_notification, "actionType");
  return (v2 > 0x1D) | (0x1FBD0481u >> v2) & 1;
}

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyClientIdentifier));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyAlertType));
    BOOL v5 = [v4 integerValue] == (id)1;

    if (!-[PushNotificationDisplayOperation _clientExistsWithIdentifier:](self, "_clientExistsWithIdentifier:", v3))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v6) {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v7 = [v6 shouldLog];
      else {
        LODWORD(v8) = v7;
      }
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v8 = v8;
      }
      else {
        v8 &= 2u;
      }
      if (!(_DWORD)v8) {
        goto LABEL_48;
      }
      *(_DWORD *)v30 = 138412546;
      *(void *)&v30[4] = objc_opt_class(self);
      *(_WORD *)&v30[12] = 2112;
      *(void *)&v30[14] = v3;
      id v10 = *(id *)&v30[4];
      uint64_t v11 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[%@]: Ignoring notification: no matching client: %@",  v30,  22,  *(_OWORD *)v30,  *(void *)&v30[16]);
      goto LABEL_13;
    }
  }

  else
  {
    BOOL v5 = 0;
  }

  if (-[PushNotificationDisplayOperation _URLHandlerExists](self, "_URLHandlerExists"))
  {
    if (!-[PushNotificationDisplayOperation requiresClientIdentifier](self, "requiresClientIdentifier")
      || (id)-[PushNotificationDisplayOperation _notificationClass](self, "_notificationClass") != (id)1)
    {
      -[PushNotificationDisplayOperation _displayBadge](self, "_displayBadge");
LABEL_50:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification alertBodyString](self->_notification, "alertBodyString", v29));
      if (-[SSRemoteNotification actionType](self->_notification, "actionType") == (id)12
        || ![v6 length])
      {
        -[PushNotificationDisplayOperation _performNotificationAction:](self, "_performNotificationAction:", 0LL);
      }

      else
      {
        -[PushNotificationDisplayOperation _displayAlert](self, "_displayAlert");
      }

      goto LABEL_54;
    }

    if (!v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v6) {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v27 = [v6 shouldLog];
      else {
        LODWORD(v28) = v27;
      }
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v28 = v28;
      }
      else {
        v28 &= 2u;
      }
      if (!(_DWORD)v28) {
        goto LABEL_48;
      }
      *(_DWORD *)v30 = 138412290;
      *(void *)&v30[4] = objc_opt_class(self);
      id v10 = *(id *)&v30[4];
      uint64_t v11 = _os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[%@]: Ignoring notification: invalid client ID",  v30,  12,  *(_OWORD *)v30,  *(void *)&v30[16]);
LABEL_13:
      v12 = (void *)v11;

      goto LABEL_46;
    }

    if (v5) {
      uint64_t v13 = 4LL;
    }
    else {
      uint64_t v13 = 0LL;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v15 = [v14 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      *(_DWORD *)v30 = 138412802;
      *(void *)&v30[4] = objc_opt_class(self);
      *(_WORD *)&v30[12] = 2112;
      *(void *)&v30[14] = v3;
      *(_WORD *)&v30[22] = 2048;
      uint64_t v31 = v13;
      id v18 = *(id *)&v30[4];
      v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[%@]: Display notification with enabled types: %@ => %ld",  v30,  32);

      if (!v19) {
        goto LABEL_34;
      }
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
      free(v19);
      v29 = v17;
      SSFileLog(v14, @"%@");
    }

LABEL_34:
    if (!v5) {
      goto LABEL_55;
    }
    goto LABEL_50;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v20 = [v6 shouldLog];
  else {
    LODWORD(v21) = v20;
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v21 = v21;
  }
  else {
    v21 &= 2u;
  }
  if (!(_DWORD)v21) {
    goto LABEL_48;
  }
  v22 = (void *)objc_opt_class(self);
  notification = self->_notification;
  uint64_t v24 = SSRemoteNotificationKeyURLString;
  id v25 = v22;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification valueForKey:](notification, "valueForKey:", v24));
  *(_DWORD *)v30 = 138412546;
  *(void *)&v30[4] = v22;
  *(_WORD *)&v30[12] = 2112;
  *(void *)&v30[14] = v26;
  v12 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[%@]: Ignoring notification: no handler for URL: %@",  v30,  22);

LABEL_46:
  if (v12)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    SSFileLog(v6, @"%@");
LABEL_48:
  }

- (BOOL)_clientExistsWithIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  a3,  0LL));
  unsigned __int8 v4 = [v3 foundBackingBundle];

  return v4;
}

- (id)_clientIdentifierForDownloadKinds:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:SSDownloadKindSoftwareApplication])
  {
    unsigned __int8 v4 = @"com.apple.AppStore";
  }

  else if ([v3 containsObject:SSDownloadKindEBook])
  {
    unsigned __int8 v4 = @"com.apple.iBooks";
  }

  else
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
          if ((SSDownloadKindIsMediaKind(v10) & 1) != 0 || (SSDownloadKindIsToneKind(v10) & 1) != 0)
          {
            unsigned __int8 v4 = @"com.apple.MobileStore";
            goto LABEL_17;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        unsigned __int8 v4 = 0LL;
        if (v7) {
          continue;
        }
        break;
      }
    }

    else
    {
      unsigned __int8 v4 = 0LL;
    }

- (void)_displayAlert
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification alertBodyString](self->_notification, "alertBodyString"));
  if ([v3 length])
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification alertTitleString](self->_notification, "alertTitleString"));
    unsigned int v5 = [(id)objc_opt_class(self) _shouldUseBulletinBoardForNotification:self->_notification];
    notification = self->_notification;
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( notification,  "valueForKey:",  SSRemoteNotificationKeyURLString));
      if ([v7 length]) {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
      }
      else {
        uint64_t v8 = 0LL;
      }
      v9 = (ISDialog *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyClientIdentifier));
      id v18 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification alertOKString](self->_notification, "alertOKString"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ISDialog lowercaseString](v9, "lowercaseString"));
      unsigned int v23 = [v22 isEqualToString:@"com.apple.appstore"];

      if (v23)
      {
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_10007DEC0;
        v28[3] = &unk_10034B058;
        v28[4] = self;
        +[AppStoreUtility postBulletinWithTitle:message:destinations:actionButtonTitle:actionButtonURL:launchURL:completionBlock:]( &OBJC_CLASS___AppStoreUtility,  "postBulletinWithTitle:message:destinations:actionButtonTitle:actionButtonURL:launchURL:completionBlock:",  v4,  v3,  12LL,  v18,  v8,  v8,  v28);
      }
    }

    else
    {
      v26 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification alertCancelString](notification, "alertCancelString"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification alertOKString](self->_notification, "alertOKString"));
      v9 = objc_alloc_init(&OBJC_CLASS___ISDialog);
      uint64_t v10 = objc_alloc(&OBJC_CLASS___NSArray);
      uint64_t v11 = &OBJC_CLASS___ISDialogButton;
      uint64_t v12 = (uint64_t)v7;
      if (!v7)
      {
        __int128 v13 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
        id v25 = (void *)objc_claimAutoreleasedReturnValue(v13);
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v25 localizedStringForKey:@"CANCEL" value:&stru_10035EB18 table:0]);
      }

      uint64_t v24 = (void *)v12;
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[ISDialogButton buttonWithTitle:](&OBJC_CLASS___ISDialogButton, "buttonWithTitle:", v12));
      __int128 v15 = v8;
      if (!v8)
      {
        uint64_t v16 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ISDialog));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"OK" value:&stru_10035EB18 table:0]);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[ISDialogButton buttonWithTitle:](&OBJC_CLASS___ISDialogButton, "buttonWithTitle:", v15));
      id v18 = -[NSArray initWithObjects:](v10, "initWithObjects:", v14, v17, 0LL);

      if (!v8)
      {
      }

      if (!v7)
      {
      }

      -[ISDialog setButtons:](v9, "setButtons:", v18);
      -[ISDialog setDismissOnLock:](v9, "setDismissOnLock:", 1LL);
      -[ISDialog setMessage:](v9, "setMessage:", v3);
      -[ISDialog setShouldDismissAfterUnlock:](v9, "setShouldDismissAfterUnlock:", 1LL);
      -[ISDialog setShouldDisplayAsTopMost:](v9, "setShouldDisplayAsTopMost:", 1LL);
      unsigned __int8 v4 = v26;
      -[ISDialog setTitle:](v9, "setTitle:", v26);
      -[ISDialog setUnlockActionButtonIndex:](v9, "setUnlockActionButtonIndex:", 1LL);
      id v19 = -[ISDialog copyUserNotification](v9, "copyUserNotification");
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[UserNotificationCenter defaultCenter](&OBJC_CLASS___UserNotificationCenter, "defaultCenter"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10007E064;
      v27[3] = &unk_10034C948;
      v27[4] = self;
      id v21 = [v20 showUserNotification:v19 withCompletionBlock:v27];
    }
  }
}

- (void)_displayBadge
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyClientIdentifier));
  if (v5)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification badgeValue](self->_notification, "badgeValue"));
    [v3 setBadgeValue:v4 forIdentifier:v5];
  }
}

- (void)_loadNotificationDownloadManifest
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification valueForKey:](self->_notification, "valueForKey:", SSRemoteNotificationKeyURLString));
  if (v9)
  {
    unint64_t v2 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v9);
    if (v2)
    {
      id v3 = v2;
      id v4 = objc_alloc(&OBJC_CLASS___SSDownloadManifestRequest);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](&OBJC_CLASS___NSURLRequest, "requestWithURL:", v3));
      id v6 = [v4 initWithURLRequest:v5];

      [v6 setManifestFormat:1];
      id v7 = -[LoadExternalDownloadManifestOperation initWithRequest:]( objc_alloc(&OBJC_CLASS___LoadExternalDownloadManifestOperation),  "initWithRequest:",  v6);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
      [v8 addOperation:v7];
    }
  }
}

- (int64_t)_notificationClass
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyNotificationClass));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)_openNotificationURL
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification valueForKey:](self->_notification, "valueForKey:", SSRemoteNotificationKeyURLString));
  if (v7)
  {
    unint64_t v2 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v7);
    if (v2)
    {
      id v3 = v2;
      id v4 = [[ISOpenURLRequest alloc] initWithURL:v2];
      [v4 setITunesStoreURL:0];
      id v5 = [[ISOpenURLOperation alloc] initWithOpenURLRequest:v4];
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
      [v6 addOperation:v5];
    }
  }
}

- (void)_performNotificationAction:(BOOL)a3
{
  BOOL v3 = a3;
  switch((unint64_t)-[SSRemoteNotification actionType](self->_notification, "actionType"))
  {
    case 1uLL:
    case 4uLL:
      if (v3) {
        -[PushNotificationDisplayOperation _openNotificationURL](self, "_openNotificationURL");
      }
      return;
    case 2uLL:
      id v83 = (id)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
      [v83 checkAutomaticDownloadQueue];

      return;
    case 3uLL:
      if (v3)
      {
        id v84 = (id)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyDownloadKinds));
        id v6 = objc_alloc(&OBJC_CLASS___SetAutomaticDownloadKindsOperation);
        id v7 = v6;
        if (v84)
        {
          uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:"));
          id v9 = (SetAutomaticDownloadKindsOperation *)[v7 initWithDownloadKinds:v8];

          id v7 = (void *)v8;
        }

        else
        {
          id v9 = -[SetAutomaticDownloadKindsOperation initWithDownloadKinds:](v6, "initWithDownloadKinds:");
        }

        v78 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
        [v78 addOperation:v9];

        goto LABEL_121;
      }

      return;
    case 5uLL:
      -[PushNotificationDisplayOperation _loadNotificationDownloadManifest](self, "_loadNotificationDownloadManifest");
      return;
    case 6uLL:
      uint64_t v10 = (SubscriptionStatusOperation *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyAccountIdentifier));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyAccountCredit));
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0) {
        goto LABEL_27;
      }
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0) {
        goto LABEL_27;
      }
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountWithUniqueIdentifier:v10]);
      if (!v15) {
        goto LABEL_26;
      }
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
      if (!v16) {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v17 = [v16 shouldLog];
      else {
        LODWORD(v18) = v17;
      }
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v18 = v18;
      }
      else {
        v18 &= 2u;
      }
      if (!(_DWORD)v18) {
        goto LABEL_24;
      }
      unsigned int v20 = (void *)objc_opt_class(self);
      id v85 = v20;
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 accountName]);
      uint64_t v22 = SSHashIfNeeded(v21);
      unsigned int v23 = (SubscriptionStatusOperation *)objc_claimAutoreleasedReturnValue(v22);
      int v87 = 138543618;
      id v88 = v20;
      __int16 v89 = 2114;
      v90 = v23;
      uint64_t v24 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%{public}@: Setting account credits. Saving %{public}@.",  &v87,  22);

      if (v24)
      {
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
        free(v24);
        SSFileLog(v16, @"%@");
LABEL_24:
      }

      [v15 setCreditsString:v11];
      [v14 saveAccount:v15 verifyCredentials:0 completion:0];
LABEL_26:

LABEL_27:
      goto LABEL_117;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      id v5 = (void *)ISWeakLinkedClassForString(@"APRequestHandler", 13LL);
      id v82 = (id)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification notificationUserInfo](self->_notification, "notificationUserInfo"));
      objc_msgSend(v5, "didReceiveStorePushNotificationWithPayload:");

      return;
    case 0xBuLL:
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 activeAccount]);
      id v84 = (id)objc_claimAutoreleasedReturnValue([v27 uniqueIdentifier]);

      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[StoreDownloadQueue sharedDownloadQueue](&OBJC_CLASS___StoreDownloadQueue, "sharedDownloadQueue"));
      [v25 checkQueuesWithReason:@"trigger-download" accountID:v84];
      goto LABEL_31;
    case 0xCuLL:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v29 = @"com.apple.itunesstored.PlaybackLeaseDidEnd";
      goto LABEL_51;
    case 0xDuLL:
      uint64_t v10 = (SubscriptionStatusOperation *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyDelayedGotoIdentifier));
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v10, v30) & 1) == 0) {
        goto LABEL_117;
      }
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v31) {
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v32 = [v31 shouldLog];
      else {
        LODWORD(v33) = v32;
      }
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        uint64_t v33 = v33;
      }
      else {
        v33 &= 2u;
      }
      if (!(_DWORD)v33) {
        goto LABEL_45;
      }
      int v87 = 138412546;
      id v88 = (id)objc_opt_class(self);
      __int16 v89 = 2112;
      v90 = v10;
      id v35 = v88;
      v36 = (void *)_os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  2LL,  "[%@]: Finish delayed goto for identifier: %@",  &v87,  22);

      if (v36)
      {
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL));
        free(v36);
        SSFileLog(v31, @"%@");
LABEL_45:
      }

      +[DelayedGotoSemaphore signalSemaphoreForPushToken:]( &OBJC_CLASS___DelayedGotoSemaphore,  "signalSemaphoreForPushToken:",  v10);
      goto LABEL_117;
    case 0xEuLL:
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___SubscriptionStatusOperation);
      -[SubscriptionStatusOperation setCarrierBundleProvisioningStyle:](v10, "setCarrierBundleProvisioningStyle:", 1LL);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification notificationUserInfo](self->_notification, "notificationUserInfo"));

      if (v37)
      {
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472LL;
        v86[2] = sub_10007F0F4;
        v86[3] = &unk_10034C970;
        v86[4] = self;
        -[SubscriptionStatusOperation setStatusBlock:](v10, "setStatusBlock:", v86);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
      [v38 addOperation:v10];

      goto LABEL_117;
    case 0xFuLL:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v29 = @"com.apple.itunesstored.mediacontenttastechangednotification";
LABEL_51:
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v29, 0LL, 0LL, 1u);
      return;
    case 0x11uLL:
      +[SSVSubscriptionEntitlementsCoordinator markCachedSubscriptionEntitlementsAsExpired]( &OBJC_CLASS___SSVSubscriptionEntitlementsCoordinator,  "markCachedSubscriptionEntitlementsAsExpired");
      return;
    case 0x1DuLL:
      v39 = (void *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyAccountIdentifier));
      uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
      {
        v41 = v39;
LABEL_57:
        uint64_t v10 = v41;
        goto LABEL_71;
      }

      uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v39, v42) & 1) != 0)
      {
        v41 = (SubscriptionStatusOperation *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v39 longLongValue]));
        goto LABEL_57;
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v43) {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v44 = [v43 shouldLog];
      else {
        LODWORD(v45) = v44;
      }
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 OSLogObject]);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        uint64_t v45 = v45;
      }
      else {
        v45 &= 2u;
      }
      if (!(_DWORD)v45) {
        goto LABEL_69;
      }
      int v87 = 138543362;
      id v88 = (id)objc_opt_class(self);
      id v47 = v88;
      v48 = (void *)_os_log_send_and_compose_impl( v45,  0LL,  0LL,  0LL,  &_mh_execute_header,  v46,  16LL,  "%{public}@: Resume buy failed to parse accountIdentifier",  &v87,  12);

      if (v48)
      {
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v48,  4LL));
        free(v48);
        v79 = v46;
        SSFileLog(v43, @"%@");
LABEL_69:
      }

      uint64_t v10 = 0LL;
LABEL_71:
      v49 = (void *)objc_claimAutoreleasedReturnValue( -[SSRemoteNotification valueForKey:]( self->_notification,  "valueForKey:",  SSRemoteNotificationKeyBuyParams,  v79));

      uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v49, v50) & 1) != 0)
      {
        id v51 = (id)objc_claimAutoreleasedReturnValue( +[NSURL queryStringForDictionary:escapedValues:]( &OBJC_CLASS___NSURL,  "queryStringForDictionary:escapedValues:",  v49,  1LL));
LABEL_75:
        v53 = v51;
        goto LABEL_89;
      }

      uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v49, v52) & 1) != 0)
      {
        id v51 = v49;
        goto LABEL_75;
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v54) {
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v55 = [v54 shouldLog];
      else {
        LODWORD(v56) = v55;
      }
      v57 = (os_log_s *)objc_claimAutoreleasedReturnValue([v54 OSLogObject]);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        uint64_t v56 = v56;
      }
      else {
        v56 &= 2u;
      }
      if (!(_DWORD)v56) {
        goto LABEL_87;
      }
      v58 = (void *)objc_opt_class(self);
      int v87 = 138543362;
      id v88 = v58;
      id v59 = v58;
      LODWORD(v81) = 12;
      v60 = (void *)_os_log_send_and_compose_impl( v56,  0LL,  0LL,  0LL,  &_mh_execute_header,  v57,  16LL,  "%{public}@: Resume buy failed to parse buyParams",  &v87,  v81);

      if (v60)
      {
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v60,  4LL));
        free(v60);
        v80 = v57;
        SSFileLog(v54, @"%@");
LABEL_87:
      }

      v53 = 0LL;
LABEL_89:
      uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v10, v61) & 1) != 0)
      {
        uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v53, v62) & 1) != 0)
        {
          v63 = objc_alloc_init(&OBJC_CLASS___SSPurchase);
          -[SSPurchase setAccountIdentifier:](v63, "setAccountIdentifier:", v10);
          -[SSPurchase setBuyParameters:](v63, "setBuyParameters:", v53);
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v64) {
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v65 = objc_msgSend(v64, "shouldLog", v80);
          else {
            LODWORD(v66) = v65;
          }
          v67 = (os_log_s *)objc_claimAutoreleasedReturnValue([v64 OSLogObject]);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v66 = v66;
          }
          else {
            v66 &= 2u;
          }
          if ((_DWORD)v66)
          {
            v68 = (void *)objc_opt_class(self);
            int v87 = 138543362;
            id v88 = v68;
            id v69 = v68;
            LODWORD(v81) = 12;
            v70 = (void *)_os_log_send_and_compose_impl( v66,  0LL,  0LL,  0LL,  &_mh_execute_header,  v67,  0LL,  "%{public}@: Attempting to resume buy",  &v87,  v81);

            if (!v70)
            {
LABEL_103:

              v71 = -[PurchaseOperation initWithPurchase:]( objc_alloc(&OBJC_CLASS___PurchaseOperation),  "initWithPurchase:",  v63);
              v72 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
              [v72 addOperation:v71];

              goto LABEL_115;
            }

            v67 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v70,  4LL));
            free(v70);
            SSFileLog(v64, @"%@");
          }

          goto LABEL_103;
        }
      }

      v63 = (SSPurchase *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v80));
      if (!v63) {
        v63 = (SSPurchase *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v73 = -[SSPurchase shouldLog](v63, "shouldLog");
      else {
        LODWORD(v74) = v73;
      }
      v71 = (PurchaseOperation *)objc_claimAutoreleasedReturnValue(-[SSPurchase OSLogObject](v63, "OSLogObject"));
      if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_ERROR)) {
        uint64_t v74 = v74;
      }
      else {
        v74 &= 2u;
      }
      if ((_DWORD)v74)
      {
        v75 = (void *)objc_opt_class(self);
        int v87 = 138543362;
        id v88 = v75;
        id v76 = v75;
        LODWORD(v81) = 12;
        v77 = (void *)_os_log_send_and_compose_impl( v74,  0LL,  0LL,  0LL,  &_mh_execute_header,  v71,  16LL,  "%{public}@: Resume buy failed for invalid notification arguments",  &v87,  v81);

        if (!v77) {
          goto LABEL_116;
        }
        v71 = (PurchaseOperation *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v77,  4LL));
        free(v77);
        SSFileLog(v63, @"%@");
      }

+ (BOOL)_shouldUseBulletinBoardForNotification:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:SSRemoteNotificationKeyClientIdentifier]);
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:SSRemoteNotificationKeyAlertType]);
    id v6 = [v5 integerValue];

    if (v6 == (id)1)
    {
      LOBYTE(v7) = 1;
    }

    else
    {
      unint64_t v8 = (unint64_t)[v3 actionType];
      if (v8 <= 0x16) {
        unsigned int v7 = (0x440002u >> v8) & 1;
      }
      else {
        LOBYTE(v7) = 0;
      }
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_URLHandlerExists
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSRemoteNotification tapUrl](self->_notification, "tapUrl"));
  if (v2)
  {
    id v3 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationsAvailableForOpeningURL:v3]);

    BOOL v6 = [v5 count] != 0;
  }

  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end