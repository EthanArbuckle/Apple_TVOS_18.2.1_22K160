@interface RDSAPIObjCSpeechAnalyzer
- (NSLocale)locale;
- (RDSAPICSpeechAnalyzerDelegate)delegate;
- (RDSAPIObjCSpeechAnalyzer)initWithLocale:(id)a3;
- (RDSAPIObjCSpeechAnalyzerAudioBuffer)speechAnalyzerAudioBuffer;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)swiftSpeechAnalyzer;
- (id)getJitProfileData;
- (id)getUserProfileData;
- (unsigned)farField;
- (unsigned)highPriority;
- (void)createRecognitionBufferWithDelegate:(RDSAPICSpeechAnalyzerDelegate *)a3 task:(id)a4;
- (void)dealloc;
- (void)didFinishRecognitionWithError:(id)a3;
- (void)didGetUtteranceBoundary:(int64_t)a3 utteranceEndSampleNumber:(int64_t)a4;
- (void)didRecognizeFinalResults:(id)a3 nBestResults:(id)a4 firstBestResult:(id)a5;
- (void)didRecognizePartialResultTokens:(id)a3;
- (void)setDelegate:(RDSAPICSpeechAnalyzerDelegate *)a3;
- (void)setFarField:(unsigned __int8)a3;
- (void)setHighPriority:(unsigned __int8)a3;
- (void)setJitProfileData:(id)a3;
- (void)setLeftContextText:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRecognitionReplacements:(BOOL)a3;
- (void)setSpeechAnalyzerAudioBuffer:(id)a3;
- (void)setSwiftSpeechAnalyzer:(id)a3;
- (void)setUserProfileData:(id)a3;
@end

@implementation RDSAPIObjCSpeechAnalyzer

- (RDSAPIObjCSpeechAnalyzer)initWithLocale:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RDSAPIObjCSpeechAnalyzer;
  v5 = -[RDSAPIObjCSpeechAnalyzer init](&v10, "init");
  v6 = v5;
  if (v5) {
    -[RDSAPIObjCSpeechAnalyzer setLocale:](v5, "setLocale:", v4);
  }
  v7 = -[RDSAPISwiftSpeechAnalyzer initWithDelegate:locale:highPriority:farField:supportEmojiRecognition:]( objc_alloc(&OBJC_CLASS____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer),  "initWithDelegate:locale:highPriority:farField:supportEmojiRecognition:",  v6,  v6->_locale,  v6->_highPriority != 0,  v6->_farField != 0,  CFPreferencesGetAppBooleanValue( @"UseAssetSupportForEmojiNameRecogition",  @"com.apple.SpeechRecognitionCore",  0LL) != 0);
  -[RDSAPIObjCSpeechAnalyzer setSwiftSpeechAnalyzer:](v6, "setSwiftSpeechAnalyzer:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzer swiftSpeechAnalyzer](v6, "swiftSpeechAnalyzer"));
  [v8 attachAnalysisContextWithCompletionHandler:&stru_1000CDA68];

  return v6;
}

- (void)setHighPriority:(unsigned __int8)a3
{
}

- (void)setFarField:(unsigned __int8)a3
{
}

- (void)createRecognitionBufferWithDelegate:(RDSAPICSpeechAnalyzerDelegate *)a3 task:(id)a4
{
  id v6 = a4;
  -[RDSAPIObjCSpeechAnalyzer setDelegate:](self, "setDelegate:", a3);
  v7 = objc_alloc(&OBJC_CLASS___RDSAPIObjCSpeechAnalyzerAudioBuffer);
  speechAnalyzerAudioBuffer = self->_speechAnalyzerAudioBuffer;
  self->_speechAnalyzerAudioBuffer = v7;

  v9 = self->_speechAnalyzerAudioBuffer;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  v11 = -[RDSAPIObjCSpeechAnalyzerAudioBuffer initWithSwiftSpeechAnalyzer:task:]( v9,  "initWithSwiftSpeechAnalyzer:task:",  v10,  v6);

  v12 = self->_speechAnalyzerAudioBuffer;
  self->_speechAnalyzerAudioBuffer = v11;

  v13 = self->_speechAnalyzerAudioBuffer;
  uint64_t v14 = RXOSLog();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = 0;
      v17 = "SpeechAnalyzerObjC transcriber initialized";
      v18 = (uint8_t *)&v23;
      v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v17, v18, 2u);
    }
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __int16 v22 = 0;
    v17 = "SpeechAnalyzerObjC transcriber could not be initialized";
    v18 = (uint8_t *)&v22;
    v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  return self->_speechAnalyzerAudioBuffer;
}

- (void)didRecognizeFinalResults:(id)a3 nBestResults:(id)a4 firstBestResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = RXOSLog();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Calling didRecognizeFinalResults", v13, 2u);
  }

  if (*((void *)-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate") + 5)) {
    (*((void (**)(void, id, id, id, id, id, id))-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate") + 5))( *(void *)-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate"),  v8,  v8,  v9,  v8,  v8,  v10);
  }
}

- (void)didGetUtteranceBoundary:(int64_t)a3 utteranceEndSampleNumber:(int64_t)a4
{
  if (*((void *)-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate") + 6)) {
    (*((void (**)(void, int64_t, int64_t))-[RDSAPIObjCSpeechAnalyzer delegate]( self,  "delegate")
  }
     + 6))( *(void *)-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate"),  a3,  a4);
}

- (void)didRecognizePartialResultTokens:(id)a3
{
  id v4 = a3;
  uint64_t v5 = RXOSLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Calling didRecognizePartialResultTokens", v7, 2u);
  }

  if (*((void *)-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate") + 2)) {
    (*((void (**)(void, id))-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate") + 2))( *(void *)-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate"),  v4);
  }
}

- (void)didFinishRecognitionWithError:(id)a3
{
  uint64_t v4 = RXOSLog();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recognition Error", v7, 2u);
  }

  if (*((void *)-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate") + 3))
  {
    id v6 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"SpeechAPIErrorDomain",  0LL,  0LL);
    (*((void (**)(void, NSError *))-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate") + 3))( *(void *)-[RDSAPIObjCSpeechAnalyzer delegate](self, "delegate"),  v6);
  }

- (void)setLeftContextText:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  [v5 setTextWithLeftContextText:v4];
}

- (id)getUserProfileData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getUserProfileData]);

  return v3;
}

- (void)setUserProfileData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  [v5 setContextWithUserProfileData:v4];
}

- (id)getJitProfileData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getJitProfileData]);

  return v3;
}

- (void)setJitProfileData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzer swiftSpeechAnalyzer](self, "swiftSpeechAnalyzer"));
  [v5 setContextWithJitProfileData:v4];
}

- (void)setRecognitionReplacements:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[RDSAPIObjCSpeechAnalyzer speechAnalyzerAudioBuffer](self, "speechAnalyzerAudioBuffer"));
  [v4 setRecognitionReplacements:v3];
}

- (void)dealloc
{
  uint64_t v3 = RXOSLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SpeechAnalyzerObjC deallocated", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RDSAPIObjCSpeechAnalyzer;
  -[RDSAPIObjCSpeechAnalyzer dealloc](&v5, "dealloc");
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (RDSAPICSpeechAnalyzerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(RDSAPICSpeechAnalyzerDelegate *)a3
{
  self->_delegate = a3;
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)swiftSpeechAnalyzer
{
  return self->_swiftSpeechAnalyzer;
}

- (void)setSwiftSpeechAnalyzer:(id)a3
{
}

- (unsigned)highPriority
{
  return self->_highPriority;
}

- (unsigned)farField
{
  return self->_farField;
}

- (RDSAPIObjCSpeechAnalyzerAudioBuffer)speechAnalyzerAudioBuffer
{
  return self->_speechAnalyzerAudioBuffer;
}

- (void)setSpeechAnalyzerAudioBuffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end