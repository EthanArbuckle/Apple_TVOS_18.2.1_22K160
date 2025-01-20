@interface CSAdBlockerHorseMan
- (BOOL)hasCancelled;
- (BOOL)hasVoiceTriggered;
- (CSAdBlockerHorseMan)init;
- (CSAdBlockerHorseMan)initWithHasCancelled:(BOOL)a3 withHasVoiceTriggered:(BOOL)a4 withAdBlockerLogger:(id)a5;
- (CSAdBlockerLogger)adBlockerLogger;
- (CSAsset)assetForAdBlockerFile;
- (CSContinuousAudioFingerprintProvider)fingerprintProvider;
- (NSDictionary)shouldResetDictionary;
- (NSHashTable)observers;
- (NSString)assetVersion;
- (NSString)languageCode;
- (NSUUID)requestMHUUID;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (SHSession)recognitionSession;
- (float)maxFingerprintBufferSize;
- (id)uniqueAdBlockerStoreManagerObserverIdentifier;
- (unint64_t)startTime;
- (void)adBlockerStoreHasUpdateWithCatalog:(id)a3 withResetDictionary:(id)a4 withMaxFingerprintBufferSize:(float)a5 withAssetVersion:(id)a6;
- (void)continuousAudioFingerprintProvider:(id)a3 hasNewFingerprintBuffer:(id)a4;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)session:(id)a3 didFindMatch:(id)a4;
- (void)setAdBlockerLogger:(id)a3;
- (void)setAssetForAdBlockerFile:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setFingerprintProvider:(id)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasVoiceTriggered:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setMaxFingerprintBufferSize:(float)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecognitionSession:(id)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setShouldResetDictionary:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)startAdBlockerMatching;
- (void)stopAdBlockerMatching;
- (void)unregisterObserver:(id)a3;
- (void)validateSession;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4;
@end

@implementation CSAdBlockerHorseMan

- (CSAdBlockerHorseMan)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___CSAdBlockerLogger);
  v4 = -[CSAdBlockerHorseMan initWithHasCancelled:withHasVoiceTriggered:withAdBlockerLogger:]( self,  "initWithHasCancelled:withHasVoiceTriggered:withAdBlockerLogger:",  0LL,  0LL,  v3);

  return v4;
}

- (CSAdBlockerHorseMan)initWithHasCancelled:(BOOL)a3 withHasVoiceTriggered:(BOOL)a4 withAdBlockerLogger:(id)a5
{
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSAdBlockerHorseMan;
  v10 = -[CSAdBlockerHorseMan init](&v18, "init");
  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("AdBlocker", 0LL);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    v10->_hasCancelled = a3;
    v15 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    uuid = v10->_uuid;
    v10->_uuid = v15;

    v10->_hasVoiceTriggered = a4;
    objc_storeStrong((id *)&v10->_adBlockerLogger, a5);
  }

  return v10;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001506F0;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100150670;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioFingerprintProvider]);
  [v4 stopWithUUID:self->_uuid];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
  [v5 unregisterObserver:self];

  v6 = (os_log_s *)CSLogCategoryAdBlocker;
  if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[CSAdBlockerHorseMan dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s AdBlocker dealloc", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSAdBlockerHorseMan;
  -[CSAdBlockerHorseMan dealloc](&v7, "dealloc");
}

- (void)stopAdBlockerMatching
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100150594;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startAdBlockerMatching
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001503D0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100150314;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100150240;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10015016C;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)session:(id)a3 didFindMatch:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10014FCA0;
  v8[3] = &unk_10022EFD0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v8 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10014FC3C;
  v11[3] = &unk_10022EFD0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014FA60;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)continuousAudioFingerprintProvider:(id)a3 hasNewFingerprintBuffer:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SHSignature signatureWithDataRepresentation:error:]( &OBJC_CLASS___SHSignature,  "signatureWithDataRepresentation:error:",  a4,  0LL));
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10014F8FC;
  v8[3] = &unk_10022EFD0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)validateSession
{
  recognitionSession = self->_recognitionSession;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 audioFingerprintProvider]);
  id v7 = v5;
  uuid = self->_uuid;
  if (recognitionSession)
  {
    *(float *)&double v6 = self->_maxFingerprintBufferSize;
    [v5 startWithUUID:uuid withMaximumBufferSize:v6];

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
    [v9 registerObserver:self];
  }

  else
  {
    [v5 stopWithUUID:uuid];

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
    [v9 unregisterObserver:self];
  }
}

- (void)adBlockerStoreHasUpdateWithCatalog:(id)a3 withResetDictionary:(id)a4 withMaxFingerprintBufferSize:(float)a5 withAssetVersion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014F778;
  block[3] = &unk_10022EF58;
  id v18 = v12;
  v19 = self;
  id v20 = v10;
  id v21 = v11;
  float v22 = a5;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(queue, block);
}

- (id)uniqueAdBlockerStoreManagerObserverIdentifier
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10014F728;
  id v10 = sub_10014F738;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10014F740;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSUUID)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (SHSession)recognitionSession
{
  return self->_recognitionSession;
}

- (void)setRecognitionSession:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSContinuousAudioFingerprintProvider)fingerprintProvider
{
  return (CSContinuousAudioFingerprintProvider *)objc_loadWeakRetained((id *)&self->_fingerprintProvider);
}

- (void)setFingerprintProvider:(id)a3
{
}

- (CSAsset)assetForAdBlockerFile
{
  return self->_assetForAdBlockerFile;
}

- (void)setAssetForAdBlockerFile:(id)a3
{
}

- (BOOL)hasCancelled
{
  return self->_hasCancelled;
}

- (void)setHasCancelled:(BOOL)a3
{
  self->_hasCancelled = a3;
}

- (BOOL)hasVoiceTriggered
{
  return self->_hasVoiceTriggered;
}

- (void)setHasVoiceTriggered:(BOOL)a3
{
  self->_hasVoiceTriggered = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (NSDictionary)shouldResetDictionary
{
  return self->_shouldResetDictionary;
}

- (void)setShouldResetDictionary:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (float)maxFingerprintBufferSize
{
  return self->_maxFingerprintBufferSize;
}

- (void)setMaxFingerprintBufferSize:(float)a3
{
  self->_maxFingerprintBufferSize = a3;
}

- (CSAdBlockerLogger)adBlockerLogger
{
  return self->_adBlockerLogger;
}

- (void)setAdBlockerLogger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end