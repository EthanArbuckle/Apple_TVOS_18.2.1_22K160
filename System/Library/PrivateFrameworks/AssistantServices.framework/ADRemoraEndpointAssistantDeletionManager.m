@interface ADRemoraEndpointAssistantDeletionManager
- (ADRemoraEndpointAssistantDeletionManager)initWithQueue:(id)a3;
- (id)_workingDirectory;
- (void)_addAccount:(id)a3 forEndpointUUID:(id)a4;
- (void)_processAccountDeletionFileAtPath:(id)a3 completion:(id)a4;
- (void)_processAccountDeletionsUntilDate:(id)a3;
- (void)_processNextAccountDeletionUntilDate:(id)a3;
- (void)addAccount:(id)a3 forEndpointUUID:(id)a4;
- (void)processAccountDeletionsUntilDate:(id)a3;
@end

@implementation ADRemoraEndpointAssistantDeletionManager

- (ADRemoraEndpointAssistantDeletionManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointAssistantDeletionManager;
  v6 = -[ADRemoraEndpointAssistantDeletionManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessionsByIdentifier = v7->_sessionsByIdentifier;
    v7->_sessionsByIdentifier = v8;
  }

  return v7;
}

- (void)addAccount:(id)a3 forEndpointUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000740E0;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)processAccountDeletionsUntilDate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000740D4;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_workingDirectory
{
  uint64_t v2 = AFUserSupportDirectoryPath(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"EndpointAccountsToBeDeleted"]);

  char v23 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v23];

  if (!v6)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[ADRemoraEndpointAssistantDeletionManager _workingDirectory]";
      __int16 v26 = 2112;
      v27 = v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s %@ does not exist, creating it...",  buf,  0x16u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v20 = 0LL;
    unsigned int v10 = [v9 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v20];
    id v7 = v20;

    objc_super v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (v10)
    {
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
LABEL_8:
      *(_DWORD *)buf = 136315394;
      v25 = "-[ADRemoraEndpointAssistantDeletionManager _workingDirectory]";
      __int16 v26 = 2112;
      v27 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@ is created.", buf, 0x16u);
      goto LABEL_23;
    }

    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
LABEL_10:
    *(_DWORD *)buf = 136315650;
    v25 = "-[ADRemoraEndpointAssistantDeletionManager _workingDirectory]";
    __int16 v26 = 2112;
    v27 = v4;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Unable to create %@ due to %@.",  buf,  0x20u);
    goto LABEL_23;
  }

  if (v23)
  {
    id v7 = 0LL;
    goto LABEL_23;
  }

  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[ADRemoraEndpointAssistantDeletionManager _workingDirectory]";
    __int16 v26 = 2112;
    v27 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s %@ is not a directory, removing it...",  buf,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v22 = 0LL;
  unsigned int v14 = [v13 removeItemAtPath:v4 error:&v22];
  id v15 = v22;

  v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (v14)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[ADRemoraEndpointAssistantDeletionManager _workingDirectory]";
      __int16 v26 = 2112;
      v27 = v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s %@ is removed, creating it...",  buf,  0x16u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v21 = v15;
    unsigned int v18 = [v17 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v21];
    id v7 = v21;

    objc_super v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (v18)
    {
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_23;
      }
      goto LABEL_8;
    }

    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    goto LABEL_10;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[ADRemoraEndpointAssistantDeletionManager _workingDirectory]";
    __int16 v26 = 2112;
    v27 = v4;
    __int16 v28 = 2112;
    id v29 = v15;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Unable to remove %@ due to %@.",  buf,  0x20u);
  }

  id v7 = v15;
LABEL_23:

  return v4;
}

- (void)_addAccount:(id)a3 forEndpointUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    char v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315138;
    v31 = "-[ADRemoraEndpointAssistantDeletionManager _addAccount:forEndpointUUID:]";
    v24 = "%s Unable to add account because the account does not exist.";
    v25 = v23;
    uint32_t v26 = 12;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
    goto LABEL_20;
  }

  if (!v7)
  {
    v27 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315395;
    v31 = "-[ADRemoraEndpointAssistantDeletionManager _addAccount:forEndpointUUID:]";
    __int16 v32 = 2113;
    id v33 = v6;
    v24 = "%s Unable to add %{private}@ because the endpoint UUID does not exist.";
    v25 = v27;
    uint32_t v26 = 22;
    goto LABEL_13;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if ([v9 length])
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathExtension:@"plist"]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoraEndpointAssistantDeletionManager _workingDirectory](self, "_workingDirectory"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v11]);

    v40[0] = @"date";
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v41[0] = v14;
    v41[1] = &off_1005131C8;
    v40[1] = @"retries";
    v40[2] = @"endpointUUID";
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    v41[2] = v15;
    v40[3] = @"account";
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 messageDictionary]);
    v41[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  4LL));

    unsigned int v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315907;
      v31 = "-[ADRemoraEndpointAssistantDeletionManager _addAccount:forEndpointUUID:]";
      __int16 v32 = 2113;
      id v33 = v6;
      __int16 v34 = 2112;
      v35 = v8;
      __int16 v36 = 2112;
      v37 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Adding %{private}@ for endpoint %@ to %@...",  buf,  0x2Au);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v13));
    id v29 = 0LL;
    unsigned int v20 = [v17 writeToURL:v19 error:&v29];
    id v21 = v29;

    id v22 = (os_log_s *)AFSiriLogContextDaemon;
    if (v20)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315907;
        v31 = "-[ADRemoraEndpointAssistantDeletionManager _addAccount:forEndpointUUID:]";
        __int16 v32 = 2113;
        id v33 = v6;
        __int16 v34 = 2112;
        v35 = v8;
        __int16 v36 = 2112;
        v37 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Added %{private}@ for endpoint %@ to %@.",  buf,  0x2Au);
      }
    }

    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316163;
      v31 = "-[ADRemoraEndpointAssistantDeletionManager _addAccount:forEndpointUUID:]";
      __int16 v32 = 2113;
      id v33 = v6;
      __int16 v34 = 2112;
      v35 = v8;
      __int16 v36 = 2112;
      v37 = v13;
      __int16 v38 = 2112;
      id v39 = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Failed to add %{private}@ for endpoint %@ to %@ due to %@.",  buf,  0x34u);
    }
  }

  else
  {
    __int16 v28 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315651;
      v31 = "-[ADRemoraEndpointAssistantDeletionManager _addAccount:forEndpointUUID:]";
      __int16 v32 = 2113;
      id v33 = v6;
      __int16 v34 = 2112;
      v35 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s Unable to add %{private}@ for %@ because the account identifier does not exist.",  buf,  0x20u);
    }
  }

LABEL_20:
}

- (void)_processAccountDeletionsUntilDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoraEndpointAssistantDeletionManager _workingDirectory](self, "_workingDirectory"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v15 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentsOfDirectoryAtPath:v5 error:&v15]);
  id v8 = v15;

  id v9 = [v7 count];
  if (v9)
  {
    if (AFIsInternalInstall(v9))
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100073FD8;
      v13[3] = &unk_1004F8C10;
      id v14 = v5;
      [v7 enumerateObjectsUsingBlock:v13];
    }

    unsigned int v10 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v7);
    pendingFileNames = self->_pendingFileNames;
    self->_pendingFileNames = v10;

    -[ADRemoraEndpointAssistantDeletionManager _processNextAccountDeletionUntilDate:]( self,  "_processNextAccountDeletionUntilDate:",  v4);
  }

  else if (v8)
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "-[ADRemoraEndpointAssistantDeletionManager _processAccountDeletionsUntilDate:]";
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Unable to list account deletion file names at %@ due to %@.",  buf,  0x20u);
    }
  }
}

- (void)_processNextAccountDeletionUntilDate:(id)a3
{
  id v4 = a3;
  if ((unint64_t)-[NSMutableDictionary count](self->_sessionsByIdentifier, "count") < 2)
  {
    if (!-[NSMutableSet count](self->_pendingFileNames, "count"))
    {
      id v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v20 = "-[ADRemoraEndpointAssistantDeletionManager _processNextAccountDeletionUntilDate:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s No more pending account deletion files.",  buf,  0xCu);
      }
    }

    [v4 timeIntervalSinceNow];
    if (v10 >= 0.0)
    {
      while (-[NSMutableSet count](self->_pendingFileNames, "count"))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_pendingFileNames, "anyObject"));
        -[NSMutableSet removeObject:](self->_pendingFileNames, "removeObject:", v12);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByDeletingPathExtension]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionsByIdentifier, "objectForKey:", v13));

        if (!v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoraEndpointAssistantDeletionManager _workingDirectory](self, "_workingDirectory"));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:v12]);

          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472LL;
          v17[2] = sub_100073FCC;
          v17[3] = &unk_1004FD968;
          v17[4] = self;
          id v18 = v4;
          -[ADRemoraEndpointAssistantDeletionManager _processAccountDeletionFileAtPath:completion:]( self,  "_processAccountDeletionFileAtPath:completion:",  v16,  v17);
        }
      }
    }

    else
    {
      objc_super v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v20 = "-[ADRemoraEndpointAssistantDeletionManager _processNextAccountDeletionUntilDate:]";
        __int16 v21 = 2112;
        id v22 = v4;
        id v6 = "%s Limit date %@ reached.";
        id v7 = v11;
        uint32_t v8 = 22;
        goto LABEL_10;
      }
    }
  }

  else
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v20 = "-[ADRemoraEndpointAssistantDeletionManager _processNextAccountDeletionUntilDate:]";
      id v6 = "%s Maximum number of account deletion sessions reached.";
      id v7 = v5;
      uint32_t v8 = 12;
LABEL_10:
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v6, buf, v8);
    }
  }
}

- (void)_processAccountDeletionFileAtPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint32_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[ADRemoraEndpointAssistantDeletionManager _processAccountDeletionFileAtPath:completion:]";
    __int16 v67 = 2112;
    id v68 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Processing account deletion file at %@...",  buf,  0x16u);
  }

  id v9 = objc_alloc(&OBJC_CLASS___NSDictionary);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
  objc_super v11 = -[NSDictionary initWithContentsOfURL:](v9, "initWithContentsOfURL:", v10);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v11, "objectForKey:", @"endpointUUID"));
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      id v14 = v12;

      if (v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v11, "objectForKey:", @"account"));
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          id v17 = v15;

          if (v17)
          {
            id v18 = -[ADAccount initWithMessageDictionary:]( objc_alloc(&OBJC_CLASS___ADAccount),  "initWithMessageDictionary:",  v17);
            if (!v18)
            {
              v30 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v66 = "-[ADRemoraEndpointAssistantDeletionManager _processAccountDeletionFileAtPath:completion:]";
                __int16 v67 = 2112;
                id v68 = v6;
                _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s Unable to create account from extracted account info from the account deletion info dictionary at %@.",  buf,  0x16u);
              }

              queue = (dispatch_queue_s *)self->_queue;
              v57[0] = _NSConcreteStackBlock;
              v57[1] = 3221225472LL;
              v57[2] = sub_1000738F8;
              v57[3] = &unk_1004FC838;
              id v58 = v7;
              dispatch_async(queue, v57);
              __int16 v32 = v58;
              goto LABEL_36;
            }

            v47 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v47 stringByDeletingPathExtension]);
            v49 = v18;
            __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount identifier](v18, "identifier"));
            id v21 = v19;
            id v22 = v20;
            v48 = v21;
            if (v21 == v22)
            {

              if (v21)
              {
LABEL_33:
                __int16 v34 = objc_alloc(&OBJC_CLASS___ADRemoraEndpointAssistantDeletionSession);
                v46 = self->_queue;
                v35 = objc_alloc(&OBJC_CLASS___AFInstanceContext);
                v44 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v14);
                __int16 v36 = -[AFInstanceContext initWithEndpointUUID:loadsEndpointOnDemand:]( v35,  "initWithEndpointUUID:loadsEndpointOnDemand:",  v44,  1LL);
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[ADAccount activeAccount](&OBJC_CLASS___ADAccount, "activeAccount"));
                __int16 v38 = -[ADRemoraEndpointAssistantDeletionSession initWithQueue:instanceContext:endpointAccount:hubAccount:]( v34,  "initWithQueue:instanceContext:endpointAccount:hubAccount:",  v46,  v36,  v49,  v37);

                -[NSMutableDictionary setObject:forKey:](self->_sessionsByIdentifier, "setObject:forKey:", v38, v48);
                id v39 = (os_log_s *)AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v66 = "-[ADRemoraEndpointAssistantDeletionManager _processAccountDeletionFileAtPath:completion:]";
                  __int16 v67 = 2112;
                  id v68 = v48;
                  _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%s Deleting Assistant history for %@...",  buf,  0x16u);
                }

                v50[0] = _NSConcreteStackBlock;
                v50[1] = 3221225472LL;
                v50[2] = sub_10007390C;
                v50[3] = &unk_1004FBCF0;
                id v51 = v48;
                v52 = v38;
                v53 = self;
                id v54 = v6;
                v55 = v11;
                id v56 = v7;
                v40 = v38;
                id v41 = v48;
                -[ADRemoraEndpointAssistantDeletionSession deleteAssistantHistoryWithCompletion:]( v40,  "deleteAssistantHistoryWithCompletion:",  v50);

                id v18 = v49;
                __int16 v32 = v47;
LABEL_36:

LABEL_37:
LABEL_38:

                goto LABEL_39;
              }
            }

            else
            {
              char v23 = v22;
              if (v21 && v22)
              {
                unsigned __int8 v45 = [v21 isEqual:v22];

                if ((v45 & 1) != 0) {
                  goto LABEL_33;
                }
              }

              else
              {
              }
            }

            id v33 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              v42 = v33;
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[ADAccount identifier](v49, "identifier"));
              *(_DWORD *)buf = 136315906;
              v66 = "-[ADRemoraEndpointAssistantDeletionManager _processAccountDeletionFileAtPath:completion:]";
              __int16 v67 = 2112;
              id v68 = v6;
              __int16 v69 = 2112;
              v70 = v43;
              __int16 v71 = 2112;
              v72 = v48;
              _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%s Detected mismatched account deletion file at %@ and account identifier %@, using %@.",  buf,  0x2Au);
            }

            goto LABEL_33;
          }
        }

        else
        {
        }

        __int16 v28 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v66 = "-[ADRemoraEndpointAssistantDeletionManager _processAccountDeletionFileAtPath:completion:]";
          __int16 v67 = 2112;
          id v68 = v6;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s Unable to extract account info from the account deletion info dictionary at %@.",  buf,  0x16u);
        }

        id v29 = (dispatch_queue_s *)self->_queue;
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472LL;
        v59[2] = sub_1000738E4;
        v59[3] = &unk_1004FC838;
        v60 = (ADAccount *)v7;
        dispatch_async(v29, v59);
        id v17 = 0LL;
        id v18 = v60;
        goto LABEL_37;
      }
    }

    else
    {
    }

    uint32_t v26 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v66 = "-[ADRemoraEndpointAssistantDeletionManager _processAccountDeletionFileAtPath:completion:]";
      __int16 v67 = 2112;
      id v68 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Unable to extract endpoint UUID from the account deletion info dictionary at %@.",  buf,  0x16u);
    }

    v27 = (dispatch_queue_s *)self->_queue;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_1000738D0;
    v61[3] = &unk_1004FC838;
    id v62 = v7;
    dispatch_async(v27, v61);
    id v14 = 0LL;
    id v17 = v62;
    goto LABEL_38;
  }

  v24 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[ADRemoraEndpointAssistantDeletionManager _processAccountDeletionFileAtPath:completion:]";
    __int16 v67 = 2112;
    id v68 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Unable to read the account deletion info dictionary at %@.",  buf,  0x16u);
  }

  v25 = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000738BC;
  block[3] = &unk_1004FC838;
  id v64 = v7;
  dispatch_async(v25, block);
  id v14 = v64;
LABEL_39:
}

- (void).cxx_destruct
{
}

@end