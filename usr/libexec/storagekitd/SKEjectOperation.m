@interface SKEjectOperation
- (BOOL)run;
- (SKDisk)diskToEject;
- (SKEjectOperation)initWithDisk:(id)a3 withCompletionBlock:(id)a4;
- (id)_wholeDisksToEject;
- (id)description;
- (int64_t)defaultErrorCode;
- (void)_deepUnmountWithWholeDisk:(id)a3;
- (void)setDiskToEject:(id)a3;
@end

@implementation SKEjectOperation

- (SKEjectOperation)initWithDisk:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SKEjectOperation;
  v7 = -[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:]( &v14,  "initWithTarget:options:callbackBlock:",  v6,  &__NSDictionary0__struct,  a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 wholeDiskForDisk:v6]);

    if (v9) {
      v10 = v9;
    }
    else {
      v10 = v6;
    }
    v11 = v10;
    diskToEject = v7->_diskToEject;
    v7->_diskToEject = v11;
  }

  return v7;
}

- (id)_wholeDisksToEject
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SKAPFSContainerDisk);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 physicalStores]);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        v15 = 0LL;
        v16 = v5;
        do
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          v5 = (void *)objc_claimAutoreleasedReturnValue([v3 wholeDiskForDisk:*(void *)(*((void *)&v33 + 1) + 8 * (void)v15)]);

          if (v5) {
            [v4 addObject:v5];
          }
          v15 = (char *)v15 + 1;
          v16 = v5;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }

      while (v13);
    }
  }

  else
  {
    [v4 addObject:v9];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v5 children]);
  v19 = v18;
  if (v18)
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          uint64_t v25 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
          if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v24 container]);
            if (v26) {
              [v17 addObject:v26];
            }
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v21);
    }
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  [v17 addObjectsFromArray:v27];

  return v17;
}

- (void)_deepUnmountWithWholeDisk:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 children]);
  if (v5) {
    [v4 addObjectsFromArray:v5];
  }
  [v4 addObject:v3];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = kSKDiskMountOptionRecursive;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v18 = v9;
        v19 = &__kCFBooleanTrue;
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
        +[SKUnmountOperation unmountWithDisk:options:error:]( &OBJC_CLASS___SKUnmountOperation,  "unmountWithDisk:options:error:",  v11,  v12,  0LL);
      }

      id v7 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v7);
  }
}

- (BOOL)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation _wholeDisksToEject](self, "_wholeDisksToEject"));
  id v4 = sub_10000E2BC();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v35 = "-[SKEjectOperation run]";
    __int16 v36 = 1024;
    LODWORD(v37) = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Ejecting %d disks", buf, 0x12u);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (!v7)
  {
LABEL_22:

LABEL_26:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10002B414;
    v29[3] = &unk_100044B50;
    v29[4] = self;
    [v26 syncAllDisksWithCompletionBlock:v29];

    BOOL v25 = 1;
    goto LABEL_27;
  }

  id v8 = v7;
  uint64_t v9 = *(void *)v31;
  v28 = v6;
LABEL_5:
  uint64_t v10 = 0LL;
  while (1)
  {
    if (*(void *)v31 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
    -[SKEjectOperation _deepUnmountWithWholeDisk:](self, "_deepUnmountWithWholeDisk:", v11);
    id v12 = sub_10000E2BC();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v35 = "-[SKEjectOperation run]";
      __int16 v36 = 2112;
      v37 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Ejecting %@", buf, 0x16u);
    }

    __int128 v14 = (__DADisk *)objc_claimAutoreleasedReturnValue([v11 daDisk]);
    if (!v14) {
      goto LABEL_20;
    }
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Eject of %@",  v11));
    -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v15);

    DADiskEject(v14, 0, (DADiskEjectCallback)sub_1000196D4, self);
    if (!-[SKBaseDiskArbOperation completeDiskArbOp](self, "completeDiskArbOp")) {
      break;
    }
LABEL_17:
    id v21 = sub_10000E2BC();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v35 = "-[SKEjectOperation run]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Ejected", buf, 0xCu);
    }

LABEL_20:
    if (v8 == (id)++v10)
    {
      id v8 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v8) {
        goto LABEL_5;
      }
      goto LABEL_22;
    }
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  if (([v11 isEqual:v16] & 1) == 0)
  {
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___SKAPFSContainerDisk);
    char isKindOfClass = objc_opt_isKindOfClass(v11, v17);

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_24;
    }
    id v19 = sub_10000E2BC();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v35 = "-[SKEjectOperation run]";
      __int16 v36 = 2112;
      v37 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s: %@ failed to eject, continue anyway",  buf,  0x16u);
    }

    id v6 = v28;
    goto LABEL_17;
  }

LABEL_24:
  id v23 = -[SKBaseDiskArbOperation newDAError](self, "newDAError");

  id v6 = v28;
  if (!v23) {
    goto LABEL_26;
  }
  v24 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation callbackBlock](self, "callbackBlock"));
  ((void (**)(void, id))v24)[2](v24, v23);

  -[SKManagerOperation finished](self, "finished");
  BOOL v25 = 0;
LABEL_27:

  return v25;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKEjectOperation diskToEject](self, "diskToEject"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Eject Operation for %@",  v2));

  return v3;
}

- (int64_t)defaultErrorCode
{
  return 403LL;
}

- (SKDisk)diskToEject
{
  return (SKDisk *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDiskToEject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end