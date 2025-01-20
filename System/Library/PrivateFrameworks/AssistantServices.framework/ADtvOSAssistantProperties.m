@interface ADtvOSAssistantProperties
- (ADtvOSAssistantProperties)initWithQueue:(id)a3;
- (BOOL)_getIsAdaptiveVolumeEnabled;
- (BOOL)_getIsPermanentOffsetEnabled;
- (BOOL)_getIsPersonalDomainsEnabled;
- (float)_getPermanentOffsetFactor;
- (id)_getODDAdaptiveVolumeProperties;
- (id)_getODDHomePodProperties;
- (id)_getODDMultiUserSetupStatusFrom:(id)a3;
- (id)_getVoiceSettings;
- (int)_getAdaptiveVolumeUserIntent;
- (void)_getMultiUserSetupStatusWithCompletion:(id)a3;
- (void)_getODDMultiUserStateWithCompletion:(id)a3;
- (void)_getODDUserPersonalizationArrayWithCompletion:(id)a3;
- (void)_getODDUserPersonalizationForSharedUser:(id)a3 withCompletion:(id)a4;
- (void)getODDtvOSAssistantPropertiesWithCompletion:(id)a3;
@end

@implementation ADtvOSAssistantProperties

- (ADtvOSAssistantProperties)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADtvOSAssistantProperties;
  v6 = -[ADtvOSAssistantProperties init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)getODDtvOSAssistantPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[ADtvOSAssistantProperties getODDtvOSAssistantPropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDtvOSAssistantProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADtvOSAssistantProperties _getODDHomePodProperties](self, "_getODDHomePodProperties"));
  [v6 setHomePodProperties:v7];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100117274;
  v10[3] = &unk_1004F1C70;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  -[ADtvOSAssistantProperties _getODDMultiUserStateWithCompletion:](self, "_getODDMultiUserStateWithCompletion:", v10);
}

- (void)_getODDMultiUserStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ADtvOSAssistantProperties _getODDMultiUserStateWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v6 = dispatch_group_create();
  id v7 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDMultiUserState);
  dispatch_group_enter(v6);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100117200;
  v21[3] = &unk_1004F1C98;
  id v8 = v7;
  id v22 = v8;
  id v9 = v6;
  v23 = v9;
  -[ADtvOSAssistantProperties _getMultiUserSetupStatusWithCompletion:]( self,  "_getMultiUserSetupStatusWithCompletion:",  v21);
  dispatch_group_enter(v9);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10011722C;
  v18[3] = &unk_1004F5AF8;
  id v10 = v8;
  id v19 = v10;
  v20 = v9;
  id v11 = v9;
  -[ADtvOSAssistantProperties _getODDUserPersonalizationArrayWithCompletion:]( self,  "_getODDUserPersonalizationArrayWithCompletion:",  v18);
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100117258;
  v15[3] = &unk_1004FD990;
  id v16 = v10;
  id v17 = v4;
  id v13 = v10;
  id v14 = v4;
  dispatch_group_notify(v11, queue, v15);
}

- (void)_getODDUserPersonalizationArrayWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[ADtvOSAssistantProperties _getODDUserPersonalizationArrayWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v5 = dispatch_group_create();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedUsersBySharedUserID]);
  id v8 = [v7 count];

  id v9 = &unk_1003C9000;
  if (v8)
  {
    id v22 = v3;
    id v10 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedUsersBySharedUserID]);
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v15);
          id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedUsersBySharedUserID", v22));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v16]);

          if (v18)
          {
            dispatch_group_enter(v5);
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472LL;
            v27[2] = sub_1001171B8;
            v27[3] = &unk_1004F1CC0;
            v28 = v10;
            v29 = v5;
            -[ADtvOSAssistantProperties _getODDUserPersonalizationForSharedUser:withCompletion:]( self,  "_getODDUserPersonalizationForSharedUser:withCompletion:",  v18,  v27);
          }

          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v13);
    }

    id v3 = v22;
    id v9 = (void *)&unk_1003C9000;
  }

  else
  {
    id v10 = 0LL;
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = v9[280];
  block[2] = sub_1001171E4;
  block[3] = &unk_1004FD990;
  v25 = v10;
  id v26 = v3;
  v20 = v10;
  id v21 = v3;
  dispatch_group_notify(v5, queue, block);
}

- (void)_getODDUserPersonalizationForSharedUser:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[ADtvOSAssistantProperties _getODDUserPersonalizationForSharedUser:withCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDUserPersonalization);
  objc_msgSend(v9, "setIsPersonalDomainRequestsEnabled:", objc_msgSend(v6, "personalDomainsIsEnabled"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADtvOSAssistantProperties _getVoiceSettings](self, "_getVoiceSettings"));
  [v9 setVoiceSettings:v10];

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100117174;
  v14[3] = &unk_1004FD6C8;
  id v15 = v9;
  id v16 = v7;
  id v12 = v7;
  id v13 = v9;
  +[ADDevicePropertiesUtils fetchActiveSubscriptionsWithQueue:completion:]( &OBJC_CLASS___ADDevicePropertiesUtils,  "fetchActiveSubscriptionsWithQueue:completion:",  queue,  v14);
}

- (id)_getODDHomePodProperties
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[ADtvOSAssistantProperties _getODDHomePodProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDHomePodProperties);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADtvOSAssistantProperties _getODDAdaptiveVolumeProperties](self, "_getODDAdaptiveVolumeProperties"));
  [v4 setAdaptiveVolume:v5];

  objc_msgSend( v4,  "setIsPersonalDomainsEnabled:",  -[ADtvOSAssistantProperties _getIsPersonalDomainsEnabled](self, "_getIsPersonalDomainsEnabled"));
  return v4;
}

- (id)_getODDAdaptiveVolumeProperties
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    int v7 = "-[ADtvOSAssistantProperties _getODDAdaptiveVolumeProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDAdaptiveVolumeProperties);
  objc_msgSend( v4,  "setIsAdaptiveVolumeEnabled:",  -[ADtvOSAssistantProperties _getIsAdaptiveVolumeEnabled](self, "_getIsAdaptiveVolumeEnabled"));
  objc_msgSend( v4,  "setAdaptiveVolume:",  -[ADtvOSAssistantProperties _getAdaptiveVolumeUserIntent](self, "_getAdaptiveVolumeUserIntent"));
  objc_msgSend( v4,  "setIsPermanentOffsetEnabled:",  -[ADtvOSAssistantProperties _getIsPermanentOffsetEnabled](self, "_getIsPermanentOffsetEnabled"));
  -[ADtvOSAssistantProperties _getPermanentOffsetFactor](self, "_getPermanentOffsetFactor");
  objc_msgSend(v4, "setPermanentOffsetFactor:");
  return v4;
}

- (id)_getODDMultiUserSetupStatusFrom:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[ADtvOSAssistantProperties _getODDMultiUserSetupStatusFrom:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDMultiUserSetupStatus);
  objc_msgSend(v5, "setNumGuestsAccepted:", objc_msgSend(v3, "numGuestsAccepted"));
  objc_msgSend(v5, "setNumParticipantsWithTrust:", objc_msgSend(v3, "numParticipantsWithTrust"));
  objc_msgSend(v5, "setNumUsersWhoSyncedRecognizeMyVoice:", objc_msgSend(v3, "numUsersWhoSyncedRecognizeMyVoice"));
  objc_msgSend(v5, "setNumUsersWithRecognizeMyVoiceEnabled:", objc_msgSend(v3, "numUsersWithRecognizeMyVoiceEnabled"));
  objc_msgSend(v5, "setNumVoiceProfilesAvailable:", objc_msgSend(v3, "numVoiceProfilesAvailable"));
  objc_msgSend(v5, "setNumUsersWithPersonalRequestsEnabled:", objc_msgSend(v3, "numUsersWithPersonalRequestsEnabled"));
  objc_msgSend(v5, "setNumUsersWithMatchingSiriLanguage:", objc_msgSend(v3, "numUsersWithMatchingSiriLanguage"));
  objc_msgSend(v5, "setNumUsersWithSiriCloudSyncEnabled:", objc_msgSend(v3, "numUsersWithSiriCloudSyncEnabled"));
  objc_msgSend(v5, "setNumUsersWithLocationServicesEnabled:", objc_msgSend(v3, "numUsersWithLocationServicesEnabled"));

  return v5;
}

- (void)_getMultiUserSetupStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADBuddyMonitor sharedManager](&OBJC_CLASS___ADBuddyMonitor, "sharedManager"));
  unsigned int v6 = [v5 isPastBuddy];

  if (AFSupportsMultiUser(v7, v8) && v6)
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADtvOSAssistantProperties _getMultiUserSetupStatusWithCompletion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Retrieving", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000LL;
    v28 = sub_100116EC0;
    v29 = sub_100116ED0;
    id v30 = 0LL;
    id v10 = objc_alloc(&OBJC_CLASS___AFOneArgumentSafetyBlock);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100116ED8;
    v23[3] = &unk_1004F1CE8;
    v23[4] = self;
    p___int128 buf = &buf;
    id v24 = v4;
    id v11 = [v10 initWithBlock:v23];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100116F84;
    v21[3] = &unk_1004F1D10;
    id v13 = v11;
    id v22 = v13;
    [v12 fetchMultiUserMetricsWithCompletion:v21];

    uint64_t v14 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
    queue = self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100116F90;
    v19[3] = &unk_1004FD940;
    id v16 = v13;
    id v20 = v16;
    id v17 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v14,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v19,  3.0);
    v18 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v17;

    [*(id *)(*((void *)&buf + 1) + 40) start];
    _Block_object_dispose(&buf, 8);
  }

  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (id)_getVoiceSettings
{
  return 0LL;
}

- (BOOL)_getIsPersonalDomainsEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 primaryUser]);
  unsigned __int8 v4 = [v3 personalDomainsIsEnabled];

  return v4;
}

- (BOOL)_getIsAdaptiveVolumeEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 smartSiriVolumeContextAwareEnabled];

  return v3;
}

- (int)_getAdaptiveVolumeUserIntent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v2 adaptiveSiriVolumeRecentIntent]));

  unsigned int v4 = [v3 intValue];
  if (v4 - 1 < 3) {
    int v5 = v4 + 1;
  }
  else {
    int v5 = 1;
  }

  return v5;
}

- (BOOL)_getIsPermanentOffsetEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 isAdaptiveSiriVolumePermanentOffsetEnabled];

  return v3;
}

- (float)_getPermanentOffsetFactor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  [v2 adaptiveSiriVolumePermanentOffset];
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));

  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
}

@end