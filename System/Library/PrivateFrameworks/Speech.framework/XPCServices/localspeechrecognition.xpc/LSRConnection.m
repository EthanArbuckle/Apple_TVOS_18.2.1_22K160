@interface LSRConnection
+ (id)_jitProfileWithLanguage:(id)a3 modelRoot:(id)a4;
+ (id)modelRootWithLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5 modelOverrideURL:(id)a6 error:(id *)a7;
+ (id)modelRootWithLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 error:(id *)a8;
+ (id)processStartTimeOnce;
+ (int)countOfRecognizers;
+ (void)_cachedRecognizerCleanUp;
+ (void)_cancelCooldownTimer;
+ (void)_cooldownTimerFired;
+ (void)_scheduleCooldownTimer;
+ (void)captureProcessStartTime;
+ (void)initialize;
- ($115C4C562B26FF47E01F9F4EA65B5887)_auditToken;
- (BOOL)_callerHasWritePriviledge:(id)a3;
- (BOOL)_consumeSandboxExtensions:(id)a3 error:(id *)a4;
- (BOOL)prepareRecognizerWithLanguage:(id)a3 recognitionOverrides:(id)a4 modelOverrideURL:(id)a5 anyConfiguration:(BOOL)a6 task:(id)a7 clientID:(id)a8 error:(id *)a9;
- (LSRConnection)init;
- (LSRConnection)initWithXPCConnection:(id)a3;
- (id)_delegate;
- (id)_requestContext;
- (void)addAudioPacket:(id)a3;
- (void)addProns:(id)a3 forWord:(id)a4 completion:(id)a5;
- (void)addSentenceToNgramCounts:(id)a3;
- (void)addSentenceToNgramCounts:(id)a3 completion:(id)a4;
- (void)appLmNeedsRebuild:(id)a3 language:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6;
- (void)cancelSpeech;
- (void)cleanupCacheWithCompletion:(id)a3;
- (void)configParametersForVoicemailWithLanguage:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeToDirectory:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6;
- (void)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8;
- (void)dealloc;
- (void)deserializeNgramCountsData:(id)a3 completion:(id)a4;
- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 detailedProgress:(BOOL)a5;
- (void)fetchAssetsForLanguage:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)generateNgramCountsSerializeDataWithCompletion:(id)a3;
- (void)getJitProfileData:(id)a3 contextualStrings:(id)a4 clientID:(id)a5 reply:(id)a6;
- (void)initializeLmWithAssetPath:(id)a3 completion:(id)a4;
- (void)initializeLmWithLocale:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)initializeWithSandboxExtensions:(id)a3;
- (void)installedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4;
- (void)lmeThresholdWithCompletion:(id)a3;
- (void)logCoreAnalyticsEvent:(id)a3 withAnalytics:(id)a4;
- (void)makeEARLanguageDetectorWithDetectorOptions:(id)a3 clientInfo:(id)a4 analysisOptions:(id)a5 reply:(id)a6;
- (void)makeEARSpeechRecognizerWithSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6 sandboxExtensions:(id)a7 reply:(id)a8;
- (void)makeEuclidInstanceWithLocale:(id)a3 clientID:(id)a4 encoderType:(int64_t)a5 initFlag:(int64_t)a6 reply:(id)a7;
- (void)makeLSRAssetsForLocale:(id)a3 taskName:(id)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 reply:(id)a8;
- (void)metricsWithCompletion:(id)a3;
- (void)oovWordsAndFrequenciesWithCompletion:(id)a3;
- (void)pathToAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)preloadRecognizerForLanguage:(id)a3 task:(id)a4 clientID:(id)a5 recognitionOverrides:(id)a6 modelOverrideURL:(id)a7 completion:(id)a8;
- (void)processStartTimeOnceWithReply:(id)a3;
- (void)reportFailureWithError:(id)a3;
- (void)setCachedJitProfileBuilder:(id)a3;
- (void)setCachedLanguage:(id)a3;
- (void)setCachedModelRoot:(id)a3;
- (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 clientID:(id)a5 completion:(id)a6;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
- (void)startRecordedAudioDictationWithParameters:(id)a3;
- (void)stopSpeech;
- (void)subscriptionsForClientId:(id)a3 completion:(id)a4;
- (void)supportedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4;
- (void)synchronousComputeEuclidEmbeddingsForSources:(id)a3 completion:(id)a4;
- (void)synchronousCreateEuclidInstanceForLanguageStr:(id)a3 clientID:(id)a4 inputFormat:(int64_t)a5 loadingOption:(int64_t)a6 completion:(id)a7;
- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8;
- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtension:(id)a7 completion:(id)a8;
- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 sandboxExtension:(id)a4 completion:(id)a5;
- (void)unsubscribeFromAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)updateAudioDuration:(id)a3;
- (void)wakeUpWithCompletion:(id)a3;
@end

@implementation LSRConnection

- (LSRConnection)init
{
  return 0LL;
}

- (LSRConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___LSRConnection;
  v6 = -[LSRConnection init](&v31, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    bufferedAudioPackets = v7->_bufferedAudioPackets;
    v7->_bufferedAudioPackets = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___SFRequestParameters);
    requestParameters = v7->_requestParameters;
    v7->_requestParameters = v10;

    v12 = objc_opt_new(&OBJC_CLASS____TtC22localspeechrecognition12EARInterface);
    earInterface = v7->_earInterface;
    v7->_earInterface = v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[AssistantAssetDelegateInterface sharedInstance]( &OBJC_CLASS____TtC22localspeechrecognition31AssistantAssetDelegateInterface,  "sharedInstance"));
    assistantAssetDelegateInterface = v7->_assistantAssetDelegateInterface;
    v7->_assistantAssetDelegateInterface = (_TtC22localspeechrecognition31AssistantAssetDelegateInterface *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[GeneralASRAssetDelegateInterface sharedInstance]( &OBJC_CLASS____TtC22localspeechrecognition32GeneralASRAssetDelegateInterface,  "sharedInstance"));
    generalASRAssetDelegateInterface = v7->_generalASRAssetDelegateInterface;
    v7->_generalASRAssetDelegateInterface = (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface *)v16;

    -[NSXPCConnection _setQueue:](v7->_connection, "_setQueue:", qword_10005D4B8);
    signal(15, (void (__cdecl *)(int))1);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(global_queue);
    sigterm_queue = v7->sigterm_queue;
    v7->sigterm_queue = (OS_dispatch_queue *)v19;

    dispatch_source_t v21 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)v7->sigterm_queue);
    sigterm_source = v7->sigterm_source;
    v7->sigterm_source = (OS_dispatch_source *)v21;

    dispatch_source_set_event_handler((dispatch_source_t)v7->sigterm_source, &stru_100051BA0);
    dispatch_activate((dispatch_object_t)v7->sigterm_source);
    objc_initWeak(&location, v7);
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = sub_100037D98;
    v28 = &unk_100051BC8;
    objc_copyWeak(&v29, &location);
    v23 = objc_retainBlock(&v25);
    objc_msgSend(v5, "setInterruptionHandler:", v23, v25, v26, v27, v28);
    [v5 setInvalidationHandler:v23];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  audioBuffer = self->_audioBuffer;
  if (audioBuffer == (_EARSpeechRecognitionAudioBuffer *)qword_10005D4C0)
  {
    qword_10005D4C0 = 0LL;
  }

  v4 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[LSRConnection dealloc]";
    __int16 v8 = 2112;
    v9 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s %@ deallocating", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSRConnection;
  -[LSRConnection dealloc](&v5, "dealloc");
}

- (id)_delegate
{
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (BOOL)_consumeSandboxExtensions:(id)a3 error:(id *)a4
{
  v6 = (char *)a3;
  v7 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[LSRConnection _consumeSandboxExtensions:error:]";
    __int16 v36 = 2112;
    v37 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Consuming sandbox extensions: %@",  buf,  0x16u);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int16 v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v9) {
    goto LABEL_11;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v28;
  while (2)
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = sandbox_extension_consume([*(id *)(*((void *)&v27 + 1) + 8 * (void)i) UTF8String]);
      if (v13 < 0)
      {
        uint64_t v16 = (void *)SFLogConnection;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
        {
          v24 = v16;
          v25 = __error();
          uint64_t v26 = strerror(*v25);
          *(_DWORD *)buf = 136315394;
          v35 = "-[LSRConnection _consumeSandboxExtensions:error:]";
          __int16 v36 = 2080;
          v37 = v26;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Error consuming sandbox extension: %s",  buf,  0x16u);

          if (!a4) {
            goto LABEL_15;
          }
        }

        else if (!a4)
        {
          goto LABEL_15;
        }

        v31[0] = NSLocalizedDescriptionKey;
        v17 = __error();
        v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error consuming sandbox extension: %s",  strerror(*v17));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v32[0] = v19;
        v31[1] = NSUnderlyingErrorKey;
        v20 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
        dispatch_source_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v32[1] = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  1LL,  v22));

        LOBYTE(a4) = 0;
        goto LABEL_15;
      }

      consumedSandboxExtensions = self->_consumedSandboxExtensions;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v13));
      -[NSMutableArray addObject:](consumedSandboxExtensions, "addObject:", v15);
    }

    id v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v10) {
      continue;
    }
    break;
  }

- ($115C4C562B26FF47E01F9F4EA65B5887)_auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (BOOL)_callerHasWritePriviledge:(id)a3
{
  id v4 = a3;
  -[LSRConnection _auditToken](self, "_auditToken");
  int v5 = sandbox_check_by_audit_token(v10, "file-write-create", 1LL);
  v6 = (os_log_s *)SFLogConnection;
  BOOL v7 = os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[LSRConnection _callerHasWritePriviledge:]";
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v8 = "%s Caller does not have write priviledges for: %@";
LABEL_7:
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v8, buf, 0x16u);
    }
  }

  else if (v7)
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[LSRConnection _callerHasWritePriviledge:]";
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v8 = "%s Caller has write priviledges for: %@";
    goto LABEL_7;
  }

  return v5 == 0;
}

- (id)_requestContext
{
  v3 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    requestParameters = self->_requestParameters;
    int v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters language](requestParameters, "language"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters task](self->_requestParameters, "task"));
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters taskIdentifier](self->_requestParameters, "taskIdentifier"));
    unsigned int v9 = -[SFRequestParameters narrowband](self->_requestParameters, "narrowband");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters applicationName](self->_requestParameters, "applicationName"));
    unsigned int v11 = -[SFRequestParameters enableAutoPunctuation](self->_requestParameters, "enableAutoPunctuation");
    *(_DWORD *)buf = 136316674;
    v34 = "-[LSRConnection _requestContext]";
    __int16 v35 = 2112;
    __int16 v36 = v6;
    __int16 v37 = 2112;
    v38 = v7;
    __int16 v39 = 2112;
    v40 = v8;
    __int16 v41 = 1024;
    unsigned int v42 = v9;
    __int16 v43 = 2112;
    v44 = v10;
    __int16 v45 = 1024;
    unsigned int v46 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s RequestContext: language:%@ task:%@ taskIdentifier:%@ narrowband:%d appname:%@ enableAutoPunctuation:%d",  buf,  0x40u);
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SFRequestParameters language](self->_requestParameters, "language", kSFCoreAnalyticsLanguageKey));
  __int16 v13 = (void *)v12;
  if (v12) {
    id v14 = (const __CFString *)v12;
  }
  else {
    id v14 = @"none";
  }
  v32[0] = v14;
  v31[1] = kSFCoreAnalyticsTaskKey;
  uint64_t v15 = objc_claimAutoreleasedReturnValue(-[SFRequestParameters task](self->_requestParameters, "task"));
  uint64_t v16 = (void *)v15;
  if (v15) {
    v17 = (const __CFString *)v15;
  }
  else {
    v17 = @"none";
  }
  v32[1] = v17;
  void v31[2] = kSFCoreAnalyticsTaskIdentifierKey;
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SFRequestParameters taskIdentifier](self->_requestParameters, "taskIdentifier"));
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = (const __CFString *)v18;
  }
  else {
    v20 = @"none";
  }
  void v32[2] = v20;
  v31[3] = kSFCoreAnalyticsNarrowbandKey;
  dispatch_source_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SFRequestParameters narrowband](self->_requestParameters, "narrowband")));
  v32[3] = v21;
  v31[4] = kSFCoreAnalyticsAppnameKey;
  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[SFRequestParameters applicationName](self->_requestParameters, "applicationName"));
  v23 = (void *)v22;
  if (v22) {
    v24 = (const __CFString *)v22;
  }
  else {
    v24 = @"none";
  }
  v32[4] = v24;
  v32[5] = &__kCFBooleanTrue;
  v31[5] = kSFCoreAnalyticsOndeviceKey;
  v31[6] = kSFCoreAnalyticsUsesCustomLmKey;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicLanguageModel](self->_requestParameters, "dynamicLanguageModel"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v25 != 0LL));
  v32[6] = v26;
  v31[7] = kSFCoreAnalyticsUsesCustomVocabKey;
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicVocabulary](self->_requestParameters, "dynamicVocabulary"));
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v27 != 0LL));
  v32[7] = v28;
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  8LL));

  return v29;
}

- (BOOL)prepareRecognizerWithLanguage:(id)a3 recognitionOverrides:(id)a4 modelOverrideURL:(id)a5 anyConfiguration:(BOOL)a6 task:(id)a7 clientID:(id)a8 error:(id *)a9
{
  BOOL v75 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id obj = a7;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v85 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Preparing recognizer...", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D4B8);
  uint64_t v20 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode(v14);
  uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
  uint64_t v22 = (void *)v21;
  if (v21) {
    v23 = (void *)v21;
  }
  else {
    v23 = v14;
  }
  v24 = v23;

  v25 = v17;
  if (v17) {
    unint64_t v26 = SFEntitledAssetTypeForTaskName(v17);
  }
  else {
    unint64_t v26 = 3LL;
  }
  self->_modelAssetType = v26;
  v79[1] = 0LL;
  __int128 v27 = (__CFString *)v24;
  v77 = v18;
  v78 = v16;
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[LSRConnection modelRootWithLanguage:assetType:clientID:modelOverrideURL:error:]( &OBJC_CLASS___LSRConnection,  "modelRootWithLanguage:assetType:clientID:modelOverrideURL:error:",  v24));
  id v29 = 0LL;
  id v30 = v29;
  v76 = v28;
  if (!v28 || v29)
  {
    v34 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      v67 = v34;
      v68 = (NSString *)objc_claimAutoreleasedReturnValue([v30 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      v85 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
      __int16 v86 = 2112;
      v87 = @"modelRoot is nil";
      __int16 v88 = 2112;
      v89 = v68;
      _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%s %@ %@", buf, 0x20u);
    }

    if (a9)
    {
      __int16 v36 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___LSRConnection, v35));
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue( [v37 localizedStringForKey:@"Failed to access assets" value:&stru_100052290 table:@"Localizable"]);

      if (v30)
      {
        v94[0] = NSLocalizedDescriptionKey;
        v94[1] = NSUnderlyingErrorKey;
        v95[0] = v38;
        v95[1] = v30;
        __int16 v39 = (void **)v95;
        v40 = (NSErrorUserInfoKey *)v94;
        uint64_t v41 = 2LL;
      }

      else
      {
        NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
        v93 = v38;
        __int16 v39 = &v93;
        v40 = &v92;
        uint64_t v41 = 1LL;
      }

      v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v40,  v41));
      *a9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  102LL,  v64));
    }

    goto LABEL_49;
  }

  p_modelRoot = &self->_modelRoot;
  objc_storeStrong((id *)&self->_modelRoot, v28);
  if (qword_10005D4C0)
  {
    objc_super v31 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "%s Recognizer is running, cancel the request",  buf,  0xCu);
    }

    [(id)qword_10005D4F8 cancelRecognition];
    v32 = (void *)qword_10005D4C0;
    qword_10005D4C0 = 0LL;
  }

  if (qword_10005D4F8)
  {
    if ([(id)qword_10005D4E0 isEqualToString:v24]
      && [(id)qword_10005D4F0 isEqualToString:*p_modelRoot]
      && ((id)qword_10005D500 == v15 || [(id)qword_10005D500 isEqualToDictionary:v15]))
    {
      v33 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
      {
        v72 = *p_modelRoot;
        *(_DWORD *)buf = 136315906;
        v85 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:"
              "clientID:error:]";
        __int16 v86 = 2112;
        v87 = v24;
        __int16 v88 = 2112;
        v89 = v72;
        __int16 v90 = 2112;
        id v91 = v15;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%s Using cached recognizer for language=%@ modelRoot=%@ overrides=%@",  buf,  0x2Au);
      }

      objc_storeWeak((id *)&self->_recognizer, (id)qword_10005D4F8);
      id v30 = 0LL;
      goto LABEL_35;
    }

    unsigned int v42 = (void *)qword_10005D4F8;
    if (qword_10005D4F8)
    {
      __int16 v43 = (void *)objc_claimAutoreleasedReturnValue( +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing]( &OBJC_CLASS____EARSpeechRecognitionActiveConfiguration,  "activeConfigurationForNothing"));
      [v42 setActiveConfiguration:v43];

      v44 = (void *)qword_10005D4F8;
      qword_10005D4F8 = 0LL;
    }
  }

  __int16 v45 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    v69 = *p_modelRoot;
    *(_DWORD *)buf = 136315906;
    v85 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
    __int16 v86 = 2112;
    v87 = v24;
    __int16 v88 = 2112;
    v89 = v69;
    __int16 v90 = 2112;
    id v91 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "%s Initializing a new recognizer for language=%@ modelRoot=%@ overrides=%@",  buf,  0x2Au);
  }

  modelRoot = self->_modelRoot;
  v79[0] = 0LL;
  id v47 = v15;
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[_EARSpeechRecognizer _speechRecognizerWithLanguage:overrides:anyConfiguration:taskConfiguration:modelRoot:error:modelLoadTime:]( &OBJC_CLASS____EARSpeechRecognizer,  "_speechRecognizerWithLanguage:overrides:anyConfiguration:taskConfiguration:modelRoot:error:modelLoadTime:",  v24,  v15,  v75,  v17,  modelRoot,  v79,  &self->_modelLoadTime));
  id v30 = v79[0];
  objc_storeWeak((id *)&self->_recognizer, v48);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_recognizer);
  if (WeakRetained)
  {
    id v50 = objc_loadWeakRetained((id *)&self->_recognizer);
    v51 = (void *)qword_10005D4F8;
    qword_10005D4F8 = (uint64_t)v50;

    objc_storeStrong((id *)&qword_10005D500, a4);
    id v52 = objc_loadWeakRetained((id *)&self->_recognizer);
    uint64_t v53 = objc_claimAutoreleasedReturnValue([v52 modelInfo]);
    v54 = (void *)qword_10005D508;
    qword_10005D508 = v53;

    objc_storeStrong((id *)&qword_10005D4E0, v23);
    objc_storeStrong((id *)&qword_10005D4F0, *p_modelRoot);
    objc_storeStrong((id *)&qword_10005D510, obj);
  }

  id v15 = v47;
  __int128 v27 = (__CFString *)v24;
LABEL_35:
  v25 = v17;
  if (qword_10005D4F8) {
    +[LSRConnection _scheduleCooldownTimer](&OBJC_CLASS___LSRConnection, "_scheduleCooldownTimer");
  }
  id v55 = objc_loadWeakRetained((id *)&self->_recognizer);

  v56 = (void *)SFLogConnection;
  if (!v55)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      v70 = v56;
      v71 = (NSString *)objc_claimAutoreleasedReturnValue([v30 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      v85 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
      __int16 v86 = 2112;
      v87 = @"_EARSpeechRecognizer is nil";
      __int16 v88 = 2112;
      v89 = v71;
      _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%s %@ %@", buf, 0x20u);
    }

    if (a9)
    {
      if (v30)
      {
        v82[0] = NSLocalizedDescriptionKey;
        v82[1] = NSUnderlyingErrorKey;
        v83[0] = @"Failed to initialize recognizer";
        v83[1] = v30;
        v61 = (const __CFString **)v83;
        v62 = (NSErrorUserInfoKey *)v82;
        uint64_t v63 = 2LL;
      }

      else
      {
        NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
        v81 = @"Failed to initialize recognizer";
        v61 = &v81;
        v62 = &v80;
        uint64_t v63 = 1LL;
      }

      v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v62,  v63));
      *a9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  300LL,  v65));
    }

- (void)preloadRecognizerForLanguage:(id)a3 task:(id)a4 clientID:(id)a5 recognitionOverrides:(id)a6 modelOverrideURL:(id)a7 completion:(id)a8
{
  id v14 = (void (**)(id, void))a8;
  id v19 = 0LL;
  LOBYTE(a6) = -[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]( self,  "prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:",  a3,  a6,  a7,  1LL,  a4,  a5,  &v19);
  id v15 = v19;
  id v16 = 0LL;
  if ((a6 & 1) == 0)
  {
    id v17 = (os_log_s *)SFLogConnection;
    BOOL v18 = os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR);
    id v16 = v15;
    if (v18)
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[LSRConnection preloadRecognizerForLanguage:task:clientID:recognitionOverrides:modelOverrideURL:completion:]";
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Failed to prepare recognizer in advance: %@",  buf,  0x16u);
      id v16 = v15;
    }
  }

  ((void (**)(id, id))v14)[2](v14, v16);
}

- (void)startRecordedAudioDictationWithParameters:(id)a3
{
  id v5 = a3;
  v6 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Starting..", buf, 0xCu);
  }

  *(_WORD *)&self->_recognitionResultPackageGenerated = 0;
  *(_OWORD *)&self->_audioDuration = 0u;
  *(_OWORD *)&self->_lastAudioPacketTime = 0u;
  *(_OWORD *)&self->_firstAudioPacketTime = 0u;
  *(_OWORD *)&self->_silStartFirstToken = 0u;
  self->_asrInitializationTime = 0.0;
  unsigned int v7 = [v5 onDeviceOnly];
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v9 = v8;
  if (!v8)
  {
    id v14 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "CheckPrerecordedConnectionAccess";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Called from outside of an XPC connection",  buf,  0xCu);
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1700LL,  0LL));
    goto LABEL_21;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.assistant.dictation.prerecorded"]);
  if ((objc_opt_respondsToSelector(v10, "BOOLValue") & 1) != 0)
  {
LABEL_13:
    id v12 = 0LL;
    char v13 = 1;
    goto LABEL_16;
  }

  if (!v7) {
    goto LABEL_13;
  }
LABEL_6:
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  if (([v11 assistantIsEnabled] & 1) != 0
    || ([v11 dictationIsEnabled] & 1) != 0)
  {
    id v12 = 0LL;
    char v13 = 1;
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError lsr_errorWithCode:description:]( &OBJC_CLASS___NSError,  "lsr_errorWithCode:description:",  201LL,  @"Siri and Dictation are disabled"));
    char v13 = 0;
  }

LABEL_16:
  id v15 = v12;
  if ((v13 & 1) != 0)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)qword_10005D4B8);
    if (self->_audioBuffer)
    {
      id v16 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = @"Recognizer is busy";
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }

      NSErrorUserInfoKey v232 = NSLocalizedDescriptionKey;
      v233 = @"Recognizer is busy";
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v233,  &v232,  1LL));
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1100LL,  v17));
      -[LSRConnection reportFailureWithError:](self, "reportFailureWithError:", v18);

      goto LABEL_24;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v21 = (const __CFString *)[v20 bundleIdentifier];

    uint64_t v22 = kSFSpeechRecognizerDumpedTaskIdentifierKey;
    if (CFPreferencesAppValueIsForced(kSFSpeechRecognizerDumpedTaskIdentifierKey, v21)
      || SFIsInternalInstall())
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 taskIdentifier]);
      BOOL v24 = v23 == 0LL;

      if (!v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationName]);
        unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 taskIdentifier]);
        __int128 v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v25,  v26));

        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 stringForKey:v22]);

        LODWORD(v26) = [v29 isEqualToString:v27];
        id v30 = (os_log_s *)SFLogConnection;
        objc_super v31 = v30;
        if ((_DWORD)v26)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue([v5 requestIdentifier]);
            v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v5 taskIdentifier]);
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v32;
            *(_WORD *)&buf[22] = 2112;
            v223 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s Audio dumps will be enabled for request: %@ with taskIdentifier: %@",  buf,  0x20u);
          }

          v34 = objc_alloc(&OBJC_CLASS___LSRAudioDump);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v5 taskIdentifier]);
          __int16 v36 = -[LSRAudioDump initWithTaskIdentifier:](v34, "initWithTaskIdentifier:", v35);
          audioDump = self->_audioDump;
          self->_audioDump = v36;

          __int128 v214 = 0u;
          __int128 v215 = 0u;
          __int128 v212 = 0u;
          __int128 v213 = 0u;
          objc_super v31 = self->_bufferedAudioPackets;
          id v38 = -[os_log_s countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v212,  v231,  16LL);
          if (v38)
          {
            uint64_t v39 = *(void *)v213;
            do
            {
              for (i = 0LL; i != v38; i = (char *)i + 1)
              {
                if (*(void *)v213 != v39) {
                  objc_enumerationMutation(v31);
                }
                -[LSRAudioDump appendBytes:]( self->_audioDump,  "appendBytes:",  *(void *)(*((void *)&v212 + 1) + 8LL * (void)i));
              }

              id v38 = -[os_log_s countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v212,  v231,  16LL);
            }

            while (v38);
          }
        }

        else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v29;
          *(_WORD *)&buf[22] = 2112;
          v223 = v27;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "%s Dump will not be created because dump identifier (%@) doesn't match the qualified task identifier (%@).",  buf,  0x20u);
        }
      }
    }

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v41 systemUptime];
    double v43 = v42;

    p_requestParameters = &self->_requestParameters;
    objc_storeStrong((id *)&self->_requestParameters, a3);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);
    LODWORD(v41) = v44 == 0LL;

    if ((_DWORD)v41)
    {
      v58 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%s task name is nil", buf, 0xCu);
      }

      v60 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___LSRConnection, v59));
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      id v51 = (id)objc_claimAutoreleasedReturnValue( [v61 localizedStringForKey:@"task name is nil" value:&stru_100052290 table:@"Localizable"]);

      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSError lsr_errorWithCode:description:]( &OBJC_CLASS___NSError,  "lsr_errorWithCode:description:",  3LL,  v51));
      -[LSRConnection reportFailureWithError:](self, "reportFailureWithError:", v62);

      goto LABEL_146;
    }

    __int16 v45 = (void *)objc_claimAutoreleasedReturnValue([v5 language]);
    unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue([v5 recognitionOverrides]);
    id v47 = (void *)objc_claimAutoreleasedReturnValue([v5 modelOverrideURL]);
    v48 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v5 clientIdentifier]);
    id v211 = 0LL;
    unsigned __int8 v50 = -[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]( self,  "prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:",  v45,  v46,  v47,  0LL,  v48,  v49,  &v211);
    id v51 = v211;

    if ((v50 & 1) == 0)
    {
      -[LSRConnection reportFailureWithError:](self, "reportFailureWithError:", v51);
LABEL_146:

      goto LABEL_24;
    }

    if (SFIsInternalInstall())
    {
      id v52 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters task](*p_requestParameters, "task"));
      unsigned __int8 v53 = [v52 isEqualToString:kSFSpeechRecognizerTaskCaptioning];

      if ((v53 & 1) != 0)
      {
        QuasarC_setLogLevel(2LL);
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 stringForKey:kSFSpeechRecognizerQuasarLoggingKey]);

        if ([v55 length] && objc_msgSend(v55, "intValue"))
        {
          v56 = (os_log_s *)SFLogConnection;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            unsigned int v57 = [v55 intValue];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v57;
            _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_INFO,  "%s Customized Quasar log level to:%d",  buf,  0x12u);
          }

          QuasarC_setLogLevel([v55 intValue]);
        }
      }
    }

    else
    {
      QuasarC_setLogLevel(2LL);
    }

    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v63 systemUptime];
    self->_recognitionBeginTime = v64;

    id location = (id *)&self->_recognizer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_recognizer);
    -[SFRequestParameters maximumRecognitionDuration](self->_requestParameters, "maximumRecognitionDuration");
    objc_msgSend(WeakRetained, "setMaximumRecognitionDuration:");

    id v66 = objc_loadWeakRetained((id *)&self->_recognizer);
    objc_msgSend( v66,  "setConcatenateUtterances:",  -[SFRequestParameters detectMultipleUtterances]( self->_requestParameters,  "detectMultipleUtterances") ^ 1);

    id v67 = objc_loadWeakRetained((id *)&self->_recognizer);
    objc_msgSend( v67,  "setDisableAutoPunctuation:",  -[SFRequestParameters enableAutoPunctuation](self->_requestParameters, "enableAutoPunctuation") ^ 1);

    unsigned int v68 = -[SFRequestParameters narrowband](self->_requestParameters, "narrowband");
    uint64_t v69 = 16000LL;
    if (v68) {
      uint64_t v69 = 8000LL;
    }
    uint64_t v195 = v69;
    v70 = (void *)qword_10005D508;
    v71 = (void *)objc_claimAutoreleasedReturnValue([v5 task]);
    id v72 = v70;
    id v73 = v71;
    v74 = (void *)objc_claimAutoreleasedReturnValue([v72 tasks]);
    if ([v74 containsObject:v73])
    {
      id v199 = v73;
      id v76 = v51;
    }

    else
    {
      v77 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___LSRConnection, v75));
      v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
      v79 = (void *)objc_claimAutoreleasedReturnValue( [v78 localizedStringForKey:@"Task %@ not available for %@, supported tasks are %@", &stru_100052290, @"Localizable" value table]);
      NSErrorUserInfoKey v80 = (void *)objc_claimAutoreleasedReturnValue([v72 language]);
      os_log_t logb = (os_log_t)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v79,  v73,  v80,  v74));

      *(void *)v217 = NSLocalizedFailureReasonErrorKey;
      *(void *)buf = logb;
      v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v217,  1LL));
      id v76 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  3LL,  v81));

      id v199 = 0LL;
    }

    id v197 = v76;
    if (!v199)
    {
      v99 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___LSRConnection, v82));
      v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
      v101 = (void *)objc_claimAutoreleasedReturnValue( [v100 localizedStringForKey:@"Failed to find task for recognizer" value:&stru_100052290 table:@"Localizable"]);

      if (v197)
      {
        v229[0] = NSLocalizedDescriptionKey;
        v229[1] = NSUnderlyingErrorKey;
        v230[0] = v101;
        v230[1] = v197;
        v198 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v230,  v229,  2LL));
      }

      else
      {
        NSErrorUserInfoKey v227 = NSLocalizedDescriptionKey;
        v228 = v101;
        v198 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v228,  &v227,  1LL));
      }

      v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  3LL,  v198));
      -[LSRConnection reportFailureWithError:](self, "reportFailureWithError:", v102);

LABEL_145:
      id v51 = v197;
      goto LABEL_146;
    }

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters inlineItemList](*p_requestParameters, "inlineItemList"));
    if (!v83
      || (v84 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters inlineItemList](*p_requestParameters, "inlineItemList")),
          BOOL v85 = [v84 count] == 0,
          v84,
          v83,
          v85))
    {
      id v93 = objc_loadWeakRetained(location);
      [v93 setJitProfileData:0];
    }

    else
    {
      __int16 v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v86 systemUptime];
      double v88 = v87;

      v89 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        __int16 v90 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters inlineItemList](*p_requestParameters, "inlineItemList"));
        id v91 = [v90 count];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v91;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "%s Inline LME input size=%zu", buf, 0x16u);
      }

      NSErrorUserInfoKey v92 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters language](self->_requestParameters, "language"));
      id v93 = (id)objc_claimAutoreleasedReturnValue( +[LSRConnection _jitProfileWithLanguage:modelRoot:]( &OBJC_CLASS___LSRConnection,  "_jitProfileWithLanguage:modelRoot:",  v92,  self->_modelRoot));

      if (v93)
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters inlineItemList](*p_requestParameters, "inlineItemList"));
        v95 = (os_log_s *)objc_claimAutoreleasedReturnValue([v93 jitProfileFromContextualStrings:v94]);

        if (!v95)
        {
          v96 = (os_log_s *)SFLogConnection;
          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "%s Failed to build jitData", buf, 0xCu);
          }
        }

        id v97 = objc_loadWeakRetained(location);
        [v97 setJitProfileData:v95];

        v98 = (os_log_s *)SFLogConnection;
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEBUG,  "%s Set JIT profile for the request",  buf,  0xCu);
        }
      }

      else
      {
        v95 = (os_log_s *)SFLogConnection;
        if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_INFO,  "%s Failed to build jitProfile with error %@",  buf,  0x16u);
        }
      }

      v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v103 systemUptime];
      self->_jitLmeProcessingTime = v104 - v88;
    }

    uint64_t v105 = objc_claimAutoreleasedReturnValue(-[SFRequestParameters language](self->_requestParameters, "language"));
    v106 = (void *)qword_10005D4E0;
    qword_10005D4E0 = v105;

    objc_storeStrong((id *)&qword_10005D4F0, self->_modelRoot);
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicLanguageModel](self->_requestParameters, "dynamicLanguageModel"));

    if (!v107)
    {
      v198 = &__NSArray0__struct;
LABEL_104:
      id v130 = objc_loadWeakRetained(location);
      [v130 setExtraLmList:v198];

      v131 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicVocabulary](*p_requestParameters, "dynamicVocabulary"));
      if (v131)
      {
        v132 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicVocabulary](*p_requestParameters, "dynamicVocabulary"));
        v133 = (void *)objc_claimAutoreleasedReturnValue([v132 path]);
        id v134 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v133));

        if (v134)
        {
          v135 = (os_log_s *)SFLogConnection;
          if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
          {
            v136 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicVocabulary](*p_requestParameters, "dynamicVocabulary"));
            id v137 = (id)objc_claimAutoreleasedReturnValue([v136 path]);
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v137;
            _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_INFO, "%s Loaded Dynamic Vocab: %@", buf, 0x16u);
          }

          id v138 = objc_loadWeakRetained(location);
          [v138 setUserProfileData:v134];
        }
      }

      else
      {
        id v134 = objc_loadWeakRetained(location);
        [v134 setUserProfileData:0];
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v223 = sub_100036EAC;
      v224 = sub_100036EBC;
      id v225 = 0LL;
      v210[0] = _NSConcreteStackBlock;
      v210[1] = 3221225472LL;
      v210[2] = sub_1000374D8;
      v210[3] = &unk_100051CA8;
      v210[4] = self;
      v210[5] = buf;
      v193 = objc_retainBlock(v210);
      v139 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters task](self->_requestParameters, "task"));
      v140 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters taskIdentifier](*p_requestParameters, "taskIdentifier"));
      id v141 = v139;
      id v142 = v140;
      if ([v141 isEqualToString:kSFSpeechRecognizerTaskCaptioning]
        && ([v142 isEqualToString:kSFSpeechRecognizerTaskIdentifierCallScreening] & 1) != 0
        || ([v141 isEqualToString:kSFSpeechRecognizerTaskVoiceMail] & 1) != 0)
      {
        BOOL v143 = 1;
      }

      else
      {
        v144 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
        BOOL v143 = [v144 effectiveBoolValueForSetting:MCFeatureAssistantProfanityFilterForced] == 1;
      }

      v145 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v217 = 136315394;
        *(void *)&v217[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        __int16 v218 = 1024;
        LODWORD(v219) = v143;
        _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_INFO, "%s Censor Speech enabled: %d", v217, 0x12u);
      }

      if (v143)
      {
        uint64_t v146 = ((uint64_t (*)(void))v193[2])();
        id v194 = (id)objc_claimAutoreleasedReturnValue(v146);
      }

      else
      {
        id v194 = 0LL;
      }

      id v147 = objc_loadWeakRetained(location);
      [v147 setRecognitionReplacements:v194];

      if ([v199 isEqualToString:kSFSpeechRecognizerTaskVoiceMail])
      {
        id v148 = VoicemailConfidenceSubtractionForLanguage(self->_modelRoot);
        id v149 = (id)objc_claimAutoreleasedReturnValue(v148);
        if (!v149)
        {
          uint64_t v150 = ((uint64_t (*)(void))v193[2])();
          v151 = (void *)objc_claimAutoreleasedReturnValue(v150);
          id v152 = EtiquetteConfidenceSubtraction(v151);
          id v149 = (id)objc_claimAutoreleasedReturnValue(v152);
        }

        id v153 = objc_loadWeakRetained(location);
        [v153 setRecognitionConfidenceSubtraction:v149];
      }

      else
      {
        id v149 = objc_loadWeakRetained(location);
        [v149 setRecognitionConfidenceSubtraction:&__NSDictionary0__struct];
      }

      id v154 = objc_loadWeakRetained(location);
      v196 = (void *)objc_claimAutoreleasedReturnValue([v154 activeConfiguration]);

      os_log_t loga = (os_log_t)[v196 copy];
      v155 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s farFieldFilter](loga, "farFieldFilter"));
      LOBYTE(v154) = v155 == 0LL;

      if ((v154 & 1) == 0)
      {
        v156 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s farFieldFilter](loga, "farFieldFilter"));
        v157 = (void *)objc_claimAutoreleasedReturnValue([v156 setByAddingObject:&__kCFBooleanFalse]);
        -[os_log_s setFarFieldFilter:](loga, "setFarFieldFilter:", v157);
      }

      v158 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s samplingRateFilter](loga, "samplingRateFilter"));
      BOOL v159 = v158 == 0LL;

      if (!v159)
      {
        v160 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s samplingRateFilter](loga, "samplingRateFilter"));
        v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v195));
        v162 = (void *)objc_claimAutoreleasedReturnValue([v160 setByAddingObject:v161]);
        -[os_log_s setSamplingRateFilter:](loga, "setSamplingRateFilter:", v162);
      }

      v163 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s taskTypeFilter](loga, "taskTypeFilter"));
      BOOL v164 = v163 == 0LL;

      if (!v164)
      {
        v165 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s taskTypeFilter](loga, "taskTypeFilter"));
        v166 = (void *)objc_claimAutoreleasedReturnValue([v165 setByAddingObject:v199]);
        -[os_log_s setTaskTypeFilter:](loga, "setTaskTypeFilter:", v166);
      }

      v167 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s atypicalSpeechFilter](loga, "atypicalSpeechFilter"));
      BOOL v168 = v167 == 0LL;

      if (!v168)
      {
        v169 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s atypicalSpeechFilter](loga, "atypicalSpeechFilter"));
        v170 = (void *)objc_claimAutoreleasedReturnValue([v169 setByAddingObject:&__kCFBooleanFalse]);
        -[os_log_s setAtypicalSpeechFilter:](loga, "setAtypicalSpeechFilter:", v170);
      }

      -[os_log_s setDeviceIdFilter:](loga, "setDeviceIdFilter:", 0LL);
      v171 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
      {
        id v172 = sub_100037638(v196);
        id v173 = (id)objc_claimAutoreleasedReturnValue(v172);
        id v174 = sub_100037638(loga);
        id v175 = (id)objc_claimAutoreleasedReturnValue(v174);
        *(_DWORD *)v217 = 136315650;
        *(void *)&v217[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        __int16 v218 = 2112;
        id v219 = v173;
        __int16 v220 = 2112;
        id v221 = v175;
        _os_log_impl( (void *)&_mh_execute_header,  v171,  OS_LOG_TYPE_INFO,  "%s Changing active configuration from \n%@ to \n%@",  v217,  0x20u);
      }

      id v176 = objc_loadWeakRetained(location);
      [v176 setActiveConfiguration:loga];

      id v177 = objc_loadWeakRetained(location);
      v178 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters language](*p_requestParameters, "language"));
      v179 = (_EARSpeechRecognitionAudioBuffer *)objc_claimAutoreleasedReturnValue( [v177 runRecognitionWithResultStream:self language:v178 task:v199 samplingRate:v195]);
      audioBuffer = self->_audioBuffer;
      self->_audioBuffer = v179;

      objc_storeStrong((id *)&qword_10005D4C0, self->_audioBuffer);
      v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v181 systemUptime];
      self->_asrInitializationTime = v182 - v43;

      uint64_t Name = SFAnalyticsEventTypeGetName(100LL);
      v184 = (void *)objc_claimAutoreleasedReturnValue(Name);
      v209[0] = _NSConcreteStackBlock;
      v209[1] = 3221225472LL;
      v209[2] = sub_100037720;
      v209[3] = &unk_100051CD0;
      v209[4] = self;
      AnalyticsSendEventLazy(v184, v209);

      __int128 v207 = 0u;
      __int128 v208 = 0u;
      __int128 v205 = 0u;
      __int128 v206 = 0u;
      v185 = self->_bufferedAudioPackets;
      id v186 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v185,  "countByEnumeratingWithState:objects:count:",  &v205,  v216,  16LL);
      if (v186)
      {
        uint64_t v187 = *(void *)v206;
        do
        {
          for (j = 0LL; j != v186; j = (char *)j + 1)
          {
            if (*(void *)v206 != v187) {
              objc_enumerationMutation(v185);
            }
            v189 = *(void **)(*((void *)&v205 + 1) + 8LL * (void)j);
            unint64_t v190 = (unint64_t)[v189 length];
            v191 = self->_audioBuffer;
            id v192 = v189;
            -[_EARSpeechRecognitionAudioBuffer addAudioSamples:count:]( v191,  "addAudioSamples:count:",  [v192 bytes],  v190 >> 1);
            -[LSRConnection updateAudioDuration:](self, "updateAudioDuration:", v192);
          }

          id v186 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v185,  "countByEnumeratingWithState:objects:count:",  &v205,  v216,  16LL);
        }

        while (v186);
      }

      -[NSMutableArray removeAllObjects](self->_bufferedAudioPackets, "removeAllObjects");
      if (self->_bufferedAudioEnded)
      {
        -[_EARSpeechRecognitionAudioBuffer endAudio](self->_audioBuffer, "endAudio");
        self->_bufferedAudioEnded = 0;
      }

      +[LSRConnection _cancelCooldownTimer](&OBJC_CLASS___LSRConnection, "_cancelCooldownTimer");

      _Block_object_dispose(buf, 8);
      goto LABEL_145;
    }

    v108 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicLanguageModel](*p_requestParameters, "dynamicLanguageModel"));
    v109 = (void *)objc_claimAutoreleasedReturnValue([v108 path]);
    unsigned int v110 = +[_EARArtifact isValid:](&OBJC_CLASS____EARArtifact, "isValid:", v109);

    if (v110)
    {
      id v111 = objc_alloc(&OBJC_CLASS____EARAppLmArtifact);
      v112 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicLanguageModel](*p_requestParameters, "dynamicLanguageModel"));
      v113 = (void *)objc_claimAutoreleasedReturnValue([v112 path]);
      os_log_t log = (os_log_t)[v111 initWithPath:v113];

      if (log)
      {
        id v114 = objc_loadWeakRetained(location);
        v115 = (void *)objc_claimAutoreleasedReturnValue([v114 modelInfo]);
        v116 = (void *)objc_claimAutoreleasedReturnValue([v115 version]);
        id v117 = objc_loadWeakRetained(location);
        v118 = (void *)objc_claimAutoreleasedReturnValue([v117 modelInfo]);
        v119 = (void *)objc_claimAutoreleasedReturnValue([v118 language]);
        unsigned int v120 = -[os_log_s isAdaptableToSpeechModelVersion:locale:]( log,  "isAdaptableToSpeechModelVersion:locale:",  v116,  v119);

        if (v120)
        {
          v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s loadLmHandle](log, "loadLmHandle"));
          v122 = (os_log_s *)SFLogConnection;
          BOOL v123 = os_log_type_enabled(v122, OS_LOG_TYPE_INFO);
          if (v121)
          {
            if (v123)
            {
              v124 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicLanguageModel](*p_requestParameters, "dynamicLanguageModel"));
              id v125 = (id)objc_claimAutoreleasedReturnValue([v124 path]);
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v125;
              _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_INFO, "%s Loaded Dynamic LM: %@", buf, 0x16u);
            }

            v226 = v121;
            v198 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v226,  1LL));
            goto LABEL_102;
          }

          if (v123)
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_INFO,  "%s Failed to load Dynamic LM from Artifact",  buf,  0xCu);
          }

          v121 = 0LL;
        }

        else
        {
          v121 = (os_log_s *)SFLogConnection;
          if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
          {
            v128 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicLanguageModel](*p_requestParameters, "dynamicLanguageModel"));
            id v129 = (id)objc_claimAutoreleasedReturnValue([v128 path]);
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v129;
            _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_INFO,  "%s Dynamic LM at %@ was out of sync with current asset",  buf,  0x16u);
          }
        }

        v198 = &__NSArray0__struct;
LABEL_102:

        goto LABEL_103;
      }

      os_log_t log = 0LL;
    }

    else
    {
      os_log_t log = (os_log_t)SFLogConnection;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v126 = (void *)objc_claimAutoreleasedReturnValue(-[SFRequestParameters dynamicLanguageModel](*p_requestParameters, "dynamicLanguageModel"));
        id v127 = (id)objc_claimAutoreleasedReturnValue([v126 path]);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v127;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s Dynamic LM at %@ was not valid",  buf,  0x16u);
      }
    }

    v198 = &__NSArray0__struct;
LABEL_103:

    goto LABEL_104;
  }

- (void)addAudioPacket:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)qword_10005D4B8;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100037348;
  v7[3] = &unk_100051CF8;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateAudioDuration:(id)a3
{
  id v4 = (dispatch_queue_s *)qword_10005D4B8;
  id v5 = a3;
  dispatch_assert_queue_V2(v4);
  LODWORD(v4) = -[SFRequestParameters narrowband](self->_requestParameters, "narrowband");
  unint64_t v6 = (unint64_t)[v5 length];

  double v7 = 16000.0;
  if ((_DWORD)v4) {
    double v7 = 8000.0;
  }
  self->_audioDuration = self->_audioDuration + (double)(v6 >> 1) / v7;
}

- (void)stopSpeech
{
  v3 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v6 = "-[LSRConnection stopSpeech]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s stopSpeech - %p", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000372A0;
  block[3] = &unk_100051D20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_10005D4B8, block);
}

- (void)cancelSpeech
{
  v3 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v6 = "-[LSRConnection cancelSpeech]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s cancelSpeech - %p", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000371D4;
  block[3] = &unk_100051D20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_10005D4B8, block);
}

- (void)initializeWithSandboxExtensions:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)qword_10005D4B8;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000370A0;
  v7[3] = &unk_100051CF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)logCoreAnalyticsEvent:(id)a3 withAnalytics:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100037098;
  v6[3] = &unk_100051CD0;
  id v7 = a4;
  id v5 = v7;
  AnalyticsSendEventLazy(a3, v6);
}

- (void)cleanupCacheWithCompletion:(id)a3
{
  id v3 = a3;
  if (qword_10005D510)
  {
    id v5 = v3;
    unsigned int v4 = [(id)qword_10005D510 isEqualToString:kSFSpeechRecognizerTaskCaptioning];
    id v3 = v5;
    if (v4)
    {
      +[LSRConnection _cachedRecognizerCleanUp](&OBJC_CLASS___LSRConnection, "_cachedRecognizerCleanUp");
      id v3 = v5;
    }
  }
}

- (void)reportFailureWithError:(id)a3
{
  id v4 = a3;
  uint64_t Name = SFAnalyticsEventTypeGetName(105LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(Name);
  unsigned int v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  unsigned int v11 = sub_100036F5C;
  id v12 = &unk_100051D68;
  char v13 = self;
  id v14 = v4;
  id v7 = v4;
  AnalyticsSendEventLazy(v6, &v9);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[LSRConnection _delegate](self, "_delegate", v9, v10, v11, v12, v13));
  [v8 localSpeechRecognitionDidFail:v7];
}

- (void)setCachedLanguage:(id)a3
{
}

- (void)setCachedModelRoot:(id)a3
{
}

- (void)setCachedJitProfileBuilder:(id)a3
{
}

- (void)pathToAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = a3;
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v10 installedAssetWithConfig:v8]);

    (*((void (**)(id, void *))a5 + 2))(v7, v9);
  }

- (void)supportedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager supportedLanguagesForAssetType:]( &OBJC_CLASS___SFEntitledAssetManager,  "supportedLanguagesForAssetType:",  a3));
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }

- (void)installedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (v6)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 3)
    {
      unsigned int v9 = (dispatch_queue_s *)qword_10005D4B8;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100036F18;
      block[3] = &unk_100051DB8;
      unint64_t v17 = a3;
      id v16 = v6;
      dispatch_async(v9, block);
      id v10 = v16;
LABEL_13:

      goto LABEL_14;
    }

    if (a3 == 3)
    {
      uint64_t v8 = 26LL;
    }

    else
    {
      if (a3 != 7)
      {
        id v10 = 0LL;
        goto LABEL_10;
      }

      uint64_t v8 = 27LL;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class statusForLanguage]((&self->super.isa)[v8], "statusForLanguage"));
LABEL_10:
    uint64_t v11 = SFEntitledAssetTypeToString(a3);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    uint64_t v22 = sub_100036EAC;
    id v23 = sub_100036EBC;
    id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100036EC4;
    v18[3] = &unk_100051D90;
    v18[4] = &v19;
    [v10 enumerateKeysAndObjectsUsingBlock:v18];
    char v13 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = v20[5];
      *(_DWORD *)buf = 136315650;
      unint64_t v26 = "-[LSRConnection installedLanguagesForAssetType:completion:]";
      __int16 v27 = 2112;
      __int128 v28 = v12;
      __int16 v29 = 2112;
      uint64_t v30 = v14;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Using the cached status for %@ assets, available languages: %@",  buf,  0x20u);
    }

    v7[2](v7, v20[5]);
    _Block_object_dispose(&v19, 8);

    goto LABEL_13;
  }

- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 detailedProgress:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!sub_100035808())
  {
    id v10 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v28 = "-[LSRConnection downloadAssetsForConfig:clientID:detailedProgress:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000360D4;
    block[3] = &unk_100051D20;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)qword_10005D4B8, block);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 language]);

  if (!v11)
  {
    id v12 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v28 = "-[LSRConnection downloadAssetsForConfig:clientID:detailedProgress:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Language cannot be nil.", buf, 0xCu);
    }

    char v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  31LL,  0LL));
    uint64_t v14 = (dispatch_queue_s *)qword_10005D4B8;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100036144;
    v24[3] = &unk_100051CF8;
    v24[4] = self;
    id v25 = v13;
    id v15 = v13;
    dispatch_async(v14, v24);
  }

  id v16 = (dispatch_queue_s *)qword_10005D4B8;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100036188;
  v19[3] = &unk_100051FB0;
  id v20 = v8;
  uint64_t v21 = self;
  id v22 = v9;
  BOOL v23 = a5;
  id v17 = v9;
  id v18 = v8;
  dispatch_async(v16, v19);
}

- (void)fetchAssetsForLanguage:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (sub_100035808())
  {
    id v10 = (dispatch_queue_s *)qword_10005D4B8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100036034;
    block[3] = &unk_100052078;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v10, block);

    uint64_t v11 = v14;
LABEL_6:

    goto LABEL_7;
  }

  id v12 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[LSRConnection fetchAssetsForLanguage:clientID:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    if (!v9) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }

  if (v9)
  {
LABEL_5:
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1700LL,  0LL));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v11);
    goto LABEL_6;
  }

- (void)configParametersForVoicemailWithLanguage:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100035D84;
  v18[3] = &unk_100051FD8;
  id v9 = a5;
  id v19 = v9;
  id v10 = objc_retainBlock(v18);
  if (sub_100035808())
  {
    uint64_t v11 = (dispatch_queue_s *)qword_10005D4B8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100035D98;
    block[3] = &unk_100052000;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, block);
  }

  else
  {
    id v12 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[LSRConnection configParametersForVoicemailWithLanguage:clientID:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    }

    ((void (*)(void *, void))v10[2])(v10, 0LL);
  }
}

- (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 clientID:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  if (sub_100035808())
  {
    id v10 = (dispatch_queue_s *)qword_10005D4B8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100035D6C;
    block[3] = &unk_100052028;
    id v14 = v8;
    BOOL v16 = a4;
    id v15 = v9;
    dispatch_async(v10, block);

    uint64_t v11 = v14;
LABEL_6:

    goto LABEL_7;
  }

  id v12 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[LSRConnection setPurgeabilityForAssetWithConfig:purgeable:clientID:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    if (!v9) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }

  if (v9)
  {
LABEL_5:
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1700LL,  0LL));
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
    goto LABEL_6;
  }

- (void)initializeLmWithLocale:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)qword_10005D4B8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100035BC8;
  v15[3] = &unk_100052050;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)initializeLmWithAssetPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)qword_10005D4B8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035988;
  block[3] = &unk_100052078;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)addSentenceToNgramCounts:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    id v7 = "-[LSRConnection addSentenceToNgramCounts:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Adding sentence=%@",  (uint8_t *)&v6,  0x16u);
  }

  -[LSRLanguageModel addSentenceToNgramCounts:](self->_lsrLanguageModel, "addSentenceToNgramCounts:", v4);
}

- (void)addSentenceToNgramCounts:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  __int16 v8 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[LSRConnection addSentenceToNgramCounts:completion:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Adding oovs from sentence",  (uint8_t *)&v10,  0xCu);
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v7)
  {
LABEL_3:
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[LSRLanguageModel oovsFromSentenceAddedToNgramCounts:]( self->_lsrLanguageModel,  "oovsFromSentenceAddedToNgramCounts:",  v6));
    v7[2](v7, v9);
  }

- (void)oovWordsAndFrequenciesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    __int16 v8 = "-[LSRConnection oovWordsAndFrequenciesWithCompletion:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s oovs words and frequencies",  (uint8_t *)&v7,  0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v4)
  {
LABEL_3:
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[LSRLanguageModel oovWordsAndFrequenciesInNgramCount]( self->_lsrLanguageModel,  "oovWordsAndFrequenciesInNgramCount"));
    v4[2](v4, v6);
  }

- (void)addProns:(id)a3 forWord:(id)a4 completion:(id)a5
{
  if (a5)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v9 = a5;
    (*((void (**)(id, BOOL))a5 + 2))( v9,  -[LSRLanguageModel addProns:forWord:](lsrLanguageModel, "addProns:forWord:", a3, a4));
  }

- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 sandboxExtension:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100035974;
  v33[3] = &unk_1000520A0;
  id v10 = a5;
  id v34 = v10;
  uint64_t v11 = objc_retainBlock(v33);
  if (sub_100035808())
  {
    id v39 = v9;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
    id v32 = 0LL;
    unsigned __int8 v13 = -[LSRConnection _consumeSandboxExtensions:error:](self, "_consumeSandboxExtensions:error:", v12, &v32);
    id v14 = v32;

    id v15 = (os_log_s *)SFLogConnection;
    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
        __int16 v37 = 2112;
        id v38 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Failed to consume sandbox extensions: %@",  buf,  0x16u);
      }

      ((void (*)(void *, void, void))v11[2])(v11, 0LL, 0LL);
      goto LABEL_21;
    }

    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Successfully consumed sandbox extensions",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", @"app-lm", v14));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
    unsigned __int8 v19 = [v17 fileExistsAtPath:v18];

    if ((v19 & 1) != 0)
    {
      id v20 = 0LL;
    }

    else
    {
      id v31 = 0LL;
      unsigned __int8 v22 = [v17 createDirectoryAtURL:v16 withIntermediateDirectories:0 attributes:0 error:&v31];
      id v20 = v31;
      BOOL v23 = (os_log_s *)SFLogConnection;
      if ((v22 & 1) == 0)
      {
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
          __int16 v37 = 2112;
          id v38 = v20;
          _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Write failed error:%@",  buf,  0x16u);
        }

        ((void (*)(void *, void, void))v11[2])(v11, 0LL, 0LL);
        goto LABEL_20;
      }

      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Write successfull", buf, 0xCu);
      }
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:@"SpeechProfile"]);
    lsrLanguageModel = self->_lsrLanguageModel;
    id v29 = v24;
    id v30 = v16;
    -[LSRLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:]( lsrLanguageModel,  "trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:",  &v30,  &v29);
    id v26 = v30;

    id v27 = v29;
    ((void (*)(void *, id, id))v11[2])(v11, v26, v27);

    id v16 = v26;
LABEL_20:
    id v14 = v28;

LABEL_21:
    goto LABEL_22;
  }

  uint64_t v21 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
  }

  ((void (*)(void *, void, void))v11[2])(v11, 0LL, 0LL);
LABEL_22:
}

- (void)generateNgramCountsSerializeDataWithCompletion:(id)a3
{
  if (a3)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v5 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[LSRLanguageModel ngramCountsSerializeData](lsrLanguageModel, "ngramCountsSerializeData"));
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }

- (void)deserializeNgramCountsData:(id)a3 completion:(id)a4
{
  if (a4)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v7 = a4;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[LSRLanguageModel deserializeNgramCountsData:](lsrLanguageModel, "deserializeNgramCountsData:", a3));
    (*((void (**)(id, id))a4 + 2))(v7, v8);
  }

- (void)lmeThresholdWithCompletion:(id)a3
{
  if (a3)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v5 = a3;
    (*((void (**)(id, int64_t))a3 + 2))( v5,  -[LSRLanguageModel lmeThreshold](lsrLanguageModel, "lmeThreshold"));
  }

- (void)metricsWithCompletion:(id)a3
{
  if (a3)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v5 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[LSRLanguageModel metrics](lsrLanguageModel, "metrics"));
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }

- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtension:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100035960;
  v51[3] = &unk_1000520A0;
  id v19 = a8;
  id v52 = v19;
  id v20 = objc_retainBlock(v51);
  uint64_t v21 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Starting training of App LM from ngram count.",  buf,  0xCu);
  }

  if (sub_100035808())
  {
    id v46 = v15;
    id v57 = v18;
    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v57, 1LL));
    id v50 = 0LL;
    unsigned __int8 v23 = -[LSRConnection _consumeSandboxExtensions:error:](self, "_consumeSandboxExtensions:error:", v22, &v50);
    id v45 = v50;

    id v24 = (os_log_s *)SFLogConnection;
    if ((v23 & 1) == 0)
    {
      id v30 = v45;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtens"
              "ion:completion:]";
        __int16 v55 = 2112;
        id v56 = v45;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Failed to consume sandbox extensions: %@",  buf,  0x16u);
      }

      ((void (*)(void *, void, void))v20[2])(v20, 0LL, 0LL);
      id v15 = v46;
      goto LABEL_25;
    }

    id v42 = v16;
    id v44 = v14;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Successfully consumed sandbox extensions",  buf,  0xCu);
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:@"app-lm"]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 path]);
    unsigned __int8 v28 = [v26 fileExistsAtPath:v27];

    double v43 = v26;
    if ((v28 & 1) != 0)
    {
      id v41 = 0LL;
      id v15 = v46;
      id v16 = v42;
    }

    else
    {
      id v49 = 0LL;
      unsigned __int8 v31 = [v26 createDirectoryAtURL:v25 withIntermediateDirectories:0 attributes:0 error:&v49];
      id v41 = v49;
      id v15 = v46;
      if ((v31 & 1) == 0)
      {
        v40 = (os_log_s *)SFLogConnection;
        id v39 = v41;
        id v16 = v42;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExte"
                "nsion:completion:]";
          __int16 v55 = 2112;
          id v56 = v41;
          _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%s Write failed error:%@",  buf,  0x16u);
        }

        ((void (*)(void *, void, void))v20[2])(v20, 0LL, 0LL);
        id v14 = v44;
        id v30 = v45;
        id v38 = v43;
        goto LABEL_24;
      }

      id v32 = (os_log_s *)SFLogConnection;
      id v16 = v42;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtens"
              "ion:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s Write successfull", buf, 0xCu);
      }
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:@"SpeechProfile"]);
    lsrLanguageModel = self->_lsrLanguageModel;
    id v47 = v33;
    id v48 = v25;
    -[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]( lsrLanguageModel,  "trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:",  v44,  v15,  v16,  &v48,  &v47);
    id v35 = v48;

    id v36 = v47;
    __int16 v37 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "%s Finished training of App LM from ngram count.",  buf,  0xCu);
    }

    ((void (*)(void *, id, id))v20[2])(v20, v35, v36);

    id v25 = v35;
    id v14 = v44;
    id v30 = v45;
    id v15 = v46;
    id v38 = v43;
    id v39 = v41;
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }

  id v29 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
  }

  ((void (*)(void *, void, void))v20[2])(v20, 0LL, 0LL);
LABEL_26:
}

- (void)wakeUpWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10003594C;
  v26[3] = &unk_1000520C8;
  id v18 = a8;
  id v27 = v18;
  id v19 = a7;
  id v20 = objc_retainBlock(v26);
  id v25 = 0LL;
  unsigned __int8 v21 = -[LSRConnection _consumeSandboxExtensions:error:](self, "_consumeSandboxExtensions:error:", v19, &v25);

  id v22 = v25;
  unsigned __int8 v23 = (os_log_s *)SFLogConnection;
  if ((v21 & 1) != 0)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[LSRConnection createPhraseCountsArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:writeT"
            "oDirectory:sandboxExtensions:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Successfully consumed sandbox extensions",  buf,  0xCu);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:@"PhraseCountsFile" isDirectory:0]);
    -[LSRLanguageModel createPhraseCountArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:saveTo:]( self->_lsrLanguageModel,  "createPhraseCountArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:saveTo:",  v14,  v15,  v16,  v24);
    ((void (*)(void *, void *))v20[2])(v20, v24);
  }

  else
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[LSRConnection createPhraseCountsArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:writeT"
            "oDirectory:sandboxExtensions:completion:]";
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Failed to consume sandbox extensions: %@",  buf,  0x16u);
    }

    ((void (*)(void *, void))v20[2])(v20, 0LL);
  }
}

- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeToDirectory:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100035938;
  v20[3] = &unk_1000520C8;
  id v12 = a6;
  id v21 = v12;
  id v13 = a5;
  id v14 = objc_retainBlock(v20);
  id v19 = 0LL;
  unsigned __int8 v15 = -[LSRConnection _consumeSandboxExtensions:error:](self, "_consumeSandboxExtensions:error:", v13, &v19);

  id v16 = v19;
  id v17 = (os_log_s *)SFLogConnection;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v23 = "-[LSRConnection createNgramCountsArtifactFromPhraseCountArtifact:writeToDirectory:sandboxExtensions:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Successfully consumed sandbox extensions",  buf,  0xCu);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"NgramCountsFile" isDirectory:0]);
    -[LSRLanguageModel createNgramCountsArtifactFromPhraseCountArtifact:saveTo:]( self->_lsrLanguageModel,  "createNgramCountsArtifactFromPhraseCountArtifact:saveTo:",  v10,  v18);
    ((void (*)(void *, void *))v14[2])(v14, v18);
  }

  else
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v23 = "-[LSRConnection createNgramCountsArtifactFromPhraseCountArtifact:writeToDirectory:sandboxExtensions:completion:]";
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Failed to consume sandbox extensions: %@",  buf,  0x16u);
    }

    ((void (*)(void *, void))v14[2])(v14, 0LL);
  }
}

- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v37 = a4;
  id v35 = a5;
  id v15 = a6;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100035924;
  v41[3] = &unk_1000520A0;
  id v16 = a8;
  id v42 = v16;
  id v17 = a7;
  id v18 = objc_retainBlock(v41);
  id v19 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v44 = "-[LSRConnection trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Starting training of App LM from ngram count.",  buf,  0xCu);
  }

  id v40 = 0LL;
  unsigned __int8 v20 = -[LSRConnection _consumeSandboxExtensions:error:](self, "_consumeSandboxExtensions:error:", v17, &v40, v35);

  id v21 = v40;
  id v22 = (os_log_s *)SFLogConnection;
  if ((v20 & 1) != 0)
  {
    id v23 = v14;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v44 = "-[LSRConnection trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Successfully consumed sandbox extensions",  buf,  0xCu);
    }

    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v15 URLByAppendingPathComponent:@"AppLmModelFile"]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 URLByAppendingPathComponent:@"SpeechProfile"]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v26 removeItemAtURL:v24 error:0];

    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v27 removeItemAtURL:v25 error:0];

    lsrLanguageModel = self->_lsrLanguageModel;
    id v38 = v25;
    id v39 = v24;
    id v14 = v23;
    id v29 = v23;
    id v31 = v36;
    __int16 v30 = v37;
    -[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]( lsrLanguageModel,  "trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:",  v29,  v37,  v36,  &v39,  &v38);
    id v32 = v39;

    id v33 = v38;
    id v34 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v44 = "-[LSRConnection trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s Finished training of App LM from ngram count.",  buf,  0xCu);
    }

    ((void (*)(void *, id, id))v18[2])(v18, v32, v33);
  }

  else
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v44 = "-[LSRConnection trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:]";
      __int16 v45 = 2112;
      id v46 = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Failed to consume sandbox extensions: %@",  buf,  0x16u);
    }

    ((void (*)(void *, void, void))v18[2])(v18, 0LL, 0LL);
    id v31 = v36;
    __int16 v30 = v37;
  }
}

- (void)appLmNeedsRebuild:(id)a3 language:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id, id))a6;
  id v14 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v24 = "-[LSRConnection appLmNeedsRebuild:language:sandboxExtensions:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Checking if app LM needs a rebuild", buf, 0xCu);
  }

  id v22 = 0LL;
  unsigned __int8 v15 = -[LSRConnection _consumeSandboxExtensions:error:](self, "_consumeSandboxExtensions:error:", v12, &v22);
  id v16 = v22;
  if ((v15 & 1) != 0)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v21 = 0LL;
    BOOL v18 = -[LSRLanguageModel appLmNeedsRebuild:language:error:]( lsrLanguageModel,  "appLmNeedsRebuild:language:error:",  v10,  v11,  &v21);
    id v19 = v21;
    v13[2](v13, (id)v18, v19);
  }

  else
  {
    unsigned __int8 v20 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v24 = "-[LSRConnection appLmNeedsRebuild:language:sandboxExtensions:completion:]";
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Failed to consume sandbox extensions when checking for App LM rebuild: %@",  buf,  0x16u);
    }

    v13[2](v13, (id)1, v16);
  }
}

- (void)unsubscribeFromAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (!sub_100035808())
  {
    id v10 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      id v13 = "-[LSRConnection unsubscribeFromAssetWithConfig:clientID:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Request not authorized",  (uint8_t *)&v12,  0xCu);
      if (!v9) {
        goto LABEL_7;
      }
    }

    else if (!v9)
    {
      goto LABEL_7;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1700LL,  0LL));
    v9[2](v9, v11);

    goto LABEL_7;
  }

  +[SFEntitledAssetManager unsubscribeFromAssetWithConfig:regionId:subscriberId:]( &OBJC_CLASS___SFEntitledAssetManager,  "unsubscribeFromAssetWithConfig:regionId:subscriberId:",  v7,  0LL,  v8);
  if (v9) {
    v9[2](v9, 0LL);
  }
LABEL_7:
}

- (void)subscriptionsForClientId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (!sub_100035808())
  {
    id v8 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[LSRConnection subscriptionsForClientId:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Request not authorized",  (uint8_t *)&v9,  0xCu);
      if (!v6) {
        goto LABEL_7;
      }
    }

    else if (!v6)
    {
      goto LABEL_7;
    }

    v6[2](v6, &__NSArray0__struct);
    goto LABEL_7;
  }

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager subscriptionsForSubscriberId:]( &OBJC_CLASS___SFEntitledAssetManager,  "subscriptionsForSubscriberId:",  v5));
    v6[2](v6, v7);
  }

- (void)synchronousCreateEuclidInstanceForLanguageStr:(id)a3 clientID:(id)a4 inputFormat:(int64_t)a5 loadingOption:(int64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, void))a7;
  id v14 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v26 = "-[LSRConnection synchronousCreateEuclidInstanceForLanguageStr:clientID:inputFormat:loadingOption:completion:]";
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s Initializing _EAREuclid instance for languageStr: %@",  buf,  0x16u);
  }

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[LSRConnection modelRootWithLanguage:assetType:clientID:modelOverrideURL:isSpelling:error:]( &OBJC_CLASS___LSRConnection,  "modelRootWithLanguage:assetType:clientID:modelOverrideURL:isSpelling:error:",  v11,  3LL,  v12,  0LL,  0LL,  0LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:@"mini.json"]);
  id v17 = -[_EAREuclid initWithConfiguration:euclidEncoderType:initFlag:]( objc_alloc(&OBJC_CLASS____EAREuclid),  "initWithConfiguration:euclidEncoderType:initFlag:",  v16,  a5,  1LL);
  euclidInstance = self->_euclidInstance;
  self->_euclidInstance = v17;

  if (self->_euclidInstance)
  {
    v13[2](v13, 0LL);
  }

  else
  {
    id v19 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v26 = "-[LSRConnection synchronousCreateEuclidInstanceForLanguageStr:clientID:inputFormat:loadingOption:completion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s Initialization of _EAREuclid instance failed",  buf,  0xCu);
    }

    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Initialization of _EAREuclid instance failed",  NSLocalizedDescriptionKey));
    __int16 v24 = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  0LL,  v21));

    ((void (**)(id, void *))v13)[2](v13, v22);
  }
}

- (void)synchronousComputeEuclidEmbeddingsForSources:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  euclidInstance = self->_euclidInstance;
  if (euclidInstance)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[_EAREuclid computeEmbeddings:](euclidInstance, "computeEmbeddings:", v6));
    id v10 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      id v12 = v10;
      int v13 = 136315394;
      id v14 = "-[LSRConnection synchronousComputeEuclidEmbeddingsForSources:completion:]";
      __int16 v15 = 2048;
      id v16 = [v6 count];
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s _EAREuclid.computeEmbeddings(sources:) replying with %lu requested embedding(s)",  (uint8_t *)&v13,  0x16u);
    }

    v7[2](v7, v9);
  }

  else
  {
    id v11 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      id v14 = "-[LSRConnection synchronousComputeEuclidEmbeddingsForSources:completion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s No instance of _EAREuclid",  (uint8_t *)&v13,  0xCu);
    }

    v7[2](v7, 0LL);
  }
}

- (void)makeEARSpeechRecognizerWithSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6 sandboxExtensions:(id)a7 reply:(id)a8
{
}

- (void)getJitProfileData:(id)a3 contextualStrings:(id)a4 clientID:(id)a5 reply:(id)a6
{
}

- (void)makeLSRAssetsForLocale:(id)a3 taskName:(id)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 reply:(id)a8
{
}

- (void)processStartTimeOnceWithReply:(id)a3
{
}

- (void)makeEuclidInstanceWithLocale:(id)a3 clientID:(id)a4 encoderType:(int64_t)a5 initFlag:(int64_t)a6 reply:(id)a7
{
}

- (void)makeEARLanguageDetectorWithDetectorOptions:(id)a3 clientInfo:(id)a4 analysisOptions:(id)a5 reply:(id)a6
{
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)qword_10005D4B8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100035660;
  v8[3] = &unk_100051CF8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)qword_10005D4B8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035204;
  block[3] = &unk_100052118;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)qword_10005D4B8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034684;
  block[3] = &unk_100052118;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100034644;
  v4[3] = &unk_100052168;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  dispatch_async((dispatch_queue_t)qword_10005D4B8, v4);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___LSRConnection, a2) == a1)
  {
    dispatch_queue_attr_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v2);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.speech.localspeechrecognition", v3);
    id v5 = (void *)qword_10005D4B8;
    qword_10005D4B8 = (uint64_t)v4;

    SFLogInitIfNeeded();
  }

+ (void)captureProcessStartTime
{
  if (qword_10005D4C8 != -1) {
    dispatch_once(&qword_10005D4C8, &stru_100051C28);
  }
}

+ (id)processStartTimeOnce
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_100036EAC;
  id v9 = sub_100036EBC;
  id v10 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100038B9C;
  block[3] = &unk_100051C50;
  void block[4] = &v5;
  if (qword_10005D4D8 != -1) {
    dispatch_once(&qword_10005D4D8, block);
  }
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)modelRootWithLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5 modelOverrideURL:(id)a6 error:(id *)a7
{
  return [a1 modelRootWithLanguage:a3 assetType:a4 clientID:a5 modelOverrideURL:a6 isSpelling:0 error:a7];
}

+ (id)modelRootWithLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = v13;
  uint64_t v17 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode(v16);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = v18;
  if (v18)
  {
    id v20 = v18;

LABEL_4:
    id v21 = (void *)objc_claimAutoreleasedReturnValue([&off_100052C10 objectForKey:v20]);
    goto LABEL_5;
  }

  id v20 = v16;
  if (v16) {
    goto LABEL_4;
  }
  id v21 = 0LL;
LABEL_5:
  if (v21) {
    id v22 = v21;
  }
  else {
    id v22 = v20;
  }
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( [@"/System/Library/SpellingKeyboardSpeechModels" stringByAppendingPathComponent:v22]);

  if (v9)
  {
    id v24 = v23;
    goto LABEL_23;
  }

  if (!v15 || !SFIsInternalInstall())
  {
    if (([v16 isEqualToString:@"en-CA"] & 1) != 0
      || [v16 isEqualToString:@"es-MX"])
    {
      id v36 = v16;

      id v20 = v36;
    }

    id v27 = [[SFEntitledAssetConfig alloc] initWithLanguage:v20 assetType:a4];
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue( [v37 installedAssetWithConfig:v27 regionId:0 shouldSubscribe:1 subscriberId:v14 expiration:0]);

    if (!v26) {
      goto LABEL_13;
    }
LABEL_22:
    id v24 = v26;

    goto LABEL_23;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
  id v27 = 0LL;
  if (v26) {
    goto LABEL_22;
  }
LABEL_13:
  id v39 = a8;
  id v40 = v14;
  id v28 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___LSRConnection, v25));
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"No %@ asset for language %@" value:&stru_100052290 table:@"Localizable"]);
  uint64_t v31 = SFEntitledAssetTypeToString([v27 assetType]);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v27 language]);
  id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v30,  v32,  v33));

  id v34 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v45 = "+[LSRConnection modelRootWithLanguage:assetType:clientID:modelOverrideURL:isSpelling:error:]";
    __int16 v46 = 2112;
    id v47 = v41;
    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  if (v39)
  {
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    double v43 = v41;
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
    *id v39 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kLSRErrorDomain",  101LL,  v35));
  }

  id v24 = 0LL;
  id v14 = v40;
LABEL_23:

  return v24;
}

+ (id)_jitProfileWithLanguage:(id)a3 modelRoot:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    else {
      BOOL v7 = 1;
    }
    if (v7 || ![(id)qword_10005D4F0 isEqualToString:v6])
    {
      id v10 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 136315650;
        BOOL v18 = "+[LSRConnection _jitProfileWithLanguage:modelRoot:]";
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Initialized a new JIT profile builder for language=%@ modelRoot=%@",  (uint8_t *)&v17,  0x20u);
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"mini.json"]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"ncs"]);
      id v13 = [[_EARJitProfile alloc] initWithConfiguration:v11 ncsRoot:v12 language:v5];
      id v14 = (void *)qword_10005D4E8;
      qword_10005D4E8 = (uint64_t)v13;

      id v9 = (id)qword_10005D4E8;
    }

    else
    {
      id v8 = (os_log_s *)SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 136315650;
        BOOL v18 = "+[LSRConnection _jitProfileWithLanguage:modelRoot:]";
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Using cached JIT profile builder for language=%@ modelRoot=%@",  (uint8_t *)&v17,  0x20u);
      }

      id v9 = (id)qword_10005D4E8;
    }
  }

  else
  {
    id v15 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      BOOL v18 = "+[LSRConnection _jitProfileWithLanguage:modelRoot:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Could not locate asset",  (uint8_t *)&v17,  0xCu);
    }

    id v9 = 0LL;
  }

  return v9;
}

+ (int)countOfRecognizers
{
  return qword_10005D4F8 != 0;
}

+ (void)_scheduleCooldownTimer
{
  if (!qword_10005D518)
  {
    id v3 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      id v9 = "+[LSRConnection _scheduleCooldownTimer]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s _scheduleCooldownTimer",  (uint8_t *)&v8,  0xCu);
    }

    dispatch_source_t v4 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10005D4B8);
    id v5 = (void *)qword_10005D518;
    qword_10005D518 = (uint64_t)v4;

    dispatch_source_set_event_handler((dispatch_source_t)qword_10005D518, &stru_100051D40);
    id v6 = (dispatch_source_s *)qword_10005D518;
    dispatch_time_t v7 = dispatch_time(0LL, 1000000000LL * kCooldownTimerIntervalSeconds);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)qword_10005D518);
  }

+ (void)_cancelCooldownTimer
{
  id v2 = (dispatch_source_s *)qword_10005D518;
  if (qword_10005D518)
  {
    id v3 = (os_log_s *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315138;
      id v6 = "+[LSRConnection _cancelCooldownTimer]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s _cancelCooldownTimer",  (uint8_t *)&v5,  0xCu);
      id v2 = (dispatch_source_s *)qword_10005D518;
    }

    dispatch_source_cancel(v2);
    dispatch_source_t v4 = (void *)qword_10005D518;
    qword_10005D518 = 0LL;
  }

+ (void)_cooldownTimerFired
{
  id v3 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    int v5 = "+[LSRConnection _cooldownTimerFired]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s _cooldownTimerFired",  (uint8_t *)&v4,  0xCu);
  }

  +[LSRConnection _cachedRecognizerCleanUp](&OBJC_CLASS___LSRConnection, "_cachedRecognizerCleanUp");
  [a1 _cancelCooldownTimer];
}

+ (void)_cachedRecognizerCleanUp
{
  id v2 = (os_log_s *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    id v14 = "+[LSRConnection _cachedRecognizerCleanUp]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s _cachedRecognizerCleanUp",  (uint8_t *)&v13,  0xCu);
  }

  id v3 = (void *)qword_10005D4F8;
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing]( &OBJC_CLASS____EARSpeechRecognitionActiveConfiguration,  "activeConfigurationForNothing"));
  [v3 setActiveConfiguration:v4];

  int v5 = (void *)qword_10005D4F8;
  qword_10005D4F8 = 0LL;

  id v6 = (void *)qword_10005D4E0;
  qword_10005D4E0 = 0LL;

  dispatch_time_t v7 = (void *)qword_10005D4F0;
  qword_10005D4F0 = 0LL;

  int v8 = (void *)qword_10005D500;
  qword_10005D500 = 0LL;

  id v9 = (void *)qword_10005D4E8;
  qword_10005D4E8 = 0LL;

  id v10 = (void *)qword_10005D508;
  qword_10005D508 = 0LL;

  id v11 = (void *)qword_10005D510;
  qword_10005D510 = 0LL;

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  [v12 releaseAssetSets];
}

@end