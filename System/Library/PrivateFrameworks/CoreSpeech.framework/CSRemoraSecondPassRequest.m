@interface CSRemoraSecondPassRequest
- (BOOL)isCancelled;
- (BOOL)isSecondPassRunning;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioStreamHolding)audioStreamHolding;
- (CSRemoraSecondPassRequest)initWithDeviceID:(id)a3;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus;
- (NSString)firstPassDeviceID;
- (double)firstPassTriggerEndTime;
- (float)goodnessScore;
- (id)_secondPassWorkQueue;
- (unint64_t)timestamp;
- (void)cancelAudioStreamHold;
- (void)cancelRequest;
- (void)dealloc;
- (void)holdAudioStreamWithTimeout:(double)a3;
- (void)reset;
- (void)setAsset:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setFirstPassDeviceID:(id)a3;
- (void)setFirstPassTriggerEndTime:(double)a3;
- (void)setGoodnessScore:(float)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setMultiPhraseSelectedStatus:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)start;
@end

@implementation CSRemoraSecondPassRequest

- (id)_secondPassWorkQueue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.corespeech.remoram.voicetriggersecondpassq.%@,",  self->_firstPassDeviceID));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  v2,  kCSDefaultSerialQueueFixedPriority));

  return v3;
}

- (CSRemoraSecondPassRequest)initWithDeviceID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSRemoraSecondPassRequest;
  v6 = -[CSRemoraSecondPassRequest init](&v13, "init");
  if (v6)
  {
    v7 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSRemoraSecondPassRequest initWithDeviceID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Using high priority queues for remora second pass",  buf,  0xCu);
    }

    objc_storeStrong((id *)&v6->_firstPassDeviceID, a3);
    v8 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPass);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoraSecondPassRequest _secondPassWorkQueue](v6, "_secondPassWorkQueue"));
    v10 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]( v8,  "initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:",  0LL,  0LL,  0LL,  v9);
    voiceTriggerSecondPass = v6->_voiceTriggerSecondPass;
    v6->_voiceTriggerSecondPass = v10;

    -[CSVoiceTriggerSecondPass setFirstPassSource:](v6->_voiceTriggerSecondPass, "setFirstPassSource:", 7LL);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](v6->_voiceTriggerSecondPass, "setSecondPassClient:", 5LL);
    -[CSVoiceTriggerSecondPass setFirstPassDeviceId:]( v6->_voiceTriggerSecondPass,  "setFirstPassDeviceId:",  v6->_firstPassDeviceID);
    v6->_isSecondPassRunning = 0;
  }

  return v6;
}

- (void)dealloc
{
  v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSRemoraSecondPassRequest dealloc]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s CSRemoraFirstPassRequest is deallocated",  buf,  0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSRemoraSecondPassRequest;
  -[CSRemoraSecondPassRequest dealloc](&v4, "dealloc");
}

- (void)start
{
}

- (void)reset
{
  self->_isSecondPassRunning = 0;
  -[CSVoiceTriggerSecondPass reset](self->_voiceTriggerSecondPass, "reset");
}

- (void)setAsset:(id)a3
{
  id v5 = a3;
  [v5 logAssetVersionForInsight];
  -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", v5);
}

- (void)holdAudioStreamWithTimeout:(double)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[CSAudioStreamHoldRequestOption defaultOptionWithTimeout:]( &OBJC_CLASS___CSAudioStreamHoldRequestOption,  "defaultOptionWithTimeout:",  a3));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoraSecondPassRequest audioProvider](self, "audioProvider"));
  id v5 = (CSAudioStreamHolding *)objc_claimAutoreleasedReturnValue( [v4 holdAudioStreamWithDescription:@"CSRemoraSecondPassRequest" option:v7]);
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v5;
}

- (void)cancelRequest
{
  self->_isCancelled = 1;
  -[CSVoiceTriggerSecondPass cancelCurrentRequest](self->_voiceTriggerSecondPass, "cancelCurrentRequest");
  -[CSRemoraSecondPassRequest cancelAudioStreamHold](self, "cancelAudioStreamHold");
}

- (void)cancelAudioStreamHold
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSRemoraSecondPassRequest audioProvider](self, "audioProvider"));
  [v3 cancelAudioStreamHold:self->_audioStreamHolding];

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0LL;
}

- (NSString)firstPassDeviceID
{
  return self->_firstPassDeviceID;
}

- (void)setFirstPassDeviceID:(id)a3
{
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioProvider:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (float)goodnessScore
{
  return self->_goodnessScore;
}

- (void)setGoodnessScore:(float)a3
{
  self->_goodnessScore = a3;
}

- (double)firstPassTriggerEndTime
{
  return self->_firstPassTriggerEndTime;
}

- (void)setFirstPassTriggerEndTime:(double)a3
{
  self->_firstPassTriggerEndTime = a3;
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setMultiPhraseSelectedStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end