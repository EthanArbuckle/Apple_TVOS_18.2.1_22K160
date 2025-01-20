@interface WiFiDiagnosticsExtension
- (id)__attachmentsForAirPlayWithParameters:(id)a3;
- (id)__attachmentsForFBAWithParameters:(id)a3;
- (id)__attachmentsForSymptomsDiagWithParameters:(id)a3;
- (id)__attachmentsForTTRWithParameters:(id)a3;
- (id)__attachmentsForWiFiDEWithParameters:(id)a3;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation WiFiDiagnosticsExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)__attachmentsForSymptomsDiagWithParameters:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithUTF8String:]( &OBJC_CLASS___NSMutableString,  "stringWithUTF8String:",  "symptomsd"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"trigger"]);

  if (v5) {
    [v4 appendFormat:@".%@", v5];
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = [sub_1000021AC() sharedClient];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    id v9 = sub_10000228C();
    v18 = @"Reason";
    v19 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 requestWithItemID:82 configuration:v10]);
    v20 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    id v17 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 collectLogs:v12 configuration:0 update:0 receipts:0 error:&v17]);
    id v14 = v17;

    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v13));
      [v6 addObject:v15];
    }
  }

  return v6;
}

- (id)__attachmentsForAirPlayWithParameters:(id)a3
{
  id v3 = a3;
  id v76 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = [sub_1000021AC() sharedClient];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"uuid"]);
    if (v6)
    {
      id v7 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);

      if (!v7)
      {

        v6 = 0LL;
      }
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DEExtensionHostAppKey"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"trigger"]);
    v10 = v9;
    v75 = v9;
    if (v6)
    {
      if ([v9 isEqualToString:@"pre"])
      {
        id v70 = v3;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v6 substringToIndex:5]);
        v74 = v8;
        uint64_t v72 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@[%@]",  v8,  v10,  v11));

        id v12 = sub_10000228C();
        v103 = @"Reason";
        uint64_t v104 = v72;
        v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v104,  &v103,  1LL));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 requestWithItemID:21 configuration:v69]);
        v105[0] = v13;
        id v14 = [sub_10000228C() requestWithItemID:39 configuration:0];
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v105[1] = v15;
        v71 = v5;
        id v16 = sub_10000228C();
        v101 = @"UUID";
        v102 = v6;
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v102,  &v101,  1LL));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 requestWithItemID:24 configuration:v17]);
        v105[2] = v18;
        id v19 = [sub_10000228C() requestWithItemID:45 configuration:0];
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v105[3] = v20;
        id v21 = [sub_10000228C() requestWithItemID:46 configuration:0];
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v105[4] = v22;
        id v23 = [sub_10000228C() requestWithItemID:47 configuration:0];
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v105[5] = v24;
        id v25 = [sub_10000228C() requestWithItemID:44 configuration:0];
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v105[6] = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v105, 7LL));

        v28 = (void *)v72;
        v5 = v71;

        v99 = @"Reason";
        uint64_t v100 = v72;
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v100,  &v99,  1LL));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v71 collectLogs:v27 configuration:v29 update:0 receipts:0 error:0]);

        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v30));
          [v76 addObject:v31];
        }

        id v3 = v70;
LABEL_10:
        v8 = v74;
        goto LABEL_25;
      }

      if ([v10 isEqualToString:@"abort"])
      {
        id v32 = sub_10000228C();
        v96 = @"UUID";
        v97 = v6;
        v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v32 requestWithItemID:25 configuration:v33]);
        v98 = v34;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v98, 1LL));

        v27 = (void *)objc_claimAutoreleasedReturnValue([v5 collectLogs:v28 configuration:0 update:0 receipts:0 error:0]);
        if (!v27)
        {
LABEL_26:

          goto LABEL_27;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v27));
        [v76 addObject:v30];
LABEL_25:

        goto LABEL_26;
      }

      if ([v10 isEqualToString:@"post"])
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v6 substringToIndex:5]);
        v74 = v8;
        uint64_t v36 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@[%@]",  v8,  v10,  v35));

        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        id v37 = sub_10000228C();
        v94 = @"UUID";
        v95 = v6;
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL));
        v39 = (void *)objc_claimAutoreleasedReturnValue([v37 requestWithItemID:25 configuration:v38]);
        [v27 addObject:v39];

        id v40 = sub_10000228C();
        v92 = @"Reason";
        uint64_t v93 = v36;
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v40 requestWithItemID:82 configuration:v41]);
        [v27 addObject:v42];

        id v43 = sub_10000228C();
        v90 = @"IncludeMatching";
        v44 = (void *)objc_claimAutoreleasedReturnValue([v6 substringToIndex:5]);
        v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  v44));
        v91 = v45;
        v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
        v47 = (void *)objc_claimAutoreleasedReturnValue([v43 requestWithItemID:70 configuration:v46]);
        [v27 addObject:v47];

        v28 = (void *)v36;
        v88[0] = @"Compress";
        v88[1] = @"Reason";
        v89[0] = &__kCFBooleanTrue;
        v89[1] = v36;
        v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  2LL));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v5 collectLogs:v27 configuration:v48 update:0 receipts:0 error:0]);

        if (v30)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v30));
          [v76 addObject:v49];
        }

        goto LABEL_10;
      }
    }

    if ([v10 isEqualToString:@"datapath"])
    {
      uint64_t v50 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v8, v10));
      id v51 = [sub_10000228C() requestWithItemID:72 configuration:0];
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      v87 = v52;
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v87, 1LL));
      v85[0] = @"Compress";
      v85[1] = @"Reason";
      v86[0] = &__kCFBooleanTrue;
      v86[1] = v50;
      v54 = (void *)v50;
      v55 = v86;
      v56 = v85;
    }

    else
    {
      unsigned int v57 = [v10 isEqualToString:@"abc"];
      uint64_t v58 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v8, v10));
      id v59 = sub_10000228C();
      v60 = v59;
      if (v57)
      {
        v82 = @"Reason";
        uint64_t v83 = v58;
        v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v83,  &v82,  1LL));
        v62 = (void *)objc_claimAutoreleasedReturnValue([v60 requestWithItemID:82 configuration:v61]);
        v84 = v62;
        uint64_t v63 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v84, 1LL));
        uint64_t v64 = v58;
        v65 = (void *)v63;
        v80[0] = @"Compress";
        v80[1] = @"Reason";
        v81[0] = &__kCFBooleanTrue;
        v81[1] = v64;
        v73 = (void *)v64;
        v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  2LL));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v5 collectLogs:v65 configuration:v66 update:0 receipts:0 error:0]);

        if (!v27)
        {
          v28 = v73;
          goto LABEL_26;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v27));
        [v76 addObject:v30];
        v28 = v73;
        goto LABEL_25;
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue([v59 requestWithItemID:60 configuration:0]);
      v79 = v52;
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v79, 1LL));
      v77[0] = @"Compress";
      v77[1] = @"Reason";
      v78[0] = &__kCFBooleanTrue;
      v78[1] = v58;
      v54 = (void *)v58;
      v55 = v78;
      v56 = v77;
    }

    v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v56,  2LL));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v5 collectLogs:v53 configuration:v67 update:0 receipts:0 error:0]);

    if (!v27)
    {
      v28 = v54;
      goto LABEL_26;
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v27));
    [v76 addObject:v30];
    v28 = v54;
    goto LABEL_25;
  }

- (id)__attachmentsForFBAWithParameters:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3));
  id v4 = [sub_1000021AC() sharedClient];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    id v6 = [sub_10000228C() requestWithItemID:59 configuration:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v14 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    id v13 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v5 collectLogs:v8 configuration:&off_100004490 update:0 receipts:0 error:&v13]);
    id v10 = v13;

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPathURL:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPathURL:",  v9));
      [v3 addObject:v11];
    }
  }

  return v3;
}

- (id)__attachmentsForTTRWithParameters:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3));
  id v4 = [sub_1000021AC() sharedClient];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    id v6 = [sub_10000228C() requestWithItemID:60 configuration:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v15 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    id v14 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v5 collectLogs:v8 configuration:&off_1000044B8 update:0 receipts:0 error:&v14]);
    id v10 = v14;

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v11));

      [v3 addObject:v12];
    }
  }

  return v3;
}

- (id)__attachmentsForWiFiDEWithParameters:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3));
  id v4 = [sub_1000021AC() sharedClient];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    id v6 = [sub_10000228C() requestWithItemID:55 configuration:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v15 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    id v14 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v5 collectLogs:v8 configuration:&off_1000044E0 update:0 receipts:0 error:&v14]);
    id v10 = v14;

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v11));

      [v3 addObject:v12];
    }
  }

  return v3;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "WiFi DE: params=%@",  (uint8_t *)&v13,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DEExtensionHostAppKey"]);
  if ([v5 isEqualToString:@"com.apple.symptomsd"])
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[WiFiDiagnosticsExtension __attachmentsForSymptomsDiagWithParameters:]( self,  "__attachmentsForSymptomsDiagWithParameters:",  v4));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);
    unsigned int v8 = [v7 hasPrefix:@"airplay"];

    if (v8)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue( -[WiFiDiagnosticsExtension __attachmentsForAirPlayWithParameters:]( self,  "__attachmentsForAirPlayWithParameters:",  v4));
    }

    else if ([v5 isEqualToString:@"Feedback Assistant"])
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue( -[WiFiDiagnosticsExtension __attachmentsForFBAWithParameters:]( self,  "__attachmentsForFBAWithParameters:",  v4));
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);
      unsigned int v10 = [v9 hasPrefix:@"com.apple.taptoradar"];

      if (v10) {
        uint64_t v6 = objc_claimAutoreleasedReturnValue( -[WiFiDiagnosticsExtension __attachmentsForTTRWithParameters:]( self,  "__attachmentsForTTRWithParameters:",  v4));
      }
      else {
        uint64_t v6 = objc_claimAutoreleasedReturnValue( -[WiFiDiagnosticsExtension __attachmentsForWiFiDEWithParameters:]( self,  "__attachmentsForWiFiDEWithParameters:",  v4));
      }
    }
  }

  v11 = (void *)v6;

  return v11;
}

@end