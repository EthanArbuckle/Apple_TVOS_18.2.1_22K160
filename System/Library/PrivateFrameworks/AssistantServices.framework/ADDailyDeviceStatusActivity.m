@interface ADDailyDeviceStatusActivity
+ (const)activityIdentifier;
+ (id)taskFromActivity:(id)a3;
+ (id)xpcCriteria;
- (ADDailyDeviceStatusActivity)init;
- (BOOL)_isSiriCapableDigitalCarKeyAvailable;
- (BOOL)_preciseLocationEnabled;
- (id)_buildDailySelfTriggerSuppressionMetrics;
- (id)_buildDailyVoiceTriggerMetrics:(id)a3;
- (id)_truncatedGradingOptInStateChanges:(id)a3;
- (id)fetchVoiceTriggerSettings;
- (id)getVolumeCapacity;
- (int)_locationAccessPermission;
- (int)getAdaptiveVolumeUserIntent:(int)a3;
- (int)getSiriDataSharingOptInStatus;
- (void)_triggerABCForNullAssistantIdentifier;
- (void)buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:(BOOL)a3 onLockscreen:(BOOL)a4 dictationEnabled:(BOOL)a5 voiceTriggerEnabled:(BOOL)a6 starkHasBeenActiveWithin24Hours:(BOOL)a7 raiseToSpeakEnabled:(BOOL)a8 activeAppleAudioDevices:(id)a9 spokenNotificationsEnabled:(BOOL)a10 announceNotificationsEnabledOnHeadphones:(BOOL)a11 carplayAnnounceEnablementType:(int64_t)a12 isAnnounceNotificationsMutedForCarPlay:(BOOL)a13 shouldSkipTriggerlessReplyConfirmation:(BOOL)a14 spokenNotificationsProxCardSeen:(BOOL)a15 spokenNotificationsControlCenterModuleEnabled:(BOOL)a16 spokenNotificationsWhitelistSettings:(unint64_t)a17 announceCallsEnabled:(BOOL)a18 hostedAccessories:(id)a19 preciseLocationEnabled:(BOOL)a20 locationAccessPermission:(int)a21 adaptiveSiriVolumeEnabled:(BOOL)a22 adaptiveSiriVolumePermanentOffsetEnabled:(BOOL)a23 adaptiveSiriVolumePermanentOffsetFactor:(id)a24 adaptiveSiriVolumeMostRecentIntent:(id)a25 isRemoteDarwinVoiceTriggerEnabled:(BOOL)a26 autoSendSettings:(id)a27 hangUpEnablementState:(int)a28 heartbeatQueuedTime:(unint64_t)a29 siriVoiceTriggerSettings:(id)a30 isShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a31 isSiriCapableDigitalCarKeyAvailable:(BOOL)a32 connectedBTCarHeadunits:(id)a33 withCompletion:(id)a34;
- (void)fetchAppleMusicSubscriptionForSharedUser:(id)a3 completion:(id)a4;
- (void)fetchEnrolledUsersWithCompletion:(id)a3;
- (void)fetchICUserIdentityForSharedUser:(id)a3 completion:(id)a4;
- (void)runWithCompletion:(id)a3;
@end

@implementation ADDailyDeviceStatusActivity

- (ADDailyDeviceStatusActivity)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADDailyDeviceStatusActivity;
  v2 = -[ADDailyDeviceStatusActivity init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("ADDailyDeviceStatusActivity", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)runWithCompletion:(id)a3
{
  dispatch_queue_attr_t v3 = (void (**)(void))a3;
  v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[ADDailyDeviceStatusActivity runWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v87 = [v5 assistantIsEnabled];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v86 = [v6 dictationIsEnabled];

  uint64_t v7 = 2LL;
  if (!v87) {
    uint64_t v7 = 0LL;
  }
  if (v86) {
    uint64_t v8 = v7 | 4;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = +[AFAggregator logEnabledState:](&OBJC_CLASS___AFAggregator, "logEnabledState:", v8);
  if ((v87 | v86) != 1 || (AFHasUnlockedSinceBoot(v9) & 1) == 0)
  {
    v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[ADDailyDeviceStatusActivity runWithCompletion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s Skipping Heartbeat due to (both Siri & Dictation disabled) OR (device was locked)",  buf,  0xCu);
      if (!v3) {
        goto LABEL_37;
      }
    }

    else if (!v3)
    {
      goto LABEL_37;
    }

    v3[2](v3);
    goto LABEL_37;
  }

  if (AFDeviceSupportsCarPlay())
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dateByAddingUnit:32 value:-24 toDate:v11 options:0]);

    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;
    id v15 = [off_1005744D0() carPlayStream];
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 publisherFromStartTime:v14]);
    uint64_t v91 = 0LL;
    v92 = &v91;
    uint64_t v93 = 0x2020000000LL;
    LOBYTE(v94) = 0;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_1001EB444;
    v96 = (uint64_t (*)(uint64_t, uint64_t))&unk_1004F6088;
    v97 = (void (*)(uint64_t))&v91;
    id v18 = [v17 sinkWithCompletion:&stru_1004F6060 receiveInput:buf];
    v19 = (os_log_s *)AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      int v20 = *((unsigned __int8 *)v92 + 24);
      *(_DWORD *)v99 = 136315394;
      v100 = "ADCarPlayHasBeenActiveInLast24Hours";
      __int16 v101 = 1024;
      int v102 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s carPlayHasBeenActiveInLast24Hours: %d",  v99,  0x12u);
    }

    BOOL v77 = *((_BYTE *)v92 + 24) != 0;
    _Block_object_dispose(&v91, 8);
  }

  else
  {
    BOOL v77 = 0;
  }

  if (v87)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned int v23 = [v22 disableAssistantWhilePasscodeLocked];

    unsigned int v76 = v23 ^ 1;
  }

  else
  {
    unsigned int v76 = 0;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  unsigned int v75 = [v24 voiceTriggerEnabled];

  uint64_t v25 = AFAppleAudioDeviceConnectedInLast24Hours();
  v82 = (void *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v26 = AFBTCarHeadunitsConnectedInLast24Hours();
  v81 = (void *)objc_claimAutoreleasedReturnValue(v26);
  uint64_t v28 = AFIsHorseman(v81, v27);
  if ((v28 & 1) != 0)
  {
    BOOL v73 = 0;
    BOOL v74 = 0;
  }

  else
  {
    uint64_t v91 = 0LL;
    v92 = &v91;
    uint64_t v93 = 0x2050000000LL;
    v30 = (void *)qword_100577A20;
    uint64_t v94 = qword_100577A20;
    if (!qword_100577A20)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_100066968;
      v96 = (uint64_t (*)(uint64_t, uint64_t))&unk_1004FDB20;
      v97 = (void (*)(uint64_t))&v91;
      sub_100066968((uint64_t)buf);
      v30 = (void *)v92[3];
    }

    id v31 = v30;
    _Block_object_dispose(&v91, 8);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 currentNotificationSettingsCenter]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 notificationSystemSettings]);
    v34 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[ADDailyDeviceStatusActivity runWithCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v33;
      _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }

    BOOL v74 = [v33 announcementSetting] == (id)2;
    BOOL v73 = [v33 announcementHeadphonesSetting] == (id)2;
  }

  uint64_t v72 = _AFPreferencesAnnounceNotificationsInCarPlayType(v28, v29);
  char v71 = _AFPreferencesAnnounceNotificationsInCarPlayTemporarilyDisabled();
  char v70 = _AFPreferencesSpokenNotificationSkipTriggerlessReplyConfirmation();
  char v69 = _AFPreferencesSpokenNotificationsProxCardSeen();
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"kSpokenMessageWhitelistLevel",  @"com.apple.MobileSMS",  0LL);
  id v84 = objc_alloc_init(&OBJC_CLASS___TUUserConfiguration);
  id v78 = [v84 announceCalls];
  v35 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[ADDailyDeviceStatusActivity runWithCompletion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v78 != 0LL;
    _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%s Announce calls enabled: %d", buf, 0x12u);
  }

  v36 = dispatch_group_create();
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v96 = sub_100065E60;
  v97 = sub_100065E70;
  id v98 = 0LL;
  dispatch_group_enter(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_100066A1C;
  v88[3] = &unk_1004EEB58;
  v90 = buf;
  dispatch_group_t group = v36;
  dispatch_group_t v89 = group;
  [v37 fetchEndpointUUIDsWithCompletion:v88];

  dispatch_time_t v38 = dispatch_time(0LL, 1000000000LL);
  dispatch_group_wait(group, v38);
  unsigned __int8 v67 = -[ADDailyDeviceStatusActivity _preciseLocationEnabled](self, "_preciseLocationEnabled");
  unsigned int v66 = -[ADDailyDeviceStatusActivity _locationAccessPermission](self, "_locationAccessPermission");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  unsigned __int8 v65 = [v39 smartSiriVolumeContextAwareEnabled];

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  unsigned __int8 v64 = [v40 isAdaptiveSiriVolumePermanentOffsetEnabled];

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  [v41 adaptiveSiriVolumePermanentOffset];
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v42 adaptiveSiriVolumeRecentIntent]));

  id v43 = objc_alloc_init(&OBJC_CLASS___SISchemaSendWithoutConfirmation);
  id v44 = [v43 setIsEnabled:_AFPreferencesGetMessageWithoutConfirmationEnabled()];
  id v45 = [v43 setIsEnabledForHeadphones:_AFPreferencesGetMessageWithoutConfirmationHeadphonesEnabled(v44)];
  [v43 setIsEnabledForCarPlay:_AFPreferencesGetMessageWithoutConfirmationInCarPlayEnabled(v45)];
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  unsigned __int8 v47 = [v46 voiceTriggerEnabledWithDeviceType:3 endpointId:0];

  uint64_t v48 = AFGetTimeSinceEpochRoundedToHourInMilliseconds();
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ADDailyDeviceStatusActivity fetchVoiceTriggerSettings](self, "fetchVoiceTriggerSettings"));
  char ShowAppsBehindSiriInCarPlayEnabled = _AFPreferencesGetShowAppsBehindSiriInCarPlayEnabled();
  unsigned __int8 v51 = -[ADDailyDeviceStatusActivity _isSiriCapableDigitalCarKeyAvailable]( self,  "_isSiriCapableDigitalCarKeyAvailable");
  uint64_t v52 = *(void *)(*(void *)&buf[8] + 40LL);
  if (AFSupportsCallHangUp()
    && (v53 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences")),
        unint64_t v54 = (unint64_t)[v53 canUseVoiceTriggerDuringPhoneCallWithState],
        v53,
        v54 <= 2))
  {
    int v55 = dword_1003C9DE8[v54];
  }

  else
  {
    int v55 = 0;
  }

  BYTE1(v63) = v51;
  LOBYTE(v63) = ShowAppsBehindSiriInCarPlayEnabled;
  LODWORD(v62) = v55;
  LOBYTE(v61) = v47;
  BYTE1(v60) = v64;
  LOBYTE(v60) = v65;
  HIDWORD(v59) = v66;
  LOBYTE(v59) = v67;
  LOBYTE(v58) = v78 != 0LL;
  BYTE3(v57) = 0;
  BYTE2(v57) = v69;
  BYTE1(v57) = v70;
  LOBYTE(v57) = v71;
  BYTE1(v56) = v73;
  LOBYTE(v56) = v74;
  -[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscreen:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:activeAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:carplayAnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfirmation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotificationsWhitelistSettings:announceCallsEnabled:hostedAccessories:preciseLocationEnabled:locationAccessPermission:adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSiriVolumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnabled:autoSendSettings:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSettings:isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeadunits:withCompletion:]( self,  "buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscreen:dictationEnabled:voiceTriggerEnabled:starkHasBeen ActiveWithin24Hours:raiseToSpeakEnabled:activeAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnab ledOnHeadphones:carplayAnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfi rmation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotificationsWhitelistSe ttings:announceCallsEnabled:hostedAccessories:preciseLocationEnabled:locationAccessPermission:adaptiveSiriVolumeEnab led:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSiriVolumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentInt ent:isRemoteDarwinVoiceTriggerEnabled:autoSendSettings:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSet tings:isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeadunits:withCompletion:",  v87,  v76,  v86,  v75,  v77,  0LL,  v82,  v56,  v72,  v57,  AppIntegerValue,  v58,  v52,  v59,  v60,  v80,  v79,  v61,  v43,  v62,  v48,  v49,  v63,  v81,  &stru_1004EEB98);
  if (v3) {
    v3[2](v3);
  }

  _Block_object_dispose(buf, 8);
LABEL_37:
}

- (void)buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:(BOOL)a3 onLockscreen:(BOOL)a4 dictationEnabled:(BOOL)a5 voiceTriggerEnabled:(BOOL)a6 starkHasBeenActiveWithin24Hours:(BOOL)a7 raiseToSpeakEnabled:(BOOL)a8 activeAppleAudioDevices:(id)a9 spokenNotificationsEnabled:(BOOL)a10 announceNotificationsEnabledOnHeadphones:(BOOL)a11 carplayAnnounceEnablementType:(int64_t)a12 isAnnounceNotificationsMutedForCarPlay:(BOOL)a13 shouldSkipTriggerlessReplyConfirmation:(BOOL)a14 spokenNotificationsProxCardSeen:(BOOL)a15 spokenNotificationsControlCenterModuleEnabled:(BOOL)a16 spokenNotificationsWhitelistSettings:(unint64_t)a17 announceCallsEnabled:(BOOL)a18 hostedAccessories:(id)a19 preciseLocationEnabled:(BOOL)a20 locationAccessPermission:(int)a21 adaptiveSiriVolumeEnabled:(BOOL)a22 adaptiveSiriVolumePermanentOffsetEnabled:(BOOL)a23 adaptiveSiriVolumePermanentOffsetFactor:(id)a24 adaptiveSiriVolumeMostRecentIntent:(id)a25 isRemoteDarwinVoiceTriggerEnabled:(BOOL)a26 autoSendSettings:(id)a27 hangUpEnablementState:(int)a28 heartbeatQueuedTime:(unint64_t)a29 siriVoiceTriggerSettings:(id)a30 isShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a31 isSiriCapableDigitalCarKeyAvailable:(BOOL)a32 connectedBTCarHeadunits:(id)a33 withCompletion:(id)a34
{
  BOOL v163 = a8;
  BOOL v34 = a7;
  BOOL v35 = a6;
  BOOL v158 = a5;
  BOOL v168 = a4;
  BOOL v176 = a3;
  id v36 = a9;
  id v165 = a19;
  id v153 = a24;
  id v152 = a25;
  id v154 = a27;
  id v155 = a30;
  id v156 = a33;
  id v149 = a34;
  v37 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscree"
                         "n:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:acti"
                         "veAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:carplay"
                         "AnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfirm"
                         "ation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotif"
                         "icationsWhitelistSettings:announceCallsEnabled:hostedAccessories:preciseLocationEnabled:locatio"
                         "nAccessPermission:adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSi"
                         "riVolumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnab"
                         "led:autoSendSettings:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSettings:isShowA"
                         "ppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeadunits:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  dispatch_time_t v38 = dispatch_group_create();
  v39 = objc_alloc_init(&OBJC_CLASS___SISchemaDailyDeviceStatus);
  if ([v165 count])
  {
    v213[0] = _NSConcreteStackBlock;
    v213[1] = 3221225472LL;
    v213[2] = sub_10006603C;
    v213[3] = &unk_1004EEBE0;
    v213[4] = self;
    v40 =  -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v165 count]);
    v214 = v40;
    [v165 enumerateKeysAndObjectsUsingBlock:v213];
    -[SISchemaDailyDeviceStatus setLinkedAccessoryStates:](v39, "setLinkedAccessoryStates:", v40);
    v41 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v42 = v41;
      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[SISchemaDailyDeviceStatus linkedAccessoryStates](v39, "linkedAccessoryStates"));
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscr"
                           "een:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:"
                           "activeAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:c"
                           "arplayAnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessRepl"
                           "yConfirmation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:s"
                           "pokenNotificationsWhitelistSettings:announceCallsEnabled:hostedAccessories:preciseLocationEna"
                           "bled:locationAccessPermission:adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnab"
                           "led:adaptiveSiriVolumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwin"
                           "VoiceTriggerEnabled:autoSendSettings:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTrigg"
                           "erSettings:isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connected"
                           "BTCarHeadunits:withCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Hosted accessories: %@", buf, 0x16u);
    }
  }

  dispatch_group_enter(v38);
  v210[0] = _NSConcreteStackBlock;
  v210[1] = 3221225472LL;
  v210[2] = sub_1000661D4;
  v210[3] = &unk_1004F5AF8;
  id v44 = v39;
  v211 = v44;
  id v45 = v38;
  v212 = v45;
  -[ADDailyDeviceStatusActivity fetchEnrolledUsersWithCompletion:](self, "fetchEnrolledUsersWithCompletion:", v210);
  dispatch_group_enter(v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[SiriTTSDaemonSession afSharedSession](&OBJC_CLASS___SiriTTSDaemonSession, "afSharedSession"));
  v207[0] = _NSConcreteStackBlock;
  v207[1] = 3221225472LL;
  v207[2] = sub_1000662C4;
  v207[3] = &unk_1004F5AF8;
  unsigned __int8 v47 = v44;
  v208 = v47;
  uint64_t v48 = v45;
  v209 = v48;
  [v46 downloadedVoicesMatching:0 reply:v207];

  if (AFSupportsMultiUser(v49, v50))
  {
    dispatch_group_enter(v48);
    unsigned __int8 v51 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    v204[0] = _NSConcreteStackBlock;
    v204[1] = 3221225472LL;
    v204[2] = sub_100066454;
    v204[3] = &unk_1004EEC08;
    v205 = v47;
    v206 = v48;
    [v51 fetchMultiUserMetricsWithCompletion:v204];
  }

  id v52 = objc_alloc_init(&OBJC_CLASS___SISchemaPersonalization);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 primaryUser]);
  objc_msgSend(v52, "setPersonalDomainsSetup:", objc_msgSend(v54, "personalDomainsIsEnabled"));

  int v55 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  v166 = (void *)objc_claimAutoreleasedReturnValue([v55 outputVoice]);

  id v171 = objc_alloc_init(&OBJC_CLASS___SISchemaVoiceSettings);
  [v171 setVoiceGender:0];
  if ([v166 gender] == (id)2)
  {
    uint64_t v56 = 1LL;
  }

  else if ([v166 gender] == (id)1)
  {
    uint64_t v56 = 2LL;
  }

  else
  {
    if ([v166 gender] != (id)3) {
      goto LABEL_16;
    }
    uint64_t v56 = 3LL;
  }

  [v171 setVoiceGender:v56];
LABEL_16:
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v166 languageCode]);
  objc_msgSend( v171,  "setVoiceAccent:",  +[SIUtilities convertLanguageCodeToSchemaLocale:]( SIUtilities,  "convertLanguageCodeToSchemaLocale:",  v57));

  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v166 name]);
  [v171 setVoiceName:v58];

  [v52 setVoiceSettings:v171];
  uint64_t v59 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscree"
                         "n:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:acti"
                         "veAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:carplay"
                         "AnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfirm"
                         "ation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotif"
                         "icationsWhitelistSettings:announceCallsEnabled:hostedAccessories:preciseLocationEnabled:locatio"
                         "nAccessPermission:adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSi"
                         "riVolumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnab"
                         "led:autoSendSettings:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSettings:isShowA"
                         "ppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeadunits:withCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_INFO,  "%s Fetching Apple Music subscription status for the active account",  buf,  0xCu);
  }

  dispatch_group_enter(v48);
  id v60 = [sub_100065BDC() sharedStatusController];
  v157 = (void *)objc_claimAutoreleasedReturnValue(v60);
  v200[0] = _NSConcreteStackBlock;
  v200[1] = 3221225472LL;
  v200[2] = sub_100066510;
  v200[3] = &unk_1004EEC30;
  id v148 = v52;
  id v201 = v148;
  v174 = v47;
  v202 = v174;
  dispatch_group_t group = v48;
  dispatch_group_t v203 = group;
  [v157 getSubscriptionStatusWithCompletionHandler:v200];
  v179 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v36 count]);
  __int128 v198 = 0u;
  __int128 v199 = 0u;
  __int128 v196 = 0u;
  __int128 v197 = 0u;
  id obj = v36;
  id v61 = [obj countByEnumeratingWithState:&v196 objects:v220 count:16];
  if (v61)
  {
    uint64_t v62 = *(void *)v197;
    do
    {
      for (i = 0LL; i != v61; i = (char *)i + 1)
      {
        if (*(void *)v197 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = *(void *)(*((void *)&v196 + 1) + 8LL * (void)i);
        id v65 = objc_alloc_init(&OBJC_CLASS___SISchemaActiveAudioDevice);
        [v65 setProductIdentifier:v64];
        unsigned int v66 = (void *)objc_claimAutoreleasedReturnValue([&off_100513138 stringValue]);
        [v65 setVendorIdentifier:v66];

        -[NSMutableArray addObject:](v179, "addObject:", v65);
      }

      id v61 = [obj countByEnumeratingWithState:&v196 objects:v220 count:16];
    }

    while (v61);
  }

  id v167 = objc_alloc_init(&OBJC_CLASS___SISchemaActiveStatus);
  [v167 setCarPlayActiveWithin24Hours:v34];
  [v167 setAudioDevicesActiveWithin24Hours:v179];
  [v167 setCarBluetoothHeadUnitsActiveWithinLast24Hours:v156];
  id v170 = objc_alloc_init(&OBJC_CLASS___SISchemaAnnounceEnabledStatus);
  [v170 setAnnounceMessagesEnabled:a10];
  [v170 setAnnounceCallsEnabled:a18];
  id v172 = objc_alloc_init(&OBJC_CLASS___SISchemaAnnounceNotifications);
  [v172 setIsEnabled:a10];
  objc_msgSend(v172, "setProxCardSeen:");
  [v172 setReplyWithoutConfirmation:a14];
  [v172 setIsEnabledForHeadphones:a11];
  [v172 setIsCarPlayMuted:a13];
  else {
    uint64_t v67 = dword_1003CA350[a12 - 1];
  }
  [v172 setCarPlayStatus:v67];
  [v170 setAnnounceNotifications:v172];
  id v175 = objc_alloc_init(&OBJC_CLASS___SISchemaEnabledStatus);
  [v175 setAssistantEnabled:v176];
  [v175 setDictationEnabled:v158];
  [v175 setHardwareButtonEnabled:v176];
  [v175 setHeySiriEnabled:v35];
  [v175 setAssistantOnLockscreen:v168];
  [v175 setRaiseToSpeakEnabled:v163];
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  objc_msgSend( v175,  "setIsAlwaysShowSiriCaptionsEnabled:",  objc_msgSend(v68, "siriResponseShouldAlwaysPrintWithoutOverride"));

  char v69 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  objc_msgSend(v175, "setIsAlwaysShowSpeechEnabled:", objc_msgSend(v69, "alwaysShowRecognizedSpeech"));

  char v70 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  objc_msgSend( v175,  "setIsShowAppsBehindSiriEnabled:",  objc_msgSend(v70, "alwaysObscureBackgroundContentWhenActive") ^ 1);

  [v175 setSpokenNotificationsEnabled:a10];
  objc_msgSend(v175, "setHasHomekitHome:", objc_msgSend(obj, "count") != 0);
  objc_msgSend( v175,  "setTypeToSiriEnabled:",  AFPreferencesTypeToSiriEnabled( objc_msgSend( v175,  "setDataSharingOptInStatus:",  -[ADDailyDeviceStatusActivity getSiriDataSharingOptInStatus](self, "getSiriDataSharingOptInStatus"))));
  [v175 setIsPreciseLocationEnabled:a20];
  [v175 setLocationAccessPermission:a21];
  [v175 setIsAdaptiveVolumeEnabled:a22];
  [v175 setAnnounceEnabledStatus:v170];
  [v175 setSiriVoiceTriggerSettings:v155];
  char v71 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriDataSharingSensitivityManager shared]( &OBJC_CLASS___AFSiriDataSharingSensitivityManager,  "shared"));
  objc_msgSend(v175, "setIsMteUploadEnabled:", objc_msgSend(v71, "isOptedOutOfMTE") ^ 1);

  [v175 setIsServerUserDataSyncEnabled:-[ADAssistantProperties _getIsServerUserDataSyncEnabled]_0()];
  if ((+[AFFeatureFlags isBlushingPhantomEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isBlushingPhantomEnabled") & 1) == 0) {
    [v175 setHsHangupEnablementState:a28];
  }
  [v175 setSendWithoutConfirmation:v154];
  [v175 setIsRemoteDarwinHeySiriEnabled:a26];
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  BOOL v73 = (void *)objc_claimAutoreleasedReturnValue([v72 siriSpeechRate]);
  [v73 doubleValue];
  double v75 = v74;

  BOOL v77 = _AXSVoiceOverTouchEnabled(v76) != 0;
  [v175 setSiriSpeechRate:v75];
  [v175 setIsVoiceOverEnabled:v77];
  id v169 = objc_alloc_init(&OBJC_CLASS___SISchemaAdaptiveVolumeUserPreferences);
  [v169 setIsPermanentOffsetEnabled:a23];
  [v153 floatValue];
  objc_msgSend(v169, "setPermanentOffsetFactor:");
  objc_msgSend( v169,  "setMostRecentIntent:",  -[ADDailyDeviceStatusActivity getAdaptiveVolumeUserIntent:]( self,  "getAdaptiveVolumeUserIntent:",  objc_msgSend(v152, "intValue")));
  [v175 setAdaptiveVolumeUserPreferences:v169];
  id v78 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v151 = (void *)objc_claimAutoreleasedReturnValue( -[ADDailyDeviceStatusActivity _truncatedGradingOptInStateChanges:]( self,  "_truncatedGradingOptInStateChanges:",  v78));

  [v175 setGradingOptInStateChanges:v151];
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unint64_t v80 = (unint64_t)[v79 useDeviceSpeakerForTTS];

  if (v80 > 3) {
    uint64_t v81 = 0LL;
  }
  else {
    uint64_t v81 = dword_1003CA340[v80];
  }
  [v175 setVoiceFeedback:v81];
  [v175 setIsShowAppsBehindSiriEnabledOnCarPlay:a31];
  [v175 setIsSiriCapableDigitalCarKeyAvailable:a32];
  id v164 = objc_alloc_init(&OBJC_CLASS___SISchemaAggregatedMetrics);
  v161 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerHeartBeatMetricsProvider fetchVoiceTriggerHeartBeatMetrics]( &OBJC_CLASS___CSVoiceTriggerHeartBeatMetricsProvider,  "fetchVoiceTriggerHeartBeatMetrics"));
  if (v161)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue( -[ADDailyDeviceStatusActivity _buildDailyVoiceTriggerMetrics:]( self,  "_buildDailyVoiceTriggerMetrics:",  v161));
    [v164 setVoiceTrigger:v82];
  }

  v160 = (void *)objc_claimAutoreleasedReturnValue( -[ADDailyDeviceStatusActivity _buildDailySelfTriggerSuppressionMetrics]( self,  "_buildDailySelfTriggerSuppressionMetrics"));
  if (v160) {
    [v164 setSelfTriggerSuppression:v160];
  }
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v84 = (void *)objc_claimAutoreleasedReturnValue([v83 _account]);
  v162 = (void *)objc_claimAutoreleasedReturnValue([v84 assistantIdentifier]);

  v85 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    *(void *)&buf[4] = "-[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscree"
                         "n:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:acti"
                         "veAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:carplay"
                         "AnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessReplyConfirm"
                         "ation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:spokenNotif"
                         "icationsWhitelistSettings:announceCallsEnabled:hostedAccessories:preciseLocationEnabled:locatio"
                         "nAccessPermission:adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnabled:adaptiveSi"
                         "riVolumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwinVoiceTriggerEnab"
                         "led:autoSendSettings:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTriggerSettings:isShowA"
                         "ppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connectedBTCarHeadunits:withCompletion:]";
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v162;
    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s assistantIdentifier: %{private}@", buf, 0x16u);
  }

  if ((v176 || v158) && !v162) {
    -[ADDailyDeviceStatusActivity _triggerABCForNullAssistantIdentifier](self, "_triggerABCForNullAssistantIdentifier");
  }
  unsigned int v86 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  v159 = (void *)objc_claimAutoreleasedReturnValue([v86 languageCode]);

  if (v159) {
    -[SISchemaDailyDeviceStatus setSiriInputLocale:]( v174,  "setSiriInputLocale:",  +[SIUtilities convertLanguageCodeToSchemaLocale:]( &OBJC_CLASS___SIUtilities,  "convertLanguageCodeToSchemaLocale:",  v159));
  }
  unsigned int v87 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v88 = (void *)objc_claimAutoreleasedReturnValue([v87 enabledDictationLocales]);

  v177 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v194 = 0u;
  __int128 v195 = 0u;
  __int128 v192 = 0u;
  __int128 v193 = 0u;
  dispatch_group_t v89 = (void *)objc_claimAutoreleasedReturnValue([v88 allKeys]);
  id v90 = [v89 countByEnumeratingWithState:&v192 objects:v219 count:16];
  if (v90)
  {
    uint64_t v91 = *(void *)v193;
    do
    {
      for (j = 0LL; j != v90; j = (char *)j + 1)
      {
        if (*(void *)v193 != v91) {
          objc_enumerationMutation(v89);
        }
        uint64_t v93 = *(void **)(*((void *)&v192 + 1) + 8LL * (void)j);
        uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:v93]);
        unsigned int v95 = [v94 BOOLValue];

        if (v95)
        {
          id v96 = objc_alloc_init(&OBJC_CLASS___SISchemaLocaleIdentifier);
          v97 = (void *)objc_claimAutoreleasedReturnValue([v93 componentsSeparatedByString:@"_"]);
          if ([v97 count] == (id)2)
          {
            id v98 = (void *)objc_claimAutoreleasedReturnValue([v97 firstObject]);
            [v96 setLanguageCode:v98];

            v99 = (void *)objc_claimAutoreleasedReturnValue([v97 lastObject]);
            [v96 setCountryCode:v99];
          }

          -[NSMutableArray addObject:](v177, "addObject:", v96);
        }
      }

      id v90 = [v89 countByEnumeratingWithState:&v192 objects:v219 count:16];
    }

    while (v90);
  }

  -[SISchemaDailyDeviceStatus setEnabledDictationLocales:](v174, "setEnabledDictationLocales:", v177);
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v101 = [v100 longLivedIdentifierUploadingEnabled];

  if (v101)
  {
    -[SISchemaDailyDeviceStatus setSiriDeviceID:](v174, "setSiriDeviceID:", v162);
    int v102 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v103 = (void *)objc_claimAutoreleasedReturnValue([v102 _account]);
    v104 = (void *)objc_claimAutoreleasedReturnValue([v103 speechIdentifier]);
    -[SISchemaDailyDeviceStatus setSiriSpeechID:](v174, "setSiriSpeechID:", v104);

    v105 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    v106 = (void *)objc_claimAutoreleasedReturnValue([v105 primaryUser]);
    v107 = (void *)objc_claimAutoreleasedReturnValue([v106 sharedUserID]);
    -[SISchemaDailyDeviceStatus setSharedUserId:](v174, "setSharedUserId:", v107);
  }

  else
  {
    v108 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[ADDailyDeviceStatusActivity buildDailyDeviceStatusHeartbeatMetricsWithSiriEnabled:onLockscr"
                           "een:dictationEnabled:voiceTriggerEnabled:starkHasBeenActiveWithin24Hours:raiseToSpeakEnabled:"
                           "activeAppleAudioDevices:spokenNotificationsEnabled:announceNotificationsEnabledOnHeadphones:c"
                           "arplayAnnounceEnablementType:isAnnounceNotificationsMutedForCarPlay:shouldSkipTriggerlessRepl"
                           "yConfirmation:spokenNotificationsProxCardSeen:spokenNotificationsControlCenterModuleEnabled:s"
                           "pokenNotificationsWhitelistSettings:announceCallsEnabled:hostedAccessories:preciseLocationEna"
                           "bled:locationAccessPermission:adaptiveSiriVolumeEnabled:adaptiveSiriVolumePermanentOffsetEnab"
                           "led:adaptiveSiriVolumePermanentOffsetFactor:adaptiveSiriVolumeMostRecentIntent:isRemoteDarwin"
                           "VoiceTriggerEnabled:autoSendSettings:hangUpEnablementState:heartbeatQueuedTime:siriVoiceTrigg"
                           "erSettings:isShowAppsBehindSiriEnabledOnCarPlay:isSiriCapableDigitalCarKeyAvailable:connected"
                           "BTCarHeadunits:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_INFO,  "%s #RPI: not logging siri account info for SISchemaDailyDeviceStatus",  buf,  0xCu);
    }
  }

  -[SISchemaDailyDeviceStatus setClientDeviceSamplingTimestampMs:]( v174,  "setClientDeviceSamplingTimestampMs:",  AFGetTimeSinceEpochInMilliseconds());
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v110 = (void *)objc_claimAutoreleasedReturnValue([v109 objectForKey:NSLocaleIdentifier]);
  -[SISchemaDailyDeviceStatus setLocale:](v174, "setLocale:", v110);

  uint64_t v111 = AFProductTypeForInstrumentation();
  v112 = (void *)objc_claimAutoreleasedReturnValue(v111);
  -[SISchemaDailyDeviceStatus setDeviceType:](v174, "setDeviceType:", v112);

  uint64_t v113 = AFProductAndBuildVersion();
  v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
  -[SISchemaDailyDeviceStatus setDeviceOs:](v174, "setDeviceOs:", v114);

  uint64_t v115 = AFBuildVersion();
  v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
  -[SISchemaDailyDeviceStatus setDeviceBuild:](v174, "setDeviceBuild:", v116);

  uint64_t v117 = AFModelForDailyStatus();
  v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
  -[SISchemaDailyDeviceStatus setModelNumber:](v174, "setModelNumber:", v118);

  uint64_t v119 = AFRegionInfo();
  v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
  -[SISchemaDailyDeviceStatus setRegionInfo:](v174, "setRegionInfo:", v120);

  -[SISchemaDailyDeviceStatus setEnabledStatus:](v174, "setEnabledStatus:", v175);
  -[SISchemaDailyDeviceStatus setActiveStatus:](v174, "setActiveStatus:", v167);
  -[SISchemaDailyDeviceStatus setSpokenNotificationsproxCardSeen:](v174, "setSpokenNotificationsproxCardSeen:", a15);
  -[SISchemaDailyDeviceStatus setSpokenNotificationsControlCenterModuleEnabled:]( v174,  "setSpokenNotificationsControlCenterModuleEnabled:",  a16);
  -[SISchemaDailyDeviceStatus setSpokenNotificationsWhitelistSettings:]( v174,  "setSpokenNotificationsWhitelistSettings:",  a17);
  -[SISchemaDailyDeviceStatus setAggregatedMetrics:](v174, "setAggregatedMetrics:", v164);
  -[SISchemaDailyDeviceStatus setQueuedAtTimestampHourInMs:](v174, "setQueuedAtTimestampHourInMs:", a29);
  dispatch_group_enter(group);
  v121 = (void *)objc_claimAutoreleasedReturnValue( +[ADAssistantDataManager sharedDataManager]( &OBJC_CLASS___ADAssistantDataManager,  "sharedDataManager"));
  v189[0] = _NSConcreteStackBlock;
  v189[1] = 3221225472LL;
  v189[2] = sub_1000666D0;
  v189[3] = &unk_1004F0090;
  v122 = v174;
  id v190 = v122;
  v123 = group;
  v191 = v123;
  [v121 getiTunesStoreFrontIdentifierWithCompletion:v189];

  v124 = (void *)objc_claimAutoreleasedReturnValue(-[ADDailyDeviceStatusActivity getVolumeCapacity](self, "getVolumeCapacity"));
  v125 = v124;
  if (v124)
  {
    v126 = (void *)objc_claimAutoreleasedReturnValue([v124 objectForKeyedSubscript:NSURLVolumeTotalCapacityKey]);
    [v126 doubleValue];
    double v128 = v127;

    v129 = (void *)objc_claimAutoreleasedReturnValue([v125 objectForKeyedSubscript:NSURLVolumeAvailableCapacityKey]);
    [v129 doubleValue];
    double v131 = v130;

    v132 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02f",  v131 / 1000000000.0));
    [v132 doubleValue];
    double v134 = v133;

    LODWORD(v135) = vcvtpd_u64_f64(v128 / 1000000000.0);
    [v122 setDeviceCapacityInGB:v135];
    [v122 setAvailableDeviceStorageInMB:v134 * 1000.0];
  }

  v136 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
  v186[0] = _NSConcreteStackBlock;
  v186[1] = 3221225472LL;
  v186[2] = sub_1000667AC;
  v186[3] = &unk_1004F9450;
  id v137 = v149;
  id v188 = v137;
  id v138 = v122;
  id v187 = v138;
  v139 = -[AFSafetyBlock initWithBlock:](v136, "initWithBlock:", v186);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v216 = sub_100065E60;
  v217 = sub_100065E70;
  id v218 = 0LL;
  v140 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  queue = self->_queue;
  v184[0] = _NSConcreteStackBlock;
  v184[1] = 3221225472LL;
  v184[2] = sub_1000667BC;
  v184[3] = &unk_1004FD940;
  v142 = v139;
  v185 = v142;
  v143 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v140,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v184,  5.0);
  v144 = *(void **)(*(void *)&buf[8] + 40LL);
  *(void *)(*(void *)&buf[8] + 40LL) = v143;

  [*(id *)(*(void *)&buf[8] + 40) start];
  v145 = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066880;
  block[3] = &unk_1004FBE80;
  v182 = v142;
  v183 = buf;
  id v181 = v138;
  v146 = v142;
  id v147 = v138;
  dispatch_group_notify(v123, v145, block);

  _Block_object_dispose(buf, 8);
}

- (id)_buildDailyVoiceTriggerMetrics:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SISchemaVoiceTriggerMetrics);
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kCSVoiceTriggerNumImplicitUtt]);
  v6 = v5;
  if (v5) {
    objc_msgSend(v4, "setImplicitUtterances:", objc_msgSend(v5, "intValue"));
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kCSVoiceTriggerNumExplicitUtt]);
  uint64_t v8 = v7;
  if (v7) {
    objc_msgSend(v4, "setExplicitUtterances:", objc_msgSend(v7, "intValue"));
  }
  uint64_t v76 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kCSVoiceTriggerFirstPassTriggersPerDay]);
  objc_super v10 = v9;
  if (v9) {
    objc_msgSend(v4, "setFirstPassTriggers:", objc_msgSend(v9, "intValue"));
  }
  double v74 = v10;
  double v75 = v8;
  BOOL v77 = v3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kCSVoiceTriggerIsJSEnabled]);
  id v12 = [v11 BOOLValue];

  [v4 setIsJSEnabled:v12];
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v14 = objc_alloc_init(&OBJC_CLASS___BMSQLDatabase);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ \"%@\",  @"SELECT * FROM ",  @"Siri.VoiceTriggerStatistics""));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 executeQuery:@"%@", v15]);
  if ([v16 next])
  {
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 row]);
      [v13 addObject:v17];
    }

    while (([v16 next] & 1) != 0);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v18 timeIntervalSince1970];
  double v20 = v19;

  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id obj = v13;
  id v21 = [obj countByEnumeratingWithState:&v97 objects:v101 count:16];
  if (v21)
  {
    id v22 = v21;
    unint64_t v23 = 0LL;
    unint64_t v24 = (unint64_t)v20;
    uint64_t v25 = *(void *)v98;
    v79 = v4;
    uint64_t v78 = *(void *)v98;
    do
    {
      uint64_t v26 = 0LL;
      id v80 = v22;
      do
      {
        if (*(void *)v98 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)v26);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"absoluteTimestamp"]);
        uint64_t v29 = v28;
        if (v28 && (v24 - (unint64_t)[v28 unsignedLongLongValue]) >> 7 <= 0x2A2 && v23 <= 0xC7)
        {
          unint64_t v30 = v23;
          id v31 = v4;
          id v96 = v29;
          id v32 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHVoiceTriggerFirstPassStatistic);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"firstPassPeakScoreHS"]);
          BOOL v34 = v33;
          if (v33)
          {
            [v33 floatValue];
            objc_msgSend(v32, "setFirstPassPeakScoreHS:");
          }

          BOOL v35 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"firstPassPeakScoreJS"]);
          id v36 = v35;
          if (v35)
          {
            [v35 floatValue];
            objc_msgSend(v32, "setFirstPassPeakScoreJS:");
          }

          uint64_t v94 = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"triggerScoreHS"]);
          dispatch_time_t v38 = v37;
          if (v37)
          {
            [v37 floatValue];
            objc_msgSend(v32, "setTriggerScoreHS:");
          }

          uint64_t v93 = v38;
          v39 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"triggerScoreJS"]);
          v40 = v31;
          v41 = v39;
          if (v39)
          {
            [v39 floatValue];
            objc_msgSend(v32, "setTriggerScoreJS:");
          }

          v92 = v41;
          v42 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"keywordThresholdHS"]);
          id v43 = v42;
          if (v42)
          {
            [v42 floatValue];
            objc_msgSend(v32, "setKeywordThresholdHS:");
          }

          uint64_t v91 = v43;
          id v44 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"keywordThresholdJS"]);
          unint64_t v86 = v30;
          id v45 = v44;
          if (v44)
          {
            [v44 floatValue];
            objc_msgSend(v32, "setKeywordThresholdJS:");
          }

          id v90 = v45;
          v46 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"recognizerScoreHS"]);
          unsigned __int8 v47 = v46;
          if (v46)
          {
            [v46 floatValue];
            objc_msgSend(v32, "setRecognizerScoreHS:");
          }

          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"recognizerScoreJS"]);
          uint64_t v49 = v48;
          if (v48)
          {
            [v48 floatValue];
            objc_msgSend(v32, "setRecognizerScoreJS:");
          }

          dispatch_group_t v89 = v49;
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"firstPassTriggerSource"]);
          unsigned __int8 v51 = v50;
          if (v50) {
            objc_msgSend(v32, "setFirstPassTriggerSource:", objc_msgSend(v50, "intValue"));
          }
          id v52 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"absoluteTimestamp"]);
          v53 = v52;
          if (v52) {
            objc_msgSend(v32, "setSecondsSinceEpoch:", objc_msgSend(v52, "unsignedLongLongValue"));
          }
          unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"repetitionSimilarityScore"]);
          int v55 = v54;
          if (v54)
          {
            [v54 floatValue];
            objc_msgSend(v32, "setRepetitionSimilarityScore:");
          }

          v85 = v55;
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"mitigationScore"]);
          uint64_t v57 = v56;
          if (v56)
          {
            [v56 floatValue];
            objc_msgSend(v32, "setMitigationScore:");
          }

          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"invocationTypeID"]);
          uint64_t v59 = v58;
          if (v58) {
            objc_msgSend(v32, "setInvocationTypeId:", objc_msgSend(v58, "intValue"));
          }
          v83 = v59;
          unsigned int v95 = v34;
          id v60 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"tdSpeakerRecognizerCombinedScore"]);
          id v61 = v60;
          if (v60)
          {
            [v60 floatValue];
            objc_msgSend(v32, "setTdSpeakerRecognizerCombinedScore:");
          }

          unsigned int v87 = v53;
          uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"tdSpeakerRecognizerCombinedThresholdHS"]);
          uint64_t v63 = v62;
          if (v62)
          {
            [v62 floatValue];
            objc_msgSend(v32, "setTdSpeakerRecognizerCombinedThresholdHS:");
          }

          v82 = v61;
          id v84 = v57;
          uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"tdSpeakerRecognizerCombinedThresholdJS"]);
          id v65 = v64;
          if (v64)
          {
            [v64 floatValue];
            objc_msgSend(v32, "setTdSpeakerRecognizerCombinedThresholdJS:");
          }

          [v40 addFirstPassStatistics:v32];
          id v66 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHVoiceTriggerFirstPassDailyMetadata);
          uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"hwSampleRate"]);
          v68 = v67;
          if (v67) {
            objc_msgSend(v66, "setHardwareSampleRate:", objc_msgSend(v67, "intValue"));
          }
          v88 = v51;
          char v69 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"configVersion"]);
          uint64_t v70 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          if (v69 == (void *)v70)
          {
          }

          else
          {
            char v71 = (void *)v70;
            id v72 = [v69 length];

            if (v72) {
              [v66 setConfigVersion:v69];
            }
          }

          unint64_t v23 = v86 + 1;
          id v4 = v79;
          [v79 setFirstPassMetadata:v66];

          id v22 = v80;
          uint64_t v25 = v78;
          unint64_t v24 = (unint64_t)v20;
          uint64_t v29 = v96;
        }

        uint64_t v26 = (char *)v26 + 1;
      }

      while (v22 != v26);
      id v22 = [obj countByEnumeratingWithState:&v97 objects:v101 count:16];
    }

    while (v22);
  }

  return v4;
}

- (id)_buildDailySelfTriggerSuppressionMetrics
{
  return objc_alloc_init(&OBJC_CLASS___SISchemaSelfTriggerSuppressionMetrics);
}

- (BOOL)_isSiriCapableDigitalCarKeyAvailable
{
  v2 = objc_alloc_init(&OBJC_CLASS___PKPassLibrary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPassLibrary passesOfType:](v2, "passesOfType:", 1LL));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pk_objectsPassingTest:", &stru_1004EEC50));
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "passActivationState", (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (BOOL)_preciseLocationEnabled
{
  v2 = objc_alloc(&OBJC_CLASS___CLLocationManager);
  uint64_t v3 = AFEffectiveSiriBundleForLocation();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[CLLocationManager initWithEffectiveBundle:](v2, "initWithEffectiveBundle:", v4);

  LOBYTE(v4) = -[CLLocationManager accuracyAuthorization](v5, "accuracyAuthorization") == CLAccuracyAuthorizationFullAccuracy;
  return (char)v4;
}

- (int)_locationAccessPermission
{
  if (!+[CLLocationManager locationServicesEnabled](&OBJC_CLASS___CLLocationManager, "locationServicesEnabled")) {
    return 1;
  }
  uint64_t v2 = AFEffectiveSiriBundlePathForLocation();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned int v4 = +[CLLocationManager authorizationStatusForBundlePath:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundlePath:",  v3);

  if (v4 - 1 > 3) {
    return 4;
  }
  else {
    return dword_1003CA330[v4 - 1];
  }
}

- (void)fetchEnrolledUsersWithCompletion:(id)a3
{
  id v4 = a3;
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v31 sharedUsersBySharedUserID]);
  id v6 = [v5 count];

  uint64_t v7 = (void *)AFSiriLogContextDaemon;
  BOOL v8 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    unint64_t v30 = v4;
    if (v8)
    {
      __int128 v9 = v7;
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v31 sharedUsersBySharedUserID]);
      *(_DWORD *)buf = 136315395;
      unsigned __int8 v47 = "-[ADDailyDeviceStatusActivity fetchEnrolledUsersWithCompletion:]";
      __int16 v48 = 2113;
      uint64_t v49 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Fetching enrolledUsers info: %{private}@",  buf,  0x16u);
    }

    __int128 v11 = dispatch_group_create();
    __int128 v12 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v31 sharedUsersBySharedUserID]);
    id v14 = -[NSMutableArray initWithCapacity:](v12, "initWithCapacity:", [v13 count]);

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v42 = 0u;
    __int128 v41 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v31 sharedUsersBySharedUserID]);
    id v16 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v42;
      do
      {
        double v19 = 0LL;
        do
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)v19);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v31 sharedUsersBySharedUserID]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v20]);

          if (v22)
          {
            id v23 = objc_alloc_init(&OBJC_CLASS___SISchemaEnrolledUserState);
            unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 speechID]);
            [v23 setSiriLinkedSpeechID:v24];

            id v25 = objc_alloc_init(&OBJC_CLASS___SISchemaPersonalization);
            objc_msgSend(v25, "setPersonalDomainsSetup:", objc_msgSend(v22, "personalDomainsIsEnabled"));
            dispatch_group_enter(v11);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472LL;
            v35[2] = sub_100065F08;
            v35[3] = &unk_1004EEC78;
            id v36 = v25;
            id v37 = v23;
            dispatch_time_t v38 = self;
            v39 = v14;
            v40 = v11;
            id v26 = v23;
            id v27 = v25;
            -[ADDailyDeviceStatusActivity fetchAppleMusicSubscriptionForSharedUser:completion:]( self,  "fetchAppleMusicSubscriptionForSharedUser:completion:",  v22,  v35);
          }

          double v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }

      while (v17);
    }

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100065FB8;
    block[3] = &unk_1004FD990;
    id v4 = v30;
    v33 = v14;
    id v34 = v30;
    uint64_t v29 = v14;
    dispatch_group_notify(v11, queue, block);
  }

  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v47 = "-[ADDailyDeviceStatusActivity fetchEnrolledUsersWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_INFO,  "%s No enrolledUsers in sharedService",  buf,  0xCu);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (int)getSiriDataSharingOptInStatus
{
  uint64_t v2 = _AFPreferencesSiriDataSharingOptInStatus(self, a2);
  return v2;
}

- (int)getAdaptiveVolumeUserIntent:(int)a3
{
  else {
    return 1;
  }
}

- (id)_truncatedGradingOptInStateChanges:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 siriDataSharingOptInStatusHistory]);
  id v5 = [v4 count];
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ADDailyDeviceStatusActivity _truncatedGradingOptInStateChanges:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    double v13 = (uint64_t (*)(uint64_t, uint64_t))v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Fetching %lu most recent siri data sharing opt-in status change entries from preferences %@",  buf,  0x20u);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, v6));
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  double v13 = sub_100065E60;
  id v14 = sub_100065E70;
  id v15 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100065E78;
  v11[3] = &unk_1004F1BD8;
  v11[4] = buf;
  v11[5] = v6;
  [v8 enumerateObjectsUsingBlock:v11];
  id v9 = *(id *)(*(void *)&buf[8] + 40LL);
  _Block_object_dispose(buf, 8);

  return v9;
}

- (void)_triggerABCForNullAssistantIdentifier
{
  uint64_t v2 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ADDailyDeviceStatusActivity _triggerABCForNullAssistantIdentifier]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s Reporting missing DailyDeviceStatus > siriDeviceID to ABC",  (uint8_t *)&v6,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v5 = [v4 processIdentifier];
  [v3 reportIssueForType:@"SISchemaDailyDeviceStatus" subType:@"null_siriDeviceID" context:&__NSDictionary0__struct processIdentifier:v5 walkboutStatus:byte_1005780A0];
}

- (id)getVolumeCapacity
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___NSURL);
  id v3 = NSHomeDirectory();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[NSURL initFileURLWithPath:isDirectory:](v2, "initFileURLWithPath:isDirectory:", v4, 1LL);

  v15[0] = NSURLVolumeTotalCapacityKey;
  v15[1] = NSURLVolumeAvailableCapacityKey;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v12 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL resourceValuesForKeys:error:](v5, "resourceValuesForKeys:error:", v6, &v12));
  id v8 = v12;

  if (v7)
  {
    id v9 = v7;
  }

  else
  {
    __int128 v10 = (os_log_s *)AFSiriLogContextUtility;
    if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[ADDailyDeviceStatusActivity getVolumeCapacity]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s #Unable to get volumeTotalCapacityDict",  buf,  0xCu);
    }
  }

  return v7;
}

- (void)fetchAppleMusicSubscriptionForSharedUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    id v15 = "-[ADDailyDeviceStatusActivity fetchAppleMusicSubscriptionForSharedUser:completion:]";
    __int16 v16 = 2113;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Fetching ICUserIdentity for sharedUser: %{private}@",  buf,  0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100065A48;
  v11[3] = &unk_1004EECC8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  -[ADDailyDeviceStatusActivity fetchICUserIdentityForSharedUser:completion:]( self,  "fetchICUserIdentityForSharedUser:completion:",  v9,  v11);
}

- (void)fetchICUserIdentityForSharedUser:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    double v19 = "-[ADDailyDeviceStatusActivity fetchICUserIdentityForSharedUser:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v5 && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 homeUserUUID]), v8, v8))
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 homeUserUUID]);
    __int128 v11 = -[NSUUID initWithUUIDString:](v9, "initWithUUIDString:", v10);

    if (qword_100577A18 != -1) {
      dispatch_once(&qword_100577A18, &stru_1004EECE8);
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ic_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ic_sharedAccountStore"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    void v15[2] = sub_100065618;
    v15[3] = &unk_1004EED10;
    __int16 v16 = v11;
    id v17 = v6;
    id v13 = v11;
    objc_msgSend(v12, "ic_storeAccountForHomeUserIdentifier:completion:", v13, v15);
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      double v19 = "-[ADDailyDeviceStatusActivity fetchICUserIdentityForSharedUser:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Non home shared user, Bailing.", buf, 0xCu);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

- (id)fetchVoiceTriggerSettings
{
  id v2 = objc_alloc_init(&OBJC_CLASS___SISchemaSiriVoiceTriggerSettings);
  [v2 setIsHeySiriTriggerPhraseEnabled:0];
  [v2 setIsJustSiriTriggerPhraseEnabled:0];
  [v2 setIsEnrollmentReprompted:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  unsigned int v4 = [v3 voiceTriggerEnabled];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
    uint64_t v10 = 0LL;
    id v6 = [v5 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:&v10];

    if ((unint64_t)v6 <= 1)
    {
      [v2 setIsHeySiriTriggerPhraseEnabled:1];
      [v2 setIsJustSiriTriggerPhraseEnabled:v6];
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateWhenVoiceTriggerRePrompted]);

  if (v8) {
    [v2 setIsEnrollmentReprompted:1];
  }
  return v2;
}

- (void).cxx_destruct
{
}

+ (const)activityIdentifier
{
  return "com.apple.siri.xpc_activity.heartbeat";
}

+ (id)xpcCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  return v2;
}

+ (id)taskFromActivity:(id)a3
{
  return objc_alloc_init(&OBJC_CLASS___ADDailyDeviceStatusActivity);
}

@end