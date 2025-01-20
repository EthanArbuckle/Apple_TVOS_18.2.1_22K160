@interface CSShadowMicScoreCreator
- (CSShadowMicScoreCreator)init;
- (NSMutableArray)rmsSamplesForEntireAudio;
- (NSMutableData)audioBuffer;
- (double)_calculateRMSWithFrameData:(signed __int16)a3[80];
- (double)shadowMicScore;
- (double)speechVoiceLevel;
- (int64_t)numberOfTotalFramesETFT;
- (unint64_t)bestEarlyDetectSample;
- (unint64_t)bestEndDetectSample;
- (unint64_t)bestStartDetectSample;
- (unint64_t)numberOfVoicingFrames;
- (void)_calculateNumberOfVoicingFrames;
- (void)_calculateSpeechVoicingLevel;
- (void)addDataToBuffer:(id)a3;
- (void)calculateShadowMicScore;
- (void)setAudioBuffer:(id)a3;
- (void)setBestEarlyDetectSample:(unint64_t)a3;
- (void)setBestEndDetectSample:(unint64_t)a3;
- (void)setBestStartDetectSample:(unint64_t)a3;
- (void)setNumberOfTotalFramesETFT:(int64_t)a3;
- (void)setNumberOfVoicingFrames:(unint64_t)a3;
- (void)setRmsSamplesForEntireAudio:(id)a3;
- (void)setShadowMicScore:(double)a3;
- (void)setSpeechVoiceLevel:(double)a3;
@end

@implementation CSShadowMicScoreCreator

- (CSShadowMicScoreCreator)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSShadowMicScoreCreator;
  v2 = -[CSShadowMicScoreCreator init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    rmsSamplesForEntireAudio = v2->_rmsSamplesForEntireAudio;
    v2->_rmsSamplesForEntireAudio = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    audioBuffer = v2->_audioBuffer;
    v2->_audioBuffer = v5;

    v2->_speechVoiceLevel = -1.0;
    v2->_shadowMicScore = -1.0;
  }

  return v2;
}

- (void)addDataToBuffer:(id)a3
{
}

- (void)calculateShadowMicScore
{
  unint64_t bestStartDetectSample = self->_bestStartDetectSample;
  unint64_t bestEarlyDetectSample = self->_bestEarlyDetectSample;
  if (bestStartDetectSample > bestEarlyDetectSample || (unint64_t v5 = self->_bestEndDetectSample, bestStartDetectSample > v5))
  {
    v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    unint64_t bestEndDetectSample = self->_bestEndDetectSample;
    *(_DWORD *)buf = 136315906;
    v23 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    __int16 v24 = 2048;
    unint64_t v25 = bestStartDetectSample;
    __int16 v26 = 2048;
    unint64_t v27 = bestEarlyDetectSample;
    __int16 v28 = 2048;
    unint64_t v29 = bestEndDetectSample;
    objc_super v8 = "%s _bestStartDetectSample %lu was greater than _bestEarlyDetectSample %lu or _bestEndDetectSample %lu";
    v9 = v6;
    uint32_t v10 = 42;
    goto LABEL_18;
  }

  if (bestEarlyDetectSample > v5)
  {
    v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315650;
    v23 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    __int16 v24 = 2048;
    unint64_t v25 = bestEarlyDetectSample;
    __int16 v26 = 2048;
    unint64_t v27 = v5;
    objc_super v8 = "%s _bestEarlyDetectSample %lu was greater than _bestEndDetectSample %lu";
    v9 = v7;
    uint32_t v10 = 32;
    goto LABEL_18;
  }

  unint64_t v11 = 2 * (int)bestStartDetectSample;
  if (v11 + 160 > -[NSMutableData length](self->_audioBuffer, "length"))
  {
LABEL_15:
    -[CSShadowMicScoreCreator _calculateNumberOfVoicingFrames](self, "_calculateNumberOfVoicingFrames");
    if (self->_numberOfTotalFramesETFT)
    {
      return;
    }

    v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
    {
LABEL_4:
      self->_shadowMicScore = -1.0;
      return;
    }

    *(_DWORD *)buf = 136315394;
    v23 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    __int16 v24 = 2048;
    unint64_t v25 = 0LL;
    objc_super v8 = "%s _numberOfTotalFramesETFT %lu is 0";
    v9 = v17;
    uint32_t v10 = 22;
LABEL_18:
    _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, v8, buf, v10);
    goto LABEL_4;
  }

  int v12 = v11 + 80;
  while (1)
  {
    -[NSMutableData getBytes:range:](self->_audioBuffer, "getBytes:range:", buf, v11, 160LL);
    -[CSShadowMicScoreCreator _calculateRMSWithFrameData:](self, "_calculateRMSWithFrameData:", buf);
    v14 = -[RMSSample initWithRMSScore:lastSampleCount:]( objc_alloc(&OBJC_CLASS___RMSSample),  "initWithRMSScore:lastSampleCount:",  v11 >> 1,  v13);
    -[NSMutableArray addObject:](self->_rmsSamplesForEntireAudio, "addObject:", v14);
    if (-[RMSSample lastSampleCount](v14, "lastSampleCount") <= self->_bestEarlyDetectSample + 160
      || self->_speechVoiceLevel != -1.0)
    {
      goto LABEL_14;
    }

    -[CSShadowMicScoreCreator _calculateSpeechVoicingLevel](self, "_calculateSpeechVoicingLevel");
    if (self->_speechVoiceLevel == -1.0) {
      break;
    }
    -[NSMutableArray removeAllObjects](self->_rmsSamplesForEntireAudio, "removeAllObjects");
LABEL_14:

    unint64_t v11 = v12;
    unint64_t v15 = v12 + 160LL;
    v12 += 80;
    if (v15 > -[NSMutableData length](self->_audioBuffer, "length")) {
      goto LABEL_15;
    }
  }

  v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v19 = 136315394;
    v20 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    __int16 v21 = 2048;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "%s _speechVoiceLevel %lu is 0",  (uint8_t *)&v19,  0x16u);
  }

  self->_shadowMicScore = -1.0;
}

- (double)_calculateRMSWithFrameData:(signed __int16)a3[80]
{
  uint64_t v3 = 0LL;
  int64x2_t v4 = 0uLL;
  int64x2_t v5 = 0uLL;
  int64x2_t v6 = 0uLL;
  int64x2_t v7 = 0uLL;
  do
  {
    int16x8_t v8 = *(int16x8_t *)&a3[v3];
    uint32x4_t v9 = (uint32x4_t)vmull_high_s16(v8, v8);
    uint32x4_t v10 = (uint32x4_t)vmull_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v8.i8);
    int64x2_t v7 = (int64x2_t)vaddw_high_u32((uint64x2_t)v7, v9);
    int64x2_t v6 = (int64x2_t)vaddw_u32((uint64x2_t)v6, *(uint32x2_t *)v9.i8);
    int64x2_t v5 = (int64x2_t)vaddw_high_u32((uint64x2_t)v5, v10);
    int64x2_t v4 = (int64x2_t)vaddw_u32((uint64x2_t)v4, *(uint32x2_t *)v10.i8);
    v3 += 8LL;
  }

  while (v3 != 80);
  return (double)vaddvq_s64(vaddq_s64(vaddq_s64(v4, v6), vaddq_s64(v5, v7)));
}

- (void)_calculateSpeechVoicingLevel
{
  unint64_t v3 = vcvtms_u32_f32((float)(unint64_t)-[NSMutableArray count](self->_rmsSamplesForEntireAudio, "count") * 0.2);
  id v4 = -[NSMutableArray count](self->_rmsSamplesForEntireAudio, "count");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  int64x2_t v5 = self->_rmsSamplesForEntireAudio;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v15;
    double v10 = 0.0;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      if (!(v3 - (void)v4 + v8 + v11)) {
        break;
      }
      objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "RMSScore", (void)v14);
      double v10 = v10 + v12;
      if (v7 == (id)++v11)
      {
        v8 += v11;
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    double v10 = 0.0;
  }

  double v13 = -1.0;
  if (v4 != (id)v3) {
    double v13 = floor(v10 / (double)((unint64_t)v4 - v3));
  }
  self->_speechVoiceLevel = v13;
}

- (void)_calculateNumberOfVoicingFrames
{
  unint64_t bestEarlyDetectSample = self->_bestEarlyDetectSample;
  double speechVoiceLevel = self->_speechVoiceLevel;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  int64x2_t v5 = self->_rmsSamplesForEntireAudio;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0LL;
    unint64_t v9 = bestEarlyDetectSample + 320;
    uint64_t v10 = *(void *)v16;
    double v11 = (double)(unint64_t)floor(speechVoiceLevel * 0.25);
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v5);
        }
        double v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((unint64_t)objc_msgSend(v13, "lastSampleCount", (void)v15) >= v9
          && (unint64_t)[v13 lastSampleCount] + 80 < self->_bestEndDetectSample)
        {
          ++self->_numberOfTotalFramesETFT;
          [v13 RMSScore];
          if (v14 >= v11) {
            ++v8;
          }
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  self->_numberOfVoicingFrames = v8;
}

- (unint64_t)bestStartDetectSample
{
  return self->_bestStartDetectSample;
}

- (void)setBestStartDetectSample:(unint64_t)a3
{
  self->_unint64_t bestStartDetectSample = a3;
}

- (unint64_t)bestEarlyDetectSample
{
  return self->_bestEarlyDetectSample;
}

- (void)setBestEarlyDetectSample:(unint64_t)a3
{
  self->_unint64_t bestEarlyDetectSample = a3;
}

- (unint64_t)bestEndDetectSample
{
  return self->_bestEndDetectSample;
}

- (void)setBestEndDetectSample:(unint64_t)a3
{
  self->_unint64_t bestEndDetectSample = a3;
}

- (double)shadowMicScore
{
  return self->_shadowMicScore;
}

- (void)setShadowMicScore:(double)a3
{
  self->_shadowMicScore = a3;
}

- (NSMutableArray)rmsSamplesForEntireAudio
{
  return self->_rmsSamplesForEntireAudio;
}

- (void)setRmsSamplesForEntireAudio:(id)a3
{
}

- (NSMutableData)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setAudioBuffer:(id)a3
{
}

- (double)speechVoiceLevel
{
  return self->_speechVoiceLevel;
}

- (void)setSpeechVoiceLevel:(double)a3
{
  self->_double speechVoiceLevel = a3;
}

- (unint64_t)numberOfVoicingFrames
{
  return self->_numberOfVoicingFrames;
}

- (void)setNumberOfVoicingFrames:(unint64_t)a3
{
  self->_numberOfVoicingFrames = a3;
}

- (int64_t)numberOfTotalFramesETFT
{
  return self->_numberOfTotalFramesETFT;
}

- (void)setNumberOfTotalFramesETFT:(int64_t)a3
{
  self->_numberOfTotalFramesETFT = a3;
}

- (void).cxx_destruct
{
}

@end