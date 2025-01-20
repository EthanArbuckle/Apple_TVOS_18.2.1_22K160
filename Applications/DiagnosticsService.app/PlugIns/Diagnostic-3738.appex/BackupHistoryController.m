@interface BackupHistoryController
- (void)parseLogsWithCollector:(id)a3;
- (void)start;
@end

@implementation BackupHistoryController

- (void)start
{
  id v3 = [[DSGeneralLogCollector alloc] initWithLogIDs:&off_1000042F8];
  -[BackupHistoryController setFinished:](self, "setFinished:", 1LL);
}

- (void)parseLogsWithCollector:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_1000030EC;
  v25 = sub_1000030FC;
  id v26 = 0LL;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_1000030EC;
  v19 = sub_1000030FC;
  id v20 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100003104;
  v14[3] = &unk_100004128;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = &v21;
  [v4 enumerateLogLinesWithBlock:v14];
  if ((-[BackupHistoryController isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (v22[5])
    {
      if (v16[5])
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[BackupHistoryController result](self, "result"));
        [v5 setStatusCode:&off_100004340];
      }

      else
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[BackupHistoryController result](self, "result"));
        [v5 setStatusCode:&off_100004328];
      }
    }

    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BackupHistoryController result](self, "result"));
      [v5 setStatusCode:&off_100004310];
    }

    v27[0] = @"lastBackupEvent";
    v6 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[5] dictionary]);
    if (v6) {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([(id)v22[5] dictionary]);
    }
    else {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v8 = (void *)v7;
    v27[1] = @"lastSuccessfulBackupEvent";
    v28[0] = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v16[5] dictionary]);
    if (v9) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([(id)v16[5] dictionary]);
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v11 = (void *)v10;
    v28[1] = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BackupHistoryController result](self, "result"));
    [v13 setData:v12];
  }

  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

@end