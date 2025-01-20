@interface RMStoreXPCProxyHandler
+ (BOOL)_doesConnection:(id)a3 haveEntitlements:(id)a4;
+ (BOOL)_isConnection:(id)a3 fromApplicationIdentifier:(id)a4;
+ (id)_applicationIdentifierFromConnection:(id)a3;
- (BOOL)hasAnyStoreEntitlement;
- (BOOL)hasCommandLineEntitlement;
- (BOOL)hasObserverEntitlement;
- (BOOL)hasProviderEntitlement;
- (BOOL)hasSubscriberEntitlement;
- (NSPersistentContainer)persistentContainer;
- (RMStoreXPCProxyHandler)initWithXPCConnection:(id)a3 persistentContainer:(id)a4;
- (void)applyChangesForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)certificatePersistentRefForAssetKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)certificateStatusWithStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)configurationUIsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)createStoreWithType:(int64_t)a3 defaultToInteractive:(BOOL)a4 dataSeparated:(BOOL)a5 options:(id)a6 completionHandler:(id)a7;
- (void)declarationManifestForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)declarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)declarationsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)declarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteDeclarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)displayableProfileConfigurationsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchDataAtURL:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)metadataForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)metadataValueForKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)observerStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)observerStoresWithCompletionHandler:(id)a3;
- (void)providerStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)providerStoresWithCompletionHandler:(id)a3;
- (void)publishStatusWithStoreIdentifier:(id)a3 status:(id)a4 completionHandler:(id)a5;
- (void)removeStatusWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6 completionHandler:(id)a7;
- (void)removeStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6;
- (void)resolveAsset:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)saveDeclaration:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setConfigurationUIWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 visible:(BOOL)a6 ui:(id)a7 completionHandler:(id)a8;
- (void)setMetadataValue:(id)a3 forKey:(id)a4 storeIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 storeIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6;
- (void)subscribedDeclarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)subscribedStoreConfigurationsVisibleUIWithTypes:(id)a3 completionHandler:(id)a4;
- (void)subscribedStoreDeclarationsWithTypes:(id)a3 completionHandler:(id)a4;
- (void)subscriberStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)subscriberStoresWithCompletionHandler:(id)a3;
- (void)unassignAssets:(id)a3 completionHandler:(id)a4;
- (void)writeStatusWithStoreIdentifier:(id)a3 declarationType:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 sourceIdentifier:(id)a7 validity:(BOOL)a8 reasons:(id)a9 completionHandler:(id)a10;
@end

@implementation RMStoreXPCProxyHandler

- (RMStoreXPCProxyHandler)initWithXPCConnection:(id)a3 persistentContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RMStoreXPCProxyHandler;
  v8 = -[RMStoreXPCProxyHandler init](&v20, "init");
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_opt_class(v8);
    v24 = @"com.apple.private.remotemanagement";
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
    LODWORD(v10) = [v10 _doesConnection:v6 haveEntitlements:v11];

    objc_storeStrong((id *)&v9->_persistentContainer, a4);
    v9->_hasCommandLineEntitlement = (char)v10;
    if ((_DWORD)v10)
    {
      *(_WORD *)&v9->_hasObserverEntitlement = 257;
      v9->_hasSubscriberEntitlement = 1;
      BOOL v12 = 1;
    }

    else
    {
      v13 = (void *)objc_opt_class(v9);
      v23[0] = @"com.apple.private.remotemanagement.observer";
      v23[1] = @"com.apple.private.remotemanagement.provider";
      v23[2] = @"com.apple.private.remotemanagement.subscriber";
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));
      v9->_hasObserverEntitlement = [v13 _doesConnection:v6 haveEntitlements:v14];

      v15 = (void *)objc_opt_class(v9);
      v22 = @"com.apple.private.remotemanagement.provider";
      BOOL v12 = 1;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
      v9->_hasProviderEntitlement = [v15 _doesConnection:v6 haveEntitlements:v16];

      v17 = (void *)objc_opt_class(v9);
      v21 = @"com.apple.private.remotemanagement.subscriber";
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
      v9->_hasSubscriberEntitlement = [v17 _doesConnection:v6 haveEntitlements:v18];

      if (!v9->_hasProviderEntitlement) {
        BOOL v12 = v9->_hasObserverEntitlement || v9->_hasSubscriberEntitlement;
      }
    }

    v9->_hasAnyStoreEntitlement = v12;
  }

  return v9;
}

+ (BOOL)_doesConnection:(id)a3 haveEntitlements:(id)a4
{
  id v5 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:v11]);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          unsigned __int8 v14 = [v12 BOOLValue];

          if ((v14 & 1) != 0) {
            goto LABEL_15;
          }
        }

        else
        {
        }

        if ([v11 isEqualToString:@"com.apple.private.remotemanagement.observer"]
          && ([a1 _isConnection:v5 fromApplicationIdentifier:@"com.apple.TVSettings"] & 1) != 0)
        {
LABEL_15:
          BOOL v15 = 1;
          goto LABEL_16;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 0;
LABEL_16:

  return v15;
}

+ (id)_applicationIdentifierFromConnection:(id)a3
{
  return [a3 valueForEntitlement:@"com.apple.application-identifier"];
}

+ (BOOL)_isConnection:(id)a3 fromApplicationIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _applicationIdentifierFromConnection:a3]);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10007A074();
  }

  unsigned __int8 v9 = [v6 isEqualToString:v7];
  return v9;
}

- (void)observerStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: ObserverStoreWithIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ObserverStoreWithIdentifier with %{public}@...",  buf,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100074BF8;
    v12[3] = &unk_1000BAF30;
    id v13 = v7;
    [v10 observerStoreWithIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.observer"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)observerStoresWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    id v5 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: ObserverStoresWithCompletionHandler from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ObserverStoresWithCompletionHandler...",  buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100074E14;
    v8[3] = &unk_1000BAF58;
    id v9 = v4;
    [v7 observerStoresWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v5 = (os_activity_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.observer"));
    (*((void (**)(id, void, os_activity_s *))v4 + 2))(v4, 0LL, v5);
  }
}

- (void)declarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: DeclarationWithIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "DeclarationWithIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000750A8;
    v15[3] = &unk_1000BAF80;
    id v16 = v10;
    [v13 declarationWithIdentifier:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.observer"));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v14);
  }
}

- (void)declarationsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: DeclarationsForStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "DeclarationsForStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100075320;
    v12[3] = &unk_1000BAF58;
    id v13 = v7;
    [v10 declarationsForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.observer"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)declarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: DeclarationsWithTypes from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "DeclarationsWithTypes with %{public}@...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000755B4;
    v15[3] = &unk_1000BAF58;
    id v16 = v10;
    [v13 declarationsWithTypes:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.observer"));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v14);
  }
}

- (void)declarationManifestForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: DeclarationManifestForStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "DeclarationManifestForStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007582C;
    v12[3] = &unk_1000BAFA8;
    id v13 = v7;
    [v10 declarationManifestForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.observer"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)configurationUIsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: ConfigurationUIsForStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ConfigurationUIsForStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100075AA4;
    v12[3] = &unk_1000BAF58;
    id v13 = v7;
    [v10 configurationUIsForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.observer"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)displayableProfileConfigurationsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: DisplayableProfileConfigurationsForStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "DisplayableProfileConfigurationsForStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100075D1C;
    v12[3] = &unk_1000BAF58;
    id v13 = v7;
    [v10 displayableProfileConfigurationsForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.observer"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 storeIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = (void (**)(id, void *))a6;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    BOOL v12 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SetShouldInstallConfiguration from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v12, &v17);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 declarationIdentifier]);
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SetShouldInstallConfiguration with %{public}@...",  buf,  0xCu);
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createNotImplementedErrorForFeature:]( &OBJC_CLASS___RMErrorUtilities,  "createNotImplementedErrorForFeature:",  @"SetShouldInstallConfiguration"));
    v11[2](v11, v15);

    os_activity_scope_leave(&v17);
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.observer"));
    v11[2](v11, v16);
  }
}

- (void)fetchDataAtURL:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMStoreXPCProxyHandler hasObserverEntitlement](self, "hasObserverEntitlement"))
  {
    v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: FetchDataForURL from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "FetchDataForURL with %{public}@...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100076178;
    v15[3] = &unk_1000BAFD0;
    id v16 = v10;
    [v13 fetchDataAtURL:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v14);
  }
}

- (void)createStoreWithType:(int64_t)a3 defaultToInteractive:(BOOL)a4 dataSeparated:(BOOL)a5 options:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = a7;
  if (-[RMStoreXPCProxyHandler hasProviderEntitlement](self, "hasProviderEntitlement"))
  {
    unsigned __int8 v14 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: CreateStoreWithType from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v14, &state);
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CreateStoreWithType...", buf, 2u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000763D4;
    v18[3] = &unk_1000BAFF8;
    id v19 = v13;
    [v16 createStoreWithType:a3 defaultToInteractive:v9 dataSeparated:v8 options:v12 completionHandler:v18];

    os_activity_scope_leave(&state);
  }

  else
  {
    os_activity_scope_state_s v17 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.provider"));
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v17);
  }
}

- (void)removeStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasProviderEntitlement](self, "hasProviderEntitlement"))
  {
    BOOL v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: RemoveStoreWithIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "RemoveStoreWithIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100076648;
    v12[3] = &unk_1000BAAD8;
    id v13 = v7;
    [v10 removeStoreWithIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.provider"));
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)providerStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasProviderEntitlement](self, "hasProviderEntitlement"))
  {
    BOOL v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: ProviderStoreWithIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ProviderStoreWithIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000768A8;
    v12[3] = &unk_1000BAFF8;
    id v13 = v7;
    [v10 providerStoreWithIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.provider"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)providerStoresWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (-[RMStoreXPCProxyHandler hasProviderEntitlement](self, "hasProviderEntitlement"))
  {
    id v5 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: ProviderStoresWithCompletionHandler from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ProviderStoresWithCompletionHandler...",  buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100076AC4;
    v8[3] = &unk_1000BAF58;
    id v9 = v4;
    [v7 providerStoresWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v5 = (os_activity_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.provider"));
    (*((void (**)(id, void, os_activity_s *))v4 + 2))(v4, 0LL, v5);
  }
}

- (void)saveDeclaration:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMStoreXPCProxyHandler hasProviderEntitlement](self, "hasProviderEntitlement"))
  {
    v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SaveDeclaration from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 declarationIdentifier]);
      *(_DWORD *)buf = 138543362;
      __int128 v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "SaveDeclaration with %{public}@...",  buf,  0xCu);
    }

    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100076D6C;
    v16[3] = &unk_1000BAAD8;
    id v17 = v10;
    [v14 saveDeclaration:v8 storeIdentifier:v9 completionHandler:v16];

    os_activity_scope_leave(&state);
  }

  else
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.provider"));
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)deleteDeclarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMStoreXPCProxyHandler hasProviderEntitlement](self, "hasProviderEntitlement"))
  {
    v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: DeleteDeclarationWithIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "DeleteDeclarationWithIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100076FE4;
    v15[3] = &unk_1000BAAD8;
    id v16 = v10;
    [v13 deleteDeclarationWithIdentifier:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.provider"));
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)applyChangesForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasProviderEntitlement](self, "hasProviderEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: ApplyChangesForStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ApplyChangesForStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100077240;
    v12[3] = &unk_1000BAAD8;
    id v13 = v7;
    [v10 applyChangesForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.provider"));
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)subscriberStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SubscriberStoreWithIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SubscriberStoreWithIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000774A0;
    v12[3] = &unk_1000BB020;
    id v13 = v7;
    [v10 subscriberStoreWithIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)subscriberStoresWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v5 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SubscriberStoresWithCompletionHandler from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "SubscriberStoresWithCompletionHandler...",  buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000776BC;
    v8[3] = &unk_1000BAF58;
    id v9 = v4;
    [v7 subscriberStoresWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v5 = (os_activity_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void, os_activity_s *))v4 + 2))(v4, 0LL, v5);
  }
}

- (void)subscribedStoreDeclarationsWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SubscribedStoreDeclarationsWithTypes from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SubscribedStoreDeclarationsWithTypes...",  buf,  2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000778F0;
    v11[3] = &unk_1000BB048;
    id v12 = v7;
    [v10 subscribedStoreDeclarationsWithTypes:v6 completionHandler:v11];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v8 = (os_activity_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void, void, os_activity_s *))v7 + 2))(v7, 0LL, 0LL, v8);
  }
}

- (void)subscribedDeclarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SubscribedDeclarationsWithTypes from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "SubscribedDeclarationsWithTypes with %{public}@...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100077BA0;
    v15[3] = &unk_1000BAF58;
    id v16 = v10;
    [v13 subscribedDeclarationsWithTypes:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v14);
  }
}

- (void)subscribedStoreConfigurationsVisibleUIWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SubscribedStoreConfigurationsVisibleUIWithTypes from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SubscribedStoreConfigurationsVisibleUIWithTypes...",  buf,  2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100077DD4;
    v11[3] = &unk_1000BB048;
    id v12 = v7;
    [v10 subscribedStoreConfigurationsVisibleUIWithTypes:v6 completionHandler:v11];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v8 = (os_activity_s *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void, void, os_activity_s *))v7 + 2))(v7, 0LL, 0LL, v8);
  }
}

- (void)resolveAsset:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: ResolveAsset from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 assetIdentifier]);
      *(_DWORD *)buf = 138543362;
      __int128 v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ResolveAsset with %{public}@...", buf, 0xCu);
    }

    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10007809C;
    v16[3] = &unk_1000BA9D0;
    id v17 = v10;
    [v14 resolveAsset:v8 storeIdentifier:v9 completionHandler:v16];

    os_activity_scope_leave(&state);
  }

  else
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
  }
}

- (void)unassignAssets:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: UnassignAssets from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UnassignAssets with %{public}@...", buf, 0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100078310;
    v12[3] = &unk_1000BAAD8;
    id v13 = v7;
    [v10 unassignAssets:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)writeStatusWithStoreIdentifier:(id)a3 declarationType:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 sourceIdentifier:(id)a7 validity:(BOOL)a8 reasons:(id)a9 completionHandler:(id)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v29 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  __int128 v21 = (void (**)(id, void))a10;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    v28 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: WriteStatusWithStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v28, &state);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "WriteStatusWithStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v30 = 0LL;
    unsigned int v23 = +[RMConfigurationStatusArchiver persistStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier:validity:reasons:error:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "persistStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier:validity:reasons:error:",  v16,  v17,  v18,  v19,  v10,  v20,  &v30);
    id v24 = v30;
    if (v23)
    {
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_10007ACE4();
      }
      id v26 = 0LL;
    }

    else
    {
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10007AD10();
      }
      id v26 = v24;
    }

    ((void (**)(id, id))v21)[2](v21, v26);
    os_activity_scope_leave(&state);
  }

  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    ((void (**)(id, void *))v21)[2](v21, v27);
  }
}

- (void)removeStatusWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void))a7;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v17 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: RemoveStatusWithStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v17, &state);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "RemoveStatusWithStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v24 = 0LL;
    unsigned int v19 = +[RMConfigurationStatusArchiver removeStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier:error:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "removeStatusForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier:error:",  v12,  v13,  v14,  v15,  &v24);
    id v20 = v24;
    if (v19)
    {
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10007AD70();
      }
      id v22 = 0LL;
    }

    else
    {
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10007AD9C();
      }
      id v22 = v20;
    }

    ((void (**)(id, id))v16)[2](v16, v22);
    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    ((void (**)(id, void *))v16)[2](v16, v23);
  }
}

- (void)setConfigurationUIWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 visible:(BOOL)a6 ui:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    unsigned int v19 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SetConfigurationUI from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v19, &state);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SetConfigurationUI...", buf, 2u);
    }

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100078A68;
    void v23[3] = &unk_1000BAAD8;
    id v24 = v18;
    [v21 setConfigurationUIWithStoreIdentifier:v14 declarationIdentifier:v15 declarationServerToken:v16 visible:v10 ui:v17 completionHandler:v23];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void *))v18 + 2))(v18, v22);
  }
}

- (void)publishStatusWithStoreIdentifier:(id)a3 status:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void))a5;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: PublishStatusWithStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "PublishStatusWithStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMExternalStatusPublisher,  "sharedPublisher"));
    id v19 = 0LL;
    unsigned int v14 = [v13 persistStatusWithStoreIdentifier:v8 status:v9 error:&v19];
    id v15 = v19;

    if (v14)
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10007ACE4();
      }
      id v17 = 0LL;
    }

    else
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10007AD10();
      }
      id v17 = v15;
    }

    ((void (**)(id, id))v10)[2](v10, v17);
    os_activity_scope_leave(&state);
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    ((void (**)(id, void *))v10)[2](v10, v18);
  }
}

- (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v13 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SetTrustForCertificateRef from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v13, &state);
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 storeIdentifier]);
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SetTrustForCertificateRef with %{public}@...",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100078F44;
    v18[3] = &unk_1000BAAD8;
    id v19 = v12;
    [v16 setTrustForCertificateRef:v10 configurationKey:v11 fullTrust:v7 completionHandler:v18];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void *))v12 + 2))(v12, v17);
  }
}

- (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v13 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: RemoveTrustForCertificateRef from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v13, &state);
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 storeIdentifier]);
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "RemoveTrustForCertificateRef with %{public}@...",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000791E4;
    v18[3] = &unk_1000BAAD8;
    id v19 = v12;
    [v16 removeTrustForCertificateRef:v10 configurationKey:v11 fullTrust:v7 completionHandler:v18];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void *))v12 + 2))(v12, v17);
  }
}

- (void)certificatePersistentRefForAssetKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: CertificatePersistentRefForAssetKey from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "CertificatePersistentRefForAssetKey with %{public}@...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100079460;
    v15[3] = &unk_1000BAFD0;
    id v16 = v10;
    [v13 certificatePersistentRefForAssetKey:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v14);
  }
}

- (void)certificateStatusWithStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasSubscriberEntitlement](self, "hasSubscriberEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: CertificateStatusWithStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CertificateStatusWithStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000796D8;
    v12[3] = &unk_1000BAE08;
    id v13 = v7;
    [v10 certificateStatusWithStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.subscriber"));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)metadataForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RMStoreXPCProxyHandler hasAnyStoreEntitlement](self, "hasAnyStoreEntitlement"))
  {
    id v8 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: MetadataForStoreIdentifier from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "MetadataForStoreIdentifier with %{public}@...",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100079990;
    v13[3] = &unk_1000BAE08;
    id v14 = v7;
    [v10 metadataForStoreIdentifier:v6 completionHandler:v13];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, %@, %@",  @"com.apple.private.remotemanagement.provider",  @"com.apple.private.remotemanagement.observer",  @"com.apple.private.remotemanagement.subscriber"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  v11));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v12);
  }
}

- (void)metadataValueForKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[RMStoreXPCProxyHandler hasAnyStoreEntitlement](self, "hasAnyStoreEntitlement"))
  {
    id v11 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: MetadataValueForKey from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "MetadataValueForKey with %{public}@...",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100079C78;
    v16[3] = &unk_1000BB070;
    id v17 = v8;
    id v18 = v10;
    [v13 metadataValueForKey:v17 storeIdentifier:v9 completionHandler:v16];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, %@, %@",  @"com.apple.private.remotemanagement.provider",  @"com.apple.private.remotemanagement.observer",  @"com.apple.private.remotemanagement.subscriber"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  v14));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v15);
  }
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4 storeIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[RMStoreXPCProxyHandler hasProviderEntitlement](self, "hasProviderEntitlement"))
  {
    id v14 = _os_activity_create( (void *)&_mh_execute_header,  "StoreXPCListenerDelegate: SetMetadataValue from proxy handler",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v14, &state);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog StoreXPCListenerDelegate](&OBJC_CLASS___RMLog, "StoreXPCListenerDelegate"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "SetMetadataValue with %{public}@...",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMStoreController sharedController](&OBJC_CLASS___RMStoreController, "sharedController"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100079F40;
    v18[3] = &unk_1000B8EE0;
    id v19 = v11;
    id v20 = v13;
    [v16 setMetadataValue:v10 forKey:v19 storeIdentifier:v12 completionHandler:v18];

    os_activity_scope_leave(&state);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createConnectionNotEntitledWithName:]( &OBJC_CLASS___RMErrorUtilities,  "createConnectionNotEntitledWithName:",  @"com.apple.private.remotemanagement.provider"));
    (*((void (**)(id, void *))v13 + 2))(v13, v17);
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

- (BOOL)hasObserverEntitlement
{
  return self->_hasObserverEntitlement;
}

- (BOOL)hasProviderEntitlement
{
  return self->_hasProviderEntitlement;
}

- (BOOL)hasSubscriberEntitlement
{
  return self->_hasSubscriberEntitlement;
}

- (BOOL)hasAnyStoreEntitlement
{
  return self->_hasAnyStoreEntitlement;
}

- (void).cxx_destruct
{
}

@end