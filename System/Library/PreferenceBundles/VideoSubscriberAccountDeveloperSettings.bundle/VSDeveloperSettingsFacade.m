@interface VSDeveloperSettingsFacade
+ (id)keyPathsForValuesAffectingSetTopBoxUseDeviceProfileHash;
+ (id)sharedFacade;
- (BOOL)hasRealSetTopBoxProfile;
- (NSArray)providers;
- (NSOperationQueue)privateQueue;
- (NSString)isSetTopBoxEnabledStatus;
- (NSString)setTopBoxProviderDisplayName;
- (NSString)setTopBoxSupportsOptOutStatus;
- (NSString)setTopBoxUseDeviceProfileStatus;
- (VSDeveloperSettings)settings;
- (VSDeveloperSettingsFacade)init;
- (VSRemoteNotifier)providersChangeRemoteNotifier;
- (VSRemoteNotifier)settingsChangeRemoteNotifier;
- (VSRemoteNotifier)stbChangeRemoteNotifier;
- (id)alertMessageForProxyDetection;
- (id)alertTitleForProxyDetection;
- (id)buildSystemTrustTestAlertMessageWithStatusMessage:(id)a3 andTrustInfo:(id)a4;
- (id)dismissTitleForProxyDetection;
- (unint64_t)setTopBoxUseDeviceProfileHash;
- (void)_updateLabels;
- (void)enqueueChange:(int64_t)a3 withIdentityProvider:(id)a4 completionHandler:(id)a5;
- (void)fetchDeveloperSettingsWithCompletionHandler:(id)a3;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)setHasRealSetTopBoxProfile:(BOOL)a3;
- (void)setIsSetTopBoxEnabledStatus:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setProviders:(id)a3;
- (void)setProvidersChangeRemoteNotifier:(id)a3;
- (void)setSetTopBoxProviderDisplayName:(id)a3;
- (void)setSetTopBoxSupportsOptOutStatus:(id)a3;
- (void)setSetTopBoxUseDeviceProfileStatus:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSettingsChangeRemoteNotifier:(id)a3;
- (void)setStbChangeRemoteNotifier:(id)a3;
- (void)updateDeveloperSettings:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation VSDeveloperSettingsFacade

+ (id)sharedFacade
{
  if (qword_1A118 != -1) {
    dispatch_once(&qword_1A118, &stru_147A0);
  }
  return (id)qword_1A110;
}

- (VSDeveloperSettingsFacade)init
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsFacade;
  v2 = -[VSDeveloperSettingsFacade init](&v37, "init");
  v3 = v2;
  if (v2)
  {
    providers = v2->_providers;
    v2->_providers = (NSArray *)&__NSArray0__struct;

    v5 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    privateQueue = v3->_privateQueue;
    v3->_privateQueue = v5;

    -[NSOperationQueue setName:](v3->_privateQueue, "setName:", @"VSDeveloperSettingsFacade");
    id v7 = objc_alloc_init(&OBJC_CLASS___VSDeveloperIdentityProviderFetchAllOperation);
    id v8 = objc_alloc_init(&OBJC_CLASS___VSDeveloperSettingsFetchOperation);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_8BBC;
    v33[3] = &unk_14608;
    id v34 = v7;
    v9 = v3;
    v35 = v9;
    id v36 = v8;
    id v10 = v8;
    id v11 = v7;
    uint64_t v12 = VSMainThreadOperationWithBlock(v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v13 addDependency:v11];
    [v13 addDependency:v10];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade privateQueue](v9, "privateQueue"));
    [v14 addOperation:v11];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade privateQueue](v9, "privateQueue"));
    [v15 addOperation:v10];

    VSEnqueueCompletionOperation(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
    v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    v30 = sub_8E28;
    v31 = &unk_14768;
    v17 = v9;
    v32 = v17;
    [v16 fetchDeviceManagedSetTopBoxProfileWithCompletion:&v28];

    v18 = objc_alloc(&OBJC_CLASS___VSRemoteNotifier);
    v19 = -[VSRemoteNotifier initWithNotificationName:]( v18,  "initWithNotificationName:",  VSDeveloperServiceProvidersDidChangeNotification,  v28,  v29,  v30,  v31);
    id v20 = v17[9];
    v17[9] = v19;

    v21 = objc_alloc(&OBJC_CLASS___VSRemoteNotifier);
    v22 = -[VSRemoteNotifier initWithNotificationName:]( v21,  "initWithNotificationName:",  VSDeveloperServiceSettingsDidChangeNotification);
    id v23 = v17[10];
    v17[10] = v22;

    v24 = objc_alloc(&OBJC_CLASS___VSRemoteNotifier);
    v25 = -[VSRemoteNotifier initWithNotificationName:]( v24,  "initWithNotificationName:",  VSSetTopBoxStateChangedNotification);
    id v26 = v17[11];
    v17[11] = v25;

    [v17[9] setDelegate:v17];
    [v17[10] setDelegate:v17];
    [v17[11] setDelegate:v17];
  }

  return v3;
}

- (void)enqueueChange:(int64_t)a3 withIdentityProvider:(id)a4 completionHandler:(id)a5
{
  int64_t v34 = a3;
  id v7 = a4;
  v35 = self;
  id v36 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade providers](self, "providers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
  objc_super v37 = (void *)objc_claimAutoreleasedReturnValue([v9 forceUnwrapObject]);

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v44;
    id obj = v10;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "providerID", v34));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 forceUnwrapObject]);
        v18 = v7;
        v19 = (void *)objc_claimAutoreleasedReturnValue([v7 providerID]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 forceUnwrapObject]);
        unsigned int v21 = [v17 isEqualToString:v20];

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 forceUnwrapObject]);
          unsigned int v24 = [v23 isEqual:v37];

          if (!v24)
          {
            id v10 = obj;

            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
            id v27 = (id)objc_claimAutoreleasedReturnValue( [v32 localizedStringForKey:@"DEVELOPER_PROVIDER_IDENTIFIER_COLLISION_ERROR_DESCRIPTION" value:0 table:0]);

            NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
            id v48 = v27;
            v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DeveloperFacadeErrorDomain",  0LL,  v31));
            id v26 = v36;
            (*((void (**)(id, void *))v36 + 2))(v36, v33);

            goto LABEL_12;
          }
        }

        id v7 = v18;
      }

      id v10 = obj;
      id v12 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v25 = objc_alloc_init(&OBJC_CLASS___VSDeveloperIdentityProviderChangeOperation);
  [v25 setChangeKind:v34];
  [v25 setIdentityProvider:v7];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_9194;
  v39[3] = &unk_148A0;
  id v26 = v36;
  id v40 = v25;
  v41 = v35;
  id v42 = v36;
  id v27 = v25;
  uint64_t v28 = VSMainThreadOperationWithBlock(v39);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  [v29 addDependency:v27];
  v18 = v7;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade privateQueue](v35, "privateQueue"));
  [v30 addOperation:v27];
  VSEnqueueCompletionOperation(v29);

  v31 = v40;
LABEL_12:
}

- (void)fetchDeveloperSettingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_93AC;
  uint64_t v13 = &unk_148C8;
  id v14 = objc_alloc_init(&OBJC_CLASS___VSDeveloperSettingsFetchOperation);
  id v15 = v4;
  id v5 = v4;
  id v6 = v14;
  uint64_t v7 = VSMainThreadOperationWithBlock(&v10);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v8, "addDependency:", v6, v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade privateQueue](self, "privateQueue"));
  [v9 addOperation:v6];

  VSEnqueueCompletionOperation(v8);
}

- (void)updateDeveloperSettings:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[VSDeveloperSettingsUpdateOperation alloc] initWithSettings:v7];

  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_94FC;
  v17 = &unk_148C8;
  id v18 = v8;
  id v19 = v6;
  id v9 = v6;
  id v10 = v8;
  uint64_t v11 = VSMainThreadOperationWithBlock(&v14);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v12, "addDependency:", v10, v14, v15, v16, v17);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade privateQueue](self, "privateQueue"));
  [v13 addOperation:v10];

  VSEnqueueCompletionOperation(v12);
}

- (id)buildSystemTrustTestAlertMessageWithStatusMessage:(id)a3 andTrustInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"TEST_SYSTEM_TRUST_NO_SSL_RESPONSE_MESSAGE" value:0 table:0]);

  if (v6)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 description]);

    id v8 = (void *)v9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n\n%@", v5, v8));

  return v10;
}

- (id)alertTitleForProxyDetection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"TEST_SYSTEM_TRUST_RESULT_ALERT_ERROR_TITLE" value:0 table:0]);

  return v3;
}

- (id)alertMessageForProxyDetection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"TEST_SYSTEM_TRUST_PROXY_DETECTED_ALERT_MESSAGE" value:0 table:0]);

  return v3;
}

- (id)dismissTitleForProxyDetection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0]);

  return v3;
}

- (void)_updateLabels
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade settings](self, "settings"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"GENERIC_STATUS_ENABLED_LABEL" value:0 table:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"GENERIC_STATUS_DISABLED_LABEL" value:0 table:0]);

  id v8 = v7;
  id v9 = v8;
  if ([v3 isInSetTopBoxMode])
  {
    id v9 = v5;
  }

  id v26 = v9;
  id v10 = v8;
  id v11 = v10;
  if ([v3 setTopBoxSupportsOptOut])
  {
    id v11 = v5;
  }

  unsigned int v24 = v11;
  id v25 = v10;
  id v27 = v5;
  uint64_t v28 = v3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 setTopBoxIdentityProviderID]);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade providers](self, "providers"));
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uniqueID]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 forceUnwrapObject]);
        unsigned int v21 = [v20 isEqualToString:v12];

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v18 displayName]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 forceUnwrapObject]);
          -[VSDeveloperSettingsFacade setSetTopBoxProviderDisplayName:](self, "setSetTopBoxProviderDisplayName:", v23);
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v15);
  }

  -[VSDeveloperSettingsFacade setIsSetTopBoxEnabledStatus:](self, "setIsSetTopBoxEnabledStatus:", v26);
  -[VSDeveloperSettingsFacade setSetTopBoxSupportsOptOutStatus:](self, "setSetTopBoxSupportsOptOutStatus:", v24);
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VSDefaultLogObject(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Did receive developer mode store did change notification.",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade settingsChangeRemoteNotifier](self, "settingsChangeRemoteNotifier"));

  if (v10 == v6)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_9C04;
    v21[3] = &unk_14910;
    objc_copyWeak(&v22, buf);
    v21[4] = self;
    -[VSDeveloperSettingsFacade fetchDeveloperSettingsWithCompletionHandler:]( self,  "fetchDeveloperSettingsWithCompletionHandler:",  v21);
    objc_destroyWeak(&v22);
  }

  else
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade providersChangeRemoteNotifier](self, "providersChangeRemoteNotifier"));

    if (v11 == v6)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_9D40;
      v18[3] = &unk_14980;
      id v13 = objc_alloc_init(&OBJC_CLASS___VSDeveloperIdentityProviderFetchAllOperation);
      id v19 = v13;
      objc_copyWeak(&v20, buf);
      uint64_t v14 = VSMainThreadOperationWithBlock(v18);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      [v15 addDependency:v13];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade privateQueue](self, "privateQueue"));
      [v16 addOperation:v13];

      VSEnqueueCompletionOperation(v15);
      objc_destroyWeak(&v20);

      goto LABEL_9;
    }

    id v12 = (id)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsFacade stbChangeRemoteNotifier](self, "stbChangeRemoteNotifier"));

    if (v12 == v6)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_9ED8;
      v17[3] = &unk_14768;
      v17[4] = self;
      [v13 fetchDeviceManagedSetTopBoxProfileWithCompletion:v17];
LABEL_9:
    }
  }

  objc_destroyWeak(buf);
}

+ (id)keyPathsForValuesAffectingSetTopBoxUseDeviceProfileHash
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v2, "addObject:", @"hasRealSetTopBoxProfile");
  -[NSMutableSet addObject:](v2, "addObject:", @"settings");
  return v2;
}

- (VSDeveloperSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (BOOL)hasRealSetTopBoxProfile
{
  return self->_hasRealSetTopBoxProfile;
}

- (void)setHasRealSetTopBoxProfile:(BOOL)a3
{
  self->_hasRealSetTopBoxProfile = a3;
}

- (NSString)isSetTopBoxEnabledStatus
{
  return self->_isSetTopBoxEnabledStatus;
}

- (void)setIsSetTopBoxEnabledStatus:(id)a3
{
}

- (unint64_t)setTopBoxUseDeviceProfileHash
{
  return self->_setTopBoxUseDeviceProfileHash;
}

- (NSString)setTopBoxUseDeviceProfileStatus
{
  return self->_setTopBoxUseDeviceProfileStatus;
}

- (void)setSetTopBoxUseDeviceProfileStatus:(id)a3
{
}

- (NSString)setTopBoxSupportsOptOutStatus
{
  return self->_setTopBoxSupportsOptOutStatus;
}

- (void)setSetTopBoxSupportsOptOutStatus:(id)a3
{
}

- (NSString)setTopBoxProviderDisplayName
{
  return self->_setTopBoxProviderDisplayName;
}

- (void)setSetTopBoxProviderDisplayName:(id)a3
{
}

- (NSArray)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (VSRemoteNotifier)providersChangeRemoteNotifier
{
  return self->_providersChangeRemoteNotifier;
}

- (void)setProvidersChangeRemoteNotifier:(id)a3
{
}

- (VSRemoteNotifier)settingsChangeRemoteNotifier
{
  return self->_settingsChangeRemoteNotifier;
}

- (void)setSettingsChangeRemoteNotifier:(id)a3
{
}

- (VSRemoteNotifier)stbChangeRemoteNotifier
{
  return self->_stbChangeRemoteNotifier;
}

- (void)setStbChangeRemoteNotifier:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end