@interface RestoreFromBackupHistoryController
- (void)parseLogsWithCollector:(id)a3;
- (void)start;
@end

@implementation RestoreFromBackupHistoryController

- (void)start
{
  id v3 = [[DSGeneralLogCollector alloc] initWithLogIDs:&off_1000042F8];
  -[RestoreFromBackupHistoryController setFinished:](self, "setFinished:", 1LL);
}

- (void)parseLogsWithCollector:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100003240;
  v34 = sub_100003250;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_100003240;
  v28 = sub_100003250;
  id v29 = 0LL;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100003258;
  v15[3] = &unk_100004128;
  v15[4] = self;
  v15[5] = &v20;
  v15[6] = &v24;
  v15[7] = &v16;
  v15[8] = &v30;
  [v4 enumerateLogLinesWithBlock:v15];
  if ((-[RestoreFromBackupHistoryController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreFromBackupHistoryController result](self, "result"));
    [v5 setStatusCode:&off_100004310];

    if (*((_BYTE *)v21 + 24))
    {
      if (!v25[5])
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreFromBackupHistoryController result](self, "result"));
        [v6 setStatusCode:&off_100004328];
        goto LABEL_7;
      }

      if (*((_BYTE *)v17 + 24))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreFromBackupHistoryController result](self, "result"));
        [v6 setStatusCode:&off_100004340];
LABEL_7:
      }
    }

    v36[0] = @"lastBackupRestoreEvent";
    v7 = (void *)objc_claimAutoreleasedReturnValue([(id)v31[5] dictionary]);
    id v8 = dictionaryOrNull(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v36[1] = @"lastSuccessfulBackupRestoreEvent";
    v37[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v25[5] dictionary]);
    id v11 = dictionaryOrNull(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v37[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreFromBackupHistoryController result](self, "result"));
    [v14 setData:v13];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

@end