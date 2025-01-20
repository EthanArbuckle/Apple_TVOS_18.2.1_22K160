@interface ADIntentVocabularyUpdateConnection
- (ADIntentVocabularyUpdateConnection)initWithBundleID:(id)a3 path:(id)a4 canDonateOnBehalfOfApps:(BOOL)a5;
- (id)_datastoreManager;
- (id)_datastoreManagerFor:(id)a3 bundlePath:(id)a4;
- (void)_askToSyncSlot:(id)a3 onBehalfOf:(id)a4;
- (void)_deleteEverythingOnBehalfOf:(id)a3 withDataStorageManager:(id)a4;
- (void)_recordVocabulary:(id)a3 forIntentSlot:(id)a4 onBehalfOf:(id)a5 withDataStorageManager:(id)a6 withValidationCompletion:(id)a7;
- (void)_triggerUserVocabularySyncAttributingApp:(id)a3 vocabType:(id)a4;
- (void)askToSyncSlot:(id)a3;
- (void)askToSyncSlot:(id)a3 onBehalfOf:(id)a4;
- (void)deleteEverything;
- (void)deleteEverythingOnBehalfOf:(id)a3;
- (void)fetchCurrentSiriLanguageCode:(id)a3;
- (void)fetchSiriAuthorization:(id)a3;
- (void)recordVocabulary:(id)a3 forIntentSlot:(id)a4 onBehalfOf:(id)a5 withValidationCompletion:(id)a6;
- (void)recordVocabulary:(id)a3 forIntentSlot:(id)a4 withValidationCompletion:(id)a5;
- (void)requestSiriAuthorization:(id)a3;
- (void)verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4;
@end

@implementation ADIntentVocabularyUpdateConnection

- (ADIntentVocabularyUpdateConnection)initWithBundleID:(id)a3 path:(id)a4 canDonateOnBehalfOfApps:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___ADIntentVocabularyUpdateConnection;
    v10 = -[ADIntentVocabularyUpdateConnection init](&v18, "init");
    if (v10)
    {
      v11 = (NSString *)[v8 copy];
      appBundleID = v10->_appBundleID;
      v10->_appBundleID = v11;

      v13 = (NSString *)[v9 copy];
      appPath = v10->_appPath;
      v10->_appPath = v13;

      v10->_canDonateOnBehalfOfApps = a5;
    }

    self = v10;
    v15 = self;
  }

  else
  {
    v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[ADIntentVocabularyUpdateConnection initWithBundleID:path:canDonateOnBehalfOfApps:]";
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s no bundleID!", buf, 0xCu);
    }

    v15 = 0LL;
  }

  return v15;
}

- (id)_datastoreManager
{
  datastoreManager = self->_datastoreManager;
  if (!datastoreManager)
  {
    v4 = (_INVocabularyStoreManager *)objc_claimAutoreleasedReturnValue( -[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]( self,  "_datastoreManagerFor:bundlePath:",  self->_appBundleID,  self->_appPath));
    v5 = self->_datastoreManager;
    self->_datastoreManager = v4;

    datastoreManager = self->_datastoreManager;
  }

  return datastoreManager;
}

- (id)_datastoreManagerFor:(id)a3 bundlePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    unsigned __int8 v10 = [v6 isEqualToString:@"com.apple.siriactionsd"];
    id v24 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v6,  0LL,  &v24));
    v12 = (__CFString *)v24;
    if (!v11)
    {
      v13 = (os_log_s *)AFSiriLogContextDaemon;
      if ((v10 & 1) != 0)
      {
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          v14 = &stru_1004FECA0;
          *(_DWORD *)buf = 136315650;
          v26 = "-[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]";
          __int16 v27 = 2112;
          if (v12) {
            v14 = v12;
          }
          id v28 = v6;
          __int16 v29 = 2112;
          v30 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Could not get bundle record for app bundle ID %@ %@",  buf,  0x20u);
        }
      }

      else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v22 = &stru_1004FECA0;
        *(_DWORD *)buf = 136315650;
        v26 = "-[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]";
        __int16 v27 = 2112;
        if (v12) {
          v22 = v12;
        }
        id v28 = v6;
        __int16 v29 = 2112;
        v30 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Could not get bundle record for app bundle ID %@ %@",  buf,  0x20u);
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue([v15 path]);

    if (v9) {
      goto LABEL_17;
    }
    v16 = (void *)AFSiriLogContextDaemon;
    if ((v10 & 1) != 0)
    {
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
LABEL_16:
        id v9 = self->_appPath;
LABEL_17:

        goto LABEL_18;
      }

      appPath = self->_appPath;
      objc_super v18 = v16;
      v19 = (__CFString *)-[NSString copy](appPath, "copy");
      *(_DWORD *)buf = 136315650;
      v26 = "-[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]";
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s App bundle path for app bundle ID %@ is nil, using %@",  buf,  0x20u);
    }

    else
    {
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      v23 = self->_appPath;
      objc_super v18 = v16;
      v19 = (__CFString *)-[NSString copy](v23, "copy");
      *(_DWORD *)buf = 136315650;
      v26 = "-[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]";
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      v30 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s App bundle path for app bundle ID %@ is nil, using %@",  buf,  0x20u);
    }

    goto LABEL_16;
  }

  id v9 = (NSString *)v7;
LABEL_18:
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[_INVocabularyStoreManager managerForBundleID:bundlePath:]( &OBJC_CLASS____INVocabularyStoreManager,  "managerForBundleID:bundlePath:",  v6,  v9));

  return v20;
}

- (void)recordVocabulary:(id)a3 forIntentSlot:(id)a4 withValidationCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 count]));
    id v14 = -[NSString copy](self->_appBundleID, "copy");
    int v16 = 136315906;
    v17 = "-[ADIntentVocabularyUpdateConnection recordVocabulary:forIntentSlot:withValidationCompletion:]";
    __int16 v18 = 2112;
    v19 = v13;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s got %@ items for %@ from %@",  (uint8_t *)&v16,  0x2Au);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADIntentVocabularyUpdateConnection _datastoreManager](self, "_datastoreManager"));
  -[ADIntentVocabularyUpdateConnection _recordVocabulary:forIntentSlot:onBehalfOf:withDataStorageManager:withValidationCompletion:]( self,  "_recordVocabulary:forIntentSlot:onBehalfOf:withDataStorageManager:withValidationCompletion:",  v8,  v9,  self->_appBundleID,  v15,  v10);
}

- (void)recordVocabulary:(id)a3 forIntentSlot:(id)a4 onBehalfOf:(id)a5 withValidationCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a6;
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (!self->_canDonateOnBehalfOfApps)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      id v21 = "-[ADIntentVocabularyUpdateConnection recordVocabulary:forIntentSlot:onBehalfOf:withValidationCompletion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Process tried to donate vocabulary on behalf of apps but not authorized",  (uint8_t *)&v20,  0xCu);
      if (!v13) {
        goto LABEL_8;
      }
    }

    else if (!v13)
    {
      goto LABEL_8;
    }

    v13[2](v13, 0LL);
    goto LABEL_8;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    id v16 = [v12 copy];
    id v17 = v16;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 count]));
    int v20 = 136315906;
    id v21 = "-[ADIntentVocabularyUpdateConnection recordVocabulary:forIntentSlot:onBehalfOf:withValidationCompletion:]";
    __int16 v22 = 2112;
    id v23 = v16;
    __int16 v24 = 2112;
    v25 = v18;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s On behalf of %@ got %@ items for %@",  (uint8_t *)&v20,  0x2Au);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( -[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]( self,  "_datastoreManagerFor:bundlePath:",  v12,  0LL));
  -[ADIntentVocabularyUpdateConnection _recordVocabulary:forIntentSlot:onBehalfOf:withDataStorageManager:withValidationCompletion:]( self,  "_recordVocabulary:forIntentSlot:onBehalfOf:withDataStorageManager:withValidationCompletion:",  v10,  v11,  v12,  v19,  v13);

LABEL_8:
}

- (void)_recordVocabulary:(id)a3 forIntentSlot:(id)a4 onBehalfOf:(id)a5 withDataStorageManager:(id)a6 withValidationCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1002FA2B8;
  v20[3] = &unk_1004FB520;
  id v21 = a6;
  id v22 = v12;
  id v23 = v13;
  __int16 v24 = self;
  id v25 = v14;
  id v26 = a7;
  id v15 = v26;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v21;
  [v19 checkIfSyncSlot:v17 isAllowedWithCompletion:v20];
}

- (void)_triggerUserVocabularySyncAttributingApp:(id)a3 vocabType:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Synapse.%@#%@",  a3,  a4));
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[ADIntentVocabularyUpdateConnection _triggerUserVocabularySyncAttributingApp:vocabType:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Posting sync notification for reason: %@",  buf,  0x16u);
  }

  notify_post("com.apple.assistant.app_vocabulary");
}

- (void)_askToSyncSlot:(id)a3 onBehalfOf:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncBlacklist sharedInstance](&OBJC_CLASS___ADSyncBlacklist, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002FA1C0;
  v11[3] = &unk_1004FB548;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 checkPermissionToSyncSlot:v9 forApp:v10 completion:v11];
}

- (void)askToSyncSlot:(id)a3
{
}

- (void)askToSyncSlot:(id)a3 onBehalfOf:(id)a4
{
}

- (void)_deleteEverythingOnBehalfOf:(id)a3 withDataStorageManager:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  id v8 = [v6 deleteEverything];
  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[ADIntentVocabularyUpdateConnection _deleteEverythingOnBehalfOf:withDataStorageManager:]";
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Removed all local user-vocabulary for %{public}@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncBlacklist sharedInstance](&OBJC_CLASS___ADSyncBlacklist, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002FA0CC;
  v12[3] = &unk_1004FC160;
  id v13 = v7;
  id v14 = self;
  id v11 = v7;
  [v10 checkIfAnyUserVocabularyIsBlacklistedForApp:v11 completion:v12];
}

- (void)deleteEverything
{
  appBundleID = self->_appBundleID;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ADIntentVocabularyUpdateConnection _datastoreManager](self, "_datastoreManager"));
  -[ADIntentVocabularyUpdateConnection _deleteEverythingOnBehalfOf:withDataStorageManager:]( self,  "_deleteEverythingOnBehalfOf:withDataStorageManager:",  appBundleID,  v4);
}

- (void)deleteEverythingOnBehalfOf:(id)a3
{
  id v4 = a3;
  if (self->_canDonateOnBehalfOfApps)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADIntentVocabularyUpdateConnection _datastoreManagerFor:bundlePath:]( self,  "_datastoreManagerFor:bundlePath:",  v4,  0LL));
    -[ADIntentVocabularyUpdateConnection _deleteEverythingOnBehalfOf:withDataStorageManager:]( self,  "_deleteEverythingOnBehalfOf:withDataStorageManager:",  v4,  v5);
  }

  else
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ADIntentVocabularyUpdateConnection deleteEverythingOnBehalfOf:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Process tried to delete vocabulary on behalf of apps but not authorized",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)fetchSiriAuthorization:(id)a3
{
  if (a3)
  {
    appBundleID = self->_appBundleID;
    id v5 = a3;
    (*((void (**)(id, id))a3 + 2))( v5,  +[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:]( &OBJC_CLASS____INSiriAuthorizationManager,  "_siriAuthorizationStatusForAppID:",  appBundleID));
  }

- (void)requestSiriAuthorization:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___BKSApplicationStateMonitor);
    unsigned int v6 = [v5 applicationStateForApplication:self->_appBundleID];
    [v5 invalidate];
    if (v6 == 8)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      id v8 = v7;
      if (v7) {
        [v7 auditToken];
      }
      else {
        memset(v11, 0, sizeof(v11));
      }
      +[_INSiriAuthorizationManager _requestSiriAuthorization:auditToken:]( &OBJC_CLASS____INSiriAuthorizationManager,  "_requestSiriAuthorization:auditToken:",  v4,  v11);
    }

    else
    {
      id v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        appBundleID = self->_appBundleID;
        *(_DWORD *)buf = 136315394;
        id v13 = "-[ADIntentVocabularyUpdateConnection requestSiriAuthorization:]";
        __int16 v14 = 2114;
        id v15 = appBundleID;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Ignoring attempt by %{public}@ to request Siri authorization while not in the foreground",  buf,  0x16u);
      }

      -[ADIntentVocabularyUpdateConnection fetchSiriAuthorization:](self, "fetchSiriAuthorization:", v4);
    }
  }
}

- (void)verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4
{
  if (a4)
  {
    appBundleID = self->_appBundleID;
    id v8 = a4;
    uint64_t CanDonateIntent = INAppCanDonateIntent(appBundleID, a3);
    (*((void (**)(id, uint64_t))a4 + 2))(v8, CanDonateIntent);
  }

- (void)fetchCurrentSiriLanguageCode:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1002FA060;
    v6[3] = &unk_1004FBF20;
    id v7 = v4;
    -[ADIntentVocabularyUpdateConnection fetchSiriAuthorization:](self, "fetchSiriAuthorization:", v6);
  }
}

- (void).cxx_destruct
{
}

@end