@interface SAPhoneVoiceMailSnippet
- (id)sr_sirilandShim;
@end

@implementation SAPhoneVoiceMailSnippet

- (id)sr_sirilandShim
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet calls](self, "calls"));
  v4 = v3;
  if (v3 && [v3 count])
  {
    v66 = v4;
    id v5 = objc_alloc_init((Class)&OBJC_CLASS___SFCard);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet title](self, "title"));
    [v5 setTitle:v6];

    [v5 setType:1];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet aceId](self, "aceId"));
    [v5 setCardId:v7];

    [v5 setSource:2];
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet calls](self, "calls"));
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_1000373A0;
    v68[3] = &unk_1000BAE90;
    v11 = v8;
    v69 = v11;
    v67 = v9;
    v70 = v67;
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[SAPhoneVoiceMailSnippet _callHistoryRowsForCalls:callOperation:]( self,  "_callHistoryRowsForCalls:callOperation:",  v10,  v68));

    v13 = (void *)objc_claimAutoreleasedReturnValue( -[SAPhoneVoiceMailSnippet _searchCallHistoryIntentForVoicemail:]( self,  "_searchCallHistoryIntentForVoicemail:",  1LL));
    v65 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[SAPhoneVoiceMailSnippet _searchCallHistoryIntentResponseForCallRecords:]( self,  "_searchCallHistoryIntentResponseForCallRecords:",  v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 backingStore]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 data]);

    *(void *)&double v18 = objc_opt_class(v13, v17).n128_u64[0];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "intentDescription", v18));
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 name]);

    [v5 setIntentMessageData:v16];
    v60 = (void *)v21;
    [v5 setIntentMessageName:v21];
    v62 = v14;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v14 backingStore]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 data]);
    [v5 setIntentResponseMessageData:v23];

    *(void *)&double v25 = objc_opt_class(v13, v24).n128_u64[0];
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "intentDescription", v25));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 responseName]);
    [v5 setIntentResponseMessageName:v28];

    id v29 = objc_alloc_init(&OBJC_CLASS___SAIntentGroupLaunchAppWithIntent);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);
    [v29 setAceId:v31];

    id v32 = objc_alloc_init(&OBJC_CLASS___SAIntentGroupProtobufMessage);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 UUIDString]);
    [v32 setAceId:v34];

    v61 = (void *)v16;
    [v32 setData:v16];
    v63 = v13;
    *(void *)&double v36 = objc_opt_class(v13, v35).n128_u64[0];
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "intentDescription", v36));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 type]);
    [v32 setTypeName:v39];

    [v29 setHandledIntent:v32];
    id v40 = objc_alloc_init((Class)&OBJC_CLASS___SFAbstractCommand);
    [v40 setType:1];
    id v41 = objc_alloc_init(&OBJC_CLASS___SFCommandValue);
    id v42 = objc_alloc_init(&OBJC_CLASS___SFReferentialCommand);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v29 aceId]);
    [v42 setReferenceIdentifier:v43];

    [v41 setReferentialCommand:v42];
    v59 = v40;
    [v40 setValue:v41];
    v64 = v12;
    id v44 = [v12 copy];
    [v5 setCardSections:v44];

    v45 = (SAPhoneVoiceMailSnippet *)objc_alloc_init(&OBJC_CLASS___SACardSnippet);
    id v46 = [[_SFPBCard alloc] initWithFacade:v5];
    v47 = (void *)objc_claimAutoreleasedReturnValue([v46 data]);
    -[SAPhoneVoiceMailSnippet setCardData:](v45, "setCardData:", v47);

    id v48 = -[NSMutableArray copy](v67, "copy");
    -[SAPhoneVoiceMailSnippet setReferencedCommands:](v45, "setReferencedCommands:", v48);

    id v49 = objc_alloc_init(&OBJC_CLASS___SAUISash);
    id v50 = [v49 setApplicationBundleIdentifier:@"com.apple.mobilephone"];
    if (AFIsInternalInstall(v50, v51))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      unsigned int v53 = [v52 debugButtonIsEnabled];

      if (v53)
      {
        id v54 = sub_1000348D4(@"VOICEMAIL_SASH_TITLE");
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (INTERNAL ONLY: LEGACY FLOW)",  v55));
        [v49 setTitle:v56];
      }
    }

    id v71 = v29;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v71, 1LL));
    [v49 setCommands:v57];

    -[SAPhoneVoiceMailSnippet setSash:](v45, "setSash:", v49);
    -[SAPhoneVoiceMailSnippet sr_applySnippetProperties:](v45, "sr_applySnippetProperties:", self);

    v4 = v66;
  }

  else
  {
    v45 = self;
  }

  return v45;
}

@end