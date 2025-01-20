@interface ADDictationConnection
- (ADDictationConnection)initWithServiceDelegate:(id)a3;
- (BOOL)adSpeechSessionEnded;
- (BOOL)adWaitingForAudioFile;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_dictationWillStartWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 xpcconnection:(id)a6;
- (id)_localSpeechRecognizerSupportingBackground:(BOOL)a3;
- (id)_updateDictationOptionsForOnDeviceDictation:(id)a3 language:(id)a4;
- (void)_addAudioSessionAssertion:(id)a3;
- (void)_continuePendingSpeechRequestFromTimestamp:(double)a3;
- (void)_invokeRequestCompletion;
- (void)_removeAllAudioSessionAssertionsForReason:(id)a3;
- (void)_sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4;
- (void)_speechRecordingDidFinish;
- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 xpcconnection:(id)a6;
- (void)_startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6;
- (void)_updateDictationOptions:(id)a3;
- (void)adAudioFileFinishedWriting:(id)a3 error:(id)a4 context:(id)a5;
- (void)adPronunciationRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechDidBeginLocalRecognitionWithModelInfo:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechDidFindVoiceSearchFinalResult:(id)a3;
- (void)adSpeechDidFindVoiceSearchPartialResult:(id)a3;
- (void)adSpeechDidPauseRecognition;
- (void)adSpeechLanguageDetectorFailedWithError:(id)a3;
- (void)adSpeechLocalRecognitionDidSucceedWithSessionUUID:(id)a3;
- (void)adSpeechMultilingualSpeechRecognized:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecognizedPartialResult:(id)a3;
- (void)adSpeechRecognizedStructuredResult:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 bluetoothDevice:(id)a5 sessionRequestUUID:(id)a6 dictationOptions:(id)a7 context:(id)a8;
- (void)adSpeechRecordingDidCancelWithContext:(id)a3;
- (void)adSpeechRecordingDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5;
- (void)adSpeechRecordingDidEndWithContext:(id)a3;
- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4;
- (void)adSpeechRecordingDidRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4;
- (void)adSpeechRecordingDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingDidRecognizePhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 sessionUUID:(id)a8 refId:(id)a9;
- (void)adSpeechRecordingDidRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)adSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 context:(id)a4;
- (void)addRecordedSpeechSampleData:(id)a3;
- (void)cancelSpeech;
- (void)connectionDisconnected;
- (void)continuePendingSpeechRequestFromTimestamp:(double)a3;
- (void)dealloc;
- (void)endSession;
- (void)getInstalledOfflineLanguagesWithCompletion:(id)a3;
- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4;
- (void)pauseRecognition;
- (void)preheat;
- (void)preheatForLanguageCode:(id)a3;
- (void)preheatTestWithLanguage:(id)a3 options:(id)a4;
- (void)preheatWithRecordDeviceIdentifier:(id)a3;
- (void)recordAWDSuccessMetrics;
- (void)recordFailureMetricsForError:(id)a3;
- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 context:(id)a5;
- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 subtype:(id)a5 context:(id)a6;
- (void)requestOfflineAssistantSupportForLanguage:(id)a3 completion:(id)a4;
- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4;
- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)sendUserSelectedAlternativeDictationLanguageCode:(id)a3;
- (void)setAdSpeechSessionEnded:(BOOL)a3;
- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5;
- (void)startRecordedAudioDictationWithOptions:(id)a3 language:(id)a4 narrowband:(BOOL)a5 forceSampling:(BOOL)a6;
- (void)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 reply:(id)a6;
- (void)startRequestActivityWithCompletion:(id)a3;
- (void)stopSpeechWithOptions:(id)a3;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)updateSpeechOptions:(id)a3;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
@end

@implementation ADDictationConnection

- (ADDictationConnection)initWithServiceDelegate:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADDictationConnection;
  v6 = -[ADDictationConnection init](&v17, "init");
  if (v6)
  {
    v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[ADDictationConnection initWithServiceDelegate:]";
      __int16 v20 = 2048;
      v21 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_serviceDelegate, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);

    dispatch_queue_t v12 = dispatch_queue_create("ADDictationConnection", v11);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    v14 = objc_alloc_init(&OBJC_CLASS___ADDictationSessionTracker);
    sessionTracker = v6->_sessionTracker;
    v6->_sessionTracker = v14;
  }

  return v6;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[ADDictationConnection dealloc]";
    __int16 v7 = 2048;
    dispatch_queue_attr_t v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }

  -[ADDictationConnection _continuePendingSpeechRequestFromTimestamp:]( self,  "_continuePendingSpeechRequestFromTimestamp:",  0.0);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADDictationConnection;
  -[ADDictationConnection dealloc](&v4, "dealloc");
}

- (void)connectionDisconnected
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003135E4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
  self->_disconnected = 1;
  localSpeechRecognizer = self->_localSpeechRecognizer;
  if (localSpeechRecognizer)
  {
    -[CoreEmbeddedSpeechRecognizer invalidate](localSpeechRecognizer, "invalidate");
    id v5 = self->_localSpeechRecognizer;
    self->_localSpeechRecognizer = 0LL;
  }

- (void)_updateDictationOptions:(id)a3
{
  objc_super v4 = (AFDictationOptions *)[a3 copy];
  dictationOptions = self->_dictationOptions;
  self->_dictationOptions = v4;
}

- (void)_speechRecordingDidFinish
{
  v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    dictationOptions = self->_dictationOptions;
    v6 = v3;
    LODWORD(dictationOptions) = -[AFDictationOptions releaseAudioSessionOnRecordingCompletion]( dictationOptions,  "releaseAudioSessionOnRecordingCompletion");
    uint64_t Names = AFSetAudioSessionInactiveOptionsGetNames(1LL);
    dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(Names);
    *(_DWORD *)buf = 136315650;
    v11 = "-[ADDictationConnection _speechRecordingDidFinish]";
    __int16 v12 = 1024;
    int v13 = (int)dictationOptions;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s _speechRecordingDidFinish _dictationOptions releaseAudioSessionOnRecordingCompletion: %d, AFSetAudioSessionInactiveOptions: %@",  buf,  0x1Cu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100313578;
  v9[3] = &unk_1004FD0A0;
  v9[4] = self;
  v9[5] = 1LL;
  dispatch_async(queue, v9);
}

- (void)_addAudioSessionAssertion:(id)a3
{
  id v4 = a3;
  audioSessionAssertions = self->_audioSessionAssertions;
  id v8 = v4;
  if (!audioSessionAssertions)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int16 v7 = self->_audioSessionAssertions;
    self->_audioSessionAssertions = v6;

    id v4 = v8;
    audioSessionAssertions = self->_audioSessionAssertions;
  }

  -[NSMutableArray addObject:](audioSessionAssertions, "addObject:", v4);
}

- (void)_removeAllAudioSessionAssertionsForReason:(id)a3
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100313470;
  v17[3] = &unk_1004FBA88;
  id v12 = a3;
  id v18 = v12;
  v19 = self;
  id v4 = +[AFAssertionContext newWithBuilder:](&OBJC_CLASS___AFAssertionContext, "newWithBuilder:", v17);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = self->_audioSessionAssertions;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v26,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_queue_attr_t v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v11 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "-[ADDictationConnection _removeAllAudioSessionAssertionsForReason:]";
          __int16 v22 = 2048;
          v23 = self;
          __int16 v24 = 2112;
          v25 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s %p audioSessionAssertion = %@",  buf,  0x20u);
        }

        [v10 relinquishWithContext:v4 options:0];
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v26,  16LL);
    }

    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_audioSessionAssertions, "removeAllObjects");
}

- (void)adSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3 context:(id)a4
{
}

- (void)adSpeechRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4 bluetoothDevice:(id)a5 sessionRequestUUID:(id)a6 dictationOptions:(id)a7 context:(id)a8
{
  id v11 = a8;
  id v12 = a7;
  id v13 = a6;
  kdebug_trace(722470208LL, 0LL, 0LL, 0LL, 0LL);
  __int128 v14 = @"Siri Event";
  id v18 = @"Siri Event";
  v19 = @"Dictation speechRecordingDidBegin";
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  sub_1001EAF7C(v15);

  serviceDelegate = self->_serviceDelegate;
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v11 sessionUUID]);

  -[AFDictationServiceDelegate speechRecordingDidBeginWithOptions:sessionUUID:sessionRequestUUID:]( serviceDelegate,  "speechRecordingDidBeginWithOptions:sessionUUID:sessionRequestUUID:",  v12,  v17,  v13);
}

- (void)adSpeechRecordingDidEndWithContext:(id)a3
{
  id v4 = @"Siri Event";
  id v6 = @"Siri Event";
  id v7 = @"Dictation speechRecordingDidEnd";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  sub_1001EAF7C(v5);

  -[ADDictationConnection _speechRecordingDidFinish](self, "_speechRecordingDidFinish");
  -[AFDictationServiceDelegate speechRecordingDidEnd](self->_serviceDelegate, "speechRecordingDidEnd");
}

- (void)adSpeechRecordingDidCancelWithContext:(id)a3
{
  id v4 = a3;
  id v5 = @"Siri Event";
  id v11 = @"Siri Event";
  id v12 = @"Dictation speechRecordingDidCancel";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  sub_1001EAF7C(v6);

  -[ADDictationConnection _speechRecordingDidFinish](self, "_speechRecordingDidFinish");
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100313368;
  block[3] = &unk_1004FD968;
  block[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, block);
}

- (void)adSpeechRecordingDidFail:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = @"Siri Event";
  __int128 v16 = @"Siri Event";
  objc_super v17 = @"Dictation speechRecordingDidFail";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  sub_1001EAF7C(v9);

  -[ADDictationConnection _speechRecordingDidFinish](self, "_speechRecordingDidFinish");
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100313248;
  v13[3] = &unk_1004FD4C0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, v13);
}

- (void)adSpeechRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100313090;
  v15[3] = &unk_1004FD470;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)adSpeechRecognizedPartialResult:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100312FA8;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechDidFindVoiceSearchPartialResult:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100312F30;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechDidFindVoiceSearchFinalResult:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100312E94;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechRecordingDidRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
}

- (void)adSpeechRecordingDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
}

- (void)adSpeechRecordingDidRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4
{
}

- (void)adSpeechRecordingDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
}

- (void)adSpeechRecordingDidRecognizePhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 sessionUUID:(id)a8 refId:(id)a9
{
  id v15 = a3;
  id v16 = a8;
  -[AFDictationServiceDelegate speechDidRecognizePhrases:rawPhrases:utterances:rawUtterances:nluResult:usingSpeechModel:correctionContext:audioAnalytics:]( self->_serviceDelegate,  "speechDidRecognizePhrases:rawPhrases:utterances:rawUtterances:nluResult:usingSpeechModel:correctionContext:audioAnalytics:",  v15,  a4,  a5,  a6,  a7,  &stru_1004FECA0,  0LL,  0LL);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100312BF4;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v21 = v15;
  id v22 = v16;
  id v18 = v16;
  id v19 = v15;
  dispatch_async(queue, block);
}

- (void)adSpeechRecognizedStructuredResult:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 items]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 items]);
  id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v17), "ad_transcriptionResults"));
        [v12 addObjectsFromArray:v18];

        id v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v15);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100312B90;
  v23[3] = &unk_1004FD470;
  v23[4] = self;
  id v24 = v12;
  id v25 = v9;
  id v26 = v10;
  id v20 = v10;
  id v21 = v9;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (void)adSpeechRecognitionDidFail:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[ADDictationConnection adSpeechRecognitionDidFail:sessionUUID:]";
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Sending recognition failed %{public}@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100312B20;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)adSpeechLocalRecognitionDidSucceedWithSessionUUID:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADDictationConnection adSpeechLocalRecognitionDidSucceedWithSessionUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Sending local recognition succeeded", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100312A20;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)adPronunciationRecognized:(id)a3 usingSpeechModel:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003128A8;
  v15[3] = &unk_1004FD470;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)adAudioFileFinishedWriting:(id)a3 error:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[AFDictationServiceDelegate speechDidFinishWritingAudioFile:error:]( self->_serviceDelegate,  "speechDidFinishWritingAudioFile:error:",  v8,  v9);
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100312828;
  v15[3] = &unk_1004FD470;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (BOOL)adWaitingForAudioFile
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100312814;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)adSpeechRecordingDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003127FC;
  v13[3] = &unk_1004FC250;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)adSpeechLanguageDetectorFailedWithError:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003127F0;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)adSpeechMultilingualSpeechRecognized:(id)a3 sessionUUID:(id)a4
{
  id v5 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003127BC;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)adSpeechDidBeginLocalRecognitionWithModelInfo:(id)a3 sessionUUID:(id)a4
{
  id v5 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003127B0;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)adSpeechDidPauseRecognition
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003127A4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_dictationWillStartWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 xpcconnection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[ADDictationSessionTracker startSessionForReason:languageCode:options:speechRequestOptions:]( self->_sessionTracker,  "startSessionForReason:languageCode:options:speechRequestOptions:",  @"dictation is starting",  v10,  v11,  v12));
  unint64_t v15 = (unint64_t)[v11 transcriptionMode];
  BOOL v16 = &stru_1004FECA0;
  if (v15 <= 3) {
    BOOL v16 = off_1004FBB60[v15];
  }
  id v17 = @"Siri Event";
  v47[0] = @"Siri Event";
  v47[1] = @"mode";
  v48[0] = @"Dictation start";
  v48[1] = v16;
  v47[2] = @"startReason";
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 startContext]);
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"startDictation"]);
  id v20 = (void *)v19;
  if (v19) {
    id v21 = (const __CFString *)v19;
  }
  else {
    id v21 = &stru_1004FECA0;
  }
  v48[2] = v21;
  v47[3] = @"appBundleID";
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v11 applicationName]);
  v23 = (void *)v22;
  if (v22) {
    id v24 = (const __CFString *)v22;
  }
  else {
    id v24 = &stru_1004FECA0;
  }
  v48[3] = v24;
  v47[4] = @"recognition";
  id v25 = @"server";
  if ([v11 forceOfflineRecognition]
    && [v11 secureOfflineOnly])
  {
    id v25 = @"on-device";
  }

  v48[4] = v25;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  5LL));
  sub_1001EAF7C(v26);

  if ([v11 detectUtterances]
    && ([v11 forceOfflineRecognition] & 1) == 0)
  {
    __int128 v27 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v43 = 136315138;
      v44 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s Utterance detection for live recognition not yet supported; disabling. <rdar://problem/23691545>",
        (uint8_t *)&v43,
        0xCu);
    }

    [v11 setDetectUtterances:0];
  }

  if ([v11 shouldClassifyIntent]
    && ([v11 detectUtterances] & 1) == 0)
  {
    __int128 v28 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v43 = 136315138;
      v44 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s Dictation intent classification is only supported with utterance detection enabled; disabling.",
        (uint8_t *)&v43,
        0xCu);
    }

    [v11 setShouldClassifyIntent:0];
  }

  if (!+[AFFeatureFlags isDictationVoiceCommandsEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isDictationVoiceCommandsEnabled")) {
    goto LABEL_27;
  }
  if ([v11 shouldRecognizeCommands]
    && ([v11 detectUtterances] & 1) == 0)
  {
    __int128 v29 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v43 = 136315138;
      v44 = "-[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]";
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s Dictation command recognition is only supported with utterance detection enabled; disabling.",
        (uint8_t *)&v43,
        0xCu);
    }

- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 xpcconnection:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue( -[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]( self,  "_dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:",  v12,  v11,  v10,  a6));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v13 startDictationWithLanguageCode:v12 options:v11 speechOptions:v10 sessionUUID:v14 delegate:self];
}

- (void)startRequestActivityWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003126C8;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_invokeRequestCompletion
{
  requestCompletion = (void (**)(id))self->_requestCompletion;
  if (requestCompletion)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      id v7 = "-[ADDictationConnection _invokeRequestCompletion]";
      __int16 v8 = 2048;
      id v9 = self;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s %p request completion invoked",  (uint8_t *)&v6,  0x16u);
      requestCompletion = (void (**)(id))self->_requestCompletion;
    }

    requestCompletion[2](requestCompletion);
    id v5 = self->_requestCompletion;
  }

  else
  {
    id v5 = 0LL;
  }

  self->_requestCompletion = 0LL;
}

- (void)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 audioFileHandle]);
  if (v14)
  {
    unint64_t v15 = (void *)v14;
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    BOOL v17 = sub_100312300(v16);

    if (!v17)
    {
      serviceDelegate = self->_serviceDelegate;
      uint64_t v24 = 1700LL;
LABEL_9:
      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v24));
      -[AFDictationServiceDelegate speechRecognitionDidFinishWithError:]( serviceDelegate,  "speechRecognitionDidFinishWithError:",  v25);

      v13[2](v13, 0LL);
      goto LABEL_10;
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v19 = [v18 dictationIsEnabled];

  if ((v19 & 1) == 0)
  {
    uint64_t v22 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v29 = "-[ADDictationConnection startRecordingForPendingDictationWithLanguageCode:options:speechOptions:reply:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Dictation requested even though it is disabled",  buf,  0xCu);
    }

    serviceDelegate = self->_serviceDelegate;
    uint64_t v24 = 34LL;
    goto LABEL_9;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[ADDictationConnection _dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:]( self,  "_dictationWillStartWithLanguageCode:options:speechOptions:xpcconnection:",  v10,  v11,  v12,  0LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100312540;
  v26[3] = &unk_1004FBAB0;
  v26[4] = self;
  __int128 v27 = v13;
  [v21 startRecordingForPendingDictationWithLanguageCode:v10 options:v11 speechOptions:v12 sessionUUID:v20 delegate:self completion:v26];

LABEL_10:
}

- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5
{
  __int16 v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 audioFileHandle]);
  if (v11
    && (id v12 = (void *)v11,
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection")),
        BOOL v14 = sub_100312300(v13),
        v13,
        v12,
        !v14))
  {
    serviceDelegate = self->_serviceDelegate;
    uint64_t v23 = 1700LL;
  }

  else
  {
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned __int8 v16 = [v15 dictationIsEnabled];

    if ((v16 & 1) != 0)
    {
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      if (!AFDictationRequiresRequestValidation()
        || (sub_100312100(v17, 0LL) & 1) != 0
        || (AFIsDictationRequestFromAppleClient(v17) & 1) != 0)
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue( -[ADDictationConnection _updateDictationOptionsForOnDeviceDictation:language:]( self,  "_updateDictationOptionsForOnDeviceDictation:language:",  v9,  v8));
        if (!v18)
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationName]);
          if (v8) {
            id v25 = v8;
          }
          else {
            id v25 = &stru_1004FECA0;
          }
          __int128 v29 = @"language-code";
          __int128 v30 = v25;
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
          +[AFDictationDiscoverabilitySignalsStreamManager sendDictationRequestStartedEventWithBundleIdentifier:context:userInfo:]( &OBJC_CLASS___AFDictationDiscoverabilitySignalsStreamManager,  "sendDictationRequestStartedEventWithBundleIdentifier:context:userInfo:",  v24,  0LL,  v26);

          sub_10031235C(v10, (uint64_t)v17);
          -[ADDictationConnection _startDictationWithLanguageCode:options:speechOptions:xpcconnection:]( self,  "_startDictationWithLanguageCode:options:speechOptions:xpcconnection:",  v8,  v9,  v10,  v17);
          unsigned __int8 v19 = 0LL;
          goto LABEL_19;
        }

        unsigned __int8 v19 = (void *)v18;
        id v20 = self->_serviceDelegate;
      }

      else
      {
        __int128 v27 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "-[ADDictationConnection startDictationWithLanguageCode:options:speechOptions:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Dictation request validation failed",  buf,  0xCu);
        }

        __int128 v28 = self->_serviceDelegate;
        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1700LL));
        id v20 = v28;
      }

      -[AFDictationServiceDelegate speechRecognitionDidFinishWithError:]( v20,  "speechRecognitionDidFinishWithError:",  v19);
LABEL_19:

      goto LABEL_20;
    }

    id v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[ADDictationConnection startDictationWithLanguageCode:options:speechOptions:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Dictation requested even though it is disabled",  buf,  0xCu);
    }

    serviceDelegate = self->_serviceDelegate;
    uint64_t v23 = 34LL;
  }

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v23));
  -[AFDictationServiceDelegate speechRecognitionDidFinishWithError:]( serviceDelegate,  "speechRecognitionDidFinishWithError:",  v17);
LABEL_20:
}

- (void)cancelSpeech
{
  char v3 = @"Siri Event";
  id v7 = @"Siri Event";
  __int16 v8 = @"Dictation cancel";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  sub_1001EAF7C(v4);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_usingLocalSpeechRecognizer)
  {
    -[CoreEmbeddedSpeechRecognizer invalidate](self->_localSpeechRecognizer, "invalidate");
    localSpeechRecognizer = self->_localSpeechRecognizer;
    self->_localSpeechRecognizer = 0LL;

    self->_waitingForSpeechRecognition = 0;
    self->_usingLocalSpeechRecognizer = 0;
  }

  else
  {
    -[ADDictationConnection _continuePendingSpeechRequestFromTimestamp:]( self,  "_continuePendingSpeechRequestFromTimestamp:",  0.0);
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v6 cancelSpeechForDelegate:self];

    -[ADDictationSessionTracker stopSessionForReason:]( self->_sessionTracker,  "stopSessionForReason:",  @"dictation is canceling");
  }

- (void)stopSpeechWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = @"Siri Event";
  v18[0] = @"Siri Event";
  v18[1] = @"stopReason";
  v19[0] = @"Dictation stop";
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stopContext]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"stopDictation"]);
  __int16 v8 = (void *)v7;
  id v9 = &stru_1004FECA0;
  if (v7) {
    id v9 = (const __CFString *)v7;
  }
  v19[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
  sub_1001EAF7C(v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 audioFileHandle]);
  if (v12 && (id v13 = (void *)v12, v14 = sub_100312300(v11), v13, !v14))
  {
    serviceDelegate = self->_serviceDelegate;
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1700LL));
    -[AFDictationServiceDelegate speechRecognitionDidFinishWithError:]( serviceDelegate,  "speechRecognitionDidFinishWithError:",  v16);
  }

  else
  {
    kdebug_trace(722470204LL, 0LL, 0LL, 0LL, 0LL);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (self->_usingLocalSpeechRecognizer)
    {
      -[CoreEmbeddedSpeechRecognizer finishAudio](self->_localSpeechRecognizer, "finishAudio");
    }

    else
    {
      sub_10031235C(v4, (uint64_t)v11);
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      [v17 stopSpeechWithOptions:v4 forDelegate:self];

      -[ADDictationSessionTracker stopSessionForReason:]( self->_sessionTracker,  "stopSessionForReason:",  @"dictation is stopping");
      if (!self->_shouldFinalizeRequestOnNextFinalResult && !self->_didFinalizeUtteranceDetectionRequest) {
        self->_shouldFinalizeRequestOnNextFinalResult = 1;
      }
    }
  }
}

- (void)updateSpeechOptions:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v10 audioFileHandle]);
  if (v5)
  {
    int v6 = (void *)v5;
    BOOL v7 = sub_100312300(v4);

    if (!v7)
    {
      serviceDelegate = self->_serviceDelegate;
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1700LL));
      -[AFDictationServiceDelegate speechRecognitionDidFinishWithError:]( serviceDelegate,  "speechRecognitionDidFinishWithError:",  v8);
      goto LABEL_6;
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_usingLocalSpeechRecognizer)
  {
    sub_10031235C(v10, (uint64_t)v4);
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v8 updateSpeechOptions:v10 forDelegate:self];
LABEL_6:
  }
}

- (void)sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_usingLocalSpeechRecognizer)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v7 sendSpeechCorrectionInfo:v8 forCorrectionContext:v6];
  }
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(queue);
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v8 sendSpeechCorrectionInfo:v7 interactionIdentifier:v6];
}

- (void)sendUserSelectedAlternativeDictationLanguageCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[ADDictationConnection sendUserSelectedAlternativeDictationLanguageCode:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003122BC;
  block[3] = &unk_1004FD940;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, block);
}

- (void)preheatForLanguageCode:(id)a3
{
  id v3 = a3;
  id v4 = @"Siri Event";
  BOOL v14 = @"Siri Event";
  unint64_t v15 = @"Dictation preheat";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  sub_1001EAF7C(v5);

  int v7 = AFIsNano(v6);
  if (!v3)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      id v13 = "-[ADDictationConnection preheatForLanguageCode:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s No language provided, no language specific prewarm work will be done",  (uint8_t *)&v12,  0xCu);
    }
  }

  if (v7) {
    uint64_t v9 = 5LL;
  }
  else {
    uint64_t v9 = 0LL;
  }
  id v10 = objc_alloc_init(&OBJC_CLASS___AFSpeechRequestOptions);
  -[AFSpeechRequestOptions setPreheatLanguage:](v10, "setPreheatLanguage:", v3);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v11 preheatWithStyle:v9 forOptions:v10 completion:0];
}

- (void)preheat
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
  -[ADDictationConnection preheatForLanguageCode:](self, "preheatForLanguageCode:", v3);
}

- (void)preheatTestWithLanguage:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = @"Siri Event";
  id v13 = @"Siri Event";
  BOOL v14 = @"Dictation Preheat Test";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  sub_1001EAF7C(v8);

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___AFSpeechRequestOptions);
  else {
    uint64_t v10 = 0LL;
  }
  -[AFSpeechRequestOptions setIsTest:](v9, "setIsTest:", 1LL);
  -[AFSpeechRequestOptions setPreheatLanguage:](v9, "setPreheatLanguage:", v6);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 modelOverrideURL]);
  -[AFSpeechRequestOptions setPreheatTestModelPath:](v9, "setPreheatTestModelPath:", v11);

  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v12 preheatWithStyle:v10 forOptions:v9 completion:0];
}

- (void)preheatWithRecordDeviceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = @"Siri Event";
  int v7 = @"Siri Event";
  id v8 = @"Dictation preheatWithRecordDeviceIdentifier";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  sub_1001EAF7C(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v6 preheatWithRecordDeviceIdentifier:v3];
}

- (void)endSession
{
  id v3 = @"Siri Event";
  id v6 = @"Siri Event";
  int v7 = @"Dictation endSession";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  sub_1001EAF7C(v4);

  -[ADDictationConnection _removeAllAudioSessionAssertionsForReason:]( self,  "_removeAllAudioSessionAssertionsForReason:",  @"Dictation Connection Requested End Session");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v5 endSessionForDelegate:self];
}

- (void)recordFailureMetricsForError:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  objc_msgSend(v4, "_metrics_recordFailureMetricsForError:", v3);
}

- (void)recordAWDSuccessMetrics
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  objc_msgSend(v2, "_metrics_awdRequestEnd");
}

- (void)startRecordedAudioDictationWithOptions:(id)a3 language:(id)a4 narrowband:(BOOL)a5 forceSampling:(BOOL)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  int v12 = v11;
  if (v11)
  {
    if ((sub_100312100(v11, 1LL) & 1) != 0)
    {
      if ([v9 forceOfflineRecognition])
      {
        -[ADDictationConnection _updateDictationOptions:](self, "_updateDictationOptions:", v9);
        char v13 = 1;
        self->_waitingForSpeechRecognition = 1;
        self->_usingLocalSpeechRecognizer = 1;
        v56 = (__CFString *)CoreEmbeddedSpeechRecognizerTaskDictation;
        uint64_t v14 = 0LL;
        switch((unint64_t)[v9 taskHint])
        {
          case 1uLL:
            unint64_t v15 = (__CFString *)CoreEmbeddedSpeechRecognizerTaskVoiceMail;

            char v13 = 0;
            uint64_t v14 = 1LL;
            goto LABEL_17;
          case 2uLL:
            break;
          case 3uLL:
            unint64_t v15 = (__CFString *)CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging;

            uint64_t v14 = 0LL;
            goto LABEL_17;
          case 4uLL:
            unint64_t v15 = (__CFString *)CoreEmbeddedSpeechRecognizerTaskWebSearch;

            uint64_t v14 = 0LL;
            char v13 = 0;
LABEL_17:
            v56 = v15;
            break;
          case 5uLL:

            uint64_t v14 = 0LL;
            char v13 = 0;
            v56 = @"DictationCC";
            break;
          default:
            uint64_t v14 = 0LL;
            char v13 = 0;
            break;
        }

        uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 offlineLanguage]);
        uint64_t v23 = (void *)v22;
        if (v22) {
          uint64_t v24 = (void *)v22;
        }
        else {
          uint64_t v24 = v10;
        }
        id v55 = v24;

        uint64_t v52 = objc_claimAutoreleasedReturnValue([v9 modelOverrideURL]);
        uint64_t v51 = objc_claimAutoreleasedReturnValue([v9 recognitionOverrides]);
        id v25 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[AFDictationOptions fieldLabel](self->_dictationOptions, "fieldLabel"));
        id v26 = (__CFString *)v25;
        if (!v25) {
          id v25 = &stru_1004FECA0;
        }
        char v27 = AFIsDictationRequestSpeechApiRequest(v25);

        uint64_t v28 = objc_claimAutoreleasedReturnValue([v9 interactionIdentifier]);
        uint64_t v53 = objc_claimAutoreleasedReturnValue(-[AFDictationOptions applicationName](self->_dictationOptions, "applicationName"));
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( -[ADDictationConnection _localSpeechRecognizerSupportingBackground:]( self,  "_localSpeechRecognizerSupportingBackground:",  v14));
        v54 = (void *)v28;
        if (v29)
        {
          id v49 = objc_alloc(&OBJC_CLASS___CESRSpeechParameters);
          v48 = (void *)objc_claimAutoreleasedReturnValue([v9 originalAudioFileURL]);
          id v30 = [v9 detectUtterances];
          char v50 = (char)v30;
          char v47 = sub_1001EA6E0((uint64_t)v30);
          BOOL v31 = v6;
          unsigned __int8 v32 = [v9 farField];
          [v9 maximumRecognitionDuration];
          double v34 = v33;
          unsigned __int8 v35 = [v9 emojiRecognition];
          BYTE1(v46) = [v9 autoPunctuation];
          LOBYTE(v46) = v35;
          LOWORD(v45) = 0;
          LOBYTE(v44) = v27;
          HIBYTE(v43) = 0;
          *(_WORD *)((char *)&v43 + 5) = 0;
          BYTE4(v43) = v13;
          BYTE3(v43) = v32;
          BYTE2(v43) = v47;
          BYTE1(v43) = v50;
          LOBYTE(v43) = v31;
          BOOL v37 = (void *)v51;
          v36 = (void *)v52;
          v38 = (void *)v53;
          v39 = v54;
          id v40 = objc_msgSend( v49,  "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationNam e:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpee ch:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization: isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEag erPackage:disableDeliveringAsrFeatures:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:",  v55,  0,  v54,  v56,  0,  v53,  v34,  0.0,  0,  v51,  v52,  v48,  0,  v43,  v44,  0,  0,  0,  v45,  0,  v46);

          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472LL;
          v57[2] = sub_10031227C;
          v57[3] = &unk_1004FBAD8;
          v57[4] = self;
          [v29 startSpeechRecognitionWithParameters:v40 didStartHandler:v57];
        }

        else
        {
          BOOL v37 = (void *)v51;
          v36 = (void *)v52;
          v41 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v59 = "-[ADDictationConnection startRecordedAudioDictationWithOptions:language:narrowband:forceSampling:]";
            _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s Could not make recognizer",  buf,  0xCu);
          }

          serviceDelegate = self->_serviceDelegate;
          id v40 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  601LL,  0LL));
          -[AFDictationServiceDelegate speechRecognitionDidFinishWithError:]( serviceDelegate,  "speechRecognitionDidFinishWithError:",  v40);
          v38 = (void *)v53;
          v39 = v54;
        }

        goto LABEL_30;
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[ADDictationConnection _updateDictationOptionsForOnDeviceDictation:language:]( self,  "_updateDictationOptionsForOnDeviceDictation:language:",  v9,  v10));
      if (!v18)
      {
        -[ADDictationConnection _updateDictationOptions:](self, "_updateDictationOptions:", v9);
        self->_waitingForSpeechRecognition = 1;
        id v20 = (void *)objc_claimAutoreleasedReturnValue( -[ADDictationSessionTracker startSessionForReason:languageCode:options:speechRequestOptions:]( self->_sessionTracker,  "startSessionForReason:languageCode:options:speechRequestOptions:",  @"recorded audio dictation is starting",  v10,  v9,  0LL));
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
        [v21 startRecordedDictationWithLanguage:v10 options:v9 sessionUUID:v20 narrowband:v6 delegate:self];

        goto LABEL_12;
      }

      unsigned __int8 v19 = self->_serviceDelegate;
    }

    else
    {
      BOOL v17 = self->_serviceDelegate;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1700LL,  0LL));
      unsigned __int8 v19 = v17;
    }

    -[AFDictationServiceDelegate speechRecognitionDidFinishWithError:](v19, "speechRecognitionDidFinishWithError:", v18);
LABEL_12:

    goto LABEL_30;
  }

  unsigned __int8 v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v59 = "-[ADDictationConnection startRecordedAudioDictationWithOptions:language:narrowband:forceSampling:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Called from outside of an XPC connection",  buf,  0xCu);
  }

- (void)addRecordedSpeechSampleData:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_usingLocalSpeechRecognizer)
  {
    -[CoreEmbeddedSpeechRecognizer addAudioPacket:](self->_localSpeechRecognizer, "addAudioPacket:", v5);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v4 addRecordedSpeechSampleData:v5 delegate:self];
  }
}

- (void)_startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v14 = (void *)v13;
  if (v13 && (AFConnectionHasEntitlement(v13, kAssistantDictationPrerecordedEntitlement) & 1) == 0)
  {
    unsigned __int8 v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[ADDictationConnection _startDictationWithURL:isNarrowBand:language:options:]";
      __int16 v24 = 2114;
      id v25 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Connection (%{public}@) requires entitlement for pre-recorded dictation",  buf,  0x16u);
    }
  }

  else
  {
    unint64_t v15 = @"Siri Event";
    id v20 = @"Siri Event";
    id v21 = @"Dictation startWithURL";
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    sub_1001EAF7C(v16);

    -[ADDictationConnection _updateDictationOptions:](self, "_updateDictationOptions:", v12);
    self->_waitingForSpeechRecognition = 1;
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADDictationSessionTracker startSessionForReason:languageCode:options:speechRequestOptions:]( self->_sessionTracker,  "startSessionForReason:languageCode:options:speechRequestOptions:",  @"file-based dictation is starting",  v11,  v12,  0LL));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v18 startDictationWithURL:v10 isNarrowBand:v8 language:v11 options:v12 sessionUUID:v17 delegate:self];
  }
}

- (void)_sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 sendEngagementFeedback:a3 voiceQueryIdentifier:v6];
}

- (void)getInstalledOfflineLanguagesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100311FFC;
  v6[3] = &unk_1004FC7C0;
  id v7 = v3;
  id v5 = v3;
  [v4 getOfflineDictationStatusIgnoringCache:1 completion:v6];
}

- (void)requestOfflineAssistantSupportForLanguage:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, BOOL, void))a4;
  id v6 = a3;
  id v10 = [[SFEntitledAssetConfig alloc] initWithLanguage:v6 assetType:3];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager subscriberIdForDictationAssets]( &OBJC_CLASS___SFEntitledAssetManager,  "subscriberIdForDictationAssets"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 installedAssetWithConfig:v10 regionId:0 shouldSubscribe:1 subscriberId:v8 expiration:0]);

  v5[2](v5, v9 != 0LL, 0LL);
}

- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, BOOL, void))a4;
  id v6 = a3;
  id v10 = [[SFEntitledAssetConfig alloc] initWithLanguage:v6 assetType:3];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager subscriberIdForDictationAssets]( &OBJC_CLASS___SFEntitledAssetManager,  "subscriberIdForDictationAssets"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 installedAssetWithConfig:v10 regionId:0 shouldSubscribe:1 subscriberId:v8 expiration:0]);

  v5[2](v5, v9 != 0LL, 0LL);
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADDictationConnection suppressLowStorageNotificationForLanguage:suppress:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 suppressLowStorageNotificationForLanguage:v5 suppress:v4];
}

- (void)pauseRecognition
{
  id v2 = @"Siri Event";
  int v8 = @"Siri Event";
  id v9 = @"Dictation pause";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  sub_1001EAF7C(v3);

  BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADDictationConnection pauseRecognition]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v5 pauseRecognition];
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = @"Siri Event";
  unsigned __int8 v16 = @"Siri Event";
  BOOL v17 = @"Dictation resume";
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  sub_1001EAF7C(v11);

  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    unint64_t v15 = "-[ADDictationConnection resumeRecognitionWithPrefixText:postfixText:selectedText:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v13 resumeRecognitionWithPrefixText:v9 postfixText:v8 selectedText:v7];
}

- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (AFIsInternalInstall(v8))
  {
    id v9 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      uint64_t Name = AFAnalyticsEventTypeGetName(a4);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(Name);
      int v20 = 136315906;
      id v21 = "-[ADDictationConnection reportIssueForError:eventType:context:]";
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      __int16 v24 = 2112;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Reporting issue for error %@, event %@ with context %@",  (uint8_t *)&v20,  0x2Au);
    }

    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v16 = [v15 processIdentifier];
    uint64_t v17 = byte_1005780A0;
    id v18 = sub_100071CA8((uint64_t)v16);
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v14 reportIssueForError:v7 type:a4 context:v8 processIdentifier:v16 walkboutStatus:v17 triggerForIDSIdentifiers:v19];
  }
}

- (void)reportIssueForError:(id)a3 eventType:(int64_t)a4 subtype:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (AFIsInternalInstall(v11))
  {
    id v12 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = v12;
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
      uint64_t Name = AFAnalyticsEventTypeGetName(a4);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(Name);
      *(_DWORD *)buf = 136315906;
      __int16 v24 = "-[ADDictationConnection reportIssueForError:eventType:subtype:context:]";
      __int16 v25 = 2112;
      __int16 v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Reporting issue for error %@, event %@ with context %@",  buf,  0x2Au);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v19 = [v18 processIdentifier];
    uint64_t v20 = byte_1005780A0;
    id v21 = sub_100071CA8((uint64_t)v19);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v17 reportIssueForError:v9 type:a4 subtype:v10 context:v11 processIdentifier:v19 walkboutStatus:v20 triggerForIDSIdentifiers:v22];
  }
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v24 updateVoiceCommandContextWithPrefixText:v23 postfixText:v22 selectedText:v21 disambiguationActive:v20 cursorInVisibleText:v19 favorComma ndSuppression:v18 abortCommandSuppression:v17 undoEvent:v16];
}

- (id)_updateDictationOptionsForOnDeviceDictation:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v9 = [v8 isOnDeviceDictationForced];

  if ((v9 & 1) == 0)
  {
    if ((AFIsATVOnly(v10) & 1) != 0
      || !AFIsDictationRequestEligibleForOnDeviceDictation(v6)
      || (__int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences")),
          unsigned __int8 v30 = [v29 preferOnlineRecognitionEnabled],
          v29,
          (v30 & 1) != 0))
    {
LABEL_45:
      v36 = 0LL;
      goto LABEL_46;
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver]( &OBJC_CLASS___ADDictationOfflineStatusObserver,  "sharedDictationOfflineStatusObserver"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 offlineDictationStatus]);

  int v13 = AFIsSearchDictationRequest(v6);
  uint64_t v46 = self;
  if (!v12)
  {
    int v31 = 0;
    unsigned int v48 = 0;
    unsigned int v27 = 0;
    id v18 = 0LL;
    goto LABEL_22;
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@"_"]);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@"-"]);

  uint64_t v16 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode(v15);
  uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)v17;
  if (v17) {
    id v19 = (void *)v17;
  }
  else {
    id v19 = v15;
  }
  id v20 = v19;

  char v47 = v20;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v20]);
  id v22 = v21;
  if (v21)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:AFOfflineDictationStatusInstalledKey]);
    unsigned int v24 = [v23 BOOLValue];

    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:AFOfflineDictationStatusHighQualityKey]);
    unsigned int v48 = [v25 BOOLValue];

    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:AFOfflineDictationStatusOnDeviceSearchKey]);
    unsigned int v27 = [v26 BOOLValue];

    if (((v13 ^ 1 | v9) & 1) != 0)
    {
      unsigned int v28 = 1;
      if (!v24) {
        goto LABEL_20;
      }
LABEL_17:
      if ((v48 & v28 & 1) == 0)
      {
        unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
        if ([v32 forceOfflineRecognitionEnabled])
        {
        }

        else
        {
          unsigned int v37 = [v6 forceOfflineRecognition];

          if (!v37)
          {
            int v31 = 1;
            goto LABEL_21;
          }
        }
      }

      v38 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        if (v18) {
          id v39 = v18;
        }
        else {
          id v39 = v7;
        }
        id v40 = v38;
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v48));
        *(_DWORD *)buf = 136315906;
        char v50 = "-[ADDictationConnection _updateDictationOptionsForOnDeviceDictation:language:]";
        __int16 v51 = 2112;
        id v52 = v7;
        __int16 v53 = 2112;
        *(void *)v54 = v39;
        *(_WORD *)&v54[8] = 2112;
        v55[0] = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "%s Dictation: force offline speech recognition. Language code: %@, asset language code: %@, status: High Quality model: %@",  buf,  0x2Au);
      }

      [v6 setForceOfflineRecognition:1];
      [v6 setSecureOfflineOnly:1];
      if ([v6 continuousListening])
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:AFOfflineDictationStatusContinuousListeningKey]);
        if ([v42 BOOLValue])
        {
        }

        else
        {
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
          unsigned __int8 v44 = [v43 utteranceDetectionEnabled];

          if ((v44 & 1) == 0)
          {
            [v6 setDetectUtterances:0];
            [v6 setContinuousListening:0];
          }
        }
      }

      goto LABEL_45;
    }

    unsigned int v28 = [v6 preferOnDeviceRecognition] | v27;
    if (v24) {
      goto LABEL_17;
    }
  }

  else
  {
    unsigned int v27 = 0;
    unsigned int v48 = 0;
  }

- (id)_localSpeechRecognizerSupportingBackground:(BOOL)a3
{
  if (a3)
  {
    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[ADDictationConnection _localSpeechRecognizerSupportingBackground:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Background recognizer not supported on this platform",  (uint8_t *)&v11,  0xCu);
    }

    return 0LL;
  }

  else
  {
    localSpeechRecognizer = self->_localSpeechRecognizer;
    if (!localSpeechRecognizer
      || (uuid_copy( (unsigned __int8 *)&v11,  (const unsigned __int8 *)-[CoreEmbeddedSpeechRecognizer instanceUUID](localSpeechRecognizer, "instanceUUID")),  uuid_compare( (const unsigned __int8 *)&v11,  (const unsigned __int8 *)&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive)))
    {
      id v7 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]( objc_alloc(&OBJC_CLASS___CoreEmbeddedSpeechRecognizer),  "initWithDelegate:instanceUUID:",  self,  &CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive);
      id v8 = self->_localSpeechRecognizer;
      self->_localSpeechRecognizer = v7;

      unsigned int v9 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = self->_localSpeechRecognizer;
        int v11 = 136316418;
        id v12 = "-[ADDictationConnection _localSpeechRecognizerSupportingBackground:]";
        __int16 v13 = 2112;
        int v14 = self;
        __int16 v15 = 1040;
        int v16 = 16;
        __int16 v17 = 2096;
        id v18 = &CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive;
        __int16 v19 = 1024;
        int v20 = 0;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s %@ created speech recognizer (instanceUUID = %{uuid_t}.16P, for background = %{BOOL}d) %@",  (uint8_t *)&v11,  0x36u);
      }
    }

    return self->_localSpeechRecognizer;
  }

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100311FE0;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100311FCC;
  v5[3] = &unk_1004FD0A0;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    id v9 = "-[ADDictationConnection localSpeechRecognizer:didRecognizeRawEagerRecognitionCandidate:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s %@ raw eager candidate: %@",  (uint8_t *)&v8,  0x20u);
  }
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100311FC0;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5
{
  id v6 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100311EBC;
  v9[3] = &unk_1004FD968;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADDictationConnection listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v7 = AFPendingSpeechRequestServiceInterface();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setExportedInterface:v8];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)continuePendingSpeechRequestFromTimestamp:(double)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100311EAC;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_continuePendingSpeechRequestFromTimestamp:(double)a3
{
  pendingSpeechRequestContinue = (void (**)(id, double))self->_pendingSpeechRequestContinue;
  if (pendingSpeechRequestContinue)
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[ADDictationConnection _continuePendingSpeechRequestFromTimestamp:]";
      __int16 v12 = 2048;
      double v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s timestamp = %f", (uint8_t *)&v10, 0x16u);
      pendingSpeechRequestContinue = (void (**)(id, double))self->_pendingSpeechRequestContinue;
    }

    pendingSpeechRequestContinue[2](pendingSpeechRequestContinue, a3);
    id v7 = self->_pendingSpeechRequestContinue;
    self->_pendingSpeechRequestContinue = 0LL;
  }

  -[NSXPCListener invalidate](self->_pendingSpeechRequestListener, "invalidate", a3);
  pendingSpeechRequestListener = self->_pendingSpeechRequestListener;
  self->_pendingSpeechRequestListener = 0LL;

  -[NSXPCConnection invalidate](self->_pendingSpeechRequestConnection, "invalidate");
  pendingSpeechRequestConnection = self->_pendingSpeechRequestConnection;
  self->_pendingSpeechRequestConnection = 0LL;
}

- (BOOL)adSpeechSessionEnded
{
  return self->adSpeechSessionEnded;
}

- (void)setAdSpeechSessionEnded:(BOOL)a3
{
  self->adSpeechSessionEnded = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end