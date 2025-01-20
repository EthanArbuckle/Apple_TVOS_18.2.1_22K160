@interface SAUISnippet
- (id)_callHistoryRowsForCalls:(id)a3 callOperation:(id)a4;
- (id)_searchCallHistoryIntentForVoicemail:(BOOL)a3;
- (id)_searchCallHistoryIntentResponseForCallRecords:(id)a3;
- (void)sr_applySnippetProperties:(id)a3;
@end

@implementation SAUISnippet

- (id)_callHistoryRowsForCalls:(id)a3 callOperation:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setFormattingContext:](v7, "setFormattingContext:", 3LL);
  -[NSDateFormatter setDateStyle:](v7, "setDateStyle:", 1LL);
  v25 = v7;
  -[NSDateFormatter setTimeStyle:](v7, "setTimeStyle:", 0LL);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v5;
  id v29 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v10 = objc_alloc_init(&OBJC_CLASS___SFRowCardSection);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 callTime]);
        if ([v11 _isToday])
        {
          v12 = @"TODAY";
        }

        else
        {
          if (![v11 _isYesterday])
          {
            if ([v11 _isWithinTheLastTimePeriodInDays:7])
            {
              v15 = v25;
              v16 = @"EEEE";
            }

            else
            {
              v15 = v25;
              v16 = 0LL;
            }

            -[NSDateFormatter setDateFormat:](v15, "setDateFormat:", v16);
            uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v25, "stringFromDate:", v11));
            goto LABEL_15;
          }

          v12 = @"YESTERDAY";
        }

        id v13 = sub_1000348D4(v12);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
LABEL_15:
        v17 = (void *)v14;
        id v18 = objc_alloc_init(&OBJC_CLASS___SFRichText);
        id v19 = objc_alloc_init(&OBJC_CLASS___SFFormattedText);
        [v19 setText:v17];
        [v19 setTextColor:0];
        id v34 = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
        [v18 setFormattedTextPieces:v20];

        [v10 setTrailingText:v18];
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
        [v10 setCardSectionId:v22];

        if (v6) {
          v6[2](v6, v9, v10);
        }
        -[NSMutableArray addObject:](v28, "addObject:", v10);
      }

      id v29 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v29);
  }

  id v23 = -[NSMutableArray copy](v28, "copy");
  return v23;
}

- (id)_searchCallHistoryIntentForVoicemail:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___INSearchCallHistoryIntent);
  if (v3) {
    uint64_t v5 = 16LL;
  }
  else {
    uint64_t v5 = 15LL;
  }
  v6 = -[INSearchCallHistoryIntent initWithDateCreated:recipient:callCapabilities:callTypes:unseen:]( v4,  "initWithDateCreated:recipient:callCapabilities:callTypes:unseen:",  0LL,  0LL,  3LL,  v5,  0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[INSearchCallHistoryIntent backingStore](v6, "backingStore"));
  objc_opt_class(v7, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    id v10 = v7;
    id v11 = objc_alloc_init(&OBJC_CLASS____INPBIntentMetadata);
    [v11 setLaunchId:@"com.apple.mobilephone"];
    [v10 setIntentMetadata:v11];
    -[INSearchCallHistoryIntent setBackingStore:](v6, "setBackingStore:", v10);
  }

  return v6;
}

- (id)_searchCallHistoryIntentResponseForCallRecords:(id)a3
{
  id v3 = a3;
  v4 = -[INSearchCallHistoryIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INSearchCallHistoryIntentResponse),  "initWithCode:userActivity:",  7LL,  0LL);
  -[INSearchCallHistoryIntentResponse setCallRecords:](v4, "setCallRecords:", v3);

  return v4;
}

- (void)sr_applySnippetProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
  -[SAUISnippet setAceId:](self, "setAceId:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  -[SAUISnippet setRefId:](self, "setRefId:", v6);

  -[SAUISnippet setCanBeRefreshed:](self, "setCanBeRefreshed:", [v4 canBeRefreshed]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 speakableContextInfo]);
  -[SAUISnippet setSpeakableContextInfo:](self, "setSpeakableContextInfo:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
  -[SAUISnippet setContext:](self, "setContext:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 deferredRendering]);
  -[SAUISnippet setDeferredRendering:](self, "setDeferredRendering:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 listenAfterSpeaking]);
  -[SAUISnippet setListenAfterSpeaking:](self, "setListenAfterSpeaking:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 speakableText]);
  -[SAUISnippet setSpeakableText:](self, "setSpeakableText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 viewId]);
  -[SAUISnippet setViewId:](self, "setViewId:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 confirmationOptions]);
  -[SAUISnippet setConfirmationOptions:](self, "setConfirmationOptions:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  -[SAUISnippet setTitle:](self, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 subtitle]);
  -[SAUISnippet setSubtitle:](self, "setSubtitle:", v15);

  id v16 = (id)objc_claimAutoreleasedReturnValue([v4 summaryTitle]);
  -[SAUISnippet setSummaryTitle:](self, "setSummaryTitle:", v16);
}

@end