@interface CSAttSiriSSRNode
- (BOOL)isReady;
- (BOOL)shouldCleanupVoiceProfile;
- (CSAsset)asset;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriSSRNode)init;
- (CSAttSiriSSRNode)initWithAttSiriController:(id)a3;
- (CSAttSiriSSRNode)initWithDownloadMonitor:(id)a3 assetHandler:(id)a4;
- (CSAudioFileWriter)leadingUtteranceLogger;
- (CSAudioRecordContext)audioRecordContext;
- (CSConnectionListener)localSRBridgeListener;
- (CSConnectionListener)ssrListener;
- (CSSpeakerRecognitionAssetDownloadMonitor)downloadMonitor;
- (CSVoiceTriggerAssetHandler)assetHandler;
- (NSArray)requiredNodes;
- (NSArray)ssrAssets;
- (NSDictionary)speakerRecognitionScores;
- (NSDictionary)voiceTriggerEventInfo;
- (NSHashTable)receivers;
- (NSSet)sharedUserIdsSet;
- (NSString)leadingUtteranceAudioFile;
- (NSString)mhId;
- (NSString)requestId;
- (OS_dispatch_queue)queue;
- (SSRSpeakerRecognitionController)ssrController;
- (SSRVoiceProfile)ccProfile;
- (SSRVoiceProfileManager)voiceProfileManager;
- (id)_mapScoresToSharedSiriId:(id)a3;
- (id)_processSpeakerRecognitionResult:(id)a3;
- (id)filteredVoiceProfileArray:(id)a3;
- (id)getLeadingUtteranceLogger;
- (id)getSharedUserIdWithHighestVoiceIdScore:(id)a3;
- (unint64_t)type;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5;
- (void)_logSpeakerFalseTriggerMitigationScore:(id)a3 withSpeakerMatchScore:(float)a4 withSpeakerScoreThreshold:(float)a5 withAudioDuration:(double)a6 withSuccess:(BOOL)a7;
- (void)_refreshSpeakerRecognitionAssets;
- (void)_reportNoAudioProcessed;
- (void)_setupLeadingUtteranceLogger;
- (void)_setupSSRControllerWithAudioContext:(id)a3 withVoiceTriggerEventInfo:(id)a4;
- (void)_setupSpeakerRecognitionForFollowUp:(id)a3 withVoiceTriggerInfo:(id)a4;
- (void)_setupSpeakerRecognitionForProfiles:(id)a3 WithVTEventInfo:(id)a4 WithLocale:(id)a5;
- (void)_setupWithDownloadMonitor:(id)a3 assetHandler:(id)a4;
- (void)_stopProcessing;
- (void)addReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)cacheSharedUserInfos:(id)a3;
- (void)handleSiriSessionEnd;
- (void)logSpeakerFalseTriggerMitigationScore:(float)a3 withAudioDuration:(double)a4;
- (void)removeReceiver:(id)a3;
- (void)resetForNewRequestWithRecordContext:(id)a3 voiceTriggerInfo:(id)a4 withReqId:(id)a5;
- (void)setAsset:(id)a3;
- (void)setAssetHandler:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setCcProfile:(id)a3;
- (void)setDownloadMonitor:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLeadingUtteranceAudioFile:(id)a3;
- (void)setLeadingUtteranceLogger:(id)a3;
- (void)setLocalSRBridgeListener:(id)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setSharedUserIdsSet:(id)a3;
- (void)setShouldCleanupVoiceProfile:(BOOL)a3;
- (void)setSpeakerRecognitionScores:(id)a3;
- (void)setSsrAssets:(id)a3;
- (void)setSsrController:(id)a3;
- (void)setSsrListener:(id)a3;
- (void)setUpSpeakerProfileForFlexibleFollowup;
- (void)setVoiceProfileManager:(id)a3;
- (void)setVoiceTriggerEventInfo:(id)a3;
- (void)speakerRecognitionController:(id)a3 hasSpeakerInfo:(id)a4;
- (void)speakerRecognitionFinishedProcessing:(id)a3 withFinalSpeakerInfo:(id)a4;
- (void)startXPCConnection;
- (void)stop;
@end

@implementation CSAttSiriSSRNode

- (CSAttSiriSSRNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSAttSiriSSRNode;
  v2 = -[CSAttSiriSSRNode init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeakerRecognitionAssetDownloadMonitor sharedInstance]( &OBJC_CLASS___CSSpeakerRecognitionAssetDownloadMonitor,  "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAssetHandler sharedHandler]( &OBJC_CLASS___CSVoiceTriggerAssetHandler,  "sharedHandler"));
    -[CSAttSiriSSRNode _setupWithDownloadMonitor:assetHandler:](v2, "_setupWithDownloadMonitor:assetHandler:", v3, v4);
  }

  return v2;
}

- (CSAttSiriSSRNode)initWithDownloadMonitor:(id)a3 assetHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSAttSiriSSRNode;
  v8 = -[CSAttSiriSSRNode init](&v11, "init");
  v9 = v8;
  if (v8) {
    -[CSAttSiriSSRNode _setupWithDownloadMonitor:assetHandler:](v8, "_setupWithDownloadMonitor:assetHandler:", v6, v7);
  }

  return v9;
}

- (CSAttSiriSSRNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = -[CSAttSiriSSRNode init](self, "init");
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (void)_setupWithDownloadMonitor:(id)a3 assetHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    v8 = (CSSpeakerRecognitionAssetDownloadMonitor *)v6;
  }
  else {
    v8 = (CSSpeakerRecognitionAssetDownloadMonitor *)objc_claimAutoreleasedReturnValue( +[CSSpeakerRecognitionAssetDownloadMonitor sharedInstance]( &OBJC_CLASS___CSSpeakerRecognitionAssetDownloadMonitor,  "sharedInstance"));
  }
  downloadMonitor = self->_downloadMonitor;
  self->_downloadMonitor = v8;

  if (v7) {
    v10 = (CSVoiceTriggerAssetHandler *)v7;
  }
  else {
    v10 = (CSVoiceTriggerAssetHandler *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAssetHandler sharedHandler]( &OBJC_CLASS___CSVoiceTriggerAssetHandler,  "sharedHandler"));
  }
  assetHandler = self->_assetHandler;
  self->_assetHandler = v10;

  requiredNodes = self->_requiredNodes;
  self->_type = 10LL;
  self->_requiredNodes = (NSArray *)&off_1002391D0;

  v13 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  receivers = self->_receivers;
  self->_receivers = v13;

  self->_isReady = 0;
  id v16 = objc_msgSend((id)objc_opt_class(self, v15), "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  v17,  kCSDefaultSerialQueueFixedPriority));
  queue = self->_queue;
  self->_queue = v18;

  -[CSSpeakerRecognitionAssetDownloadMonitor addObserver:](self->_downloadMonitor, "addObserver:", self);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSLanguageCodeUpdateMonitor sharedInstance]( &OBJC_CLASS___CSLanguageCodeUpdateMonitor,  "sharedInstance"));
  [v20 addObserver:self];

  v21 = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026F40;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(v21, block);
}

- (void)resetForNewRequestWithRecordContext:(id)a3 voiceTriggerInfo:(id)a4 withReqId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100026EC8;
  v15[3] = &unk_10022E368;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)stop
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026E08;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100026CC4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100026C84;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100026B74;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)filteredVoiceProfileArray:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_10022A640));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v5]);

    id v7 = [v6 count];
    id v8 = [v4 count];

    self->_shouldCleanupVoiceProfile = v7 < v8;
    id v9 = (os_log_s *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      id v12 = "-[CSAttSiriSSRNode filteredVoiceProfileArray:]";
      __int16 v13 = 2048;
      BOOL v14 = v7 < v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s _shouldCleanupVoiceProfile: %lu",  (uint8_t *)&v11,  0x16u);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)cacheSharedUserInfos:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100026AC0;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)getSharedUserIdWithHighestVoiceIdScore:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    if ([v5 count] == (id)1)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    }

    else
    {
      uint64_t v12 = 0LL;
      __int16 v13 = &v12;
      uint64_t v14 = 0x3032000000LL;
      uint64_t v15 = sub_1000253C0;
      id v16 = sub_1000253D0;
      id v17 = 0LL;
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100026918;
      block[3] = &unk_10022D958;
      block[4] = self;
      id v10 = v5;
      int v11 = &v12;
      dispatch_async_and_wait(queue, block);
      id v6 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setUpSpeakerProfileForFlexibleFollowup
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026868;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)handleSiriSessionEnd
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000266C0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setupSSRControllerWithAudioContext:(id)a3 withVoiceTriggerEventInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((CSIsCommunalDevice() & 1) != 0
    || ([v6 isContinuousConversation] & 1) != 0
    || [v6 isBuiltInVoiceTriggered])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
    ssrAssets = self->_ssrAssets;
    if (ssrAssets)
    {
      id v10 = (CSAsset *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](ssrAssets, "firstObject"));
      asset = self->_asset;
      self->_asset = v10;

      uint64_t v12 = (void *)CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = self->_asset;
        uint64_t v14 = v12;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset configVersion](v13, "configVersion"));
        int v29 = 136315394;
        v30 = "-[CSAttSiriSSRNode _setupSSRControllerWithAudioContext:withVoiceTriggerEventInfo:]";
        __int16 v31 = 2114;
        v32 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Asset Vers: %{public}@",  (uint8_t *)&v29,  0x16u);
      }

      unsigned int v16 = [v6 isContinuousConversation];
      id v17 = (SSRVoiceProfileManager *)objc_claimAutoreleasedReturnValue( +[SSRVoiceProfileManager sharedInstance]( &OBJC_CLASS___SSRVoiceProfileManager,  "sharedInstance"));
      voiceProfileManager = self->_voiceProfileManager;
      self->_voiceProfileManager = v17;

      uint64_t v19 = CSIsCommunalDevice();
      if ((v19 & 1) != 0
        || ((CSIsIOS(v19, v20) & 1) != 0 || CSIsAppleSiliconMac())
        && (([v6 isBuiltInVoiceTriggered] & 1) != 0
         || [v6 isDarwinVoiceTriggered]))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue( -[SSRVoiceProfileManager provisionedVoiceProfilesForAppDomain:withLocale:]( self->_voiceProfileManager,  "provisionedVoiceProfilesForAppDomain:withLocale:",  SSRSpeakerRecognitionSiriAppDomain,  v8));
        v22 = v21;
        if (v21 && [v21 count])
        {
          if (CSIsCommunalDevice())
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue(-[CSAttSiriSSRNode filteredVoiceProfileArray:](self, "filteredVoiceProfileArray:", v22));

            v22 = (void *)v23;
          }

          if (CSIsInternalBuild())
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue( -[SSRVoiceProfileManager provisionedVoiceProfilesForAppDomain:withLocale:]( self->_voiceProfileManager,  "provisionedVoiceProfilesForAppDomain:withLocale:",  SSRSpeakerRecognitionSiriDebugAppDomain,  v8));
            if (v24)
            {
              uint64_t v25 = objc_claimAutoreleasedReturnValue([v22 arrayByAddingObjectsFromArray:v24]);

              v22 = (void *)v25;
            }
          }

          -[CSAttSiriSSRNode _setupSpeakerRecognitionForProfiles:WithVTEventInfo:WithLocale:]( self,  "_setupSpeakerRecognitionForProfiles:WithVTEventInfo:WithLocale:",  v22,  v7,  v8);
        }

        else
        {
          v27 = (os_log_s *)CSLogCategorySpkrId;
          if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
          {
            int v29 = 136315394;
            v30 = "-[CSAttSiriSSRNode _setupSSRControllerWithAudioContext:withVoiceTriggerEventInfo:]";
            __int16 v31 = 2114;
            v32 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s Voice Profiles not present for %{public}@ - Bailing out",  (uint8_t *)&v29,  0x16u);
          }
        }
      }

      else
      {
        v28 = (os_log_s *)CSLogCategorySpkrId;
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 136315394;
          v30 = "-[CSAttSiriSSRNode _setupSSRControllerWithAudioContext:withVoiceTriggerEventInfo:]";
          __int16 v31 = 1024;
          LODWORD(v32) = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s isCurReqTriggerFreeFollowOn:%u",  (uint8_t *)&v29,  0x12u);
        }

        if (v16) {
          -[CSAttSiriSSRNode _setupSpeakerRecognitionForFollowUp:withVoiceTriggerInfo:]( self,  "_setupSpeakerRecognitionForFollowUp:withVoiceTriggerInfo:",  v8,  v7);
        }
      }
    }

    else
    {
      v26 = (os_log_s *)CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136315394;
        v30 = "-[CSAttSiriSSRNode _setupSSRControllerWithAudioContext:withVoiceTriggerEventInfo:]";
        __int16 v31 = 2114;
        v32 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s SSR Assets is nil for %{public}@ - Bailing out",  (uint8_t *)&v29,  0x16u);
      }
    }
  }
}

- (void)_setupSpeakerRecognitionForFollowUp:(id)a3 withVoiceTriggerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SSRVoiceProfileManager provisionedVoiceProfilesForAppDomain:withLocale:]( self->_voiceProfileManager,  "provisionedVoiceProfilesForAppDomain:withLocale:",  SSRSpeakerRecognitionSiriCCAppDomain,  v6));
  id v9 = v8;
  if (v8 && [v8 count])
  {
    -[CSAttSiriSSRNode _setupSpeakerRecognitionForProfiles:WithVTEventInfo:WithLocale:]( self,  "_setupSpeakerRecognitionForProfiles:WithVTEventInfo:WithLocale:",  v9,  v7,  v6);
  }

  else
  {
    id v10 = (os_log_s *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[CSAttSiriSSRNode _setupSpeakerRecognitionForFollowUp:withVoiceTriggerInfo:]";
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Voice Profiles not present for Continuous Conversation for %{public}@ - Bailing out",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)_setupLeadingUtteranceLogger
{
  ccProfile = self->_ccProfile;
  if (ccProfile)
  {
    id v4 = (os_log_s *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CSAttSiriSSRNode _setupLeadingUtteranceLogger]";
      __int16 v31 = 2114;
      v32 = ccProfile;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s magus voice profile - %{public}@",  buf,  0x16u);
    }
  }

  voiceProfileManager = self->_voiceProfileManager;
  if (!voiceProfileManager || !self->_asset)
  {
    id v6 = (SSRVoiceProfileManager *)objc_claimAutoreleasedReturnValue( +[SSRVoiceProfileManager sharedInstance]( &OBJC_CLASS___SSRVoiceProfileManager,  "sharedInstance"));
    id v7 = self->_voiceProfileManager;
    self->_voiceProfileManager = v6;

    id v8 = (CSAsset *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_ssrAssets, "firstObject"));
    asset = self->_asset;
    self->_asset = v8;

    id v10 = (void *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = self->_asset;
      uint64_t v12 = v10;
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset configVersion](v11, "configVersion"));
      *(_DWORD *)buf = 136315394;
      v30 = "-[CSAttSiriSSRNode _setupLeadingUtteranceLogger]";
      __int16 v31 = 2114;
      v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Asset Vers: %{public}@", buf, 0x16u);
    }

    voiceProfileManager = self->_voiceProfileManager;
  }

  uint64_t v14 = SSRSpeakerRecognitionSiriCCAppDomain;
  -[SSRVoiceProfileManager deleteAllVoiceProfilesForAppDomain:]( voiceProfileManager,  "deleteAllVoiceProfilesForAppDomain:",  SSRSpeakerRecognitionSiriCCAppDomain);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[SSRVoiceProfileManager getCacheDirectoryForAppDomain:]( self->_voiceProfileManager,  "getCacheDirectoryForAppDomain:",  v14));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:v17]);
  uint64_t v19 = (NSString *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathExtension:@"wav"]);
  leadingUtteranceAudioFile = self->_leadingUtteranceAudioFile;
  self->_leadingUtteranceAudioFile = v19;

  v21 = objc_alloc(&OBJC_CLASS___CSPlainAudioFileWriter);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", self->_leadingUtteranceAudioFile));
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInt16ASBD");
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInt16ASBD");
  uint64_t v23 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:]( v21,  "initWithURL:inputFormat:outputFormat:",  v22,  v28,  &v27);
  leadingUtteranceLogger = self->_leadingUtteranceLogger;
  self->_leadingUtteranceLogger = v23;

  uint64_t v25 = (os_log_s *)CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
  {
    v26 = self->_leadingUtteranceAudioFile;
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSAttSiriSSRNode _setupLeadingUtteranceLogger]";
    __int16 v31 = 2114;
    v32 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s Recording leading utterance - %{public}@",  buf,  0x16u);
  }
}

- (void)_setupSpeakerRecognitionForProfiles:(id)a3 WithVTEventInfo:(id)a4 WithLocale:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = -[CSAudioRecordContext isBuiltInVoiceTriggered]( self->_audioRecordContext,  "isBuiltInVoiceTriggered");
  float v12 = 4.0;
  if (v11)
  {
    if (v9)
    {
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kVTEItriggerEndSeconds]);
      [v13 floatValue];
      float v12 = v14 + 4.0;
    }

    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v15 = 1LL;
  }

  unsigned int v16 = (void *)CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      id v17 = @"VT";
    }
    else {
      id v17 = @"BP";
    }
    id v18 = v16;
    *(_DWORD *)buf = 136316162;
    v41 = "-[CSAttSiriSSRNode _setupSpeakerRecognitionForProfiles:WithVTEventInfo:WithLocale:]";
    __int16 v42 = 2114;
    v43 = v17;
    __int16 v44 = 2114;
    id v45 = v10;
    __int16 v46 = 2050;
    id v47 = [v8 count];
    __int16 v48 = 2050;
    double v49 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Setting up SSR controller with {%{public}@, %{public}@, %{public}ldusers, %{public}fsecs}",  buf,  0x34u);
  }

  if ((SSRShouldUseTDTIWithAsset(self->_asset) & 1) != 0) {
    uint64_t v19 = 1LL;
  }
  else {
    uint64_t v19 = (uint64_t)-[CSAudioRecordContext isContinuousConversation]( self->_audioRecordContext,  "isContinuousConversation");
  }
  v38[0] = SSRSpeakerRecognitionStyleKey;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
  v39[0] = v20;
  v39[1] = v10;
  v38[1] = SSRSpeakerRecognitionLocaleKey;
  v38[2] = SSRSpeakerRecognitionUsePayloadProfileKey;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
  v39[2] = v21;
  v39[3] = v8;
  v38[3] = SSRSpeakerRecognitionProfileArrayKey;
  v38[4] = SSRSpeakerRecognitionVTEventInfoKey;
  uint64_t v23 = &__NSDictionary0__struct;
  if (v9) {
    uint64_t v23 = v9;
  }
  v39[4] = v23;
  v38[5] = SSRSpeakerRecognitionMaxAudioDurationSecs;
  *(float *)&double v22 = v12;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v22));
  v39[5] = v24;
  v39[6] = &__kCFBooleanFalse;
  v38[6] = SSRSpeakerRecognitionOSTransactionRequired;
  v38[7] = SSRSpeakerRecognitionAssetArrayKey;
  v39[7] = self->_ssrAssets;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  8LL));

  id v37 = 0LL;
  v26 = -[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]( objc_alloc(&OBJC_CLASS___SSRSpeakerRecognitionContext),  "initWithVoiceRecognitionContext:error:",  v25,  &v37);
  id v27 = v37;
  id v28 = v27;
  if (!v26 || v27)
  {
    v35 = (void *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
    {
      v32 = v35;
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 localizedDescription]);
      *(_DWORD *)buf = 136315394;
      v41 = "-[CSAttSiriSSRNode _setupSpeakerRecognitionForProfiles:WithVTEventInfo:WithLocale:]";
      __int16 v42 = 2112;
      v43 = v33;
      v34 = "%s ERR: Failed to create SSR context with error %@";
      goto LABEL_26;
    }

- (void)_refreshSpeakerRecognitionAssets
{
  if ((CSIsIOS(self, a2) & 1) != 0 || CSIsAppleSiliconMac())
  {
    assetHandler = self->_assetHandler;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10002649C;
    v17[3] = &unk_10022E340;
    v17[4] = self;
    -[CSVoiceTriggerAssetHandler getVoiceTriggerAssetWithEndpointId:completion:]( assetHandler,  "getVoiceTriggerAssetWithEndpointId:completion:",  0LL,  v17);
    return;
  }

  if ((CSIsCommunalDevice() & 1) != 0
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences")),
        unsigned int v5 = [v4 isFlexibleFollowupsSupported],
        v4,
        v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
    if (CSIsCommunalDevice())
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSRAssetManager sharedManager](&OBJC_CLASS___SSRAssetManager, "sharedManager"));
      id v8 = (NSArray *)objc_claimAutoreleasedReturnValue([v7 allInstalledSpeakerRecognitionAssetsForLanguage:v6]);
      ssrAssets = self->_ssrAssets;
      self->_ssrAssets = v8;

      id v10 = (os_log_s *)CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = self->_ssrAssets;
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "-[CSAttSiriSSRNode _refreshSpeakerRecognitionAssets]";
        __int16 v20 = 2114;
        v21 = v11;
        float v12 = "%s Initialized SSRNode with SpeakerRecognition assets %{public}@";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
      }
    }

    else
    {
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
      float v14 = (NSArray *)objc_claimAutoreleasedReturnValue([v13 allInstalledAssetsOfType:0 language:v6]);
      uint64_t v15 = self->_ssrAssets;
      self->_ssrAssets = v14;

      id v10 = (os_log_s *)CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = self->_ssrAssets;
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "-[CSAttSiriSSRNode _refreshSpeakerRecognitionAssets]";
        __int16 v20 = 2114;
        v21 = v16;
        float v12 = "%s Initialized SSRNode with VoiceTrigger assets %{public}@";
        goto LABEL_11;
      }
    }
  }

- (id)_processSpeakerRecognitionResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  uint64_t v6 = kSSRSpeakerRecognitionKnownUserScoresKey;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserScoresKey]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSSRNode _mapScoresToSharedSiriId:](self, "_mapScoresToSharedSiriId:", v7));
  if (v8 && [v8 count])
  {
    id v9 = &OBJC_IVAR___CSSiriAudioMessageFileRetainLock__requestId;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:]( &OBJC_CLASS___CSUserIdentityClassifier,  "pickTopScoringProfileIdFromScores:",  v8));
    if (v10)
    {
      [v5 setObject:v10 forKeyedSubscript:@"userClassified"];
    }

    else
    {
      __int16 v13 = (os_log_s *)CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
      {
        int v37 = 136315394;
        v38 = "-[CSAttSiriSSRNode _processSpeakerRecognitionResult:]";
        __int16 v39 = 2114;
        *(void *)v40 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to get classified user from %{public}@",  (uint8_t *)&v37,  0x16u);
      }
    }

    uint64_t v14 = kVTEITriggeredPhId;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_voiceTriggerEventInfo, "objectForKey:", kVTEITriggeredPhId));
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber, v16);
    if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_voiceTriggerEventInfo, "objectForKey:", v14));
      id v19 = [v18 integerValue];

      id v9 = &OBJC_IVAR___CSSiriAudioMessageFileRetainLock__requestId;
    }

    else
    {
      id v19 = 0LL;
    }

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 + 626 classifyUserIdentityFor:v10 withScores:v8 withAsset:self->_asset withPhId:v19]));
    [v5 setObject:v20 forKeyedSubscript:@"userIdentityClassification"];

    [v5 setObject:v8 forKeyedSubscript:v6];
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CSAsset multiUserLowScoreThresholdForPhId:]( self->_asset,  "multiUserLowScoreThresholdForPhId:",  v19)));
    [v5 setObject:v21 forKeyedSubscript:kSSRSpeakerRecognitionLowScoreThresholdKey];

    double v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CSAsset multiUserHighScoreThresholdForPhId:]( self->_asset,  "multiUserHighScoreThresholdForPhId:",  v19)));
    [v5 setObject:v22 forKeyedSubscript:kSSRSpeakerRecognitionHighScoreThresholdKey];

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CSAsset multiUserConfidentScoreThresholdForPhId:]( self->_asset,  "multiUserConfidentScoreThresholdForPhId:",  v19)));
    [v5 setObject:v23 forKeyedSubscript:kSSRSpeakerRecognitionConfidentScoreThresholdKey];

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CSAsset multiUserDeltaScoreThresholdForPhId:]( self->_asset,  "multiUserDeltaScoreThresholdForPhId:",  v19)));
    [v5 setObject:v24 forKeyedSubscript:kSSRSpeakerRecognitionDeltaScoreThresholdKey];

    uint64_t v25 = (void *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = kSSRSpeakerRecognitionSegmentCounterKey;
      id v27 = v25;
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v26]);
      unsigned int v29 = [v28 intValue];
      v30 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSSRSpeakerRecognitionSegmentStartTimeKey]);
      [v30 floatValue];
      double v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSSRSpeakerRecognitionAudioProcessedDurationKey]);
      unsigned int v34 = [v33 intValue];
      v35 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
      int v37 = 136316162;
      v38 = "-[CSAttSiriSSRNode _processSpeakerRecognitionResult:]";
      __int16 v39 = 1026;
      *(_DWORD *)v40 = v29;
      *(_WORD *)&v40[4] = 2050;
      *(double *)&v40[6] = v32;
      __int16 v41 = 1024;
      unsigned int v42 = v34;
      __int16 v43 = 2114;
      __int16 v44 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s mappedSpeakerIdInfo for {%{public}d, %{public}.2fsec %dms} - %{public}@",  (uint8_t *)&v37,  0x2Cu);
    }

    id v12 = v5;
  }

  else
  {
    unsigned int v11 = (os_log_s *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 136315138;
      v38 = "-[CSAttSiriSSRNode _processSpeakerRecognitionResult:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Nil mappedSpeakerIdInfo since mappedScores is not valid, no score will be sent out",  (uint8_t *)&v37,  0xCu);
    }

    id v12 = 0LL;
  }

  return v12;
}

- (id)_mapScoresToSharedSiriId:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    uint64_t v5 = (uint64_t)[v4 count];
  }
  else {
    uint64_t v5 = 1LL;
  }
  id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v5));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  __int16 v46 = (void *)objc_claimAutoreleasedReturnValue([v6 readSpeakerIdScoreOverrrideConfig]);

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v52;
    *(void *)&__int128 v9 = 136315650LL;
    __int128 v45 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v7);
        }
        __int16 v13 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13, v45));
        [v14 floatValue];
        float v16 = v15;

        if (v16 <= 1.0) {
          float v17 = v16;
        }
        else {
          float v17 = 1.0;
        }
        if (v17 < 0.0) {
          float v17 = 0.0;
        }
        id v18 = (id)(int)vcvtpd_s64_f64(v17 * 100.0);
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[SSRVoiceProfileManager voiceProfileForId:]( self->_voiceProfileManager,  "voiceProfileForId:",  v13));
        __int16 v20 = v19;
        if (v19)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v19 siriProfileId]);

          if (v21)
          {
            if (CSIsInternalBuild())
            {
              if (v46)
              {
                double v22 = (void *)objc_claimAutoreleasedReturnValue([v20 siriProfileId]);
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:v22]);

                if (v23)
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue([v20 siriProfileId]);
                  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:v24]);

                  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber, v26);
                  if ((objc_opt_isKindOfClass(v25, v27) & 1) != 0)
                  {
                    id v18 = [v25 integerValue];
                    id v28 = (void *)CSLogCategorySpkrId;
                    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned int v29 = v28;
                      v30 = (void *)objc_claimAutoreleasedReturnValue([v20 siriProfileId]);
                      *(_DWORD *)buf = v45;
                      v58 = "-[CSAttSiriSSRNode _mapScoresToSharedSiriId:]";
                      __int16 v59 = 2112;
                      v60 = v25;
                      __int16 v61 = 2112;
                      v62 = v30;
                      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s Overriding score to %@ for profile %@",  buf,  0x20u);
                    }
                  }
                }
              }
            }

            float v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
            double v32 = (void *)objc_claimAutoreleasedReturnValue([v20 siriProfileId]);
            [v47 setObject:v31 forKey:v32];

            goto LABEL_31;
          }

          id v36 = (os_log_s *)CSLogCategorySpkrId;
          if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v58 = "-[CSAttSiriSSRNode _mapScoresToSharedSiriId:]";
            __int16 v59 = 2112;
            v60 = v13;
            unsigned int v34 = v36;
            v35 = "%s Siri Profile ID for profileID %@ not found";
            goto LABEL_28;
          }
        }

        else
        {
          v33 = (os_log_s *)CSLogCategorySpkrId;
          if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v58 = "-[CSAttSiriSSRNode _mapScoresToSharedSiriId:]";
            __int16 v59 = 2112;
            v60 = v13;
            unsigned int v34 = v33;
            v35 = "%s Voice Profile for profileID %@ not found";
LABEL_28:
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0x16u);
          }
        }

        if ((CSIsTV() & 1) != 0) {
          goto LABEL_32;
        }
        float v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
        [v47 setObject:v31 forKey:v13];
LABEL_31:

LABEL_32:
      }

      id v10 = [v7 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }

    while (v10);
  }

  int v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10002638C;
  v48[3] = &unk_10022A688;
  v48[4] = self;
  __int16 v39 = v37;
  double v49 = v39;
  v40 = v38;
  v50 = v40;
  [v47 enumerateKeysAndObjectsUsingBlock:v48];
  if (-[NSMutableDictionary count](v40, "count"))
  {
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    v55[0] = @"valid_scores";
    v55[1] = @"invalid_scores";
    v56[0] = v39;
    v56[1] = v40;
    unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  2LL));
    [v41 logEventWithType:6115 context:v42];
  }

  id v43 = -[NSMutableDictionary copy](v39, "copy");

  return v43;
}

- (void)_stopProcessing
{
  leadingUtteranceLogger = self->_leadingUtteranceLogger;
  if (!leadingUtteranceLogger)
  {
LABEL_17:
    if (self->_shouldCleanupVoiceProfile)
    {
      uint64_t v25 = (os_log_s *)CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[CSAttSiriSSRNode _stopProcessing]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s trigger VoiceProfileCleanup", buf, 0xCu);
      }

      self->_shouldCleanupVoiceProfile = 0;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSRVoiceProfileManager sharedInstance](&OBJC_CLASS___SSRVoiceProfileManager, "sharedInstance"));
      [v26 triggerVoiceProfileCleanupWithCompletion:&stru_10022A6A8];
    }

    -[CSAttSiriSSRNode _reportNoAudioProcessed](self, "_reportNoAudioProcessed");
    return;
  }

  self->_leadingUtteranceLogger = 0LL;

  voiceProfileManager = self->_voiceProfileManager;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  uint64_t v6 = (SSRVoiceProfile *)-[SSRVoiceProfileManager newVoiceProfileWithLocale:withAppDomain:]( voiceProfileManager,  "newVoiceProfileWithLocale:withAppDomain:",  v5,  SSRSpeakerRecognitionSiriCCAppDomain);
  ccProfile = self->_ccProfile;
  self->_ccProfile = v6;

  id v8 = self->_ccProfile;
  if (v8)
  {
    asset = self->_asset;
    if (asset)
    {
      v37[0] = SSRVoiceRetrainingVoiceProfileKey;
      v37[1] = SSRVoiceRetrainingPayloadProfileKey;
      v38[0] = v8;
      v38[1] = &__kCFBooleanTrue;
      v37[2] = SSRVoiceRetrainingAssetKey;
      v38[2] = asset;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));
      id v35 = 0LL;
      id v11 = [[SSRVoiceProfileRetrainingContext alloc] initWithVoiceRetrainingContext:v10 error:&v35];
      id v12 = (CSAsset *)v35;
      if (v12)
      {
        __int16 v13 = v12;
        uint64_t v14 = (void *)CSLogCategorySpkrId;
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = self->_ccProfile;
          id v28 = v14;
          unsigned int v29 = (SSRVoiceProfile *)objc_claimAutoreleasedReturnValue(-[SSRVoiceProfile profileID](v27, "profileID"));
          *(_DWORD *)buf = 136315650;
          v40 = "-[CSAttSiriSSRNode _stopProcessing]";
          __int16 v41 = 2114;
          unsigned int v42 = v29;
          __int16 v43 = 2114;
          __int16 v44 = v13;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to init retrainCtxt for profileID %{public}@ with error %{public}@",  buf,  0x20u);
        }

        return;
      }

      float v17 = (void *)CSLogCategorySpkrId;
      if (self->_leadingUtteranceAudioFile)
      {
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = self->_ccProfile;
          id v19 = v17;
          __int16 v20 = (SSRVoiceProfile *)objc_claimAutoreleasedReturnValue(-[SSRVoiceProfile profileID](v18, "profileID"));
          *(_DWORD *)buf = 136315394;
          v40 = "-[CSAttSiriSSRNode _stopProcessing]";
          __int16 v41 = 2114;
          unsigned int v42 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s Creating Continuous Conversation voice profile %{public}@",  buf,  0x16u);
        }

        objc_initWeak((id *)buf, self);
        v21 = self->_voiceProfileManager;
        double v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  self->_leadingUtteranceAudioFile));
        id v36 = v22;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
        v24 = self->_ccProfile;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_100026130;
        v33[3] = &unk_10022E708;
        objc_copyWeak(&v34, (id *)buf);
        -[SSRVoiceProfileManager addUtterances:toProfile:withContext:withCompletion:]( v21,  "addUtterances:toProfile:withContext:withCompletion:",  v23,  v24,  v11,  v33);

        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);
      }

      else if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
      {
        v30 = self->_ccProfile;
        float v31 = v17;
        double v32 = (SSRVoiceProfile *)objc_claimAutoreleasedReturnValue(-[SSRVoiceProfile profileID](v30, "profileID"));
        *(_DWORD *)buf = 136315394;
        v40 = "-[CSAttSiriSSRNode _stopProcessing]";
        __int16 v41 = 2114;
        unsigned int v42 = v32;
        _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to add utterance to profileID %{public}@ because the audio file couldn't be found",  buf,  0x16u);
      }

      goto LABEL_17;
    }
  }

  float v15 = (os_log_s *)CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
  {
    float v16 = self->_asset;
    *(_DWORD *)buf = 136315650;
    v40 = "-[CSAttSiriSSRNode _stopProcessing]";
    __int16 v41 = 2114;
    unsigned int v42 = v8;
    __int16 v43 = 2114;
    __int16 v44 = v16;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to retrain voice profile %{public}@ with asset %{public}@",  buf,  0x20u);
  }

- (void)_reportNoAudioProcessed
{
  if (CSIsHorseman(self, a2))
  {
    speakerRecognitionScores = self->_speakerRecognitionScores;
    if (!speakerRecognitionScores
      || (id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( speakerRecognitionScores,  "objectForKeyedSubscript:",  kSSRSpeakerRecognitionAudioProcessedDurationKey)),  v5 = [v4 intValue],  v4,  !v5))
    {
      uint64_t v6 = (os_log_s *)CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        __int128 v9 = "-[CSAttSiriSSRNode _reportNoAudioProcessed]";
        __int16 v10 = 1024;
        int v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Reporting no audio processed for speaker recognition: %ims",  (uint8_t *)&v8,  0x12u);
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
      [v7 submitVoiceIdIssueReport:kCSDiagnosticReporterVoiceIdNoAudioProcessed];
    }
  }

- (void)startXPCConnection
{
  v2 = (os_log_s *)CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[CSAttSiriSSRNode startXPCConnection]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s XPC connection with client established",  (uint8_t *)&v3,  0xCu);
  }

- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002606C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)speakerRecognitionController:(id)a3 hasSpeakerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v6 && v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100025A68;
    block[3] = &unk_10022EA98;
    block[4] = self;
    id v13 = v6;
    id v14 = v8;
    dispatch_async(queue, block);
  }

  else
  {
    if (!v6 && (__int16 v10 = (os_log_s *)CSLogCategorySpkrId, os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315138;
      float v16 = "-[CSAttSiriSSRNode speakerRecognitionController:hasSpeakerInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s spkrRecognizer is nil!", buf, 0xCu);
      if (v8) {
        goto LABEL_9;
      }
    }

    else if (v8)
    {
      goto LABEL_9;
    }

    int v11 = (os_log_s *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      float v16 = "-[CSAttSiriSSRNode speakerRecognitionController:hasSpeakerInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s speakerInfo is nil!", buf, 0xCu);
    }
  }

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[CSAttSiriSSRNode CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s _currentLanguageCode changed: %{public}@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025A60;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)speakerRecognitionFinishedProcessing:(id)a3 withFinalSpeakerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000255C4;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025514;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100025444;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)logSpeakerFalseTriggerMitigationScore:(float)a3 withAudioDuration:(double)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000253EC;
  block[3] = &unk_10022A6D0;
  block[4] = self;
  float v6 = a3;
  *(double *)&void block[5] = a4;
  dispatch_async(queue, block);
}

- (void)_logSpeakerFalseTriggerMitigationScore:(id)a3 withSpeakerMatchScore:(float)a4 withSpeakerScoreThreshold:(float)a5 withAudioDuration:(double)a6 withSuccess:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  if (self->_mhId)
  {
    id v13 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    id v14 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", self->_mhId);
    id v15 = [v13 initWithNSUUID:v14];

    id v16 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHSpeakerFalseTriggerMitigated);
    [v16 setModelVersion:v12];
    *(float *)&double v17 = a4;
    [v16 setSpeakerMatchScore:v17];
    *(float *)&double v18 = a5;
    [v16 setThresholdScore:v18];
    [v16 setProcessedAudioDurationInNs:a6];
    if (v7) {
      uint64_t v19 = 0LL;
    }
    else {
      uint64_t v19 = 1954LL;
    }
    [v16 setErrorCode:v19];
    id v20 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    [v20 setMhId:v15];
    id v21 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    [v21 setMhId:v15];
    [v21 setEventMetadata:v20];
    [v21 setSpeakerFalseTriggerMitigated:v16];
    double v22 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v22 emitMessage:v21];

    uint64_t v23 = (os_log_s *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_INFO))
    {
      mhId = self->_mhId;
      int v26 = 136315906;
      uint64_t v27 = "-[CSAttSiriSSRNode _logSpeakerFalseTriggerMitigationScore:withSpeakerMatchScore:withSpeakerScoreThreshold:wi"
            "thAudioDuration:withSuccess:]";
      __int16 v28 = 2112;
      unsigned int v29 = mhId;
      __int16 v30 = 2048;
      double v31 = a4;
      __int16 v32 = 2048;
      double v33 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Submit Speaker False Trigger Mitigation score msg to SELF metrics for MH ID: %@, speakerMatchScore: %f, audio ProcessDuration: %f",  (uint8_t *)&v26,  0x2Au);
    }
  }

  else
  {
    uint64_t v25 = (os_log_s *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315138;
      uint64_t v27 = "-[CSAttSiriSSRNode _logSpeakerFalseTriggerMitigationScore:withSpeakerMatchScore:withSpeakerScoreThreshold:wi"
            "thAudioDuration:withSuccess:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v26,  0xCu);
    }
  }
}

- (id)getLeadingUtteranceLogger
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000253C0;
  id v10 = sub_1000253D0;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000253D8;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (CSAttSiriController)attSiriController
{
  return (CSAttSiriController *)objc_loadWeakRetained((id *)&self->_attSiriController);
}

- (void)setAttSiriController:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (void)setRequiredNodes:(id)a3
{
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setMhId:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (CSConnectionListener)ssrListener
{
  return self->_ssrListener;
}

- (void)setSsrListener:(id)a3
{
}

- (CSConnectionListener)localSRBridgeListener
{
  return self->_localSRBridgeListener;
}

- (void)setLocalSRBridgeListener:(id)a3
{
}

- (BOOL)shouldCleanupVoiceProfile
{
  return self->_shouldCleanupVoiceProfile;
}

- (void)setShouldCleanupVoiceProfile:(BOOL)a3
{
  self->_shouldCleanupVoiceProfile = a3;
}

- (SSRSpeakerRecognitionController)ssrController
{
  return self->_ssrController;
}

- (void)setSsrController:(id)a3
{
}

- (SSRVoiceProfileManager)voiceProfileManager
{
  return self->_voiceProfileManager;
}

- (void)setVoiceProfileManager:(id)a3
{
}

- (SSRVoiceProfile)ccProfile
{
  return self->_ccProfile;
}

- (void)setCcProfile:(id)a3
{
}

- (NSString)leadingUtteranceAudioFile
{
  return self->_leadingUtteranceAudioFile;
}

- (void)setLeadingUtteranceAudioFile:(id)a3
{
}

- (CSAudioFileWriter)leadingUtteranceLogger
{
  return self->_leadingUtteranceLogger;
}

- (void)setLeadingUtteranceLogger:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSArray)ssrAssets
{
  return self->_ssrAssets;
}

- (void)setSsrAssets:(id)a3
{
}

- (NSSet)sharedUserIdsSet
{
  return self->_sharedUserIdsSet;
}

- (void)setSharedUserIdsSet:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (NSDictionary)speakerRecognitionScores
{
  return self->_speakerRecognitionScores;
}

- (void)setSpeakerRecognitionScores:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setReceivers:(id)a3
{
}

- (CSSpeakerRecognitionAssetDownloadMonitor)downloadMonitor
{
  return self->_downloadMonitor;
}

- (void)setDownloadMonitor:(id)a3
{
}

- (CSVoiceTriggerAssetHandler)assetHandler
{
  return self->_assetHandler;
}

- (void)setAssetHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end