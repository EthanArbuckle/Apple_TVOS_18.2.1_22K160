@interface SAPhoneCallEmergencySnippet
- (id)sr_sirilandShim;
@end

@implementation SAPhoneCallEmergencySnippet

- (id)sr_sirilandShim
{
  id v3 = objc_alloc_init((Class)&OBJC_CLASS___SFCard);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneCallEmergencySnippet title](self, "title"));
  [v3 setTitle:v4];

  [v3 setType:1];
  v33 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneCallEmergencySnippet aceId](self, "aceId"));
  [v3 setCardId:v5];

  [v3 setSource:2];
  id v32 = objc_alloc_init((Class)&OBJC_CLASS___SFNullCardSection);
  id v34 = v32;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  [v3 setCardSections:v6];

  v7 = -[INStartCallIntent initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:]( objc_alloc(&OBJC_CLASS___INStartCallIntent),  "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:",  0LL,  0LL,  0LL,  2LL,  0LL,  0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[INStartCallIntent backingStore](v7, "backingStore"));
  objc_opt_class(&OBJC_CLASS____INPBStartCallIntent, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    id v11 = v8;
    id v12 = objc_alloc_init(&OBJC_CLASS____INPBIntentMetadata);
    [v12 setLaunchId:@"x-apple-siri-app://com.apple.InCallService"];
    [v12 setSystemExtensionBundleId:@"com.apple.InCallService.IntentsUI"];
    [v11 setIntentMetadata:v12];
    -[INStartCallIntent setBackingStore:](v7, "setBackingStore:", v11);
  }

  v13 = -[INStartCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INStartCallIntentResponse),  "initWithCode:userActivity:",  1LL,  0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[INStartCallIntent backingStore](v7, "backingStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 data]);

  [v3 setIntentMessageData:v15];
  [v3 setIntentMessageName:@"sirikit.intent.call.StartCallIntent"];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[INStartCallIntentResponse backingStore](v13, "backingStore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 data]);
  [v3 setIntentResponseMessageData:v17];

  [v3 setIntentResponseMessageName:@"sirikit.intent.call.StartCallIntentResponse"];
  id v18 = objc_alloc_init(&OBJC_CLASS___SACardSnippet);
  id v19 = [[_SFPBCard alloc] initWithFacade:v3];
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 data]);
  [v18 setCardData:v20];

  id v21 = objc_alloc_init(&OBJC_CLASS___SAUISash);
  LODWORD(v19) = AFIsInternalInstall(v21, v22);
  id v23 = sub_1000348D4(@"EMERGENCY_CALL_SASH_TITLE");
  uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)v24;
  if ((_DWORD)v19) {
    v26 = @"%@ (INTERNAL ONLY: LEGACY FLOW)";
  }
  else {
    v26 = @"%@";
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v26, v24));
  [v21 setTitle:v27];

  id v28 = objc_alloc_init(&OBJC_CLASS___SAUIColor);
  [v28 setRedValue:255];
  [v28 setGreenValue:255];
  [v28 setBlueValue:255];
  [v28 setAlpha:&off_1000BEBD8];
  [v21 setTextColor:v28];
  id v29 = objc_alloc_init(&OBJC_CLASS___SAUIColor);
  [v29 setRedValue:255];
  [v29 setGreenValue:0];
  [v29 setBlueValue:0];
  [v29 setAlpha:&off_1000BEBD8];
  [v21 setBackgroundColor:v29];
  [v18 setSash:v21];
  objc_msgSend(v18, "sr_applySnippetProperties:", v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v30 postNotificationName:AFUIDidShowEmergencyCallViewNotification object:0];

  return v18;
}

@end