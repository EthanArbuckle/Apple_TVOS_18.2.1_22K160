@interface ADHomeInfoManager
+ (id)sharedInfoManager;
- (ADHomeInfoManager)initWithHomeManager:(id)a3 queue:(id)a4;
- (AFHomeAccessoryInfo)currentAccessoryInfo;
- (BOOL)_allowExplicitContentSettingForUser:(id)a3 forHome:(id)a4;
- (BOOL)_hasSiriCapableDeviceInHome:(id)a3;
- (BOOL)_updateHomeUserSettings;
- (BOOL)areActivityNotificationsOffForAllHomes;
- (BOOL)hasOptedInHH2;
- (HMHome)currentHome;
- (NSUUID)accessoryLoggingSalt;
- (id)_accessoryForIdentifier:(id)a3 inHome:(id *)a4;
- (id)_accessoryInfoForAccessory:(id)a3;
- (id)_accessoryLoggingSalt;
- (id)_activityNotificationsForHomes:(id)a3;
- (id)_currentAccessory;
- (id)_currentAccessoryInfo;
- (id)_currentHome;
- (id)_currentHomeInfo;
- (id)_getAccessoryCategoryForExecutionInfo:(id)a3;
- (id)_homeManager;
- (id)_homesWithMultiUserEnabled;
- (id)_homesWithSiriCapableDevices;
- (id)_init;
- (id)_initWithContext:(id)a3;
- (id)_settingsForHomeUser:(id)a3 forHome:(id)a4;
- (id)getCurrentASRLanguages;
- (id)infoForThisDevice;
- (id)preferredMediaUserInfo;
- (id)rootAfHomeInfoForThisDevice;
- (id)updatedHomeInfoForRootInfo:(id)a3;
- (void)JSCapableHomeAccessories:(id)a3;
- (void)JSCapableHomeAccessories:(id)a3 queue:(id)a4;
- (void)_checkAndDisableVoiceIDIfRequired;
- (void)_enumerateListenersUsingBlock:(id)a3;
- (void)_homeManagerUpdatedHomes:(id)a3;
- (void)_homeManagerUpdatedHomes:(id)a3 homesToDelete:(id)a4;
- (void)_logRelevantAnalyticsOnHomeUserSettingsUpdateForCurrentSettings:(id)a3 allowVoiceIdSettingValue:(int64_t)a4 isPrimaryUser:(BOOL)a5;
- (void)_onceSiriDataSharingAdjustment:(id)a3;
- (void)_propagateSiriDataSharingOptInStatus:(int64_t)a3 toAccessory:(id)a4;
- (void)_resolveSiriDataSharingStatusMismatch:(id)a3;
- (void)_setPreferredMediaUserForAccessories:(id)a3;
- (void)_setPreferredMediaUserForAccessory:(id)a3;
- (void)_siriDataSharingAdjustment:(id)a3;
- (void)_siriDataSharingOptInStatusDidChange:(id)a3;
- (void)_startAcceptingCloudSharesForMultiUserService;
- (void)_startCloudKitActivityForHomes:(id)a3 homesToDelete:(id)a4;
- (void)_startCloudSharingForMultiUserService:(id)a3;
- (void)_updateCurrentAccessoryInfoWithAccessory:(id)a3;
- (void)_updateHomeContext:(id)a3;
- (void)_updateVoiceTriggerPhrase;
- (void)accessoriesWithSiriInTheHome:(id)a3 completion:(id)a4;
- (void)accessoriesWithSiriInTheHome:(id)a3 completion:(id)a4 queue:(id)a5;
- (void)accessoryDidUpdateName:(id)a3;
- (void)accessoryDidUpdatePreferredMediaUser:(id)a3;
- (void)accessoryDidUpdateSupportsThirdPartyMusic:(id)a3;
- (void)addListener:(id)a3;
- (void)availableLanguagesInTheHome:(id)a3;
- (void)currentHomeWithCompletion:(id)a3;
- (void)dealloc;
- (void)emitHomeMetricInvocationEvent;
- (void)fetchAccessoriesInRoom:(id)a3 matchingCategoryTypes:(id)a4 completion:(id)a5;
- (void)fetchMultiUserMetricsWithCompletion:(id)a3;
- (void)getAccessoryCategoryForExecutionInfo:(id)a3 completion:(id)a4;
- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getCurrentAccessoryInfoWithCompletion:(id)a3;
- (void)getCurrentAccessoryWithCompletion:(id)a3;
- (void)getCurrentHomeMemberIds:(id)a3;
- (void)getHomeContext:(id)a3;
- (void)getHomeIdForAccessoryId:(id)a3 completion:(id)a4;
- (void)getHomeManagerWithCompletion:(id)a3;
- (void)getLocalizedAccessoryCategoryForExecutionInfo:(id)a3 completion:(id)a4;
- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getVoiceSettingsForHomeMembers:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)home:(id)a3 didUpdateSiriPhraseOptions:(unint64_t)a4;
- (void)homeDidEnableMultiUser:(id)a3;
- (void)homeDidUpdateName:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateAssistantIdentifiers:(id)a3;
- (void)homeManagerDidUpdateCurrentHome:(id)a3;
- (void)homeManagerDidUpdateDataSyncState:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)initializeHomeSiriPhraseOptions:(id)a3 completion:(id)a4;
- (void)isJustSiriEnabledInTheHome:(id)a3;
- (void)isJustSiriEnabledInTheHome:(id)a3 queue:(id)a4;
- (void)removeListener:(id)a3;
- (void)restartShareDeletion;
- (void)restartSharing;
- (void)setAllowHeySiriHomeKitSetting:(BOOL)a3 queue:(id)a4 completion:(id)a5;
- (void)setAllowHeySiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4;
- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3;
- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4;
- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4 queue:(id)a5;
- (void)setRecognizeMyVoiceEnabled:(BOOL)a3;
- (void)settingsDidUpdate:(id)a3;
- (void)settingsForMultiUserWithRefresh:(BOOL)a3 completion:(id)a4;
- (void)settingsWillUpdate:(id)a3;
- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completion:(id)a5;
- (void)startAcceptingCloudSharesForMultiUserService;
- (void)updateCurrentUserRMVSettingForHome:(id)a3 enabled:(BOOL)a4 completion:(id)a5;
- (void)updateRMVSettingForUser:(id)a3 enabled:(BOOL)a4 completion:(id)a5;
- (void)updateVoiceTriggerPhrase:(unint64_t)a3 currentAccessoryInfo:(id)a4;
- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5;
@end

@implementation ADHomeInfoManager

- (void)setAllowHeySiriHomeKitSetting:(BOOL)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = (dispatch_queue_s *)a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004EF60;
  v12[3] = &unk_1004FBFC0;
  v12[4] = self;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager currentAccessoryInfo](self, "currentAccessoryInfo"));
  BOOL v15 = a3;
  id v14 = v8;
  id v10 = v8;
  id v11 = v13;
  dispatch_async(v9, v12);
}

- (void)updateVoiceTriggerPhrase:(unint64_t)a3 currentAccessoryInfo:(id)a4
{
  id v6 = a4;
  v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v14 = v7;
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    int v16 = 136315906;
    v17 = "-[ADHomeInfoManager(VoiceActivation) updateVoiceTriggerPhrase:currentAccessoryInfo:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v15;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s Endpoint = %@\n %@ %ld",  (uint8_t *)&v16,  0x2Au);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 categoryType]);
  unsigned __int8 v9 = [v8 isEqual:HMAccessoryCategoryTypeHomePod];

  if ((v9 & 1) != 0)
  {
    id v10 = 0LL;
    uint64_t v11 = 0LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    uint64_t v11 = 2LL;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  id v13 =  [v12 setUserPreferredVoiceTriggerPhraseType:a3 == 3 sender:self deviceType:v11 endpointId:v10];
}

- (void)home:(id)a3 didUpdateSiriPhraseOptions:(unint64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager currentAccessoryInfo](self, "currentAccessoryInfo", a3));
  -[ADHomeInfoManager updateVoiceTriggerPhrase:currentAccessoryInfo:]( self,  "updateVoiceTriggerPhrase:currentAccessoryInfo:",  a4,  v6);
}

- (void)isJustSiriEnabledInTheHome:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ADHomeInfoManager(VoiceActivation) isJustSiriEnabledInTheHome:queue:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10004EEFC;
    v9[3] = &unk_1004FD990;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(v7, v9);
  }
}

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4 queue:(id)a5
{
  id v8 = a4;
  unsigned __int8 v9 = (dispatch_queue_s *)a5;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[ADHomeInfoManager(VoiceActivation) setAllowJustSiriHomeKitSetting:withCompletion:queue:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10004ED30;
  v16[3] = &unk_1004FCC00;
  id v17 = v8;
  id v11 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10004ED44;
  v13[3] = &unk_1004FCB38;
  BOOL v15 = a3;
  v13[4] = self;
  id v14 = objc_retainBlock(v16);
  v12 = v14;
  dispatch_async(v9, v13);
}

- (id)_init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
  id v4 = -[ADHomeInfoManager _initWithContext:](self, "_initWithContext:", v3);

  return v4;
}

- (id)_initWithContext:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ADHomeInfoManager;
  v5 = -[ADHomeInfoManager init](&v20, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("ADHomeInfoManager", v7);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    id v10 = (dispatch_queue_s *)v5->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FC1C8;
    block[3] = &unk_1004FD968;
    __int16 v18 = v5;
    id v19 = v4;
    dispatch_async(v10, block);
    id v11 = v5->_queue;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001FC3FC;
    v15[3] = &unk_1004FBBD0;
    int v16 = v11;
    id v13 = v11;
    [v12 addQueue:v13 heartBeatInterval:v15 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return v5;
}

- (void)updateRMVSettingForUser:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[ADHomeInfoManager updateRMVSettingForUser:enabled:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001FBC94;
  v14[3] = &unk_1004FBFC0;
  id v15 = v8;
  id v16 = v9;
  v14[4] = self;
  BOOL v17 = a4;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (void)updateCurrentUserRMVSettingForHome:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[ADHomeInfoManager updateCurrentUserRMVSettingForHome:enabled:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001FB75C;
  v14[3] = &unk_1004FBFC0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);
}

- (ADHomeInfoManager)initWithHomeManager:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADHomeInfoManager;
  id v9 = -[ADHomeInfoManager init](&v17, "init");
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_homeManager, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    instanceContext = v10->_instanceContext;
    v10->_instanceContext = (AFInstanceContext *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v13;

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:v10 selector:"_siriDataSharingOptInStatusDidChange:" name:@"ADPreferencesSiriDataSharingOptInStatusDidChangeNotification" object:0];
  }

  return v10;
}

- (BOOL)hasOptedInHH2
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _homeManager](self, "_homeManager"));
  unsigned __int8 v3 = [v2 hasOptedToHH2];

  return v3;
}

- (void)startAcceptingCloudSharesForMultiUserService
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FB754;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (id)_homeManager
{
  homeManager = self->_homeManager;
  if (!homeManager)
  {
    id v4 = -[HMHomeManager initWithOptions:](objc_alloc(&OBJC_CLASS___HMHomeManager), "initWithOptions:", 32888LL);
    v5 = self->_homeManager;
    self->_homeManager = v4;

    -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", self);
    dispatch_queue_attr_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v7 = self->_homeManager;
      int v9 = 136315394;
      id v10 = "-[ADHomeInfoManager _homeManager]";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s homeManager = %@", (uint8_t *)&v9, 0x16u);
    }

    homeManager = self->_homeManager;
  }

  return homeManager;
}

- (void)dealloc
{
  unsigned __int8 v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADHomeInfoManager dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADHomeInfoManager;
  -[ADHomeInfoManager dealloc](&v5, "dealloc");
}

- (void)_updateHomeContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v71 = "-[ADHomeInfoManager _updateHomeContext:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v47 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 homes]);
  id v8 = [v7 count];
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v8));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v8));
  v48 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 currentHome]);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v62 objects:buf count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v63;
    uint64_t v14 = SAHAEntityTypeHOMEValue;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        id v17 = objc_alloc_init(&OBJC_CLASS___SAHAEntity);
        [v17 setEntityType:v14];
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
        [v17 setName:v18];

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 assistantIdentifier]);
        objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v19));
        [v17 setIdentifier:v20];

        [v9 addObject:v17];
        v21 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
        LODWORD(v20) = [v21 isEqual:v22];

        if ((_DWORD)v20) {
          [v50 addObject:v17];
        }
      }

      id v12 = [obj countByEnumeratingWithState:&v62 objects:buf count:16];
    }

    while (v12);
  }

  unint64_t v23 = objc_alloc_init(&OBJC_CLASS___SASetHomeContext);
  id v24 = [v9 copy];
  -[SASetHomeContext setEntities:](v23, "setEntities:", v24);

  id v25 = [v50 copy];
  -[SASetHomeContext setCurrentHomes:](v23, "setCurrentHomes:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  -[SASetHomeContext setByPassServerFlow:]( v23,  "setByPassServerFlow:",  [v26 homeAutomationServerFlowBypassed]);

  v27 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v68 = 136315138;
    v69 = "createHomeContext";
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Created homeContext", v68, 0xCu);
  }

  v28 = v47;
  objc_storeStrong((id *)&v47->_homeContext, v23);
  homeManager = v47->_homeManager;
  if (homeManager)
  {
    v46 = v23;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id v49 = (id)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](homeManager, "homes"));
    id obja = [v49 countByEnumeratingWithState:&v58 objects:v67 count:16];
    unsigned __int8 v30 = 0;
    if (obja)
    {
      uint64_t v51 = *(void *)v59;
      uint64_t v31 = HMAccessoryCategoryTypeHomePod;
      uint64_t v32 = HMAccessoryCategoryTypeAppleTV;
      do
      {
        for (j = 0LL; j != obja; j = (char *)j + 1)
        {
          if (*(void *)v59 != v51) {
            objc_enumerationMutation(v49);
          }
          v34 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 accessories]);
          id v36 = [v35 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v36)
          {
            id v37 = v36;
            uint64_t v38 = *(void *)v55;
            do
            {
              for (k = 0LL; k != v37; k = (char *)k + 1)
              {
                if (*(void *)v55 != v38) {
                  objc_enumerationMutation(v35);
                }
                v41 = (void *)objc_claimAutoreleasedReturnValue([v40 categoryType]);

                else {
                  unsigned __int8 v30 = [v41 isEqualToString:v32];
                }
              }

              id v37 = [v35 countByEnumeratingWithState:&v54 objects:v66 count:16];
            }

            while (v37);
          }
        }

        id obja = [v49 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }

      while (obja);
    }

    v42 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v71 = "-[ADHomeInfoManager _updateHomeContext:]";
      __int16 v72 = 1024;
      int v73 = v30 & 1;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s hasATVOrHomePod=%d", buf, 0x12u);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v43 setHasATVOrHomePodInHome:v30 & 1];

    unint64_t v23 = v46;
    v28 = v47;
  }

  if (v28->isATVOnly && -[ADHomeInfoManager _updateHomeUserSettings](v28, "_updateHomeUserSettings"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v44 postNotificationName:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v45 postNotificationName:@"ADHomeInfoHomeContextDidChangeNotification" object:v23];
}

- (void)currentHomeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001FB710;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)_currentHome
{
  currentHome = self->_currentHome;
  if (!currentHome)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _homeManager](self, "_homeManager"));
    id v5 = [v4 isDataSyncInProgress];
    if ((_DWORD)v5)
    {
      id v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int128 v54 = "-[ADHomeInfoManager _currentHome]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Home manager is still syncing", buf, 0xCu);
      }

      goto LABEL_32;
    }

    uint64_t v8 = AFIsHorseman(v5, v6);
    if ((v8 & 1) != 0 || AFIsATV(v8, v9))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
      id v11 = (HMHome *)objc_claimAutoreleasedReturnValue([v10 home]);
      id v12 = self->_currentHome;
      self->_currentHome = v11;

      uint64_t v13 = self->_currentHome;
      if (!v13)
      {
        uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int128 v54 = "-[ADHomeInfoManager _currentHome]";
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Unable to get current accessory, trying current home.",  buf,  0xCu);
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _homeManager](self, "_homeManager"));
        id v16 = (HMHome *)objc_claimAutoreleasedReturnValue([v15 currentHome]);
        id v17 = self->_currentHome;
        self->_currentHome = v16;

        uint64_t v13 = self->_currentHome;
      }

      -[HMHome setDelegate:](v13, "setDelegate:", self);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome owner](self->_currentHome, "owner"));
      [v18 setDelegate:self];
      -[HMHome setDelegate:](self->_currentHome, "setDelegate:", self);
      id v19 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        objc_super v20 = self->_currentHome;
        *(_DWORD *)buf = 136315651;
        __int128 v54 = "-[ADHomeInfoManager _currentHome]";
        __int16 v55 = 2113;
        __int128 v56 = v18;
        __int16 v57 = 2113;
        __int128 v58 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Home owner %{private}@ home %{private}@",  buf,  0x20u);
      }

      unsigned __int8 v21 = -[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint");
      __int16 v22 = self->_currentHome;
      if ((v21 & 1) == 0 && v22 && !self->_homekitSettingsClient)
      {
        unint64_t v23 = objc_alloc_init(&OBJC_CLASS___ADRemoraLanguageCache);
        remoraLanguageCache = self->_remoraLanguageCache;
        self->_remoraLanguageCache = v23;

        id v25 = objc_alloc(&OBJC_CLASS___ADRemoraHomeKitSettingsManager);
        v26 = (void *)objc_claimAutoreleasedReturnValue( -[HMHomeManager createAccessorySettingsDataSource]( self->_homeManager,  "createAccessorySettingsDataSource"));
        v27 = -[ADRemoraHomeKitSettingsManager initWithDataSource:home:]( v25,  "initWithDataSource:home:",  v26,  self->_currentHome);
        homekitSettingsClient = self->_homekitSettingsClient;
        self->_homekitSettingsClient = v27;

        v29 = -[ADRemoraLanguageManager initWithHomeKitSettingsManager:]( objc_alloc(&OBJC_CLASS___ADRemoraLanguageManager),  "initWithHomeKitSettingsManager:",  self->_homekitSettingsClient);
        languageManager = self->_languageManager;
        self->_languageManager = v29;

        __int16 v22 = self->_currentHome;
      }

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome owner](v22, "owner"));
      BOOL v32 = -[ADHomeInfoManager _allowExplicitContentSettingForUser:forHome:]( self,  "_allowExplicitContentSettingForUser:forHome:",  v31,  self->_currentHome);

      v33 = (void *)objc_claimAutoreleasedReturnValue( +[ADAssistantDataManager sharedDataManager]( &OBJC_CLASS___ADAssistantDataManager,  "sharedDataManager"));
      [v33 setAllowExplicitContentAndCensorSpeech:v32];

      if (AFIsHorseman(v34, v35))
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v10 settings]);
        [v36 setDelegate:self];
        if (self->_currentHome) {
          -[ADHomeInfoManager _siriDataSharingAdjustment:](self, "_siriDataSharingAdjustment:");
        }
      }
    }

    else
    {
      id v37 = (HMHome *)objc_claimAutoreleasedReturnValue([v4 primaryHome]);
      uint64_t v38 = self->_currentHome;
      self->_currentHome = v37;

      -[HMHome setDelegate:](self->_currentHome, "setDelegate:", self);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 homes]);
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      id v39 = [v10 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v49;
        do
        {
          for (i = 0LL; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v49 != v41) {
              objc_enumerationMutation(v10);
            }
            v43 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
            [v43 setDelegate:self];
            v44 = (void *)objc_claimAutoreleasedReturnValue([v43 currentUser]);
            [v44 setDelegate:self];
            v45 = (void *)objc_claimAutoreleasedReturnValue([v44 userSettingsForHome:v43]);
            v46 = (void *)objc_claimAutoreleasedReturnValue([v45 settings]);

            [v46 setDelegate:self];
          }

          id v40 = [v10 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }

        while (v40);
      }

      if (!self->_currentHome) {
        goto LABEL_31;
      }
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v18 postNotificationName:@"ADHomeInfoCurrentHomeIsReady" object:0];
    }

LABEL_31:
LABEL_32:

    currentHome = self->_currentHome;
  }

  return currentHome;
}

- (id)_currentHomeInfo
{
  if (!self->_currentHomeInfo)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentHome](self, "_currentHome"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 owner]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assistantAccessControlForHome:v3]);
    id v7 = sub_1001FAF08(v6, v4);
    uint64_t v8 = (ADHomeInfo *)objc_claimAutoreleasedReturnValue(v7);
    currentHomeInfo = self->_currentHomeInfo;
    self->_currentHomeInfo = v8;

    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v11 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v11)
    {
      uint64_t v13 = self->_currentHomeInfo;
      int v21 = 136315907;
      __int16 v22 = "-[ADHomeInfoManager _currentHomeInfo]";
      __int16 v23 = 2113;
      id v24 = v3;
      __int16 v25 = 2113;
      v26 = v5;
      __int16 v27 = 2113;
      v28 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s home (%{private}@) owner (%{private}@) %{private}@",  (uint8_t *)&v21,  0x2Au);
    }

    id v14 = (id)AFIsHorseman(v11, v12);
    if ((_DWORD)v14)
    {
      id v14 = (id)sub_1001FB040(v4, v6);
      if ((_DWORD)v14)
      {
        [v4 setDelegate:self];
        id v14 = -[ADHomeInfoManager _setPreferredMediaUserForAccessory:](self, "_setPreferredMediaUserForAccessory:", v4);
      }
    }

    if (v3 && self->isATVOnly)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
      [v16 syncATVRmVSettingIfAvailable];
    }

    if (AFIsHorseman(v14, v15))
    {
      id v17 = self->_currentHomeInfo;
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
      -[ADHomeInfo setCurrentHomeIdentifier:](v17, "setCurrentHomeIdentifier:", v18);
    }

    if (self->_currentHomeInfo)
    {
      -[ADHomeInfoManager _updateHomeUserSettings](self, "_updateHomeUserSettings");
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v19 postNotificationName:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
    }

    goto LABEL_18;
  }

  if (AFIsMultiUserCompanion(self)
    && -[ADHomeInfoManager _updateHomeUserSettings](self, "_updateHomeUserSettings"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 postNotificationName:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
LABEL_18:
  }

  return self->_currentHomeInfo;
}

- (void)_logRelevantAnalyticsOnHomeUserSettingsUpdateForCurrentSettings:(id)a3 allowVoiceIdSettingValue:(int64_t)a4 isPrimaryUser:(BOOL)a5
{
  BOOL v5 = a5;
  if (AFIsHorseman(self, a2))
  {
    if (v5) {
      id v7 = @"owner";
    }
    else {
      id v7 = @"participant";
    }
    v14[0] = @"user";
    v14[1] = @"date";
    v15[0] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v8,  1LL,  4LL));
    v15[1] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

    if (!a3)
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1001FB708;
      v12[3] = &unk_1004FD8D0;
      id v13 = v10;
      [v11 logEventWithType:6110 contextProvider:v12];
    }
  }

- (void)_siriDataSharingOptInStatusDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[ADHomeInfoManager _siriDataSharingOptInStatusDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (AFIsMultiUserCompanion(v6))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FB438;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_resolveSiriDataSharingStatusMismatch:(id)a3
{
  uint64_t v4 = AFIsHorseman(self, a2);
  if ((_DWORD)v4 && !_AFPreferencesSiriDataSharingOptInStatus(v4, v5))
  {
    BOOL v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v24 = 136315138;
      __int16 v25 = "-[ADHomeInfoManager _resolveSiriDataSharingStatusMismatch:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Siri Data Sharing status is unspecified on this device, check if there's a mismatch between this and HomeKit accessory's setting and recover",  (uint8_t *)&v24,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rootGroup]);
    id v10 = sub_1001F6E44(@"root.general.analytics.shareSiriAnalytics", v9);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);

      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
        unsigned int v14 = [v13 BOOLValue];

        if (v14)
        {
          uint64_t v15 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            int v24 = 136315138;
            __int16 v25 = "-[ADHomeInfoManager _resolveSiriDataSharingStatusMismatch:]";
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Accessory setting thinks this HomePod is Opted-In, but HomePod is in unspecified state, resolving mismatch",  (uint8_t *)&v24,  0xCu);
          }

          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
          id v17 = v16;
          uint64_t v18 = 1LL;
LABEL_20:
          [v16 setSiriDataSharingOptInStatus:v18 propagateToHomeAccessories:0 source:4 reason:@"resolveSiriDataSharingStatusMismatch" completion:0];

          goto LABEL_21;
        }

        int v21 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
        int v22 = [v21 BOOLValue];

        if ((v22 & 1) == 0)
        {
          __int16 v23 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            int v24 = 136315138;
            __int16 v25 = "-[ADHomeInfoManager _resolveSiriDataSharingStatusMismatch:]";
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Accessory setting thinks this HomePod is Opted-Out, but HomePod is in unspecified state, resolving mismatch",  (uint8_t *)&v24,  0xCu);
          }

          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
          id v17 = v16;
          uint64_t v18 = 2LL;
          goto LABEL_20;
        }

- (BOOL)_allowExplicitContentSettingForUser:(id)a3 forHome:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userSettingsForHome:a4]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 settings]);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rootGroup]);
  id v7 = sub_1001F6E44(@"root.music.allowExplicitContent", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
    unsigned __int8 v10 = [v9 BOOLValue];
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)_settingsForHomeUser:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userSettingsForHome:v7]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 settings]);

  [v6 setDelegate:self];
  [v9 setDelegate:self];
  if ([v7 isMultiUserEnabled]
    && (unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 rootGroup]),
        id v11 = sub_1001F6E44(@"root.siri.identifyVoice", v10),
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11),
        v10,
        v12))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
    uint64_t v14 = [v13 BOOLValue];
  }

  else
  {
    uint64_t v14 = 2LL;
  }

  BOOL v15 = -[ADHomeInfoManager _allowExplicitContentSettingForUser:forHome:]( self,  "_allowExplicitContentSettingForUser:forHome:",  v6,  v7);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 assistantAccessControlForHome:v7]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
  uint64_t v18 = sub_1001FAF08(v16, v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  id v20 = [v19 personalDomainsIsEnabled];
  uint64_t v21 = [v19 securePersonalDomainsRequireAuth] ^ 1;
  int v22 = objc_alloc(&OBJC_CLASS___NSDictionary);
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v20));
  int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21));
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14));
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
  __int16 v27 = -[NSDictionary initWithObjectsAndKeys:]( v22,  "initWithObjectsAndKeys:",  v23,  @"personalDomainsIsEnabled",  v24,  @"allowUnauthenticatedRequests",  v25,  @"allowVoiceID",  v26,  @"allowExplicitContent",  0LL);

  return v27;
}

- (BOOL)_updateHomeUserSettings
{
  v2 = self;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _homeManager](self, "_homeManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 homes]);

  if (!v2->_homeUserSettings)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    homeUserSettings = v2->_homeUserSettings;
    v2->_homeUserSettings = v5;
  }

  v139 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  if (v2->isATVOnly)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](v2, "_currentAccessory"));

    if (!v7)
    {
      v2->_allowATVRmVHomeSettingSync = 1;
      v128 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v165 = "-[ADHomeInfoManager _updateHomeUserSettings]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_DEBUG,  "%s #multi-user-atv No current accessory found... ATV is not part of home",  buf,  0xCu);
      }

      BOOL v127 = 0;
      goto LABEL_209;
    }
  }

  __int128 v161 = 0u;
  __int128 v162 = 0u;
  __int128 v159 = 0u;
  __int128 v160 = 0u;
  v130 = v4;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v159 objects:v170 count:16];
  id v133 = v8;
  if (!v8)
  {
    LOBYTE(v147) = 0;
    char v142 = 0;
    uint64_t v136 = 2LL;
    goto LABEL_190;
  }

  int v147 = 0;
  char v142 = 0;
  uint64_t v136 = 2LL;
  uint64_t v132 = *(void *)v160;
  v138 = v2;
  do
  {
    unsigned __int8 v10 = 0LL;
    do
    {
      if (*(void *)v160 != v132) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(HMHome **)(*((void *)&v159 + 1) + 8LL * (void)v10);
      id v8 = (id)AFSupportsMultiUser(v8, v9);
      if ((_DWORD)v8 && v11 != v2->_currentHome) {
        goto LABEL_167;
      }
      v146 = v11;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome owner](v11, "owner", v130));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);
      uint64_t v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);

      if (!v14)
      {
        v120 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v165 = "-[ADHomeInfoManager _updateHomeUserSettings]";
          _os_log_error_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "%s Home is not present", buf, 0xCu);
        }

        goto LABEL_204;
      }

      v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      BOOL v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2->_homeUserSettings, "objectForKey:", v14));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v15, "objectForKey:", @"allowVoiceID"));
      id v17 = [v16 integerValue];
      v154 = v15;
      if (v15)
      {
        uint64_t v18 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315651;
          v165 = "-[ADHomeInfoManager _updateHomeUserSettings]";
          __int16 v166 = 2113;
          v167 = v154;
          __int16 v168 = 2112;
          v169 = v146;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s primaryUser previous settings %{private}@ for home (%@)",  buf,  0x20u);
        }

        [v141 setObject:v16 forKey:v14];
      }

      v151 = v16;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome owner](v146, "owner"));
      id v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[ADHomeInfoManager _settingsForHomeUser:forHome:]( v2,  "_settingsForHomeUser:forHome:",  v19,  v146));

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v20, "objectForKey:", @"allowVoiceID"));
      id v22 = [v21 integerValue];
      __int16 v23 = v21;
      [v144 setObject:v21 forKey:v14];
      BOOL v25 = v17 == v22 || v22 == (id)2;
      __int16 v26 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315651;
        v165 = "-[ADHomeInfoManager _updateHomeUserSettings]";
        __int16 v166 = 2113;
        v167 = v20;
        __int16 v168 = 2112;
        v169 = v146;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%s primaryUser new settings %{private}@ for home (%@)",  buf,  0x20u);
      }

      v134 = v10;
      if (!-[NSMutableDictionary isEqualToDictionary:](v154, "isEqualToDictionary:", v20)
        || v2->_allowATVRmVHomeSettingSync)
      {
        id v148 = v17;
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v154, "objectForKey:", @"allowExplicitContent"));
        unsigned int v28 = [v27 BOOLValue];

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v20, "objectForKey:", @"allowExplicitContent"));
        id v30 = [v29 BOOLValue];

        if (v28 != (_DWORD)v30)
        {
          BOOL v32 = (void *)objc_claimAutoreleasedReturnValue( +[ADAssistantDataManager sharedDataManager]( &OBJC_CLASS___ADAssistantDataManager,  "sharedDataManager"));
          [v32 setAllowExplicitContentAndCensorSpeech:v30];
        }

        if (AFIsMultiUserCompanion(v31))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome currentUser](v146, "currentUser"));
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueIdentifier]);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 UUIDString]);
          unsigned int v36 = -[NSMutableDictionary isEqualToString:](v14, "isEqualToString:", v35);

          if (v36)
          {
            v2 = v138;
            id v37 = v151;
            uint64_t v38 = v23;
            if (v22 == (id)1)
            {
              id v39 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315395;
                v165 = "-[ADHomeInfoManager _updateHomeUserSettings]";
                __int16 v166 = 2113;
                v167 = v14;
                _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%s Voice ID setting is ON for %{private}@",  buf,  0x16u);
              }

              uint64_t v40 = 1LL;
            }

            else
            {
              uint64_t v40 = v136;
              if (!v22) {
                uint64_t v40 = 0LL;
              }
            }

            uint64_t v136 = v40;
            if (v148) {
              BOOL v48 = 0;
            }
            else {
              BOOL v48 = v22 == (id)1;
            }
            int v49 = v48;
            v147 |= v49;
            goto LABEL_62;
          }
        }

        v2 = v138;
        id v37 = v151;
        uint64_t v38 = v23;
        if (v138->isATVOnly)
        {
          if (v154) {
            int v41 = v25;
          }
          else {
            int v41 = 1;
          }
          if (v41 == 1 && !v138->_allowATVRmVHomeSettingSync)
          {
          }

          else
          {
            if (v22 == (id)1)
            {
              v42 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315395;
                v165 = "-[ADHomeInfoManager _updateHomeUserSettings]";
                __int16 v166 = 2113;
                v167 = v14;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "%s #multi-user-atv Voice ID setting is ON for %{private}@",  buf,  0x16u);
              }

LABEL_45:
              v43 = v139;
              v44 = v14;
              uint64_t v45 = 2LL;
LABEL_46:
              [v43 triggerATVRmVStateChangeForiCloudAltDSID:0 homeUserID:v44 toState:v45];
            }

            else if ([v139 isRmVEnabledForHomeUser:v14] {
                   && v138->_allowATVRmVHomeSettingSync)
            }
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome uniqueIdentifier](v146, "uniqueIdentifier"));
              v47 = (void *)objc_claimAutoreleasedReturnValue([v46 UUIDString]);
              [v139 syncToCloudATVRmVSetting:1 homeID:v47 homeUserID:v14 notifyClients:v138->_allowATVRmVHomeSettingSync];
            }

            else if (!v22)
            {
              v43 = v139;
              v44 = v14;
              uint64_t v45 = 3LL;
              goto LABEL_46;
            }

            [v137 addObject:v14];
          }
        }

- (id)_homesWithMultiUserEnabled
{
  if (AFIsMultiUserCompanion(self))
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    unsigned __int8 v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v24 = "-[ADHomeInfoManager _homesWithMultiUserEnabled]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = self->_homeManager;
    if (!-[HMHomeManager status](v5, "status"))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](v5, "homes"));
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
            if ([v11 isMultiUserEnabled])
            {
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 owner]);
              id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);

              if (v14)
              {
                BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
                id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);

                -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, v16);
              }
            }
          }

          id v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }

        while (v8);
      }
    }

    id v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      int v24 = "-[ADHomeInfoManager _homesWithMultiUserEnabled]";
      __int16 v25 = 2112;
      __int16 v26 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s (%@)", buf, 0x16u);
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (id)infoForThisDevice
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1001F886C;
  unsigned __int8 v10 = sub_1001F887C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001FAEB8;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)preferredMediaUserInfo
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1001F886C;
  unsigned __int8 v10 = sub_1001F887C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001FAE80;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_setPreferredMediaUserForAccessories:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v32;
    uint64_t v28 = HMAccessoryCategoryTypeHomePod;
    *(void *)&__int128 v8 = 136315394LL;
    __int128 v27 = v8;
    do
    {
      id v11 = 0LL;
      id v29 = v9;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "siriEndpointProfile", v27));

        if (v13)
        {
          uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
          if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
LABEL_8:
            [v12 setDelegate:self];
            -[ADHomeInfoManager _setPreferredMediaUserForAccessory:](self, "_setPreferredMediaUserForAccessory:", v12);
            goto LABEL_14;
          }

          *(_DWORD *)buf = v27;
          unsigned int v36 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessories:]";
          __int16 v37 = 2112;
          uint64_t v38 = v12;
          int v24 = v14;
          __int16 v25 = "%s Endpoint = %@";
LABEL_17:
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, v25, buf, 0x16u);
          goto LABEL_8;
        }

        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
        if ([v15 isEqual:v16])
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 category]);
          uint64_t v18 = self;
          uint64_t v19 = v10;
          id v20 = v6;
          __int128 v21 = v5;
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v17 categoryType]);
          unsigned int v30 = [v22 isEqualToString:v28];

          uint64_t v5 = v21;
          id v6 = v20;
          uint64_t v10 = v19;
          self = v18;
          id v9 = v29;

          if (v30)
          {
            __int16 v23 = (os_log_s *)AFSiriLogContextDaemon;
            if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_8;
            }
            *(_DWORD *)buf = v27;
            unsigned int v36 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessories:]";
            __int16 v37 = 2112;
            uint64_t v38 = v12;
            int v24 = v23;
            __int16 v25 = "%s HomePod = %@";
            goto LABEL_17;
          }
        }

        else
        {
        }

- (void)_setPreferredMediaUserForAccessory:(id)a3
{
  id v4 = (os_log_s *)a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315395;
    __int128 v32 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessory:]";
    __int16 v33 = 2113;
    __int128 v34 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s accessory = %{private}@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s preferredMediaUser](v4, "preferredMediaUser"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentHome](self, "_currentHome"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 owner]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
    __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);

    uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      __int128 v32 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessory:]";
      __int16 v33 = 2113;
      __int128 v34 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s preferredMediaUser is not available, falling back to use home owner (%{private}@) as default",  buf,  0x16u);
    }

    if (!v8)
    {
      __int16 v25 = (void *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      __int128 v8 = v25;
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentHome](self, "_currentHome"));
      *(_DWORD *)buf = 136315651;
      __int128 v32 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessory:]";
      __int16 v33 = 2113;
      __int128 v34 = v16;
      __int16 v35 = 2113;
      unsigned int v36 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Unable to determine preferredMediaUser at this time for current home (%{private}@), home owner not available. Not setting preferredMediaUser for accessory (%{private}@)",  buf,  0x20u);
      goto LABEL_9;
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s siriEndpointProfile](v4, "siriEndpointProfile"));

  if (!v13)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s uniqueIdentifier](v4, "uniqueIdentifier"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueIdentifier]);
    if ([v18 isEqual:v19])
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s category](v4, "category"));
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 categoryType]);
      unsigned int v22 = [v21 isEqualToString:HMAccessoryCategoryTypeHomePod];

      if (v22)
      {
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_1001FA8BC;
        v26[3] = &unk_1004F7350;
        v26[4] = self;
        __int128 v27 = v8;
        [v23 getSharedUserIdForHomeUserId:v27 completion:v26];

LABEL_16:
        goto LABEL_17;
      }
    }

    else
    {
    }

    int v24 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v32 = "-[ADHomeInfoManager _setPreferredMediaUserForAccessory:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "%s Unknown accessory type, ignoring",  buf,  0xCu);
    }

    goto LABEL_16;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s uniqueIdentifier](v4, "uniqueIdentifier"));
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1001FA7E8;
  v28[3] = &unk_1004F6178;
  v28[4] = self;
  id v29 = v8;
  id v30 = v14;
  id v16 = v14;
  __int128 v8 = v8;
  [v15 getSharedUserIdForHomeUserId:v8 completion:v28];

LABEL_9:
LABEL_17:

LABEL_18:
}

- (void)getCurrentHomeMemberIds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001FA554;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)settingsForMultiUserWithRefresh:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FA4A4;
    block[3] = &unk_1004FCB38;
    void block[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    dispatch_async(queue, block);
  }
}

- (void)getVoiceSettingsForHomeMembers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001FA338;
    v6[3] = &unk_1004F61A0;
    id v7 = v4;
    -[ADHomeInfoManager settingsForMultiUserWithRefresh:completion:]( self,  "settingsForMultiUserWithRefresh:completion:",  0LL,  v6);
  }
}

- (void)getHomeIdForAccessoryId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001FA2BC;
      block[3] = &unk_1004FD9E0;
      void block[4] = self;
      id v11 = v6;
      id v12 = v8;
      dispatch_async(queue, block);
    }

    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)availableLanguagesInTheHome:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[ADHomeInfoManager availableLanguagesInTheHome:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v4)
  {
LABEL_3:
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001F9F78;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }

- (void)_updateVoiceTriggerPhrase
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[ADHomeInfoManager _updateVoiceTriggerPhrase]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }

  if (self->_currentAccessory)
  {
    currentHome = self->_currentHome;
    if (currentHome)
    {
      id v5 = -[HMHome siriPhraseOptions](currentHome, "siriPhraseOptions");
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessoryInfo](self, "_currentAccessoryInfo"));
      -[ADHomeInfoManager updateVoiceTriggerPhrase:currentAccessoryInfo:]( self,  "updateVoiceTriggerPhrase:currentAccessoryInfo:",  v5,  v6);
    }
  }

- (void)isJustSiriEnabledInTheHome:(id)a3
{
}

- (void)initializeHomeSiriPhraseOptions:(id)a3 completion:(id)a4
{
}

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3
{
}

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)setAllowHeySiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)_siriDataSharingAdjustment:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F9F6C;
  block[3] = &unk_1004FD968;
  void block[4] = self;
  id v8 = a3;
  uint64_t v3 = qword_100578128;
  id v4 = v8;
  id v6 = v4;
  if (v3 == -1)
  {
    id v5 = v4;
  }

  else
  {
    dispatch_once(&qword_100578128, block);
    id v5 = v8;
  }
}

- (void)_onceSiriDataSharingAdjustment:(id)a3
{
  id v4 = a3;
  if (!-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1001F9814;
    v38[3] = &unk_1004FC2C8;
    v38[4] = self;
    id v6 = v4;
    id v39 = v6;
    int v7 = objc_retainBlock(v38);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    else {
      int v9 = _AFPreferencesHomePodAdjustedOptIn2021WithContext(self->_instanceContext);
    }

    id v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v11 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);
      *(_DWORD *)buf = 136315651;
      int v41 = "-[ADHomeInfoManager _onceSiriDataSharingAdjustment:]";
      __int16 v42 = 2113;
      uint64_t v43 = (uint64_t)v13;
      __int16 v44 = 1024;
      LODWORD(v45) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Current status of accessory %{private}@ is: %d",  buf,  0x1Cu);
    }

    if (v9)
    {
      if ((_AFPreferencesSiriDataSharingHomeAccessoryMigrated() & 1) == 0
        && +[AFFeatureFlags isSiriDataSharingRepromptEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isSiriDataSharingRepromptEnabled"))
      {
        uint64_t v14 = _AFPreferencesSiriDataSharingLegacyOptInStatusWithContext(self->_instanceContext);
        if ((unint64_t)(v14 - 1) > 1)
        {
          __int16 v23 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315395;
            int v41 = "-[ADHomeInfoManager _onceSiriDataSharingAdjustment:]";
            __int16 v42 = 2049;
            uint64_t v43 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Only Opt-In and Opt-Out should be migrated to %{private}ld",  buf,  0x16u);
          }

          _AFPreferencesSetSiriDataSharingHomeAccessoryMigrated();
        }

        else
        {
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472LL;
          v37[2] = sub_1001F98A8;
          v37[3] = &unk_1004FB320;
          v37[4] = v14;
          [v15 setSiriDataSharingOptInStatus:v14 propagateToHomeAccessories:0 source:11 reason:@"Migration upon upgrade" completion:v37];
        }
      }

      goto LABEL_19;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 settings]);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 rootGroup]);
    id v19 = sub_1001F6E44(@"root.general.analytics.shareSiriAnalytics", v18);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _homeManager](self, "_homeManager"));
    if ([v21 hasOptedToHH2])
    {
    }

    else
    {
      char IsHomePodInHH2Mode = _AFPreferencesIsHomePodInHH2Mode();

      if ((IsHomePodInHH2Mode & 1) == 0)
      {
        if (v20)
        {
          [v20 updateValue:&off_100513528 completionHandler:v7];
        }

        else
        {
          unint64_t v24 = ++qword_100578130;
          __int16 v25 = (void *)AFSiriLogContextDaemon;
          BOOL v26 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
          if (v24 > 0x13)
          {
            if (v26)
            {
              id v29 = v25;
              id v30 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
              __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 uniqueIdentifier]);
              *(_DWORD *)buf = 136315395;
              int v41 = "-[ADHomeInfoManager _onceSiriDataSharingAdjustment:]";
              __int16 v42 = 2113;
              uint64_t v43 = (uint64_t)v31;
              _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Error setting siriDataSharing for accessory %{private}@ in HomeKit. siriDataSharing is nil.  Maximum retries reached",  buf,  0x16u);
            }
          }

          else
          {
            if (v26)
            {
              __int128 v32 = v25;
              __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueIdentifier]);
              *(_DWORD *)buf = 136315651;
              int v41 = "-[ADHomeInfoManager _onceSiriDataSharingAdjustment:]";
              __int16 v42 = 2113;
              uint64_t v43 = (uint64_t)v34;
              __int16 v44 = 2048;
              uint64_t v45 = qword_100578130;
              _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s Error setting siriDataSharing for accessory %{private}@ in HomeKit. siriDataSharing is nil. Scheduling retry %lu",  buf,  0x20u);
            }

            dispatch_time_t v27 = dispatch_time(0LL, 30000000000LL);
            queue = (dispatch_queue_s *)self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1001F99E8;
            block[3] = &unk_1004FD968;
            void block[4] = self;
            id v36 = v6;
            dispatch_after(v27, queue, block);
          }
        }

        goto LABEL_18;
      }
    }

    ((void (*)(void *, void))v7[2])(v7, 0LL);
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }

  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v41 = "-[ADHomeInfoManager _onceSiriDataSharingAdjustment:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Sidekick accessory does not need adjustment.",  buf,  0xCu);
  }

- (void)getCurrentAccessoryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001F97D0;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F9544;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F952C;
  v7[3] = &unk_1004F61C8;
  id v8 = a4;
  id v6 = v8;
  -[ADHomeInfoManager getAccessoryInfoForAccessoryWithUUID:completionHandler:]( self,  "getAccessoryInfoForAccessoryWithUUID:completionHandler:",  a3,  v7);
}

- (void)restartSharing
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F951C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)restartShareDeletion
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F91E8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setRecognizeMyVoiceEnabled:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001F8D2C;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)JSCapableHomeAccessories:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F8B40;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)JSCapableHomeAccessories:(id)a3
{
}

- (void)getHomeContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001F8B2C;
    v7[3] = &unk_1004FD990;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)getCurrentASRLanguages
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 languageCode]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _assetManager]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assetsAvailableStatusForLanguage:v3]);

  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)_accessoryForIdentifier:(id)a3 inHome:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4) {
    *a4 = 0LL;
  }
  if (!v6)
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Unable to look up for accessory in home because the identifier is nil.",  buf,  0xCu);
    }

    id v11 = 0LL;
    if (a4) {
      *a4 = 0LL;
    }
    goto LABEL_52;
  }

  id v49 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _homeManager](self, "_homeManager"));
  if ([v8 isDataSyncInProgress])
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Unable to look up for accessory in home because home manager is still syncing data.",  buf,  0xCu);
    }

    id v10 = 0LL;
    id v11 = 0LL;
    if (a4) {
      *a4 = 0LL;
    }
    goto LABEL_51;
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  BOOL v48 = v8;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 homes]);
  id v44 = [v13 countByEnumeratingWithState:&v54 objects:v67 count:16];
  id v10 = 0LL;
  if (!v44)
  {
    id v35 = 0LL;
    goto LABEL_47;
  }

  uint64_t v14 = *(void *)v55;
  v46 = v13;
  v47 = a4;
  uint64_t v43 = *(void *)v55;
LABEL_15:
  uint64_t v15 = 0LL;
  while (2)
  {
    if (*(void *)v55 != v14) {
      objc_enumerationMutation(v13);
    }
    uint64_t v45 = v15;
    id v16 = *(void **)(*((void *)&v54 + 1) + 8 * v15);
    id v17 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v17;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 description]);
      *(_DWORD *)buf = 136315395;
      __int128 v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
      __int16 v60 = 2113;
      __int128 v61 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s home:%{private}@", buf, 0x16u);
    }

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v20 = v16;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accessories", v43));
    id v22 = [v21 countByEnumeratingWithState:&v50 objects:v66 count:16];
    if (!v22)
    {
      id v25 = v49;
      goto LABEL_39;
    }

    id v23 = v22;
    uint64_t v24 = *(void *)v51;
    id v25 = v49;
    while (2)
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v51 != v24) {
          objc_enumerationMutation(v21);
        }
        dispatch_time_t v27 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        uint64_t v28 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v29 = v28;
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v27 description]);
          *(_DWORD *)buf = 136315395;
          __int128 v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
          __int16 v60 = 2113;
          __int128 v61 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s accessory:%{private}@", buf, 0x16u);
        }

        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v27 uniqueIdentifier]);
        if ([v31 isEqual:v25])
        {
        }

        else
        {
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v27 uuid]);
          unsigned int v33 = [v32 isEqual:v25];

          if (!v33)
          {
            id v25 = v49;
            continue;
          }
        }

        __int128 v34 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int128 v59 = "-[ADHomeInfoManager _accessoryForIdentifier:inHome:]";
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s found accessory", buf, 0xCu);
        }

        id v35 = v27;
        id v36 = v20;

        id v25 = v49;
        if (v35)
        {
          id v10 = v21;
          a4 = v47;
          goto LABEL_45;
        }

        id v10 = v36;
      }

      id v23 = [v21 countByEnumeratingWithState:&v50 objects:v66 count:16];
      if (v23) {
        continue;
      }
      break;
    }

- (id)_currentAccessory
{
  currentAccessory = self->_currentAccessory;
  if (currentAccessory) {
    return currentAccessory;
  }
  if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    BOOL v5 = (HMAccessory *)objc_claimAutoreleasedReturnValue(-[AFInstanceContext endpoint](self->_instanceContext, "endpoint"));
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315394;
      id v19 = "-[ADHomeInfoManager _currentAccessory]";
      __int16 v20 = 2112;
      __int128 v21 = v5;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Using endpoint %@...",  (uint8_t *)&v18,  0x16u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory accessoryId](v5, "accessoryId"));
    id v8 = (HMAccessory *)objc_claimAutoreleasedReturnValue( -[ADHomeInfoManager _accessoryForIdentifier:inHome:]( self,  "_accessoryForIdentifier:inHome:",  v7,  0LL));
    id v9 = self->_currentAccessory;
    self->_currentAccessory = v8;

    goto LABEL_13;
  }

  BOOL v5 = (HMAccessory *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _homeManager](self, "_homeManager"));
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315394;
    id v19 = "-[ADHomeInfoManager _currentAccessory]";
    __int16 v20 = 2112;
    __int128 v21 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Using home manager %@...",  (uint8_t *)&v18,  0x16u);
  }

  if (!-[HMAccessory isDataSyncInProgress](v5, "isDataSyncInProgress"))
  {
    id v12 = (HMAccessory *)objc_claimAutoreleasedReturnValue(-[HMAccessory currentAccessory](v5, "currentAccessory"));
    id v13 = self->_currentAccessory;
    self->_currentAccessory = v12;

LABEL_13:
    -[HMAccessory setDelegate:](self->_currentAccessory, "setDelegate:", self);
    goto LABEL_14;
  }

  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315138;
    id v19 = "-[ADHomeInfoManager _currentAccessory]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Unable to look up for current accessory because home manager is still syncing data.",  (uint8_t *)&v18,  0xCu);
  }

- (id)_currentAccessoryInfo
{
  currentAccessoryInfo = self->_currentAccessoryInfo;
  if (!currentAccessoryInfo)
  {
    id v4 = -[ADHomeInfoManager _currentAccessory](self, "_currentAccessory");
    currentAccessoryInfo = self->_currentAccessoryInfo;
  }

  return -[AFHomeAccessoryInfo copy](currentAccessoryInfo, "copy");
}

- (id)_accessoryInfoForAccessory:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 categoryType]);
  uint64_t v7 = HMAccessoryCategoryTypeSpeaker;
  if ([v6 isEqual:HMAccessoryCategoryTypeSpeaker])
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 categoryType]);
    unsigned __int8 v8 = [v10 isEqual:HMAccessoryCategoryTypeAudioReceiver];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 categoryType]);
  if (([v12 isEqualToString:v7] & 1) != 0
    || ([v12 isEqualToString:HMAccessoryCategoryTypeHomePod] & 1) != 0
    || ([v12 isEqualToString:HMAccessoryCategoryTypeAudioReceiver] & 1) != 0)
  {
    uint64_t v13 = 32LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeThermostat])
  {
    uint64_t v13 = 6LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeAppleTV])
  {
    uint64_t v13 = 33LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeTelevision])
  {
    uint64_t v13 = 38LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeLightbulb])
  {
    uint64_t v13 = 1LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeDoorLock])
  {
    uint64_t v13 = 2LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeIPCamera])
  {
    uint64_t v13 = 3LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeGarageDoorOpener])
  {
    uint64_t v13 = 4LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeOutlet])
  {
    uint64_t v13 = 5LL;
  }

  else if (([v12 isEqualToString:HMAccessoryCategoryTypeFan] & 1) != 0 {
         || ([v12 isEqualToString:HMAccessoryCategoryTypeFan] & 1) != 0)
  }
  {
    uint64_t v13 = 7LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeSecuritySystem])
  {
    uint64_t v13 = 17LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeSwitch])
  {
    uint64_t v13 = 26LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeAirPurifier])
  {
    uint64_t v13 = 27LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeAirPort])
  {
    uint64_t v13 = 34LL;
  }

  else if ([v12 isEqualToString:HMAccessoryCategoryTypeFaucet])
  {
    uint64_t v13 = 37LL;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001F8940;
  v17[3] = &unk_1004F6218;
  unsigned __int8 v21 = v8;
  id v19 = self;
  uint64_t v20 = v13;
  id v18 = v4;
  id v14 = v4;
  id v15 = +[AFHomeAccessoryInfo newWithBuilder:](&OBJC_CLASS___AFHomeAccessoryInfo, "newWithBuilder:", v17);

  return v15;
}

- (void)_updateCurrentAccessoryInfoWithAccessory:(id)a3
{
  id v4 = a3;
  if (v4
    && (BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory")),
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]),
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]),
        unsigned int v8 = [v6 isEqual:v7],
        v7,
        v6,
        v5,
        v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _accessoryInfoForAccessory:](self, "_accessoryInfoForAccessory:", v4));
  }

  else
  {
    id v9 = 0LL;
  }

  id v10 = self->_currentAccessoryInfo;
  id v11 = v9;
  id v12 = v11;
  if (v10 == v11)
  {
  }

  else
  {
    if (v11 && v10)
    {
      unsigned __int8 v13 = -[AFHomeAccessoryInfo isEqual:](v10, "isEqual:", v11);

      if ((v13 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
    }

    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      currentAccessoryInfo = self->_currentAccessoryInfo;
      *(_DWORD *)buf = 136315650;
      unsigned __int8 v21 = "-[ADHomeInfoManager _updateCurrentAccessoryInfoWithAccessory:]";
      __int16 v22 = 2112;
      id v23 = currentAccessoryInfo;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s currentAccessoryInfo: %@ -> %@", buf, 0x20u);
    }

    id v16 = (AFHomeAccessoryInfo *)-[AFHomeAccessoryInfo copy](v12, "copy");
    id v17 = self->_currentAccessoryInfo;
    self->_currentAccessoryInfo = v16;

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1001F88F4;
    v18[3] = &unk_1004F6240;
    v18[4] = self;
    id v19 = v12;
    -[ADHomeInfoManager _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v18);
  }

- (id)_accessoryLoggingSalt
{
  accessoryLoggingSalt = self->_accessoryLoggingSalt;
  if (!accessoryLoggingSalt)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentHome](self, "_currentHome"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    id v6 = (NSUUID *)[v5 copy];
    uint64_t v7 = self->_accessoryLoggingSalt;
    self->_accessoryLoggingSalt = v6;

    accessoryLoggingSalt = self->_accessoryLoggingSalt;
  }

  return accessoryLoggingSalt;
}

- (NSUUID)accessoryLoggingSalt
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1001F886C;
  id v10 = sub_1001F887C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001F88BC;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSUUID *)v3;
}

- (AFHomeAccessoryInfo)currentAccessoryInfo
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1001F886C;
  id v10 = sub_1001F887C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001F8884;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AFHomeAccessoryInfo *)v3;
}

- (void)getCurrentAccessoryInfoWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001F8828;
    v7[3] = &unk_1004FD990;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001F881C;
    v7[3] = &unk_1004FD968;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001F8810;
    v7[3] = &unk_1004FD968;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    BOOL v5 = self->_listeners;
    id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v7);
    }
  }
}

- (void)fetchMultiUserMetricsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADHomeInfoManager fetchMultiUserMetricsWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x2020000000LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  id v6 = objc_alloc_init(&OBJC_CLASS___SISchemaMultiUserSetup);
  id v7 = dispatch_group_create();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[HMHomeManager createMultiuserSettingsMessenger]( self->_homeManager,  "createMultiuserSettingsMessenger"));
  if (v8)
  {
    dispatch_group_enter(v7);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1001F8230;
    v18[3] = &unk_1004F6268;
    p___int128 buf = &buf;
    id v23 = v24;
    id v21 = v4;
    v18[4] = self;
    id v19 = v6;
    uint64_t v20 = v7;
    [v8 sendFetchMultiuserSettingsRequest:v18];
  }

  else
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v25 = 136315138;
      BOOL v26 = "-[ADHomeInfoManager fetchMultiUserMetricsWithCompletion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Could not create HMMultiuserSettingsMessenger to HomeKit. Still sending remaining metrics",  v25,  0xCu);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001F8488;
  v13[3] = &unk_1004F9C28;
  id v16 = &buf;
  id v17 = v24;
  id v14 = v6;
  id v15 = v4;
  id v10 = v4;
  id v11 = v6;
  __int128 v12 = objc_retainBlock(v13);
  dispatch_group_notify(v7, (dispatch_queue_t)self->_queue, v12);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)fetchAccessoriesInRoom:(id)a3 matchingCategoryTypes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v39 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v30 = v9;
    uint64_t v37 = self;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentHome](self, "_currentHome"));
    id obj = (id)objc_claimAutoreleasedReturnValue([v29 rooms]);
    id v34 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v34)
    {
      id v32 = v8;
      uint64_t v33 = *(void *)v50;
      do
      {
        for (i = 0LL; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v50 != v33) {
            objc_enumerationMutation(obj);
          }
          __int128 v12 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
          if (v8)
          {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v49 + 1) + 8 * (void)i) name]);
            unsigned int v14 = [v8 isEqual:v13];

            if (!v14) {
              continue;
            }
          }

          id v35 = i;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          id v36 = (id)objc_claimAutoreleasedReturnValue([v12 accessories]);
          id v15 = [v36 countByEnumeratingWithState:&v45 objects:v54 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v40 = *(void *)v46;
            do
            {
              for (j = 0LL; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v46 != v40) {
                  objc_enumerationMutation(v36);
                }
                id v18 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
                __int128 v41 = 0u;
                __int128 v42 = 0u;
                __int128 v43 = 0u;
                __int128 v44 = 0u;
                id v19 = v39;
                id v20 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
                if (v20)
                {
                  id v21 = v20;
                  uint64_t v22 = *(void *)v42;
                  while (2)
                  {
                    for (k = 0LL; k != v21; k = (char *)k + 1)
                    {
                      if (*(void *)v42 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)k);
                      id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 category]);
                      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v25 categoryType]);
                      LODWORD(v24) = [v26 isEqual:v24];

                      if ((_DWORD)v24)
                      {
                        dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[ADHomeInfoManager _accessoryInfoForAccessory:]( v37,  "_accessoryInfoForAccessory:",  v18));
                        [v38 addObject:v27];

                        goto LABEL_24;
                      }
                    }

                    id v21 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
                    if (v21) {
                      continue;
                    }
                    break;
                  }
                }

- (void)_startCloudKitActivityForHomes:(id)a3 homesToDelete:(id)a4
{
  id v5 = a3;
  id v60 = a4;
  __int128 v61 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 homes]);
  id v71 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id obj = v6;
  id v7 = (os_log_t *)&AFSiriLogContextDaemon;
  id v70 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
  if (v70)
  {
    id v67 = 0LL;
    id v63 = 0LL;
    uint64_t v69 = *(void *)v77;
    uint64_t v8 = 2LL;
    uint64_t v64 = 2LL;
    do
    {
      for (i = 0LL; i != v70; i = (char *)i + 1)
      {
        if (*(void *)v77 != v69) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
        unsigned int v11 = [v10 isMultiUserEnabled];
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 owner]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);
        unsigned int v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 currentUser]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueIdentifier]);
        id v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);

        if (v17)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
          -[NSMutableDictionary setObject:forKey:](v71, "setObject:forKey:", v17, v19);
        }

        unsigned int v20 = -[__CFString isEqualToString:](v14, "isEqualToString:", v17);
        os_log_t v21 = *v7;
        id v22 = (id)os_log_type_enabled(*v7, OS_LOG_TYPE_INFO);
        if (v20)
        {
          if ((_DWORD)v22)
          {
            id v23 = v21;
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
            uint64_t v65 = v8;
            BOOL v26 = v7;
            dispatch_time_t v27 = v12;
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 UUIDString]);
            *(_DWORD *)__int128 buf = 136315907;
            v82 = "-[ADHomeInfoManager _startCloudKitActivityForHomes:homesToDelete:]";
            __int16 v83 = 2113;
            v84 = v14;
            __int16 v85 = 2113;
            int v86 = v24;
            __int16 v87 = 2113;
            id v88 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Owner %{private}@ accepting shares in home (%{private}@/%{private}@)",  buf,  0x2Au);

            __int128 v12 = v27;
            id v7 = v26;
            uint64_t v8 = v65;
          }
        }

        else
        {
          if ((_DWORD)v22)
          {
            v66 = v12;
            id v29 = v21;
            id v30 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
            uint64_t v32 = v8;
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
            *(_DWORD *)__int128 buf = 136315907;
            v82 = "-[ADHomeInfoManager _startCloudKitActivityForHomes:homesToDelete:]";
            __int16 v83 = 2113;
            v84 = v17;
            __int16 v85 = 2113;
            int v86 = v30;
            __int16 v87 = 2113;
            id v88 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s Sharer %{private}@ sharing in home (%{private}@/%{private}@)",  buf,  0x2Au);

            uint64_t v8 = v32;
            id v7 = (os_log_t *)&AFSiriLogContextDaemon;

            __int128 v12 = v66;
          }

          if (v11) {
            id v22 = -[ADHomeInfoManager _startCloudSharingForMultiUserService:]( self,  "_startCloudSharingForMultiUserService:",  v10);
          }
        }

        if (v8 != 1 && AFIsMultiUserCompanion(v22))
        {
          id v34 = v12;
          uint64_t v35 = v8;
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v10 currentUser]);
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 userSettingsForHome:v10]);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 settings]);

          if ([v10 isMultiUserEnabled])
          {
            id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 rootGroup]);
            id v40 = sub_1001F6E44(@"root.siri.identifyVoice", v39);
            __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

            if (v41)
            {
              __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 value]);
              uint64_t v64 = [v42 BOOLValue];

              id v63 = v41;
            }

            else
            {
              id v63 = 0LL;
            }
          }

          uint64_t v8 = v35;
          __int128 v12 = v34;
          if (v64 == 1)
          {
            uint64_t v8 = 1LL;
          }

          else if (!v64)
          {
            uint64_t v8 = 0LL;
            uint64_t v64 = 0LL;
          }

          id v67 = v38;
        }
      }

      id v70 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
    }

    while (v70);
  }

  else
  {
    id v67 = 0LL;
    id v63 = 0LL;
    uint64_t v8 = 2LL;
  }

  uint64_t v43 = v8;

  __int128 v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id v45 = v60;
  id v46 = [v45 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v73;
    do
    {
      for (j = 0LL; j != v47; j = (char *)j + 1)
      {
        if (*(void *)v73 != v48) {
          objc_enumerationMutation(v45);
        }
        __int128 v50 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)j);
        __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v50 currentUser]);
        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v51 uniqueIdentifier]);
        __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v52 UUIDString]);

        __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v50 uniqueIdentifier]);
        __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 UUIDString]);

        -[NSMutableDictionary setObject:forKey:](v44, "setObject:forKey:", v53, v55);
        -[NSMutableDictionary removeObjectForKey:](v71, "removeObjectForKey:", v55);
      }

      id v47 = [v45 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }

    while (v47);
  }

  if (AFIsMultiUserCompanion(v56) && v43 != 2)
  {
    __int128 v57 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      __int128 v58 = @"NO";
      if (v43 == 1) {
        __int128 v58 = @"YES";
      }
      *(_DWORD *)__int128 buf = 136315394;
      v82 = "-[ADHomeInfoManager _startCloudKitActivityForHomes:homesToDelete:]";
      __int16 v83 = 2112;
      v84 = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%s voiceSettingOn value is (%@)", buf, 0x16u);
    }

    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v59 setMultiUserVoiceIdentification:v43 == 1];
  }
}

- (void)_checkAndDisableVoiceIDIfRequired
{
  if (self->_assistantRequestedToTurnOffVoiceID)
  {
    self->_assistantRequestedToTurnOffVoiceID = 0;
    -[ADHomeInfoManager setRecognizeMyVoiceEnabled:](self, "setRecognizeMyVoiceEnabled:", 0LL);
  }

- (void)_homeManagerUpdatedHomes:(id)a3
{
}

- (void)_homeManagerUpdatedHomes:(id)a3 homesToDelete:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = -[HMHomeManager status](self->_homeManager, "status");
  if (!v7)
  {
    -[ADHomeInfoManager _startCloudKitActivityForHomes:homesToDelete:]( self,  "_startCloudKitActivityForHomes:homesToDelete:",  v12,  v6);
    id v9 = -[ADHomeInfoManager _currentHomeInfo](self, "_currentHomeInfo");
    id v7 = -[ADHomeInfoManager _checkAndDisableVoiceIDIfRequired](self, "_checkAndDisableVoiceIDIfRequired");
  }

  if (AFIsHorseman(v7, v8))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager currentHome](self->_homeManager, "currentHome"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessories]);

    -[ADHomeInfoManager _setPreferredMediaUserForAccessories:](self, "_setPreferredMediaUserForAccessories:", v11);
  }

  -[ADHomeInfoManager _updateHomeContext:](self, "_updateHomeContext:", v12);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F8140;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v16 = "-[ADHomeInfoManager homeManager:didAddHome:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s homeManager is %@", buf, 0x16u);
  }

  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v9 logEventWithType:6108 contextProvider:&stru_1004F6288];

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001F7FE8;
    block[3] = &unk_1004FD4C0;
    id v12 = v7;
    __int128 v13 = self;
    id v14 = v6;
    dispatch_async(queue, block);
  }
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    id v15 = "-[ADHomeInfoManager homeManager:didRemoveHome:]";
    __int16 v16 = 2113;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s home is %{private}@", buf, 0x16u);
  }

  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001F7CEC;
    block[3] = &unk_1004FD4C0;
    id v11 = v7;
    id v12 = self;
    id v13 = v6;
    dispatch_async(queue, block);
  }
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v5 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001F7B94;
  v8[3] = &unk_1004FD968;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F7AD8;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F79C4;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)homeManagerDidUpdateAssistantIdentifiers:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F78DC;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)settingsDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v11 = "-[ADHomeInfoManager settingsDidUpdate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001F73E4;
  v8[3] = &unk_1004FD968;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)settingsWillUpdate:(id)a3
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADHomeInfoManager settingsWillUpdate:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  id v6 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001F72B8;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)_propagateSiriDataSharingOptInStatus:(int64_t)a3 toAccessory:(id)a4
{
  id v6 = (__CFString *)a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString category](v6, "category"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 categoryType]);
  unsigned int v9 = [v8 isEqualToString:HMAccessoryCategoryTypeHomePod];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString settings](v6, "settings"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rootGroup]);
    id v12 = sub_1001F6E44(@"root.general.analytics.shareSiriAnalytics", v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (!v13)
    {
      os_log_t v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315651;
        id v30 = "-[ADHomeInfoManager _propagateSiriDataSharingOptInStatus:toAccessory:]";
        __int16 v31 = 2113;
        uint64_t v32 = @"root.general.analytics.shareSiriAnalytics";
        __int16 v33 = 2113;
        id v34 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Not setting (%{private}@) because the setting does not exist for accessory (%{private}@), so we won't touch it",  buf,  0x20u);
      }

      -[__CFString setDelegate:](v6, "setDelegate:", self);
      goto LABEL_18;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);

    id v15 = (void *)AFSiriLogContextDaemon;
    BOOL v16 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v16)
      {
        id v17 = v15;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);
        unsigned int v19 = [v18 BOOLValue];
        unsigned int v20 = @"Opted-Out";
        id v30 = "-[ADHomeInfoManager _propagateSiriDataSharingOptInStatus:toAccessory:]";
        __int16 v31 = 2113;
        *(_DWORD *)__int128 buf = 136315907;
        uint64_t v32 = v6;
        __int16 v33 = 2112;
        if (v19) {
          unsigned int v20 = @"Opted-In";
        }
        id v34 = @"root.general.analytics.shareSiriAnalytics";
        __int16 v35 = 2112;
        id v36 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Not setting HomePod accessory (%{private}@) setting (%@) because it's already a known value of (%@)",  buf,  0x2Au);
      }

      goto LABEL_18;
    }

    if (v16)
    {
      *(_DWORD *)__int128 buf = 136315395;
      id v30 = "-[ADHomeInfoManager _propagateSiriDataSharingOptInStatus:toAccessory:]";
      __int16 v31 = 2113;
      uint64_t v32 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_INFO,  "%s First time setting HomePod accessory (%{private}@) because the setting has not been set before",  buf,  0x16u);
    }

    if (a3 == 2)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1001F7170;
      v23[3] = &unk_1004F7248;
      uint64_t v24 = v6;
      uint64_t v25 = 2LL;
      [v13 updateValue:&off_100513528 completionHandler:v23];
      id v22 = v24;
    }

    else
    {
      if (a3 != 1)
      {
LABEL_18:

        goto LABEL_19;
      }

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1001F7028;
      v26[3] = &unk_1004F7248;
      dispatch_time_t v27 = v6;
      uint64_t v28 = 1LL;
      [v13 updateValue:&off_100513558 completionHandler:v26];
      id v22 = v27;
    }

    goto LABEL_18;
  }

- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315138;
    BOOL v16 = "-[ADHomeInfoManager shareManager:didReceiveShareInvitation:completion:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Received a share URL",  (uint8_t *)&v15,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 shareURL]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 shareToken]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 containerID]);
    [v11 acceptShare:v12 token:v13 containerID:v14];
  }

  if (v9) {
    v9[2](v9, 1LL, 0LL);
  }
}

- (void)homeDidUpdateName:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F6CE0;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v17 = "-[ADHomeInfoManager home:didAddUser:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F6C7C;
  block[3] = &unk_1004FD4C0;
  id v13 = v7;
  id v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (AFSupportsMultiUser(v6, v7))
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315651;
      id v13 = "-[ADHomeInfoManager home:didRemoveUser:]";
      __int16 v14 = 2113;
      id v15 = v6;
      __int16 v16 = 2113;
      id v17 = v5;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Deleting user (%{private}@) home is (%{private}@)",  (uint8_t *)&v12,  0x20u);
    }

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    [v9 removeUserWithHomeUUID:v11 completion:&stru_1004F62E8];
  }
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    __int16 v16 = "-[ADHomeInfoManager home:didAddAccessory:]";
    __int16 v17 = 2113;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  unsigned int v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_1001F6A88;
  int v12 = &unk_1004FD968;
  id v13 = self;
  id v14 = v5;
  id v8 = v5;
  dispatch_async(queue, &v9);
  -[ADHomeInfoManager _updateVoiceTriggerPhrase](self, "_updateVoiceTriggerPhrase", v9, v10, v11, v12, v13);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    id v13 = "-[ADHomeInfoManager home:didRemoveAccessory:]";
    __int16 v14 = 2113;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001F6A10;
  v9[3] = &unk_1004FD968;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315651;
    id v15 = "-[ADHomeInfoManager home:didUpdateRoom:forAccessory:]";
    __int16 v16 = 2113;
    id v17 = v7;
    __int16 v18 = 2113;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %{private}@ %{private}@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001F6980;
  v12[3] = &unk_1004FD968;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(queue, v12);
}

- (void)homeDidEnableMultiUser:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v10 = "-[ADHomeInfoManager homeDidEnableMultiUser:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if ([v4 isMultiUserEnabled])
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001F6974;
    v7[3] = &unk_1004FD968;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    id v11 = "-[ADHomeInfoManager accessoryDidUpdateName:]";
    __int16 v12 = 2113;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001F68E4;
  v8[3] = &unk_1004FD968;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)accessoryDidUpdatePreferredMediaUser:(id)a3
{
  id v5 = a3;
}

- (void)accessoryDidUpdateSupportsThirdPartyMusic:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _currentAccessory](self, "_currentAccessory"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
  unsigned int v7 = [v5 isEqual:v6];

  if (v7) {
    -[ADHomeInfoManager _updateCurrentAccessoryInfoWithAccessory:]( self,  "_updateCurrentAccessoryInfoWithAccessory:",  v8);
  }
}

- (void)_startCloudSharingForMultiUserService:(id)a3
{
  id v4 = a3;
  if (AFIsMultiUserCompanion(v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 owner]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315395;
      uint64_t v25 = "-[ADHomeInfoManager _startCloudSharingForMultiUserService:]";
      __int16 v26 = 2113;
      dispatch_time_t v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s (%{private}@)", buf, 0x16u);
    }

    if (v7)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 currentUser]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

      if (([v7 isEqualToString:v11] & 1) == 0)
      {
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_homeSharingStates, "objectForKey:", v7));
        id v13 = [v12 integerValue];

        if ((uint64_t)v13 <= 0)
        {
          homeSharingStates = self->_homeSharingStates;
          if (!homeSharingStates)
          {
            id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            __int16 v16 = self->_homeSharingStates;
            self->_homeSharingStates = v15;

            homeSharingStates = self->_homeSharingStates;
          }

          -[NSMutableDictionary setObject:forKey:](homeSharingStates, "setObject:forKey:", &off_100513570, v7);
          uint32_t v17 = arc4random_uniform(9u);
          dispatch_time_t v18 = dispatch_time(0LL, (uint64_t)(((double)v17 + 6.0) * 1000000000.0));
          queue = (dispatch_queue_s *)self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1001F61C0;
          block[3] = &unk_1004FD4C0;
          id v21 = v7;
          id v22 = self;
          id v23 = v4;
          dispatch_after(v18, queue, block);
        }
      }
    }
  }
}

- (void)_startAcceptingCloudSharesForMultiUserService
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager userCloudShareManager](self->_homeManager, "userCloudShareManager"));
  [v3 setDelegate:self];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
  id v5 = v4;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001F6098;
    v7[3] = &unk_1004FBD90;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v4 containerIDs]);
    id v6 = v8;
    [v3 registerForContainerIDs:v6 completion:v7];
  }
}

- (id)rootAfHomeInfoForThisDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager infoForThisDevice](self, "infoForThisDevice"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentHomeIdentifier]);
  id v4 = [[AFHomeInfo alloc] initWithHomeIdentifier:v3 activityNotificationsEnabledForPersonalRequests:1];

  return v4;
}

- (BOOL)areActivityNotificationsOffForAllHomes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _homesWithSiriCapableDevices](self, "_homesWithSiriCapableDevices"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _activityNotificationsForHomes:](self, "_activityNotificationsForHomes:", v3, 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

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
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)i) BOOLValue])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)_homesWithSiriCapableDevices
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](self->_homeManager, "homes"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (-[ADHomeInfoManager _hasSiriCapableDeviceInHome:](self, "_hasSiriCapableDeviceInHome:", v10, (void)v12)) {
          [v4 addObject:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)getHomeManagerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001F6054;
    v7[3] = &unk_1004FD990;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (BOOL)_hasSiriCapableDeviceInHome:(id)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue([a3 accessories]);
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = HMAccessoryCategoryTypeHomePod;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "siriEndpointProfile", (void)v16));
        if (v10)
        {

LABEL_13:
          BOOL v14 = 1;
          goto LABEL_14;
        }

        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 category]);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 categoryType]);
        unsigned __int8 v13 = [v12 isEqualToString:v7];

        if ((v13 & 1) != 0) {
          goto LABEL_13;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v14 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v14 = 0;
  }

- (void)accessoriesWithSiriInTheHome:(id)a3 completion:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F5E3C;
  block[3] = &unk_1004FD9E0;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, block);
}

- (void)accessoriesWithSiriInTheHome:(id)a3 completion:(id)a4
{
}

- (void)getLocalizedAccessoryCategoryForExecutionInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F5DE0;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)getAccessoryCategoryForExecutionInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F5CFC;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)_getAccessoryCategoryForExecutionInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 originPeerInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 instanceInfo]);
  id v7 = (NSUUID *)objc_claimAutoreleasedReturnValue([v6 applicationUUID]);
  if (v7
    || (id v8 = objc_alloc(&OBJC_CLASS___NSUUID),
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 homeKitAccessoryIdentifier]),
        id v7 = -[NSUUID initWithUUIDString:](v8, "initWithUUIDString:", v9),
        v9,
        v7))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[ADHomeInfoManager _accessoryForIdentifier:inHome:]( self,  "_accessoryForIdentifier:inHome:",  v7,  0LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 category]);
  }

  else
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      __int128 v15 = "-[ADHomeInfoManager _getAccessoryCategoryForExecutionInfo:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Unable to get accessoryIdentifier from AFCommandExecutionInfo: %@",  (uint8_t *)&v14,  0x16u);
    }

    id v11 = 0LL;
  }

  return v11;
}

- (id)updatedHomeInfoForRootInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 homeIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMHomeManager homes](self->_homeManager, "homes"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADHomeInfoManager _activityNotificationsForHomes:](self, "_activityNotificationsForHomes:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);
    unsigned __int8 v10 = [v9 BOOLValue];
  }

  else
  {
    unsigned __int8 v10 = 1;
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001F5CF0;
  v13[3] = &unk_1004F6358;
  unsigned __int8 v14 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 mutatedCopyWithMutator:v13]);

  return v11;
}

- (id)_activityNotificationsForHomes:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentUser", (void)v16));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 assistantAccessControlForHome:v10]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v12 areActivityNotificationsEnabledForPersonalRequests]));
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v13, v14);
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)emitHomeMetricInvocationEvent
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F5AB0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (void).cxx_destruct
{
}

+ (id)sharedInfoManager
{
  if (qword_100578120 != -1) {
    dispatch_once(&qword_100578120, &stru_1004F6130);
  }
  return (id)qword_100578118;
}

@end