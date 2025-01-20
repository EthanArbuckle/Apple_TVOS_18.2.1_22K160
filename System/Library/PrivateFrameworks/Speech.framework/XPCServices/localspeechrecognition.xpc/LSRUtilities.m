@interface LSRUtilities
+ (id)emptyResultWithIsFinal:(BOOL)a3;
+ (id)recognizedResultFromEARPackage:(id)a3;
+ (id)transcriptionsWithEARTokens:(id)a3;
@end

@implementation LSRUtilities

+ (id)transcriptionsWithEARTokens:(id)a3
{
  v3 = sub_10002D6FC(a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SFUtilities transcriptionsWithTokens:](&OBJC_CLASS___SFUtilities, "transcriptionsWithTokens:", v4));

  return v5;
}

+ (id)recognizedResultFromEARPackage:(id)a3
{
  id v34 = a3;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 audioAnalytics]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v32 acousticFeatures]);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v10]);
        id v12 = objc_alloc(&OBJC_CLASS___AFSpeechAcousticFeature);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 acousticFeatureValuePerFrame]);
        [v11 frameDuration];
        id v14 = objc_msgSend(v12, "initWithAcousticFeatureValue:frameDuration:", v13);

        -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", v14, v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v7);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v32 speechRecognitionFeatures]);
  id v16 = objc_alloc(&OBJC_CLASS___AFSpeechAudioAnalytics);
  [v32 snr];
  id v17 = objc_msgSend(v16, "initWithSpeechRecognitionFeatures:acousticFeatures:snr:", v15, v4);

  v33 = (void *)objc_claimAutoreleasedReturnValue([v34 recognition]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v33 tokenSausage]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v33 interpretationIndices]);
  v20 = sub_10002D028(v18, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  [v34 utteranceStart];
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:]( &OBJC_CLASS___SFUtilities,  "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:",  v21,  v17));
  [v34 utteranceStart];
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[SFUtilities recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:]( &OBJC_CLASS___SFUtilities,  "recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:",  v21,  v17));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v34 preITNRecognition]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 tokenSausage]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v24 interpretationIndices]);
  v27 = sub_10002D028(v25, (uint64_t)v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

  [v34 utteranceStart];
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:]( &OBJC_CLASS___SFUtilities,  "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:",  v28,  v17));
  id v30 = -[SFSpeechRecognitionResult _initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:]( [SFSpeechRecognitionResult alloc],  "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:",  v22,  v29,  [v34 isFinal],  v23);

  return v30;
}

+ (id)emptyResultWithIsFinal:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[_EARSpeechRecognitionToken alloc] initWithTokenName:&stru_100052290 start:0 end:0 silenceStart:&stru_100052290 confidence:&stru_100052290 hasSpaceAfter:0.0 hasSpaceBefore:0.0 phoneSequence:0.0 ipaPhoneSequence:0.0];
  id v9 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSRUtilities transcriptionsWithEARTokens:]( &OBJC_CLASS___LSRUtilities,  "transcriptionsWithEARTokens:",  v5));
  id v7 = -[SFSpeechRecognitionResult _initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:]( objc_alloc(&OBJC_CLASS___SFSpeechRecognitionResult),  "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:",  v6,  v6,  v3,  0LL);

  return v7;
}

@end