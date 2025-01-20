@interface SKFilesystemCreator
- (BOOL)createWithVolumes:(id)a3 error:(id *)a4;
- (BOOL)setupTaskUpdateHandlerWithClient:(id)a3 taskPairs:(id)a4 error:(id *)a5;
- (SKFilesystemCreator)init;
- (SKProgress)progress;
- (void)setProgress:(id)a3;
@end

@implementation SKFilesystemCreator

- (SKFilesystemCreator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKFilesystemCreator;
  v2 = -[SKFilesystemCreator init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL));
    progress = v2->_progress;
    v2->_progress = (SKProgress *)v3;
  }

  return v2;
}

- (BOOL)setupTaskUpdateHandlerWithClient:(id)a3 taskPairs:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createWithVolumes:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v55 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v6);
  v8 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v7);
  id v9 = sub_10000E2BC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "-[SKFilesystemCreator createWithVolumes:error:]";
    __int16 v65 = 2112;
    id v66 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Creating volumes %@", buf, 0x16u);
  }

  v12 = (void *)objc_opt_new(&OBJC_CLASS___FSClient, v11);
  dispatch_group_t v13 = dispatch_group_create();
  if (-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:]( self,  "setupTaskUpdateHandlerWithClient:taskPairs:error:",  v12,  v8,  a4))
  {
    v49 = v13;
    v50 = v12;
    v48 = a4;
    v51 = v8;
    id v52 = v5;
    __int128 v62 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v59 = 0u;
    id v14 = v5;
    id v15 = [v14 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v60;
      uint64_t v53 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 filesystem]);
          unsigned __int8 v21 = [v20 isExtension];

          if ((v21 & 1) == 0)
          {
            v22 = objc_alloc(&OBJC_CLASS___SKRemoteAPFSFormatTask);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
            id v24 = v16;
            v25 = (void *)objc_claimAutoreleasedReturnValue([v19 disk]);
            v26 = v14;
            v27 = (void *)objc_claimAutoreleasedReturnValue([v19 filesystem]);
            id v28 = [v27 isCaseSensitive];
            v29 = (void *)objc_claimAutoreleasedReturnValue([v19 password]);
            v30 = -[SKRemoteAPFSFormatTask initWithName:disk:caseSensitive:password:]( v22,  "initWithName:disk:caseSensitive:password:",  v23,  v25,  v28,  v29);

            id v14 = v26;
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystemCreator progress](self, "progress"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask progress](v30, "progress"));
            objc_msgSend( v31,  "addChild:withPendingUnitCount:",  v32,  0x64 / (unint64_t)objc_msgSend(v26, "count"));

            v33 = objc_alloc(&OBJC_CLASS___SKTaskLineParser);
            v58[0] = _NSConcreteStackBlock;
            v58[1] = 3221225472LL;
            v58[2] = sub_100028048;
            v58[3] = &unk_100045788;
            v58[4] = self;
            v34 = -[SKTaskLineParser initWithCallback:](v33, "initWithCallback:", v58);
            -[SKRemoteAPFSFormatTask setStdoutParser:](v30, "setStdoutParser:", v34);

            v35 = objc_alloc(&OBJC_CLASS___SKTaskLineParser);
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472LL;
            v57[2] = sub_10002809C;
            v57[3] = &unk_100045788;
            v57[4] = self;
            v36 = -[SKTaskLineParser initWithCallback:](v35, "initWithCallback:", v57);
            -[SKRemoteAPFSFormatTask setStderrParser:](v30, "setStderrParser:", v36);

            id v16 = v24;
            uint64_t v17 = v53;
            [v55 addObject:v30];
          }
        }

        id v16 = [v14 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }

      while (v16);
    }

    v37 = objc_alloc(&OBJC_CLASS___SKWaitableAggregate);
    v38 = -[SKRemoteTaskExecuter initWithTasks:](objc_alloc(&OBJC_CLASS___SKRemoteTaskExecuter), "initWithTasks:", v55);
    v69[0] = v38;
    v8 = v51;
    v39 = -[SKFSTaskPairsWaiter initWithTaskPairs:]( objc_alloc(&OBJC_CLASS___SKFSTaskPairsWaiter),  "initWithTaskPairs:",  v51);
    v69[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 2LL));
    v41 = -[SKWaitableAggregate initWithWaitables:](v37, "initWithWaitables:", v40);

    id v56 = 0LL;
    unsigned int v42 = -[SKWaitableAggregate waitWithError:](v41, "waitWithError:", &v56);
    id v43 = v56;
    id v44 = sub_10000E2BC();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v64 = "-[SKFilesystemCreator createWithVolumes:error:]";
      __int16 v65 = 2112;
      id v66 = v14;
      __int16 v67 = 1024;
      unsigned int v68 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%s: Finished creating volumes %@, status %hhd",  buf,  0x1Cu);
    }

    if (v43)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:underlyingError:]( &OBJC_CLASS___SKError,  "errorWithCode:underlyingError:",  352LL,  v43));
      LOBYTE(v42) = +[SKError failWithError:error:]( &OBJC_CLASS___SKError,  "failWithError:error:",  v46,  v48);
    }

    id v5 = v52;
    dispatch_group_t v13 = v49;
    v12 = v50;
  }

  else
  {
    LOBYTE(v42) = 0;
  }

  return v42;
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end