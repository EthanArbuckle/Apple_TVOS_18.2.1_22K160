@interface AFDiagnostics
+ (id)sharedDiagnostics;
- (AFDiagnostics)init;
- (AWDServerConnection)_serverConnection;
- (NSNumber)_connectionStartTime;
- (NSNumber)_voiceRecordingEndTime;
- (NSNumber)_voiceRecordingStartTime;
- (NSNumber)_voiceSendEndTime;
- (NSNumber)_voiceSendStartTime;
- (OS_dispatch_queue)_queue;
- (double)_currentTime;
- (unint64_t)_AWDTimestampTruncatedToHourPrecision;
- (unint64_t)_durationInMillisecondsFromTime:(double)a3 toTime:(double)a4;
- (void)_setConnectionStartTime:(id)a3;
- (void)_setVoiceRecordingEndTime:(id)a3;
- (void)_setVoiceRecordingStartTime:(id)a3;
- (void)_setVoiceSendEndTime:(id)a3;
- (void)_setVoiceSendStartTime:(id)a3;
- (void)_submitMetricWithIdentifier:(unsigned int)a3 generation:(id)a4;
- (void)_submitMetricWithIdentifier:(unsigned int)a3 hotShipIdentifier:(unsigned int)a4 hotShipTimestamp:(unint64_t)a5 generation:(id)a6;
- (void)flush;
- (void)logConnectionFailedWithError:(id)a3 connectionType:(int64_t)a4;
- (void)logConnectionOpenWithConnectionType:(int64_t)a3;
- (void)logConnectionStart;
- (void)logNetworkAnalyzeRunWithResults:(id)a3;
- (void)logSpeechRecognized;
- (void)logVoiceRecordingEnd;
- (void)logVoiceRecordingStart;
- (void)logVoiceSendEnd;
- (void)logVoiceSendStart;
@end

@implementation AFDiagnostics

- (AFDiagnostics)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AFDiagnostics;
  v2 = -[AFDiagnostics init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("Siri diagnostics queue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005718;
    block[3] = &unk_10000C450;
    v12 = v2;
    dispatch_async(v9, block);
  }

  return v2;
}

- (void)flush
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  dispatch_sync(v2, &stru_10000C470);
}

- (void)logConnectionStart
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFDiagnostics logConnectionStart]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t v4 = -[AFDiagnostics _AWDTimestampTruncatedToHourPrecision](self, "_AWDTimestampTruncatedToHourPrecision");
  -[AFDiagnostics _currentTime](self, "_currentTime");
  uint64_t v6 = v5;
  dispatch_queue_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005684;
  block[3] = &unk_10000C7D8;
  void block[4] = self;
  block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)logConnectionOpenWithConnectionType:(int64_t)a3
{
  uint64_t v5 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[AFDiagnostics logConnectionOpenWithConnectionType:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t v6 = -[AFDiagnostics _AWDTimestampTruncatedToHourPrecision](self, "_AWDTimestampTruncatedToHourPrecision");
  -[AFDiagnostics _currentTime](self, "_currentTime");
  uint64_t v8 = v7;
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000054FC;
  v10[3] = &unk_10000C500;
  v10[4] = self;
  v10[5] = v6;
  v10[6] = a3;
  v10[7] = v8;
  dispatch_async(v9, v10);
}

- (void)logConnectionFailedWithError:(id)a3 connectionType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFDiagnostics logConnectionFailedWithError:connectionType:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t v8 = -[AFDiagnostics _AWDTimestampTruncatedToHourPrecision](self, "_AWDTimestampTruncatedToHourPrecision");
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000053EC;
  v11[3] = &unk_10000C550;
  v11[4] = self;
  id v12 = v6;
  unint64_t v13 = v8;
  int64_t v14 = a4;
  id v10 = v6;
  dispatch_async(v9, v11);
}

- (void)logVoiceRecordingStart
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logVoiceRecordingStart]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t v4 = -[AFDiagnostics _AWDTimestampTruncatedToHourPrecision](self, "_AWDTimestampTruncatedToHourPrecision");
  -[AFDiagnostics _currentTime](self, "_currentTime");
  uint64_t v6 = v5;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005358;
  block[3] = &unk_10000C7D8;
  void block[4] = self;
  block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)logVoiceRecordingEnd
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logVoiceRecordingEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t v4 = -[AFDiagnostics _AWDTimestampTruncatedToHourPrecision](self, "_AWDTimestampTruncatedToHourPrecision");
  -[AFDiagnostics _currentTime](self, "_currentTime");
  uint64_t v6 = v5;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000051A0;
  block[3] = &unk_10000C7D8;
  void block[4] = self;
  block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)logVoiceSendStart
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logVoiceSendStart]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t v4 = -[AFDiagnostics _AWDTimestampTruncatedToHourPrecision](self, "_AWDTimestampTruncatedToHourPrecision");
  -[AFDiagnostics _currentTime](self, "_currentTime");
  uint64_t v6 = v5;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000510C;
  block[3] = &unk_10000C7D8;
  void block[4] = self;
  block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)logVoiceSendEnd
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logVoiceSendEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t v4 = -[AFDiagnostics _AWDTimestampTruncatedToHourPrecision](self, "_AWDTimestampTruncatedToHourPrecision");
  -[AFDiagnostics _currentTime](self, "_currentTime");
  uint64_t v6 = v5;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004F54;
  block[3] = &unk_10000C7D8;
  void block[4] = self;
  block[5] = v6;
  block[6] = v4;
  dispatch_async(v7, block);
}

- (void)logNetworkAnalyzeRunWithResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v13 = "-[AFDiagnostics logNetworkAnalyzeRunWithResults:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t v6 = -[AFDiagnostics _AWDTimestampTruncatedToHourPrecision](self, "_AWDTimestampTruncatedToHourPrecision");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004EC4;
  block[3] = &unk_10000C670;
  id v10 = v4;
  unint64_t v11 = v6;
  void block[4] = self;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)logSpeechRecognized
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[AFDiagnostics logSpeechRecognized]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unint64_t v4 = -[AFDiagnostics _AWDTimestampTruncatedToHourPrecision](self, "_AWDTimestampTruncatedToHourPrecision");
  -[AFDiagnostics _currentTime](self, "_currentTime");
  uint64_t v6 = v5;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004CB4;
  block[3] = &unk_10000C7D8;
  void block[4] = self;
  void block[5] = v4;
  block[6] = v6;
  dispatch_async(v7, block);
}

- (unint64_t)_durationInMillisecondsFromTime:(double)a3 toTime:(double)a4
{
  if (a4 <= a3) {
    return 0LL;
  }
  else {
    return (unint64_t)((a4 - a3) * 1000.0);
  }
}

- (AWDServerConnection)_serverConnection
{
  return self->_serverConnection;
}

- (void)_submitMetricWithIdentifier:(unsigned int)a3 generation:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (uint64_t (**)(void))a4;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _serverConnection](self, "_serverConnection"));
    id v8 = [v7 newMetricContainerWithIdentifier:v4];
    if (v8)
    {
      uint64_t v9 = v6[2](v6);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      [v8 setMetric:v10];
      if (([v7 submitMetric:v8] & 1) == 0)
      {
        unint64_t v11 = (os_log_s *)AFSiriLogContextAnalysis;
        if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
        {
          int v12 = 136315394;
          unint64_t v13 = "-[AFDiagnostics _submitMetricWithIdentifier:generation:]";
          __int16 v14 = 2048;
          uint64_t v15 = v4;
          _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Unable to submit AWD metric 0x%lx",  (uint8_t *)&v12,  0x16u);
        }
      }
    }
  }
}

- (void)_submitMetricWithIdentifier:(unsigned int)a3 hotShipIdentifier:(unsigned int)a4 hotShipTimestamp:(unint64_t)a5 generation:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  -[AFDiagnostics _submitMetricWithIdentifier:generation:](self, "_submitMetricWithIdentifier:generation:", v8, v10);
  if ((_DWORD)v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100004BA8;
    v11[3] = &unk_10000C6C0;
    int v14 = v7;
    id v12 = v10;
    unint64_t v13 = a5;
    -[AFDiagnostics _submitMetricWithIdentifier:generation:](self, "_submitMetricWithIdentifier:generation:", v7, v11);
  }
}

- (double)_currentTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v2 systemUptime];
  double v4 = v3;

  return v4;
}

- (unint64_t)_AWDTimestampTruncatedToHourPrecision
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnostics _serverConnection](self, "_serverConnection"));
  unint64_t v3 = (unint64_t)[v2 getAWDTimestamp];

  return 3600000 * (v3 / 0x36EE80);
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

- (NSNumber)_connectionStartTime
{
  return self->_connectionStartTime;
}

- (void)_setConnectionStartTime:(id)a3
{
}

- (NSNumber)_voiceRecordingStartTime
{
  return self->_voiceRecordingStartTime;
}

- (void)_setVoiceRecordingStartTime:(id)a3
{
}

- (NSNumber)_voiceRecordingEndTime
{
  return self->_voiceRecordingEndTime;
}

- (void)_setVoiceRecordingEndTime:(id)a3
{
}

- (NSNumber)_voiceSendStartTime
{
  return self->_voiceSendStartTime;
}

- (void)_setVoiceSendStartTime:(id)a3
{
}

- (NSNumber)_voiceSendEndTime
{
  return self->_voiceSendEndTime;
}

- (void)_setVoiceSendEndTime:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedDiagnostics
{
  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C428);
  }
  return (id)qword_100010AD8;
}

@end