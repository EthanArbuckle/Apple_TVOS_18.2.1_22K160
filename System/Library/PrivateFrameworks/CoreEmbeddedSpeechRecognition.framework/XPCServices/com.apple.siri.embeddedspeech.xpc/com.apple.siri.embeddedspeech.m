LABEL_60:
    goto LABEL_61;
  }

  if (![v97 code])
  {
    v76 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRFailed);
    [v76 setMetrics:v103];
    [v75 setFailed:v76];
    v77 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame"
             ":languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:ea"
             "gerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneti"
             "cMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmo"
             "jiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInN"
             "s:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      v78 = "%s SELF: Logging ASRRequestContext->failed in SELF based on error result from recognizer.";
      goto LABEL_59;
    }

    goto LABEL_60;
  }

  if ([v97 code] == (id)2)
  {
    v76 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRCancelled);
    [v76 setReason:2];
    [v76 setMetrics:v103];
    [v75 setCancelled:v76];
    v77 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame"
             ":languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:ea"
             "gerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneti"
             "cMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmo"
             "jiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInN"
             "s:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      v78 = "%s SELF: Logging ASRRequestContext->cancelled with reason RECOGNITION_CANCELLED in SELF based on error resul"
            "t from recognizer.";
LABEL_59:
      _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, v78, buf, 0xCu);
      goto LABEL_60;
    }

    goto LABEL_60;
  }

  if ([v97 code] == (id)3)
  {
    v76 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRCancelled);
    [v76 setReason:3];
    [v76 setMetrics:v103];
    [v75 setCancelled:v76];
    v77 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v117 = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame"
             ":languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:ea"
             "gerUsed:utteranceDetectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneti"
             "cMatchDecoderName:pauseDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmo"
             "jiExpectedButNotRecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInN"
             "s:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      v78 = "%s SELF: Logging ASRRequestContext->cancelled with reason RECOGNITION_REJECTED in SELF based on error result"
            " from recognizer.";
      goto LABEL_59;
    }

    goto LABEL_60;
  }

LABEL_61:
  -[ESSelfHelper wrapAndEmitTopLevelEvent:timestampInTicks:]( self,  "wrapAndEmitTopLevelEvent:timestampInTicks:",  v75,  0LL);
  v79 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100049530 captureSnapshot]);
  v80 = (void *)objc_claimAutoreleasedReturnValue( +[SPIAsrRequestEndedOrFailedOrCancelledEventContext context]( &OBJC_CLASS___SPIAsrRequestEndedOrFailedOrCancelledEventContext,  "context"));
  [v79 logWithEventContext:v80 asrIdentifier:self->_asrId];
}

void sub_100007A30( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29)
{
  if (a2 == 1)
  {
    id v30 = objc_begin_catch(a1);
    v31 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v29 - 144) = 136315394;
      uint64_t v32 = v29 - 144;
      *(void *)(v32 + 4) = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActi"
                             "veTokensPerFrame:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recognition"
                             "DurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled:utteranceConcatenationEna"
                             "bled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:itnDuratio"
                             "nInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecognized:"
                             "recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInNs:totalSeco"
                             "ndaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      *(_WORD *)(v29 - 132) = 2112;
      *(void *)(v32 + 14) = a29;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s SELF: Encountered malformed string during SELF logging for interpolation weights in speech results from recog nizer. String: %@",  (uint8_t *)(v29 - 144),  0x16u);
      v31 = (os_log_s *)AFSiriLogContextSpeech;
    }

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v29 - 144) = 136315138;
      *(void *)(v29 - 140) = "-[ESSelfHelper logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageAc"
                               "tiveTokensPerFrame:languageModelInterpolationWeights:signalToNoiseRatioInDecibels:recogni"
                               "tionDurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled:utteranceConcatenat"
                               "ionEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:it"
                               "nDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotR"
                               "ecognized:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationIn"
                               "Ns:totalSecondaryPasses:cpuInstructionsInMillionsPerSecond:aneUsed:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s SELF: Expected interpolation weight sets separated by delimiter ';' - starting with a set of weights delimite"
        "d by ',' and ending the with start/end times delimited by ':'. Ex: '0.999646,0.000354:0:4280;0.947514,0.000158:0:3859'",
        (uint8_t *)(v29 - 144),
        0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100007548LL);
  }

  _Unwind_Resume(a1);
}

void sub_1000087E0(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    v3 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      v5 = "-[ESSelfHelper logPersonalizationExperimentTriggersForExperimentIds:]_block_invoke";
      __int16 v6 = 2112;
      v7 = v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s SELF: Failed trying to emit trigger logging due to error: %@",  (uint8_t *)&v4,  0x16u);
    }
  }
}

id sub_1000088A4(int a1, void *a2, void *a3, id *a4)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 tokenSausage]);
  v42 = v5;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 interpretationIndices]);
  id v9 = v7;
  id v46 = v6;
  v40 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 array]);

  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v11 count])
  {
    unint64_t v13 = 0LL;
    do
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRUtterance);
      v15 = objc_alloc_init(&OBJC_CLASS___NSArray);
      [v14 setInterpretationIndices:v15];

      -[NSMutableArray addObject:](v12, "addObject:", v14);
      ++v13;
    }

    while (v13 < (unint64_t)[v11 count]);
  }

  v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v44 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id obj = v9;
  id v16 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = 0LL;
    uint64_t v19 = *(void *)v57;
    do
    {
      v20 = 0LL;
      do
      {
        if (*(void *)v57 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)v20);
        id v22 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRPhrase);
        v23 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_100008D14;
        v48[3] = &unk_1000409E0;
        v24 = v12;
        uint64_t v54 = v18;
        char v55 = a1;
        v49 = v24;
        uint64_t v50 = v21;
        id v51 = v46;
        v52 = v45;
        v25 = v23;
        v53 = v25;
        [v11 enumerateObjectsUsingBlock:v48];
        if (-[NSMutableOrderedSet count](v25, "count"))
        {
          v26 = v11;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v25, "array"));
          id v28 = [v27 copy];
          [v22 setInterpretations:v28];

          v11 = v26;
          -[NSMutableArray addObject:](v44, "addObject:", v22);
          ++v18;
        }

        v20 = (char *)v20 + 1;
      }

      while (v17 != v20);
      id v17 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    }

    while (v17);
  }

  if (-[NSMutableArray count](v12, "count"))
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v12));
    id v30 = (id)objc_claimAutoreleasedReturnValue([v29 array]);
  }

  else
  {
    id v30 = 0LL;
  }

  if (a1)
  {
    id v31 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRRecognitionResultTier1);
    [v31 setTokens:v45];
    id v32 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v34 = [v32 initWithNSUUID:v33];
    [v31 setLinkId:v34];

    id v35 = v31;
    *a4 = v35;
  }

  id v36 = v30;
  id v37 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRRecognitionResult);
  [v37 setPhrases:v44];
  [v37 setUtterances:v36];

  if (a1)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue([*a4 linkId]);
    [v37 setLinkId:v38];
  }

  return v37;
}

void sub_100008D14(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v48 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndex:a3]);
  v49 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:*(void *)(a1 + 72)]);
  id v7 = [v6 unsignedIntegerValue];

  int v55 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:v7]);
  uint64_t v47 = a1;
  id v9 = *(void **)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  id v11 = v8;
  id v52 = v9;
  id v51 = v10;
  v12 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 count]);
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v11;
  id v56 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v56)
  {
    uint64_t v53 = *(void *)v58;
    uint64_t v54 = v12;
    do
    {
      for (i = 0LL; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v58 != v53) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
        id v15 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRToken);
        [v14 start];
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v16 doubleValue];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17 * 1000000000.0));
        objc_msgSend(v15, "setStartTimeInNs:", objc_msgSend(v18, "unsignedLongLongValue"));

        [v14 end];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v19 doubleValue];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20 * 1000000000.0));
        objc_msgSend(v15, "setEndTimeInNs:", objc_msgSend(v21, "unsignedLongLongValue"));

        objc_msgSend(v15, "setAppendSpaceAfter:", objc_msgSend(v14, "hasSpaceAfter"));
        [v14 silenceStart];
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v22 doubleValue];
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23 * 1000000000.0));
        objc_msgSend(v15, "setSilenceStartTimeInNs:", objc_msgSend(v24, "unsignedLongLongValue"));

        [v14 confidence];
        [v15 setConfidence:(int)v25];
        else {
          uint64_t v26 = (uint64_t)[v14 prependedAutoPunctuation];
        }
        objc_msgSend(v15, "setIsAutoPunctuation:", v26, v47);
        objc_msgSend(v15, "setIsModifiedByAutoPunctuation:", objc_msgSend(v14, "isModifiedByAutoPunctuation"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v14 tokenName]);
        id v28 = [v27 length];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v14 tokenName]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet punctuationCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "punctuationCharacterSet"));
        id v31 = [v29 rangeOfCharacterFromSet:v30];
        id v33 = v32;

        if (!v31 && v28 == v33)
        {
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v14 tokenName]);
          [v15 setPunctuationText:v34];
        }

        v12 = v54;
        if (v55)
        {
          id v35 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRTokenTier1);
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v14 tokenName]);
          id v37 = (void *)objc_claimAutoreleasedReturnValue([v52 baseStringForEmojiString:v36]);
          [v35 setText:v37];

          v38 = (void *)objc_claimAutoreleasedReturnValue([v14 phoneSequence]);
          [v35 setPhoneSequence:v38];

          v39 = (void *)objc_claimAutoreleasedReturnValue([v14 ipaPhoneSequence]);
          [v35 setIpaPhoneSequence:v39];

          if ([v51 containsObject:v35])
          {
            objc_msgSend(v15, "setLinkIndex:", objc_msgSend(v51, "indexOfObject:", v35));
          }

          else
          {
            objc_msgSend(v15, "setLinkIndex:", objc_msgSend(v51, "count"));
            [v51 addObject:v35];
          }
        }

        -[NSMutableArray addObject:](v54, "addObject:", v15);
      }

      id v56 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }

    while (v56);
  }

  if (-[NSMutableArray count](v12, "count"))
  {
    id v40 = objc_alloc_init(&OBJC_CLASS___ASRSchemaASRInterpretation);
    [v40 setTokens:v12];
    unsigned int v41 = [*(id *)(v47 + 64) containsObject:v40];
    v42 = *(void **)(v47 + 64);
    if (v41)
    {
      id v43 = [v42 indexOfObject:v40];
    }

    else
    {
      id v43 = [v42 count];
      [*(id *)(v47 + 64) addObject:v40];
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "interpretationIndices", v47));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v43));
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v44 arrayByAddingObject:v45]);
    [v48 setInterpretationIndices:v46];
  }
}
}

void sub_100009C2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

LABEL_20:
  double v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  stagedItems = self->_stagedItems;
  self->_stagedItems = v20;

  id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  stagedCategoryToVersion = self->_stagedCategoryToVersion;
  self->_stagedCategoryToVersion = v22;

  -[NSMutableDictionary addEntriesFromDictionary:](self->_stagedCategoryToVersion, "addEntriesFromDictionary:", v7);
  v8[2](v8, 1LL, 0LL);
LABEL_8:

LABEL_10:
}

void sub_10000AE18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_10000B334(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B344(uint64_t a1)
{
}

void sub_10000B34C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v7;
    int v10 = 136315650;
    id v11 = "-[ESSpeechProfileBuilderConnection finishAndSaveProfile:completion:]_block_invoke";
    __int16 v12 = 2048;
    id v13 = [v6 count];
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Processing %lu CCSharedItems for categories: %@",  (uint8_t *)&v10,  0x20u);
  }

  uint64_t v8 = -[ESUserData initWithItems:applicableSpeechCategories:]( objc_alloc(&OBJC_CLASS___ESUserData),  "initWithItems:applicableSpeechCategories:",  v6,  v5);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
}

void sub_10000B47C(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      v3 = v2;
      int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener _UUID](&OBJC_CLASS___NSXPCListener, "_UUID"));
      int v6 = 136315650;
      id v7 = "-[ESSpeechProfileBuilderConnection initWithXPCConnection:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = WeakRetained;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s %@ cancelling instance %@",  (uint8_t *)&v6,  0x20u);
    }

    [WeakRetained[12] invalidate];
    id v5 = WeakRetained[12];
    WeakRetained[12] = 0LL;
  }
}

LABEL_11:
  return (char)v4;
}

void sub_10000BFEC(id *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 isEqualToString:@"\\contact-first"]
    && (int v6 = a1 + 4, [a1[4] length])
    || [v9 isEqualToString:@"\\contact-last"]
    && (int v6 = a1 + 5, [a1[5] length])
    || [v9 isEqualToString:@"\\contact-middle"]
    && (int v6 = a1 + 6, [a1[6] length]))
  {
    id v7 = *v6;
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = objc_msgSend( [_EARWordPart alloc],  "initWithOrthography:pronunciations:tagName:frequency:phoneticOrthography:",  v5,  0,  v9,  (int)objc_msgSend(a1[7], "frequency"),  v7);

  [a1[8] addObject:v8];
}

void sub_10000C100(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 speechCategoryName]);
  [v7 addObject:v8];

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      __int16 v12 = 0LL;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v12);
        id v14 = objc_alloc(&OBJC_CLASS____EARWordPart);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 tagName]);
        id v17 = [v14 initWithOrthography:v13 pronunciations:v15 tagName:v16 frequency:1];

        uint64_t v18 = *(void **)(a1 + 40);
        id v26 = v17;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v5 speechCategoryName]);
        [v18 addWordWithParts:v19 templateName:v20];

        __int16 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v10);
  }
}

void sub_10000C76C()
{
  if (qword_100049538 != -1) {
    dispatch_once(&qword_100049538, &stru_100040A78);
  }
}

void sub_10000C7A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.siri", "Speech");
  v2 = (void *)qword_100049580;
  qword_100049580 = (uint64_t)v1;

  v3 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "ESLogInitIfNeeded_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s ::: embeddedspeech logging initialized.",  (uint8_t *)&v4,  0xCu);
  }

void sub_10000CD20(id a1, ESVocabularyLabel *a2, NSOrderedSet *a3, BOOL *a4)
{
  id v6 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    id v7 = v6;
    id v8 = a2;
    NSUInteger v9 = -[NSOrderedSet count](a3, "count");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ESVocabularyLabel speechCategoryName](v8, "speechCategoryName"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ESVocabularyLabel tagName](v8, "tagName"));

    int v12 = 136315906;
    uint64_t v13 = "-[ESUserData _populateUserDataFromItems:applicableSpeechCategories:]_block_invoke";
    __int16 v14 = 2048;
    NSUInteger v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Processed %tu items for (%@, %@).",  (uint8_t *)&v12,  0x2Au);
  }

LABEL_13:
  if ([v8 count])
  {
    double v20 = 0LL;
    uint64_t v21 = v17 & (v17 >> 63);
    id v35 = v21 - 1;
    __int128 v22 = v17 - v21;
    while (v20 != v22)
    {
      --v17;
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v20]);
      [v12 addObject:v23];
    }

    id v17 = v35;
  }

LABEL_19:
  if ((unint64_t)[v9 count] >= 0x65 && v17 >= 1)
  {
    __int128 v24 = 101LL;
    do
    {
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v24 - 1]);
      [v11 addObject:v25];

      ++v24;
    }

    while ((unint64_t)v17-- > 1);
  }

  v27 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    id v28 = v27;
    *(_DWORD *)buf = 136315650;
    id v37 = "+[ESUserData _applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:]";
    v38 = 2048;
    v39 = [v7 count];
    id v40 = 2048;
    unsigned int v41 = [v10 count];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "%s Processed first party contacts: %tu (accepted=%tu)",  buf,  0x20u);

    v27 = (void *)AFSiriLogContextSpeech;
  }

  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = v27;
    id v30 = [v8 count];
    id v31 = [v12 count];
    *(_DWORD *)buf = 136315650;
    id v37 = "+[ESUserData _applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:]";
    v38 = 2048;
    v39 = v30;
    id v40 = 2048;
    unsigned int v41 = v31;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s Processed third party contacts: %tu (accepted=%tu)",  buf,  0x20u);

    v27 = (void *)AFSiriLogContextSpeech;
  }

  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    id v32 = v27;
    id v33 = [v9 count];
    id v34 = [v11 count];
    *(_DWORD *)buf = 136315650;
    id v37 = "+[ESUserData _applyContactLimitsToFirstPartyContacts:thirdPartyContacts:groupNames:]";
    v38 = 2048;
    v39 = v33;
    id v40 = 2048;
    unsigned int v41 = v34;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "%s Processed group names: %tu (accepted=%tu)",  buf,  0x20u);
  }

  [v7 removeAllObjects];
  [v7 addObjectsFromArray:v10];
  [v8 removeAllObjects];
  [v8 addObjectsFromArray:v12];
  [v9 removeAllObjects];
  [v9 addObjectsFromArray:v11];
}

LABEL_49:
    int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
    id v5 = @"\\NT-artist";
    id v6 = @"\\appMusicArtistName-first";
    goto LABEL_63;
  }

  if ((int)a3 > 32967)
  {
    if ((int)a3 <= 42187)
    {
      if ((int)a3 > 36440)
      {
        if (a3 != 36441)
        {
          if (a3 != 38254) {
            return v3;
          }
          goto LABEL_49;
        }
      }

      else
      {
        if (a3 == 32968)
        {
          int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-playlist";
          id v6 = @"\\appPlaylistTitle-first";
          goto LABEL_63;
        }

        if (a3 != 36439) {
          return v3;
        }
      }

      int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
      id v5 = @"\\NT-appname";
      id v6 = @"\\app-first";
      goto LABEL_63;
    }

    if ((int)a3 > 42189)
    {
      if (a3 != 42190)
      {
        if (a3 == 44938)
        {
          int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-savedactivity";
          id v6 = @"\\healthActivity-first";
          goto LABEL_63;
        }

        if (a3 == 53485)
        {
          int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
          id v5 = @"\\NT-photoalbum";
          id v6 = @"\\photoAlbumName-first";
          goto LABEL_63;
        }

        return v3;
      }

      goto LABEL_33;
    }

    if (a3 != 42188)
    {
      int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
      id v5 = @"\\NT-playlist";
      id v6 = @"\\podcastTitle-first";
      goto LABEL_63;
    }

LABEL_43:
    int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
    id v5 = @"\\NT-playlist";
    id v6 = @"\\playlist-first";
    goto LABEL_63;
  }

  if ((int)a3 > 25885)
  {
    if (a3 == 25886)
    {
      int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
      id v5 = @"\\NT-payaccount";
      id v6 = @"\\paymentsAccountName-first";
      goto LABEL_63;
    }

    if (a3 == 26515)
    {
      int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
      id v5 = @"\\NT-notetitle";
      id v6 = @"\\notebookTitle-first";
      goto LABEL_63;
    }

    id v8 = 30601;
LABEL_39:
    if (a3 == v8)
    {
      int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
      id v5 = @"\\NT-action";
      id v6 = @"\\voiceCommandName-first";
      goto LABEL_63;
    }

    return v3;
  }

  if ((a3 - 18555) <= 9)
  {
    id v7 = 1 << (a3 - 123);
    if ((v7 & 0x181) == 0)
    {
      if ((v7 & 0x202) == 0) {
        goto LABEL_10;
      }
LABEL_33:
      int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
      id v5 = @"\\NT-artist";
      id v6 = @"\\artist-first";
      goto LABEL_63;
    }

    goto LABEL_43;
  }

LABEL_10:
  if (a3 == 17041)
  {
LABEL_11:
    int v4 = objc_alloc(&OBJC_CLASS___ESVocabularyLabel);
    id v5 = @"\\NT-zone";
    id v6 = @"\\zone-first";
LABEL_63:
    v3 = -[ESVocabularyLabel initWithSpeechCategoryName:tagName:](v4, "initWithSpeechCategoryName:tagName:", v5, v6);
  }

  return v3;
}

void sub_10000E044(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[ESUserData _vocabularyLabelsForFieldType:]( ESUserData,  "_vocabularyLabelsForFieldType:",  [v3 fieldType]));
  if (v4)
  {
    unsigned int v5 = [v3 dataType];
    if (v5 == 1)
    {
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repeatedStringValue", 0));
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0LL;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            +[ESUserData _addVocabWord:vocabularyLabels:toVocabularyWords:]( &OBJC_CLASS___ESUserData,  "_addVocabWord:vocabularyLabels:toVocabularyWords:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11),  v4,  *(void *)(a1 + 32));
            uint64_t v11 = (char *)v11 + 1;
          }

          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }

        while (v9);
      }
    }

    else if (!v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);
      +[ESUserData _addVocabWord:vocabularyLabels:toVocabularyWords:]( &OBJC_CLASS___ESUserData,  "_addVocabWord:vocabularyLabels:toVocabularyWords:",  v6,  v4,  *(void *)(a1 + 32));
    }
  }
}

void sub_10000E1C8(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 fieldType] == 49070)
  {
    id v3 = *(void **)(a1 + 32);
    int v4 = (void *)objc_claimAutoreleasedReturnValue([v5 stringValue]);
    [v3 addObject:v4];
  }
}

void sub_10000E22C(uint64_t a1, void *a2)
{
  id v21 = a2;
  int v3 = [v21 fieldType];
  if (v3 > 61354)
  {
    if (v3 == 61355)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
      [*(id *)(a1 + 32) setValue:v5 forKey:@"\\personFullName-first"];
      id v7 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponentsFormatter);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSPersonNameComponentsFormatter personNameComponentsFromString:]( v7,  "personNameComponentsFromString:",  v5));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 givenName]);
      id v10 = [v9 length];

      if (v10)
      {
        uint64_t v11 = *(void **)(a1 + 32);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 givenName]);
        [v11 setValue:v12 forKey:@"\\appcontact-first"];
      }

      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 middleName]);
      id v14 = [v13 length];

      if (v14)
      {
        __int128 v15 = *(void **)(a1 + 32);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 middleName]);
        [v15 setValue:v16 forKey:@"\\appcontact-middle"];
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 familyName]);
      id v18 = [v17 length];

      if (v18)
      {
        uint64_t v19 = *(void **)(a1 + 32);
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v8 familyName]);
        [v19 setValue:v20 forKey:@"\\appcontact-last"];
      }
    }

    else
    {
      if (v3 == 63372)
      {
        int v4 = *(void **)(a1 + 32);
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
        id v6 = @"\\smsGroupName-first";
      }

      else
      {
        if (v3 != 61513) {
          goto LABEL_25;
        }
LABEL_7:
        int v4 = *(void **)(a1 + 32);
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
        id v6 = @"\\contact-first";
      }

LABEL_23:
      [v4 setValue:v5 forKey:v6];
    }

    goto LABEL_25;
  }

  switch(v3)
  {
    case 19679:
      goto LABEL_7;
    case 19680:
      int v4 = *(void **)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
      id v6 = @"\\contact-middle";
      goto LABEL_23;
    case 19681:
      int v4 = *(void **)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
      id v6 = @"\\contact-last";
      goto LABEL_23;
    case 19683:
      int v4 = *(void **)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
      id v6 = @"\\contact-nickname";
      goto LABEL_23;
    case 19693:
      int v4 = *(void **)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
      id v6 = @"\\company-first";
      goto LABEL_23;
    case 19696:
      int v4 = *(void **)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
      id v6 = @"\\contact-first-phonetic";
      goto LABEL_23;
    case 19697:
      int v4 = *(void **)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
      id v6 = @"\\contact-middle-phonetic";
      goto LABEL_23;
    case 19698:
      int v4 = *(void **)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
      id v6 = @"\\contact-last-phonetic";
      goto LABEL_23;
    case 19699:
      int v4 = *(void **)(a1 + 32);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
      id v6 = @"\\company-first-phonetic";
      goto LABEL_23;
    default:
      break;
  }

LABEL_25:
}

void sub_10000EA5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id a28)
{
}

LABEL_32:
      double v20 = 0LL;
      goto LABEL_33;
    }
  }

  else {
    __int128 v12 = 0;
  }
  __int128 v13 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    id v26 = @"NO";
    if (v12) {
      id v26 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    v45 = "-[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:]";
    id v46 = 2112;
    uint64_t v47 = v26;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s On-Device ASR: tvOS: Requires spelling model: %@",  buf,  0x16u);
    if (v12) {
      goto LABEL_10;
    }
LABEL_20:
    if (-[ESAssetManager isTrialAssetDeliveryEnabled](self, "isTrialAssetDeliveryEnabled"))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleIdentifier]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue( [v11 installedAssetWithConfig:v9 regionId:0 shouldSubscribe:v7 subscriberId:v28 expiration:0]);

      if (v18)
      {
        uint64_t v29 = (void *)qword_100049580;
        if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = v29;
          id v31 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 language]);
          id v32 = SFEntitledAssetTypeToString([v9 assetType]);
          id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          *(_DWORD *)buf = 136315906;
          v45 = "-[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:]";
          id v46 = 2114;
          uint64_t v47 = v31;
          v48 = 2114;
          v49 = v33;
          uint64_t v50 = 2114;
          id v51 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s Using ASR Trial assets for language: %{public}@, asset type: %{public}@, at path: %{public}@",  buf,  0x2Au);
        }

        id v34 = objc_claimAutoreleasedReturnValue([v11 modelQualityTypeStatusStringWithConfig:v9]);
        id v35 = (void *)v34;
        id v36 = &stru_1000415D8;
        if (v34) {
          id v36 = (__CFString *)v34;
        }
        id v37 = v36;

        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  1LL,  @"quasarModelPath",  @"type",  @"trial",  v18,  v37));
        v43[2] = v38;
        double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  &v42,  3LL));

        goto LABEL_27;
      }
    }

    v39 = SFEntitledAssetTypeToString([v9 assetType]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v39);
    id v40 = qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v45 = "-[ESAssetManager installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:]";
      id v46 = 2114;
      uint64_t v47 = v10;
      v48 = 2114;
      v49 = v11;
      __int128 v22 = "%s No assets available for language: %{public}@, asset type: %{public}@";
      __int128 v23 = (os_log_s *)v40;
      __int128 v24 = OS_LOG_TYPE_DEFAULT;
      __int128 v25 = 32;
      goto LABEL_31;
    }

    goto LABEL_32;
  }

  if (!v12) {
    goto LABEL_20;
  }
LABEL_10:
  id v14 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode(v10);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v11 = v15;
  if (v15)
  {
    __int16 v16 = v15;

    id v10 = v16;
  }

  id v52 = @"quasarModelPath";
  id v17 = objc_claimAutoreleasedReturnValue([@"/System/Library/SpellingKeyboardSpeechModels" stringByAppendingPathComponent:v10]);
  id v18 = (void *)v17;
  uint64_t v19 = &stru_1000415D8;
  if (v17) {
    uint64_t v19 = (const __CFString *)v17;
  }
  uint64_t v53 = v19;
  double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
LABEL_27:

LABEL_33:
  return v20;
}

void sub_10000F88C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    id v9 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[ESAssetManager validateHammerConfigFile:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Exception thrown while reading hammer config",  (uint8_t *)&a9,  0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x10000F854LL);
  }

  _Unwind_Resume(a1);
}

void sub_10000FEC8( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    id v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[ESAssetManager installedGeoLMRegionSpecificAssetForLanguage:regionId:mainAssetConfig:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s GeoLM: Exception thrown while reading geo-config json",  (uint8_t *)&a9,  0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x10000FDC8LL);
  }

  _Unwind_Resume(a1);
}

void sub_1000100F4( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    id v9 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[ESAssetManager _geoLMCompatibleWithMainAsset:geoAssetConfig:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s GeoLM: Exception thrown while reading json configs",  (uint8_t *)&a9,  0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100010020LL);
  }

  _Unwind_Resume(a1);
}

void sub_100010244(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CESRGeoLMRegionIDCache sharedInstance](&OBJC_CLASS___CESRGeoLMRegionIDCache, "sharedInstance"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v2 purgeUnusedGeoLMRegionIdFromCacheForLanguage:*(void *)(a1 + 32)]);

  if (v6)
  {
    int v3 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  *(void *)(a1 + 32),  5LL);
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    +[SFEntitledAssetManager unsubscribeFromAssetWithConfig:regionId:subscriberId:]( &OBJC_CLASS___SFEntitledAssetManager,  "unsubscribeFromAssetWithConfig:regionId:subscriberId:",  v3,  v6,  v5);
  }
}

void sub_100010308(id a1, NSString *a2, NSString *a3, BOOL *a4)
{
  id v7 = a2;
  if (AFOfflineDictationStatusStringIsInstalled(a3))
  {
    id v5 = -[SFEntitledAssetConfig initWithLanguage:assetType:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:assetType:",  v7,  3LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager subscriberIdForDictationAssets]( &OBJC_CLASS___SFEntitledAssetManager,  "subscriberIdForDictationAssets"));
    +[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:]( &OBJC_CLASS___SFEntitledAssetManager,  "subscribeToAssetWithConfig:regionId:subscriberId:expiration:",  v5,  0LL,  v6,  0LL);
  }
}

void sub_1000103A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager unsubscribeFromAssetsWithAssetType:exceptLanguages:subscriberId:]( &OBJC_CLASS___SFEntitledAssetManager,  "unsubscribeFromAssetsWithAssetType:exceptLanguages:subscriberId:",  v2,  v3,  v5));

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 == 3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CESRGeoLMRegionIDCache sharedInstance](&OBJC_CLASS___CESRGeoLMRegionIDCache, "sharedInstance"));
    [v7 purgeUserDefaultsGeoLMAssetsInfoDictForLanguages:v8];

    uint64_t v6 = *(void *)(a1 + 48);
  }

  [*(id *)(a1 + 40) _invalidateInstallationStatusCacheForAssetType:v6];
}

uint64_t sub_100010464(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100010474(uint64_t a1)
{
}

void sub_10001047C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if ((!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) || *(_BYTE *)(a1 + 56) || *(_BYTE *)(a1 + 57))
    && [*(id *)(a1 + 32) isTrialAssetDeliveryEnabled])
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___SFEntitledAssetManager);
    int v8 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v9 = *(void *)(a1 + 48);
    id v14 = v7;
    if (*(_BYTE *)(a1 + 57))
    {
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v14 detailedInstallationStatusForLanguagesWithAssetType:v9 subscriberId:v3]);
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 installationStatusForLanguagesWithAssetType:v9]);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v10);
    if (v8)
    {

      id v10 = v2;
    }

    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    __int128 v12 = *(void **)(*(void *)(a1 + 32) + 16LL);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
    [v12 setObject:v11 forKeyedSubscript:v13];
  }

void sub_100010608(id a1, NSString *a2, NSNumber *a3, BOOL *a4)
{
  uint64_t v5 = a2;
  int v6 = -[NSNumber intValue](a3, "intValue");
  if (v6 != -1)
  {
    uint32_t v7 = notify_cancel(v6);
    if (v7)
    {
      uint32_t v8 = v7;
      uint64_t v9 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315650;
        uint64_t v11 = "-[ESAssetManager dealloc]_block_invoke";
        __int16 v12 = 2112;
        __int128 v13 = v5;
        __int16 v14 = 1024;
        uint32_t v15 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Failed to cancel notification %@: %u",  (uint8_t *)&v10,  0x1Cu);
      }
    }
  }
}

void sub_1000106FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateInstallationStatusCacheForAssetType:3];
}

void sub_10001076C(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___ESAssetManager);
  uint64_t v2 = (void *)qword_100049540;
  qword_100049540 = (uint64_t)v1;
}

void sub_1000134D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_10001381C(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] == (id)2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
    uint64_t v5 = [v4 unsignedLongLongValue];

    int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:1]);
    uint32_t v7 = [v6 unsignedLongLongValue];

    if (*(void *)(a1[4] + 488LL))
    {
      os_signpost_id_t v8 = os_signpost_id_generate(AFSiriLogContextSpeech);
      uint64_t v9 = (os_log_s *)AFSiriLogContextSpeech;
      int v10 = v9;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        uint64_t v11 = (os_log_s *)AFSiriLogContextSpeech;
      }

      else
      {
        if (os_signpost_enabled(v9))
        {
          int v13 = 134349056;
          __int16 v14 = v5;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "ES: ITN Process",  "%{public, signpost.description:begin_time}llu",  (uint8_t *)&v13,  0xCu);
        }

        uint64_t v11 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_signpost_enabled(v11))
        {
          int v13 = 134349056;
          __int16 v14 = v7;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  v8,  "ES: ITN Process",  "%{public, signpost.description:end_time}llu",  (uint8_t *)&v13,  0xCu);
        }
      }
    }

    +[CESRUtilities hostTimeToSeconds:](&OBJC_CLASS___CESRUtilities, "hostTimeToSeconds:", v7 - v5);
    *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = *(double *)(*(void *)(a1[5] + 8LL) + 24LL) + v12;
    ++*(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL);
  }
}

void sub_100013A08(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 count] == (id)2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
    uint64_t v5 = [v4 unsignedLongLongValue];

    int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:1]);
    uint32_t v7 = [v6 unsignedLongLongValue];

    if (*(void *)(a1[4] + 488LL))
    {
      os_signpost_id_t v8 = os_signpost_id_generate(AFSiriLogContextSpeech);
      uint64_t v9 = (os_log_s *)AFSiriLogContextSpeech;
      int v10 = v9;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        uint64_t v11 = (os_log_s *)AFSiriLogContextSpeech;
      }

      else
      {
        if (os_signpost_enabled(v9))
        {
          int v13 = 134349056;
          __int16 v14 = v5;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "ES: Secondary Pass Process",  "%{public, signpost.description:begin_time}llu",  (uint8_t *)&v13,  0xCu);
        }

        uint64_t v11 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_signpost_enabled(v11))
        {
          int v13 = 134349056;
          __int16 v14 = v7;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  v8,  "ES: Secondary Pass Process",  "%{public, signpost.description:end_time}llu",  (uint8_t *)&v13,  0xCu);
        }
      }
    }

    +[CESRUtilities hostTimeToSeconds:](&OBJC_CLASS___CESRUtilities, "hostTimeToSeconds:", v7 - v5);
    *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = *(double *)(*(void *)(a1[5] + 8LL) + 24LL) + v12;
    *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = (2 * *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL)) | 1;
  }
}

void sub_100013C00(uint64_t a1)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:1]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:0]);
  [v2 floatValue];
  float v4 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:0]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
  [v6 floatValue];
  *(double *)&qword_100049568 = (float)(v4 - v7);
}

void sub_100013D64(uint64_t a1)
{
  os_log_t v1 = -[ESProfiler initWithESSelfHelper:signpostHelper:]( objc_alloc(&OBJC_CLASS___ESProfiler),  "initWithESSelfHelper:signpostHelper:",  0LL,  *(void *)(a1 + 32));
  uint64_t v2 = (void *)qword_100049550;
  qword_100049550 = (uint64_t)v1;
}

void sub_1000144DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

LABEL_71:
          v69 = (void *)objc_claimAutoreleasedReturnValue([v6 modelOverrideURL]);
          v70 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
          v71 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities recognizerSourceForTask:]( &OBJC_CLASS___CESRUtilities,  "recognizerSourceForTask:",  v70));
          isHighPriority = self->_isHighPriority;
          v379 = &off_100043068;
          v378 = 0LL;
          BYTE1(v301) = isHighPriority;
          LOBYTE(v301) = 0;
          v73 = objc_claimAutoreleasedReturnValue( +[ESConnection _speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:]( &OBJC_CLASS___ESConnection,  "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:re questSource:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:",  v339,  obj,  1LL,  v341,  v69,  0LL,  v71,  v301,  &v379,  &v378));
          v74 = v379;
          v75 = v378;
          v76 = (void *)qword_1000495B8;
          qword_1000495B8 = v73;

          if (!qword_1000495C8)
          {
            v77 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
            v78 = (void *)qword_1000495C8;
            qword_1000495C8 = v77;
          }

          v79 = (void *)qword_1000495B8;
          if (qword_1000495B8)
          {
            v80 = objc_storeWeak(location, (id)qword_1000495B8);
            v81 = objc_claimAutoreleasedReturnValue([v79 modelInfo]);

            [(id)qword_1000495C8 addObject:qword_1000495B8];
            v82 = objc_claimAutoreleasedReturnValue([v6 language]);
            v83 = (void *)qword_1000495B0;
            qword_1000495B0 = v82;

            objc_storeStrong((id *)&qword_1000495C0, obj);
            objc_storeStrong((id *)&qword_1000495D0, v335);
            byte_1000495D8 = [v74 BOOLValue];
            v340 = (void *)v81;
          }

          v333 = 1;
LABEL_76:
          if (qword_1000495B8) {
            +[ESConnection _scheduleCooldownTimer](&OBJC_CLASS___ESConnection, "_scheduleCooldownTimer");
          }
          v84 = objc_loadWeakRetained(location);
          v85 = v84 == 0LL;

          if (v85)
          {
            if (v347) {
              v347[2](v347, 0LL, v75);
            }
            -[ESConnection startRequestActivityWithCompletion:](self, "startRequestActivityWithCompletion:", 0LL);
            goto LABEL_249;
          }

          v86 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
          v87 = v340;
          v88 = v86;
          v89 = (void *)objc_claimAutoreleasedReturnValue([v87 tasks]);
          v90 = v88;
          if ([v89 containsObject:v90])
          {
            v91 = (NSString *)v90;
          }

          else
          {
            if (![v90 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation]
              || (v95 = (void *)CoreEmbeddedSpeechRecognizerTaskDictation,
                  ![v89 containsObject:CoreEmbeddedSpeechRecognizerTaskDictation]))
            {
              *(void *)v386 = NSLocalizedFailureReasonErrorKey;
              v97 = (void *)objc_claimAutoreleasedReturnValue([v87 language]);
              v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Task %@ not available for %@, supported tasks are %@",  v90,  v97,  v89));
              *(void *)buf = v98;
              v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v386,  1LL));
              v93 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1113LL,  v99));

              v92 = 0LL;
              v94 = (NSString *)v90;
LABEL_89:

              v328 = v93;
              taskToUse = self->_taskToUse;
              self->_taskToUse = v92;

              if (!self->_taskToUse)
              {
                if (v347) {
                  v347[2](v347, 0LL, v328);
                }
                -[ESConnection startRequestActivityWithCompletion:](self, "startRequestActivityWithCompletion:", 0LL);
                goto LABEL_248;
              }

              v101 = objc_alloc(&OBJC_CLASS___CESRModelProperties);
              v102 = (void *)objc_claimAutoreleasedReturnValue([v87 version]);
              v103 = objc_loadWeakRetained(location);
              v104 = (void *)objc_claimAutoreleasedReturnValue([v103 modelType]);
              v105 = objc_loadWeakRetained(location);
              v106 = (void *)objc_claimAutoreleasedReturnValue([v105 modelRoot]);
              v329 = [v101 initWithModelVersion:v102 modelType:v104 modelRoot:v106];

              v107 = (void *)objc_claimAutoreleasedReturnValue(-[ESConnection _delegate](self, "_delegate"));
              [v107 speechServiceDidSelectRecognitionModelWithModelProperties:v329];

              *(void *)buf = 0LL;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000LL;
              v392 = sub_10001FD04;
              *(void *)v393 = sub_10001FD14;
              *(void *)&v393[8] = 0LL;
              v375[0] = _NSConcreteStackBlock;
              v375[1] = 3221225472LL;
              v375[2] = sub_100021624;
              v375[3] = &unk_100040D48;
              v377 = buf;
              v314 = v339;
              v376 = v314;
              v311 = objc_retainBlock(v375);
              v108 = objc_alloc(&OBJC_CLASS___ESSelfHelper);
              v109 = self->_taskToUse;
              LODWORD(v106) = self->_isSpeechAPIRequest;
              v110 = (void *)objc_claimAutoreleasedReturnValue([v6 requestIdentifier]);
              v111 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
              v112 = (void *)objc_claimAutoreleasedReturnValue([v6 asrId]);
              v318 = -[ESSelfHelper initWithTask:isSpeechAPIRequest:requestId:language:asrId:]( v108,  "initWithTask:isSpeechAPIRequest:requestId:language:asrId:",  v109,  (_DWORD)v106 != 0,  v110,  v111,  v112);

              v342 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
              [v342 setESSelfHelper:v318];
              v331 = v325 | v330;
              if (v342)
              {
                v113 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager sharedInstance]( &OBJC_CLASS___SFEntitledAssetManager,  "sharedInstance"));
                v114 = (void *)objc_claimAutoreleasedReturnValue([v113 modelQualityTypeStatusStringWithConfig:v314]);

                if (v114) {
                  v312 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v114 isEqualToString:@"HQ"]));
                }
                else {
                  v312 = 0LL;
                }
                v115 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
                v326 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities speechProfileDateLastModifiedForLanguage:]( &OBJC_CLASS___CESRUtilities,  "speechProfileDateLastModifiedForLanguage:",  v115));

                if (v326)
                {
                  [v326 timeIntervalSinceNow];
                  v309 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  fabs(v116)));
                }

                else
                {
                  v309 = 0LL;
                }

                v117 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
                v118 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
                v316 = (void *)objc_claimAutoreleasedReturnValue([v117 installedHammerConfigFileForLanguage:v118]);

                v307 = v114;
                v119 = [[_EARSpeechModelInfo alloc] initWithConfig:v316];
                [v342 logPendingPreheatContextEvents:qword_1000495F0];
                +[ESConnection _clearPendingProfilerEvents](&OBJC_CLASS___ESConnection, "_clearPendingProfilerEvents");
                v120 = self->_taskToUse;
                v121 = (void *)objc_claimAutoreleasedReturnValue([v87 language]);
                v122 = (void *)objc_claimAutoreleasedReturnValue([v87 version]);
                v123 = (void *)objc_claimAutoreleasedReturnValue([v119 version]);
                v124 = qword_1000495C0;
                v125 = byte_1000495D8;
                v126 = (void *)objc_claimAutoreleasedReturnValue([v6 dictationUIInteractionIdentifier]);
                LOBYTE(v300) = v125 != 0;
                [v342 logRequestStartedOrChangedWithTask:v120 modelLocale:v121 modelVersion:v122 isHighQualityAsset:v312 hammerVersion:v123 geoLangua geModelRegion:v124 geoLanguageModelLoaded:v300 speechProfileAgeInSec:v309 dictationUIInteractionId:v126 portraitExperiment VariantName:0 applicationName:*group powerLogEvent:@"startSpeechRecognitionWithParameters"];

                v127 = (void *)objc_claimAutoreleasedReturnValue([v342 selfHelper]);
                [v127 setContinuousListeningEnabled:v331];

                [v342 logInitializationStartedOrChangedWithTimeInTicks:v346 cachedRecognizerExisted:v344 != 0 newRecognizerCreated:v333];
              }

              v128 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
              v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
              [v342 logInitializationEndedWithTimeInTicks:v129 isSpeechRecognizerCreated:v333];

              if (qword_1000495A0)
              {
                objc_msgSend(v342, "logESStartWithTimeInTicks:");
                v130 = (void *)qword_1000495A0;
                qword_1000495A0 = 0LL;
              }

              v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
              [v131 systemUptime];
              self->_recognitionBeginTime = v132;

              if ([v6 censorSpeech])
              {
                v133 = ((uint64_t (*)(void))v311[2])();
                v317 = (id)objc_claimAutoreleasedReturnValue(v133);
              }

              else
              {
                v317 = 0LL;
              }

              v134 = objc_loadWeakRetained(location);
              [v134 setRecognitionReplacements:v317];

              if (-[NSString isEqualToString:]( self->_taskToUse,  "isEqualToString:",  CoreEmbeddedSpeechRecognizerTaskVoiceMail))
              {
                v135 = v314;
                v136 = objc_opt_class(&OBJC_CLASS___NSNumber);
                v137 = sub_1000216B4(v135, @"voicemail_confidence_subtraction.json", v136);
                v138 = (id)objc_claimAutoreleasedReturnValue(v137);

                if (!v138)
                {
                  v139 = ((uint64_t (*)(void))v311[2])();
                  v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
                  if (v140)
                  {
                    v373[0] = _NSConcreteStackBlock;
                    v373[1] = 3221225472LL;
                    v373[2] = sub_100021AE0;
                    v373[3] = &unk_100040D70;
                    v141 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                    v374 = v141;
                    [v140 enumerateKeysAndObjectsUsingBlock:v373];
                    v138 = -[NSMutableDictionary copy](v141, "copy");
                  }

                  else
                  {
                    v138 = 0LL;
                  }
                }

                v149 = objc_loadWeakRetained(location);
                [v149 setRecognitionConfidenceSubtraction:v138];
              }

              if ([v6 disableDeliveringAsrFeatures])
              {
                [v6 endpointStart];
                if (v150 > 0.0)
                {
                  v151 = (os_log_s *)AFSiriLogContextConnection;
                  if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v386 = 136315138;
                    *(void *)&v386[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                    _os_log_error_impl( (void *)&_mh_execute_header,  v151,  OS_LOG_TYPE_ERROR,  "%s EndpointStart > 0 but asr features delivery is disabled!",  v386,  0xCu);
                  }
                }
              }

              self->_disableDeliveringAsrFeatures = [v6 disableDeliveringAsrFeatures];
              [v6 endpointStart];
              if (v152 >= 0.0)
              {
                v153 = objc_loadWeakRetained(location);
                [v6 endpointStart];
                objc_msgSend(v153, "setEndpointStart:");
              }

              else
              {
                v153 = AFSiriLogContextConnection;
                if (os_log_type_enabled((os_log_t)v153, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v386 = 136315138;
                  *(void *)&v386[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v153,  OS_LOG_TYPE_ERROR,  "%s EndpointStart < 0",  v386,  0xCu);
                }
              }

              if (!-[NSString isEqualToString:]( self->_taskToUse,  "isEqualToString:",  CoreEmbeddedSpeechRecognizerTaskBeto)
                && !-[NSString isEqualToString:]( self->_taskToUse,  "isEqualToString:",  CoreEmbeddedSpeechRecognizerTaskBetoDictation)
                && !-[NSString isEqualToString:]( self->_taskToUse,  "isEqualToString:",  CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging))
              {
LABEL_148:
                v166 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
                v167 = (void *)objc_claimAutoreleasedReturnValue(v166);
                [v342 logAotLmeStartedOrChangedWithTimeInTicks:v167];

                v168 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
                LODWORD(v167) = v168 == 0LL;

                if ((_DWORD)v167)
                {
                  if (qword_1000495E0)
                  {
                    v170 = (id)qword_1000495E0;
                    v171 = (NSMutableDictionary *)qword_1000495E0;
                    qword_1000495E0 = (uint64_t)v170;
                  }

                  else
                  {
                    v171 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                    objc_storeStrong((id *)&qword_1000495E0, v171);
                  }

                  v172 = qword_1000495E0;
                  v173 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
                  +[CESRUtilities loadSpeechProfiles:language:]( &OBJC_CLASS___CESRUtilities,  "loadSpeechProfiles:language:",  v172,  v173);

                  v169 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  v367 = 0u;
                  v368 = 0u;
                  v365 = 0u;
                  v366 = 0u;
                  v174 = (id)qword_1000495E0;
                  v175 = [v174 countByEnumeratingWithState:&v365 objects:v389 count:16];
                  if (v175)
                  {
                    v176 = *(void *)v366;
                    do
                    {
                      for (i = 0LL; i != v175; i = (char *)i + 1)
                      {
                        if (*(void *)v366 != v176) {
                          objc_enumerationMutation(v174);
                        }
                        v178 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_1000495E0 objectForKeyedSubscript:*(void *)(*((void *)&v365 + 1) + 8 * (void)i)]);
                        -[NSMutableArray addObject:](v169, "addObject:", v178);
                      }

                      v175 = [v174 countByEnumeratingWithState:&v365 objects:v389 count:16];
                    }

                    while (v175);
                  }

                  if (-[NSMutableArray count](v169, "count"))
                  {
                    v179 = objc_loadWeakRetained(location);
                    [v179 setUserProfileData:0];
                  }
                }

                else
                {
                  v169 = 0LL;
                }

                v180 = (os_log_s *)AFSiriLogContextSpeech;
                if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
                {
                  v291 = -[NSMutableArray count](v169, "count");
                  v292 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
                  v293 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_userIdMask, "allKeys"));
                  v294 = [v293 count];
                  *(_DWORD *)v386 = 136315906;
                  *(void *)&v386[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                  *(_WORD *)&v386[12] = 2048;
                  *(void *)&v386[14] = v291;
                  *(_WORD *)&v386[22] = 1024;
                  LODWORD(v387) = v292 != 0LL;
                  WORD2(v387) = 2048;
                  *(void *)((char *)&v387 + 6) = v294;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v180,  OS_LOG_TYPE_DEBUG,  "%s Setting new profile: %lu, old profile: %d, muxIds count: %lu",  v386,  0x26u);
                }

                v181 = objc_loadWeakRetained(location);
                v182 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_userIdMask, "allKeys"));
                v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v182));
                [v181 setUserProfiles:v169 multiUserIds:v183];

                v184 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
                if (v184)
                {
                  v185 = objc_loadWeakRetained(location);
                  v186 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
                  [v185 setUserProfileData:v186];
                }

                v187 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
                v188 = (void *)objc_claimAutoreleasedReturnValue(v187);
                [v342 logAotLmeEndedWithTimeInTicks:v188];

                v189 = dispatch_time(0LL, 500000000LL);
                *(void *)v386 = 0LL;
                *(void *)&v386[8] = v386;
                *(void *)&v386[16] = 0x3032000000LL;
                *(void *)&v387 = sub_10001FD04;
                *((void *)&v387 + 1) = sub_10001FD14;
                v388 = 0LL;
                v334 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                v308 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
                [v308 systemUptime];
                v191 = v190;
                v192 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
                v310 = (void *)objc_claimAutoreleasedReturnValue(v192);
                v359 = 0LL;
                v360 = &v359;
                v361 = 0x3032000000LL;
                v362 = sub_10001FD04;
                v363 = sub_10001FD14;
                v364 = 0LL;
                if ([(id)qword_1000495A8 length])
                {
                  v193 = objc_alloc(&OBJC_CLASS___ESContextualData);
                  v194 = qword_1000495A8;
                  v195 = self->_taskToUse;
                  v196 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 applicationName]);
                  v327 = -[ESContextualData initWithConfiguration:taskName:applicationName:]( v193,  "initWithConfiguration:taskName:applicationName:",  v194,  v195,  v196);
                }

                else
                {
                  v196 = (os_log_s *)AFSiriLogContextSpeech;
                  if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v380 = 136315394;
                    v381 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                    v382 = 2112;
                    v383 = 0.0;
                    _os_log_impl( (void *)&_mh_execute_header,  v196,  OS_LOG_TYPE_INFO,  "%s Failed to get model root, error: %@",  v380,  0x16u);
                  }

                  v327 = 0LL;
                }

                v197 = (void *)objc_claimAutoreleasedReturnValue([v6 jitGrammar]);
                if (v197)
                {
                  v198 = (void *)objc_claimAutoreleasedReturnValue([v6 jitGrammar]);
                  -[NSMutableArray addObjectsFromArray:](v334, "addObjectsFromArray:", v198);
                }

                v199 = (unint64_t)-[NSMutableArray count](v334, "count") | (unint64_t)v327;
                v200 = v199 != 0;
                if (v199)
                {
                  groupa = dispatch_group_create();
                  if (self->_isHighPriority)
                  {
                    v201 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
                    v202 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v201);
                  }

                  else
                  {
                    v202 = 0LL;
                  }

                  v203 = dispatch_queue_create("jitDataProcessing", v202);
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472LL;
                  block[2] = sub_100021AF4;
                  block[3] = &unk_100040D98;
                  v351 = v327;
                  v352 = self;
                  v353 = v334;
                  v354 = v314;
                  v355 = v6;
                  v356 = v341;
                  v357 = v386;
                  v358 = &v359;
                  dispatch_group_async(groupa, v203, block);
                }

                else
                {
                  groupa = 0LL;
                }

                v204 = (void *)objc_claimAutoreleasedReturnValue([v6 inputOrigin]);

                if (v204)
                {
                  v205 = objc_loadWeakRetained(location);
                  v206 = (void *)objc_claimAutoreleasedReturnValue([v6 inputOrigin]);
                  [v205 setInputOrigin:v206];

                  v207 = (os_log_s *)AFSiriLogContextSpeech;
                  if (os_log_type_enabled(v207, OS_LOG_TYPE_DEBUG))
                  {
                    v299 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v6 inputOrigin]));
                    *(_DWORD *)v380 = 136315394;
                    v381 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                    v382 = 2112;
                    v383 = v299;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v207,  OS_LOG_TYPE_DEBUG,  "%s Set inputOrigin to: %@",  v380,  0x16u);
                  }
                }

                if (!self->_localMetrics)
                {
                  v208 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  localMetrics = self->_localMetrics;
                  self->_localMetrics = v208;
                }

                v315 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                v210 = objc_loadWeakRetained(location);
                [v210 setExtraLmList:v315];

                v211 = objc_loadWeakRetained(location);
                [v211 setDetectUtterances:1];

                v212 = objc_loadWeakRetained(location);
                objc_msgSend(v212, "setConcatenateUtterances:", objc_msgSend(v6, "detectUtterances") ^ 1);

                if ([v6 deliverEagerPackage])
                {
                  v213 = objc_loadWeakRetained(location);
                  [v213 setDetectUtterances:0];

                  v214 = objc_loadWeakRetained(location);
                  [v214 setConcatenateUtterances:0];

                  v215 = (os_log_s *)AFSiriLogContextSpeech;
                  if (os_log_type_enabled(v215, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v380 = 136315138;
                    v381 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v215,  OS_LOG_TYPE_DEBUG,  "%s Switching off UC/UD for this request",  v380,  0xCu);
                  }
                }

                v216 = objc_loadWeakRetained(location);
                [v6 maximumRecognitionDuration];
                objc_msgSend(v216, "setMaximumRecognitionDuration:");

                v217 = objc_loadWeakRetained(location);
                objc_msgSend(v217, "setFarField:", objc_msgSend(v6, "farField"));

                v218 = objc_loadWeakRetained(location);
                [v218 setAllowUtteranceDelay:v331];

                v219 = objc_loadWeakRetained(location);
                [v219 setFormatAcrossUtterances:v321 | v323];

                v220 = objc_loadWeakRetained(location);
                objc_msgSend( v220,  "setDisableAutoPunctuation:",  objc_msgSend(v6, "enableAutoPunctuation") ^ 1);

                v221 = objc_loadWeakRetained(location);
                objc_msgSend(v221, "setEnableVoiceCommands:", objc_msgSend(v6, "enableVoiceCommands"));

                else {
                  v222 = (uint64_t)[v6 shouldGenerateVoiceCommandCandidates];
                }
                v223 = objc_loadWeakRetained(location);
                [v223 setShouldGenerateVoiceCommandCandidates:v222];

                v224 = [v6 narrowband];
                v225 = 16000LL;
                if (v224) {
                  v225 = 8000LL;
                }
                self->_samplingRate = v225;
                v226 = (void *)objc_claimAutoreleasedReturnValue([v6 codec]);
                if (v226)
                {
                  v227 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v6 codec]);
                }

                else
                {
                  v227 = &stru_1000415D8;
                }

                v228 = objc_loadWeakRetained(location);
                v322 = (void *)objc_claimAutoreleasedReturnValue([v228 activeConfiguration]);

                v345 = [v322 copy];
                v229 = (void *)objc_claimAutoreleasedReturnValue([v345 farFieldFilter]);
                LOBYTE(v22_Block_object_dispose(&STACK[0x200], 8) = v229 == 0LL;

                if ((v228 & 1) == 0)
                {
                  v230 = (void *)objc_claimAutoreleasedReturnValue([v345 farFieldFilter]);
                  v231 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 farField]));
                  v232 = (void *)objc_claimAutoreleasedReturnValue([v230 setByAddingObject:v231]);
                  [v345 setFarFieldFilter:v232];
                }

                v233 = (void *)objc_claimAutoreleasedReturnValue([v345 samplingRateFilter]);
                v234 = v233 == 0LL;

                if (!v234)
                {
                  v235 = (void *)objc_claimAutoreleasedReturnValue([v345 samplingRateFilter]);
                  v236 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_samplingRate));
                  v237 = (void *)objc_claimAutoreleasedReturnValue([v235 setByAddingObject:v236]);
                  [v345 setSamplingRateFilter:v237];
                }

                v238 = (void *)objc_claimAutoreleasedReturnValue([v345 taskTypeFilter]);
                v239 = v238 == 0LL;

                if (!v239)
                {
                  v240 = (void *)objc_claimAutoreleasedReturnValue([v345 taskTypeFilter]);
                  v241 = (void *)objc_claimAutoreleasedReturnValue([v240 setByAddingObject:self->_taskToUse]);
                  [v345 setTaskTypeFilter:v241];
                }

                [v345 setDeviceIdFilter:0];
                [v345 setAneContextFilter:0];
                [v345 setCpuContextFilter:0];
                [v345 setGpuContextFilter:0];
                v242 = (os_log_s *)AFSiriLogContextSpeech;
                if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
                {
                  v295 = sub_100021E7C(v322);
                  v296 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue(v295));
                  v297 = sub_100021E7C(v345);
                  v298 = (id)objc_claimAutoreleasedReturnValue(v297);
                  *(_DWORD *)v380 = 136315650;
                  v381 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                  v382 = 2112;
                  v383 = v296;
                  v384 = 2112;
                  v385 = v298;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v242,  OS_LOG_TYPE_DEBUG,  "%s Changing active configuration from \n%@ to \n%@",  v380,  0x20u);
                }

                v243 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
                v244 = (void *)objc_claimAutoreleasedReturnValue(v243);
                [v342 logActiveConfigUpdateStartedOrChangedWithTimeInTicks:v244];

                v245 = objc_loadWeakRetained(location);
                [v245 setActiveConfiguration:v345];

                v246 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
                v247 = (void *)objc_claimAutoreleasedReturnValue(v246);
                [v342 logActiveConfigUpdateEndedWithTimeInTicks:v247];

                v248 = objc_alloc_init(&OBJC_CLASS____EARSpeakerCodeWriter);
                speakerCodeWriter = self->_speakerCodeWriter;
                self->_speakerCodeWriter = v248;

                if (groupa) {
                  v250 = v200;
                }
                else {
                  v250 = 0;
                }
                if (v250
                  && !dispatch_group_wait(groupa, v189)
                  && (v266 = *(void **)(*(void *)&v386[8] + 40LL)) != 0LL)
                {
                  v313 = v266;
                  v267 = (os_log_s *)AFSiriLogContextSpeech;
                  if (os_log_type_enabled(v267, OS_LOG_TYPE_INFO))
                  {
                    v268 = COERCE_DOUBLE(-[NSMutableArray count](v334, "count"));
                    v269 = [*(id *)(*(void *)&v386[8] + 40) length];
                    *(_DWORD *)v380 = 136315650;
                    v381 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                    v382 = 2048;
                    v383 = v268;
                    v384 = 2048;
                    v385 = v269;
                    _os_log_impl( (void *)&_mh_execute_header,  v267,  OS_LOG_TYPE_INFO,  "%s Injected %lu jit strings or contextual data to recognizer, length: %lu",  v380,  0x20u);
                  }

                  if (v360[5])
                  {
                    [v342 logJitLmeStartedOrChangedWithTimeInTicks:v310];
                    [v342 logJitLmeEndedAndEndedTier1WithDialogContext:v334 timeInTicks:v360[5]];
                    +[CESRUtilities hostTimeToSeconds:]( CESRUtilities,  "hostTimeToSeconds:",  [(id)v360[5] unsignedLongLongValue]);
                    v271 = v270;
                    v272 = (os_log_s *)AFSiriLogContextSpeech;
                    if (os_log_type_enabled(v272, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v380 = 136315394;
                      v381 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                      v382 = 2050;
                      v383 = v271 - v191;
                      _os_log_impl( (void *)&_mh_execute_header,  v272,  OS_LOG_TYPE_INFO,  "%s Duration spent in jit processing on critical path = %{public}lfs",  v380,  0x16u);
                    }
                  }
                }

                else
                {
                  v313 = 0LL;
                }

                v251 = objc_loadWeakRetained(location);
                [v251 setJitProfileData:v313];

                v252 = objc_loadWeakRetained(location);
                v253 = self->_speakerCodeWriter;
                v254 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
                v332 = (id)objc_claimAutoreleasedReturnValue( [v252 runRecognitionWithResultStream:self speakerCodeWriter:v253 language:v254 task:self->_taskToUse samplingRate:self->_samplingRate]);

                objc_storeStrong((id *)&qword_100049588, v332);
                objc_storeWeak(p_audioBuffer, v332);
                if (v347) {
                  ((void (**)(id, id, id))v347)[2](v347, v329, 0LL);
                }
                self->_shouldStoreDictationAudioOnDevice = 0;
                v255 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
                v324 = +[CESRUtilities isTaskDictationSpecific:]( &OBJC_CLASS___CESRUtilities,  "isTaskDictationSpecific:",  v255);

                if (v324 && !self->_isSpeechAPIRequest)
                {
                  v256 = (void *)objc_claimAutoreleasedReturnValue( +[CESRDictationOnDeviceSampling sharedManager]( &OBJC_CLASS___CESRDictationOnDeviceSampling,  "sharedManager"));
                  v257 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
                  self->_shouldStoreDictationAudioOnDevice = [v256 isRequestSelectedForSamplingFromConfigForLanguage:v257];
                }

                v261 = [v6 shouldStoreAudioOnDevice]
                    && (v258 = (void *)objc_claimAutoreleasedReturnValue( +[CESRAssistantOnDeviceSampling sharedManager]( CESRAssistantOnDeviceSampling,  "sharedManager")),  v259 = (void *)objc_claimAutoreleasedReturnValue([v6 task]),  v260 = objc_msgSend(v258, "isRequestSelectedForSamplingForTask:", v259),  v259,  v258,  (v260 & 1) != 0)
                    || self->_shouldStoreDictationAudioOnDevice;
                if (self->_storeAudioData)
                {
                  v262 = (os_log_s *)AFSiriLogContextSpeech;
                  if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v380 = 136315138;
                    v381 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
                    _os_log_error_impl( (void *)&_mh_execute_header,  v262,  OS_LOG_TYPE_ERROR,  "%s _storeAudioData should be nil. Critical Error. Please check.",  v380,  0xCu);
                  }

                  storeAudioData = self->_storeAudioData;
                  self->_storeAudioData = 0LL;
                }

                if (v261)
                {
                  v264 = objc_loadWeakRetained(location);
                  v265 = (void *)objc_claimAutoreleasedReturnValue([v264 speakerCodeInfo]);

                  locationa = &v227->isa;
                  if (v265)
                  {
                    v304 = (void *)objc_claimAutoreleasedReturnValue([v265 inferenceSpeakerCode]);
                    v306 = (void *)objc_claimAutoreleasedReturnValue([v265 numFrames]);
                    v305 = (void *)objc_claimAutoreleasedReturnValue([v265 nnetVersion]);
                    v303 = [v265 isSpeakerCodeUsed];
                  }

                  else
                  {
                    v304 = 0LL;
                    v305 = 0LL;
                    v306 = 0LL;
                    v303 = 0;
                  }

                  v273 = objc_alloc(&OBJC_CLASS___ESStoreAudioData);
                  if (v324) {
                    v274 = objc_claimAutoreleasedReturnValue([v6 dictationUIInteractionIdentifier]);
                  }
                  else {
                    v274 = objc_claimAutoreleasedReturnValue([v6 requestIdentifier]);
                  }
                  v275 = (void *)v274;
                  v276 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
                  v277 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
                  samplingRate = self->_samplingRate;
                  v279 = (void *)objc_claimAutoreleasedReturnValue([v342 selfHelper]);
                  BYTE1(v302) = v324;
                  LOBYTE(v302) = v303;
                  v280 = -[ESStoreAudioData initWithUUIDString:language:task:codec:samplingRate:inferenceSpeakerCode:numTrainedFrames:trainingNnetVersion:isSpeakerCodeUsed:isSamplingForDictation:selfLogger:]( v273,  "initWithUUIDString:language:task:codec:samplingRate:inferenceSpeakerCode:numTrainedFrames:tra iningNnetVersion:isSpeakerCodeUsed:isSamplingForDictation:selfLogger:",  v275,  v276,  v277,  locationa,  samplingRate,  v304,  v306,  v305,  v302,  v279);
                  v281 = self->_storeAudioData;
                  self->_storeAudioData = v280;

                  v227 = (__CFString *)locationa;
                }

                v282 = objc_alloc_init(&OBJC_CLASS___ESBiomeRecord);
                biomeRecord = self->_biomeRecord;
                self->_biomeRecord = v282;

                -[ESBiomeRecord setApplicationName:](self->_biomeRecord, "setApplicationName:", self->_applicationName);
                v284 = self->_biomeRecord;
                v285 = (void *)objc_claimAutoreleasedReturnValue([v6 dictationUIInteractionIdentifier]);
                -[ESBiomeRecord setInteractionId:](v284, "setInteractionId:", v285);

                -[ESBiomeRecord setTaskName:](self->_biomeRecord, "setTaskName:", self->_taskToUse);
                if (qword_1000495F8)
                {
                  [(id)qword_1000495F8 removeAllObjects];
                }

                else
                {
                  v286 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  v287 = (void *)qword_1000495F8;
                  qword_1000495F8 = (uint64_t)v286;
                }

                v288 = (os_log_s *)AFSiriLogContextSpeech;
                v289 = v288;
                if (v336 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v288))
                {
                  *(_DWORD *)v380 = 136315394;
                  v381 = "SiriX";
                  v382 = 2080;
                  v383 = COERCE_DOUBLE("enableTelemetry=YES");
                  _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v289,  OS_SIGNPOST_INTERVAL_END,  spid,  "ES: Recognizer Init",  "%s %s",  v380,  0x16u);
                }

                -[ESConnection _processBufferedAudioPackets](self, "_processBufferedAudioPackets");
                if (self->_bufferedAudioEnded)
                {
                  v290 = objc_loadWeakRetained(p_audioBuffer);
                  [v290 endAudio];

                  self->_bufferedAudioEnded = 0;
                }

                +[ESConnection _cancelCooldownTimer](&OBJC_CLASS___ESConnection, "_cancelCooldownTimer");

                _Block_object_dispose(&v359, 8);
                _Block_object_dispose(v386, 8);

                _Block_object_dispose(buf, 8);
LABEL_248:
                v75 = v328;
LABEL_249:

                goto LABEL_250;
              }

              v154 = AFDeviceSupportsSiriMUX();
              v155 = _AFPreferencesValueForKeyWithContext( @"Enable MultiUser ASR Results",  @"com.apple.assistant",  0LL);
              v156 = (void *)objc_claimAutoreleasedReturnValue(v155);
              v157 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((objc_opt_isKindOfClass(v156, v157) & 1) != 0)
              {
              }

              else if (!v154)
              {
LABEL_147:

                goto LABEL_148;
              }

              v158 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              v371 = 0u;
              v372 = 0u;
              v369 = 0u;
              v370 = 0u;
              v159 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedUserInfos]);
              v160 = [v159 countByEnumeratingWithState:&v369 objects:v390 count:16];
              if (v160)
              {
                v161 = *(void *)v370;
                do
                {
                  for (j = 0LL; j != v160; j = (char *)j + 1)
                  {
                    if (*(void *)v370 != v161) {
                      objc_enumerationMutation(v159);
                    }
                    v163 = *(void **)(*((void *)&v369 + 1) + 8LL * (void)j);
                    v164 = (void *)objc_claimAutoreleasedReturnValue([v163 loggableSharedUserId]);
                    v165 = (void *)objc_claimAutoreleasedReturnValue([v163 sharedUserId]);
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v158,  "setObject:forKeyedSubscript:",  v164,  v165);
                  }

                  v160 = [v159 countByEnumeratingWithState:&v369 objects:v390 count:16];
                }

                while (v160);
              }

              objc_storeStrong((id *)&self->_userIdMask, v158);
              goto LABEL_147;
            }

            v96 = v95;

            v91 = (NSString *)v96;
          }

          v92 = v91;
          v93 = v75;
          v94 = v91;
          goto LABEL_89;
        }

LABEL_70:
        v340 = 0LL;
        goto LABEL_71;
      }
    }

    else
    {
    }

    __int128 v59 = (os_log_s *)(id)qword_100049580;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v60 = qword_1000495B0;
      if (qword_1000495C0) {
        v61 = (const __CFString *)qword_1000495C0;
      }
      else {
        v61 = @"(none)";
      }
      v62 = objc_claimAutoreleasedReturnValue([v6 language]);
      v63 = (void *)v62;
      *(_DWORD *)buf = 136316163;
      v64 = obj;
      if (!obj) {
        v64 = @"(none)";
      }
      *(void *)&buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v60;
      *(_WORD *)&buf[22] = 2113;
      v392 = (uint64_t (*)(uint64_t, uint64_t))v61;
      *(_WORD *)v393 = 2114;
      *(void *)&v393[2] = v62;
      *(_WORD *)&v393[10] = 2113;
      *(void *)&v393[12] = v64;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%s Cached recognizer is for language: %{public}@, regionId: %{private}@, requesting recognizer for language: %{p ublic}@, regionId: %{private}@",  buf,  0x34u);
    }

    v65 = (void *)qword_1000495E8;
    qword_1000495E8 = 0LL;

    v66 = qword_1000495B0;
    v67 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
    LOBYTE(v66) = [(id)v66 isEqualToString:v67];

    if ((v66 & 1) == 0)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
      [v68 refreshAssetSetWithConfig:v339 regionId:obj];
    }

    +[ESConnection _discardCachedRecognizer](&OBJC_CLASS___ESConnection, "_discardCachedRecognizer");
    goto LABEL_70;
  }

  id v17 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]";
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Recognizer is busy", buf, 0xCu);
  }

  if (v347)
  {
    v394 = NSLocalizedDescriptionKey;
    v395 = @"Recognizer is busy";
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v395,  &v394,  1LL));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1100LL,  v18));
    v347[2](v347, 0LL, v19);
  }

  -[ESConnection startRequestActivityWithCompletion:](self, "startRequestActivityWithCompletion:", 0LL);
LABEL_250:
}

void sub_1000187D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_100018F80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100019A80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10001B504( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_10001CAF8(uint64_t a1, void *a2)
{
  float v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 nBest]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 formattedRecognitionWithNBestList:v5]);

  float v7 = (dispatch_queue_s *)qword_100049570;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001CCF0;
  v10[3] = &unk_100041050;
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v8;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void sub_10001CBB8(uint64_t a1)
{
  uint64_t v2 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    float v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 oneBest]);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"tokenName"]);
    int v9 = 136315394;
    int v10 = "-[ESConnection speechRecognizer:didRecognizeRawEagerRecognitionCandidate:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s raw eager recognition candidate: %@",  (uint8_t *)&v9,  0x16u);
  }

  float v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _delegate]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities afRecognitionForEARSausage:processedAudioDuration:]( &OBJC_CLASS___CESRUtilities,  "afRecognitionForEARSausage:processedAudioDuration:",  *(void *)(a1 + 32),  *(double *)(*(void *)(a1 + 40) + 160LL)));
  [v7 speechServiceDidRecognizeRawEagerRecognitionCandidate:v8];
}

void sub_10001CCF0(uint64_t a1)
{
  uint64_t v2 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    float v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 oneBest]);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"tokenName"]);
    int v9 = 136315394;
    int v10 = "-[ESConnection speechRecognizer:didRecognizeRawEagerRecognitionCandidate:]_block_invoke_2";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s #ASR on device eager formatted recognition candidate: %@",  (uint8_t *)&v9,  0x16u);
  }

  float v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _delegate]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities afRecognitionForEARSausage:processedAudioDuration:]( &OBJC_CLASS___CESRUtilities,  "afRecognitionForEARSausage:processedAudioDuration:",  *(void *)(a1 + 32),  *(double *)(*(void *)(a1 + 40) + 160LL)));
  [v7 speechServiceDidRecognizeRawEagerRecognitionCandidate:v8];
}

void sub_10001CE28(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 160LL) = *(void *)(a1 + 48);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  [v2 speechServiceDidProcessAudioDuration:*(double *)(a1 + 48)];

  float v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 136315394;
    float v7 = "-[ESConnection speechRecognizer:didProcessAudioDuration:]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s didProcessAudioDuration %f",  (uint8_t *)&v6,  0x16u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
  [v4 logTotalAudioProcessedOfDuration:*(void *)(a1 + 40) timeInTicks:*(double *)(a1 + 48)];
}

void sub_10001CF30(uint64_t a1)
{
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
  uint64_t v2 = (void *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    float v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = v2;
    double v6 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v3 statusForError:v4]));
    *(_DWORD *)buf = 136315394;
    v121 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v122 = 2114;
    double v123 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Recognition finished with status %{public}@",  buf,  0x16u);
  }

  float v7 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    __int16 v8 = v7;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v9 systemUptime];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    double v13 = v12 - *(double *)(v10 + 184);
    __int16 v14 = *(void **)(v10 + 32);
    *(_DWORD *)buf = 136315906;
    v121 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v122 = 2048;
    double v123 = v13;
    __int16 v124 = 2112;
    v125 = v14;
    __int16 v126 = 2112;
    uint64_t v127 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Audio finish to recognizer finish = %lf sec, connection is %@, error %@",  buf,  0x2Au);
  }

  uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v15 systemUptime];
  *(void *)(*(void *)(a1 + 32) + 264LL) = v16;

  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 272LL) = CFAbsoluteTimeGetCurrent();
  *(void *)(*(void *)(a1 + 32) + 344LL) = 0LL;
  +[CESRUtilities noteSuccessfulUse](&OBJC_CLASS___CESRUtilities, "noteSuccessfulUse");
  +[ESConnection _scheduleCooldownTimer](&OBJC_CLASS___ESConnection, "_scheduleCooldownTimer");
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  if ([WeakRetained concatenateUtterances])
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 40LL);

    if (v18)
    {
      if ([*(id *)(a1 + 48) enableVoiceCommands]
        && (uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]),
            char v20 = objc_opt_respondsToSelector(v19, "speechServiceDidRecognizeTokens:withMetadata:"),
            v19,
            (v20 & 1) != 0))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
        [v21 speechServiceDidRecognizePackage:*(void *)(*(void *)(a1 + 32) + 40) withMetadata:*(void *)(*(void *)(a1 + 32) + 64)];

        __int128 v22 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          double v23 = *(double *)(*(void *)(a1 + 32) + 64LL);
          *(_DWORD *)buf = 136315394;
          v121 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
          __int16 v122 = 2112;
          double v123 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s AFSpeechInfo Package %@", buf, 0x16u);
        }
      }

      else
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
        [v28 speechServiceDidRecognizePackage:*(void *)(*(void *)(a1 + 32) + 40)];
      }

      uint64_t v29 = *(void *)(a1 + 32);
      id v26 = *(void **)(v29 + 64);
      *(void *)(v29 + 64) = 0LL;
      uint64_t v27 = 40LL;
LABEL_17:

      uint64_t v30 = *(void *)(a1 + 32);
      id v24 = *(id *)(v30 + v27);
      *(void *)(v30 + v27) = 0LL;
      goto LABEL_18;
    }
  }

  else
  {
  }

  id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  if ([v24 concatenateUtterances])
  {
    uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 48LL);

    if (!v25) {
      goto LABEL_19;
    }
    id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
    [v26 speechServiceDidRecognizeMultiUserSpeechPackage:*(void *)(*(void *)(a1 + 32) + 48)];
    uint64_t v27 = 48LL;
    goto LABEL_17;
  }

LABEL_18:
LABEL_19:
  id v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) recognitionUtterenceStatistics]);
  id v32 = *(void **)(*(void *)(a1 + 32) + 248LL);
  if (!v32)
  {
    id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v34 = *(void *)(a1 + 32);
    id v35 = *(void **)(v34 + 248);
    *(void *)(v34 + 24_Block_object_dispose(va, 8) = v33;

    id v32 = *(void **)(*(void *)(a1 + 32) + 248LL);
  }

  id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) recognitionStatistics]);
  [v32 addEntriesFromDictionary:v36];

  uint64_t v37 = objc_claimAutoreleasedReturnValue([v31 valueForKey:@"recognizer-components"]);
  v38 = (void *)v37;
  if (v37) {
    v39 = (const __CFString *)v37;
  }
  else {
    v39 = &stru_1000415D8;
  }
  [*(id *)(*(void *)(a1 + 32) + 248) setObject:v39 forKeyedSubscript:@"recognizer-components"];

  uint64_t v40 = objc_claimAutoreleasedReturnValue([v31 valueForKey:@"lm_interp_weights"]);
  unsigned int v41 = (void *)v40;
  if (v40) {
    v42 = (const __CFString *)v40;
  }
  else {
    v42 = &stru_1000415D8;
  }
  [*(id *)(*(void *)(a1 + 32) + 248) setObject:v42 forKeyedSubscript:@"lm_interp_weights"];

  id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 144LL)));
  [*(id *)(*(void *)(a1 + 32) + 248) setObject:v43 forKeyedSubscript:@"audioDurationMs"];

  v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) recognitionStatistics]);
  uint64_t v45 = *(void *)(a1 + 32);
  double v47 = *(double *)(v45 + 256);
  double v46 = *(double *)(v45 + 264);
  if (v47 <= v46)
  {
    double v49 = (v46 - v47) * 1000.0;
  }

  else
  {
    v48 = (void *)AFSiriLogContextSpeech;
    double v49 = -1.0;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = v48;
      double v51 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v47)));
      id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 264LL)));
      *(_DWORD *)buf = 136315650;
      v121 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      __int16 v122 = 2112;
      double v123 = v51;
      __int16 v124 = 2112;
      v125 = v52;
      _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%s _recognitionBeginTime (%@) is greater than _recognitionEndTime (%@)",  buf,  0x20u);
    }
  }

  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v49));
  [*(id *)(*(void *)(a1 + 32) + 248) setObject:v53 forKeyedSubscript:@"recognitionDurationMs"];

  uint64_t v54 = *(void *)(a1 + 32);
  if (*(void *)(v54 + 128))
  {
    [*(id *)(v54 + 128) setRecognitionEndTime:*(double *)(v54 + 272)];
    uint64_t v54 = *(void *)(a1 + 32);
  }

  int v55 = (void *)objc_claimAutoreleasedReturnValue([(id)v54 _delegate]);
  [v55 speechServiceDidFinishRecognitionWithStatistics:*(void *)(*(void *)(a1 + 32) + 248) error:*(void *)(a1 + 40)];

  id v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) recognitionMetrics]);
  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v56 pauseDurations]);

  [v57 enumerateObjectsUsingBlock:&stru_1000411E8];
  if (v57) {
    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v57 valueForKeyPath:@"@sum.self"]);
  }
  else {
    __int128 v58 = 0LL;
  }
  v110 = v58;
  [v58 doubleValue];
  double v60 = *(double *)(*(void *)(a1 + 32) + 144LL);
  v118 = v57;
  if (v60 == 0.0)
  {
    v117 = 0LL;
  }

  else
  {
    double v61 = v60 + v59 * -1000.0;
    v62 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKey:EARRecognitionStatisticRecogCpuTime]);
    [v62 doubleValue];
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v63 / v61));
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) recognitionMetrics]);
  uint64_t v108 = *(void *)(a1 + 40);
  v116 = (void *)objc_claimAutoreleasedReturnValue([v31 valueForKey:@"recognizer-components"]);
  v115 = (void *)objc_claimAutoreleasedReturnValue([v44 valueForKey:@"AverageActiveTokensPerFrame"]);
  v106 = (void *)objc_claimAutoreleasedReturnValue([v31 valueForKey:@"lm_interp_weights"]);
  v105 = (void *)objc_claimAutoreleasedReturnValue([v44 valueForKey:@"SNR"]);
  v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 264LL) - *(double *)(*(void *)(a1 + 32) + 256LL)));
  v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)(a1 + 32) + 144LL)));
  v113 = (void *)objc_claimAutoreleasedReturnValue([v44 valueForKey:@"EagerUsed"]);
  id v107 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  unsigned __int8 v102 = [v107 detectUtterances];
  id v104 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  unsigned __int8 v101 = [v104 concatenateUtterances];
  v111 = v44;
  v100 = (void *)objc_claimAutoreleasedReturnValue([v44 valueForKey:@"numLmeDataStreams"]);
  v99 = (void *)objc_claimAutoreleasedReturnValue([v31 valueForKey:@"PM-decoder"]);
  v96 = (void *)objc_claimAutoreleasedReturnValue([v64 itnDurationInNs]);
  unsigned __int8 v98 = [v64 isEmojiPersonalizationUsed];
  unsigned __int8 v97 = [v64 isEmojiDisambiguationUsed];
  unsigned __int8 v65 = [v64 isEmojiExpectedButNotRecognized];
  v95 = (void *)objc_claimAutoreleasedReturnValue([v64 recognizedEmojis]);
  v109 = v64;
  v94 = (void *)objc_claimAutoreleasedReturnValue([v64 allItnRunIntervals]);
  v112 = v31;
  v66 = (void *)objc_claimAutoreleasedReturnValue([v31 valueForKey:@"ANEUsed"]);
  uint64_t v67 = qword_1000495B0;
  id v68 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v68 modelInfo]);
  v70 = (void *)objc_claimAutoreleasedReturnValue([v69 version]);
  BYTE2(v93) = v65;
  BYTE1(v93) = v97;
  LOBYTE(v93) = v98;
  BYTE1(v92) = v101;
  LOBYTE(v92) = v102;
  objc_msgSend( v119,  "logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame:languageModelInterpolat ionWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:eagerUsed:utteranceDetectionEnabled :utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pauseDurations:itnDurati onInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecognized:recognizedEmojis:allItnR unIntervals:allSecondaryPassIntervals:powerLogEvent:aneUsed:language:modelVersion:applicationName:",  v108,  v116,  v115,  v106,  v105,  v103,  v114,  v113,  v92,  v117,  v100,  v99,  v118,  v96,  v93,  v95,  v94,  &__NSArray0__struct,  @"didFinishRecognitionWithError",  v66,  v67,  v70,  *(void *)(*(void *)(a1 + 32) + 384));

  if (([*(id *)(*(void *)(a1 + 32) + 320) isEqualToString:CoreEmbeddedSpeechRecognizerTaskBeto] & 1) == 0 && (objc_msgSend( *(id *)(*(void *)(a1 + 32) + 320),  "isEqualToString:",  CoreEmbeddedSpeechRecognizerTaskBetoDictation) & 1) == 0)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue([v112 valueForKey:@"PM-input"]);
    v72 = (void *)objc_claimAutoreleasedReturnValue([v112 valueForKey:@"PM-output"]);
    [v119 logIntermediateUtteranceInfoTier1WithPmInput:v71 pmOutput:v72];
  }

  [v119 logFirstAudioPacketRecordedWithTimeInTicks:*(void *)(*(void *)(a1 + 32) + 200)];
  [v119 logAudioPacketArrivalStartedOrChangedWithTimeInTicks:*(void *)(*(void *)(a1 + 32) + 208)];
  [v119 logAudioPacketArrivalEndedWithTimeInTicks:*(void *)(*(void *)(a1 + 32) + 216)];
  [v119 logPendingANEModelInitializationContextEvents:qword_100049618];
  id v73 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
  [v73 cancelRecognition];

  id v74 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
  uint64_t v75 = qword_100049588;

  if (v74 == (id)v75)
  {
    v76 = (void *)qword_100049588;
    qword_100049588 = 0LL;
  }

  objc_storeWeak((id *)(*(void *)(a1 + 32) + 16LL), 0LL);
  [v119 setESSelfHelper:0];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 8LL), 0LL);
  uint64_t v77 = *(void *)(a1 + 32);
  v78 = *(void **)(v77 + 56);
  *(void *)(v77 + 56) = 0LL;

  uint64_t v79 = *(void *)(a1 + 32);
  if (!*(void *)(a1 + 40) && *(_BYTE *)(v79 + 24) && !*(_BYTE *)(v79 + 27) && *(void *)(v79 + 120))
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue( +[CESRDictationOnDeviceSampling sharedManager]( &OBJC_CLASS___CESRDictationOnDeviceSampling,  "sharedManager"));
    [v91 incrementSampledRequestCount];

    uint64_t v79 = *(void *)(a1 + 32);
  }

  v80 = *(void **)(v79 + 120);
  if (v80)
  {
    if (!*(void *)(a1 + 40))
    {
      [v80 saveAudioToDisk];
      uint64_t v79 = *(void *)(a1 + 32);
      v80 = *(void **)(v79 + 120);
    }

    *(void *)(v79 + 120) = 0LL;

    uint64_t v79 = *(void *)(a1 + 32);
  }

  v81 = *(void **)(v79 + 128);
  if (v81)
  {
    if (!*(void *)(a1 + 40))
    {
      [v81 sendEvent];
      uint64_t v79 = *(void *)(a1 + 32);
      v81 = *(void **)(v79 + 128);
    }

    *(void *)(v79 + 12_Block_object_dispose(va, 8) = 0LL;

    uint64_t v79 = *(void *)(a1 + 32);
  }

  v82 = *(void **)(v79 + 248);
  if (v82)
  {
    *(void *)(v79 + 24_Block_object_dispose(va, 8) = 0LL;

    uint64_t v79 = *(void *)(a1 + 32);
  }

  *(_BYTE *)(v79 + 224) = 0;
  uint64_t v83 = *(void *)(a1 + 32);
  v84 = *(void **)(v83 + 208);
  *(void *)(v83 + 20_Block_object_dispose(va, 8) = 0LL;

  *(void *)(*(void *)(a1 + 32) + 168LL) = 0x10000000000000LL;
  *(void *)(*(void *)(a1 + 32) + 176LL) = 0x10000000000000LL;
  uint64_t v85 = *(void *)(a1 + 32);
  v86 = *(void **)(v85 + 384);
  *(void *)(v85 + 384) = 0LL;

  [*(id *)(*(void *)(a1 + 32) + 352) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 360) removeAllObjects];
  uint64_t v87 = *(void *)(a1 + 32);
  v88 = *(void **)(v87 + 40);
  *(void *)(v87 + 40) = 0LL;

  uint64_t v89 = *(void *)(a1 + 32);
  v90 = *(void **)(v89 + 64);
  *(void *)(v89 + 64) = 0LL;

  [*(id *)(a1 + 32) startRequestActivityWithCompletion:0];
}

void sub_10001DB58(id a1, NSNumber *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = a2;
  uint64_t v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    float v7 = "-[ESConnection speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s PauseDuration = %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10001DC14(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v33 = "-[ESConnection speechRecognizer:didRecognizeFinalResultMultiUserPackages:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  float v3 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10001DEE8;
  v31[3] = &unk_1000411A8;
  uint64_t v4 = *(void **)(a1 + 32);
  v31[4] = *(void *)(a1 + 40);
  [v4 enumerateKeysAndObjectsUsingBlock:v31];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  double v7 = *(double *)(v5 + 160);
  uint64_t v8 = qword_1000495E0;
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained modelInfo]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities afMultiUserSpeechPackageForEARPackages:processedAudioDuration:speechProfiles:recognizerModelInfo:]( &OBJC_CLASS___CESRUtilities,  "afMultiUserSpeechPackageForEARPackages:processedAudioDuration:speechProfiles:recognizerModelInfo:",  v6,  v8,  v10,  v7));

  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedUserIdSpeechPackageMap]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allValues]);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

  unsigned int v15 = +[CESRUtilities hasRecognizedAnythingInAFSpeechPackage:]( &OBJC_CLASS___CESRUtilities,  "hasRecognizedAnythingInAFSpeechPackage:",  v14);
  uint64_t v16 = *(void *)(a1 + 40);
  if (v15)
  {
    id v17 = *(void **)(v16 + 120);
    if (v17)
    {
      [v17 markRecognition];
      uint64_t v16 = *(void *)(a1 + 40);
    }
  }

  id v18 = objc_loadWeakRetained((id *)(v16 + 8));
  unsigned int v19 = [v18 concatenateUtterances];

  uint64_t v20 = *(void *)(a1 + 40);
  if (v19)
  {
    id v21 = v11;
    __int128 v22 = *(void **)(v20 + 48);
    *(void *)(v20 + 4_Block_object_dispose(va, 8) = v21;
  }

  else
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _delegate]);
    [v22 speechServiceDidRecognizeMultiUserSpeechPackage:v11];
  }

  double v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allValues]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);

  if ((([*(id *)(*(void *)(a1 + 40) + 320) isEqualToString:CoreEmbeddedSpeechRecognizerTaskBeto] & 1) != 0 || objc_msgSend( *(id *)(*(void *)(a1 + 40) + 320),  "isEqualToString:",  CoreEmbeddedSpeechRecognizerTaskBetoDictation))
    && ([v24 isFinal] & 1) == 0
    && ((v15 ^ 1) & 1) == 0)
  {
    uint64_t v25 = *(void **)(a1 + 32);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10001DF58;
    v28[3] = &unk_1000410A0;
    id v26 = v3;
    uint64_t v27 = *(void *)(a1 + 40);
    id v29 = v26;
    uint64_t v30 = v27;
    [v25 enumerateKeysAndObjectsUsingBlock:v28];
  }
}

void sub_10001DEE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 328);
  *(void *)(v3 + 32_Block_object_dispose(va, 8) = v4 + 1;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  setEARPackageResultCandidateId(v5, v6);
}

void sub_10001DF58(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:v23]);
  uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 logPackageGeneratedAndRecognitionResultTier1WithEARPackage:v5 loggableSharedUserId:v7 timeInTicks:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 preITNRecognition]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 oneBest]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastObject]);

  if (v12 && ([v5 isFinal] & 1) == 0)
  {
    double v13 = *(void **)(a1 + 40);
    [v12 silenceStart];
    *(float *)&double v14 = v14;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 _packetReadyUpstreamTimestampsFromAudioTime:v14]);
    uint64_t v16 = *(void **)(a1 + 32);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:v23]);
    [v16 logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:v15 loggableSharedUserId:v17 earPackage:v5];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16LL));
    [v12 silenceStart];
    *(float *)&double v19 = v19;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [WeakRetained packetArrivalTimestampFromAudioTime:v19]));

    id v21 = *(void **)(a1 + 32);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:v23]);
    [v21 logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:v20 loggableSharedUserId:v22 earPackage:v5];
  }
}

void sub_10001E110(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
  id v3 = a1[4];
  ++*((void *)a1[5] + 41);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  setEARPackageResultCandidateId(v3, v4);

  id v5 = a1[4];
  double v6 = *((double *)a1[5] + 20);
  BOOL v7 = [(id)qword_1000495E0 count] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)a1[5] + 1);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained modelInfo]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceCommandCandidatePackage:]( &OBJC_CLASS___CESRUtilities,  "afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceCom mandCandidatePackage:",  v5,  v7,  v9,  0LL,  v6));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:]( &OBJC_CLASS___CESRUtilities,  "AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:",  a1[4]));
  unsigned int v12 = +[CESRUtilities hasRecognizedAnythingInAFSpeechPackage:]( &OBJC_CLASS___CESRUtilities,  "hasRecognizedAnythingInAFSpeechPackage:",  v10);
  id v13 = a1[5];
  if (v12)
  {
    double v14 = (void *)*((void *)v13 + 15);
    if (v14)
    {
      [v14 markRecognition];
      id v13 = a1[5];
    }

    unsigned int v15 = (void *)*((void *)v13 + 16);
    if (v15)
    {
      [v15 markRecognition];
      id v13 = a1[5];
    }
  }

  id v16 = objc_loadWeakRetained((id *)v13 + 1);
  unsigned int v17 = [v16 concatenateUtterances];

  if (v17)
  {
    objc_storeStrong((id *)a1[5] + 5, v10);
    objc_storeStrong((id *)a1[5] + 8, v11);
  }

  else
  {
    if ([v10 recognitionPaused])
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue([a1[5] dummyResultPackage:v10]);

      uint64_t v10 = (void *)v18;
    }

    if ([a1[6] enableVoiceCommands]
      && (double v19 = (void *)objc_claimAutoreleasedReturnValue([a1[5] _delegate]),
          char v20 = objc_opt_respondsToSelector(v19, "speechServiceDidRecognizePackage:withMetadata:"),
          v19,
          (v20 & 1) != 0))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([a1[5] _delegate]);
      [v21 speechServiceDidRecognizePackage:v10 withMetadata:v11];

      __int128 v22 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v103 = "-[ESConnection speechRecognizer:didRecognizeFinalResultPackage:]_block_invoke";
        __int16 v104 = 2112;
        id v105 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s AFSpeechInfo Package %@", buf, 0x16u);
      }
    }

    else
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([a1[5] _delegate]);
      [v23 speechServiceDidRecognizePackage:v10];
    }
  }

  if ((v12 & +[CESRUtilities isTaskDictationSpecific:]( CESRUtilities,  "isTaskDictationSpecific:",  *((void *)a1[5] + 40))) == 1 && ([a1[6] detectUtterances]
     && ![a1[6] concatenateUtterances]
     || [a1[4] isFinal]))
  {
    unsigned int v96 = v12;
    unsigned __int8 v97 = v11;
    unsigned __int8 v98 = v10;
    id v25 = a1[4];
    id v24 = a1[5];
    uint64_t v26 = v24[45];
    uint64_t v27 = v24[43];
    id v28 = v2;
    id v29 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v99 = v28;
    [v28 logFinalResultGeneratedWithEARPackage:v25 firstSeenPartialResultTokens:v26 partialResultOffset:v27 timeInTicks:v30];

    id v31 = [*((id *)a1[5] + 44) count];
    id v32 = (void *)objc_claimAutoreleasedReturnValue([a1[4] correctPartialResultIndexList]);
    id v33 = [v32 count];

    if (v33 && v31)
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([a1[4] correctPartialResultIndexList]);
      int v35 = [v34 count];

      if (v35 < 1)
      {
        uint64_t v79 = &stru_1000415D8;
      }

      else
      {
        uint64_t v36 = 0LL;
        int v37 = 0;
        v38 = &stru_1000415D8;
        double v39 = 0.0;
        double v40 = 1.79769313e308;
        double v41 = 0.0;
        id v100 = v31;
        do
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue([a1[4] correctPartialResultIndexList]);
          id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectAtIndex:v36]);
          unsigned int v44 = [v43 unsignedIntValue];

          if ((unint64_t)v31 > v44)
          {
            int v101 = v37;
            uint64_t v45 = v44;
            double v46 = (void *)objc_claimAutoreleasedReturnValue([a1[4] preITNRecognition]);
            double v47 = (void *)objc_claimAutoreleasedReturnValue([v46 oneBest]);
            v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndex:v36]);
            [v48 silenceStart];
            double v50 = v49;
            [a1[4] utteranceStart];
            double v52 = v50 + v51;

            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([*((id *)a1[5] + 44) objectAtIndex:v45]);
            [v53 doubleValue];
            double v55 = v54;

            double v56 = *((double *)a1[5] + 21);
            __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([a1[4] preITNRecognition]);
            __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v57 oneBest]);
            double v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndex:v36]);
            double v60 = (void *)objc_claimAutoreleasedReturnValue([v59 tokenName]);

            double v61 = (char *)[*((id *)a1[5] + 26) unsignedLongLongValue];
            *(float *)&double v62 = v52;
            double v63 = &v61[(void)+[CESRUtilities secondsToHostTime:]( &OBJC_CLASS___CESRUtilities,  "secondsToHostTime:",  v62)];
            v64 = (void *)objc_claimAutoreleasedReturnValue([*((id *)a1[5] + 44) objectAtIndex:v45]);
            [v64 doubleValue];
            *(float *)&double v65 = v65;
            id v66 = +[CESRUtilities secondsToHostTime:](&OBJC_CLASS___CESRUtilities, "secondsToHostTime:", v65);

            uint64_t v67 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( &OBJC_CLASS___CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  v63);
            id v68 = (const char *)+[CESRUtilities machAbsoluteTimeToMachContinuousTime:]( &OBJC_CLASS___CESRUtilities,  "machAbsoluteTimeToMachContinuousTime:",  v66);
            if (v68 >= v67)
            {
              v69 = v68;
              os_signpost_id_t v70 = os_signpost_id_generate(AFSiriLogContextSpeech);
              v71 = (os_log_s *)AFSiriLogContextSpeech;
              v72 = v71;
              if (v70 - 1 > 0xFFFFFFFFFFFFFFFDLL)
              {

                id v74 = (os_log_s *)AFSiriLogContextSpeech;
              }

              else
              {
                if (os_signpost_enabled(v71))
                {
                  id v73 = [v60 UTF8String];
                  *(_DWORD *)buf = 134349314;
                  v103 = v67;
                  __int16 v104 = 2080;
                  id v105 = v73;
                  _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v72,  OS_SIGNPOST_INTERVAL_BEGIN,  v70,  "ES: Time to Word",  "%{public, signpost.description:begin_time}llu %s",  buf,  0x16u);
                }

                id v74 = (os_log_s *)AFSiriLogContextSpeech;
                if (os_signpost_enabled(v74))
                {
                  *(_DWORD *)buf = 134349056;
                  v103 = v69;
                  _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v74,  OS_SIGNPOST_INTERVAL_END,  v70,  "ES: Time to Word",  "%{public, signpost.description:end_time}llu",  buf,  0xCu);
                }
              }
            }

            int v37 = v101 + 1;
            double v75 = v55 - (v52 + v56);
            uint64_t v76 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@:%f,",  v38,  v60,  *(void *)&v75));

            double v39 = v39 + v75;
            if (v41 < v75) {
              double v41 = v75;
            }
            if (v40 >= v75) {
              double v40 = v75;
            }

            v38 = (__CFString *)v76;
            id v31 = v100;
          }

          ++v36;
          uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([a1[4] correctPartialResultIndexList]);
          signed int v78 = [v77 count];
        }

        while (v36 < v78);
        if (v37 <= 0)
        {
          uint64_t v79 = v38;
        }

        else
        {
          uint64_t v79 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ TTAW:%f MEAN:%f, MAX:%f, MIN:%f ",  v38,  *(void *)&v39,  v39 / (double)v37,  *(void *)&v41,  *(void *)&v40));

          os_signpost_id_t v80 = os_signpost_id_generate(AFSiriLogContextSpeech);
          v81 = (os_log_s *)AFSiriLogContextSpeech;
          v82 = v81;
          if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
          {
            *(_DWORD *)buf = 138412290;
            v103 = (const char *)v79;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v82,  OS_SIGNPOST_EVENT,  v80,  "ES: TTAW",  "Partially Recognized Results: %@",  buf,  0xCu);
          }
        }
      }
    }

    [*((id *)a1[5] + 45) removeAllObjects];
    *((void *)a1[5] + 43) += *((void *)a1[5] + 42);
    *((void *)a1[5] + 42) = 0LL;
    uint64_t v10 = v98;
    uint64_t v2 = v99;
    uint64_t v11 = v97;
    unsigned int v12 = v96;
  }

  if ((([*((id *)a1[5] + 40) isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging] & 1) != 0 || objc_msgSend( *((id *)a1[5] + 40),  "isEqualToString:",  CoreEmbeddedSpeechRecognizerTaskSiriDictation))
    && (([v10 isFinal] | v12 ^ 1) & 1) == 0)
  {
    id v83 = a1[4];
    v84 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
    uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
    [v2 logPackageGeneratedAndRecognitionResultTier1WithEARPackage:v83 loggableSharedUserId:0 timeInTicks:v85];
  }

  v86 = (void *)objc_claimAutoreleasedReturnValue([a1[4] preITNRecognition]);
  uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue([v86 oneBest]);
  v88 = (void *)objc_claimAutoreleasedReturnValue([v87 lastObject]);

  if (v88 && ([a1[4] isFinal] & 1) == 0)
  {
    id v89 = a1[5];
    [v88 silenceStart];
    *(float *)&double v90 = v90;
    v91 = v11;
    uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue([v89 _packetReadyUpstreamTimestampsFromAudioTime:v90]);
    [v2 logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:v92 loggableSharedUserId:0 earPackage:a1[4]];
    id v93 = objc_loadWeakRetained((id *)a1[5] + 2);
    [v88 silenceStart];
    *(float *)&double v94 = v94;
    v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v93 packetArrivalTimestampFromAudioTime:v94]));

    [v2 logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:v95 loggableSharedUserId:0 earPackage:a1[4]];
    uint64_t v11 = v91;
  }
}

void sub_10001EA70(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  char v3 = objc_opt_respondsToSelector(v2, "speechServiceDidRecognizeFinalResultCandidatePackage:");

  if ((v3 & 1) != 0)
  {
    uint64_t v4 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[ESConnection speechRecognizer:didRecognizeFinalResultCandidatePackage:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = *(double *)(*(void *)(a1 + 32) + 160LL);
    BOOL v7 = [(id)qword_1000495E0 count] != 0;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained modelInfo]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceCommandCandidatePackage:]( &OBJC_CLASS___CESRUtilities,  "afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceC ommandCandidatePackage:",  v5,  v7,  v9,  0LL,  v6));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
    [v11 speechServiceDidRecognizeFinalResultCandidatePackage:v10];
  }

void sub_10001EBE0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  char v3 = objc_opt_respondsToSelector(v2, "speechServiceDidRecognizeVoiceCommandCandidatePackage:withMetadata:");

  if ((v3 & 1) != 0)
  {
    uint64_t v4 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      double v14 = "-[ESConnection speechRecognizer:didRecognizeVoiceCommandCandidatePackage:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = *(double *)(*(void *)(a1 + 32) + 160LL);
    BOOL v7 = [(id)qword_1000495E0 count] != 0;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained modelInfo]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceCommandCandidatePackage:]( &OBJC_CLASS___CESRUtilities,  "afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceC ommandCandidatePackage:",  v5,  v7,  v9,  1LL,  v6));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:]( &OBJC_CLASS___CESRUtilities,  "AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:",  *(void *)(a1 + 40)));
    int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
    [v12 speechServiceDidRecognizeVoiceCommandCandidatePackage:v10 withMetadata:v11];
  }

void sub_10001ED74(id a1)
{
}

void sub_10001ED94(id a1)
{
}

void sub_10001EDB4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(*(void *)(a1 + 40) + 160LL);
  uint64_t v4 = [(id)qword_1000495E0 count] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8LL));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained modelInfo]);
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[CESRUtilities afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceCommandCandidatePackage:]( &OBJC_CLASS___CESRUtilities,  "afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceCommand CandidatePackage:",  v2,  v4,  v6,  1LL,  v3));

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:]( &OBJC_CLASS___CESRUtilities,  "AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:",  *(void *)(a1 + 32)));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _delegate]);
  LOBYTE(v4) = objc_opt_respondsToSelector(v8, "speechServiceDidRecognizePartialPackage:withMetadata:");

  if ((v4 & 1) != 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _delegate]);
    [v9 speechServiceDidRecognizePartialPackage:v15 withMetadata:v7];
  }

  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recognition]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 oneBest]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preITNRecognition]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 oneBest]);
  [v10 processPartialResultMetricsWithTokens:v12 preITNTokens:v14 timestamp:*(double *)(a1 + 48)];
}

void sub_10001EF24(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tokens]);
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[CESRUtilities afTokensForEARTokens:removeSpaceBefore:]( &OBJC_CLASS___CESRUtilities,  "afTokensForEARTokens:removeSpaceBefore:",  v2,  0LL));

  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResult:]( &OBJC_CLASS___CESRUtilities,  "AFSpeechInfoPackageForEARSpeechRecognitionResult:",  *(void *)(a1 + 32)));
  if ([*(id *)(a1 + 40) enableVoiceCommands]
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _delegate]),
        char v5 = objc_opt_respondsToSelector(v4, "speechServiceDidRecognizeTokens:withMetadata:"),
        v4,
        (v5 & 1) != 0))
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _delegate]);
    [v6 speechServiceDidRecognizeTokens:v10 withMetadata:v3];
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _delegate]);
    [v6 speechServiceDidRecognizeTokens:v10];
  }

  BOOL v7 = *(void **)(a1 + 48);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tokens]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preITNTokens]);
  [v7 processPartialResultMetricsWithTokens:v8 preITNTokens:v9 timestamp:*(double *)(a1 + 56)];
}

void sub_10001F058(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  double v6 = *(void **)(*(void *)(a1 + 32) + 360LL);
  if (v6)
  {
    id v16 = v5;
    BOOL v7 = (char *)[v6 count];
    if ((unint64_t)v7 <= a3)
    {
      uint64_t v8 = v7;
      do
      {
        uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 360LL);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v9 addObject:v10];

        ++v8;
      }

      while ((unint64_t)v8 <= a3);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 360) objectAtIndex:a3]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v16 tokenName]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[CESRUtilities getNormString:](&OBJC_CLASS___CESRUtilities, "getNormString:", v12));

    double v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v13]);
    if (!v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(*(void *)(a1 + 32) + 336LL)));
      [v11 setObject:v15 forKey:v13];
    }

    id v5 = v16;
  }
}

id sub_10001F190(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 tokenName]);
  [v3 appendString:v4];

  return [*(id *)(a1 + 32) appendString:@" "];
}

void sub_10001F1E4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001F26C;
  v6[3] = &unk_1000410A0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = v2;
  uint64_t v8 = v3;
  id v5 = v2;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void sub_10001F26C(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = *(void **)(a1 + 32);
  double v6 = *(void **)(*(void *)(a1 + 40) + 56LL);
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v30]);
  uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v5 logPackageGeneratedAndRecognitionResultTier1WithEARPackage:v7 loggableSharedUserId:v8 timeInTicks:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 unrepairedRecognition]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 oneBest]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[CESRUtilities earTokensToString:](&OBJC_CLASS___CESRUtilities, "earTokensToString:", v12));

  double v14 = *(void **)(a1 + 32);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:v30]);
  [v14 logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:v13 loggableSharedUserId:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 preITNRecognition]);
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 oneBest]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);

  if (v18)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16LL));
    [v18 start];
    *(float *)&double v20 = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [WeakRetained packetArrivalTimestampFromAudioTime:v20]));

    __int128 v22 = *(void **)(a1 + 32);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:v30]);
    [v22 logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:v21 loggableSharedUserId:v23];

    id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16LL));
    [v18 start];
    double v26 = v25 + 1.0;
    *(float *)&double v26 = v26;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v24 packetArrivalTimestampFromAudioTime:v26]));

    id v28 = *(void **)(a1 + 32);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:v30]);
    [v28 logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:v27 loggableSharedUserId:v29];
  }
}

void sub_10001F4B0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _delegate]);
  char v4 = objc_opt_respondsToSelector(v3, "speechServiceDidProduceLoggablePackage:");

  if ((v4 & 1) != 0)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = *(double *)(*(void *)(a1 + 32) + 160LL);
    BOOL v7 = [(id)qword_1000495E0 count] != 0;
    uint64_t v69 = a1;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained modelInfo]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceCommandCandidatePackage:]( &OBJC_CLASS___CESRUtilities,  "afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceC ommandCandidatePackage:",  v5,  v7,  v9,  0LL,  v6));

    a1 = v69;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v69 + 32) _delegate]);
    [v11 performSelector:"speechServiceDidProduceLoggablePackage:" withObject:v10];

    if (!v10 || !*(void *)(*(void *)(v69 + 32) + 128LL)) {
      goto LABEL_38;
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 rawRecognition]);
    int v13 = (void *)v12;
    if (v12)
    {
      id v68 = (void *)v12;
      double v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v69 + 32) + 128) taskName]);
      if (([v14 isEqualToString:@"Dictation"] & 1) == 0)
      {

LABEL_36:
        int v13 = v68;
        goto LABEL_37;
      }

      uint64_t v67 = v10;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v69 + 32) + 128) applicationName]);
      unsigned int v16 = [v15 isEqualToString:@"com.apple.MobileSMS"];

      id v10 = v67;
      int v13 = v68;
      if (v16)
      {
        id v66 = v2;
        unsigned int v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue([v68 phrases]);
        id v72 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
        if (v72)
        {
          uint64_t v71 = *(void *)v79;
          do
          {
            for (i = 0LL; i != v72; i = (char *)i + 1)
            {
              if (*(void *)v79 != v71) {
                objc_enumerationMutation(obj);
              }
              double v19 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)i);
              double v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "interpretations", v66));
              id v21 = [v20 count];

              if (v21)
              {
                id v73 = i;
                __int128 v76 = 0u;
                __int128 v77 = 0u;
                __int128 v74 = 0u;
                __int128 v75 = 0u;
                __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v19 interpretations]);
                id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
                id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 tokens]);

                id v25 = [v24 countByEnumeratingWithState:&v74 objects:v86 count:16];
                if (!v25) {
                  goto LABEL_28;
                }
                id v26 = v25;
                uint64_t v27 = *(void *)v75;
                while (1)
                {
                  for (j = 0LL; j != v26; j = (char *)j + 1)
                  {
                    if (*(void *)v75 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    id v29 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)j);
                    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 text]);
                    if (([v30 hasSuffix:@"\\jit"] & 1) == 0)
                    {
                      id v32 = (void *)objc_claimAutoreleasedReturnValue([v29 text]);
                      if ([v32 hasSuffix:@"\\entity-first"])
                      {
                        uint64_t v33 = qword_1000495F8;

                        if (!v33) {
                          continue;
                        }
LABEL_23:
                        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 text]);
                        -[NSMutableArray addObject:](v17, "addObject:", v30);
                      }

                      else
                      {
                      }

                      continue;
                    }

                    uint64_t v31 = qword_1000495F8;

                    if (v31) {
                      goto LABEL_23;
                    }
                  }

                  id v26 = [v24 countByEnumeratingWithState:&v74 objects:v86 count:16];
                  if (!v26)
                  {
LABEL_28:

                    i = v73;
                    break;
                  }
                }
              }
            }

            id v72 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
          }

          while (v72);
        }

        if (qword_1000495F8 && -[NSMutableArray count](v17, "count"))
        {
          uint64_t v34 = (void *)qword_1000495F8;
          int v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v69 + 32) + 128) interactionId]);
          [v34 setObject:v17 forKey:v35];
        }

        uint64_t v2 = v66;
        id v10 = v67;
        a1 = v69;
        goto LABEL_36;
      }
    }

LABEL_37:
LABEL_38:
  }

  uint64_t v36 = *(void *)(a1 + 40);
  int v37 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  [v2 logPackageGeneratedAndRecognitionResultTier1WithEARPackage:v36 loggableSharedUserId:0 timeInTicks:v38];

  double v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) unrepairedRecognition]);
  double v40 = (void *)objc_claimAutoreleasedReturnValue([v39 oneBest]);
  double v41 = (void *)objc_claimAutoreleasedReturnValue(+[CESRUtilities earTokensToString:](&OBJC_CLASS___CESRUtilities, "earTokensToString:", v40));

  v42 = (void *)objc_claimAutoreleasedReturnValue([v2 selfHelper]);
  [v42 setUnrepairedPostItn:v41];

  id v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preITNRecognition]);
  unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v43 oneBest]);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 firstObject]);

  if (v45)
  {
    [v45 silenceStart];
    double v47 = v46;
    [*(id *)(a1 + 40) utteranceStart];
    double v49 = v47 + v48;
    float v50 = v49;
    uint64_t v51 = a1;
    *(float *)&double v49 = v50;
    double v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _packetReadyUpstreamTimestampsFromAudioTime:v49]);
    [v2 logAudioPacketContainingEndOfFirstWordReadyUpstreamWithTimeInTicks:v52];
    uint64_t v53 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      double v62 = *(void **)(v51 + 32);
      double v63 = v53;
      *(float *)&double v64 = v50;
      double v65 = (void *)objc_claimAutoreleasedReturnValue([v62 _recordedTimestampFromAudioTime:v64]);
      *(_DWORD *)buf = 136315394;
      id v83 = "-[ESConnection speechRecognizer:didProduceLoggablePackage:]_block_invoke";
      __int16 v84 = 2112;
      uint64_t v85 = v65;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEBUG,  "%s EmbeddedSpeechMetric: end of first word recorded in ticks (user-facing TTFW start): %@",  buf,  0x16u);

      uint64_t v53 = (void *)AFSiriLogContextSpeech;
    }

    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v83 = "-[ESConnection speechRecognizer:didProduceLoggablePackage:]_block_invoke";
      __int16 v84 = 2112;
      uint64_t v85 = v52;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v53,  OS_LOG_TYPE_DEBUG,  "%s EmbeddedSpeechMetric: packet containing end of first word ready upstream in ticks (ASR-component TTFW start): %@",  buf,  0x16u);
    }

    uint64_t v54 = v51;
    id v55 = objc_loadWeakRetained((id *)(*(void *)(v51 + 32) + 16LL));
    [v45 start];
    *(float *)&double v56 = v56;
    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v55 packetArrivalTimestampFromAudioTime:v56]));

    [v2 logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:v57 loggableSharedUserId:0];
    id v58 = objc_loadWeakRetained((id *)(*(void *)(v54 + 32) + 16LL));
    [v45 start];
    double v60 = v59 + 1.0;
    *(float *)&double v60 = v60;
    double v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v58 packetArrivalTimestampFromAudioTime:v60]));

    if ([v61 unsignedLongLongValue]) {
      [v2 logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:v61 loggableSharedUserId:0];
    }
  }
}

void sub_10001FBE8(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    int v10 = 136316674;
    uint64_t v11 = "-[ESConnection speechRecognizer:didProduceEndpointFeaturesWithWordCount:trailingSilenceDuration:eosLikelihood:"
          "pauseCounts:silencePosterior:processedAudioDurationInMilliseconds:acousticEndpointerScore:]_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s wordCount = %ld, trailingSilenceDuration = %ld, eosLikelihood = %f, pauseCounts = %@, silencePosterior = %f, ac ousticEndpointerScore = %f",  (uint8_t *)&v10,  0x48u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _delegate]);
  [v9 speechServiceDidProduceEndpointFeaturesWithWordCount:*(void *)(a1 + 48) trailingSilenceDuration:*(void *)(a1 + 56) eosLikelihood:*(void *)(a1 + 32) pauseCounts:*(void *)(a1 + 88) silencePoster ior:*(double *)(a1 + 64) processedAudioDurationInMilliseconds:*(double *)(a1 + 72) acousticEndpointerScore:*(double *)(a1 + 80)];
}

uint64_t sub_10001FD04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001FD14(uint64_t a1)
{
}

uint64_t sub_10001FD1C(void *a1)
{
  uint64_t v2 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]_block_invoke";
    __int16 v21 = 2112;
    uint64_t v22 = v3;
    __int16 v23 = 2112;
    uint64_t v24 = v4;
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Starting model compilation for the primary %@ asset: %@, using config at path: %@",  buf,  0x2Au);
  }

  uint64_t v6 = a1[6];
  uint64_t v7 = *(void *)(a1[9] + 8LL);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = +[_EARSpeechRecognizer compileRecognizerModels2WithConfiguration:error:]( &OBJC_CLASS____EARSpeechRecognizer,  "compileRecognizerModels2WithConfiguration:error:",  v6,  &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) != 0)
  {
    uint64_t v9 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      uint64_t v11 = a1[5];
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Finished model compilation for the primary %@ asset: %@",  buf,  0x20u);
    }
  }

  else
  {
    __int16 v12 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
    {
      uint64_t v15 = a1[4];
      uint64_t v16 = a1[5];
      uint64_t v17 = *(void *)(*(void *)(a1[9] + 8LL) + 40LL);
      *(_DWORD *)buf = 136315906;
      __int16 v20 = "-[ESConnection compilePrimaryAssistantAssetWithCompletion:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "%s Model compilation failed for the primary %@ asset: %@, error: %@",  buf,  0x2Au);
    }
  }

  uint64_t v13 = a1[8];
  if (v13) {
    uint64_t v13 = (*(uint64_t (**)(uint64_t, void))(v13 + 16))(v13, *(void *)(*(void *)(a1[9] + 8LL) + 40LL));
  }
  return xpc_transaction_exit_clean(v13);
}

void sub_10001FF38(uint64_t a1)
{
  uint64_t v7 = 0LL;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10001FD04;
  uint64_t v11 = sub_10001FD14;
  id v12 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100020024;
  v4[3] = &unk_100040FD8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = &v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v8[5]);
  }
  xpc_transaction_exit_clean(v3);

  _Block_object_dispose(&v7, 8);
}

void sub_10002000C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100020024(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "-[ESConnection compileAllAssetsWithType:completion:]_block_invoke_2";
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Starting model compilation for %@ asset: %@, using config at path: %@",  buf,  0x2Au);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v11 + 40);
  unsigned __int8 v12 = +[_EARSpeechRecognizer compileRecognizerModels2WithConfiguration:error:]( &OBJC_CLASS____EARSpeechRecognizer,  "compileRecognizerModels2WithConfiguration:error:",  v8,  &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if ((v12 & 1) != 0)
  {
    uint64_t v13 = (os_log_s *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "-[ESConnection compileAllAssetsWithType:completion:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Finished model compilation for %@ asset: %@",  buf,  0x20u);
    }
  }

  else
  {
    uint64_t v15 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      *(_DWORD *)buf = 136315906;
      __int16 v20 = "-[ESConnection compileAllAssetsWithType:completion:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "%s Model compilation failed for %@ asset: %@, error: %@",  buf,  0x2Au);
    }

    *a4 = 1;
  }
}

void sub_100020250(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v13 = 0LL;
  unsigned __int8 v5 = [v2 purgeInstalledAssetsExceptLanguages:v3 assetType:v4 error:&v13];
  id v6 = v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100020320;
  v9[3] = &unk_100040F88;
  id v7 = *(id *)(a1 + 40);
  unsigned __int8 v12 = v5;
  id v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(&_dispatch_main_q, v9);
}

uint64_t sub_100020320(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))( result,  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 32));
  }
  return result;
}

void sub_100020340(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v15 = 0LL;
  unsigned int v4 = [v2 purgeInstalledAssetsExceptLanguages:v3 assetType:3 error:&v15];
  id v5 = v15;

  id v6 = &off_100043068;
  if (v4) {
    id v6 = &off_100043050;
  }
  id v7 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100020444;
  v11[3] = &unk_100040F60;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v12 = v7;
  id v9 = v5;
  id v10 = v7;
  dispatch_async(&_dispatch_main_q, v11);
}

uint64_t sub_100020444(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void sub_100020460(uint64_t a1)
{
  uint64_t v79 = 0LL;
  __int128 v80 = &v79;
  uint64_t v81 = 0x3032000000LL;
  v82 = sub_10001FD04;
  id v83 = sub_10001FD14;
  id v84 = 0LL;
  uint64_t v2 = -[SFEntitledAssetConfig initWithLanguage:task:]( objc_alloc(&OBJC_CLASS___SFEntitledAssetConfig),  "initWithLanguage:task:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
  uint64_t v40 = a1;
  uint64_t v73 = 0LL;
  __int128 v74 = &v73;
  uint64_t v75 = 0x3032000000LL;
  __int128 v76 = sub_10001FD04;
  __int128 v77 = sub_10001FD14;
  id v78 = 0LL;
  uint64_t v3 = (dispatch_queue_s *)qword_100049570;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020C8C;
  block[3] = &unk_100040EE8;
  uint64_t v71 = &v73;
  id v32 = v2;
  os_signpost_id_t v70 = v32;
  id v72 = &v79;
  dispatch_sync(v3, block);
  if (v74[5])
  {
    int v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v63 = 0LL;
    double v64 = &v63;
    uint64_t v65 = 0x3032000000LL;
    id v66 = sub_10001FD04;
    uint64_t v67 = sub_10001FD14;
    id v68 = 0LL;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[CESRUtilities speechProfilePathsWithLanguage:]( &OBJC_CLASS___CESRUtilities,  "speechProfilePathsWithLanguage:",  *(void *)(v40 + 32),  v32));
    if ([v33 count] == (id)1)
    {
      unsigned int v4 = objc_alloc(&OBJC_CLASS___NSData);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v33 firstObject]);
      id v6 = -[NSData initWithContentsOfFile:options:error:](v4, "initWithContentsOfFile:options:error:", v5, 0LL, 0LL);
      id v7 = (void *)v64[5];
      v64[5] = (uint64_t)v6;
    }

    id v8 = v64;
    id v9 = (os_log_s *)AFSiriLogContextFides;
    if (v64[5])
    {
      id v10 = (os_log_s *)AFSiriLogContextFides;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(id)v8[5] length];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ESConnection redecodeWithAudioDatas:language:task:samplingRate:completion:]_block_invoke";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Loaded speech profile: %lu bytes",  buf,  0x16u);
      }
    }

    else if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ESConnection redecodeWithAudioDatas:language:task:samplingRate:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Unable to load speech profile", buf, 0xCu);
    }

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id obj = *(id *)(v40 + 48);
    id v36 = [obj countByEnumeratingWithState:&v59 objects:v93 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v60;
      while (2)
      {
        double v39 = 0LL;
        do
        {
          if (*(void *)v60 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)v39);
          if ([*(id *)(v40 + 56) _invalidated])
          {
            id v28 = (os_log_s *)AFSiriLogContextFides;
            if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "-[ESConnection redecodeWithAudioDatas:language:task:samplingRate:completion:]_block_invoke";
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s Interrupted corrected text evaluation redecoding",  buf,  0xCu);
            }

            NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
            uint64_t v92 = @"Interrupted corrected text redecoding during speech recognition";
            id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
            uint64_t v30 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1101LL,  v29));
            uint64_t v31 = (void *)v80[5];
            v80[5] = v30;

            (*(void (**)(void))(*(void *)(v40 + 64) + 16LL))();
            goto LABEL_45;
          }

          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          v88 = sub_10001FD04;
          id v89 = sub_10001FD14;
          id v90 = 0LL;
          id v12 = (dispatch_queue_s *)qword_100049570;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472LL;
          v50[2] = sub_100020D0C;
          v50[3] = &unk_100040F10;
          id v55 = buf;
          double v56 = &v73;
          id v51 = *(id *)(v40 + 48);
          uint64_t v52 = v38;
          __int128 v57 = &v63;
          id v53 = *(id *)(v40 + 32);
          id v13 = *(id *)(v40 + 40);
          uint64_t v14 = *(void *)(v40 + 72);
          id v54 = v13;
          uint64_t v58 = v14;
          dispatch_sync(v12, v50);
          double v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          id v15 = *(void **)(*(void *)&buf[8] + 40LL);
          if (v15 && [v15 count])
          {
            __int128 v48 = 0u;
            __int128 v49 = 0u;
            __int128 v46 = 0u;
            __int128 v47 = 0u;
            id v16 = *(id *)(*(void *)&buf[8] + 40LL);
            id v17 = [v16 countByEnumeratingWithState:&v46 objects:v86 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v47;
              do
              {
                uint64_t v19 = 0LL;
                do
                {
                  if (*(void *)v47 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  __int16 v20 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v19);
                  __int16 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  __int128 v44 = 0u;
                  __int128 v45 = 0u;
                  __int128 v42 = 0u;
                  __int128 v43 = 0u;
                  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 preITNTokens]);
                  id v23 = [v22 countByEnumeratingWithState:&v42 objects:v85 count:16];
                  if (v23)
                  {
                    uint64_t v24 = *(void *)v43;
                    do
                    {
                      __int16 v25 = 0LL;
                      do
                      {
                        if (*(void *)v43 != v24) {
                          objc_enumerationMutation(v22);
                        }
                        -[NSMutableArray addObject:](v21, "addObject:", v26);

                        __int16 v25 = (char *)v25 + 1;
                      }

                      while (v23 != v25);
                      id v23 = [v22 countByEnumeratingWithState:&v42 objects:v85 count:16];
                    }

                    while (v23);
                  }

                  if (-[NSMutableArray count](v21, "count")) {
                    -[NSMutableArray addObject:](v41, "addObject:", v21);
                  }

                  uint64_t v19 = (char *)v19 + 1;
                }

                while (v19 != v17);
                id v17 = [v16 countByEnumeratingWithState:&v46 objects:v86 count:16];
              }

              while (v17);
            }
          }

          if (-[NSMutableArray count](v41, "count")) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v41, v38);
          }

          _Block_object_dispose(buf, 8);
          double v39 = (char *)v39 + 1;
        }

        while (v39 != v36);
        id v36 = [obj countByEnumeratingWithState:&v59 objects:v93 count:16];
        if (v36) {
          continue;
        }
        break;
      }
    }

    uint64_t v27 = *(void *)(v40 + 64);
    if (v27) {
      (*(void (**)(uint64_t, NSMutableDictionary *, void))(v27 + 16))(v27, v35, 0LL);
    }
LABEL_45:

    _Block_object_dispose(&v63, 8);
  }

  else
  {
    (*(void (**)(void))(*(void *)(v40 + 64) + 16LL))(*(void *)(v40 + 64));
  }

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);
}

void sub_100020C00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_100020C8C(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[ESConnection _speechRecognizerWithAssetConfig:enableITN:isHighPriority:error:]( &OBJC_CLASS___ESConnection,  "_speechRecognizerWithAssetConfig:enableITN:isHighPriority:error:",  v2,  0LL,  0LL,  &obj));
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100020D0C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue( [v2 recognitionResultsWithAudioData:v6 userProfileData:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) language:*(void *)(a1 + 48) task:*(void *)(a1 + 56) samplingRate:*(void *)(a1 + 88) extraLanguageModel:0]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_100020D8C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[ESConnection _scheduleCompilationTimerForAssetType:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Model compilation timer for %@ assets fired.",  (uint8_t *)&v5,  0x16u);
  }

  return [*(id *)(a1 + 40) compileAllAssetsWithType:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

id sub_100020E4C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100049580;
  if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[ESConnection _scheduleCacheResetTimer:]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Cache reset timer fired.",  (uint8_t *)&v4,  0xCu);
  }

  return [*(id *)(a1 + 32) resetCacheWithCompletion:*(void *)(a1 + 40)];
}

void sub_100020EF8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = &AFAnalyticsEventCreateCurrent_ptr;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v64 objects:v73 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = &AFAnalyticsEventCreateCurrent_ptr;
      uint64_t v15 = *(void *)v65;
      id v58 = v8;
      id v59 = v7;
      uint64_t v56 = a1;
      __int128 v57 = a4;
      id v55 = v11;
      uint64_t v52 = *(void *)v65;
      while (2)
      {
        uint64_t v16 = 0LL;
        id v53 = v13;
        do
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v54 = v16;
          id v17 = *(void **)(*((void *)&v64 + 1) + 8 * v16);
          uint64_t v18 = objc_opt_class(v9[127]);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
          {
            uint64_t v46 = kAFAssistantErrorDomain;
            NSErrorUserInfoKey v71 = NSLocalizedFailureReasonErrorKey;
            __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not an array: %@",  v17));
            id v72 = v47;
            __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
            uint64_t v49 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v46,  1102LL,  v48));
            uint64_t v50 = *(void *)(*(void *)(a1 + 40) + 8LL);
            id v51 = *(void **)(v50 + 40);
            *(void *)(v50 + 40) = v49;

            *a4 = 1;
            goto LABEL_21;
          }

          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14[138] array]);
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          id v20 = v17;
          id v21 = [v20 countByEnumeratingWithState:&v60 objects:v70 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v61;
            while (2)
            {
              for (i = 0LL; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v61 != v23) {
                  objc_enumerationMutation(v20);
                }
                __int16 v25 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
                uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0)
                {
                  uint64_t v40 = kAFAssistantErrorDomain;
                  NSErrorUserInfoKey v68 = NSLocalizedFailureReasonErrorKey;
                  double v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not a dictionary: %@",  v20));
                  uint64_t v69 = v41;
                  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
                  uint64_t v43 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v40,  1102LL,  v42));
                  uint64_t v44 = *(void *)(*(void *)(v56 + 40) + 8LL);
                  __int128 v45 = *(void **)(v44 + 40);
                  *(void *)(v44 + 40) = v43;

                  *__int128 v57 = 1;
                  id v8 = v58;
                  id v7 = v59;
                  id v11 = v55;
                  goto LABEL_21;
                }

                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"orth"]);
                id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"prons"]);
                id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v28));

                uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"tag"]);
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"freq"]);
                id v32 = [v31 integerValue];

                id v33 = [[_EARWordPart alloc] initWithOrthography:v27 pronunciations:v29 tagName:v30 frequency:v32];
                [v19 addObject:v33];
              }

              id v22 = [v20 countByEnumeratingWithState:&v60 objects:v70 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          a1 = v56;
          id v7 = v59;
          [*(id *)(v56 + 32) addWordWithParts:v19 templateName:v59];

          uint64_t v16 = v54 + 1;
          a4 = v57;
          id v8 = v58;
          id v11 = v55;
          id v9 = &AFAnalyticsEventCreateCurrent_ptr;
          uint64_t v14 = &AFAnalyticsEventCreateCurrent_ptr;
          uint64_t v15 = v52;
        }

        while ((id)(v54 + 1) != v53);
        id v13 = [v55 countByEnumeratingWithState:&v64 objects:v73 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

LABEL_21:
  }

  else
  {
    uint64_t v34 = kAFAssistantErrorDomain;
    NSErrorUserInfoKey v74 = NSLocalizedFailureReasonErrorKey;
    int v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not an array: %@",  v8));
    uint64_t v75 = v35;
    id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v75,  &v74,  1LL));
    uint64_t v37 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v34,  1102LL,  v36));
    uint64_t v38 = *(void *)(*(void *)(a1 + 40) + 8LL);
    double v39 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = v37;

    *a4 = 1;
  }
}

void sub_10002141C(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  [v1 cleanupUnusedSubscriptions];
}

void sub_100021450(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  [v1 handlePostUpgradeSubscriptions];
}

void sub_100021484(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v12 = a2;
  double v8 = *(float *)(a1 + 48);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 240) objectAtIndexedSubscript:a3]);
  [v9 doubleValue];
  double v11 = v10;

  if (v11 >= v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

void sub_100021520(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
  [*(id *)(*(void *)(a1 + 32) + 120) addAudioPacket:v3];
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _audioDataPostRecognitionStart:v3]);

  [v5 setData:v4];
  if (v4) {
    [*(id *)(a1 + 32) _processAudioPacket:v5];
  }
}

NSMutableDictionary *sub_1000215AC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = v5;
  if (v3) {
    -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v3);
  }
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v4, @"ModelOverrideURL");
  }

  return v6;
}

id sub_100021624(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (!v2)
  {
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
    id v5 = sub_1000216B4(v3, @"etiquette.json", v4);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  }

  return v2;
}

id sub_1000216B4(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ESAssetManager sharedInstance](&OBJC_CLASS___ESAssetManager, "sharedInstance"));
  id v31 = 0LL;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 installedQuasarModelPathForAssetConfig:v5 error:&v31]);
  id v9 = v31;

  if (v8)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v6]);
    id v30 = v9;
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v10,  0LL,  &v30));
    id v12 = v30;

    if (!v11)
    {
      uint64_t v18 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForAssetConfig";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v33 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Could not read %@: %@", buf, 0x20u);
      }

      id v16 = 0LL;
      goto LABEL_21;
    }

    id v29 = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v11,  0LL,  &v29));
    id v14 = v29;

    if (v13)
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
      {
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000LL;
        LOBYTE(v33) = 1;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_100021F98;
        v25[3] = &unk_100041238;
        uint64_t v28 = a3;
        id v26 = v6;
        uint64_t v27 = buf;
        [v13 enumerateKeysAndObjectsUsingBlock:v25];
        if (*(_BYTE *)(*(void *)&buf[8] + 24LL)) {
          id v16 = v13;
        }
        else {
          id v16 = 0LL;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_20;
      }

      id v20 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        id v22 = v20;
        uint64_t v23 = (void *)objc_opt_class(v13);
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForAssetConfig";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v33 = v23;
        id v24 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s %@ is wrong type: %@", buf, 0x20u);
      }
    }

    else
    {
      uint64_t v19 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "ReplacementDictionaryForAssetConfig";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v33 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Could not parse %@: %@", buf, 0x20u);
      }
    }

    id v16 = 0LL;
LABEL_20:

    id v12 = v14;
LABEL_21:

    id v9 = v12;
    goto LABEL_22;
  }

  id v17 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "ReplacementDictionaryForAssetConfig";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Could not locate asset: %@", buf, 0x16u);
  }

  id v16 = 0LL;
LABEL_22:

  return v16;
}

void sub_100021AC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_100021AE0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:&off_100043080 forKey:a2];
}

void sub_100021AF4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 320LL);
      *(_DWORD *)buf = 136315394;
      int v35 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Fetching contextual data for task: %@",  buf,  0x16u);
      uint64_t v2 = *(void **)(a1 + 32);
    }

    [v2 fetchNamedEntitiesWithTimeInterval:0.0];
    unsigned int v5 = [*(id *)(a1 + 32) containsEntity];
  }

  else
  {
    unsigned int v5 = 0;
  }

  id v6 = [*(id *)(a1 + 48) count];
  if ((v5 & 1) != 0 || v6)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) modelOverrideURL]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    uint64_t v11 = *(void *)(a1 + 72);
    id v33 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v7 _userProfileWithAssetConfig:v8 modelOverridePath:v10 overrides:v11 isJit:1 returningFoundPath:0 error:&v33]);
    id v13 = v33;

    if (v12)
    {
      if ([*(id *)(a1 + 48) count])
      {
        [v12 createInlineLmeUserDataForContextStrings:*(void *)(a1 + 48)];
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 dataProfile]);
        uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8LL);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
      }

      else if (v5)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contextualData]);

        if (v18)
        {
          uint64_t v19 = (os_log_s *)AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            int v35 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Injecting contextual data to recognizer",  buf,  0xCu);
          }

          id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contextualData]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) profile]);
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v12 createInlineLmeUserDataForContextData:v20 speechProfile:v21]);
          uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8LL);
          id v24 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = v22;

          __int16 v25 = (void *)AFSiriLogContextSpeech;
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
          {
            id v26 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
            uint64_t v27 = v25;
            id v28 = [v26 length];
            *(_DWORD *)buf = 136315394;
            int v35 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
            __int16 v36 = 2048;
            id v37 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s Built inline LME from contextual data, size: %zu",  buf,  0x16u);
          }
        }
      }

      id v29 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
      uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
      uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8LL);
      id v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;
    }

    else
    {
      id v17 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        int v35 = "-[ESConnection startSpeechRecognitionWithParameters:didStartHandlerWithInfo:]_block_invoke";
        __int16 v36 = 2112;
        id v37 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Failed to initialize jit profile builder due to error : %@",  buf,  0x16u);
      }
    }
  }

id sub_100021E7C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 samplingRateFilter]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 taskTypeFilter]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 farFieldFilter]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v1 deviceIdFilter]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v1 bluetoothDeviceIdFilter]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v1 aneContextFilter]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v1 cpuContextFilter]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v1 gpuContextFilter]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sampling rate = %@\ntask type = %@\nfar field = %@\ndevice ID = %@\n[DEPRECATED] bluetooth device ID = %@\nANE context = %@\nCPU context = %@\nGPU context = %@\n",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9));
  return v10;
}

void sub_100021F98(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0 || (objc_opt_isKindOfClass(v8, a1[6]) & 1) == 0)
  {
    double v10 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[4];
      int v12 = 136315906;
      id v13 = "ReplacementDictionaryForAssetConfig_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s %@ contains bogus key/value pair: %@ => %@",  (uint8_t *)&v12,  0x2Au);
    }

    *a4 = 1;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
  }
}

void sub_1000220D4(id a1, CESRSpeechParametersMutating *a2)
{
}

void sub_1000220E0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 modelVersion]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 modelType]);

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

void sub_100022164(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v13 = 0LL;
    goto LABEL_11;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"quasarModelPath"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"type"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"mini.json"]);
  if ((+[CESRUtilities isFilePathValid:](&OBJC_CLASS___CESRUtilities, "isFilePathValid:", v9) & 1) != 0)
  {
    id v10 = [[_EARSpeechModelInfo alloc] initWithConfig:v9];
    uint64_t v11 = v10;
    if (v10)
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 version]);
      id v13 = [[CESRModelProperties alloc] initWithModelVersion:v12 modelType:v8 modelRoot:v7];
    }

    else
    {
      id v13 = 0LL;
    }

LABEL_11:
    uint64_t v19 = *(void *)(a1 + 32);
    if (v19)
    {
      if (v13) {
        id v20 = 0LL;
      }
      else {
        id v20 = v6;
      }
      (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v13, v20);
    }

    goto LABEL_16;
  }

  uint64_t v14 = kAFAssistantErrorDomain;
  NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No file at path: %@",  v9));
  id v26 = v15;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  600LL,  v16));

  __int16 v18 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "-[ESConnection fetchModelPropertiesForAssetConfig:completion:]_block_invoke";
    __int16 v23 = 2112;
    id v24 = v17;
    _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%s %@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();

  id v13 = 0LL;
LABEL_16:
}

uint64_t sub_100022400(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 112LL);
  return result;
}

void sub_100022414(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)qword_100049580;
    if (os_log_type_enabled((os_log_t)qword_100049580, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener _UUID](&OBJC_CLASS___NSXPCListener, "_UUID"));
      int v17 = 136315650;
      __int16 v18 = "-[ESConnection initWithXPCConnection:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = WeakRetained;
      __int16 v21 = 2114;
      uint64_t v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s %{public}@ cancelling instance %{public}@",  (uint8_t *)&v17,  0x20u);
    }

    id v5 = objc_loadWeakRetained(WeakRetained + 2);
    [v5 cancelRecognition];

    id v6 = objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v7 = qword_100049588;

    if (v6 == (id)v7)
    {
      id v8 = (void *)qword_100049588;
      qword_100049588 = 0LL;
    }

    objc_storeWeak(WeakRetained + 2, 0LL);
    objc_storeWeak(WeakRetained + 1, 0LL);
    [WeakRetained[4] invalidate];
    id v9 = WeakRetained[4];
    WeakRetained[4] = 0LL;

    id v10 = WeakRetained[13];
    WeakRetained[13] = 0LL;

    *((_BYTE *)WeakRetained + 112) = 1;
    id v11 = WeakRetained[9];
    WeakRetained[9] = 0LL;

    id v12 = WeakRetained[10];
    WeakRetained[10] = 0LL;

    id v13 = WeakRetained[29];
    WeakRetained[29] = 0LL;

    id v14 = WeakRetained[30];
    WeakRetained[30] = 0LL;

    id v15 = WeakRetained[35];
    WeakRetained[35] = 0LL;

    id v16 = objc_loadWeakRetained(WeakRetained + 36);
    [v16 cancelRecognition];
  }
}

void sub_100024D28(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v5 selfHelper]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 asrId]);

  if (v3)
  {
    [v5 logAppleNeuralEngineModelInitializationEndedWithTimeInTicks:*(void *)(a1 + 32) fileName:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[ESSelfHelper createANEModelInitializationEndedEventWithTimeStamp:fileName:]( &OBJC_CLASS___ESSelfHelper,  "createANEModelInitializationEndedEventWithTimeStamp:fileName:",  *(void *)(a1 + 32),  *(void *)(a1 + 40)));
    +[ESConnection _addPendingProfilerANEModelInitializationEvent:]( &OBJC_CLASS___ESConnection,  "_addPendingProfilerANEModelInitializationEvent:",  v4);
  }
}

void sub_100024DD0(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ESProfiler sharedProfiler](&OBJC_CLASS___ESProfiler, "sharedProfiler"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v5 selfHelper]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 asrId]);

  if (v3)
  {
    [v5 logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:*(void *)(a1 + 32) fileName:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[ESSelfHelper createANEModelInitializationStartedEventWithTimeStamp:fileName:]( &OBJC_CLASS___ESSelfHelper,  "createANEModelInitializationStartedEventWithTimeStamp:fileName:",  *(void *)(a1 + 32),  *(void *)(a1 + 40)));
    +[ESConnection _addPendingProfilerANEModelInitializationEvent:]( &OBJC_CLASS___ESConnection,  "_addPendingProfilerANEModelInitializationEvent:",  v4);
  }
}

void sub_100024E78(id a1)
{
}

void sub_100024E84(id a1)
{
  id v1 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_1000495A0;
  qword_1000495A0 = v2;
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = objc_autoreleasePoolPush();
  signal(15, (void (__cdecl *)(int))1);
  unsetenv("TMPDIR");
  id v4 = NSTemporaryDirectory();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v6);

  if (v7)
  {
    dispatch_source_set_event_handler(v7, &stru_100041278);
    dispatch_resume(v7);
  }

  sub_10000C76C();
  +[ESConnection captureESStartTimeInTicks](&OBJC_CLASS___ESConnection, "captureESStartTimeInTicks");
  +[ESSelfHelper initializeSharedPowerLoggerIfNeeded](&OBJC_CLASS___ESSelfHelper, "initializeSharedPowerLoggerIfNeeded");
  +[ESSelfHelper logPowerSnapshotForProcessStarted](&OBJC_CLASS___ESSelfHelper, "logPowerSnapshotForProcessStarted");
  +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
  id v8 = objc_alloc_init(&OBJC_CLASS___ESListenerDelegate);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v9 setDelegate:v8];
  [v9 resume];
  +[ESSelfHelper logPowerSnapshotForProcessEnded](&OBJC_CLASS___ESSelfHelper, "logPowerSnapshotForProcessEnded");
  exit(1);
}

void sub_1000269CC(id a1)
{
  id v1 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315138;
    id v3 = "main_block_invoke";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "%s Received SIGTERM. Cleaning and Exiting",  (uint8_t *)&v2,  0xCu);
  }

  +[ESConnection prepareToExit](&OBJC_CLASS___ESConnection, "prepareToExit");
  exit(0);
}

id objc_msgSend__speechRecognizerWithAssetConfig_geoLMRegionId_enableITN_overrides_modelOverrideURL_preloadModels_requestSource_enableParallelLoading_isHighPriority_geoLMLoadedOut_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_speechRecognizerWithAssetConfig:geoLMRegionId:enableITN:overrides:modelOverrideURL:preloadModels:requestSour ce:enableParallelLoading:isHighPriority:geoLMLoadedOut:error:");
}

id objc_msgSend__userProfileWithAssetConfig_modelOverridePath_overrides_isJit_returningFoundPath_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:");
}

id objc_msgSend_afMultiUserSpeechPackageForEARPackages_processedAudioDuration_speechProfiles_recognizerModelInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "afMultiUserSpeechPackageForEARPackages:processedAudioDuration:speechProfiles:recognizerModelInfo:");
}

id objc_msgSend_afSpeechPackageForEARPackage_processedAudioDuration_speechProfileUsed_recognizerModelInfo_isVoiceCommandCandidatePackage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "afSpeechPackageForEARPackage:processedAudioDuration:speechProfileUsed:recognizerModelInfo:isVoiceCommandCandidatePackage:");
}

id objc_msgSend_initWithConfiguration_language_overrides_sdapiOverrides_emptyVoc_pgVoc_paramsetHolder_isJit_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:");
}

id objc_msgSend_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSp eakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:");
}

id objc_msgSend_initWithOrthography_pronunciations_tagName_frequency_phoneticOrthography_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOrthography:pronunciations:tagName:frequency:phoneticOrthography:");
}

id objc_msgSend_initWithPacketRecordedTimeInTicks_packetReadyUpstreamTimeInTicks_packetReceivedTime_packetReceivedTimeInTicks_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithPacketRecordedTimeInTicks:packetReadyUpstreamTimeInTicks:packetReceivedTime:packetReceivedTimeInTicks:");
}

id objc_msgSend_initWithRecognition_unfilteredRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_latticeMitigatorResult_recognitionPaused_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigat orResult:recognitionPaused:");
}

id objc_msgSend_initWithUUIDString_language_task_codec_samplingRate_inferenceSpeakerCode_numTrainedFrames_trainingNnetVersion_isSpeakerCodeUsed_isSamplingForDictation_selfLogger_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithUUIDString:language:task:codec:samplingRate:inferenceSpeakerCode:numTrainedFrames:trainingNnetVersion :isSpeakerCodeUsed:isSamplingForDictation:selfLogger:");
}

id objc_msgSend_installationStatusForLanguagesIgnoringCache_assetType_withDetailedStatus_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installationStatusForLanguagesIgnoringCache:assetType:withDetailedStatus:withError:");
}

id objc_msgSend_installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:");
}

id objc_msgSend_installedModelInfoForAssetConfig_error_triggerDownload_ignoreSpellingModel_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedModelInfoForAssetConfig:error:triggerDownload:ignoreSpellingModel:");
}

id objc_msgSend_installedQuasarModelPathForAssetConfig_error_triggerDownload_ignoreSpellingModel_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedQuasarModelPathForAssetConfig:error:triggerDownload:ignoreSpellingModel:");
}

id objc_msgSend_logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks_fileName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logAppleNeuralEngineModelInitializationStartedOrChangedWithTimeInTicks:fileName:");
}

id objc_msgSend_logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks_loggableSharedUserId_earPackage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "logFinalAudioPacketContainingSpeechReadyUpstreamWithTimeInTicks:loggableSharedUserId:earPackage:");
}

id objc_msgSend_logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks_loggableSharedUserId_earPackage_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logFinalAudioPacketContainingSpeechReceivedWithTimeInTicks:loggableSharedUserId:earPackage:");
}

id objc_msgSend_logFinalResultGeneratedWithEARPackage_correctAlignedPartialResultIndexList_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logFinalResultGeneratedWithEARPackage:correctAlignedPartialResultIndexList:");
}

id objc_msgSend_logFinalResultGeneratedWithEARPackage_firstSeenPartialResultTokens_partialResultOffset_timeInTicks_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "logFinalResultGeneratedWithEARPackage:firstSeenPartialResultTokens:partialResultOffset:timeInTicks:");
}

id objc_msgSend_logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks_loggableSharedUserId_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logFirstAudioPacketContainingSpeechReceivedWithTimeInTicks:loggableSharedUserId:");
}

id objc_msgSend_logInitializationStartedOrChangedWithTimeInTicks_cachedRecognizerExisted_newRecognizerCreated_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "logInitializationStartedOrChangedWithTimeInTicks:cachedRecognizerExisted:newRecognizerCreated:");
}

id objc_msgSend_logIntermediateUtteranceInfoTier1WithUnrepairedPostItn_loggableSharedUserId_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logIntermediateUtteranceInfoTier1WithUnrepairedPostItn:loggableSharedUserId:");
}

id objc_msgSend_logPackageGeneratedAndRecognitionResultTier1WithEARPackage_loggableSharedUserId_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logPackageGeneratedAndRecognitionResultTier1WithEARPackage:loggableSharedUserId:");
}

id objc_msgSend_logPackageGeneratedAndRecognitionResultTier1WithEARPackage_loggableSharedUserId_timeInTicks_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "logPackageGeneratedAndRecognitionResultTier1WithEARPackage:loggableSharedUserId:timeInTicks:");
}

id objc_msgSend_logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks_loggableSharedUserId_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logPostSpeechStartOneSecondLaterAudioPacketReceivedWithTimeInTicks:loggableSharedUserId:");
}

id objc_msgSend_logRequestEndedOrFailedOrCancelledWithError_recognizerComponents_averageActiveTokensPerFrame_languageModelInterpolationWeights_signalToNoiseRatioInDecibels_recognitionDurationInSec_audioDurationMs_eagerUsed_utteranceDetectionEnabled_utteranceConcatenationEnabled_cpuRealTimeFactor_numLmeDataStreams_phoneticMatchDecoderName_pauseDurations_itnDurationInNs_isEmojiPersonalizationUsed_isEmojiDisambiguationUsed_isEmojiExpectedButNotRecognized_recognizedEmojis_allItnRunIntervals_allSecondaryPassIntervals_powerLogEvent_aneUsed_language_modelVersion_applicationName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame:languageModelInt erpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:eagerUsed:utteranceDe tectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pau seDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecogni zed:recognizedEmojis:allItnRunIntervals:allSecondaryPassIntervals:powerLogEvent:aneUsed:language:modelVersion :applicationName:");
}

id objc_msgSend_logRequestEndedOrFailedOrCancelledWithError_recognizerComponents_averageActiveTokensPerFrame_languageModelInterpolationWeights_signalToNoiseRatioInDecibels_recognitionDurationInSec_audioDurationMs_eagerUsed_utteranceDetectionEnabled_utteranceConcatenationEnabled_cpuRealTimeFactor_numLmeDataStreams_phoneticMatchDecoderName_pauseDurations_itnDurationInNs_isEmojiPersonalizationUsed_isEmojiDisambiguationUsed_isEmojiExpectedButNotRecognized_recognizedEmojis_totalITNDurationInNs_totalITNRuns_totalSecondaryPassDurationInNs_totalSecondaryPasses_cpuInstructionsInMillionsPerSecond_aneUsed_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "logRequestEndedOrFailedOrCancelledWithError:recognizerComponents:averageActiveTokensPerFrame:languageModelInt erpolationWeights:signalToNoiseRatioInDecibels:recognitionDurationInSec:audioDurationMs:eagerUsed:utteranceDe tectionEnabled:utteranceConcatenationEnabled:cpuRealTimeFactor:numLmeDataStreams:phoneticMatchDecoderName:pau seDurations:itnDurationInNs:isEmojiPersonalizationUsed:isEmojiDisambiguationUsed:isEmojiExpectedButNotRecogni zed:recognizedEmojis:totalITNDurationInNs:totalITNRuns:totalSecondaryPassDurationInNs:totalSecondaryPasses:cp uInstructionsInMillionsPerSecond:aneUsed:");
}

id objc_msgSend_logRequestStartedOrChangedWithTask_modelLocale_modelVersion_isHighQualityAsset_hammerVersion_geoLanguageModelRegion_geoLanguageModelLoaded_speechProfileAgeInSec_dictationUIInteractionId_portraitExperimentVariantName_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "logRequestStartedOrChangedWithTask:modelLocale:modelVersion:isHighQualityAsset:hammerVersion:geoLanguageModel Region:geoLanguageModelLoaded:speechProfileAgeInSec:dictationUIInteractionId:portraitExperimentVariantName:");
}

id objc_msgSend_logRequestStartedOrChangedWithTask_modelLocale_modelVersion_isHighQualityAsset_hammerVersion_geoLanguageModelRegion_geoLanguageModelLoaded_speechProfileAgeInSec_dictationUIInteractionId_portraitExperimentVariantName_applicationName_powerLogEvent_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "logRequestStartedOrChangedWithTask:modelLocale:modelVersion:isHighQualityAsset:hammerVersion:geoLanguageModel Region:geoLanguageModelLoaded:speechProfileAgeInSec:dictationUIInteractionId:portraitExperimentVariantName:ap plicationName:powerLogEvent:");
}

id objc_msgSend_logSpeechProfileGenerationStartedOrUpdatedEventsWithPowerLogEvent_language_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logSpeechProfileGenerationStartedOrUpdatedEventsWithPowerLogEvent:language:");
}

id objc_msgSend_powerLogEventDictionaryWithPowerLogEvent_language_modelVersion_applicationName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerLogEventDictionaryWithPowerLogEvent:language:modelVersion:applicationName:");
}

id objc_msgSend_recognitionResultsWithAudioData_userProfileData_language_task_samplingRate_extraLanguageModel_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recognitionResultsWithAudioData:userProfileData:language:task:samplingRate:extraLanguageModel:");
}

id objc_msgSend_runRecognitionWithResultStream_speakerCodeWriter_language_task_samplingRate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runRecognitionWithResultStream:speakerCodeWriter:language:task:samplingRate:");
}

id objc_msgSend_speechServiceDidProduceEndpointFeaturesWithWordCount_trailingSilenceDuration_eosLikelihood_pauseCounts_silencePosterior_processedAudioDurationInMilliseconds_acousticEndpointerScore_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "speechServiceDidProduceEndpointFeaturesWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silenc ePosterior:processedAudioDurationInMilliseconds:acousticEndpointerScore:");
}

id objc_msgSend_userProfileWithAssetConfig_modelOverridePath_overrides_isJit_returningFoundPath_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userProfileWithAssetConfig:modelOverridePath:overrides:isJit:returningFoundPath:error:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}