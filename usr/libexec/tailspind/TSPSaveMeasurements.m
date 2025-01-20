@interface TSPSaveMeasurements
- (NSMutableDictionary)timeSpentByPhases;
- (TSPSaveMeasurements)init;
- (double)lostTimePeriodAtStartSecs;
- (double)ratioTimePeriodCovered;
- (double)requestProcessingLatencySecs;
- (double)tailspinDurationSecs;
- (int64_t)fileSizeBytes;
- (unint64_t)_startRecordingTimeForPhase:(const char *)a3;
- (unint64_t)request_id;
- (void)_stopRecordingTimeForPhase:(const char *)a3;
- (void)recordLostTimePeriodAtStart:(unint64_t)a3;
- (void)recordRatioTimePeriodCovered:(double)a3;
- (void)recordRequestProcessingLatencySecsWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4;
- (void)recordTailspinDurationWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4;
- (void)recordTimeForSaveStandardChunksWithoutPostProcessing:(unint64_t)a3;
- (void)setFileSizeBytes:(int64_t)a3;
- (void)startRecordingTimeForAugmentLoggingPhase:(BOOL)a3 collectOSLog:(BOOL)a4 scrubData:(BOOL)a5;
- (void)startRecordingTimeForAugmentPhase:(const char *)a3 pid:(int)a4 originalFd:(int)a5 dupFd:(int)a6;
- (void)startRecordingTimeForAugmentSymbolicatePhase;
- (void)startRecordingTimeForDumpRequestPhase:(const char *)a3 pid:(int)a4;
- (void)startRecordingTimeForSaveStandardChunksPhase:(const char *)a3 pid:(int)a4;
- (void)stopRecordingTimeForAugmentLoggingPhase:(BOOL)a3;
- (void)stopRecordingTimeForAugmentPhase:(BOOL)a3 finalSizeBytes:(int64_t)a4;
- (void)stopRecordingTimeForAugmentSymbolicatePhase;
- (void)stopRecordingTimeForDumpRequestPhase:(id)a3;
- (void)stopRecordingTimeForSaveStandardChunksPhase:(BOOL)a3;
@end

@implementation TSPSaveMeasurements

- (TSPSaveMeasurements)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TSPSaveMeasurements;
  v2 = -[TSPSaveMeasurements init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    do
      unint64_t v4 = __ldaxr(&qword_100010408);
    while (__stlxr(v4 + 1, &qword_100010408));
    v2->_request_id = v4;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    timeSpentByPhases = v3->_timeSpentByPhases;
    v3->_timeSpentByPhases = (NSMutableDictionary *)v5;

    v3->_saveStandardChunksStartTimestampMCT = 0LL;
    __asm { FMOV            V0.2D, #-1.0 }

    *(_OWORD *)&v3->_ratioTimePeriodCovered = _Q0;
    v3->_lostTimePeriodAtStartSecs = -1.0;
  }

  return v3;
}

- (void)startRecordingTimeForDumpRequestPhase:(const char *)a3 pid:(int)a4
{
  int v7 = *__error();
  id v8 = sub_100002490();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = "<unknown>";
    if (a3) {
      v12 = a3;
    }
    int v13 = 136446466;
    v14 = v12;
    __int16 v15 = 1024;
    int v16 = a4;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  request_id,  "DumpRequest",  "Request from %{public}s [%d]",  (uint8_t *)&v13,  0x12u);
  }

  *__error() = v7;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "DumpRequest");
}

- (void)stopRecordingTimeForDumpRequestPhase:(id)a3
{
  id v4 = a3;
  int v5 = *__error();
  id v6 = sub_100002490();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  unint64_t request_id = self->_request_id;
  if (v4)
  {
    if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v14 = 138543362;
      id v15 = v4;
      v10 = "FAILED due to reason: %{public}@";
      v11 = v8;
      os_signpost_id_t v12 = request_id;
      uint32_t v13 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  v12,  "DumpRequest",  v10,  (uint8_t *)&v14,  v13);
    }
  }

  else if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v14) = 0;
    v10 = "SUCCEEDED";
    v11 = v8;
    os_signpost_id_t v12 = request_id;
    uint32_t v13 = 2;
    goto LABEL_8;
  }

  *__error() = v5;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "DumpRequest");
}

- (void)startRecordingTimeForSaveStandardChunksPhase:(const char *)a3 pid:(int)a4
{
  int v7 = *__error();
  id v8 = sub_100002490();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    os_signpost_id_t v12 = "<unknown>";
    if (a3) {
      os_signpost_id_t v12 = a3;
    }
    int v13 = 136446466;
    int v14 = v12;
    __int16 v15 = 1024;
    int v16 = a4;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  request_id,  "SaveStandardChunks",  "Save for '%{public}s [%d]",  (uint8_t *)&v13,  0x12u);
  }

  *__error() = v7;
  self->_saveStandardChunksStartTimestampMCT = -[TSPSaveMeasurements _startRecordingTimeForPhase:]( self,  "_startRecordingTimeForPhase:",  "SaveStandardChunks");
}

- (void)stopRecordingTimeForSaveStandardChunksPhase:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = *__error();
  id v6 = sub_100002490();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = "FAILED";
    if (v3) {
      v10 = "SUCCEEDED";
    }
    int v11 = 136315138;
    os_signpost_id_t v12 = v10;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_END,  request_id,  "SaveStandardChunks",  "%s",  (uint8_t *)&v11,  0xCu);
  }

  *__error() = v5;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "SaveStandardChunks");
}

- (void)recordTimeForSaveStandardChunksWithoutPostProcessing:(unint64_t)a3
{
  unint64_t saveStandardChunksStartTimestampMCT = self->_saveStandardChunksStartTimestampMCT;
  if (saveStandardChunksStartTimestampMCT) {
    BOOL v4 = saveStandardChunksStartTimestampMCT >= a3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    int v7 = *__error();
    id v8 = sub_100002490();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    os_signpost_id_t request_id = self->_request_id;
    if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      unint64_t v12 = self->_saveStandardChunksStartTimestampMCT;
      int v15 = 134349312;
      unint64_t v16 = v12;
      __int16 v17 = 2050;
      unint64_t v18 = a3;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  request_id,  "SaveStandardChunks_WithoutPostProcessing",  "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu",  (uint8_t *)&v15,  0x16u);
    }

    *__error() = v7;
    unint64_t v13 = a3 - self->_saveStandardChunksStartTimestampMCT;
    if (qword_1000125B8 != -1) {
      dispatch_once(&qword_1000125B8, &stru_10000C630);
    }
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&qword_1000125B0 * (double)v13 * 0.000000001));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_timeSpentByPhases,  "setObject:forKeyedSubscript:",  v14,  @"SaveStandardChunks_WithoutPostProcessing");
  }

- (void)startRecordingTimeForAugmentPhase:(const char *)a3 pid:(int)a4 originalFd:(int)a5 dupFd:(int)a6
{
  int v11 = *__error();
  id v12 = sub_100002490();
  unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  int v14 = v13;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    unint64_t v16 = "<unknown>";
    int v17 = 136446978;
    if (a3) {
      unint64_t v16 = a3;
    }
    unint64_t v18 = v16;
    __int16 v19 = 1024;
    int v20 = a4;
    __int16 v21 = 1024;
    int v22 = a5;
    __int16 v23 = 1024;
    int v24 = a6;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  request_id,  "Augment",  "Augment for %{public}s [%d], fd: %d, dup fd: %d",  (uint8_t *)&v17,  0x1Eu);
  }

  *__error() = v11;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "Augment");
}

- (void)stopRecordingTimeForAugmentPhase:(BOOL)a3 finalSizeBytes:(int64_t)a4
{
  BOOL v5 = a3;
  int v7 = *__error();
  id v8 = sub_100002490();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    id v12 = "FAILED";
    if (v5) {
      id v12 = "SUCCEEDED";
    }
    int v13 = 136315394;
    int v14 = v12;
    __int16 v15 = 2048;
    int64_t v16 = a4;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_END,  request_id,  "Augment",  "%s (final size: %{bytes}lld)",  (uint8_t *)&v13,  0x16u);
  }

  *__error() = v7;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "Augment");
  self->_fileSizeBytes = a4;
}

- (void)startRecordingTimeForAugmentLoggingPhase:(BOOL)a3 collectOSLog:(BOOL)a4 scrubData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  int v9 = *__error();
  id v10 = sub_100002490();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v14[0] = 67109632;
    v14[1] = v7;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  request_id,  "Augment_LoggingData",  "os_signpost: %{BOOL}d\nos_log: %{BOOL}d\nscrub_data: %{BOOL}d",  (uint8_t *)v14,  0x14u);
  }

  *__error() = v9;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "Augment_LoggingData");
}

- (void)stopRecordingTimeForAugmentLoggingPhase:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = *__error();
  id v6 = sub_100002490();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v10 = "FAILED";
    if (v3) {
      id v10 = "SUCCEEDED";
    }
    int v11 = 136315138;
    id v12 = v10;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_END,  request_id,  "Augment_LoggingData",  "%s",  (uint8_t *)&v11,  0xCu);
  }

  *__error() = v5;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "Augment_LoggingData");
}

- (void)startRecordingTimeForAugmentSymbolicatePhase
{
  int v3 = *__error();
  id v4 = sub_100002490();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  request_id,  "Augment_Symbolicate",  "",  v8,  2u);
  }

  *__error() = v3;
  -[TSPSaveMeasurements _startRecordingTimeForPhase:](self, "_startRecordingTimeForPhase:", "Augment_Symbolicate");
}

- (void)stopRecordingTimeForAugmentSymbolicatePhase
{
  int v3 = *__error();
  id v4 = sub_100002490();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_END,  request_id,  "Augment_Symbolicate",  "",  v8,  2u);
  }

  *__error() = v3;
  -[TSPSaveMeasurements _stopRecordingTimeForPhase:](self, "_stopRecordingTimeForPhase:", "Augment_Symbolicate");
}

- (void)recordRequestProcessingLatencySecsWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4
{
  if (qword_1000125B8 != -1) {
    dispatch_once(&qword_1000125B8, &stru_10000C630);
  }
  self->_requestProcessingLatencySecs = *(double *)&qword_1000125B0 * (double)(a4 - a3) * 0.000000001;
}

- (void)recordTailspinDurationWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4
{
  if (qword_1000125B8 != -1) {
    dispatch_once(&qword_1000125B8, &stru_10000C630);
  }
  self->_tailspinDurationSecs = *(double *)&qword_1000125B0 * (double)(a4 - a3) * 0.000000001;
}

- (void)recordRatioTimePeriodCovered:(double)a3
{
  self->_ratioTimePeriodCovered = a3;
}

- (void)recordLostTimePeriodAtStart:(unint64_t)a3
{
  if (qword_1000125B8 != -1) {
    dispatch_once(&qword_1000125B8, &stru_10000C630);
  }
  self->_lostTimePeriodAtStartSecs = *(double *)&qword_1000125B0 * (double)a3 * 0.000000001;
}

- (unint64_t)_startRecordingTimeForPhase:(const char *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  uint64_t v5 = mach_continuous_time();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeSpentByPhases, "setObject:forKeyedSubscript:", v6, v4);

  return v5;
}

- (void)_stopRecordingTimeForPhase:(const char *)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  uint64_t v4 = mach_continuous_time();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_timeSpentByPhases,  "objectForKeyedSubscript:",  v9));
  if (!v5) {
    sub_100007638();
  }
  id v6 = v5;
  id v7 = [v5 unsignedLongLongValue];
  if (qword_1000125B8 != -1) {
    dispatch_once(&qword_1000125B8, &stru_10000C630);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&qword_1000125B0 * (double)(v4 - (unint64_t)v7) * 0.000000001));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeSpentByPhases, "setObject:forKeyedSubscript:", v8, v9);
}

- (unint64_t)request_id
{
  return self->_request_id;
}

- (NSMutableDictionary)timeSpentByPhases
{
  return self->_timeSpentByPhases;
}

- (double)tailspinDurationSecs
{
  return self->_tailspinDurationSecs;
}

- (double)ratioTimePeriodCovered
{
  return self->_ratioTimePeriodCovered;
}

- (double)requestProcessingLatencySecs
{
  return self->_requestProcessingLatencySecs;
}

- (double)lostTimePeriodAtStartSecs
{
  return self->_lostTimePeriodAtStartSecs;
}

- (int64_t)fileSizeBytes
{
  return self->_fileSizeBytes;
}

- (void)setFileSizeBytes:(int64_t)a3
{
  self->_fileSizeBytes = a3;
}

- (void).cxx_destruct
{
}

@end