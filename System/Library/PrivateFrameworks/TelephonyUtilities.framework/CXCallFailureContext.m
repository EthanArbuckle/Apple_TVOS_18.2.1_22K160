@interface CXCallFailureContext
- (id)endedReasonUserInfoForCall:(id)a3;
@end

@implementation CXCallFailureContext

- (id)endedReasonUserInfoForCall:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallFailureContext title](self, "title"));
  [v5 setObject:v6 forKeyedSubscript:TUCallRemoteUnavailableTitle];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallFailureContext message](self, "message"));
  id v8 = [v7 length];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallFailureContext message](self, "message"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByReplacingOccurrencesOfString:@"<display_name>" withString:v10]);

    [v5 setObject:v11 forKeyedSubscript:TUCallRemoteUnavailableMessage];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v14 = -[CXCallFailureContext hasCellularSettingsRemediation](self, "hasCellularSettingsRemediation");
  if ((_DWORD)v14)
  {
    uint64_t v16 = TUBundle(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"CELLULAR_SETTINGS" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    [v12 addObject:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"prefs:root=MOBILE_DATA_SETTINGS_ID"));
    [v13 addObject:v19];
  }

  if (-[CXCallFailureContext hasWiFiSettingsRemediation](self, "hasWiFiSettingsRemediation"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    id v21 = [v20 supportsWLAN];
    int v22 = (int)v21;
    uint64_t v24 = TUBundle(v21, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (v22) {
      v27 = @"WLAN_SETTINGS";
    }
    else {
      v27 = @"WIFI_SETTINGS";
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:v27 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    [v12 addObject:v28];

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=WIFI"));
    [v13 addObject:v29];
  }

  id v30 = -[CXCallFailureContext hasDateAndTimeSettingsRemediation](self, "hasDateAndTimeSettingsRemediation");
  if ((_DWORD)v30)
  {
    uint64_t v32 = TUBundle(v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"SETTINGS" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    [v12 addObject:v34];

    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"prefs:root=General&path=DATE_AND_TIME"));
    [v13 addObject:v35];
  }

  if (-[CXCallFailureContext hasLocationSettingsRemediation](self, "hasLocationSettingsRemediation"))
  {
    else {
      uint64_t v36 = objc_claimAutoreleasedReturnValue(+[IMService callService](&OBJC_CLASS___IMService, "callService"));
    }
    v37 = (void *)v36;
    if (qword_10044D0C0 != -1) {
      dispatch_once(&qword_10044D0C0, &stru_1003DB728);
    }
    uint64_t v38 = off_10044D0B8(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    uint64_t v41 = TUBundle(v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue( [v42 localizedStringForKey:@"SETTINGS" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    [v12 addObject:v43];

    v44 = (void *)objc_claimAutoreleasedReturnValue([v39 uniqueID]);
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:root=FACETIME&path=LOCATION&guid=%@",  v44));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v45));
    [v13 addObject:v46];
  }

  if ([v12 count])
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
    [v5 setObject:v47 forKeyedSubscript:TUCallRemoteUnavailableAlternateButton];

    v48 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
    [v5 setObject:v48 forKeyedSubscript:TUCallRemoteUnavailableAlternateButtonURL];

    if ((unint64_t)[v12 count] >= 2)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);
      [v5 setObject:v49 forKeyedSubscript:TUCallRemoteUnavailableOtherButton];

      v50 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:1]);
      [v5 setObject:v50 forKeyedSubscript:TUCallRemoteUnavailableOtherButtonURL];
    }
  }

  if ([v5 count]) {
    id v51 = [v5 copy];
  }
  else {
    id v51 = 0LL;
  }

  return v51;
}

@end