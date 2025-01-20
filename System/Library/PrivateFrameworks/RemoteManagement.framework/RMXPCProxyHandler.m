@interface RMXPCProxyHandler
+ (BOOL)_doesConnection:(id)a3 haveEntitlement:(id)a4;
+ (BOOL)_isConnection:(id)a3 fromApplicationIdentifier:(id)a4;
+ (id)_activeConfigurationsByTypeForTypes:(id)a3 persistentContainer:(id)a4 error:(id *)a5;
+ (id)_managementChannelWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)hasAccountChangesEntitlement;
- (BOOL)hasCommandLineEntitlement;
- (BOOL)hasConfigurationSubscriberEntitlement;
- (BOOL)hasEnrollmentEntitlement;
- (NSPersistentContainer)persistentContainer;
- (RMXPCProxyHandler)initWithXPCConnection:(id)a3 persistentContainer:(id)a4;
- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3;
- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4;
- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7;
- (void)fetchConfigurationsWithTypes:(id)a3 completionHandler:(id)a4;
- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4;
- (void)periodicSyncWithCompletionHandler:(id)a3;
- (void)queryForStatusAndErrorsWithKeyPaths:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)queryForStatusSubscriptionsWithIdentifiers:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)reportPluginDetailsWithCompletionHandler:(id)a3;
- (void)sendStatusData:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendStatusForKeyPaths:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)unenrollWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5;
- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation RMXPCProxyHandler

- (RMXPCProxyHandler)initWithXPCConnection:(id)a3 persistentContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RMXPCProxyHandler;
  v8 = -[RMXPCProxyHandler init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    unsigned int v10 = [(id)objc_opt_class(v8) _doesConnection:v6 haveEntitlement:@"com.apple.private.remotemanagement"];
    objc_storeStrong((id *)&v9->_persistentContainer, a4);
    v9->_hasCommandLineEntitlement = v10;
    if (v10)
    {
      *(_WORD *)&v9->_hasAccountChangesEntitlement = 257;
      unsigned __int8 v11 = 1;
    }

    else
    {
      v9->_hasConfigurationSubscriberEntitlement = [(id)objc_opt_class(v9) _doesConnection:v6 haveEntitlement:@"com.apple.private.remotemanagement.configuration-subscriber"];
      v9->_hasAccountChangesEntitlement = [(id)objc_opt_class(v9) _doesConnection:v6 haveEntitlement:@"com.apple.private.remotemanagement.account-changes"];
      unsigned __int8 v11 = [(id)objc_opt_class(v9) _doesConnection:v6 haveEntitlement:@"com.apple.private.remotemanagement.enrollment"];
    }

    v9->_hasEnrollmentEntitlement = v11;
  }

  return v9;
}

+ (BOOL)_doesConnection:(id)a3 haveEntitlement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:v7]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    unsigned __int8 v10 = [v8 BOOLValue];

    if ((v10 & 1) != 0)
    {
      unsigned __int8 v11 = 1;
      goto LABEL_11;
    }
  }

  else
  {
  }

  if ([v7 isEqualToString:@"com.apple.private.remotemanagement.account-changes"])
  {
    v12 = @"AAACCOUNTS.com.apple.accountsd";
  }

  else
  {
    if (![v7 isEqualToString:@"com.apple.private.remotemanagement.enrollment"])
    {
      unsigned __int8 v11 = 0;
      goto LABEL_11;
    }

    v12 = @"com.apple.TVSettings";
  }

  unsigned __int8 v11 = [a1 _isConnection:v6 fromApplicationIdentifier:v12];
LABEL_11:

  return v11;
}

+ (BOOL)_isConnection:(id)a3 fromApplicationIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"application-identifier"]);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100081988();
  }

  unsigned __int8 v8 = [v5 isEqualToString:v6];
  return v8;
}

- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    unsigned __int8 v8 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Enrolling from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Enrolling with %{public}@...", buf, 0xCu);
    }

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007DD20;
    v12[3] = &unk_1000BB198;
    id v13 = v6;
    id v14 = v7;
    [v10 enrollDeviceChannelWithURI:v13 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    unsigned __int8 v8 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Enrolling user channel from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Enrolling with account %{public}@...",  buf,  0xCu);
    }

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007E020;
    v12[3] = &unk_1000BB198;
    id v13 = v6;
    id v14 = v7;
    [v10 enrollUserChannelWithAccountIdentifier:v13 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    v16 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Enrolling DDM from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v16, &state);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Enrolling DDM with %{public}@...", buf, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10007E354;
    v20[3] = &unk_1000BB198;
    id v21 = v12;
    id v22 = v15;
    [v18 enrollViaMDMWithEnrollmentType:a3 uri:v21 accountIdentifier:v13 personaIdentifier:v14 completionHandler:v20];

    os_activity_scope_leave(&state);
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0LL, v19);
  }
}

- (void)unenrollWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    unsigned __int8 v8 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Unenrolling from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unenrolling %{public}@...", buf, 0xCu);
    }

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007E654;
    v12[3] = &unk_1000B8F58;
    id v13 = v6;
    id v14 = v7;
    [v10 unenrollWithIdentifier:v13 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    unsigned __int8 v8 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Syncing from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Syncing %{public}@...", buf, 0xCu);
    }

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007E968;
    v12[3] = &unk_1000B8EE0;
    id v13 = v6;
    id v14 = v7;
    [v10 syncWithIdentifier:v13 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)periodicSyncWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    id v5 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Periodic sync from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Periodic sync...", buf, 2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10007EBCC;
    v8[3] = &unk_1000BAAD8;
    id v9 = v4;
    [v7 syncAllManagementSourcesWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v5 = (os_activity_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, os_activity_s *))v4 + 2))(v4, v5);
  }
}

- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    unsigned __int8 v11 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Updating from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating %{public}@ with push message...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10007EE7C;
    v15[3] = &unk_1000B8EE0;
    id v16 = v8;
    id v17 = v10;
    [v13 updateWithIdentifier:v16 pushMessage:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    unsigned __int8 v11 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Updating from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating %{public}@ with sync tokens response..",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10007F16C;
    v15[3] = &unk_1000B8EE0;
    id v16 = v8;
    id v17 = v10;
    [v13 updateWithIdentifier:v16 tokensResponse:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    id v5 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Checking device enrollment from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checking device enrollment", buf, 2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10007F3D4;
    v8[3] = &unk_1000BB1C0;
    id v9 = v4;
    [v7 deviceChannelEnrollmentExistsWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v5 = (os_activity_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void, os_activity_s *))v4 + 2))(v4, 0LL, v5);
  }
}

- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Finding management channel from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finding management channel", buf, 2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10007F63C;
    v11[3] = &unk_1000BB1E8;
    id v12 = v7;
    [v10 managementChannelWithAccountIdentifier:v6 completionHandler:v11];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v8 = (os_activity_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void, os_activity_s *))v7 + 2))(v7, 0LL, v8);
  }
}

- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMXPCProxyHandler hasEnrollmentEntitlement](self, "hasEnrollmentEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Finding management channel from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finding management channel", buf, 2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10007F8C0;
    v11[3] = &unk_1000BB1E8;
    id v12 = v7;
    [v10 managementChannelWithEnrollmentURL:v6 completionHandler:v11];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v8 = (os_activity_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void, os_activity_s *))v7 + 2))(v7, 0LL, v8);
  }
}

- (void)sendStatusData:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMXPCProxyHandler hasCommandLineEntitlement](self, "hasCommandLineEntitlement"))
  {
    unsigned __int8 v11 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Sending status data from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Sending status data to %{public}@...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10007FBB8;
    v15[3] = &unk_1000B8EE0;
    id v16 = v9;
    id v17 = v10;
    [v13 sendStatusData:v8 toManagementSourceWithIdentifier:v16 completionHandler:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

+ (id)_managementChannelWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_10007FE34;
  v28 = sub_10007FE44;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_10007FE34;
  id v22 = sub_10007FE44;
  id v23 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RMPersistentController sharedController](&OBJC_CLASS___RMPersistentController, "sharedController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentContainer]);
  id v8 = [v7 newBackgroundContext];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007FE4C;
  v14[3] = &unk_1000B9738;
  id v9 = v5;
  id v15 = v9;
  id v16 = &v18;
  id v17 = &v24;
  [v8 performBlockAndWait:v14];
  id v10 = (void *)v25[5];
  if (v10)
  {
    id v11 = v10;
  }

  else if (a4)
  {
    id v13 = (void *)v19[5];
    if (v13) {
      *a4 = v13;
    }
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (void)queryForStatusAndErrorsWithKeyPaths:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *, void))a5;
  if (-[RMXPCProxyHandler hasCommandLineEntitlement](self, "hasCommandLineEntitlement"))
  {
    id v11 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Querying for status and errors from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v8;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", @", "));

      *(_DWORD *)buf = 138543618;
      v30 = v15;
      __int16 v31 = 2114;
      id v32 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Querying for status and errors with key paths %{public}@ from %{public}@...",  buf,  0x16u);
    }

    id v27 = 0LL;
    id v16 = [(id)objc_opt_class(self) _managementChannelWithIdentifier:v9 error:&v27];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = v27;
    if (v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMExternalStatusPublisher,  "sharedPublisher"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
      [v19 publishStatusKeys:v20 storeIdentifier:v9];

      id v21 = objc_opt_new(&OBJC_CLASS___RMStatusQuerier);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
      id v23 = (void *)objc_claimAutoreleasedReturnValue( -[RMStatusQuerier queryForStatusWithKeyPaths:onBehalfOfManagementChannel:]( v21,  "queryForStatusWithKeyPaths:onBehalfOfManagementChannel:",  v22,  v17));

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 statusByKeyPath]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 errorByKeyPath]);
      v10[2](v10, v24, v25, 0LL);
    }

    else
    {
      ((void (**)(id, void *, void *, id))v10)[2](v10, 0LL, 0LL, v18);
    }

    os_activity_scope_leave(&state);
  }

  else
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    ((void (**)(id, void *, void *, void *))v10)[2](v10, 0LL, 0LL, v26);
  }
}

- (void)sendStatusForKeyPaths:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMXPCProxyHandler hasCommandLineEntitlement](self, "hasCommandLineEntitlement"))
  {
    v40 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Querying and sending status of specific type from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v40, &state);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v8;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", @", "));

      *(_DWORD *)buf = 138543618;
      v49 = v14;
      __int16 v50 = 2114;
      id v51 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Querying and sending status with key paths %{public}@ to %{public}@...",  buf,  0x16u);
    }

    id v46 = 0LL;
    id v15 = [(id)objc_opt_class(self) _managementChannelWithIdentifier:v9 error:&v46];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = v46;
    id v18 = v17;
    if (v16)
    {
      v19 = objc_opt_new(&OBJC_CLASS___RMStatusQuerier);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
      id v21 = (void *)objc_claimAutoreleasedReturnValue( -[RMStatusQuerier queryForStatusWithKeyPaths:onBehalfOfManagementChannel:]( v19,  "queryForStatusWithKeyPaths:onBehalfOfManagementChannel:",  v20,  v16));

      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 protocolStatusReportWithFullReport:0]);
      id v45 = v18;
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 serializeAsDataWithType:1 error:&v45]);
      id v24 = v45;

      if (v23)
      {
        id v39 = v24;
        id v25 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_100080638;
        v41[3] = &unk_1000B8F30;
        id v42 = v8;
        id v26 = v9;
        id v27 = v16;
        v28 = v22;
        id v29 = v9;
        id v30 = v8;
        __int16 v31 = v21;
        id v32 = v19;
        id v33 = v26;
        id v43 = v26;
        id v44 = v10;
        id v34 = v33;
        v35 = v32;
        v36 = v31;
        id v8 = v30;
        id v9 = v29;
        v37 = v28;
        id v16 = v27;
        [v25 sendStatusData:v23 toManagementSourceWithIdentifier:v34 completionHandler:v41];

        id v24 = v39;
LABEL_11:

        os_activity_scope_leave(&state);
        goto LABEL_12;
      }
    }

    else
    {
      id v24 = v17;
    }

    (*((void (**)(id, id))v10 + 2))(v10, v24);
    goto LABEL_11;
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
  (*((void (**)(id, void *))v10 + 2))(v10, v38);

LABEL_12:
}

- (void)queryForStatusSubscriptionsWithIdentifiers:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMXPCProxyHandler hasCommandLineEntitlement](self, "hasCommandLineEntitlement"))
  {
    id v11 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Querying for status subscriptions from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v8;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", @", "));

      *(_DWORD *)buf = 138543618;
      id v24 = v15;
      __int16 v25 = 2114;
      id v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Querying for status subscriptions with identifiers %{public}@ from %{public}@...",  buf,  0x16u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000809F4;
    v19[3] = &unk_1000BB210;
    id v20 = v9;
    id v21 = v10;
    [v16 queryForStatusSubscriptionsWithIdentifiers:v17 fromManagementSourceWithIdentifier:v20 completionHandler:v19];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v18);
  }
}

- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMXPCProxyHandler hasCommandLineEntitlement](self, "hasCommandLineEntitlement"))
  {
    id v11 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Querying and sending status subscriptions from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v8;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", @", "));

      *(_DWORD *)buf = 138543618;
      __int16 v25 = v15;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Querying and sending status subscriptions with identifiers %{public}@ to %{public}@...",  buf,  0x16u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100080D7C;
    v19[3] = &unk_1000B8F30;
    id v20 = v8;
    id v21 = v9;
    id v22 = v10;
    [v16 sendStatusForSubscriptionsWithIdentifiers:v17 toManagementSourceWithIdentifier:v21 completionHandler:v19];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    (*((void (**)(id, void *))v10 + 2))(v10, v18);
  }
}

- (void)fetchConfigurationsWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if (-[RMXPCProxyHandler hasConfigurationSubscriberEntitlement](self, "hasConfigurationSubscriberEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Fetching configurations",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Fetching configurations for: %{public}@",  buf,  0xCu);
    }

    id v10 = (void *)objc_opt_class(self);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMXPCProxyHandler persistentContainer](self, "persistentContainer"));
    id v23 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 _activeConfigurationsByTypeForTypes:v6 persistentContainer:v11 error:&v23]);
    id v13 = v23;

    if (v12)
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v6;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsJoinedByString:", @", "));

        *(_DWORD *)buf = 138543618;
        id v26 = v17;
        __int16 v27 = 2114;
        id v28 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Fetched configurations of types %{public}@: %{public}@",  buf,  0x16u);
      }

      v7[2](v7, v12, 0LL);
    }

    else
    {
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = v6;
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", @", "));

        *(_DWORD *)buf = 138543618;
        id v26 = v22;
        __int16 v27 = 2114;
        id v28 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Could not fetch configurations of types %{public}@: %{public}@",  buf,  0x16u);
      }

      ((void (**)(id, void *, id))v7)[2](v7, 0LL, v13);
    }

    os_activity_scope_leave(&state);
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.configuration-subscriber"));
    ((void (**)(id, void *, void *))v7)[2](v7, 0LL, v18);
  }
}

+ (id)_activeConfigurationsByTypeForTypes:(id)a3 persistentContainer:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = -[RMConfigurationQuerier initWithPersistentContainer:]( objc_alloc(&OBJC_CLASS___RMConfigurationQuerier),  "initWithPersistentContainer:",  v7);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[RMConfigurationQuerier activeConfigurationsByTypeForTypes:error:]( v9,  "activeConfigurationsByTypeForTypes:error:",  v8,  a5));
  return v10;
}

- (void)reportPluginDetailsWithCompletionHandler:(id)a3
{
  v35 = (void (**)(id, NSMutableDictionary *, void))a3;
  if (-[RMXPCProxyHandler hasCommandLineEntitlement](self, "hasCommandLineEntitlement"))
  {
    id v33 = _os_activity_create( (void *)&_mh_execute_header,  "XPCProxyHandler: Query plugins",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v33, &state);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog XPCListenerDelegate](&OBJC_CLASS___RMLog, "XPCListenerDelegate"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Query plugins", buf, 2u);
    }

    v36 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPublisher reportDetails](&OBJC_CLASS___RMConfigurationPublisher, "reportDetails"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMExternalStatusPublisher,  "sharedPublisher"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 reportDetails]);

    id v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v43 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          id v13 = objc_msgSend(v12, "mutableCopy", v33);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Identifier"]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, v14);
        }

        id v9 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      }

      while (v9);
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v39;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)j);
          id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", @"Identifier", v33));
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v20));
          if (v21)
          {
            id v22 = (id)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"StatusItems"]);
            [v21 setObject:v22 forKeyedSubscript:@"StatusItems"];
          }

          else
          {
            id v22 = [v19 mutableCopy];
            -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v22, v20);
          }
        }

        id v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }

      while (v16);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v8, "allValues"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 sortedArrayUsingComparator:&stru_1000BB250]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v24, @"Plugins");

    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelConfigurationSchema schemas](&OBJC_CLASS___RMModelConfigurationSchema, "schemas"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 allKeys]);

    if ([v26 count])
    {
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v36,  "setObject:forKeyedSubscript:",  v27,  @"Dynamic Configurations");
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelStatusSchema schemas](&OBJC_CLASS___RMModelStatusSchema, "schemas", v33));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allKeys]);

    if ([v29 count])
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v36,  "setObject:forKeyedSubscript:",  v30,  @"Dynamic Status");
    }

    v35[2](v35, v36, 0LL);

    os_activity_scope_leave(&state);
    __int16 v31 = v35;
  }

  else
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement"));
    __int16 v31 = v35;
    ((void (**)(id, NSMutableDictionary *, void *))v35)[2](v35, 0LL, v32);
  }
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (BOOL)hasCommandLineEntitlement
{
  return self->_hasCommandLineEntitlement;
}

- (BOOL)hasAccountChangesEntitlement
{
  return self->_hasAccountChangesEntitlement;
}

- (BOOL)hasConfigurationSubscriberEntitlement
{
  return self->_hasConfigurationSubscriberEntitlement;
}

- (BOOL)hasEnrollmentEntitlement
{
  return self->_hasEnrollmentEntitlement;
}

- (void).cxx_destruct
{
}

  ;
}

@end