@interface CSPreMyriadCoordinator
- (BOOL)_isRemoraSecondPassRunning;
- (BOOL)handlePendingBuiltInVoiceTriggerIfNeeded;
- (BOOL)handlePendingRemoraVoiceTriggerIfNeeded;
- (BOOL)isBultInVoiceTriggerEvent:(id)a3;
- (BOOL)isRemoraVoiceTriggerEvent:(id)a3;
- (CSMyriadDeviceManager)myriadDeviceManager;
- (CSPreMyriadCoordinator)init;
- (CSPreMyriadVoiceTriggerMetaData)builtInVoiceTriggerMetaData;
- (CSSecondPassProgressProviding)builtInSeconPassProgressProvider;
- (CSSecondPassProgressProviding)remoraSecondPassProgressProvider;
- (CSVoiceTriggerDelegate)delegate;
- (NSDictionary)pendingBuiltInVoiceTriggerResult;
- (NSDictionary)pendingRemoraVoiceTriggerResult;
- (NSMutableDictionary)accessoryVoiceTriggerMetaDataByDeviceId;
- (NSString)pendingRemoraVoiceTriggerDeviceId;
- (OS_dispatch_queue)queue;
- (id)pendingBuiltInVoiceTriggerCompletionBlk;
- (id)pendingRemoraVoiceTriggerCompletionBlk;
- (unint64_t)pendingBuiltInVoiceTriggerDetectedTime;
- (unint64_t)pendingRemoraVoiceTriggerDetectedTime;
- (void)_clearPendingBuiltInVoiceTrigger;
- (void)_clearPendingRemoraVoiceTrigger;
- (void)_getHighestRemoraFirstPassGoodnessScore:(id)a3;
- (void)keywordDetectorDidDetectKeyword;
- (void)raiseToSpeakDetected:(id)a3;
- (void)secondPassDidStartForClient:(unint64_t)a3 deviceId:(id)a4 withFirstPassEstimate:(double)a5;
- (void)secondPassDidStopForClient:(unint64_t)a3 deviceId:(id)a4;
- (void)setAccessoryVoiceTriggerMetaDataByDeviceId:(id)a3;
- (void)setBuiltInSeconPassProgressProvider:(id)a3;
- (void)setBuiltInVoiceTriggerMetaData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMyriadDeviceManager:(id)a3;
- (void)setPendingBuiltInVoiceTriggerCompletionBlk:(id)a3;
- (void)setPendingBuiltInVoiceTriggerDetectedTime:(unint64_t)a3;
- (void)setPendingBuiltInVoiceTriggerResult:(id)a3;
- (void)setPendingRemoraVoiceTriggerCompletionBlk:(id)a3;
- (void)setPendingRemoraVoiceTriggerDetectedTime:(unint64_t)a3;
- (void)setPendingRemoraVoiceTriggerDeviceId:(id)a3;
- (void)setPendingRemoraVoiceTriggerResult:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoraSecondPassProgressProvider:(id)a3;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectSpeakerReject:(id)a3;
- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerGotSuperVector:(id)a3;
@end

@implementation CSPreMyriadCoordinator

- (CSPreMyriadCoordinator)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSPreMyriadCoordinator;
  v2 = -[CSPreMyriadCoordinator init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    if (!v2->_queue)
    {
      uint64_t v4 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  @"com.apple.corespeech.premyriad",  kCSDefaultSerialQueueFixedPriority));
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v4;
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[CSMyriadDeviceManager sharedInstance](&OBJC_CLASS___CSMyriadDeviceManager, "sharedInstance"));
    myriadDeviceManager = v3->_myriadDeviceManager;
    v3->_myriadDeviceManager = (CSMyriadDeviceManager *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    accessoryVoiceTriggerMetaDataByDeviceId = v3->_accessoryVoiceTriggerMetaDataByDeviceId;
    v3->_accessoryVoiceTriggerMetaDataByDeviceId = (NSMutableDictionary *)v8;
  }

  return v3;
}

- (BOOL)isBultInVoiceTriggerEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v5 = kVTEIfirstPassTriggerSource;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource]);
  if (!v6) {
    goto LABEL_6;
  }
  v7 = (void *)v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  unsigned __int8 v13 = [v12 isEqualToString:kVTEIFirstPassTriggeredFromApplicationProcessor];

  if ((v13 & 1) != 0) {
    BOOL v14 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v14 = 0;

  return v14;
}

- (BOOL)isRemoraVoiceTriggerEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v5 = kVTEIfirstPassTriggerSource;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource]);
  if (!v6) {
    goto LABEL_6;
  }
  v7 = (void *)v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  unsigned __int8 v13 = [v12 isEqualToString:kVTEIFirstPassTriggeredFromRemora];

  if ((v13 & 1) != 0) {
    BOOL v14 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v14 = 0;

  return v14;
}

- (void)_clearPendingRemoraVoiceTrigger
{
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    pendingRemoraVoiceTriggerResult = self->_pendingRemoraVoiceTriggerResult;
    int v12 = 136315395;
    unsigned __int8 v13 = "-[CSPreMyriadCoordinator _clearPendingRemoraVoiceTrigger]";
    __int16 v14 = 2113;
    v15 = pendingRemoraVoiceTriggerResult;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Clearing pending homekit accessory voice trigger %{private}@",  (uint8_t *)&v12,  0x16u);
  }

  id v5 = -[NSString copy](self->_pendingRemoraVoiceTriggerDeviceId, "copy");
  uint64_t v6 = self->_pendingRemoraVoiceTriggerResult;
  self->_pendingRemoraVoiceTriggerResult = 0LL;

  pendingRemoraVoiceTriggerDeviceId = self->_pendingRemoraVoiceTriggerDeviceId;
  self->_pendingRemoraVoiceTriggerDeviceId = 0LL;

  id pendingRemoraVoiceTriggerCompletionBlk = self->_pendingRemoraVoiceTriggerCompletionBlk;
  self->_id pendingRemoraVoiceTriggerCompletionBlk = 0LL;

  p_remoraSecondPassProgressProvider = &self->_remoraSecondPassProgressProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_remoraSecondPassProgressProvider);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)p_remoraSecondPassProgressProvider);
    [v11 pendingSecondPassTriggerWasClearedForClient:5 deviceId:v5];
  }
}

- (BOOL)handlePendingRemoraVoiceTriggerIfNeeded
{
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSPreMyriadCoordinator handlePendingRemoraVoiceTriggerIfNeeded]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Handling Pending Remora VoiceTrigger Event",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_10001A694;
  v24 = sub_10001A6A4;
  id v25 = 0LL;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_10001A694;
  v19 = sub_10001A6A4;
  id v20 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  int v12 = sub_10001AB2C;
  unsigned __int8 v13 = sub_10001AB54;
  id v14 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001AC84;
  v8[3] = &unk_10022A330;
  v8[4] = self;
  v8[5] = &buf;
  v8[6] = &v15;
  v8[7] = &v9;
  dispatch_async_and_wait(queue, v8);
  uint64_t v5 = *(void *)(*((void *)&buf + 1) + 40LL);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained voiceTriggerDidDetectKeyword:*(void *)(*((void *)&buf + 1) + 40) deviceId:v16[5] completion:v10[5]];
  }

  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);

  return v5 != 0;
}

- (void)_clearPendingBuiltInVoiceTrigger
{
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    pendingBuiltInVoiceTriggerResult = self->_pendingBuiltInVoiceTriggerResult;
    int v10 = 136315395;
    uint64_t v11 = "-[CSPreMyriadCoordinator _clearPendingBuiltInVoiceTrigger]";
    __int16 v12 = 2113;
    unsigned __int8 v13 = pendingBuiltInVoiceTriggerResult;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Clearing pending built-in voice trigger %{private}@",  (uint8_t *)&v10,  0x16u);
  }

  uint64_t v5 = self->_pendingBuiltInVoiceTriggerResult;
  self->_pendingBuiltInVoiceTriggerResult = 0LL;

  id pendingBuiltInVoiceTriggerCompletionBlk = self->_pendingBuiltInVoiceTriggerCompletionBlk;
  self->_id pendingBuiltInVoiceTriggerCompletionBlk = 0LL;

  p_builtInSeconPassProgressProvider = &self->_builtInSeconPassProgressProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_builtInSeconPassProgressProvider);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_builtInSeconPassProgressProvider);
    [v9 pendingSecondPassTriggerWasClearedForClient:1 deviceId:0];
  }

- (BOOL)handlePendingBuiltInVoiceTriggerIfNeeded
{
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSPreMyriadCoordinator handlePendingBuiltInVoiceTriggerIfNeeded]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Handling Pending BuiltInVoiceTrigger Event",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_10001A694;
  v18 = sub_10001A6A4;
  id v19 = 0LL;
  uint64_t v9 = 0LL;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  __int16 v12 = sub_10001AB2C;
  unsigned __int8 v13 = sub_10001AB54;
  id v14 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001AB5C;
  block[3] = &unk_10022CCA8;
  block[4] = self;
  block[5] = &buf;
  block[6] = &v9;
  dispatch_async_and_wait(queue, block);
  uint64_t v5 = *(void *)(*((void *)&buf + 1) + 40LL);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained voiceTriggerDidDetectKeyword:*(void *)(*((void *)&buf + 1) + 40) deviceId:0 completion:v10[5]];
  }

  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&buf, 8);
  return v5 != 0;
}

- (void)_getHighestRemoraFirstPassGoodnessScore:(id)a3
{
  uint64_t v4 = (void (**)(id, void, double))a3;
  if (v4)
  {
    uint64_t v13 = 0LL;
    id v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000LL;
    unint64_t v16 = 0xBFF0000000000000LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000LL;
    int v10 = sub_10001A694;
    uint64_t v11 = sub_10001A6A4;
    id v12 = 0LL;
    accessoryVoiceTriggerMetaDataByDeviceId = self->_accessoryVoiceTriggerMetaDataByDeviceId;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001AAB0;
    v6[3] = &unk_10022A358;
    v6[4] = &v13;
    v6[5] = &v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( accessoryVoiceTriggerMetaDataByDeviceId,  "enumerateKeysAndObjectsUsingBlock:",  v6);
    v4[2](v4, v8[5], v14[3]);
    _Block_object_dispose(&v7, 8);

    _Block_object_dispose(&v13, 8);
  }
}

- (BOOL)_isRemoraSecondPassRunning
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  accessoryVoiceTriggerMetaDataByDeviceId = self->_accessoryVoiceTriggerMetaDataByDeviceId;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001AA70;
  v5[3] = &unk_10022A380;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( accessoryVoiceTriggerMetaDataByDeviceId,  "enumerateKeysAndObjectsUsingBlock:",  v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001A094;
  v15[3] = &unk_10022A3F8;
  objc_copyWeak(&v20, &location);
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A020;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[CSPreMyriadCoordinator isBultInVoiceTriggerEvent:](self, "isBultInVoiceTriggerEvent:", v8))
  {
    -[CSPreMyriadCoordinator handlePendingRemoraVoiceTriggerIfNeeded](self, "handlePendingRemoraVoiceTriggerIfNeeded");
  }

  else if (-[CSPreMyriadCoordinator isRemoraVoiceTriggerEvent:](self, "isRemoraVoiceTriggerEvent:", v8))
  {
    -[CSPreMyriadCoordinator handlePendingBuiltInVoiceTriggerIfNeeded](self, "handlePendingBuiltInVoiceTriggerIfNeeded");
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained voiceTriggerDidDetectNearMiss:v8 deviceId:v6];
}

- (void)voiceTriggerDidDetectSpeakerReject:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained voiceTriggerDidDetectSpeakerReject:v4];
}

- (void)keywordDetectorDidDetectKeyword
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained keywordDetectorDidDetectKeyword];
}

- (void)voiceTriggerGotSuperVector:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained voiceTriggerGotSuperVector:v4];
}

- (void)raiseToSpeakDetected:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained raiseToSpeakDetected:v4];
}

- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[CSPreMyriadCoordinator isBultInVoiceTriggerEvent:](self, "isBultInVoiceTriggerEvent:", v8))
  {
    -[CSPreMyriadCoordinator handlePendingRemoraVoiceTriggerIfNeeded](self, "handlePendingRemoraVoiceTriggerIfNeeded");
  }

  else if (-[CSPreMyriadCoordinator isRemoraVoiceTriggerEvent:](self, "isRemoraVoiceTriggerEvent:", v8))
  {
    -[CSPreMyriadCoordinator handlePendingBuiltInVoiceTriggerIfNeeded](self, "handlePendingBuiltInVoiceTriggerIfNeeded");
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained voiceTriggerDidRejected:v8 deviceId:v6];
}

- (void)secondPassDidStopForClient:(unint64_t)a3 deviceId:(id)a4
{
  id v6 = (__CFString *)a4;
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"N/A";
    *(_DWORD *)__int128 buf = 136315651;
    id v14 = "-[CSPreMyriadCoordinator secondPassDidStopForClient:deviceId:]";
    if (v6) {
      id v8 = v6;
    }
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    __int16 v17 = 2113;
    v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s client: %lu, deviceId: %{private}@",  buf,  0x20u);
  }

  if (+[CSUtils supportHomeKitAccessory](&OBJC_CLASS___CSUtils, "supportHomeKitAccessory"))
  {
    objc_initWeak((id *)buf, self);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100019FA4;
    block[3] = &unk_10022A420;
    objc_copyWeak(v12, (id *)buf);
    v12[1] = (id)a3;
    uint64_t v11 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)secondPassDidStartForClient:(unint64_t)a3 deviceId:(id)a4 withFirstPassEstimate:(double)a5
{
  id v8 = (__CFString *)a4;
  id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"N/A";
    *(_DWORD *)__int128 buf = 136315651;
    unint64_t v16 = "-[CSPreMyriadCoordinator secondPassDidStartForClient:deviceId:withFirstPassEstimate:]";
    if (v8) {
      id v10 = v8;
    }
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    __int16 v19 = 2113;
    id v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s client: %lu, deviceId: %{private}@",  buf,  0x20u);
  }

  if (+[CSUtils supportHomeKitAccessory](&OBJC_CLASS___CSUtils, "supportHomeKitAccessory"))
  {
    objc_initWeak((id *)buf, self);
    queue = (dispatch_queue_s *)self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    id v12[2] = sub_100019EA8;
    v12[3] = &unk_10022A448;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = (id)a3;
    v14[2] = *(id *)&a5;
    id v13 = v8;
    dispatch_async(queue, v12);

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSSecondPassProgressProviding)builtInSeconPassProgressProvider
{
  return (CSSecondPassProgressProviding *)objc_loadWeakRetained((id *)&self->_builtInSeconPassProgressProvider);
}

- (void)setBuiltInSeconPassProgressProvider:(id)a3
{
}

- (CSSecondPassProgressProviding)remoraSecondPassProgressProvider
{
  return (CSSecondPassProgressProviding *)objc_loadWeakRetained((id *)&self->_remoraSecondPassProgressProvider);
}

- (void)setRemoraSecondPassProgressProvider:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDictionary)pendingRemoraVoiceTriggerResult
{
  return self->_pendingRemoraVoiceTriggerResult;
}

- (void)setPendingRemoraVoiceTriggerResult:(id)a3
{
}

- (NSString)pendingRemoraVoiceTriggerDeviceId
{
  return self->_pendingRemoraVoiceTriggerDeviceId;
}

- (void)setPendingRemoraVoiceTriggerDeviceId:(id)a3
{
}

- (id)pendingRemoraVoiceTriggerCompletionBlk
{
  return self->_pendingRemoraVoiceTriggerCompletionBlk;
}

- (void)setPendingRemoraVoiceTriggerCompletionBlk:(id)a3
{
}

- (unint64_t)pendingRemoraVoiceTriggerDetectedTime
{
  return self->_pendingRemoraVoiceTriggerDetectedTime;
}

- (void)setPendingRemoraVoiceTriggerDetectedTime:(unint64_t)a3
{
  self->_pendingRemoraVoiceTriggerDetectedTime = a3;
}

- (CSMyriadDeviceManager)myriadDeviceManager
{
  return self->_myriadDeviceManager;
}

- (void)setMyriadDeviceManager:(id)a3
{
}

- (NSDictionary)pendingBuiltInVoiceTriggerResult
{
  return self->_pendingBuiltInVoiceTriggerResult;
}

- (void)setPendingBuiltInVoiceTriggerResult:(id)a3
{
}

- (id)pendingBuiltInVoiceTriggerCompletionBlk
{
  return self->_pendingBuiltInVoiceTriggerCompletionBlk;
}

- (void)setPendingBuiltInVoiceTriggerCompletionBlk:(id)a3
{
}

- (unint64_t)pendingBuiltInVoiceTriggerDetectedTime
{
  return self->_pendingBuiltInVoiceTriggerDetectedTime;
}

- (void)setPendingBuiltInVoiceTriggerDetectedTime:(unint64_t)a3
{
  self->_pendingBuiltInVoiceTriggerDetectedTime = a3;
}

- (CSPreMyriadVoiceTriggerMetaData)builtInVoiceTriggerMetaData
{
  return self->_builtInVoiceTriggerMetaData;
}

- (void)setBuiltInVoiceTriggerMetaData:(id)a3
{
}

- (NSMutableDictionary)accessoryVoiceTriggerMetaDataByDeviceId
{
  return self->_accessoryVoiceTriggerMetaDataByDeviceId;
}

- (void)setAccessoryVoiceTriggerMetaDataByDeviceId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end