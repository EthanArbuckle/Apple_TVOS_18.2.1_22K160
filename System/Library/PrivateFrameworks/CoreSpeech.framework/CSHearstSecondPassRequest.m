@interface CSHearstSecondPassRequest
- (BOOL)isSecondPassRunning;
- (CSAudioProvider)audioProvider;
- (CSAudioStreamHolding)audioStreamHolding;
- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3;
- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3 speechManager:(id)a4;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (NSString)firstPassDeviceID;
- (float)remoteMicVADScore;
- (void)cancelAudioStreamHold;
- (void)dealloc;
- (void)holdAudioStreamWithTimeout:(double)a3;
- (void)reset;
- (void)setAsset:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setFirstPassDeviceID:(id)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setRemoteMicVADScore:(float)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)start;
@end

@implementation CSHearstSecondPassRequest

- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3 speechManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSHearstSecondPassRequest;
  v9 = -[CSHearstSecondPassRequest init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_speechManager, a4);
    objc_storeStrong((id *)&v10->_firstPassDeviceID, a3);
    v11 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPass),  "initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:",  0LL,  v10->_speechManager,  0LL,  0LL);
    voiceTriggerSecondPass = v10->_voiceTriggerSecondPass;
    v10->_voiceTriggerSecondPass = v11;

    -[CSVoiceTriggerSecondPass setFirstPassSource:](v10->_voiceTriggerSecondPass, "setFirstPassSource:", 3LL);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](v10->_voiceTriggerSecondPass, "setSecondPassClient:", 2LL);
    v10->_remoteMicVADScore = -1.0;
    v10->_isSecondPassRunning = 0;
  }

  return v10;
}

- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  v6 = -[CSHearstSecondPassRequest initWithDeviceID:speechManager:](self, "initWithDeviceID:speechManager:", v4, v5);

  return v6;
}

- (void)dealloc
{
  v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSHearstSecondPassRequest dealloc]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s CSHearstSecondPassRequest is deallocated",  buf,  0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSHearstSecondPassRequest;
  -[CSHearstSecondPassRequest dealloc](&v4, "dealloc");
}

- (void)start
{
}

- (void)reset
{
  self->_remoteMicVADScore = -1.0;
  self->_isSecondPassRunning = 0;
  -[CSVoiceTriggerSecondPass reset](self->_voiceTriggerSecondPass, "reset");
}

- (void)setAsset:(id)a3
{
}

- (void)holdAudioStreamWithTimeout:(double)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[CSAudioStreamHoldRequestOption defaultOptionWithTimeout:]( &OBJC_CLASS___CSAudioStreamHoldRequestOption,  "defaultOptionWithTimeout:",  5.0));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSHearstSecondPassRequest audioProvider](self, "audioProvider"));
  v5 = (CSAudioStreamHolding *)objc_claimAutoreleasedReturnValue( [v4 holdAudioStreamWithDescription:@"CSHearstSecondPassRequest" option:v7]);
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v5;
}

- (void)cancelAudioStreamHold
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSHearstSecondPassRequest audioProvider](self, "audioProvider"));
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

- (float)remoteMicVADScore
{
  return self->_remoteMicVADScore;
}

- (void)setRemoteMicVADScore:(float)a3
{
  self->_remoteMicVADScore = a3;
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

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end