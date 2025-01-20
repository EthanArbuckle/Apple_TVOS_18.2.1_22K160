@interface AppCrashHistoryController
- (AppCrashHistoryInputs)inputs;
- (id)appNameForBundleID:(id)a3;
- (id)userFriendlyAppNameForBundleID:(id)a3;
- (void)parseLogsWithCollector:(id)a3;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation AppCrashHistoryController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  id v3 = objc_alloc(&OBJC_CLASS___DSGeneralLogCollector);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 logIds]);
  id v6 = [v3 initWithLogIDs:v5];

  -[AppCrashHistoryController setFinished:](self, "setFinished:", 1LL);
}

- (void)parseLogsWithCollector:(id)a3
{
  id v22 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100002514;
  v26[3] = &unk_100004210;
  objc_copyWeak(&v30, &location);
  id v7 = v4;
  id v27 = v7;
  id v8 = v6;
  id v28 = v8;
  id v9 = v5;
  id v29 = v9;
  [v22 enumerateLogLinesWithBlock:v26];
  if ((-[AppCrashHistoryController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DSGeneralLogCollector latestUserLog](&OBJC_CLASS___DSGeneralLogCollector, "latestUserLog"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 restoreDate]);
    [v11 timeIntervalSinceNow];
    double v13 = v12;

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100002738;
    v23[3] = &unk_100004238;
    double v25 = v13 / -86400.0;
    v23[4] = self;
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v24 = v14;
    [v7 enumerateKeysAndObjectsUsingBlock:v23];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    if ([v14 count])
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController result](self, "result"));
      [v16 setStatusCode:&off_100004450];

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  &stru_100004398,  1LL));
      v32 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v14 sortedArrayUsingDescriptors:v18]);

      v15 = (void *)v19;
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController result](self, "result"));
      [v17 setStatusCode:&off_100004468];
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v20 setValue:v15 forKey:@"frequentlyCrashingApps"];
    if ([v9 count]) {
      [v20 setValue:v9 forKey:@"panicCounts"];
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController result](self, "result"));
    [v21 setData:v20];
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (id)userFriendlyAppNameForBundleID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 length]) {
    goto LABEL_11;
  }
  id v6 = [v5 length];
  if (v6 >= [@"com.apple." length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringToIndex:", objc_msgSend(@"com.apple.", "length")));
    if ([v7 isEqualToString:@"com.apple."])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController inputs](self, "inputs"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 whitelist]);
      if (![v9 count])
      {

LABEL_11:
        double v13 = 0LL;
        goto LABEL_12;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController inputs](self, "inputs"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 whitelist]);
      unsigned int v12 = [v11 containsObject:v5];

      if (!v12) {
        goto LABEL_11;
      }
    }

    else
    {
    }
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController appNameForBundleID:](self, "appNameForBundleID:", v5));
LABEL_12:

  return v13;
}

- (id)appNameForBundleID:(id)a3
{
  id v3 = a3;
  id v10 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord bundleRecordWithApplicationIdentifier:error:]( &OBJC_CLASS___LSApplicationRecord,  "bundleRecordWithApplicationIdentifier:error:",  v3,  &v10));
  id v5 = v10;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
  }

  else
  {
    uint64_t v7 = DiagnosticLogHandleForCategory(3LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100002A40((uint64_t)v3, (uint64_t)v5, v8);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (AppCrashHistoryInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end