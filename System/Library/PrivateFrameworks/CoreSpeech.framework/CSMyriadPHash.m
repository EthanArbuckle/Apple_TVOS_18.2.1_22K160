@interface CSMyriadPHash
+ (BOOL)writeHashResultIntoFile:(id)a3;
+ (BOOL)writeHashlessResult:(unint64_t)a3;
+ (NSData)lastHash;
+ (double)signalEstimateWithBuilder:(id)a3;
+ (id)createHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 absTime:(unint64_t)a6 frac:(unsigned __int8)a7;
+ (id)createRemoraHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 firstPassTriggerEndTime:(double)a6 frac:(unsigned __int8)a7;
+ (id)createRemoraHashResultFromPHash:(id)a3 firstPassTriggerEndTime:(double)a4;
+ (id)decodeWithMyriadPHash:(id)a3;
+ (id)generateEmptyPHash:(unint64_t)a3 writeFile:(BOOL)a4;
+ (id)overridePHash:(id)a3 withMachTime:(unint64_t)a4;
+ (void)notifyAudioHashNotification;
+ (void)notifyAudioHashlessNotification;
+ (void)notifyHashlessTrigger:(unint64_t)a3;
+ (void)setLastHash:(id)a3;
- (CSMyriadPHash)init;
- (OS_dispatch_queue)queue;
- (double)_signalEstimate:(float *)a3 length:(unint64_t)a4;
- (id)_audioLogDirectory;
- (id)_generateMyriadInfo:(unint64_t)a3 hsStart:(unint64_t)a4 triggerEnd:(unint64_t)a5 writeFile:(BOOL)a6 score:(float)a7 triggerSource:(id)a8 channel:(unint64_t)a9 audioProviderUUID:(id)a10 absoluteTime:(unint64_t)a11;
- (id)cachedHash;
- (id)generatePHashFromExclaveVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4;
- (id)generatePHashFromVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4;
- (signed)signalEstimate;
- (unsigned)pHash:(float *)a3 length:(int)a4;
- (unsigned)sigFrac:(double)a3;
- (unsigned)sigNorm:(double)a3;
- (unsigned)signalFractional;
- (void)_copyAudioDataInBuffer:(float *)a3 bufferSize:(unint64_t)a4 copyLength:(unint64_t)a5 fromAudioData:(void *)a6;
- (void)_copyPsdDataInBuffer:(float *)a3 copyLength:(unint64_t)a4 fromAudioData:(void *)a5;
- (void)_surfacePsdWithAudioChunk:(id)a3;
- (void)dealloc;
- (void)setQueue:(id)a3;
- (void)setSignalEstimate:(signed __int16)a3;
- (void)setSignalFractional:(unsigned __int8)a3;
@end

@implementation CSMyriadPHash

- (CSMyriadPHash)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSMyriadPHash;
  id v2 = -[CSMyriadPHash init](&v11, "init");
  if (v2)
  {
    v3 = (float *)sub_10004D768(2048, @"HammingWindow");
    *((void *)v2 + 1) = v3;
    vDSP_hamm_window(v3, 0x800uLL, 0);
    *((void *)v2 + 2) = vDSP_create_fftsetup(0xAuLL, 2);
    v4 = (float *)sub_10004D768(256, @"HammingWindow");
    *((void *)v2 + 3) = v4;
    vDSP_hamm_window(v4, 0x100uLL, 0);
    *((void *)v2 + 4) = vDSP_create_fftsetup(8uLL, 2);
    *((_WORD *)v2 + 21) = 0;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    dword_10027FDA0 = v5;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_queue_t v8 = dispatch_queue_create("myriad_audio_analysis", 0LL);
    v9 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v8;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 6), v7);
  }

  return (CSMyriadPHash *)v2;
}

- (void)dealloc
{
  hammingWindow = self->_hammingWindow;
  if (hammingWindow)
  {
    free(hammingWindow);
    self->_hammingWindow = 0LL;
  }

  snrWindow = self->_snrWindow;
  if (snrWindow)
  {
    free(snrWindow);
    self->_snrWindow = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSMyriadPHash;
  -[CSMyriadPHash dealloc](&v5, "dealloc");
}

- (double)_signalEstimate:(float *)a3 length:(unint64_t)a4
{
  float v15 = 0.0;
  v6 = (float *)sub_10004D768(256, @"windowed array for signal estimation");
  double v7 = 0.0;
  uint64_t v8 = 31LL;
  do
  {
    vDSP_vmul(a3, 1LL, self->_snrWindow, 1LL, v6, 1LL, 0x100uLL);
    snrSetup = self->_snrSetup;
    v10 = (float *)sub_10004D768(256, @"complex part zero vec");
    __C.realp = v6;
    __C.imagp = v10;
    vDSP_fft_zip(snrSetup, &__C, 1LL, 8uLL, 1);
    objc_super v11 = (float *)sub_10004D768(256, @"fft magnitudes array");
    vDSP_zvmags(&__C, 1LL, v11, 1LL, 0x100uLL);
    int __B = 256;
    v12 = (float *)sub_10004D768(256, @"sqrt");
    vvsqrtf(v12, v11, &__B);
    v13 = (float *)sub_10004D768(256, @"normalized fft magnitudes");
    int __B = 0x40000000;
    vDSP_vsmul(v12, 1LL, (const float *)&__B, v13, 1LL, 0x100uLL);
    free(v10);
    free(v11);
    free(v12);
    float v15 = 0.0;
    vDSP_sve( &v13[(float)(300.0 / (float)((float)(*(float *)&dword_10027FDA0 * 0.00024414) * 16.0))],  1LL,  &v15,  (int)(float)(2700.0 / (float)((float)(*(float *)&dword_10027FDA0 * 0.00024414) * 16.0)));
    double v7 = v7 + v15;
    free(v13);
    a3 += 128;
    --v8;
  }

  while (v8);
  free(v6);
  return v7;
}

- (void)_surfacePsdWithAudioChunk:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
  vDSP_Length v6 = (vDSP_Length)[v4 numSamples];

  if (v6)
  {
    double v7 = malloc(4 * v6);
    bzero(v7, 4 * v6);
    -[CSMyriadPHash _copyPsdDataInBuffer:copyLength:fromAudioData:]( self, "_copyPsdDataInBuffer:copyLength:fromAudioData:", v7, v6, [v5 bytes]);
    unint64_t v20 = 0xBF7851EC3F800000LL;
    vDSP_conv((const float *)v7, 1LL, (const float *)&v20 + 1, -1LL, (float *)v7, 1LL, v6 - 1, 2uLL);
    *((float *)v7 + v6 - 1) = *((float *)&v20 + 1) * *((float *)v7 + v6 - 1);
    vDSP_vsq((const float *)v7, 1LL, (float *)v7, 1LL, v6);
    float __C = 0.0;
    vDSP_sve((const float *)v7, 1LL, &__C, v6);
    uint64_t v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = __C;
      float v10 = log10(__C) * 10.0 + -50.0;
      *(_DWORD *)buf = 136315906;
      v13 = "-[CSMyriadPHash _surfacePsdWithAudioChunk:]";
      __int16 v14 = 1024;
      int v15 = (int)v10;
      __int16 v16 = 2048;
      double v17 = v9;
      __int16 v18 = 2048;
      vDSP_Length v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Surface PSD: PSD Score = %d, PSDSum = %f, PSDLength = %lu",  buf,  0x26u);
    }

    free(v7);
  }
}

- (unsigned)pHash:(float *)a3 length:(int)a4
{
  double v6 = v5;
  self->_int signalEstimate = -[CSMyriadPHash sigNorm:](self, "sigNorm:");
  unsigned int v7 = -[CSMyriadPHash sigFrac:](self, "sigFrac:", v6);
  self->_signalFractional = v7;
  uint64_t v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int signalEstimate = self->_signalEstimate;
    int v11 = 136315906;
    v12 = "-[CSMyriadPHash pHash:length:]";
    __int16 v13 = 2050;
    double v14 = v6;
    __int16 v15 = 1026;
    int v16 = signalEstimate;
    __int16 v17 = 1026;
    unsigned int v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s sigsum = %{public}f sigNorm= %{public}d sigFrac= %{public}d",  (uint8_t *)&v11,  0x22u);
  }

  return -22991;
}

- (unsigned)sigNorm:(double)a3
{
  return (int)(log10(a3) * 10.0 + -50.0 + 2.5);
}

- (unsigned)sigFrac:(double)a3
{
  float v3 = log10(a3) * 10.0 + 0.5;
  return vcvts_n_s32_f32(v3 - (float)(int)v3, 8uLL);
}

- (id)cachedHash
{
  uint64_t v6 = 0LL;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  double v9 = sub_10004D134;
  float v10 = sub_10004D144;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004D6F4;
  block[3] = &unk_10022E990;
  block[4] = &v6;
  dispatch_sync(queue, block);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_copyAudioDataInBuffer:(float *)a3 bufferSize:(unint64_t)a4 copyLength:(unint64_t)a5 fromAudioData:(void *)a6
{
  if (a3 && a6)
  {
    if (!a5) {
      goto LABEL_8;
    }
    if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
    {
      *(_DWORD *)buf = 1191181824;
      float __C = 1.0;
      float __B = -1.0;
      vDSP_vclip((const float *)a6, 1LL, &__B, &__C, a3, 1LL, a5);
      vDSP_vsmul(a3, 1LL, (const float *)buf, a3, 1LL, a5);
    }

    else
    {
      vDSP_vflt16((const __int16 *)a6, 1LL, a3, 1LL, a5);
    }

    if (a5 <= 0xFFF)
    {
LABEL_8:
      double v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v13 = "-[CSMyriadPHash _copyAudioDataInBuffer:bufferSize:copyLength:fromAudioData:]";
        __int16 v14 = 2050;
        unint64_t v15 = 4096 - a5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s BTLE padded %{public}ld samples to fill out buffer",  buf,  0x16u);
      }
    }
  }

- (void)_copyPsdDataInBuffer:(float *)a3 copyLength:(unint64_t)a4 fromAudioData:(void *)a5
{
  if (a4 && a3 && a5)
  {
    if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
    {
      float __B = 32767.0;
      vDSP_vsmul((const float *)a5, 1LL, &__B, a3, 1LL, a4);
    }

    else
    {
      vDSP_vflt16((const __int16 *)a5, 1LL, a3, 1LL, a4);
    }
  }

- (id)_generateMyriadInfo:(unint64_t)a3 hsStart:(unint64_t)a4 triggerEnd:(unint64_t)a5 writeFile:(BOOL)a6 score:(float)a7 triggerSource:(id)a8 channel:(unint64_t)a9 audioProviderUUID:(id)a10 absoluteTime:(unint64_t)a11
{
  BOOL v13 = a6;
  id v17 = a8;
  id v18 = a10;
  if (v17
    && ((unsigned int v19 = [v17 isEqualToString:kVTEIFirstPassTriggeredFromJarvis],
         ([v17 isEqualToString:kVTEIFirstPassTriggeredFromHearstAP] & 1) != 0)
     || ([v17 isEqualToString:kVTEIFirstPassTriggeredFromHearst] | v19) == 1))
  {
    unint64_t v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUU"
            "ID:absoluteTime:]";
      __int16 v51 = 2114;
      unint64_t v52 = (unint64_t)v17;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s No posting as trigger source is %{public}@",  buf,  0x16u);
    }

    v21 = 0LL;
  }

  else
  {
    BOOL v45 = v13;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
    id v46 = v18;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 audioProviderWithUUID:v18]);

    v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v50 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUU"
            "ID:absoluteTime:]";
      __int16 v51 = 2050;
      unint64_t v52 = a3;
      __int16 v53 = 2050;
      unint64_t v54 = a9;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s BTLE AudioPayload ringBuffer startpoint: %{public}lld toEnd, activeChannel: %{public}tu",  buf,  0x20u);
    }

    v48 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "audioChunkToEndFrom:channelIdx:", a3, a9, a5));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 data]);
    unint64_t v27 = (unint64_t)[v25 numSamples];
    v28 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUU"
            "ID:absoluteTime:]";
      __int16 v51 = 2050;
      unint64_t v52 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s BTLE raw audio size = %{public}ld",  buf,  0x16u);
    }

    v29 = malloc(0x4000uLL);
    bzero(v29, 0x4000uLL);
    if (v27 >= 0x1000) {
      unint64_t v27 = 4096LL;
    }
    id v30 = v26;
    -[CSMyriadPHash _copyAudioDataInBuffer:bufferSize:copyLength:fromAudioData:]( self,  "_copyAudioDataInBuffer:bufferSize:copyLength:fromAudioData:",  v29,  0x4000,  v27,  [v30 bytes]);
    uint64_t v31 = -[CSMyriadPHash pHash:length:](self, "pHash:length:", v29, 4096LL);
    unsigned __int8 v32 = -[CSMyriadPHash signalEstimate](self, "signalEstimate");
    uint64_t v33 = -[CSMyriadPHash signalFractional](self, "signalFractional");
    free(v29);
    uint64_t v34 = CSIsInternalBuild();
    if ((_DWORD)v34)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v48 audioChunkFrom:a4 to:v44 channelIdx:a9]);
      -[CSMyriadPHash _surfacePsdWithAudioChunk:](self, "_surfacePsdWithAudioChunk:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v39 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v40 = v39;
        [v38 timeIntervalSinceDate:v36];
        *(_DWORD *)buf = 136315394;
        v50 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProvider"
              "UUID:absoluteTime:]";
        __int16 v51 = 2050;
        unint64_t v52 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%s Surface PSD elapsed time = %{public}lf",  buf,  0x16u);
      }
    }

    else {
      uint64_t v42 = (int)(float)(a7 * 10.0);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]( &OBJC_CLASS___CSMyriadPHash,  "createHashResult:goodness:confidence:absTime:frac:",  v31,  v32,  v42,  a11,  v33));
    if (v45) {
      +[CSMyriadPHash writeHashResultIntoFile:](&OBJC_CLASS___CSMyriadPHash, "writeHashResultIntoFile:", v21);
    }
    +[CSMyriadPHash notifyAudioHashNotification](&OBJC_CLASS___CSMyriadPHash, "notifyAudioHashNotification");

    id v18 = v46;
  }

  return v21;
}

- (id)_audioLogDirectory
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 voiceTriggerAudioLogDirectory]);

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0LL;
  }

  else
  {
    id v11 = 0LL;
    unsigned __int8 v6 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v5 = v11;
    if ((v6 & 1) == 0)
    {
      unsigned int v7 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        double v9 = v7;
        float v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        BOOL v13 = "-[CSMyriadPHash _audioLogDirectory]";
        __int16 v14 = 2114;
        unint64_t v15 = v4;
        __int16 v16 = 2114;
        id v17 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@",  buf,  0x20u);
      }

      id v4 = @"/tmp";
    }
  }

  return v4;
}

- (id)generatePHashFromExclaveVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = v6;
  double v8 = 0.0;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v9 = kVTEIExclaveSignalIntensity;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEIExclaveSignalIntensity]);
  if (!v10) {
    goto LABEL_5;
  }
  id v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v13);
  char isKindOfClass = objc_opt_isKindOfClass(v12, v14);

  if ((isKindOfClass & 1) != 0)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);
    [v16 doubleValue];
    double v8 = v17;

    uint64_t v18 = -[CSMyriadPHash sigNorm:](self, "sigNorm:", v8);
    uint64_t v19 = -[CSMyriadPHash sigFrac:](self, "sigFrac:", v8);
  }

  else
  {
LABEL_5:
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
  }

  unint64_t v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 136315906;
    uint64_t v33 = "-[CSMyriadPHash generatePHashFromExclaveVoiceTriggerInfo:writeFile:]";
    __int16 v34 = 2050;
    double v35 = v8;
    __int16 v36 = 1026;
    int v37 = v18;
    __int16 v38 = 1026;
    int v39 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s sigsum = %{public}f sigNorm= %{public}d sigFrac= %{public}d",  (uint8_t *)&v32,  0x22u);
  }

  id v21 = (id)mach_absolute_time();
  if (v7)
  {
    uint64_t v22 = kVTEItriggerEndMachTime;
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kVTEItriggerEndMachTime]);
    if (v23)
    {
      v24 = (void *)v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v22]);
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber, v26);
      char v28 = objc_opt_isKindOfClass(v25, v27);

      if ((v28 & 1) != 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v22]);
        id v21 = [v29 unsignedLongLongValue];
      }
    }
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]( &OBJC_CLASS___CSMyriadPHash,  "createHashResult:goodness:confidence:absTime:frac:",  42545LL,  v18,  0LL,  v21,  v19));
  if (v4) {
    +[CSMyriadPHash writeHashResultIntoFile:](&OBJC_CLASS___CSMyriadPHash, "writeHashResultIntoFile:", v30);
  }

  return v30;
}

- (id)generatePHashFromVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0LL;
  double v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10004D134;
  unint64_t v20 = sub_10004D144;
  id v21 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004D14C;
  v11[3] = &unk_10022B1E0;
  id v12 = v6;
  uint64_t v13 = self;
  uint64_t v14 = &v16;
  BOOL v15 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (signed)signalEstimate
{
  return self->_signalEstimate;
}

- (void)setSignalEstimate:(signed __int16)a3
{
  self->_int signalEstimate = a3;
}

- (unsigned)signalFractional
{
  return self->_signalFractional;
}

- (void)setSignalFractional:(unsigned __int8)a3
{
  self->_signalFractional = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)notifyHashlessTrigger:(unint64_t)a3
{
  id v3 =  +[CSMyriadPHash generateEmptyPHash:writeFile:]( &OBJC_CLASS___CSMyriadPHash,  "generateEmptyPHash:writeFile:",  a3,  1LL);
  +[CSMyriadPHash notifyAudioHashlessNotification](&OBJC_CLASS___CSMyriadPHash, "notifyAudioHashlessNotification");
}

+ (id)createRemoraHashResultFromPHash:(id)a3 firstPassTriggerEndTime:(double)a4
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int16 *)[v5 bytes];
  id v7 = v5;
  uint64_t v8 = *((unsigned __int8 *)[v7 bytes] + 2);
  id v9 = v7;
  uint64_t v10 = *((unsigned __int8 *)[v9 bytes] + 3);
  id v11 = v9;
  id v12 = (unsigned __int8 *)[v11 bytes];

  return +[CSMyriadPHash createRemoraHashResult:goodness:confidence:firstPassTriggerEndTime:frac:]( &OBJC_CLASS___CSMyriadPHash,  "createRemoraHashResult:goodness:confidence:firstPassTriggerEndTime:frac:",  v6,  v8,  v10,  v12[12],  a4);
}

+ (id)createRemoraHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 firstPassTriggerEndTime:(double)a6 frac:(unsigned __int8)a7
{
  unsigned __int16 v14 = a3;
  unsigned __int8 v13 = a4;
  unsigned __int8 v12 = a5;
  double v11 = a6;
  unsigned __int8 v10 = a7;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 13LL));
  [v7 appendBytes:&v14 length:2];
  [v7 appendBytes:&v13 length:1];
  [v7 appendBytes:&v12 length:1];
  [v7 appendBytes:&v11 length:8];
  [v7 appendBytes:&v10 length:1];
  uint64_t v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "+[CSMyriadPHash createRemoraHashResult:goodness:confidence:firstPassTriggerEndTime:frac:]";
    __int16 v17 = 2114;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Advert data: %{public}@", buf, 0x16u);
  }

  return v7;
}

+ (id)createHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 absTime:(unint64_t)a6 frac:(unsigned __int8)a7
{
  int v7 = a7;
  int v9 = a5;
  int v10 = a4;
  unsigned __int16 v19 = a3;
  unsigned __int8 v18 = a4;
  unsigned __int8 v17 = a5;
  unint64_t v16 = a6;
  unsigned __int8 v15 = a7;
  double v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    id v21 = "+[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]";
    __int16 v22 = 1024;
    *(_DWORD *)uint64_t v23 = v10;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v9;
    __int16 v24 = 2048;
    unint64_t v25 = a6;
    __int16 v26 = 1024;
    int v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s goodness = %d, confidence = %d absTime = %llu, frac = %d",  buf,  0x28u);
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 13LL));
  [v12 appendBytes:&v19 length:2];
  [v12 appendBytes:&v18 length:1];
  [v12 appendBytes:&v17 length:1];
  [v12 appendBytes:&v16 length:8];
  [v12 appendBytes:&v15 length:1];
  unsigned __int8 v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "+[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]";
    __int16 v22 = 2114;
    *(void *)uint64_t v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Advert data: %{public}@", buf, 0x16u);
  }

  return v12;
}

+ (id)generateEmptyPHash:(unint64_t)a3 writeFile:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]( &OBJC_CLASS___CSMyriadPHash,  "createHashResult:goodness:confidence:absTime:frac:",  0LL,  0LL,  0LL,  a3,  0LL));
  if (v4) {
    +[CSMyriadPHash writeHashResultIntoFile:](&OBJC_CLASS___CSMyriadPHash, "writeHashResultIntoFile:", v5);
  }
  return v5;
}

+ (id)decodeWithMyriadPHash:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  unsigned __int16 v13 = 0;
  __int16 v12 = 0;
  uint64_t v11 = 0LL;
  unsigned __int8 v10 = 0;
  if (v3 && [v3 length] == (id)13)
  {
    objc_msgSend(v4, "getBytes:range:", &v13, 0, 2);
    objc_msgSend(v4, "getBytes:range:", (char *)&v12 + 1, 2, 1);
    objc_msgSend(v4, "getBytes:range:", &v12, 3, 1);
    objc_msgSend(v4, "getBytes:range:", &v11, 4, 8);
    objc_msgSend(v4, "getBytes:range:", &v10, 12, 1);
    id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      unsigned __int8 v15 = "+[CSMyriadPHash decodeWithMyriadPHash:]";
      __int16 v16 = 2048;
      unint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = HIBYTE(v12);
      __int16 v20 = 2048;
      uint64_t v21 = v12;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Decoded myriadPHash : hash(%lu), goodness(%lu), confidence(%lu), absTime(%llu), frac(%lu)",  buf,  0x3Eu);
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v15 = "+[CSMyriadPHash decodeWithMyriadPHash:]";
      __int16 v16 = 2114;
      unint64_t v17 = (unint64_t)v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Invalid myriad pHash : %{public}@",  buf,  0x16u);
    }
  }

  int v7 = objc_alloc(&OBJC_CLASS___CSMyriadPHashFactors);
  uint64_t v8 = -[CSMyriadPHashFactors initWithHash:goodness:confidence:absTime:frac:]( v7,  "initWithHash:goodness:confidence:absTime:frac:",  v13,  HIBYTE(v12),  v12,  v11,  v10);

  return v8;
}

+ (id)overridePHash:(id)a3 withMachTime:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSMyriadPHash decodeWithMyriadPHash:](&OBJC_CLASS___CSMyriadPHash, "decodeWithMyriadPHash:", a3));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]( CSMyriadPHash,  "createHashResult:goodness:confidence:absTime:frac:",  (unsigned __int16)[v5 hash],  objc_msgSend(v5, "goodness"),  objc_msgSend(v5, "confidence"),  a4,  objc_msgSend(v5, "frac")));

  return v6;
}

+ (BOOL)writeHashlessResult:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]( &OBJC_CLASS___CSMyriadPHash,  "createHashResult:goodness:confidence:absTime:frac:",  0LL,  0LL,  0LL,  a3,  0LL));
  BOOL v4 = +[CSMyriadPHash writeHashResultIntoFile:](&OBJC_CLASS___CSMyriadPHash, "writeHashResultIntoFile:", v3);

  return v4;
}

+ (BOOL)writeHashResultIntoFile:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 myriadHashFilePath]);

  unsigned __int8 v6 = [v3 writeToFile:v5 atomically:0];
  if ((v6 & 1) == 0)
  {
    int v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      unsigned __int8 v10 = "+[CSMyriadPHash writeHashResultIntoFile:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s advert data write failed",  (uint8_t *)&v9,  0xCu);
    }
  }

  return v6;
}

+ (void)notifyAudioHashNotification
{
  if (CSIsBridgeOS(a1, a2))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.apayload", 0LL, 0LL, 1u);
    id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      id v5 = "+[CSMyriadPHash notifyAudioHashNotification]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Posted siri audio hash notification",  (uint8_t *)&v4,  0xCu);
    }
  }

+ (void)notifyAudioHashlessNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.apayload", 0LL, 0LL, 1u);
  id v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "+[CSMyriadPHash notifyAudioHashlessNotification]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Posted siri audio hash notification",  (uint8_t *)&v4,  0xCu);
  }

+ (void)setLastHash:(id)a3
{
  id v3 = [a3 copy];
  int v4 = (void *)qword_10027FDA8;
  qword_10027FDA8 = (uint64_t)v3;
}

+ (NSData)lastHash
{
  return (NSData *)(id)qword_10027FDA8;
}

+ (double)signalEstimateWithBuilder:(id)a3
{
  uint64_t v3 = (*((uint64_t (**)(id, uint64_t))a3 + 2))(a3, 4096LL);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = objc_alloc_init(&OBJC_CLASS___CSMyriadPHash);
  if (v4)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
    id v7 = [v6 length];
    double v8 = -1.0;
    if (v7)
    {
      id v9 = v7;
      if (+[CSUtils supportHomeKitAccessory](&OBJC_CLASS___CSUtils, "supportHomeKitAccessory"))
      {
        unsigned __int8 v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315651;
          uint64_t v19 = "+[CSMyriadPHash(SignalEstimate) signalEstimateWithBuilder:]";
          __int16 v20 = 2049;
          uint64_t v21 = 4096LL;
          __int16 v22 = 2049;
          id v23 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s BTLE raw audio size = %{private}ld, audio length = %{private}ld",  buf,  0x20u);
        }

        if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
        {
          uint64_t v11 = malloc(0x4000uLL);
          bzero(v11, 0x4000uLL);
          __int16 v12 = (const float *)[v6 bytes];
          *(_DWORD *)buf = 1191181824;
          float __C = 1.0;
          float __B = -1.0;
          vDSP_vclip(v12, 1LL, &__B, &__C, (float *)v11, 1LL, 0x1000uLL);
          vDSP_vsmul((const float *)v11, 1LL, (const float *)buf, (float *)v11, 1LL, 0x1000uLL);
          -[CSMyriadPHash _signalEstimate:length:](v5, "_signalEstimate:length:", v11, v9);
          double v8 = log10(v13) * 10.0;
          free(v11);
        }

        else
        {
          unsigned __int16 v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v19 = "+[CSMyriadPHash(SignalEstimate) signalEstimateWithBuilder:]";
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Input recording is not float",  buf,  0xCu);
          }
        }
      }
    }
  }

  else
  {
    double v8 = -1.0;
  }

  return v8;
}

@end