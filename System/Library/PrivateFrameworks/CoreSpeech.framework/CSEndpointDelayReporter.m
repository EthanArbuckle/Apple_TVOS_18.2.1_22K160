@interface CSEndpointDelayReporter
- (BOOL)didReportEndpointDelay;
- (BOOL)isMedocEnabled;
- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4;
- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4 withMedocEnabled:(BOOL)a5;
- (NSString)curTRPId;
- (NSString)requestMHUUID;
- (NSUUID)turnIdentifier;
- (double)endpointTimeInMs;
- (double)userSpeakingEndedTimeInMs;
- (double)userSpeakingStartedTimeInMs;
- (unint64_t)audioDeliveryHostTimeDelta;
- (unint64_t)endpointBufferHostTime;
- (unint64_t)endpointHostTime;
- (unint64_t)estimatedUserSpeakingEndedHostTime;
- (unint64_t)estimatedUserSpeakingStartedHostTime;
- (unint64_t)stopRecordingHostTime;
- (unint64_t)userSpeakingEndedHostTime;
- (unint64_t)userSpeakingStartedHostTime;
- (void)_emitEndpointDelayMessage:(double)a3 epdModel:(double)a4 speakingStart:(double)a5 speakingEnd:(double)a6 epdV2:(double)a7;
- (void)_reportUserSpeakingContext;
- (void)instrumentEndpointSignpostsForServerEndpointWithEndTime:(double)a3 leadingSilence:(double)a4 trailingSilence:(double)a5 stopRecordingMachContinuousTime:(unint64_t)a6 skippedSamplesTimeInSec:(double)a7 firstAudioSampleSensorHostTime:(unint64_t)a8;
- (void)reportEndpointDelayIfNeed;
- (void)reset;
- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3;
- (void)setCurTRPId:(id)a3;
- (void)setDidReportEndpointDelay:(BOOL)a3;
- (void)setEndpointBufferHostTime:(unint64_t)a3;
- (void)setEndpointHostTime:(unint64_t)a3;
- (void)setEndpointTimeInMs:(double)a3;
- (void)setIsMedocEnabled:(BOOL)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4;
- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4 withTrpId:(id)a5;
- (void)setStopRecordingHostTime:(unint64_t)a3;
- (void)setTurnIdentifier:(id)a3;
- (void)setUserSpeakingEndedHostTime:(unint64_t)a3;
- (void)setUserSpeakingEndedTimeInMs:(double)a3;
- (void)setUserSpeakingStartedHostTime:(unint64_t)a3;
- (void)setUserSpeakingStartedTimeInMs:(double)a3;
@end

@implementation CSEndpointDelayReporter

- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4
{
  return -[CSEndpointDelayReporter initWithRequestMHUUID:turnIdentifier:withMedocEnabled:]( self,  "initWithRequestMHUUID:turnIdentifier:withMedocEnabled:",  a3,  a4,  0LL);
}

- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4 withMedocEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSEndpointDelayReporter;
  v10 = -[CSEndpointDelayReporter init](&v19, "init");
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    requestMHUUID = v10->_requestMHUUID;
    v10->_requestMHUUID = v11;

    v13 = (NSUUID *)[v9 copy];
    turnIdentifier = v10->_turnIdentifier;
    v10->_turnIdentifier = v13;

    v10->_isMedocEnabled = v5;
    v15 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v10->_requestMHUUID;
      v17 = v10->_turnIdentifier;
      *(_DWORD *)buf = 136315906;
      v21 = "-[CSEndpointDelayReporter initWithRequestMHUUID:turnIdentifier:withMedocEnabled:]";
      __int16 v22 = 2112;
      v23 = v16;
      __int16 v24 = 2112;
      v25 = v17;
      __int16 v26 = 1024;
      BOOL v27 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s _requestMHUUID: %@, _turnIdentifier: %@ _medocEnabled: %d",  buf,  0x26u);
    }

    -[CSEndpointDelayReporter reset](v10, "reset");
  }

  return v10;
}

- (void)reset
{
  v3 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CSEndpointDelayReporter reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }

  self->_didReportEndpointDelay = 0;
  *(_OWORD *)&self->_endpointTimeInMs = 0u;
  *(_OWORD *)&self->_userSpeakingEndedTimeInMs = 0u;
  *(_OWORD *)&self->_endpointHostTime = 0u;
  *(_OWORD *)&self->_userSpeakingStartedHostTime = 0u;
  self->_stopRecordingHostTime = 0LL;
  curTRPId = self->_curTRPId;
  self->_curTRPId = 0LL;
}

- (unint64_t)estimatedUserSpeakingStartedHostTime
{
  double endpointTimeInMs = self->_endpointTimeInMs;
  if (endpointTimeInMs > 0.0)
  {
    if (self->_endpointBufferHostTime)
    {
      double userSpeakingStartedTimeInMs = self->_userSpeakingStartedTimeInMs;
    }
  }

  v6 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
  {
    unint64_t endpointBufferHostTime = self->_endpointBufferHostTime;
    double v8 = self->_userSpeakingStartedTimeInMs;
    int v9 = 136315906;
    v10 = "-[CSEndpointDelayReporter estimatedUserSpeakingStartedHostTime]";
    __int16 v11 = 2050;
    double v12 = endpointTimeInMs;
    __int16 v13 = 2050;
    unint64_t v14 = endpointBufferHostTime;
    __int16 v15 = 2050;
    double v16 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Unable to accurately estimate userSpeakingStartedHostTime. _endpointTimeInMs: %{public}f, _endpointBufferHostTi me: %{public}llu, _userSpeakingStartedTimeInMs: %{public}f",  (uint8_t *)&v9,  0x2Au);
  }

  return 0LL;
}

- (unint64_t)estimatedUserSpeakingEndedHostTime
{
  double endpointTimeInMs = self->_endpointTimeInMs;
  if (endpointTimeInMs > 0.0 && self->_endpointBufferHostTime)
  {
    double userSpeakingEndedTimeInMs = self->_userSpeakingEndedTimeInMs;
  }

  v6 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
  {
    double v9 = self->_userSpeakingEndedTimeInMs;
    unint64_t endpointBufferHostTime = self->_endpointBufferHostTime;
    int v10 = 136315906;
    __int16 v11 = "-[CSEndpointDelayReporter estimatedUserSpeakingEndedHostTime]";
    __int16 v12 = 2050;
    double v13 = endpointTimeInMs;
    __int16 v14 = 2050;
    unint64_t v15 = endpointBufferHostTime;
    __int16 v16 = 2050;
    double v17 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Unable to accurately estimate userSpeakingEndedHostTime. _endpointTimeInMs: %{public}f, _endpointBufferHostTime : %{public}llu, _userSpeakingEndedTimeInMs: %{public}f",  (uint8_t *)&v10,  0x2Au);
  }

  return 0LL;
}

- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4 withTrpId:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  -[CSEndpointDelayReporter setSpeechRecognizedContext:withEndpointerMetrics:]( self,  "setSpeechRecognizedContext:withEndpointerMetrics:",  v9,  v8);
}

- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"leadingSilence"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"trailingSilence"]);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"endTime"]);

    if (v8 && v9 && v10)
    {
      [v8 doubleValue];
      self->_double userSpeakingStartedTimeInMs = v11;
      [v10 doubleValue];
      double v13 = v12;
      [v9 doubleValue];
      self->_double userSpeakingEndedTimeInMs = v13 - v14;
      self->_unint64_t endpointBufferHostTime = (unint64_t)[v6 endpointBufferHostTime];
      self->_unint64_t endpointHostTime = (unint64_t)[v6 endpointHostTime];
      self->_unint64_t audioDeliveryHostTimeDelta = (unint64_t)[v6 audioDeliveryHostTimeDelta];
      [v6 totalAudioRecorded];
      self->_double endpointTimeInMs = v15;
      self->_unint64_t userSpeakingStartedHostTime = -[CSEndpointDelayReporter estimatedUserSpeakingStartedHostTime]( self,  "estimatedUserSpeakingStartedHostTime");
      unint64_t v16 = -[CSEndpointDelayReporter estimatedUserSpeakingEndedHostTime](self, "estimatedUserSpeakingEndedHostTime");
      self->_userSpeakingEndedHostTime = v16;
      double v17 = (os_log_s *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        double userSpeakingStartedTimeInMs = self->_userSpeakingStartedTimeInMs;
        double userSpeakingEndedTimeInMs = self->_userSpeakingEndedTimeInMs;
        unint64_t stopRecordingHostTime = self->_stopRecordingHostTime;
        unint64_t endpointBufferHostTime = self->_endpointBufferHostTime;
        unint64_t endpointHostTime = self->_endpointHostTime;
        unint64_t audioDeliveryHostTimeDelta = self->_audioDeliveryHostTimeDelta;
        unint64_t userSpeakingStartedHostTime = self->_userSpeakingStartedHostTime;
        int v25 = 136317186;
        __int16 v26 = "-[CSEndpointDelayReporter setSpeechRecognizedContext:withEndpointerMetrics:]";
        __int16 v27 = 2050;
        double v28 = userSpeakingStartedTimeInMs;
        __int16 v29 = 2050;
        double v30 = userSpeakingEndedTimeInMs;
        __int16 v31 = 2050;
        unint64_t v32 = userSpeakingStartedHostTime;
        __int16 v33 = 2050;
        unint64_t v34 = v16;
        __int16 v35 = 2050;
        unint64_t v36 = stopRecordingHostTime;
        __int16 v37 = 2050;
        unint64_t v38 = endpointBufferHostTime;
        __int16 v39 = 2050;
        unint64_t v40 = endpointHostTime;
        __int16 v41 = 2050;
        unint64_t v42 = audioDeliveryHostTimeDelta;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s _userSpeakingStartedTimeInMs %{public}f, _userSpeakingEndedTimeInMs: %{public}f, _userSpeakingStartedHostTi me: %{public}llu, _userSpeakingEndedHostTime: %{public}llu, _stopRecordingHostTime: %{public}llu, _endpointBuf ferHostTime: %{public}llu, _endpointHostTime: %{public}llu, _audioDeliveryHostTimeDelta: %{public}llu",  (uint8_t *)&v25,  0x5Cu);
      }

      -[CSEndpointDelayReporter _reportUserSpeakingContext](self, "_reportUserSpeakingContext");
    }
  }
}

- (void)reportEndpointDelayIfNeed
{
  unint64_t stopRecordingHostTime = self->_stopRecordingHostTime;
  if (!stopRecordingHostTime)
  {
LABEL_15:
    v21 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      unint64_t userSpeakingEndedHostTime = self->_userSpeakingEndedHostTime;
      double userSpeakingEndedTimeInMs = self->_userSpeakingEndedTimeInMs;
      double endpointTimeInMs = self->_endpointTimeInMs;
      *(_DWORD *)buf = 136316162;
      v58 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
      __int16 v59 = 2050;
      v60 = (const char *)stopRecordingHostTime;
      __int16 v61 = 2050;
      v62 = (const char *)userSpeakingEndedHostTime;
      __int16 v63 = 2050;
      double v64 = userSpeakingEndedTimeInMs;
      __int16 v65 = 2050;
      double v66 = endpointTimeInMs;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Not reporting EPD due to unexpected zero or negative component values: _stopRecordingHostTime: %{public}llu, _userSpeakingEndedHostTime: %{public}llu, _userSpeakingEndedTimeInMs: %{public}f, _endpointTimeInMs: %{public}f",  buf,  0x34u);
      unint64_t stopRecordingHostTime = self->_stopRecordingHostTime;
    }

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  stopRecordingHostTime,  @"stopRecordingHostTime"));
    v54[0] = v22;
    v53[1] = @"userSpeakingEndedHostTime";
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_userSpeakingEndedHostTime));
    v54[1] = v23;
    v53[2] = @"userSpeakingEndedTimeInMs";
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_userSpeakingEndedTimeInMs));
    v54[2] = v24;
    v53[3] = @"endpointTimeInMs";
    int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_endpointTimeInMs));
    v54[3] = v25;
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  4LL));

    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
    double v28 = v27;
    __int16 v29 = &kCSDiagnosticReporterEndpointDelayComponentsNegative;
    goto LABEL_18;
  }

  unint64_t v4 = self->_userSpeakingEndedHostTime;
  if (!v4 || self->_userSpeakingEndedTimeInMs <= 0.0 || self->_endpointTimeInMs <= 0.0)
  {
    goto LABEL_15;
  }

  self->_didReportEndpointDelay = 1;
  +[CSFTimeUtils hostTimeToTimeInterval:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToTimeInterval:",  stopRecordingHostTime - v4);
  double v6 = v5 * 1000.0;
  double v7 = self->_endpointTimeInMs - self->_userSpeakingEndedTimeInMs;
  double v8 = v5 * 1000.0 - v7;
  double v10 = v7 + v9;
  double v11 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v58 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
    __int16 v59 = 2050;
    v60 = *(const char **)&v6;
    __int16 v61 = 2050;
    v62 = *(const char **)&v7;
    __int16 v63 = 2050;
    double v64 = v8;
    __int16 v65 = 2050;
    double v66 = v7 + v9;
    __int16 v67 = 2050;
    double v68 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "KeyLog - %s EPD (ms): %{public}f, EPD_Model (ms): %{public}f, EPD_Latency (ms): %{public}f, EPD_V2 (ms): %{public} f, EPD_Latency_V2 (ms): %{public}f",  buf,  0x3Eu);
  }

  uint64_t v12 = mach_continuous_time();
  uint64_t v13 = mach_absolute_time();
  os_signpost_id_t v14 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
  double v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  unint64_t v16 = v15;
  if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    objc_super v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  }

  else
  {
    uint64_t v17 = v12 - v13;
    if (os_signpost_enabled(v15))
    {
      v18 = (const char *)(self->_userSpeakingEndedHostTime + v17);
      *(_DWORD *)buf = 134349570;
      v58 = v18;
      __int16 v59 = 2080;
      v60 = "SiriX";
      __int16 v61 = 2080;
      v62 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "EndpointDelay",  "%{public, signpost.description:begin_time}llu, %s %s",  buf,  0x20u);
    }

    objc_super v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_signpost_enabled(v19))
    {
      v20 = (const char *)(self->_stopRecordingHostTime + v17);
      *(_DWORD *)buf = 134349570;
      v58 = v20;
      __int16 v59 = 2080;
      v60 = "SiriX";
      __int16 v61 = 2080;
      v62 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  v14,  "EndpointDelay",  "%{public, signpost.description:end_time}llu, %s %s",  buf,  0x20u);
    }
  }

  *(float *)&double v35 = v6;
  double v36 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:]( &OBJC_CLASS___CSFTimeUtils,  "millisecondsToNs:",  v35);
  *(float *)&double v37 = v7;
  double v38 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:]( &OBJC_CLASS___CSFTimeUtils,  "millisecondsToNs:",  v37);
  double userSpeakingStartedTimeInMs = self->_userSpeakingStartedTimeInMs;
  *(float *)&double userSpeakingStartedTimeInMs = userSpeakingStartedTimeInMs;
  double v40 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:]( &OBJC_CLASS___CSFTimeUtils,  "millisecondsToNs:",  userSpeakingStartedTimeInMs);
  double v41 = self->_userSpeakingEndedTimeInMs;
  *(float *)&double v41 = v41;
  double v42 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:]( &OBJC_CLASS___CSFTimeUtils,  "millisecondsToNs:",  v41);
  *(float *)&double v43 = v10;
  -[CSEndpointDelayReporter _emitEndpointDelayMessage:epdModel:speakingStart:speakingEnd:epdV2:]( self,  "_emitEndpointDelayMessage:epdModel:speakingStart:speakingEnd:epdV2:",  v36,  v38,  v40,  v42,  (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:](&OBJC_CLASS___CSFTimeUtils, "millisecondsToNs:", v43));
  v44 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    requestMHUUID = self->_requestMHUUID;
    *(_DWORD *)buf = 136315394;
    v58 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
    __int16 v59 = 2112;
    v60 = (const char *)requestMHUUID;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%s Submit MHEndpointDelayContextEvent to SELF for MH ID: %@",  buf,  0x16u);
  }

  if (v6 < 0.0 || v7 < 0.0 || v8 < 0.0)
  {
    v46 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v58 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
      __int16 v59 = 2048;
      v60 = *(const char **)&v6;
      __int16 v61 = 2048;
      v62 = *(const char **)&v7;
      __int16 v63 = 2048;
      double v64 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%s One or more EPD values are negative: EPD: %f, EPD_Model: %f, EPD_Latency: %f",  buf,  0x2Au);
    }

    v55[0] = @"EPD";
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
    v56[0] = v47;
    v55[1] = @"EPD_Model";
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
    v56[1] = v48;
    v55[2] = @"EPD_Latency";
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
    v56[2] = v49;
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  3LL));

    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
    double v28 = v27;
    __int16 v29 = &kCSDiagnosticReporterEndpointDelayValuesNegative;
LABEL_18:
    [v27 submitEndpointerIssueReport:*v29 withContext:v26];
  }

- (void)instrumentEndpointSignpostsForServerEndpointWithEndTime:(double)a3 leadingSilence:(double)a4 trailingSilence:(double)a5 stopRecordingMachContinuousTime:(unint64_t)a6 skippedSamplesTimeInSec:(double)a7 firstAudioSampleSensorHostTime:(unint64_t)a8
{
  uint64_t v14 = CSMachAbsoluteTimeToMachContinuousTime(a8, a2);
  uint64_t v15 = CSMachAbsoluteTimeAddTimeInterval(v14, a7);
  double v16 = a3 - a5;
  double v17 = (a3 - a5) / 1000.0;
  unint64_t v18 = CSMachAbsoluteTimeAddTimeInterval(v15, v17);
  if (a6 >= v18)
  {
    double TimeInterval = CSMachAbsoluteTimeGetTimeInterval(a6 - v18);
    *(float *)&double TimeInterval = TimeInterval;
    double v22 = (double)(unint64_t)+[CSFTimeUtils secondsToNs:]( &OBJC_CLASS___CSFTimeUtils,  "secondsToNs:",  TimeInterval);
    *(float *)&double v23 = a5;
    double v24 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:]( &OBJC_CLASS___CSFTimeUtils,  "millisecondsToNs:",  v23);
    *(float *)&double v25 = a4;
    double v26 = (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:]( &OBJC_CLASS___CSFTimeUtils,  "millisecondsToNs:",  v25);
    *(float *)&double v27 = v16;
    -[CSEndpointDelayReporter _emitEndpointDelayMessage:epdModel:speakingStart:speakingEnd:epdV2:]( self,  "_emitEndpointDelayMessage:epdModel:speakingStart:speakingEnd:epdV2:",  v22,  v24,  v26,  (double)(unint64_t)+[CSFTimeUtils millisecondsToNs:](&OBJC_CLASS___CSFTimeUtils, "millisecondsToNs:", v27),  0.0);
    double v28 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      requestMHUUID = self->_requestMHUUID;
      int v33 = 136316418;
      double v34 = "-[CSEndpointDelayReporter instrumentEndpointSignpostsForServerEndpointWithEndTime:leadingSilence:trailingSil"
            "ence:stopRecordingMachContinuousTime:skippedSamplesTimeInSec:firstAudioSampleSensorHostTime:]";
      __int16 v35 = 2112;
      double v36 = *(double *)&requestMHUUID;
      __int16 v37 = 2050;
      double v38 = v22 / 1000000.0;
      __int16 v39 = 2050;
      double v40 = v24 / 1000000.0;
      __int16 v41 = 2050;
      double v42 = (v22 - v24) / 1000000.0;
      __int16 v43 = 2050;
      double v44 = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "KeyLog - %s Submitted SEP to SELF for MH ID: %@ - EPD (ms): %{public}f, EPD_Model (ms): %{public}f, EPD_Latency (ms): %{public}f, Skipped Samples (sec): %{public}f",  (uint8_t *)&v33,  0x3Eu);
    }

    self->_unint64_t userSpeakingStartedHostTime = CSMachAbsoluteTimeAddTimeInterval(v15, a4 / 1000.0);
    self->_unint64_t userSpeakingEndedHostTime = CSMachAbsoluteTimeAddTimeInterval(v15, v17);
    -[CSEndpointDelayReporter _reportUserSpeakingContext](self, "_reportUserSpeakingContext");
    os_signpost_id_t v30 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    double v31 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    double v32 = v31;
    if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    }

    else
    {
      if (os_signpost_enabled(v31))
      {
        int v33 = 134349570;
        double v34 = (const char *)v18;
        __int16 v35 = 2080;
        double v36 = COERCE_DOUBLE("SiriX");
        __int16 v37 = 2080;
        double v38 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v32,  OS_SIGNPOST_INTERVAL_BEGIN,  v30,  "EndpointDelay",  "%{public, signpost.description:begin_time}llu, %s %s",  (uint8_t *)&v33,  0x20u);
      }

      v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v20))
      {
        int v33 = 134349570;
        double v34 = (const char *)a6;
        __int16 v35 = 2080;
        double v36 = COERCE_DOUBLE("SiriX");
        __int16 v37 = 2080;
        double v38 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_END,  v30,  "EndpointDelay",  "%{public, signpost.description:end_time}llu, %s %s",  (uint8_t *)&v33,  0x20u);
      }
    }
  }

  else
  {
    objc_super v19 = (void *)CSLogCategoryEP;
    if (!os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    v20 = v19;
    int v33 = 136315650;
    double v34 = "-[CSEndpointDelayReporter instrumentEndpointSignpostsForServerEndpointWithEndTime:leadingSilence:trailingSilen"
          "ce:stopRecordingMachContinuousTime:skippedSamplesTimeInSec:firstAudioSampleSensorHostTime:]";
    __int16 v35 = 2050;
    double v36 = a3 / 1000.0;
    __int16 v37 = 2050;
    double v38 = CSMachAbsoluteTimeGetTimeInterval(a6 - v15);
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s Server End Time - %{public}f, Host Recording Time - %{public}f",  (uint8_t *)&v33,  0x20u);
  }
}

- (void)_emitEndpointDelayMessage:(double)a3 epdModel:(double)a4 speakingStart:(double)a5 speakingEnd:(double)a6 epdV2:(double)a7
{
  id v13 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointDelayContext);
  [v13 setEndpointDelayInNs:(unint64_t)a3];
  [v13 setEndpointModelDelayInNs:(unint64_t)a4];
  [v13 setSpeakingStartInNs:(unint64_t)a5];
  [v13 setSpeakingEndInNs:(unint64_t)a6];
  if (a7 != 0.0) {
    [v13 setEndpointDelayInNsV2:(unint64_t)a7];
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHClientEventByMhUUID:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHClientEventByMhUUID:",  self->_requestMHUUID));
  [v14 setEndpointDelayContext:v13];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v15 emitMessage:v14];

  if (a3 >= 3.0e10)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
    uint64_t v17 = kCSDiagnosticReporterEndpointDelayTooHigh;
    v20 = @"EPD";
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    v21 = v18;
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    [v16 submitEndpointerIssueReport:v17 withContext:v19];
  }
}

- (void)_reportUserSpeakingContext
{
  if (self->_turnIdentifier || self->_requestMHUUID)
  {
    if (self->_userSpeakingStartedHostTime)
    {
      if (self->_curTRPId && self->_isMedocEnabled)
      {
        id v3 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUserSpeakingContext);
        id v4 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUserSpeakingStarted);
        [v4 setExists:1];
        [v3 setStartedOrChanged:v4];
        double v5 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", self->_curTRPId);
        id v6 = [[SISchemaUUID alloc] initWithNSUUID:v5];
        [v3 setTrpId:v6];

        id v7 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
        id v8 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
        id v9 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
        double v10 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  self->_requestMHUUID);
        id v11 = [v9 initWithNSUUID:v10];
        [v8 setMhId:v11];

        [v7 setEventMetadata:v8];
        [v7 setUserSpeakingContext:v3];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
        [v12 emitMessage:v7 timestamp:self->_userSpeakingStartedHostTime];
      }

      else
      {
        id v3 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUserSpeakingContext);
        id v4 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUserSpeakingStarted);
        [v4 setExists:1];
        [v3 setStartedOrChanged:v4];
        double v5 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
        -[NSUUID logInstrumentation:machAbsoluteTime:turnIdentifier:]( v5,  "logInstrumentation:machAbsoluteTime:turnIdentifier:",  v3,  self->_userSpeakingStartedHostTime,  self->_turnIdentifier);
      }

      id v13 = (os_log_s *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        curTRPId = self->_curTRPId;
        int v29 = 136315394;
        os_signpost_id_t v30 = "-[CSEndpointDelayReporter _reportUserSpeakingContext]";
        __int16 v31 = 2112;
        double v32 = curTRPId;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s logInstrumentation for speakingStarted, trpId: %@",  (uint8_t *)&v29,  0x16u);
      }
    }

    uint64_t v15 = self->_curTRPId;
    if (self->_userSpeakingEndedHostTime)
    {
      if (v15 && self->_isMedocEnabled)
      {
        id v16 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUserSpeakingContext);
        id v17 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHUserSpeakingEnded);
        [v17 setExists:1];
        [v16 setEnded:v17];
        unint64_t v18 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", self->_curTRPId);
        id v19 = [[SISchemaUUID alloc] initWithNSUUID:v18];
        [v16 setTrpId:v19];

        id v20 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
        id v21 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
        id v22 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
        double v23 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  self->_requestMHUUID);
        id v24 = [v22 initWithNSUUID:v23];
        [v21 setMhId:v24];

        [v20 setEventMetadata:v21];
        [v20 setUserSpeakingContext:v16];
        double v25 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
        [v25 emitMessage:v20 timestamp:self->_userSpeakingEndedHostTime];
      }

      else
      {
        id v16 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUserSpeakingContext);
        id v17 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUserSpeakingEnded);
        [v17 setExists:1];
        [v16 setEnded:v17];
        unint64_t v18 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
        -[NSUUID logInstrumentation:machAbsoluteTime:turnIdentifier:]( v18,  "logInstrumentation:machAbsoluteTime:turnIdentifier:",  v16,  self->_userSpeakingEndedHostTime,  self->_turnIdentifier);
      }

      double v26 = (os_log_s *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        double v27 = self->_curTRPId;
        int v29 = 136315394;
        os_signpost_id_t v30 = "-[CSEndpointDelayReporter _reportUserSpeakingContext]";
        __int16 v31 = 2112;
        double v32 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s logInstrumentation for speakingEnded, trpId: %@",  (uint8_t *)&v29,  0x16u);
      }
    }

    else if (v15 && self->_isMedocEnabled)
    {
      double v28 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
      [v28 submitSELFIssueReport:kCSDiagnosticReporterMHUserSpeakingContextEndedMissingWithMedocEnabled];
    }
  }

- (double)endpointTimeInMs
{
  return self->_endpointTimeInMs;
}

- (void)setEndpointTimeInMs:(double)a3
{
  self->_double endpointTimeInMs = a3;
}

- (double)userSpeakingStartedTimeInMs
{
  return self->_userSpeakingStartedTimeInMs;
}

- (void)setUserSpeakingStartedTimeInMs:(double)a3
{
  self->_double userSpeakingStartedTimeInMs = a3;
}

- (double)userSpeakingEndedTimeInMs
{
  return self->_userSpeakingEndedTimeInMs;
}

- (void)setUserSpeakingEndedTimeInMs:(double)a3
{
  self->_double userSpeakingEndedTimeInMs = a3;
}

- (unint64_t)endpointBufferHostTime
{
  return self->_endpointBufferHostTime;
}

- (void)setEndpointBufferHostTime:(unint64_t)a3
{
  self->_unint64_t endpointBufferHostTime = a3;
}

- (unint64_t)endpointHostTime
{
  return self->_endpointHostTime;
}

- (void)setEndpointHostTime:(unint64_t)a3
{
  self->_unint64_t endpointHostTime = a3;
}

- (unint64_t)audioDeliveryHostTimeDelta
{
  return self->_audioDeliveryHostTimeDelta;
}

- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3
{
  self->_unint64_t audioDeliveryHostTimeDelta = a3;
}

- (unint64_t)userSpeakingStartedHostTime
{
  return self->_userSpeakingStartedHostTime;
}

- (void)setUserSpeakingStartedHostTime:(unint64_t)a3
{
  self->_unint64_t userSpeakingStartedHostTime = a3;
}

- (unint64_t)userSpeakingEndedHostTime
{
  return self->_userSpeakingEndedHostTime;
}

- (void)setUserSpeakingEndedHostTime:(unint64_t)a3
{
  self->_unint64_t userSpeakingEndedHostTime = a3;
}

- (unint64_t)stopRecordingHostTime
{
  return self->_stopRecordingHostTime;
}

- (void)setStopRecordingHostTime:(unint64_t)a3
{
  self->_unint64_t stopRecordingHostTime = a3;
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setTurnIdentifier:(id)a3
{
}

- (BOOL)didReportEndpointDelay
{
  return self->_didReportEndpointDelay;
}

- (void)setDidReportEndpointDelay:(BOOL)a3
{
  self->_didReportEndpointDelay = a3;
}

- (NSString)curTRPId
{
  return self->_curTRPId;
}

- (void)setCurTRPId:(id)a3
{
}

- (BOOL)isMedocEnabled
{
  return self->_isMedocEnabled;
}

- (void)setIsMedocEnabled:(BOOL)a3
{
  self->_isMedocEnabled = a3;
}

- (void).cxx_destruct
{
}

@end