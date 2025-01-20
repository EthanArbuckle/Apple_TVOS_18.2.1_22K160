@interface ADDictationSessionTracker
- (ADDictationSessionTracker)init;
- (id)_sessionWithUUID:(id)a3;
- (id)_startedOrStartingSession;
- (id)startSessionForReason:(id)a3 languageCode:(id)a4 options:(id)a5 speechRequestOptions:(id)a6;
- (void)_addSession:(id)a3;
- (void)_beginAudioFileIOTransactionForReason:(id)a3 session:(id)a4;
- (void)_beginSpeechRecognitionTransactionForReason:(id)a3 session:(id)a4;
- (void)_endAudioFileIOTransactionForReason:(id)a3 session:(id)a4;
- (void)_endSessionTransactionForReason:(id)a3 session:(id)a4 isSpeechTransaction:(BOOL)a5;
- (void)_endSpeechRecognitionTransactionForReason:(id)a3 session:(id)a4;
- (void)_removeSession:(id)a3;
- (void)notifyAudioFileIOTransactionStoppedForReason:(id)a3 sessionUUID:(id)a4;
- (void)notifySpeechRecognitionTransactionStoppedForReason:(id)a3 sessionUUID:(id)a4;
- (void)stopSessionForReason:(id)a3;
@end

@implementation ADDictationSessionTracker

- (ADDictationSessionTracker)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADDictationSessionTracker;
  v2 = -[ADDictationSessionTracker init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    activeSessions = v2->_activeSessions;
    v2->_activeSessions = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    activeSessionsByUUID = v2->_activeSessionsByUUID;
    v2->_activeSessionsByUUID = v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_DEFAULT, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.assistantd.dictation.session-controller", v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;
  }

  return v2;
}

- (id)startSessionForReason:(id)a3 languageCode:(id)a4 options:(id)a5 speechRequestOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = mach_absolute_time();
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);

  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x3032000000LL;
  v36[3] = sub_100192C5C;
  v36[4] = sub_100192C6C;
  id v37 = (id)os_transaction_create("startSessionForReason:languageCode:options:speechRequestOptions:", v17);
  queue = (dispatch_queue_s *)self->_queue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001931A8;
  v27[3] = &unk_1004F43A8;
  id v19 = v16;
  id v28 = v19;
  id v29 = v11;
  id v30 = v12;
  id v31 = v13;
  v32 = self;
  id v33 = v10;
  v34 = v36;
  uint64_t v35 = v14;
  id v20 = v10;
  id v21 = v13;
  id v22 = v12;
  id v23 = v11;
  dispatch_async(queue, v27);
  v24 = v33;
  id v25 = v19;

  _Block_object_dispose(v36, 8);
  return v25;
}

- (void)stopSessionForReason:(id)a3
{
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x3032000000LL;
  v6[3] = sub_100192C5C;
  v6[4] = sub_100192C6C;
  id v7 = (id)os_transaction_create("stopSessionForReason:", a2);
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100193014;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(queue, v5);
  _Block_object_dispose(v6, 8);
}

- (void)notifySpeechRecognitionTransactionStoppedForReason:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3032000000LL;
  v17[3] = sub_100192C5C;
  v17[4] = sub_100192C6C;
  id v18 = (id)os_transaction_create("notifySpeechRecognitionTransactionStoppedForReason:sessionUUID:", v8);
  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100192E44;
  v12[3] = &unk_1004F68C8;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v6;
  v16 = v17;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, v12);

  _Block_object_dispose(v17, 8);
}

- (void)notifyAudioFileIOTransactionStoppedForReason:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3032000000LL;
  v17[3] = sub_100192C5C;
  v17[4] = sub_100192C6C;
  id v18 = (id)os_transaction_create("notifyAudioFileIOTransactionStoppedForReason:sessionUUID:", v8);
  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100192C74;
  v12[3] = &unk_1004F68C8;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v6;
  v16 = v17;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, v12);

  _Block_object_dispose(v17, 8);
}

- (void)_addSession:(id)a3
{
  id v4 = a3;
  v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    int v10 = 136315394;
    id v11 = "-[ADDictationSessionTracker _addSession:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Activating dictation session with sessionUUID = %@",  (uint8_t *)&v10,  0x16u);
  }

  -[NSMutableArray addObject:](self->_activeSessions, "addObject:", v4);
  activeSessionsByUUID = self->_activeSessionsByUUID;
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  -[NSMutableDictionary setObject:forKey:](activeSessionsByUUID, "setObject:forKey:", v4, v9);
}

- (void)_removeSession:(id)a3
{
  id v4 = a3;
  v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    int v10 = 136315394;
    id v11 = "-[ADDictationSessionTracker _removeSession:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Deactivating dictation session with sessionUUID = %@",  (uint8_t *)&v10,  0x16u);
  }

  -[NSMutableArray removeObject:](self->_activeSessions, "removeObject:", v4);
  activeSessionsByUUID = self->_activeSessionsByUUID;
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  -[NSMutableDictionary removeObjectForKey:](activeSessionsByUUID, "removeObjectForKey:", v9);
}

- (id)_startedOrStartingSession
{
  id v2 = sub_1002D7D50(self->_activeSessions, &stru_1004FAA58);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 count];
  if ((unint64_t)v4 >= 2) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to retrieve the active session, but found %tu active sessions.",  v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v5;
}

- (id)_sessionWithUUID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_activeSessionsByUUID, "objectForKey:", a3);
}

- (void)_beginSpeechRecognitionTransactionForReason:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_attr_t v9 = v8;
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[ADDictationSessionTracker _beginSpeechRecognitionTransactionForReason:session:]";
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
  }

  id v11 = sub_1002D7D50(self->_activeSessions, &stru_1004FAA58);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v12 count];
  if ((unint64_t)v13 >= 2) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to begin a dictation transcription transaction (reason: %@), but found %tu active session(s).",  v6,  v13);
  }
  id v14 = [v7 speechRecognitionTransactionState];
  if (v14) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to begin a dictation transcription transaction (reason: %@), but the transaction state is %zd.",  v6,  v14);
  }
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[ADDictationSessionTracker _beginSpeechRecognitionTransactionForReason:session:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Beginning dictation transcription XPC transaction because %@",  buf,  0x16u);
  }

  [v7 _setSpeechRecognitionTransactionState:1];
}

- (void)_beginAudioFileIOTransactionForReason:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_attr_t v9 = v8;
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    *(_DWORD *)buf = 136315394;
    id v19 = "-[ADDictationSessionTracker _beginAudioFileIOTransactionForReason:session:]";
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 speechRequestOptions]);
  id v12 = [v11 audioFileType];

  if (v12)
  {
    id v13 = sub_1002D7D50(self->_activeSessions, &stru_1004FAA58);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = [v14 count];
    if ((unint64_t)v15 >= 2) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to begin a dictation audio file transaction (reason: %@), but found %tu active session(s).",  v6,  v15);
    }
    id v16 = [v7 audioFileIOTransactionState];
    if (v16) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to begin a dictation audio file transaction (reason: %@), but the transaction state is %ld.",  v6,  v16);
    }
    uint64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[ADDictationSessionTracker _beginAudioFileIOTransactionForReason:session:]";
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Beginning dictation audio file XPC transaction because %@",  buf,  0x16u);
    }

    [v7 _setAudioFileIOTransactionState:1];
  }
}

- (void)_endSessionTransactionForReason:(id)a3 session:(id)a4 isSpeechTransaction:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[ADDictationSessionTracker _endSessionTransactionForReason:session:isSpeechTransaction:]";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Ending dictation transcription XPC transaction because %@",  (uint8_t *)&v11,  0x16u);
  }

  if (v5) {
    [v9 _setSpeechRecognitionTransactionState:0];
  }
  else {
    [v9 _setAudioFileIOTransactionState:0];
  }
  if (![v9 speechRecognitionTransactionState] && !objc_msgSend(v9, "audioFileIOTransactionState")) {
    -[ADDictationSessionTracker _removeSession:](self, "_removeSession:", v9);
  }
}

- (void)_endSpeechRecognitionTransactionForReason:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADDictationSessionTracker _endSpeechRecognitionTransactionForReason:session:]";
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
  }

  if (![v7 speechRecognitionTransactionState]) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to end a dictation transcription transaction (reason: %@), but the transaction state is stopped",  v6);
  }
  -[ADDictationSessionTracker _endSessionTransactionForReason:session:isSpeechTransaction:]( self,  "_endSessionTransactionForReason:session:isSpeechTransaction:",  v6,  v7,  1LL);
}

- (void)_endAudioFileIOTransactionForReason:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[ADDictationSessionTracker _endAudioFileIOTransactionForReason:session:]";
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 speechRequestOptions]);
  id v12 = [v11 audioFileType];

  if (v12)
  {
    if (![v7 audioFileIOTransactionState]) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to end a dictation audio file transaction (reason: %@), but the transaction state is stopped",  v6);
    }
    -[ADDictationSessionTracker _endSessionTransactionForReason:session:isSpeechTransaction:]( self,  "_endSessionTransactionForReason:session:isSpeechTransaction:",  v6,  v7,  0LL);
  }
}

- (void).cxx_destruct
{
}

@end