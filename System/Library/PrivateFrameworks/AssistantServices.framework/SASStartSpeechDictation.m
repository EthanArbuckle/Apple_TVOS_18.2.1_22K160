@interface SASStartSpeechDictation
+ (id)ad_startSpeechDictationWithAFDictationOptions:(id)a3;
- (id)ad_deferredMetricsContext;
- (id)ad_languageModel;
@end

@implementation SASStartSpeechDictation

- (id)ad_languageModel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeechDictation languages](self, "languages"));
  v3 = v2;
  if (v2 && [v2 count]) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)ad_deferredMetricsContext
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SASStartSpeechDictation;
  id v3 = -[SASStartSpeechDictation ad_deferredMetricsContext](&v8, "ad_deferredMetricsContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeechDictation applicationName](self, "applicationName"));
  if (v5) {
    [v4 setObject:v5 forKey:SASStartSpeechDictationApplicationNamePListKey];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeechDictation fieldLabel](self, "fieldLabel"));
  if (v6) {
    [v4 setObject:v6 forKey:SASStartSpeechDictationFieldLabelPListKey];
  }

  return v4;
}

+ (id)ad_startSpeechDictationWithAFDictationOptions:(id)a3
{
  id v3 = a3;
  id v4 = [v3 voiceSearchTypeOptions];
  if (v4)
  {
    char v5 = (char)v4;
    v6 = (SASStartSpeechDictation *)objc_alloc_init(&OBJC_CLASS___SASStartVoiceSearchRequest);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_super v8 = v7;
    if ((v5 & 1) != 0) {
      -[NSMutableArray addObject:](v7, "addObject:", SASearchTypeVOICE_SEARCHValue);
    }
    if ((v5 & 2) != 0) {
      -[NSMutableArray addObject:](v8, "addObject:", SASearchTypeWEB_SEARCHValue);
    }
    -[SASStartSpeechDictation setSearchTypes:](v6, "setSearchTypes:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 voiceSearchHeaderFields]);
    -[SASStartSpeechDictation setHeaders:](v6, "setHeaders:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 voiceSearchQueryParameters]);
    -[SASStartSpeechDictation setQueryParameters:](v6, "setQueryParameters:", v10);
  }

  else
  {
    v6 = objc_alloc_init(&OBJC_CLASS___SASStartSpeechDictation);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationName]);
  -[SASStartSpeechDictation setApplicationName:](v6, "setApplicationName:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationVersion]);
  -[SASStartSpeechDictation setApplicationVersion:](v6, "setApplicationVersion:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldLabel]);
  -[SASStartSpeechDictation setFieldLabel:](v6, "setFieldLabel:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 fieldIdentifier]);
  -[SASStartSpeechDictation setFieldId:](v6, "setFieldId:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 interactionIdentifier]);
  -[SASStartSpeechDictation setInteractionId:](v6, "setInteractionId:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 requestIdentifier]);
  -[SASStartSpeechDictation setAceId:](v6, "setAceId:", v16);

  v17 = (char *)[v3 keyboardType] - 1;
  else {
    id v18 = *(id *)*(&off_1004FD1E0 + (void)v17);
  }
  -[SASStartSpeechDictation setKeyboardType:](v6, "setKeyboardType:", v18);

  -[SASStartSpeechDictation setPostfixText:](v6, "setPostfixText:", &stru_1004FECA0);
  -[SASStartSpeechDictation setPrefixText:](v6, "setPrefixText:", &stru_1004FECA0);
  -[SASStartSpeechDictation setSelectedText:](v6, "setSelectedText:", &stru_1004FECA0);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 keyboardIdentifier]);
  -[SASStartSpeechDictation setKeyboardIdentifier:](v6, "setKeyboardIdentifier:", v19);

  v20 = (char *)[v3 returnKeyType] - 1;
  else {
    id v21 = *(id *)*(&off_1004FD248 + (void)v20);
  }
  -[SASStartSpeechDictation setKeyboardReturnKey:](v6, "setKeyboardReturnKey:", v21);

  -[SASStartSpeechDictation setEnablePartialResults:]( v6,  "setEnablePartialResults:",  AFPreferencesStreamingDictationEnabled());
  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 inlineItemList]);
  -[SASStartSpeechDictation setInlineItemList:](v6, "setInlineItemList:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 voiceTriggerEventInfo]);
  -[SASStartSpeechDictation setVoiceTriggerEventInfo:](v6, "setVoiceTriggerEventInfo:", v23);

  -[SASStartSpeechDictation setAutoPunctuation:](v6, "setAutoPunctuation:", [v3 autoPunctuation]);
  return v6;
}

@end