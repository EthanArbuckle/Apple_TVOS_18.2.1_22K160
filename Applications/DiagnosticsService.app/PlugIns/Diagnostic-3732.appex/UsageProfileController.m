@interface UsageProfileController
- (id)stringFromDate:(id)a3;
- (void)parseLogsWithCollector:(id)a3;
- (void)start;
@end

@implementation UsageProfileController

- (void)start
{
  id v3 = [[DSGeneralLogCollector alloc] initWithLogIDs:&off_1000042F8];
  -[UsageProfileController setFinished:](self, "setFinished:", 1LL);
}

- (void)parseLogsWithCollector:(id)a3
{
  uint64_t v60 = 0LL;
  v61 = &v60;
  uint64_t v62 = 0x3032000000LL;
  v63 = sub_1000035B0;
  v64 = sub_1000035C0;
  id v65 = 0LL;
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  v57 = sub_1000035B0;
  v58 = sub_1000035C0;
  id v59 = 0LL;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = sub_1000035B0;
  v52 = sub_1000035C0;
  id v53 = 0LL;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x3032000000LL;
  v45 = sub_1000035B0;
  v46 = sub_1000035C0;
  id v47 = 0LL;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = sub_1000035B0;
  v40 = sub_1000035C0;
  id v41 = 0LL;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000035C8;
  v35[3] = &unk_100004110;
  v35[4] = self;
  v35[5] = &v60;
  v35[6] = &v54;
  v35[7] = &v48;
  v35[8] = &v42;
  v35[9] = &v36;
  id v32 = a3;
  [v32 enumerateLogLinesWithBlock:v35];
  if ((-[UsageProfileController isCancelled](self, "isCancelled") & 1) != 0)
  {
    v33 = 0LL;
    v34 = 0LL;
  }

  else
  {
    v4 = (void *)v61[5];
    if (v4)
    {
      id v5 = [v4 usageTime];
      id v6 = [(id)v61[5] standbyTime];
      id v7 = [(id)v61[5] batteryLevel];
    }

    else
    {
      id v7 = 0LL;
      id v6 = 0LL;
      id v5 = 0LL;
    }

    v8 = (void *)v55[5];
    if (v8)
    {
      id v9 = [v8 usageTime];
      unsigned int v28 = [(id)v55[5] batteryLevel];
      v34 = (void *)objc_claimAutoreleasedReturnValue([(id)v55[5] date]);
    }

    else
    {
      id v9 = 0LL;
      unsigned int v28 = 0;
      v34 = 0LL;
    }

    v10 = (void *)v49[5];
    if (v10)
    {
      unsigned int v27 = [v10 standbyTime];
      unsigned int v26 = [(id)v49[5] batteryLevel];
      v33 = (void *)objc_claimAutoreleasedReturnValue([(id)v49[5] date]);
    }

    else
    {
      unsigned int v26 = 0;
      unsigned int v27 = 0;
      v33 = 0LL;
    }

    if (v43[5] && (v11 = (void *)v37[5]) != 0LL)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 date]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v43[5] date]);
      [v12 timeIntervalSinceDate:v13];
      BOOL v15 = v14 > 0.0;
    }

    else
    {
      BOOL v15 = 0LL;
    }

    v66[0] = @"lastUsageLength";
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
    v67[0] = v31;
    v66[1] = @"lastStandbyLength";
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
    v67[1] = v30;
    v66[2] = @"batteryLevelAfterLastUsage";
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
    v67[2] = v29;
    v66[3] = @"pluggedInAfterLastUsage";
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
    v67[3] = v16;
    v66[4] = @"longestUsageLength";
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
    v67[4] = v17;
    v66[5] = @"longestUsageDate";
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UsageProfileController stringFromDate:](self, "stringFromDate:", v34));
    v67[5] = v18;
    v66[6] = @"batteryLevelAfterLongestUsage";
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v28));
    v67[6] = v19;
    v66[7] = @"longestStandbyDate";
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UsageProfileController stringFromDate:](self, "stringFromDate:", v33));
    v67[7] = v20;
    v66[8] = @"longestStandbyLength";
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v27));
    v67[8] = v21;
    v66[9] = @"batteryLevelAfterLongestStandby";
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v26));
    v67[9] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  10LL));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UsageProfileController result](self, "result"));
    [v24 setData:v23];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UsageProfileController result](self, "result"));
    [v25 setStatusCode:&off_100004310];
  }

  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);
}

- (id)stringFromDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](&OBJC_CLASS___DSDateFormatter, "sharedFormatter"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 formatterWithType:0]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringFromDate:v3]);
    id v7 = stringOrNull(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  return v8;
}

@end