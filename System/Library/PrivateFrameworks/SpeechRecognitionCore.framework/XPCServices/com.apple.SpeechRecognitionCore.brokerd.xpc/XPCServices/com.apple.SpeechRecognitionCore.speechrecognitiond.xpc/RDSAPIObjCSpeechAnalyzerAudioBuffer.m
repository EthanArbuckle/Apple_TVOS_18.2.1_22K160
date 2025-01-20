@interface RDSAPIObjCSpeechAnalyzerAudioBuffer
- (NSString)currentTask;
- (RDSAPIObjCSpeechAnalyzerAudioBuffer)initWithSwiftSpeechAnalyzer:(id)a3 task:(id)a4;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)swiftSpeechAnalyzer;
- (unsigned)useRecognitionReplacements;
- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4;
- (void)cancelRecognition;
- (void)dealloc;
- (void)endAudio;
- (void)newUtteranceBegins;
- (void)setCurrentTask:(id)a3;
- (void)setRecognitionReplacements:(BOOL)a3;
- (void)setSwiftSpeechAnalyzer:(id)a3;
- (void)setUseRecognitionReplacements:(unsigned __int8)a3;
- (void)startRecognition:(id)a3;
@end

@implementation RDSAPIObjCSpeechAnalyzerAudioBuffer

- (RDSAPIObjCSpeechAnalyzerAudioBuffer)initWithSwiftSpeechAnalyzer:(id)a3 task:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___RDSAPIObjCSpeechAnalyzerAudioBuffer;
  v8 = -[RDSAPIObjCSpeechAnalyzerAudioBuffer init](&v29, "init");
  v9 = v8;
  if (v8) {
    -[RDSAPIObjCSpeechAnalyzerAudioBuffer setSwiftSpeechAnalyzer:](v8, "setSwiftSpeechAnalyzer:", v6);
  }
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 1;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzerAudioBuffer currentTask](v9, "currentTask"));

  if (v10 != v7)
  {
    dispatch_time_t v11 = dispatch_time(0LL, 10000000000LL);
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzerAudioBuffer swiftSpeechAnalyzer](v9, "swiftSpeechAnalyzer"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100006550;
    v20[3] = &unk_1000CDA90;
    v21 = v9;
    id v22 = v7;
    v24 = &v25;
    v14 = v12;
    v23 = v14;
    [v13 attachTranscriberWithTask:v22 completionHandler:v20];

    if (dispatch_semaphore_wait(v14, v11))
    {
      uint64_t v15 = RXOSLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Timed out waiting to get attach transcriber. ",  (uint8_t *)v19,  2u);
      }

      *((_BYTE *)v26 + 24) = 0;
    }
  }

  if (*((_BYTE *)v26 + 24)) {
    v17 = v9;
  }
  else {
    v17 = 0LL;
  }
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (void)setRecognitionReplacements:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 1;
  if (-[RDSAPIObjCSpeechAnalyzerAudioBuffer useRecognitionReplacements](self, "useRecognitionReplacements") != a3)
  {
    dispatch_time_t v5 = dispatch_time(0LL, 10000000000LL);
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    objc_initWeak(&location, self);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzerAudioBuffer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000068DC;
    v11[3] = &unk_1000CDAB8;
    objc_copyWeak(&v14, &location);
    BOOL v15 = v3;
    v13 = &v17;
    v8 = v6;
    dispatch_semaphore_t v12 = v8;
    [v7 setRecognitionReplacementsWithUseRecognitionReplacements:v3 completionHandler:v11];

    if (dispatch_semaphore_wait(v8, v5))
    {
      uint64_t v9 = RXOSLog();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v22 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Timed out waiting to get attach transcriber for recognition replacements %d",  buf,  8u);
      }

      *((_BYTE *)v18 + 24) = 0;
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)startRecognition:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzerAudioBuffer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  [v5 startRecognitionWithTranscriberModuleWrapper:v4];
}

- (void)newUtteranceBegins
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzerAudioBuffer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  [v2 newUtteranceBegins];
}

- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  for (i = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a4); v4; --v4)
  {
    unsigned int v7 = *a3++;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
    -[NSMutableArray addObject:](i, "addObject:", v8);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzerAudioBuffer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  [v9 addAudioSamplesWithAudio:i];
}

- (void)endAudio
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzerAudioBuffer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  [v2 endAudio];

  uint64_t v3 = RXOSLog();
  unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ended audio stream", v5, 2u);
  }
}

- (void)cancelRecognition
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzerAudioBuffer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  [v2 cancelRecognition];

  uint64_t v3 = RXOSLog();
  unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Canceled recognition", v5, 2u);
  }
}

- (void)dealloc
{
  uint64_t v3 = RXOSLog();
  unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SpeechAnalyzerObjC AudioBuffer deallocated",  buf,  2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RDSAPIObjCSpeechAnalyzerAudioBuffer;
  -[RDSAPIObjCSpeechAnalyzerAudioBuffer dealloc](&v5, "dealloc");
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)swiftSpeechAnalyzer
{
  return self->_swiftSpeechAnalyzer;
}

- (void)setSwiftSpeechAnalyzer:(id)a3
{
}

- (NSString)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
}

- (unsigned)useRecognitionReplacements
{
  return self->_useRecognitionReplacements;
}

- (void)setUseRecognitionReplacements:(unsigned __int8)a3
{
  self->_useRecognitionReplacements = a3;
}

- (void).cxx_destruct
{
}

@end