@interface ManagementTestStatus
+ (id)supportedStatusKeys;
- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5;
@end

@implementation ManagementTestStatus

+ (id)supportedStatusKeys
{
  v5[0] = RMModelStatusItemTestArrayValue;
  v5[1] = RMModelStatusItemTestBooleanValue;
  v5[2] = RMModelStatusItemTestDictionaryValue;
  v5[3] = RMModelStatusItemTestErrorValue;
  v5[4] = RMModelStatusItemTestIntegerValue;
  v5[5] = RMModelStatusItemTestRealValue;
  v5[6] = RMModelStatusItemTestStringValue;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 7LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v6 = a3;
  v41 = (void (**)(id, id, void))a5;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog managementTestStatus](&OBJC_CLASS___RMLog, "managementTestStatus"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100005EE0((uint64_t)v6, v7);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v6 count]));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v50;
    uint64_t v13 = RMModelStatusItemTestArrayValue;
    uint64_t v47 = RMModelStatusItemTestBooleanValue;
    uint64_t v45 = RMModelStatusItemTestDictionaryValue;
    uint64_t v14 = RMModelStatusItemTestErrorValue;
    uint64_t v44 = RMModelStatusItemTestIntegerValue;
    uint64_t v43 = RMModelStatusItemTestRealValue;
    uint64_t v42 = RMModelStatusItemTestStringValue;
    uint64_t v48 = RMModelStatusItemTestErrorValue;
    do
    {
      v15 = 0LL;
      id v46 = v11;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v15);
        if ([v16 isEqualToString:v13])
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"RMTestArrayErrorValue"]);

          if ([v18 BOOLValue])
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createInternalError]( &OBJC_CLASS___RMErrorUtilities,  "createInternalError"));
          }

          else
          {
            v54[0] = @"identifier";
            v54[1] = @"key1";
            v55 = @"1";
            v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter rmmodel_sharedRFC3339DateFormatter]( &OBJC_CLASS___NSDateFormatter,  "rmmodel_sharedRFC3339DateFormatter"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            uint64_t v24 = v13;
            uint64_t v25 = v12;
            v26 = v8;
            id v27 = v9;
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue([v22 stringFromDate:v23]);

            v56 = v28;
            v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  v54,  2LL));
            v57 = v29;
            v58 = (const __CFString *)&off_1000086D0;
            v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v57,  2LL));

            id v9 = v27;
            v8 = v26;
            uint64_t v12 = v25;
            uint64_t v13 = v24;
            id v11 = v46;
          }

          [v8 setObject:v19 forKeyedSubscript:v16];
          uint64_t v14 = v48;
          goto LABEL_29;
        }

        if ([v16 isEqualToString:v47])
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"RMTestBooleanValue"]);

          if (!v19)
          {
            v33 = v8;
            v34 = &__kCFBooleanFalse;
            goto LABEL_28;
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v19 BOOLValue]));
          [v8 setObject:v21 forKeyedSubscript:v16];

LABEL_29:
          goto LABEL_30;
        }

        if ([v16 isEqualToString:v45])
        {
          v55 = @"key1";
          v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter rmmodel_sharedRFC3339DateFormatter]( &OBJC_CLASS___NSDateFormatter,  "rmmodel_sharedRFC3339DateFormatter"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          v32 = (void *)objc_claimAutoreleasedReturnValue([v30 stringFromDate:v31]);

          v56 = @"key2";
          v57 = v32;
          v58 = @"value";
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v55,  2LL));

          uint64_t v14 = v48;
          goto LABEL_27;
        }

        if ([v16 isEqualToString:v14])
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createInvalidStatusValueErrorWithKeyPath:]( &OBJC_CLASS___RMErrorUtilities,  "createInvalidStatusValueErrorWithKeyPath:",  v14));
          goto LABEL_27;
        }

        if ([v16 isEqualToString:v44])
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v35 timeIntervalSince1970];
          uint64_t v37 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unint64_t)v36));
LABEL_25:
          v19 = (void *)v37;
          goto LABEL_26;
        }

        if ([v16 isEqualToString:v43])
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v35 timeIntervalSince1970];
          uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          goto LABEL_25;
        }

        if ([v16 isEqualToString:v42])
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter rmmodel_sharedRFC3339DateFormatter]( &OBJC_CLASS___NSDateFormatter,  "rmmodel_sharedRFC3339DateFormatter"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v35 stringFromDate:v38]);

          uint64_t v14 = v48;
LABEL_26:

LABEL_27:
          v33 = v8;
          v34 = v19;
LABEL_28:
          [v33 setObject:v34 forKeyedSubscript:v16];
          goto LABEL_29;
        }

@end