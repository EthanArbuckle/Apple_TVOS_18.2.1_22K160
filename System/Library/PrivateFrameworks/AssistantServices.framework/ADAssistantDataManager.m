@interface ADAssistantDataManager
+ (id)sharedDataManager;
- (ADAddressBookManager)_addressBookManager;
- (ADAssistantDataManager)init;
- (ADAssistantDataManager)initWithInstanceContext:(id)a3;
- (BOOL)voiceOverIsActive;
- (id)_cachedAssistantData;
- (id)_cachedRestrictions;
- (id)_mcQueue;
- (id)_redactedCopyMeCards:(id)a3;
- (id)_unredactedMeCards;
- (id)unredactedAnchor;
- (void)_censorSpeechDidChange:(id)a3;
- (void)_countryCodeDidChange:(id)a3;
- (void)_currentLocaleDidChange:(id)a3;
- (void)_fetchDictationAllowedStatus:(id)a3;
- (void)_fetchDictationHIPAAMDMStatus:(id)a3;
- (void)_generateAssistantData;
- (void)_locationRestrictionDidChange:(id)a3;
- (void)_notifyAnnouncementEligibilityObserverVoiceAssetsDidChange;
- (void)_notifyObserversOfDictationHIPAAMDMStatus;
- (void)_notifyObserversOfSAD:(id)a3;
- (void)_onMainThreadUpdateCountryCodeWithCountryConfiguration:(id)a3 completion:(id)a4;
- (void)_outputVoiceDidChange:(id)a3;
- (void)_safeGenerateAssistantDataForVoiceTriggerEnabled;
- (void)_safeUpdateVoiceOverStatus;
- (void)_setAllowExplicitContent:(BOOL)a3;
- (void)_setAllowExplicitContentAndCensorSpeech:(BOOL)a3;
- (void)_storeFrontDidChange:(id)a3;
- (void)_systemTimeZoneDidChange:(id)a3;
- (void)_updateCallCapability:(id)a3;
- (void)_updateDictationAllowedStatus;
- (void)_updateItunesStoreIdentifier:(id)a3;
- (void)_updateRestrictions:(id)a3;
- (void)_updateVoice:(id)a3;
- (void)_updateVoiceOverStatus:(id)a3;
- (void)_voiceAssetsUpdated:(id)a3;
- (void)addObserver:(id)a3;
- (void)addressBookManagerDidUpdateData:(id)a3 meCard:(id)a4;
- (void)contextCollector:(id)a3 didChangeDisplayScale:(double)a4;
- (void)dealloc;
- (void)didChangeTelephonyCallingSupport;
- (void)getAssistantDataWithCompletion:(id)a3;
- (void)getMeCardsWithCompletion:(id)a3;
- (void)getiTunesStoreFrontIdentifierWithCompletion:(id)a3;
- (void)localMeCardDidUpdate:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)requestAssistantDataUpdateHighPriority:(BOOL)a3;
- (void)setAllowExplicitContentAndCensorSpeech:(BOOL)a3;
- (void)setVoiceOverIsActive:(BOOL)a3;
@end

@implementation ADAssistantDataManager

- (ADAssistantDataManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
  v4 = -[ADAssistantDataManager initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (ADAssistantDataManager)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)&OBJC_CLASS___ADAssistantDataManager;
  id v5 = -[ADAssistantDataManager init](&v96, "init");
  if (v5)
  {
    dispatch_queue_attr_t initially_inactive = dispatch_queue_attr_make_initially_inactive(0LL);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(initially_inactive);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);

    dispatch_queue_t v10 = dispatch_queue_create("ADAssistantDataManager", v9);
    v11 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v10;

    dispatch_set_qos_class_floor(*((dispatch_object_t *)v5 + 1), QOS_CLASS_DEFAULT, 0);
    dispatch_activate(*((dispatch_object_t *)v5 + 1));
    if (v4) {
      id v12 = v4;
    }
    else {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    }
    v13 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = v12;

    v14 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  5LL,  1LL);
    v15 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v14;

    v16 = dispatch_group_create();
    v17 = -[ADDisplayScaleContextCollector initWithDelegate:]( objc_alloc(&OBJC_CLASS___ADDisplayScaleContextCollector),  "initWithDelegate:",  v5);
    v18 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v17;

    dispatch_group_t v19 = dispatch_group_create();
    v20 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v19;

    int HasAddressBook = AFDeviceHasAddressBook();
    dispatch_group_enter(*((dispatch_group_t *)v5 + 4));
    if (HasAddressBook)
    {
      v22 = -[ADAddressBookManager initWithDelegate:]( objc_alloc(&OBJC_CLASS___ADAddressBookManager),  "initWithDelegate:",  v5);
      v23 = (void *)*((void *)v5 + 22);
      *((void *)v5 + 22) = v22;

      dispatch_group_enter(v16);
      v24 = (void *)*((void *)v5 + 22);
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472LL;
      v93[2] = sub_1002ED070;
      v93[3] = &unk_1004FB0B8;
      v25 = &v94;
      id v94 = v5;
      v26 = (id *)&v95;
      v95 = v16;
      [v24 getMeCard:v93];
    }

    else
    {
      dispatch_group_enter(v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[ADLocalMeCardStore sharedStore](&OBJC_CLASS___ADLocalMeCardStore, "sharedStore"));
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472LL;
      v90[2] = sub_1002ED11C;
      v90[3] = &unk_1004FB0B8;
      v25 = &v91;
      id v28 = v5;
      id v91 = v28;
      v26 = (id *)&v92;
      v92 = v16;
      [v27 meCard:v90];

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[ADLocalMeCardStore sharedStore](&OBJC_CLASS___ADLocalMeCardStore, "sharedStore"));
      [v29 addMeCardObserver:v28];
    }

    dispatch_group_enter(v16);
    qos_class_t v30 = qos_class_self();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002ED1C8;
    block[3] = &unk_1004FD968;
    id v31 = v5;
    id v88 = v31;
    v32 = v16;
    v89 = v32;
    dispatch_block_t v67 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v30, 0, block);
    dispatch_async(*((dispatch_queue_t *)v5 + 1), v67);
    *((_WORD *)v31 + 28) = 256;
    *((_BYTE *)v31 + 89) = 0;
    *((_BYTE *)v31 + 120) = _AFPreferencesGetEnableServerDebugFlags();
    v33 = objc_alloc_init(&OBJC_CLASS___SAMediaContentRatingRestrictions);
    v34 = (void *)*((void *)v31 + 12);
    *((void *)v31 + 12) = v33;

    if (qword_1005780A8 != -1) {
      dispatch_once(&qword_1005780A8, &stru_1004F5FE0);
    }
    *((_BYTE *)v31 + 58) = byte_1005780A1;
    dispatch_group_enter(v32);
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472LL;
    v85[2] = sub_1002ED234;
    v85[3] = &unk_1004FB0E0;
    v35 = v32;
    v86 = v35;
    [v31 _updateRestrictions:v85];
    dispatch_group_enter(v35);
    qos_class_t v36 = qos_class_self();
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472LL;
    v82[2] = sub_1002ED23C;
    v82[3] = &unk_1004FD968;
    id v37 = v31;
    id v83 = v37;
    v38 = v35;
    v84 = v38;
    dispatch_block_t v39 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v36, 0, v82);
    dispatch_async(*((dispatch_queue_t *)v5 + 1), v39);
    dispatch_group_enter(v38);
    qos_class_t v40 = qos_class_self();
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472LL;
    v79[2] = sub_1002ED2A8;
    v79[3] = &unk_1004FD968;
    v41 = v37;
    id v80 = v41;
    v42 = v38;
    v81 = v42;
    dispatch_block_t v43 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v40, 0, v79);
    dispatch_async(*((dispatch_queue_t *)v5 + 1), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    uint64_t v45 = objc_claimAutoreleasedReturnValue([v44 countryCode]);
    v46 = (void *)v41[8];
    v41[8] = v45;

    dispatch_group_enter(v42);
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_1002ED314;
    v76[3] = &unk_1004FD968;
    v47 = v41;
    id v77 = v47;
    v48 = v42;
    v78 = v48;
    dispatch_async(&_dispatch_main_q, v76);
    AFIsNano(v49);
    v47[104] = 1;
    dispatch_group_enter(v48);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472LL;
    v74[2] = sub_1002ED3A8;
    v74[3] = &unk_1004FB0E0;
    v50 = v48;
    v75 = v50;
    [v47 _updateCallCapability:v74];
    LODWORD(v42) = qos_class_self();
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472LL;
    v72[2] = sub_1002ED3B0;
    v72[3] = &unk_1004FD940;
    v51 = v47;
    id v73 = v51;
    dispatch_block_t v52 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, (dispatch_qos_class_t)v42, 0, v72);
    dispatch_time_t v53 = dispatch_time(0LL, 3000000000LL);
    dispatch_after(v53, *((dispatch_queue_t *)v5 + 1), v52);
    qos_class_t v54 = qos_class_self();
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_1002ED480;
    v70[3] = &unk_1004FD940;
    v55 = v51;
    id v71 = v55;
    dispatch_block_t v56 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v54, 0, v70);
    dispatch_group_notify(v50, *((dispatch_queue_t *)v5 + 1), v56);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_1002ED494;
    v68[3] = &unk_1004FB0E0;
    v57 = v55;
    id v69 = v57;
    [v57 _fetchDictationHIPAAMDMStatus:v68];
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    v57[106] = [v58 _dictationIsAllowed];

    [v57 _updateDictationAllowedStatus];
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v59 addObserver:v57 selector:"_locationRestrictionDidChange:" name:@"ADLocationRestrictionDidChangeNotification" object:0];
    [v59 addObserver:v57 selector:"_currentLocaleDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];
    [v59 addObserver:v57 selector:"_systemTimeZoneDidChange:" name:NSSystemTimeZoneDidChangeNotification object:0];
    [v59 addObserver:v57 selector:"_outputVoiceDidChange:" name:@"ADPreferencesOutputVoiceDidChangeNotification" object:0];
    [v59 addObserver:v57 selector:"_voiceAssetsUpdated:" name:@"ADVoiceAssetsUpdatedNotification" object:0];
    [v59 addObserver:v57 selector:"_censorSpeechDidChange:" name:@"ADShouldCensorSpeechDidChangeNotification" object:0];
    +[TUCallCapabilities addDelegate:queue:]( &OBJC_CLASS___TUCallCapabilities,  "addDelegate:queue:",  v57,  *((void *)v5 + 1));
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v60 addObserver:v57 selector:"_storeFrontDidChange:" name:ACAccountStoreDidChangeNotification object:0];

    [v59 addObserver:v57 selector:"_countryCodeDidChange:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    unsigned int v62 = [*((id *)v5 + 20) isEndpoint];
    v63 = (CFStringRef *)&kVTPreferencesRemoraVoiceTriggerEnabledDidChangeDarwinNotification;
    if (!v62) {
      v63 = (CFStringRef *)&kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification;
    }
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v57,  (CFNotificationCallback)sub_1002ED50C,  *v63,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver( LocalCenter,  v57,  (CFNotificationCallback)sub_1002ED514,  kAXSVoiceOverTouchEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v65 addObserver:v57];

    [v57 addiTunesObserver];
  }

  return (ADAssistantDataManager *)v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  -[ADAssistantDataManager removeiTunesObserver](self, "removeiTunesObserver");
  +[TUCallCapabilities removeDelegate:](&OBJC_CLASS___TUCallCapabilities, "removeDelegate:", self);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADAssistantDataManager;
  -[ADAssistantDataManager dealloc](&v6, "dealloc");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002ED064;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002ED058;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)requestAssistantDataUpdateHighPriority:(BOOL)a3
{
  BOOL v3 = a3;
  qos_class_t v5 = qos_class_self();
  if (v5 <= QOS_CLASS_USER_INITIATED) {
    int v6 = 25;
  }
  else {
    int v6 = v5;
  }
  if (v3) {
    dispatch_qos_class_t v7 = v6;
  }
  else {
    dispatch_qos_class_t v7 = v5;
  }
  id v8 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[ADAssistantDataManager requestAssistantDataUpdateHighPriority:]";
    __int16 v14 = 1024;
    dispatch_qos_class_t v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Manually requesting assistant data update at qos_class_t %#02X",  buf,  0x12u);
  }

  if (v3) {
    dispatch_block_flags_t v9 = DISPATCH_BLOCK_ENFORCE_QOS_CLASS;
  }
  else {
    dispatch_block_flags_t v9 = DISPATCH_BLOCK_INHERIT_QOS_CLASS;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002ED044;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(v9, v7, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v10);
}

- (void)getiTunesStoreFrontIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  qos_class_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002ECF04;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getMeCardsWithCompletion:(id)a3
{
  id v4 = a3;
  qos_class_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002ECA48;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)unredactedAnchor
{
  uint64_t v6 = 0LL;
  dispatch_qos_class_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  dispatch_block_flags_t v9 = sub_1002EB578;
  dispatch_block_t v10 = sub_1002EB588;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002ECA10;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setAllowExplicitContentAndCensorSpeech:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002ECA00;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)getAssistantDataWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002EC910;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)didChangeTelephonyCallingSupport
{
  id v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[ADAssistantDataManager didChangeTelephonyCallingSupport]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002EC900;
  v4[3] = &unk_1004FB0E0;
  v4[4] = self;
  -[ADAssistantDataManager _updateCallCapability:](self, "_updateCallCapability:", v4);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  BOOL v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_block_flags_t v9 = "-[ADAssistantDataManager profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC880;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)addressBookManagerDidUpdateData:(id)a3 meCard:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002EC704;
  v8[3] = &unk_1004FD968;
  id v9 = v5;
  dispatch_block_t v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)contextCollector:(id)a3 didChangeDisplayScale:(double)a4
{
  uint64_t v6 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAssistantDataManager contextCollector:didChangeDisplayScale:]";
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC6FC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_voiceAssetsUpdated:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADAssistantDataManager _voiceAssetsUpdated:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC60C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_currentLocaleDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADAssistantDataManager _currentLocaleDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC604;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];
}

- (void)_locationRestrictionDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADAssistantDataManager _locationRestrictionDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC5A0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_storeFrontDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADAssistantDataManager _storeFrontDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002EC45C;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(queue, block);
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[ADAssistantDataManager _storeFrontDidChange:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Unable to get the shared instance of ACAccountStore.",  buf,  0xCu);
    }
  }
}

- (void)_systemTimeZoneDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADAssistantDataManager _systemTimeZoneDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC430;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_outputVoiceDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADAssistantDataManager _outputVoiceDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC32C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_countryCodeDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADAssistantDataManager _countryCodeDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC290;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_safeGenerateAssistantDataForVoiceTriggerEnabled
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC1C0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_safeUpdateVoiceOverStatus
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC15C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_censorSpeechDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADAssistantDataManager _censorSpeechDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EC0F8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_notifyAnnouncementEligibilityObserverVoiceAssetsDidChange
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  AFUpdateAnnouncementEligibilityDarwinNotification,  0LL,  0LL,  1u);
}

- (id)_redactedCopyMeCards:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  if (v4)
  {
    id v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v4);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        dispatch_block_t v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = _AFRedactedCopyPerson(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v10));
          id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          -[NSMutableArray addObject:](v5, "addObject:", v12, (void)v14);

          dispatch_block_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }
  }

  else
  {
    id v5 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v5;
}

- (void)_generateAssistantData
{
  if (self->_initialFetchComplete
    && (self->_cachedCountryCode || self->_receivedGeoCountryConfigurationResponse || self->_cachedVoice))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SASetAssistantData);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    -[SASetAssistantData setTimeZoneId:](v3, "setTimeZoneId:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localeIdentifier]);
    -[SASetAssistantData setRegion:](v3, "setRegion:", v7);

    int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"AppleICUForce24HourTime",  kCFPreferencesAnyApplication,  0LL);
    if (AppBooleanValue
      || CFPreferencesGetAppBooleanValue(@"AppleICUForce12HourTime", kCFPreferencesAnyApplication, 0LL))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", AppBooleanValue != 0));
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    -[SASetAssistantData setTwentyFourHourTimeDisplay:](v3, "setTwentyFourHourTimeDisplay:", v9);

    dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantDataManager _cachedRestrictions](self, "_cachedRestrictions"));
    -[SASetAssistantData setParentalRestrictions:](v3, "setParentalRestrictions:", v10);

    -[SASetAssistantData setCensorSpeech:](v3, "setCensorSpeech:", self->_cachedCensorSpeech);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_cachedAllowUserGeneratedContent));
    -[SASetAssistantData setAllowUserGeneratedContent:](v3, "setAllowUserGeneratedContent:", v11);

    -[SASetAssistantData setMediaPlayerExplicitContentDisallowed:]( v3,  "setMediaPlayerExplicitContentDisallowed:",  !self->_cachedAllowsExplicitContent);
    -[SASetAssistantData setMediaContentRatingRestrictions:]( v3,  "setMediaContentRatingRestrictions:",  self->_cachedContentRatingRestrictions);
    -[SASetAssistantData setCountryCode:](v3, "setCountryCode:", self->_cachedCountryCode);
    -[ADDisplayScaleContextCollector displayScale](self->_displayScaleMonitor, "displayScale");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[SASetAssistantData setUiScale:](v3, "setUiScale:", v12);

    -[SASetAssistantData setTtsVoice:](v3, "setTtsVoice:", self->_cachedVoice);
    uint64_t v13 = AFDeviceColor(-[SASetAssistantData setMeCards:](v3, "setMeCards:", self->_cachedMeCards));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[SASetAssistantData setDeviceColor:](v3, "setDeviceColor:", v14);

    uint64_t v15 = AFDeviceEnclosureColor();
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[SASetAssistantData setDeviceEnclosure:](v3, "setDeviceEnclosure:", v16);

    -[SASetAssistantData setInRetailStoreDemoMode:](v3, "setInRetailStoreDemoMode:", self->_cachedInRetailStoreDemoMode);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
    -[SASetAssistantData setPreferredLanguage:](v3, "setPreferredLanguage:", v18);

    -[SASetAssistantData setFullStorefrontId:](v3, "setFullStorefrontId:", self->_cachedStoreFrontId);
    dispatch_group_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_cachedServerFlagsEnabled));
    -[SASetAssistantData setDebugFlags:](v3, "setDebugFlags:", v19);

    v20 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_1001EBF24(self->_instanceContext));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[SASetAssistantData setVoiceTriggerEnabled:](v3, "setVoiceTriggerEnabled:", v21);

    if (self->_cachedSupportsTelephonyCalls)
    {
      uint64_t v56 = SADeviceCapabilityTelephonyValue;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
      -[SASetAssistantData setDeviceCapabilities:](v3, "setDeviceCapabilities:", v22);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_aceTemperatureUnit"));
    -[SASetAssistantData setTemperatureUnit:](v3, "setTemperatureUnit:", v23);

    -[SASetAssistantData setVoiceOver:](v3, "setVoiceOver:", self->_voiceOverIsActive);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 manualEndpointingThreshold]);
    [v25 doubleValue];
    double v27 = v26 * 1000.0;

    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v27));
    -[SASetAssistantData setHoldToTalkThresholdInMilliseconds:](v3, "setHoldToTalkThresholdInMilliseconds:", v28);

    uint64_t v30 = AFCurrentUserInterfaceIdiom(v29);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    -[SASetAssistantData setUserInterfaceIdiom:](v3, "setUserInterfaceIdiom:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SASetAssistantData properties](v3, "properties"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 allKeys]);
    id v34 = [v33 mutableCopy];

    [v34 removeObject:SASetAssistantDataAnchorPListKey];
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    qos_class_t v36 = (void *)objc_claimAutoreleasedReturnValue([v32 objectsForKeys:v34 notFoundMarker:v35]);
    id v37 = sub_1001EBA84(v36);
    v38 = (NSString *)objc_claimAutoreleasedReturnValue(v37);
    unredactedAnchor = self->_unredactedAnchor;
    self->_unredactedAnchor = v38;

    qos_class_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[ADAssistantDataManager _redactedCopyMeCards:](self, "_redactedCopyMeCards:", self->_cachedMeCards));
    -[SASetAssistantData setMeCards:](v3, "setMeCards:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[SASetAssistantData properties](v3, "properties"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectsForKeys:v34 notFoundMarker:v35]);

    id v43 = sub_1001EBA84(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    -[SASetAssistantData setAnchor:](v3, "setAnchor:", v44);
    uint64_t v45 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v46 = self->_unredactedAnchor;
      int v50 = 136315650;
      v51 = "-[ADAssistantDataManager _generateAssistantData]";
      __int16 v52 = 2112;
      dispatch_time_t v53 = v44;
      __int16 v54 = 2112;
      v55 = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "%s SADanchor:%@\tunredacted:%@",  (uint8_t *)&v50,  0x20u);
    }

    cachedSAD = self->_cachedSAD;
    self->_cachedSAD = v3;
    v48 = v3;

    -[ADAssistantDataManager _notifyObserversOfSAD:](self, "_notifyObserversOfSAD:", self->_cachedSAD);
  }

  else
  {
    uint64_t v49 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v50 = 136315138;
      v51 = "-[ADAssistantDataManager _generateAssistantData]";
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "%s Not generating assistant data because we don't have some necessary cached data",  (uint8_t *)&v50,  0xCu);
    }
  }

- (void)_notifyObserversOfSAD:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_observers;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_block_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "assistantDataManager:didUpdateAssistantData:meCards:unredactedAnchor:") & 1) != 0) {
          [v10 assistantDataManager:self didUpdateAssistantData:v4 meCards:self->_cachedMeCards unredactedAnchor:self->_unredactedAnchor];
        }
        else {
          objc_msgSend(v10, "assistantDataManager:didUpdateAssistantData:", self, v4, (void)v11);
        }
      }

      id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (void)_notifyObserversOfDictationHIPAAMDMStatus
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1002EBE64;
  v2[3] = &unk_1004FB0E0;
  v2[4] = self;
  -[ADAssistantDataManager _fetchDictationHIPAAMDMStatus:](self, "_fetchDictationHIPAAMDMStatus:", v2);
}

- (void)_updateDictationAllowedStatus
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1002EBCA8;
  v2[3] = &unk_1004FB0E0;
  v2[4] = self;
  -[ADAssistantDataManager _fetchDictationAllowedStatus:](self, "_fetchDictationAllowedStatus:", v2);
}

- (void)_onMainThreadUpdateCountryCodeWithCountryConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2 object:self file:@"ADAssistantDataManager.m" lineNumber:913 description:@"called from non-main thread"];
  }

  uint64_t v9 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_group_t v19 = "-[ADAssistantDataManager _onMainThreadUpdateCountryCodeWithCountryConfiguration:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Updating country configuration for assistant data",  buf,  0xCu);
  }

  dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 countryCode]);
  if (!v10) {
    [v7 updateProvidersForCurrentCountry];
  }
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EBC0C;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v12 = v8;
  id v13 = v10;
  dispatch_async(queue, block);
}

- (id)_cachedAssistantData
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1002EB578;
  dispatch_block_t v10 = sub_1002EB588;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002EBBF8;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_unredactedMeCards
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1002EB578;
  dispatch_block_t v10 = sub_1002EB588;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002EBBC0;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_setAllowExplicitContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v5 setAllowExplicitContent:v3];

  self->_cachedAllowsExplicitContent = v3;
  -[ADAssistantDataManager _generateAssistantData](self, "_generateAssistantData");
}

- (void)_setAllowExplicitContentAndCensorSpeech:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v5 setAllowExplicitContent:v3];

  self->_cachedAllowsExplicitContent = v3;
  self->_cachedCensorSpeech = !v3;
  -[ADAssistantDataManager _generateAssistantData](self, "_generateAssistantData");
}

- (id)_mcQueue
{
  if (qword_1005784F0 != -1) {
    dispatch_once(&qword_1005784F0, &stru_1004FB128);
  }
  return (id)qword_1005784F8;
}

- (void)_fetchDictationHIPAAMDMStatus:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADAssistantDataManager _mcQueue](self, "_mcQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EBB38;
  block[3] = &unk_1004FC838;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)_fetchDictationAllowedStatus:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADAssistantDataManager _mcQueue](self, "_mcQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EBAF8;
  block[3] = &unk_1004FC838;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)_updateRestrictions:(id)a3
{
  id v13 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v48[0] = 0LL;
  v48[1] = v48;
  v48[2] = 0x2020000000LL;
  char v49 = 0;
  v46[0] = 0LL;
  v46[1] = v46;
  v46[2] = 0x2020000000LL;
  char v47 = 1;
  v44[0] = 0LL;
  v44[1] = v44;
  v44[2] = 0x2020000000LL;
  char v45 = 0;
  v43[0] = 0LL;
  v43[1] = v43;
  v43[2] = 0x2020000000LL;
  v43[3] = 0LL;
  v42[0] = 0LL;
  v42[1] = v42;
  v42[2] = 0x2020000000LL;
  v42[3] = 0LL;
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x2020000000LL;
  v41[3] = 0LL;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_1002EB578;
  v39[4] = sub_1002EB588;
  id v40 = 0LL;
  id v5 = dispatch_group_create();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADAssistantDataManager _mcQueue](self, "_mcQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EB590;
  block[3] = &unk_1004FB150;
  id v7 = v4;
  v32 = v7;
  v33 = v48;
  id v34 = v46;
  v35 = v44;
  qos_class_t v36 = v43;
  id v37 = v42;
  v38 = v41;
  dispatch_group_async(v5, v6, block);

  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  char v30 = 0;
  dispatch_group_enter(v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1002EB85C;
  v26[3] = &unk_1004FB178;
  id v28 = v29;
  uint64_t v9 = v5;
  double v27 = v9;
  [v8 fetchLocationAuthorization:v26];

  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002EB878;
  v14[3] = &unk_1004FB1A0;
  uint64_t v15 = v7;
  id v16 = self;
  dispatch_group_t v19 = v39;
  v20 = v48;
  v21 = v46;
  v22 = v44;
  v23 = v43;
  v24 = v42;
  v25 = v41;
  v18 = v29;
  id v17 = v13;
  id v11 = v13;
  id v12 = v7;
  dispatch_group_notify(v9, queue, v14);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
}

- (id)_cachedRestrictions
{
  cachedRestrictions = -[NSArray count](self->_cachedRestrictions, "count");
  if (cachedRestrictions) {
    cachedRestrictions = self->_cachedRestrictions;
  }
  return cachedRestrictions;
}

- (void)_updateVoice:(id)a3
{
  id v4 = a3;
  if ((sub_1001EA0D0() & 1) != 0)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1002EACAC;
    v28[3] = &unk_1004FB1C8;
    v28[4] = self;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1002EAD7C;
    v25[3] = &unk_1004FBFE8;
    id v5 = objc_retainBlock(v28);
    id v26 = v5;
    id v6 = v4;
    id v27 = v6;
    id v7 = objc_retainBlock(v25);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 inProgressOutputVoice]);

    if (v9)
    {
      dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 languageCode]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      id v12 = -[SiriTTSSynthesisVoice initWithLanguage:name:]( objc_alloc(&OBJC_CLASS___SiriTTSSynthesisVoice),  "initWithLanguage:name:",  v10,  v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SiriTTSDaemonSession afSharedSession](&OBJC_CLASS___SiriTTSDaemonSession, "afSharedSession"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1002EAF58;
      v17[3] = &unk_1004FB218;
      id v18 = v9;
      id v19 = v10;
      id v20 = v11;
      v21 = v12;
      v22 = v7;
      v23 = v5;
      id v24 = v6;
      __int128 v14 = v12;
      id v15 = v11;
      id v16 = v10;
      [v13 getSynthesisVoiceMatching:v14 reply:v17];
    }

    else
    {
      ((void (*)(void *))v7[2])(v7);
    }
  }

  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)_updateCallCapability:(id)a3
{
  id v4 = a3;
  if (qword_100578500 != -1) {
    dispatch_once(&qword_100578500, &stru_1004FB238);
  }
  id v5 = (dispatch_queue_s *)qword_100578508;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002EABAC;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateItunesStoreIdentifier:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = self->_cachedStoreFrontId;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v7 = v6;
  if (!v6)
  {
    id v11 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      v21 = "-[ADAssistantDataManager _updateItunesStoreIdentifier:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Unable to get the shared instance of ACAccountStore.",  (uint8_t *)&v20,  0xCu);
    }

- (void)_updateVoiceOverStatus:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
  if (v6)
  {
    int v9 = 136315138;
    dispatch_block_t v10 = "-[ADAssistantDataManager _updateVoiceOverStatus:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s VoiceOver status changed, updating assistant data",  (uint8_t *)&v9,  0xCu);
  }

  BOOL v7 = _AXSVoiceOverTouchEnabled(v6) != 0;
  BOOL v8 = self->_voiceOverIsActive != v7;
  self->_voiceOverIsActive = v7;
  v4[2](v4, v8);
}

- (void)localMeCardDidUpdate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002EAA9C;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)voiceOverIsActive
{
  return self->_voiceOverIsActive;
}

- (void)setVoiceOverIsActive:(BOOL)a3
{
  self->_voiceOverIsActive = a3;
}

- (ADAddressBookManager)_addressBookManager
{
  return self->_addressBookManager;
}

- (void).cxx_destruct
{
}

+ (id)sharedDataManager
{
  if (qword_1005784E8 != -1) {
    dispatch_once(&qword_1005784E8, &stru_1004FB090);
  }
  return (id)qword_1005784E0;
}

@end