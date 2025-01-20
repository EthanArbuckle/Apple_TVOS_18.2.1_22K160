@interface ADDictationSession
- (ADDictationSession)init;
- (ADDictationSession)initWithUUID:(id)a3 timestamp:(unint64_t)a4 languageCode:(id)a5 options:(id)a6 speechRequestOptions:(id)a7;
- (AFDictationOptions)options;
- (AFSpeechRequestOptions)speechRequestOptions;
- (NSString)languageCode;
- (NSString)uuid;
- (int64_t)audioFileIOTransactionState;
- (int64_t)speechRecognitionTransactionState;
- (unint64_t)timestamp;
- (void)_setAudioFileIOTransactionState:(int64_t)a3;
- (void)_setSpeechRecognitionTransactionState:(int64_t)a3;
- (void)dealloc;
@end

@implementation ADDictationSession

- (ADDictationSession)init
{
  return 0LL;
}

- (ADDictationSession)initWithUUID:(id)a3 timestamp:(unint64_t)a4 languageCode:(id)a5 options:(id)a6 speechRequestOptions:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADDictationSession;
  v16 = -[ADDictationSession init](&v22, "init");
  if (v16)
  {
    v17 = (NSString *)[v12 copy];
    uuid = v16->_uuid;
    v16->_uuid = v17;

    v16->_timestamp = a4;
    v19 = (NSString *)[v13 copy];
    languageCode = v16->_languageCode;
    v16->_languageCode = v19;

    objc_storeStrong((id *)&v16->_options, a6);
    objc_storeStrong((id *)&v16->_speechRequestOptions, a7);
    v16->_speechRecognitionTransactionState = 0LL;
    v16->_audioFileIOTransactionState = 0LL;
  }

  return v16;
}

- (void)dealloc
{
  if (self->_speechRecognitionTransactionState)
  {
    v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[ADDictationSession dealloc]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Will destroy os_transaction_t object",  buf,  0xCu);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AFQueue dequeueObject](self->_transactionObjects, "dequeueObject"));
    if (!v4)
    {
      v5 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v15 = "-[ADDictationSession dealloc]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Transaction object nil", buf, 0xCu);
      }
    }

    uint64_t v6 = --qword_100577CE8;
    v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[ADDictationSession dealloc]";
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Did destroy os_transaction_t object with new XPC transaction count %ld",  buf,  0x16u);
    }
  }

  if (self->_audioFileIOTransactionState)
  {
    v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[ADDictationSession dealloc]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Will destroy os_transaction_t object",  buf,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AFQueue dequeueObject](self->_transactionObjects, "dequeueObject"));
    if (!v9)
    {
      v10 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v15 = "-[ADDictationSession dealloc]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Transaction object nil", buf, 0xCu);
      }
    }

    uint64_t v11 = --qword_100577CE8;
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[ADDictationSession dealloc]";
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Did destroy os_transaction_t object with new XPC transaction count %ld",  buf,  0x16u);
    }
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADDictationSession;
  -[ADDictationSession dealloc](&v13, "dealloc");
}

- (void)_setSpeechRecognitionTransactionState:(int64_t)a3
{
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int64_t speechRecognitionTransactionState = self->_speechRecognitionTransactionState;
    int v21 = 136315650;
    objc_super v22 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
    __int16 v23 = 2048;
    int64_t v24 = speechRecognitionTransactionState;
    __int16 v25 = 2048;
    int64_t v26 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s (oldState = %ld, newState = %ld)",  (uint8_t *)&v21,  0x20u);
  }

  int64_t v7 = self->_speechRecognitionTransactionState;
  if (v7 != a3)
  {
    if (!v7)
    {
      v8 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315138;
        objc_super v22 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Will call os_transaction_create()",  (uint8_t *)&v21,  0xCu);
      }

      transactionObjects = self->_transactionObjects;
      if (!transactionObjects)
      {
        uint64_t v11 = objc_alloc_init(&OBJC_CLASS___AFQueue);
        id v12 = self->_transactionObjects;
        self->_transactionObjects = v11;

        transactionObjects = self->_transactionObjects;
      }

      objc_super v13 = (void *)os_transaction_create("_setSpeechRecognitionTransactionState:", v9);
      -[AFQueue enqueueObject:](transactionObjects, "enqueueObject:", v13);

      uint64_t v14 = ++qword_100577CE8;
      id v15 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315394;
        objc_super v22 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
        __int16 v23 = 2048;
        int64_t v24 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Did call os_transaction_create() with new XPC transaction count %ld",  (uint8_t *)&v21,  0x16u);
      }
    }

    self->_int64_t speechRecognitionTransactionState = a3;
    if (!a3)
    {
      __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315138;
        objc_super v22 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Will destroy os_transaction_t object",  (uint8_t *)&v21,  0xCu);
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AFQueue dequeueObject](self->_transactionObjects, "dequeueObject"));
      if (!v17)
      {
        v18 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v21 = 136315138;
          objc_super v22 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Transaction object nil",  (uint8_t *)&v21,  0xCu);
        }
      }

      uint64_t v19 = --qword_100577CE8;
      v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315394;
        objc_super v22 = "-[ADDictationSession _setSpeechRecognitionTransactionState:]";
        __int16 v23 = 2048;
        int64_t v24 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Did destroy os_transaction_t object with new XPC transaction count %ld",  (uint8_t *)&v21,  0x16u);
      }
    }
  }

- (void)_setAudioFileIOTransactionState:(int64_t)a3
{
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int64_t audioFileIOTransactionState = self->_audioFileIOTransactionState;
    int v21 = 136315650;
    objc_super v22 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
    __int16 v23 = 2048;
    int64_t v24 = audioFileIOTransactionState;
    __int16 v25 = 2048;
    int64_t v26 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s (oldState = %ld, newState = %ld)",  (uint8_t *)&v21,  0x20u);
  }

  int64_t v7 = self->_audioFileIOTransactionState;
  if (v7 != a3)
  {
    if (!v7)
    {
      v8 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315138;
        objc_super v22 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s will call os_transaction_create()",  (uint8_t *)&v21,  0xCu);
      }

      transactionObjects = self->_transactionObjects;
      if (!transactionObjects)
      {
        uint64_t v11 = objc_alloc_init(&OBJC_CLASS___AFQueue);
        id v12 = self->_transactionObjects;
        self->_transactionObjects = v11;

        transactionObjects = self->_transactionObjects;
      }

      objc_super v13 = (void *)os_transaction_create("_setAudioFileIOTransactionState:", v9);
      -[AFQueue enqueueObject:](transactionObjects, "enqueueObject:", v13);

      uint64_t v14 = ++qword_100577CE8;
      id v15 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315394;
        objc_super v22 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
        __int16 v23 = 2048;
        int64_t v24 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Did call os_transaction_create() with new XPC transaction count %ld",  (uint8_t *)&v21,  0x16u);
      }
    }

    self->_int64_t audioFileIOTransactionState = a3;
    if (!a3)
    {
      __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315138;
        objc_super v22 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Will destroy os_transaction_t object",  (uint8_t *)&v21,  0xCu);
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AFQueue dequeueObject](self->_transactionObjects, "dequeueObject"));
      if (!v17)
      {
        v18 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v21 = 136315138;
          objc_super v22 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Transaction object nil",  (uint8_t *)&v21,  0xCu);
        }
      }

      uint64_t v19 = --qword_100577CE8;
      v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315394;
        objc_super v22 = "-[ADDictationSession _setAudioFileIOTransactionState:]";
        __int16 v23 = 2048;
        int64_t v24 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Did destroy os_transaction_t object with new XPC transaction count %ld",  (uint8_t *)&v21,  0x16u);
      }
    }
  }

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (AFDictationOptions)options
{
  return self->_options;
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (int64_t)speechRecognitionTransactionState
{
  return self->_speechRecognitionTransactionState;
}

- (int64_t)audioFileIOTransactionState
{
  return self->_audioFileIOTransactionState;
}

- (void).cxx_destruct
{
}

@end