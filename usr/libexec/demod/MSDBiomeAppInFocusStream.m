@interface MSDBiomeAppInFocusStream
+ (BOOL)timeRange:(id)a3 subsumes:(id)a4;
+ (id)collectAppUsageDataFrom:(id)a3 to:(id)a4;
+ (id)eventSessionToAppUsage:(id)a3;
+ (void)printBMAppInfocusEvent:(id)a3;
@end

@implementation MSDBiomeAppInFocusStream

+ (id)collectAppUsageDataFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v10 = BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 App]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 InFocus]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 publisher]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[BMPairedEventSession sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:]( &OBJC_CLASS___BMPairedEventSession,  "sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:",  v14,  &stru_1000F9548,  &stru_1000F9588,  0LL));

  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = sub_1000149D0;
  v42 = sub_1000149E0;
  id v43 = 0LL;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000149E8;
  v37[3] = &unk_1000F95B0;
  v37[4] = &v38;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3254779904LL;
  v33[2] = sub_100014AFC;
  v33[3] = &unk_1000F95D8;
  id v16 = v7;
  id v35 = v16;
  id v17 = v8;
  id v36 = v17;
  id v18 = v9;
  id v34 = v18;
  id v19 = [v15 sinkWithBookmark:0 completion:v37 receiveInput:v33];
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[BMPairedEventSession openSessionsFromBookmark:]( &OBJC_CLASS___BMPairedEventSession,  "openSessionsFromBookmark:",  v39[5]));
  id v21 = sub_10003A95C();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v20 count];
    *(_DWORD *)buf = 134349056;
    id v45 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Number of open events:  %{public}lu",  buf,  0xCu);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3254779904LL;
  v29[2] = sub_100014E38;
  v29[3] = &unk_1000F9610;
  id v24 = v16;
  id v31 = v24;
  id v25 = v17;
  id v32 = v25;
  id v26 = v18;
  id v30 = v26;
  [v20 enumerateObjectsUsingBlock:v29];
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 sortedArrayUsingComparator:&stru_1000F9660]);

  _Block_object_dispose(&v38, 8);
  return v27;
}

+ (id)eventSessionToAppUsage:(id)a3
{
  id var1 = a3.var1;
  id var0 = a3.var0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3.var0 absoluteTimestamp]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([var1 absoluteTimestamp]);
  id v7 = v6;
  if (v6)
  {
    [v6 timeIntervalSinceDate:v5];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
  }

  v9 = (void *)v8;
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue([var0 bundleID]);
  if (-[__CFString containsString:](v10, "containsString:", @"/"))
  {
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString lastPathComponent](v10, "lastPathComponent"));

    uint64_t v10 = @"<unknown>";
  }

  else
  {
    v11 = @"<unknown>";
  }

  v14[0] = @"bundleID";
  v14[1] = @"executableName";
  v15[0] = v10;
  v15[1] = v11;
  v14[2] = @"sessionStartTime";
  v14[3] = @"sessionEndTime";
  v15[2] = v5;
  v15[3] = v7;
  v14[4] = @"appDuration";
  v15[4] = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  5LL));

  return v12;
}

+ (BOOL)timeRange:(id)a3 subsumes:(id)a4
{
  id var1 = a4.var1;
  id var0 = a4.var0;
  id v6 = a3.var1;
  id v7 = a3.var0;
  else {
    unsigned __int8 v8 = 0;
  }
  id v9 = sub_10003A95C();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v7 toString]);
    objc_claimAutoreleasedReturnValue([v6 toString]);
    sub_100092530();
  }

  id v12 = sub_10003A95C();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue([var0 toString]);
    objc_claimAutoreleasedReturnValue([var1 toString]);
    sub_1000924EC();
  }

  id v15 = sub_10003A95C();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100092480(v8, v16, v17);
  }

  return v8;
}

+ (void)printBMAppInfocusEvent:(id)a3
{
  id v3 = a3;
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100092780(v3, v5);
  }

  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100092708(v3, v7);
  }

  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100092684(v3, v9);
  }

  id v10 = sub_10003A95C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10009260C(v3, v11);
  }

  id v12 = sub_10003A95C();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100092574(v3, v13);
  }
}

@end