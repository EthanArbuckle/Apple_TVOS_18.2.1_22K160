@interface SKFilesystemMaintainer
- (BOOL)repairWithError:(id *)a3;
- (BOOL)runMaintenanceOperationWithArgsCreator:(id)a3 error:(id *)a4;
- (BOOL)verifyWithError:(id *)a3;
- (FSClient)client;
- (NSArray)disks;
- (SKFilesystemMaintainer)initWithDisk:(id)a3;
- (SKFilesystemMaintainer)initWithDisks:(id)a3;
- (SKProgress)progress;
- (void)setProgress:(id)a3;
@end

@implementation SKFilesystemMaintainer

- (SKFilesystemMaintainer)initWithDisk:(id)a3
{
  id v8 = a3;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  v6 = -[SKFilesystemMaintainer initWithDisks:](self, "initWithDisks:", v5, v8);
  return v6;
}

- (SKFilesystemMaintainer)initWithDisks:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SKFilesystemMaintainer;
  v6 = -[SKFilesystemMaintainer init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_disks, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL));
    progress = v7->_progress;
    v7->_progress = (SKProgress *)v8;
  }

  return v7;
}

- (FSClient)client
{
  client = self->_client;
  if (!client)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_client)
    {
      v7 = (FSClient *)objc_opt_new(&OBJC_CLASS___FSClient, v5, v6);
      uint64_t v8 = self->_client;
      self->_client = v7;
    }

    objc_sync_exit(v4);

    client = self->_client;
  }

  return client;
}

- (BOOL)runMaintenanceOperationWithArgsCreator:(id)a3 error:(id *)a4
{
  uint64_t v6 = (uint64_t (**)(id, void *, id *))a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100045700));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 filteredArrayUsingPredicate:v8]);

  if ([v9 count])
  {
    id v10 = sub_10000E2BC();
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[SKFilesystemMaintainer runMaintenanceOperationWithArgsCreator:error:]";
      __int16 v49 = 2112;
      v50 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s: Cannot run maintenance operation on disks without filesystem, %@",  buf,  0x16u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v9,  0LL));
    unsigned __int8 v13 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v12, a4);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer progress](self, "progress"));
    [v14 setCompletedUnitCount:0];

    v12 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v15);
    uint64_t v44 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v16);
    dispatch_group_t v45 = dispatch_group_create();
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
    id v18 = [v17 count];

    if (v18)
    {
      unint64_t v19 = 0LL;
      while (1)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:v19]);

        uint64_t v22 = v6[2](v6, v21, a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if (!v23)
        {
          unsigned __int8 v13 = 0;
          goto LABEL_15;
        }

        uint64_t v24 = objc_claimAutoreleasedReturnValue([v21 filesystem]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([(id)v24 repairArgs]);
        [v23 containsObject:v25];

        v26 = (void *)objc_claimAutoreleasedReturnValue([v21 filesystem]);
        LOBYTE(v24) = [v26 isExtension];

        if ((v24 & 1) == 0) {
          break;
        }

        ++v19;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
        id v29 = [v28 count];
      }

      v36 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v27);
      [v36 addObjectsFromArray:v23];
      v37 = (void *)objc_claimAutoreleasedReturnValue([v21 filesystem]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 xmlOutputArg]);

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue([v21 filesystem]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 xmlOutputArg]);
        [v36 addObject:v40];
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue([v21 diskIdentifier]);
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", v41));
      [v36 addObject:v42];

      unsigned __int8 v13 = +[SKError failWithPOSIXCode:error:]( &OBJC_CLASS___SKError,  "failWithPOSIXCode:error:",  45LL,  a4);
LABEL_15:
      v32 = (void *)v44;
    }

    else
    {
LABEL_10:
      v30 = objc_alloc(&OBJC_CLASS___SKWaitableAggregate);
      v31 = -[SKTaskExecuter initWithTasks:](objc_alloc(&OBJC_CLASS___SKTaskExecuter), "initWithTasks:", v12);
      v46[0] = v31;
      v32 = (void *)v44;
      v33 = -[SKFSTaskPairsWaiter initWithTaskPairs:]( objc_alloc(&OBJC_CLASS___SKFSTaskPairsWaiter),  "initWithTaskPairs:",  v44);
      v46[1] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
      v35 = -[SKWaitableAggregate initWithWaitables:](v30, "initWithWaitables:", v34);

      unsigned __int8 v13 = -[SKWaitableAggregate waitWithError:](v35, "waitWithError:", a4);
    }
  }

  return v13;
}

- (BOOL)verifyWithError:(id *)a3
{
  id v5 = sub_10000E2BC();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
    *(_DWORD *)buf = 136315394;
    unint64_t v19 = "-[SKFilesystemMaintainer verifyWithError:]";
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Started verify on %@", buf, 0x16u);
  }

  id v17 = 0LL;
  unsigned __int8 v8 = -[SKFilesystemMaintainer runMaintenanceOperationWithArgsCreator:error:]( self,  "runMaintenanceOperationWithArgsCreator:error:",  &stru_100045740,  &v17);
  id v9 = v17;
  id v10 = sub_10000E2BC();
  objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
      *(_DWORD *)buf = 136315394;
      unint64_t v19 = "-[SKFilesystemMaintainer verifyWithError:]";
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Finished verify on %@", buf, 0x16u);
    }

    unsigned __int8 v14 = 1;
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
      *(_DWORD *)buf = 136315394;
      unint64_t v19 = "-[SKFilesystemMaintainer verifyWithError:]";
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to verify disk(s) %@", buf, 0x16u);
    }

    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:underlyingError:]( &OBJC_CLASS___SKError,  "errorWithCode:underlyingError:",  350LL,  v9));
    unsigned __int8 v14 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v12, a3);
  }

  return v14;
}

- (BOOL)repairWithError:(id *)a3
{
  id v4 = sub_10000E2BC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
    *(_DWORD *)buf = 136315394;
    v41 = "-[SKFilesystemMaintainer repairWithError:]";
    __int16 v42 = 2112;
    v43 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Started repair on %@", buf, 0x16u);
  }

  id v36 = 0LL;
  unsigned __int8 v7 = -[SKFilesystemMaintainer runMaintenanceOperationWithArgsCreator:error:]( self,  "runMaintenanceOperationWithArgsCreator:error:",  &stru_100045760,  &v36);
  id v8 = v36;
  id v9 = v8;
  if ((v7 & 1) != 0)
  {
    id v29 = v8;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
    id v10 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKManager syncSharedManager](&OBJC_CLASS___SKManager, "syncSharedManager"));
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 diskIdentifier]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 diskForString:v16]);

          uint64_t v37 = kSKDiskMountOptionRestore;
          v38 = &__kCFBooleanTrue;
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
          LOBYTE(v16) = [v17 mountWithOptionsDictionary:v18 error:a3];

          if ((v16 & 1) == 0)
          {
            id v26 = sub_10000E2BC();
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v41 = "-[SKFilesystemMaintainer repairWithError:]";
              __int16 v42 = 2112;
              v43 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s: Failed to remount disk %@ after repair",  buf,  0x16u);
            }

            unsigned __int8 v22 = 0;
            id v9 = v29;
            __int16 v20 = (os_log_s *)obj;
            goto LABEL_21;
          }
        }

        id v11 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v19 = sub_10000E2BC();
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
      *(_DWORD *)buf = 136315394;
      v41 = "-[SKFilesystemMaintainer repairWithError:]";
      __int16 v42 = 2112;
      v43 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Finished repair on %@", buf, 0x16u);
    }

    unsigned __int8 v22 = 1;
    id v9 = v29;
  }

  else
  {
    id v23 = sub_10000E2BC();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemMaintainer disks](self, "disks"));
      *(_DWORD *)buf = 136315394;
      v41 = "-[SKFilesystemMaintainer repairWithError:]";
      __int16 v42 = 2112;
      v43 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Failed to repair disk(s) %@", buf, 0x16u);
    }

    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:underlyingError:]( &OBJC_CLASS___SKError,  "errorWithCode:underlyingError:",  351LL,  v9));
    unsigned __int8 v22 = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v20, a3);
  }

- (NSArray)disks
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end