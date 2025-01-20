@interface FDRContentInstaller
+ (id)sharedInstance;
- (BOOL)finishInstallContent;
- (BOOL)updateContent:(id)a3;
- (FDRContentInstaller)init;
@end

@implementation FDRContentInstaller

+ (id)sharedInstance
{
  if (qword_10000C750 != -1) {
    dispatch_once(&qword_10000C750, &stru_1000083B0);
  }
  return (id)qword_10000C748;
}

- (FDRContentInstaller)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___FDRContentInstaller;
  v2 = -[FDRContentInstaller init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v3 enableLogToFilesUnder:@"/private/var/logs/MobileDemo" prefix:@"finish-demo-retore" expireDays:10];

    v4 = v2;
  }

  return v2;
}

- (BOOL)finishInstallContent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = [&off_100008F48 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    objc_super v6 = 0LL;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(&off_100008F48);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ([v3 fileExistsAtPath:v9])
        {
          if (!-[FDRContentInstaller updateContent:](self, "updateContent:", v9))
          {
            BOOL v13 = 0;
            goto LABEL_16;
          }

          id v18 = v6;
          unsigned __int8 v10 = [v3 removeItemAtPath:v9 error:&v18];
          id v11 = v18;

          if ((v10 & 1) == 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ERR] %s",  "-[FDRContentInstaller finishInstallContent]"));
            v17 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
            [v15 logMessage:2, v16, @"Cannot remove %@ - %@", v9, v17 prefix message];

            BOOL v13 = 0;
            objc_super v6 = v11;
            goto LABEL_16;
          }

          objc_super v6 = v11;
        }

        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
          [v12 logMessage:1, @"[INF]", @"No content need to install from %@.", v9 prefix message];
        }
      }

      id v5 = [&off_100008F48 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    objc_super v6 = 0LL;
  }

  BOOL v13 = 1;
LABEL_16:

  return v13;
}

- (BOOL)updateContent:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v38 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  v35 = v4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:0 errorHandler:0]);

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
  if (!v7)
  {
    BOOL v29 = 1;
    goto LABEL_17;
  }

  v8 = (void *)v7;
  id v34 = 0LL;
  uint64_t v9 = 0LL;
  while (1)
  {
    while (1)
    {
      unsigned __int8 v10 = v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      [v11 rangeOfString:v3];
      uint64_t v13 = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v14 substringFromIndex:v13]);

LABEL_7:
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v6 nextObject]);

      v8 = (void *)v20;
      if (!v20)
      {
        BOOL v29 = 1;
LABEL_14:
        v8 = v9;
        v30 = v34;
        goto LABEL_15;
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    [v15 logMessage:1, @"[INF]", @"Copying %@ to %@", v16, v9 prefix message];

    if (![v4 fileExistsAtPath:v9 isDirectory:&v38])
    {
      __int128 v21 = v34;
      goto LABEL_12;
    }

    int v17 = v38;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    __int128 v19 = v18;
    if (v17)
    {
      [v18 logMessage:1, @"[INF]", @"%@ exists and it's folder, skip", v9 prefix message];

      goto LABEL_7;
    }

    [v18 logMessage:1, @"[INF]", @"%@ exist and it's not folder, remove it first", v9 prefix message];

    id v37 = v34;
    unsigned __int8 v22 = [v4 removeItemAtPath:v9 error:&v37];
    id v23 = v37;

    if ((v22 & 1) == 0) {
      break;
    }
    __int128 v21 = v23;
LABEL_12:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9));
    id v36 = v21;
    unsigned __int8 v25 = [v4 moveItemAtURL:v8 toURL:v24 error:&v36];
    id v34 = v36;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    if ((v25 & 1) == 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ERR] %s",  "-[FDRContentInstaller updateContent:]"));
      v30 = v34;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v34 localizedDescription]);
      [v26 logMessage:2, v32, @"Failed to copy %@ - %@", v9, v33 prefix message];
      goto LABEL_20;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    BOOL v29 = 1;
    [v26 logMessage:1, @"[INF]", @"Done copying %@ to %@", v27, v9 prefix message];

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v6 nextObject]);
    v8 = (void *)v28;
    if (!v28) {
      goto LABEL_14;
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ERR] %s",  "-[FDRContentInstaller updateContent:]"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);
  [v26 logMessage:2, v32, @"Failed to remove %@ - %@", v9, v33 prefix message];
  v30 = v23;
LABEL_20:

  BOOL v29 = 0;
LABEL_15:

LABEL_17:
  return v29;
}

@end