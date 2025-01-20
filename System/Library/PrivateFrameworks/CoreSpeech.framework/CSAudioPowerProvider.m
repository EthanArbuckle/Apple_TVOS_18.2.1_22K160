@interface CSAudioPowerProvider
+ (CSAudioPowerProvider)sharedInstance;
- (CSAudioPowerProvider)init;
- (void)getAudioPowerUpdateWithCompletion:(id)a3;
- (void)processAudioChunk:(id)a3;
- (void)processAudioChunkForTV:(id)a3;
@end

@implementation CSAudioPowerProvider

- (CSAudioPowerProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSAudioPowerProvider;
  v2 = -[CSAudioPowerProvider init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___CSAudioPowerMeter);
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    v4 = -[CSAudioPowerMeter initWithSampleRate:](v3, "initWithSampleRate:");
    powerMeter = v2->_powerMeter;
    v2->_powerMeter = v4;

    -[CSAudioPowerMeter getAveragePowerDB](v2->_powerMeter, "getAveragePowerDB");
    *(float *)&double v6 = v6;
    v2->_cachedAvgPower = *(float *)&v6;
    -[CSAudioPowerMeter getPeakPowerDB](v2->_powerMeter, "getPeakPowerDB");
    *(float *)&double v7 = v7;
    v2->_cachedPeakPower = *(float *)&v7;
  }

  return v2;
}

- (void)processAudioChunk:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat");
  powerMeter = self->_powerMeter;
  id v7 = objc_claimAutoreleasedReturnValue([v4 data]);
  id v8 = [v7 bytes];
  id v9 = [v4 numSamples];

  if (v5) {
    -[CSAudioPowerMeter processFloatBuffer:stride:inFrameToProcess:]( powerMeter,  "processFloatBuffer:stride:inFrameToProcess:",  v8,  1LL,  v9);
  }
  else {
    -[CSAudioPowerMeter processShortBuffer:stride:inFrameToProcess:]( powerMeter,  "processShortBuffer:stride:inFrameToProcess:",  v8,  1LL,  v9);
  }

  -[CSAudioPowerMeter getAveragePowerDB](self->_powerMeter, "getAveragePowerDB");
  *(float *)&double v10 = v10;
  self->_cachedAvgPower = *(float *)&v10;
  -[CSAudioPowerMeter getPeakPowerDB](self->_powerMeter, "getPeakPowerDB");
  *(float *)&double v11 = v11;
  self->_cachedPeakPower = *(float *)&v11;
}

- (void)processAudioChunkForTV:(id)a3
{
  id v4 = a3;
  [v4 avgPower];
  self->_cachedAvgPower = v5;
  [v4 peakPower];
  float v7 = v6;

  self->_cachedPeakPower = v7;
}

- (void)getAudioPowerUpdateWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, float, float))a3 + 2))(a3, 0LL, self->_cachedAvgPower, self->_cachedPeakPower);
  }
}

- (void).cxx_destruct
{
}

+ (CSAudioPowerProvider)sharedInstance
{
  if (qword_100280170 != -1) {
    dispatch_once(&qword_100280170, &stru_10022E000);
  }
  return (CSAudioPowerProvider *)(id)qword_100280168;
}

@end