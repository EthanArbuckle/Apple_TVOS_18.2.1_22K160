id sub_100004BA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_s *v5;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = (*(uint64_t (**)(void))(v2 + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    v4 = 0LL;
  }

  if ((objc_opt_respondsToSelector(v4, "setTimestamp:") & 1) != 0)
  {
    [v4 setTimestamp:*(void *)(a1 + 40)];
  }

  else
  {
    v5 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      v7 = *(unsigned int *)(a1 + 48);
      v8 = 136315394;
      v9 = "-[AFDiagnostics _submitMetricWithIdentifier:hotShipIdentifier:hotShipTimestamp:generation:]_block_invoke";
      v10 = 2048;
      v11 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Hot-ship metric 0x%lx does not respond to -setTimestamp:. Will not set timestamp.",  (uint8_t *)&v8,  0x16u);
    }
  }

  return v4;
}

id sub_100004CB4(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100004D28;
  v4[3] = &unk_10000C698;
  v4[4] = v2;
  v4[5] = a1[6];
  return [v2 _submitMetricWithIdentifier:1769481 hotShipIdentifier:1769490 hotShipTimestamp:v1 generation:v4];
}

id sub_100004D28(uint64_t a1)
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___AWDSiriSpeechRecognized);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _voiceRecordingEndTime]);
  v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend( v2,  "setDurationFromVoiceRecordingEnd:",  objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }

  else
  {
    v5 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[AFDiagnostics logSpeechRecognized]_block_invoke_2";
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Received -logSpeechRecognized with no corresponding -logVoiceRecordingEnd. Unable to determine duration since voice recording completed.",  (uint8_t *)&v10,  0xCu);
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _voiceSendEndTime]);
  v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    objc_msgSend( v2,  "setDurationFromVoiceSendEnd:",  objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }

  else
  {
    v8 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[AFDiagnostics logSpeechRecognized]_block_invoke";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Received -logSpeechRecognized with no corresponding -logVoiceSendEnd. Unable to determine duration since voic e send completed.",  (uint8_t *)&v10,  0xCu);
    }
  }

  return v2;
}

void sub_100004EC4(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100004F4C;
  v3[3] = &unk_10000C648;
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v1 _submitMetricWithIdentifier:1769480 hotShipIdentifier:1769489 hotShipTimestamp:v2 generation:v3];
}

id sub_100004F4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) metricValue];
}

id sub_100004F54(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  [v2 _setVoiceSendEndTime:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005008;
  v7[3] = &unk_10000C620;
  v7[4] = v4;
  v7[5] = *(void *)(a1 + 40);
  return [v4 _submitMetricWithIdentifier:1769477 hotShipIdentifier:1769486 hotShipTimestamp:v5 generation:v7];
}

id sub_100005008(uint64_t a1)
{
  uint64_t v2 = (void *)objc_opt_new(&OBJC_CLASS___AWDSiriVoiceSendEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _voiceSendStartTime]);
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(v2, "setDuration:", objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }

  else
  {
    uint64_t v5 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "-[AFDiagnostics logVoiceSendEnd]_block_invoke_2";
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Received -logVoiceSendEnd with no corresponding -logVoiceSendStart. Unable to determine how long voice transfer lasted.",  (uint8_t *)&v7,  0xCu);
    }
  }

  return v2;
}

id sub_10000510C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  [v2 _setVoiceSendStartTime:v3];

  return [*(id *)(a1 + 32) _submitMetricWithIdentifier:1769476 hotShipIdentifier:1769485 hotShipTimestamp:*(void *)(a1 + 48) generation:&stru_10000C5F8];
}

AWDSiriVoiceSendStart *__cdecl sub_100005184(id a1)
{
  return objc_opt_new(&OBJC_CLASS___AWDSiriVoiceSendStart);
}

id sub_1000051A0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  [v2 _setVoiceRecordingEndTime:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005254;
  v7[3] = &unk_10000C5B8;
  v7[4] = v4;
  v7[5] = *(void *)(a1 + 40);
  return [v4 _submitMetricWithIdentifier:1769475 hotShipIdentifier:1769484 hotShipTimestamp:v5 generation:v7];
}

id sub_100005254(uint64_t a1)
{
  uint64_t v2 = (void *)objc_opt_new(&OBJC_CLASS___AWDSiriVoiceRecordingEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _voiceRecordingStartTime]);
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(v2, "setDuration:", objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }

  else
  {
    uint64_t v5 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "-[AFDiagnostics logVoiceRecordingEnd]_block_invoke_2";
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Received -logVoiceRecordingEnd with no corresponding -logVoiceRecordingStart. Unable to determine how long vo ice recording lasted.",  (uint8_t *)&v7,  0xCu);
    }
  }

  return v2;
}

id sub_100005358(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  [v2 _setVoiceRecordingStartTime:v3];

  return [*(id *)(a1 + 32) _submitMetricWithIdentifier:1769474 hotShipIdentifier:1769483 hotShipTimestamp:*(void *)(a1 + 48) generation:&stru_10000C590];
}

AWDSiriVoiceRecordingStart *__cdecl sub_1000053D0(id a1)
{
  return objc_opt_new(&OBJC_CLASS___AWDSiriVoiceRecordingStart);
}

void sub_1000053EC(uint64_t a1)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005484;
  v6[3] = &unk_10000C528;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 _submitMetricWithIdentifier:1769479 hotShipIdentifier:1769488 hotShipTimestamp:v3 generation:v6];
}

id sub_100005484(uint64_t a1)
{
  uint64_t v2 = (void *)objc_opt_new(&OBJC_CLASS___AWDSiriServerConnectionFailed);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domain]);
  [v2 setErrorDomain:v3];

  objc_msgSend(v2, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  [v2 setConnectionType:*(unsigned int *)(a1 + 40)];
  return v2;
}

id sub_1000054FC(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100005578;
  v5[3] = &unk_10000C4D8;
  uint64_t v3 = a1[6];
  v5[4] = v2;
  v5[5] = v3;
  v5[6] = a1[7];
  return [v2 _submitMetricWithIdentifier:1769478 hotShipIdentifier:1769487 hotShipTimestamp:v1 generation:v5];
}

id sub_100005578(uint64_t a1)
{
  uint64_t v2 = (void *)objc_opt_new(&OBJC_CLASS___AWDSiriServerConnectionOpen);
  [v2 setConnectionType:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _connectionStartTime]);
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    objc_msgSend(v2, "setDuration:", objc_msgSend(*(id *)(a1 + 32), "_durationInMillisecondsFromTime:toTime:"));
  }

  else
  {
    uint64_t v5 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[AFDiagnostics logConnectionOpenWithConnectionType:]_block_invoke_2";
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Received -logConnectionOpenWithConnectionType: with no corresponding -logConnectionStart. Unable to determine how long it took to open the connection.",  (uint8_t *)&v7,  0xCu);
    }
  }

  return v2;
}

id sub_100005684(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  [v2 _setConnectionStartTime:v3];

  return [*(id *)(a1 + 32) _submitMetricWithIdentifier:1769473 hotShipIdentifier:1769482 hotShipTimestamp:*(void *)(a1 + 48) generation:&stru_10000C4B0];
}

AWDSiriServerConnectionStart *__cdecl sub_1000056F8(id a1)
{
  return objc_opt_new(&OBJC_CLASS___AWDSiriServerConnectionStart);
}

void sub_100005718(uint64_t a1)
{
  uint64_t v2 = -[AWDServerConnection initWithComponentId:andBlockOnConfiguration:]( objc_alloc(&OBJC_CLASS___AWDServerConnection),  "initWithComponentId:andBlockOnConfiguration:",  27LL,  0LL);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

void sub_100005798(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___AFDiagnostics);
  uint64_t v2 = (void *)qword_100010AD8;
  qword_100010AD8 = (uint64_t)v1;
}

void sub_1000065E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_1000068C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1000071E8(_Unwind_Exception *a1)
{
}

LABEL_18:
}

void sub_1000076B0(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (void *)xpc_connection_copy_entitlement_value(v1, [@"com.apple.siri.analyzer" UTF8String]);
  uint64_t v3 = v2;
  if (v2 && xpc_BOOL_get_value(v2))
  {
    id v4 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v10 = "_XPCMainConnectionHandler";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s New analyzer peer", buf, 0xCu);
    }

    xpc_connection_set_target_queue(v1, &_dispatch_main_q);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000785C;
    handler[3] = &unk_10000C8B8;
    uint64_t v5 = v1;
    uint64_t v8 = v5;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_resume(v5);
  }

  else
  {
    v6 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v10 = "_XPCMainConnectionHandler";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Peer not entitled", buf, 0xCu);
    }

    xpc_connection_cancel(v1);
  }
}

void sub_10000785C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary) {
    [(id)qword_100010AE8 _handleMessage:v3];
  }
  else {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
}

void sub_1000078BC(id a1)
{
  uint64_t v1 = (os_log_s *)AFSiriLogContextAnalysis;
  if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    id v3 = "-[AFAnalyzer _startAnalysisWithMessage:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%s Exiting", (uint8_t *)&v2, 0xCu);
  }

  exit(0);
}

char *sub_10000793C(signed int a1)
{
  if (a1 < 1)
  {
    uint64_t v1 = 0LL;
  }

  else
  {
    uint64_t v1 = if_indextoname(a1, v3);
    if (v1) {
      uint64_t v1 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
    }
  }

  return v1;
}

uint64_t sub_1000079B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000079C0(uint64_t a1)
{
}

void sub_1000079C8(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"http://apple.com"));
  [v2 _measureTimeToLoadURL:v3 withMethod:@"HEAD"];
  uint64_t v5 = v4;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007ED8;
  v7[3] = &unk_10000C788;
  v6 = *(dispatch_queue_s **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = v5;
  dispatch_sync(v6, v7);
}

void sub_100007A84(uint64_t a1)
{
  uint64_t v15 = 0LL;
  unint64_t v16 = 0xBFF0000000000000LL;
  uint64_t v14 = 0LL;
  [*(id *)(a1 + 32) _pingHost:*(void *)(a1 + 40) time:&v16 sentPackets:&v15 droppedPackets:&v14];
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14));
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8LL);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (v15) {
    double v8 = (double)v14 / (double)v15;
  }
  else {
    double v8 = -1.0;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007E48;
  v10[3] = &unk_10000C7D8;
  uint64_t v9 = *(dispatch_queue_s **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  unint64_t v12 = v16;
  double v13 = v8;
  dispatch_sync(v9, v10);
}

void sub_100007B94(uint64_t a1)
{
  uint64_t v3 = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100007DF0;
  v5[3] = &unk_10000C788;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = v3;
  dispatch_sync(v4, v5);
}

void sub_100007C24(uint64_t a1)
{
  uint64_t v3 = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100007D98;
  v5[3] = &unk_10000C788;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = v3;
  dispatch_sync(v4, v5);
}

void sub_100007CB4(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", -2.0));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"Siri URL HEAD time"]);

  if (!v2) {
    [*(id *)(a1 + 32) setObject:v5 forKey:@"Siri URL HEAD time"];
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"Siri Salt URL HEAD time"]);

  if (!v3) {
    [*(id *)(a1 + 32) setObject:v5 forKey:@"Siri Salt URL HEAD time"];
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"Apple URL HEAD time"]);

  if (!v4) {
    [*(id *)(a1 + 32) setObject:v5 forKey:@"Apple URL HEAD time"];
  }
  [*(id *)(a1 + 40) addEntriesFromDictionary:*(void *)(a1 + 32)];
}

void sub_100007D98(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  [v1 setObject:v2 forKey:@"Siri Salt URL HEAD time"];
}

void sub_100007DF0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  [v1 setObject:v2 forKey:@"Siri URL HEAD time"];
}

void sub_100007E48(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  [v2 setObject:v3 forKey:@"Gateway average ping"];

  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  [v4 setObject:v5 forKey:@"Gateway dropped percentage"];
}

void sub_100007ED8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  [v1 setObject:v2 forKey:@"Apple URL HEAD time"];
}

uint64_t sub_100007F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v5 systemUptime];
  double v7 = v6;

  if (a3) {
    double v8 = v7 - *(double *)(a1 + 48);
  }
  else {
    double v8 = -1.0;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v8;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007FA4(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 64);
  uint64_t v3 = (unsigned __int8 *)[*(id *)(a1 + 32) bytes];
  __int128 v54 = 0u;
  __int128 v53 = 0u;
  __int128 v52 = 0u;
  __int128 v51 = 0u;
  __int128 v50 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v25 = 0u;
  memset(v24, 0, sizeof(v24));
  memset(v23, 0, sizeof(v23));
  v18[0] = v24;
  v18[1] = 512LL;
  v17.msg_name = v3;
  v17.msg_namelen = *v3;
  v17.msg_iov = (iovec *)v18;
  v17.msg_iovlen = 1;
  v17.msg_control = v23;
  *(void *)&v17.msg_controllen = 512LL;
  if (recvmsg(v2, &v17, 0) == -1)
  {
    double v7 = (void *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      double v8 = v7;
      uint64_t v9 = __error();
      int v10 = strerror(*v9);
      *(_DWORD *)buf = 136315394;
      v20 = "_AFAReadICMPSeqAndPayload";
      __int16 v21 = 2080;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s recvmsg failed %s", buf, 0x16u);
    }

    goto LABEL_11;
  }

  if (BYTE1(v24[2]) != 1)
  {
    id v5 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "_AFAReadICMPSeqAndPayload";
      double v6 = "%s got something other than icmp packet";
      goto LABEL_10;
    }

LABEL_11:
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    return;
  }

  uint64_t v4 = (double *)&v24[v24[0] & 0xF];
  if (*(_BYTE *)v4)
  {
    id v5 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "_AFAReadICMPSeqAndPayload";
      double v6 = "%s Unexpected icmp packet type";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  if (*((unsigned __int16 *)v4 + 2) == *(unsigned __int16 *)(a1 + 72))
  {
    unsigned int v11 = *((unsigned __int16 *)v4 + 3);
    double v12 = v4[1];
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v13 systemUptime];
    double v15 = v14 - v12;

    unint64_t v16 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      v24[0] = 136315650;
      *(void *)&v24[1] = "-[AFAnalyzer _pingHost:time:sentPackets:droppedPackets:]_block_invoke";
      LOWORD(v24[3]) = 1024;
      *(_DWORD *)((char *)&v24[3] + 2) = bswap32(v11) >> 16;
      HIWORD(v24[4]) = 2048;
      *(double *)&v24[5] = v15 * 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s seq %d in %.3lf ms", (uint8_t *)v24, 0x1Cu);
    }

    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v15
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) >= *(_DWORD *)(a1 + 68)) {
      goto LABEL_11;
    }
  }
}

uint64_t sub_10000834C(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 40));
}

id sub_100008374(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10000839C(uint64_t a1)
{
}

void sub_1000083A4(uint64_t a1)
{
  if (dispatch_source_testcancel(*(dispatch_source_t *)(a1 + 32))) {
    goto LABEL_11;
  }
  int v2 = (const sockaddr *)[*(id *)(a1 + 40) bytes];
  int v3 = *(_DWORD *)(a1 + 72);
  __int16 v4 = *(_WORD *)(a1 + 80);
  unsigned int v5 = *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v6 systemUptime];
  uint64_t v32 = 0LL;
  uint64_t v31 = 0LL;
  int v33 = 0;
  __int16 v26 = 8;
  __int16 v28 = v4;
  __int16 v29 = bswap32(v5) >> 16;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v7 systemUptime];
  uint64_t v9 = v8;

  uint64_t v10 = 0LL;
  unsigned int v11 = 0;
  uint64_t v30 = v9;
  __int16 v27 = 0;
  do
  {
    v11 += *(unsigned __int16 *)((char *)&v26 + v10);
    v10 += 2LL;
  }

  while (v10 != 36);
  __int16 v27 = ~(HIWORD(v11) + v11 + ((HIWORD(v11) + (unsigned __int16)v11) >> 16));
  unint64_t v12 = sendto(v3, &v26, 0x24uLL, 0, v2, v2->sa_len);
  if ((v12 & 0x8000000000000000LL) != 0)
  {
    double v15 = (void *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      unint64_t v16 = v15;
      msghdr v17 = __error();
      v18 = strerror(*v17);
      int v22 = 136315394;
      v23 = "_AFASendPing";
      __int16 v24 = 2080;
      __int128 v25 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Failed sending on socket %s",  (uint8_t *)&v22,  0x16u);
    }

    goto LABEL_10;
  }

  unint64_t v13 = v12;
  if (v12 <= 0x23)
  {
    double v14 = (os_log_s *)AFSiriLogContextAnalysis;
    if (os_log_type_enabled(AFSiriLogContextAnalysis, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315394;
      v23 = "_AFASendPing";
      __int16 v24 = 2048;
      __int128 v25 = (char *)v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Only sent %ld bytes", (uint8_t *)&v22, 0x16u);
    }

LABEL_10:
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
LABEL_11:
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8LL);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0LL;

    return;
  }

  dispatch_time_t v21 = dispatch_time(0LL, 1000000000LL);
  dispatch_after( v21,  *(dispatch_queue_t *)(a1 + 48),  *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL));
}

int main(int argc, const char **argv, const char **envp)
{
  if (AFIsInternalInstall(objc_autoreleasePoolPush()))
  {
    setenv("CFNETWORK_DIAGNOSTICS", "3", 1);
    setenv("CFNETWORK_DIAGNOSTICS_NO_SYSLOG", "1", 1);
  }

  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalyzer analyzer](&OBJC_CLASS___AFAnalyzer, "analyzer"));
  [v3 runAnalyzerService];

  exit(1);
}

id objc_msgSend__logAnalysisForURL_failedIFaceIndex_sendBufferSize_isUserFailure_isWWANPreferred_isRetrySuccess_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_logAnalysisForURL:failedIFaceIndex:sendBufferSize:isUserFailure:isWWANPreferred:isRetrySuccess:");
}

id objc_msgSend__submitMetricWithIdentifier_hotShipIdentifier_hotShipTimestamp_generation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_submitMetricWithIdentifier:hotShipIdentifier:hotShipTimestamp:generation:");
}

id objc_msgSend_wwanPreferred(void *a1, const char *a2, ...)
{
  return [a1 wwanPreferred];
}