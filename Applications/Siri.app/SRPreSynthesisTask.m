@interface SRPreSynthesisTask
- (BOOL)handlePreSynthesisCommandWithError:(id *)a3;
- (SAAceCommand)replyAceCommand;
- (SAPreSynthesizeTTS)preSynthesizeTTSCommand;
- (SRPreSynthesisTask)init;
- (id)completion;
- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5;
- (void)setCompletion:(id)a3;
- (void)setPreSynthesizeTTSCommand:(id)a3;
- (void)setReplyAceCommand:(id)a3;
@end

@implementation SRPreSynthesisTask

- (SRPreSynthesisTask)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRPreSynthesisTask;
  v2 = -[SRPreSynthesisTask init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AFConnection outputVoice](&OBJC_CLASS___AFConnection, "outputVoice"));
    outputVoice = v2->_outputVoice;
    v2->_outputVoice = (AFVoiceInfo *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___SiriTTSDaemonSession);
    speechSynthesizer = v2->_speechSynthesizer;
    v2->_speechSynthesizer = v5;
  }

  return v2;
}

- (void)setPreSynthesizeTTSCommand:(id)a3
{
  v5 = (SAPreSynthesizeTTS *)a3;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_10006C220();
  }
  p_preSynthesizeTTSCommand = &self->_preSynthesizeTTSCommand;
  if (self->_preSynthesizeTTSCommand != v5)
  {
    objc_storeStrong((id *)&self->_preSynthesizeTTSCommand, a3);
    preSynthesizedTTSAudioDurations = self->_preSynthesizedTTSAudioDurations;
    self->_preSynthesizedTTSAudioDurations = 0LL;

    parsedDialogStringsForPreSynthesis = self->_parsedDialogStringsForPreSynthesis;
    self->_parsedDialogStringsForPreSynthesis = 0LL;

    parsedDialogStringIndicies = self->_parsedDialogStringIndicies;
    self->_parsedDialogStringIndicies = 0LL;

    currentError = self->_currentError;
    self->_currentError = 0LL;

    if (self->_preSynthesizeTTSCommand)
    {
      v53 = v5;
      v11 = objc_alloc(&OBJC_CLASS___NSLocale);
      uint64_t v12 = AFUIGetLanguageCode();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = -[NSLocale initWithLocaleIdentifier:](v11, "initWithLocaleIdentifier:", v13);

      v52 = v14;
      id v15 = [[AFSpeakableUtteranceParser alloc] initWithLocale:v14];
      [v15 setHandleTTSCodes:1];
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v18 = self->_parsedDialogStringIndicies;
      self->_parsedDialogStringIndicies = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
      id v20 = [v19 count];

      v22 = 0LL;
      if (v20)
      {
        unint64_t v23 = 0LL;
        *(void *)&__int128 v21 = 136315906LL;
        __int128 v51 = v21;
        do
        {

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](*p_preSynthesizeTTSCommand, "dialogStrings"));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v23]);

          id v54 = 0LL;
          v26 = (void *)objc_claimAutoreleasedReturnValue([v15 parseStringWithFormat:v25 error:&v54]);
          v22 = (NSMutableDictionary *)v54;
          if ([v26 length])
          {
            [v16 addObject:v26];
            v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v23));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_parsedDialogStringIndicies,  "setObject:forKeyedSubscript:",  v27,  v26);
          }

          if (v22)
          {
            v28 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              v31 = v28;
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](v53, "dialogStrings"));
              *(_DWORD *)buf = v51;
              v56 = "-[SRPreSynthesisTask setPreSynthesizeTTSCommand:]";
              __int16 v57 = 2114;
              v58 = v32;
              __int16 v59 = 2114;
              id v60 = v15;
              __int16 v61 = 2114;
              v62 = v22;
              _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s #presynthesize Speakable utterance parser failed to parse presynthesis dialogStrings. (speakableText = %{public}@, speakableUtteranceParser = %{public}@, error = %{public}@)",  buf,  0x2Au);
            }
          }

          ++v23;
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](*p_preSynthesizeTTSCommand, "dialogStrings"));
          id v30 = [v29 count];
        }

        while (v23 < (unint64_t)v30);
      }

      id v33 = objc_msgSend(v16, "count", v51);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](*p_preSynthesizeTTSCommand, "dialogStrings"));
      if (v33 == [v34 count])
      {
        id v35 = -[NSMutableDictionary count](self->_parsedDialogStringIndicies, "count");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
        id v37 = [v36 count];

        if (v35 == v37)
        {
LABEL_19:
          if ([v16 count]) {
            objc_storeStrong((id *)&self->_parsedDialogStringsForPreSynthesis, v16);
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
          v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v39 count]));
          v41 = self->_preSynthesizedTTSAudioDurations;
          self->_preSynthesizedTTSAudioDurations = v40;

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
          id v43 = [v42 count];

          if (v43)
          {
            unint64_t v44 = 0LL;
            do
            {
              -[NSMutableArray setObject:atIndexedSubscript:]( self->_preSynthesizedTTSAudioDurations,  "setObject:atIndexedSubscript:",  &off_1000BEBE8,  v44++);
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](self->_preSynthesizeTTSCommand, "dialogStrings"));
              id v46 = [v45 count];
            }

            while (v44 < (unint64_t)v46);
          }

          v5 = v53;
          goto LABEL_25;
        }
      }

      else
      {
      }

      v38 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        preSynthesizeTTSCommand = self->_preSynthesizeTTSCommand;
        v48 = v38;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS dialogStrings](preSynthesizeTTSCommand, "dialogStrings"));
        v50 = self->_parsedDialogStringIndicies;
        *(_DWORD *)buf = 136315906;
        v56 = "-[SRPreSynthesisTask setPreSynthesizeTTSCommand:]";
        __int16 v57 = 2114;
        v58 = v49;
        __int16 v59 = 2114;
        id v60 = v16;
        __int16 v61 = 2114;
        v62 = v50;
        _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%s #presynthesize Failed to generate same number of utterances for dialogStrings = %{public}@, parsedDialogs = %{public}@, _parsedDialogStringIndicies = %{public}@)",  buf,  0x2Au);
      }

      goto LABEL_19;
    }
  }

- (SAAceCommand)replyAceCommand
{
  p_preSynthesizeTTSCommand = &self->_preSynthesizeTTSCommand;
  if (!self->_preSynthesizeTTSCommand || -[NSMutableDictionary count](self->_parsedDialogStringIndicies, "count"))
  {
    id v4 = 0LL;
    return (SAAceCommand *)v4;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS aceAudioData](*p_preSynthesizeTTSCommand, "aceAudioData"));
  if (v5)
  {

LABEL_7:
    v7 = (os_log_s *)AFSiriLogContextConnection;
    if (self->_currentError)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_10006C28C((uint64_t *)p_preSynthesizeTTSCommand, v7);
      }
      objc_super v8 = &OBJC_CLASS___SACommandFailed;
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *p_preSynthesizeTTSCommand;
        int v17 = 136315394;
        v18 = "-[SRPreSynthesisTask replyAceCommand]";
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s PreSynthesizeTTS command (%@) succeeded",  (uint8_t *)&v17,  0x16u);
      }

      objc_super v8 = &OBJC_CLASS___SACommandSucceeded;
    }

    id v4 = objc_alloc_init(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS aceId](*p_preSynthesizeTTSCommand, "aceId"));
    [v4 setRefId:v10];

    return (SAAceCommand *)v4;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS streamIds](*p_preSynthesizeTTSCommand, "streamIds"));

  if (v6) {
    goto LABEL_7;
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___SAPreSynthesizeTTSCompleted);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAPreSynthesizeTTS aceId](self->_preSynthesizeTTSCommand, "aceId"));
  [v4 setRefId:v12];

  if (-[NSMutableArray count](self->_preSynthesizedTTSAudioDurations, "count"))
  {
    unint64_t v13 = 0LL;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_preSynthesizedTTSAudioDurations,  "objectAtIndexedSubscript:",  v13));
      [v14 doubleValue];
      double v16 = v15;

      if (v16 < 0.0) {
        -[NSMutableArray setObject:atIndexedSubscript:]( self->_preSynthesizedTTSAudioDurations,  "setObject:atIndexedSubscript:",  &off_1000BEBF8,  v13);
      }
      ++v13;
    }

    while (v13 < (unint64_t)-[NSMutableArray count](self->_preSynthesizedTTSAudioDurations, "count"));
  }

  [v4 setApproximateSpeechDuration:self->_preSynthesizedTTSAudioDurations];
  return (SAAceCommand *)v4;
}

- (BOOL)handlePreSynthesisCommandWithError:(id *)a3
{
  id v4 = self;
  v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    sub_10006C4B0(v5);
    id v4 = self;
  }

  v73 = a3;
  if (a3)
  {
    if (*a3) {
      *a3 = 0LL;
    }
    p_preSynthesizeTTSCommand = (id *)&v4->_preSynthesizeTTSCommand;
    if (v4->_preSynthesizeTTSCommand)
    {
      parsedDialogStringsForPreSynthesis = v4->_parsedDialogStringsForPreSynthesis;
      p_parsedDialogStringsForPreSynthesis = (id *)&v4->_parsedDialogStringsForPreSynthesis;
      v7 = parsedDialogStringsForPreSynthesis;
      if (!parsedDialogStringsForPreSynthesis)
      {
        id *v73 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  11LL,  &__NSDictionary0__struct));
LABEL_49:
        v50 = (os_log_s *)AFSiriLogContextConnection;
        BOOL v42 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
        if (!v42) {
          return v42;
        }
        sub_10006C384(v50, v51, v52, v53, v54, v55, v56, v57);
        goto LABEL_55;
      }

      goto LABEL_11;
    }

    id *v73 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  11LL,  &__NSDictionary0__struct));
LABEL_47:
    v41 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v42 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
    if (!v42) {
      return v42;
    }
    sub_10006C314(v41, v43, v44, v45, v46, v47, v48, v49);
    goto LABEL_55;
  }

  p_preSynthesizeTTSCommand = (id *)&v4->_preSynthesizeTTSCommand;
  if (!v4->_preSynthesizeTTSCommand) {
    goto LABEL_47;
  }
  v10 = v4->_parsedDialogStringsForPreSynthesis;
  p_parsedDialogStringsForPreSynthesis = (id *)&v4->_parsedDialogStringsForPreSynthesis;
  v7 = v10;
  if (!v10) {
    goto LABEL_49;
  }
LABEL_11:
  if (-[NSArray count](v7, "count"))
  {
    if ([*p_parsedDialogStringsForPreSynthesis count])
    {
      unint64_t v12 = 0LL;
      uint64_t v74 = kAFAssistantErrorDomain;
      *(void *)&__int128 v11 = 136315650LL;
      __int128 v72 = v11;
      do
      {
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_preSynthesizeTTSCommand, "aceAudioData", v72));
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([*p_preSynthesizeTTSCommand aceAudioData]);
          if (v12 >= (unint64_t)[v14 count])
          {
            double v16 = 0LL;
          }

          else
          {
            double v15 = (void *)objc_claimAutoreleasedReturnValue([*p_preSynthesizeTTSCommand aceAudioData]);
            double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:v12]);
          }
        }

        else
        {
          double v16 = 0LL;
        }

        int v17 = (void *)objc_claimAutoreleasedReturnValue([*p_preSynthesizeTTSCommand streamIds]);
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([*p_preSynthesizeTTSCommand streamIds]);
          if (v12 >= (unint64_t)[v18 count])
          {
            v22 = 0LL;
          }

          else
          {
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*p_preSynthesizeTTSCommand streamIds]);
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v12]);
            if ([v20 length])
            {
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([*p_preSynthesizeTTSCommand streamIds]);
              v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v12]);
            }

            else
            {
              v22 = 0LL;
            }
          }
        }

        else
        {
          v22 = 0LL;
        }

        unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*p_parsedDialogStringsForPreSynthesis objectAtIndexedSubscript:v12]);
        if (![v23 length])
        {
          v25 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
            sub_10006C464(v86, &v87, v25);
          }
          v26 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v74,  11LL,  &__NSDictionary0__struct));
          currentError = self->_currentError;
          self->_currentError = v26;
          goto LABEL_37;
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue([v16 audioBuffer]);
        if ([v24 length])
        {
        }

        else
        {
          BOOL v28 = [v22 length] == 0;

          if (v28)
          {
            v29 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = *p_preSynthesizeTTSCommand;
              v31 = v29;
              v32 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v30 speakableContextInfo]);
              *(_DWORD *)buf = v72;
              *(void *)&uint8_t buf[4] = "-[SRPreSynthesisTask handlePreSynthesisCommandWithError:]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v23;
              *(_WORD *)&buf[22] = 2112;
              v83 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s Presynthesizing text:%@, context:%@)",  buf,  0x20u);
            }

            id v33 = objc_alloc(&OBJC_CLASS___SiriTTSSynthesisVoice);
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo languageCode](self->_outputVoice, "languageCode"));
            id v35 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo name](self->_outputVoice, "name"));
            currentError = (NSError *)[v33 initWithLanguage:v34 name:v35];

            id v36 = [[SiriTTSSynthesisRequest alloc] initWithText:v23 voice:currentError];
            id v37 = (void *)objc_claimAutoreleasedReturnValue( -[SAPreSynthesizeTTS speakableContextInfo]( self->_preSynthesizeTTSCommand,  "speakableContextInfo"));
            [v36 setContextInfo:v37];

            *(void *)buf = 0LL;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000LL;
            v83 = sub_10003C238;
            v84 = sub_10003C248;
            id v85 = 0LL;
            v81[0] = _NSConcreteStackBlock;
            v81[1] = 3221225472LL;
            v81[2] = sub_10003C250;
            v81[3] = &unk_1000BB058;
            v81[4] = buf;
            [v36 setDidReportInstrument:v81];
            objc_initWeak(&location, self);
            speechSynthesizer = self->_speechSynthesizer;
            v76[0] = _NSConcreteStackBlock;
            v76[1] = 3221225472LL;
            v76[2] = sub_10003C260;
            v76[3] = &unk_1000BB080;
            objc_copyWeak(&v79, &location);
            id v39 = v36;
            id v77 = v39;
            v78 = buf;
            -[SiriTTSDaemonSession synthesizeWithRequest:didFinish:]( speechSynthesizer,  "synthesizeWithRequest:didFinish:",  v39,  v76);

            objc_destroyWeak(&v79);
            objc_destroyWeak(&location);
            _Block_object_dispose(buf, 8);

            goto LABEL_37;
          }
        }

        currentError = (NSError *)[[SiriTTSInlineStreamingSignal alloc] initWithText:v23 identifier:v22];
        -[SiriTTSDaemonSession signalWithInlineStreaming:]( self->_speechSynthesizer,  "signalWithInlineStreaming:",  currentError);
LABEL_37:

        ++v12;
      }

      while (v12 < (unint64_t)[*p_parsedDialogStringsForPreSynthesis count]);
    }

    if (v73) {
      id *v73 = self->_currentError;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue([*p_preSynthesizeTTSCommand aceAudioData]);
    if (v40)
    {
    }

    else
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue([*p_preSynthesizeTTSCommand streamIds]);
      BOOL v69 = v68 == 0LL;

      if (v69)
      {
        v70 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[SRPreSynthesisTask handlePreSynthesisCommandWithError:]";
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "%s Defer calling completion for PreSynthesisTTS to SiriTTSDaemonSession didFinish callback",  buf,  0xCu);
        }

        goto LABEL_58;
      }
    }

    (*((void (**)(void))self->_completion + 2))();
LABEL_58:
    LOBYTE(v42) = 1;
    return v42;
  }

  if (self->_completion)
  {
    v58 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  11LL,  &__NSDictionary0__struct));
    __int16 v59 = self->_currentError;
    self->_currentError = v58;

    id v60 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006C3F4(v60, v61, v62, v63, v64, v65, v66, v67);
    }
    (*((void (**)(void))self->_completion + 2))();
  }

- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_10006C52C();
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003C3C0;
  v14[3] = &unk_1000BA000;
  id v15 = v8;
  double v16 = self;
  id v17 = v10;
  id v18 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(&_dispatch_main_q, v14);
}

- (SAPreSynthesizeTTS)preSynthesizeTTSCommand
{
  return self->_preSynthesizeTTSCommand;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void)setReplyAceCommand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end