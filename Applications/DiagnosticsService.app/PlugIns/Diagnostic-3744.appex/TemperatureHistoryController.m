@interface TemperatureHistoryController
- (void)addTemperatureWarningWithReason:(id)a3 toDictionary:(id)a4;
- (void)parseLogsWithCollector:(id)a3;
- (void)start;
@end

@implementation TemperatureHistoryController

- (void)start
{
  id v3 = objc_alloc(&OBJC_CLASS___DSGeneralLogCollector);
  v6[0] = @"101";
  v6[1] = @"ThermalUIAlertEnter";
  v6[2] = @"ThermalUIAlertExit";
  v6[3] = @"ThermalLevel";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 4LL));
  id v5 = [v3 initWithLogIDs:v4];

  -[TemperatureHistoryController setFinished:](self, "setFinished:", 1LL);
}

- (void)parseLogsWithCollector:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TemperatureHistoryController result](self, "result"));
  [v5 setStatusCode:&off_100004350];

  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  v46 = sub_100003138;
  v47 = sub_100003148;
  id v48 = 0LL;
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  int v42 = 0;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  int v38 = 0;
  uint64_t v31 = 0LL;
  v32 = (int *)&v31;
  uint64_t v33 = 0x2020000000LL;
  int v34 = 0;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  int v30 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 100LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100003150;
  v19[3] = &unk_100004120;
  v19[4] = self;
  id v8 = v6;
  id v20 = v8;
  v22 = &v39;
  id v9 = v7;
  id v21 = v9;
  v23 = &v35;
  v24 = &v43;
  v25 = &v27;
  v26 = &v31;
  [v4 enumerateLogLinesWithBlock:v19];
  if ((-[TemperatureHistoryController isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (v32[6] >= 1 && !*((_DWORD *)v28 + 6))
    {
      *((_DWORD *)v28 + 6) = 1;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TemperatureHistoryController result](self, "result"));
      [v11 setStatusCode:&off_100004380];
    }

    if (v44[5])
    {
      *((_DWORD *)v28 + 6) = 2;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TemperatureHistoryController result](self, "result"));
      [v12 setStatusCode:&off_100004368];
    }

    v49[0] = @"maxTemperature";
    LODWORD(v10) = *((_DWORD *)v40 + 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v10));
    v50[0] = v13;
    v50[1] = v9;
    v49[1] = @"temperatureWarnings";
    v49[2] = @"temperatureWarningCount";
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *((unsigned int *)v36 + 6)));
    v50[2] = v14;
    v49[3] = @"totalTimeInTemperatureWarning";
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v32[6]));
    v50[3] = v15;
    v49[4] = @"responseCode";
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *((unsigned int *)v28 + 6)));
    v49[5] = @"thermalMitigationEvents";
    v50[4] = v16;
    v50[5] = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  6LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TemperatureHistoryController result](self, "result"));
    [v18 setData:v17];
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
}

- (void)addTemperatureWarningWithReason:(id)a3 toDictionary:(id)a4
{
  v11 = (__CFString *)a3;
  id v5 = a4;
  v6 = @"Unspecified";
  if (v11) {
    v6 = v11;
  }
  v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v7]);
  id v9 = v8;
  if (v8)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v8 intValue] + 1));
    [v5 setObject:v10 forKeyedSubscript:v7];
  }

  else
  {
    [v5 setObject:&off_100004398 forKeyedSubscript:v7];
  }
}

@end