@interface ADExtensionService
- (ADCommandCenterClient)commandCenterClient;
- (ADExtensionService)init;
- (BOOL)_intentNeedsPreparation:(id)a3;
- (BOOL)_prepareNameComponents:(id)a3 meCardCache:(id *)a4;
- (BOOL)_preparePerson:(id)a3 meCardCache:(id *)a4;
- (BOOL)_replacement:(id *)a3 forString:(id)a4 meCardCache:(id *)a5;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_meCard;
- (id)_meCardWithCache:(id *)a3;
- (id)commandsForDomain:(id)a3;
- (id)controlCenterLockRestrictedCommands;
- (id)domains;
- (id)extensionService:(id)a3 contextDictionaryForCommand:(id)a4;
- (id)extensionService:(id)a3 contextDictionaryForError:(id)a4;
- (id)siriLanguageCodeForExtensionService:(id)a3;
- (void)_logUUFRConditionally:(id)a3 executionContext:(id)a4;
- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6;
- (void)extensionService:(id)a3 extensionRequestDidFinishForApplication:(id)a4 error:(id)a5;
- (void)extensionService:(id)a3 extensionRequestWillStartForApplication:(id)a4;
- (void)extensionService:(id)a3 handleFailedStartPlaybackWithDestination:(int64_t)a4 completion:(id)a5;
- (void)extensionService:(id)a3 handleIntent:(id)a4 inBackgroundAppWithBundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)extensionService:(id)a3 handleIntentForwardingAction:(id)a4 inBackgroundAppWithBundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)extensionService:(id)a3 logEventWithType:(int64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6;
- (void)extensionService:(id)a3 prepareForStartPlaybackWithDestination:(int64_t)a4 intent:(id)a5 completion:(id)a6;
- (void)extensionService:(id)a3 prepareIntent:(id)a4;
- (void)extensionService:(id)a3 processData:(id)a4 usingSecurityProcedure:(int64_t)a5 completionHandler:(id)a6;
- (void)extensionService:(id)a3 processDataUsingSHA256WithInMemorySalt:(id)a4 completionHandler:(id)a5;
- (void)extensionService:(id)a3 requiresHandlingCommand:(id)a4 completion:(id)a5;
- (void)extensionService:(id)a3 suspendTimeout:(BOOL)a4;
- (void)extensionService:(id)a3 wantsToCacheImage:(id)a4;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)resetExternalResources;
- (void)setCommandCenterClient:(id)a3;
@end

@implementation ADExtensionService

- (ADExtensionService)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ADExtensionService;
  v2 = -[ADExtensionService init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[ADService setIdentifier:](v2, "setIdentifier:", @"ADExtensionServiceIdentifier");
    v4 = -[INSExtensionService initWithOptions:]( objc_alloc(&OBJC_CLASS___INSExtensionService),  "initWithOptions:",  &__NSDictionary0__struct);
    extensionService = v3->_extensionService;
    v3->_extensionService = v4;

    -[INSExtensionService setDelegate:](v3->_extensionService, "setDelegate:", v3);
  }

  return v3;
}

- (id)domains
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[INSExtensionService groupIdentifier](self->_extensionService, "groupIdentifier"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (id)commandsForDomain:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADExtensionService domains](self, "domains"));
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADExtensionService domains](self, "domains"));
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADExtensionService commandsForDomain:](self, "commandsForDomain:", a4));
  LOBYTE(self) = [v7 containsObject:v6];

  return (char)self;
}

- (id)controlCenterLockRestrictedCommands
{
  return 0LL;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100153660;
  v48[3] = &unk_1004FD9E0;
  v48[4] = self;
  id v11 = v9;
  id v49 = v11;
  id v35 = v10;
  id v50 = v35;
  id v12 = a5;
  v13 = objc_retainBlock(v48);
  v34 = v11;
  -[ADExtensionService _logUUFRConditionally:executionContext:]( self,  "_logUUFRConditionally:executionContext:",  v11,  v12);
  v14 = dispatch_group_create();
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[INSExtensionService extensionContext](self->_extensionService, "extensionContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v12 originPeerInfo]);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 airPlayRouteIdentifiers]);
  v18 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[ADExtensionService handleCommand:forDomain:executionContext:reply:]";
    __int16 v53 = 2112;
    v54 = v17;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s airPlayRouteIdentifiers = %@",  buf,  0x16u);
  }

  [v15 _setAirPlayRouteIdentifiers:v17];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  dispatch_group_enter(v14);
  v20 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100153774;
  v46[3] = &unk_1004FB890;
  v21 = v14;
  v47 = v21;
  v22 = -[AFSafetyBlock initWithBlock:](v20, "initWithBlock:", v46);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v19 _speechManager]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 audioSessionController]);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100153840;
  v43[3] = &unk_1004F3078;
  id v25 = v15;
  id v44 = v25;
  v26 = v22;
  v45 = v26;
  [v24 getAudioSessionIDWithCompletion:v43];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v19 _speechCapturingContext]);
  if (v27)
  {
    dispatch_group_enter(v21);
    v28 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100153924;
    v41[3] = &unk_1004FB890;
    v42 = v21;
    v29 = -[AFSafetyBlock initWithBlock:](v28, "initWithBlock:", v41);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1001539F0;
    v38[3] = &unk_1004F30A0;
    id v39 = v25;
    v40 = v29;
    v30 = v29;
    [v27 getAudioRecordRouteAndDeviceIdentificationWithCompletion:v38];
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v31 _queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100153B10;
  block[3] = &unk_1004FC838;
  id v37 = v13;
  v33 = v13;
  dispatch_group_notify(v21, v32, block);
}

- (void)resetExternalResources
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[ADExtensionService resetExternalResources]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[INSExtensionService resetExternalResources](self->_extensionService, "resetExternalResources");
}

- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    v13 = "-[ADExtensionService cancelOperationsForRequestID:forAssistantID:fromRemote:reason:]";
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 1024;
    BOOL v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s requestID = %@, fromRemote = %d",  (uint8_t *)&v12,  0x1Cu);
  }

  if (!v6) {
    -[INSExtensionService resetExternalResources](self->_extensionService, "resetExternalResources");
  }
}

- (void)extensionService:(id)a3 prepareIntent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[ADExtensionService _intentNeedsPreparation:](self, "_intentNeedsPreparation:", v7))
  {
    v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADExtensionService extensionService:prepareIntent:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Preparing INPerson in %@", buf, 0x16u);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    __int16 v14 = sub_10015359C;
    id v15 = sub_1001535AC;
    id v16 = 0LL;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10015360C;
    v10[3] = &unk_1004F30C8;
    v10[4] = self;
    v10[5] = buf;
    objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", objc_opt_class(INPerson), v10);
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v11 = 136315138;
      int v12 = "-[ADExtensionService extensionService:prepareIntent:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Finished", v11, 0xCu);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)extensionService:(id)a3 suspendTimeout:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter", a3));
  [v5 _setIsTimeoutSuspended:v4];
}

- (void)extensionService:(id)a3 processData:(id)a4 usingSecurityProcedure:(int64_t)a5 completionHandler:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADSecurityService sharedService](&OBJC_CLASS___ADSecurityService, "sharedService"));
  [v10 processData:v9 usingProcedure:a5 completion:v8];
}

- (void)extensionService:(id)a3 processDataUsingSHA256WithInMemorySalt:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[ADSecurityService sharedService](&OBJC_CLASS___ADSecurityService, "sharedService"));
  [v8 processData:v7 usingProcedure:5 completion:v6];
}

- (void)extensionService:(id)a3 wantsToCacheImage:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ADExtensionService commandCenterClient](self, "commandCenterClient"));
  [v6 adWantsToCacheImage:v5];
}

- (void)extensionService:(id)a3 extensionRequestWillStartForApplication:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ADExtensionService commandCenterClient](self, "commandCenterClient"));
  [v6 adExtensionRequestWillStartForApplication:v5];
}

- (void)extensionService:(id)a3 extensionRequestDidFinishForApplication:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ADExtensionService commandCenterClient](self, "commandCenterClient"));
  [v9 adExtensionRequestFinishedForApplication:v8 error:v7];
}

- (void)extensionService:(id)a3 handleIntent:(id)a4 inBackgroundAppWithBundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[AFSiriActivationConnection sharedConnection]( &OBJC_CLASS___AFSiriActivationConnection,  "sharedConnection"));
  [v11 handleIntent:v10 inBackgroundAppWithBundleId:v9 reply:v8];
}

- (void)extensionService:(id)a3 handleIntentForwardingAction:(id)a4 inBackgroundAppWithBundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[AFSiriActivationConnection sharedConnection]( &OBJC_CLASS___AFSiriActivationConnection,  "sharedConnection"));
  [v11 handleIntentForwardingAction:v10 inBackgroundApplicationWithBundleIdentifier:v9 completionHandler:v8];
}

- (void)extensionService:(id)a3 logEventWithType:(int64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  id v11 = v9;
  else {
    int64_t v10 = a4;
  }
  [v9 logEventWithType:v10 context:v8 contextNoCopy:v6];
}

- (id)siriLanguageCodeForExtensionService:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 languageCode]);

  return v4;
}

- (void)extensionService:(id)a3 requiresHandlingCommand:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001535F4;
  v10[3] = &unk_1004FC668;
  id v11 = v6;
  id v9 = v6;
  [v8 handleCommand:v7 completion:v10];
}

- (id)extensionService:(id)a3 contextDictionaryForCommand:(id)a4
{
  return (id)AFAnalyticsContextCreateWithCommand(a4, a2, a3);
}

- (id)extensionService:(id)a3 contextDictionaryForError:(id)a4
{
  return (id)AFAnalyticsContextCreateWithError(a4);
}

- (void)extensionService:(id)a3 prepareForStartPlaybackWithDestination:(int64_t)a4 intent:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void))a6;
  if ((unint64_t)a4 < 3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v13 prepareForStartPlaybackWithDestination:a4 intent:v10 completion:v11];
  }

  else
  {
    int v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      id v15 = "-[ADExtensionService extensionService:prepareForStartPlaybackWithDestination:intent:completion:]";
      __int16 v16 = 2048;
      int64_t v17 = a4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Unexpected value for startPlaybackType: %ld, ignoring.",  (uint8_t *)&v14,  0x16u);
    }

    v11[2](v11, 0LL);
  }
}

- (void)extensionService:(id)a3 handleFailedStartPlaybackWithDestination:(int64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(void))a5;
  if ((unint64_t)a4 < 3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v10 handleFailedStartPlaybackWithDestination:a4 completion:v8];
  }

  else
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      int v12 = "-[ADExtensionService extensionService:handleFailedStartPlaybackWithDestination:completion:]";
      __int16 v13 = 2048;
      int64_t v14 = a4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Unexpected value for startPlaybackType: %ld, ignoring.",  (uint8_t *)&v11,  0x16u);
    }

    v8[2](v8);
  }
}

- (id)_meCardWithCache:(id *)a3
{
  id v5 = *a3;
  if (!v5)
  {
    id v5 = objc_claimAutoreleasedReturnValue(-[ADExtensionService _meCard](self, "_meCard"));
    *a3 = v5;
  }

  return v5;
}

- (id)_meCard
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  int64_t v17 = sub_10015359C;
  v18 = sub_1001535AC;
  id v19 = 0LL;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssistantDataManager sharedDataManager](&OBJC_CLASS___ADAssistantDataManager, "sharedDataManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001535B4;
  v11[3] = &unk_1004F30F0;
  __int16 v13 = &v14;
  BOOL v4 = v2;
  int v12 = v4;
  [v3 getMeCardsWithCompletion:v11];

  dispatch_time_t v5 = dispatch_time(0LL, 2000000000LL);
  uint64_t v6 = dispatch_semaphore_wait(v4, v5);
  id v7 = (os_log_s *)AFSiriLogContextConnection;
  if (v6 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADExtensionService _meCard]";
    __int16 v22 = 2048;
    uint64_t v23 = 0x4000000000000000LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Timed out fetching meCard  after waiting %0.1g seconds",  buf,  0x16u);
    id v7 = (os_log_s *)AFSiriLogContextConnection;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v15[5]) {
      id v8 = @"a meCard";
    }
    else {
      id v8 = @"(null)";
    }
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADExtensionService _meCard]";
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Got %@", buf, 0x16u);
  }

  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (BOOL)_replacement:(id *)a3 forString:(id)a4 meCardCache:(id *)a5
{
  id v8 = a4;
  if ([v8 isEqualToString:_AFSUPRedactedUserFirstName])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADExtensionService _meCardWithCache:](self, "_meCardWithCache:", a5));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstName]);
LABEL_13:
    *a3 = v10;

    goto LABEL_14;
  }

  if ([v8 isEqualToString:_AFSUPRedactedUserMiddleName])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADExtensionService _meCardWithCache:](self, "_meCardWithCache:", a5));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 middleName]);
    goto LABEL_13;
  }

  if ([v8 isEqualToString:_AFSUPRedactedUserLastName])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADExtensionService _meCardWithCache:](self, "_meCardWithCache:", a5));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastName]);
    goto LABEL_13;
  }

  if ([v8 isEqualToString:_AFSUPRedactedUserFullName])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADExtensionService _meCardWithCache:](self, "_meCardWithCache:", a5));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fullName]);
    goto LABEL_13;
  }

  if ([v8 isEqualToString:_AFSUPRedactedUserNickName])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADExtensionService _meCardWithCache:](self, "_meCardWithCache:", a5));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nickName]);
    goto LABEL_13;
  }

  if ([v8 isEqualToString:_AFSUPRedactedMeCardInternalGUID])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADExtensionService _meCardWithCache:](self, "_meCardWithCache:", a5));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 internalGUID]);
    goto LABEL_13;
  }

  if (![v8 isEqualToString:_AFSUPRedactedRelationName])
  {
    BOOL v11 = 0;
    goto LABEL_15;
  }

  __int16 v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315394;
    id v15 = "-[ADExtensionService _replacement:forString:meCardCache:]";
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s No replacement for %@, but there should be one",  (uint8_t *)&v14,  0x16u);
  }

- (BOOL)_preparePerson:(id)a3 meCardCache:(id *)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[ADExtensionService _preparePerson:meCardCache:]";
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v30 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 contactIdentifier]);
  unsigned int v9 = -[ADExtensionService _replacement:forString:meCardCache:]( self,  "_replacement:forString:meCardCache:",  &v30,  v8,  a4);
  id v10 = v30;

  if (v9)
  {
    BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[ADExtensionService _preparePerson:meCardCache:]";
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s setting contactIdentifier to %@", buf, 0x16u);
    }

    [v6 setContactIdentifier:v10];
  }

  id v29 = v10;
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
  unsigned int v13 = -[ADExtensionService _replacement:forString:meCardCache:]( self,  "_replacement:forString:meCardCache:",  &v29,  v12,  a4);
  id v14 = v29;

  if (v13)
  {
    id v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[ADExtensionService _preparePerson:meCardCache:]";
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s setting displayName to %@", buf, 0x16u);
    }

    [v6 setDisplayName:v14];
    unsigned int v9 = 1;
  }

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 nameComponents]);
  unsigned int v17 = -[ADExtensionService _prepareNameComponents:meCardCache:](self, "_prepareNameComponents:meCardCache:", v16, a4);

  int v18 = v17 | v9;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "siriMatches", 0));
  id v20 = [v19 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        v18 |= -[ADExtensionService _preparePerson:meCardCache:]( self,  "_preparePerson:meCardCache:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v23),  a4);
        uint64_t v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v21);
  }

  return v18 & 1;
}

- (BOOL)_prepareNameComponents:(id)a3 meCardCache:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
      __int16 v39 = 2112;
      id v40 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

    id v36 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 namePrefix]);
    unsigned int v9 = -[ADExtensionService _replacement:forString:meCardCache:]( self,  "_replacement:forString:meCardCache:",  &v36,  v8,  a4);
    id v10 = v36;

    if (v9)
    {
      BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s setting nameComponents.namePrefix to %@",  buf,  0x16u);
      }

      [v6 setNamePrefix:v10];
    }

    id v35 = v10;
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 givenName]);
    unsigned int v13 = -[ADExtensionService _replacement:forString:meCardCache:]( self,  "_replacement:forString:meCardCache:",  &v35,  v12,  a4);
    id v14 = v35;

    if (v13)
    {
      id v15 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s setting nameComponents.givenName to %@",  buf,  0x16u);
      }

      [v6 setGivenName:v14];
      LOBYTE(v9) = 1;
    }

    id v34 = v14;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 middleName]);
    unsigned int v17 = -[ADExtensionService _replacement:forString:meCardCache:]( self,  "_replacement:forString:meCardCache:",  &v34,  v16,  a4);
    id v18 = v34;

    if (v17)
    {
      id v19 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s setting nameComponents.middleName to %@",  buf,  0x16u);
      }

      [v6 setMiddleName:v18];
      LOBYTE(v9) = 1;
    }

    id v33 = v18;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 nameSuffix]);
    unsigned int v21 = -[ADExtensionService _replacement:forString:meCardCache:]( self,  "_replacement:forString:meCardCache:",  &v33,  v20,  a4);
    id v22 = v33;

    if (v21)
    {
      uint64_t v23 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s setting nameComponents.nameSuffix to %@",  buf,  0x16u);
      }

      [v6 setNameSuffix:v22];
      LOBYTE(v9) = 1;
    }

    id v32 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 nickname]);
    unsigned int v25 = -[ADExtensionService _replacement:forString:meCardCache:]( self,  "_replacement:forString:meCardCache:",  &v32,  v24,  a4);
    id v26 = v32;

    if (v25)
    {
      __int128 v27 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[ADExtensionService _prepareNameComponents:meCardCache:]";
        __int16 v39 = 2112;
        id v40 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s setting nameComponents.nickname to %@",  buf,  0x16u);
      }

      [v6 setNickname:v26];
      LOBYTE(v9) = 1;
    }

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v6 phoneticRepresentation]);
    unsigned __int8 v29 = -[ADExtensionService _prepareNameComponents:meCardCache:]( self,  "_prepareNameComponents:meCardCache:",  v28,  a4);

    char v30 = v29 | v9;
  }

  else
  {
    char v30 = 0;
  }

  return v30;
}

- (BOOL)_intentNeedsPreparation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___INRequestPaymentIntent);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___INSearchCallHistoryIntent);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___INSearchForMessagesIntent), (objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___INSearchForPhotosIntent), (objc_opt_isKindOfClass(v3, v7) & 1) != 0)
    || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___INSendMessageIntent), (objc_opt_isKindOfClass(v3, v8) & 1) != 0)
    || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___INSendPaymentIntent), (objc_opt_isKindOfClass(v3, v9) & 1) != 0)
    || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___INStartCallIntent), (objc_opt_isKindOfClass(v3, v10) & 1) != 0)
    || (uint64_t v11 = objc_opt_class(&OBJC_CLASS___INStartPhotoPlaybackIntent), (objc_opt_isKindOfClass(v3, v11) & 1) != 0)
    || (uint64_t v12 = objc_opt_class(&OBJC_CLASS___INStartAudioCallIntent), (objc_opt_isKindOfClass(v3, v12) & 1) != 0))
  {
LABEL_10:
    char isKindOfClass = 1;
  }

  else
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___INStartVideoCallIntent);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v15);
  }

  return isKindOfClass & 1;
}

- (void)_logUUFRConditionally:(id)a3 executionContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SAIntentGroupLaunchAppWithIntent);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    kdebug_trace(722468912LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 turnId]);

    if (v9)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUUFRReady);
      uint64_t v11 = (objc_class *)objc_opt_class(v5);
      uint64_t v12 = NSStringFromClass(v11);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      [v10 setAceCommandClass:v13];

      id v14 = objc_alloc(&OBJC_CLASS___NSUUID);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);
      __int16 v16 = -[NSUUID initWithUUIDString:](v14, "initWithUUIDString:", v15);

      if (v16)
      {
        id v17 = [[SISchemaUUID alloc] initWithNSUUID:v16];
        [v10 setAceCommandId:v17];
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AFDialogPhase completionDialogPhase](&OBJC_CLASS___AFDialogPhase, "completionDialogPhase"));
      objc_msgSend(v10, "setDialogPhase:", objc_msgSend(v18, "UEIUUFRReadyDialogPhase"));

      [v10 setUufrReadySource:3];
      id v19 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        id v22 = v19;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 encodedClassName]);
        int v24 = 136315650;
        unsigned int v25 = "-[ADExtensionService _logUUFRConditionally:executionContext:]";
        __int16 v26 = 2112;
        __int128 v27 = v23;
        __int16 v28 = 2112;
        unsigned __int8 v29 = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s Logging UUFR ready for %@ with turnId: %@",  (uint8_t *)&v24,  0x20u);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      [v20 logInstrumentation:v10 machAbsoluteTime:mach_absolute_time() turnIdentifier:v9];
    }

    else
    {
      unsigned int v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v24 = 136315138;
        unsigned int v25 = "-[ADExtensionService _logUUFRConditionally:executionContext:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Failed to find turnId for UUFR",  (uint8_t *)&v24,  0xCu);
      }
    }
  }
}

- (ADCommandCenterClient)commandCenterClient
{
  return (ADCommandCenterClient *)objc_loadWeakRetained((id *)&self->_commandCenterClient);
}

- (void)setCommandCenterClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end