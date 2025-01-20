id CPLDaemonProcessInterface()
{
  void *v0;
  uint64_t v1;
  NSSet *v2;
  void *v3;
  uint64_t v4;
  NSSet *v5;
  void *v6;
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CPLDaemonProcessProtocol));
  v1 = objc_opt_class(&OBJC_CLASS___NSArray);
  v2 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  objc_opt_class(&OBJC_CLASS___CPLEngineWrapperStatus),  0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v0 setClasses:v3 forSelector:"getEngineWrapperStatusesWithCompletionHandler:" argumentIndex:0 ofReply:1];

  v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  v5 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v4, objc_opt_class(&OBJC_CLASS___NSString), 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v0 setClasses:v6 forSelector:"getDaemonLibraryManagerStatusesWithCompletionHandler:" argumentIndex:0 ofReply:1];

  return v0;
}

BOOL sub_100002AD8(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  v7 = (void *)v6;
  if (!a1) {
    goto LABEL_9;
  }
  BOOL v8 = (v5 | v6) == 0;
  if (!v5 || !v6) {
    goto LABEL_12;
  }
  if ([(id)v5 isEqual:v6])
  {
    BOOL v8 = 1LL;
    goto LABEL_12;
  }

  v9 = realpath_DARWIN_EXTSN( (const char *)[(id) v5 fileSystemRepresentation], 0);
  if (!v9)
  {
LABEL_9:
    BOOL v8 = 0LL;
    goto LABEL_12;
  }

  v10 = v9;
  v11 = realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], 0);
  if (v11)
  {
    v12 = v11;
    BOOL v8 = strcmp(v10, v11) == 0;
    free(v12);
  }

  else
  {
    BOOL v8 = 0LL;
  }

  free(v10);
LABEL_12:

  return v8;
}

id sub_100002F28()
{
  if (qword_10003D348 != -1) {
    dispatch_once(&qword_10003D348, &stru_100030AC8);
  }
  return (id)qword_10003D350;
}

void sub_10000302C(id a1)
{
  v1 = objc_alloc(&OBJC_CLASS___NSSet);
  v2 = -[NSSet initWithObjects:]( v1,  "initWithObjects:",  CPLLibraryIdentifierSystemLibrary,  CPLLibraryIdentifierSyndicationLibrary,  0LL);
  v3 = (void *)qword_10003D338;
  qword_10003D338 = (uint64_t)v2;
}

LABEL_39:
      goto LABEL_40;
    }

    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"clientLibraryBasePath"]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"cloudLibraryStateStoragePath"]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"cloudLibraryResourceStoragePath"]);
    v37 = v28;
    if (v28) {
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v28,  1LL));
    }
    if (v41) {
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v41,  1LL));
    }
    else {
      v38 = 0LL;
    }
    if (v39) {
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v39,  1LL));
    }
    else {
      v40 = 0LL;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"options"]);
    v36 = [v29 integerValue];

    if (v41 && v28 && v40)
    {
      if (!_CPLSilentLogging)
      {
        v30 = sub_100002F28();
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Upgrading old engine info for %{public}@",  buf,  0xCu);
        }
      }

      v32 = objc_alloc(&OBJC_CLASS___CPLEngineParameters);
      v33 = -[CPLEngineParameters initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:]( v32,  "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier: mainScopeIdentifier:options:",  v28,  v38,  v40,  v20,  CPLPrimaryScopeIdentifier,  v36);
      -[CPLEngineParametersStorage _saveParameters:withKey:](v13, "_saveParameters:withKey:", v33, v24);
    }

    else
    {
      if (_CPLSilentLogging)
      {
LABEL_38:

        v26 = 0LL;
        goto LABEL_39;
      }

      v34 = sub_100002F28();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v44 = v20;
        v45 = 2112;
        v46 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Discarding old invalid engine info for %{public}@: %@",  buf,  0x16u);
      }
    }

    goto LABEL_38;
  }

LABEL_42:
  return v13;
}

void sub_100003BF0(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 hasPrefix:@"CPLEngineParameters-"])
  {
    id v3 = [v6 length];
    if (v3 > [@"CPLEngineParameters-" length])
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "substringWithRange:",  objc_msgSend(@"CPLEngineParameters-", "length"),  (_BYTE *)objc_msgSend(v6, "length")
                     - (_BYTE *)[@"CPLEngineParameters-" length]));
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) parametersForLibraryIdentifier:v4]);
      if (v5) {
        [*(id *)(a1 + 40) addObject:v5];
      }
    }
  }
}

int64_t sub_100003CC4(id a1, CPLEngineParameters *a2, CPLEngineParameters *a3)
{
  v4 = a2;
  unint64_t v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParameters libraryIdentifier](v4, "libraryIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParameters libraryIdentifier](v5, "libraryIdentifier"));
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) != 0)
  {
    int64_t v9 = 0LL;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParameters libraryIdentifier](v4, "libraryIdentifier"));
    uint64_t v11 = CPLLibraryIdentifierSystemLibrary;
    unsigned __int8 v12 = [v10 isEqualToString:CPLLibraryIdentifierSystemLibrary];

    if ((v12 & 1) != 0)
    {
      int64_t v9 = -1LL;
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParameters libraryIdentifier](v5, "libraryIdentifier"));
      unsigned __int8 v14 = [v13 isEqualToString:v11];

      if ((v14 & 1) != 0)
      {
        int64_t v9 = 1LL;
      }

      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParameters libraryIdentifier](v4, "libraryIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParameters libraryIdentifier](v5, "libraryIdentifier"));
        int64_t v9 = (int64_t)[v15 compare:v16];
      }
    }
  }

  return v9;
}

void sub_10000419C(id a1)
{
  v1 = (const char *)_CPLOSLogSubsystem(a1);
  os_log_t v2 = os_log_create(v1, "engine.parameters");
  id v3 = (void *)qword_10003D350;
  qword_10003D350 = (uint64_t)v2;
}

void sub_100004624( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t sub_100004654(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004664(uint64_t a1)
{
}

void sub_10000466C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v4 = v5;
  }
}

void sub_1000046DC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a3);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

uint64_t sub_100004778(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  83LL,  @"failed to get management service in time"));
    uint64_t v3 = *(void *)(*(void *)(v1 + 48) + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    *(_BYTE *)(*(void *)(*(void *)(v1 + 40) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 32));
  }

  return result;
}

LABEL_21:
  -[CPLTask setArgv:](self, "setArgv:", v4);
}

void sub_100005344(void *a1)
{
}

void sub_100005358(_Unwind_Exception *a1)
{
}

void sub_10000536C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0LL;

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v4 + 76))
  {
    int v5 = *(_DWORD *)(v4 + 80);
    if (v5 < 1) {
      double v6 = 60.0;
    }
    else {
      double v6 = (double)v5;
    }
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v6));
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  }

  uint64_t v8 = *(void *)(a1 + 32);
  int64_t v9 = *(void **)(v8 + 64);
  *(void *)(v8 + 64) = v7;
}

void sub_1000054F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000552C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000553C(uint64_t a1)
{
}

void sub_100005544(uint64_t a1)
{
}

LABEL_10:
LABEL_11:
      v21 = 1;
LABEL_13:
      v27 = v21 != 0;
      v28 = (char *)*v10;
      if (*v10)
      {
        v29 = (void **)(v10 + 1);
        do
        {
          free(v28);
          v30 = (char *)*v29++;
          v28 = v30;
        }

        while (v30);
      }

      free(v10);
      if (posix_spawn_file_actions_destroy(v19) && !_CPLSilentLogging)
      {
        uint64_t v31 = sub_10000610C();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = __error();
          v34 = strerror(*v33);
          *(_DWORD *)buf = 136315138;
          v118 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Unable to destroy the file actions properly (%s).",  buf,  0xCu);
        }
      }

      free(v19);
      goto LABEL_22;
    }
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask redirectStderrToFileAtPath](self, "redirectStderrToFileAtPath"));
  v56 = [v55 length];

  if (v56)
  {
    if (!_CPLSilentLogging)
    {
      v57 = sub_10000610C();
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        v59 = (char *)*v10;
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask redirectStderrToFileAtPath](self, "redirectStderrToFileAtPath"));
        *(_DWORD *)buf = 136315394;
        v118 = v59;
        v119 = 2112;
        v120[0] = v60;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "Setting up stderr for %s to %@", buf, 0x16u);
      }
    }

    v61 = objc_claimAutoreleasedReturnValue(-[CPLTask redirectStderrToFileAtPath](self, "redirectStderrToFileAtPath"));
    v62 = posix_spawn_file_actions_addopen( v19,  2,  (const char *)[v61 fileSystemRepresentation],  513,  0x1B6u);

    if (v62)
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      v63 = sub_10000610C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      v64 = __error();
      v65 = strerror(*v64);
      *(_DWORD *)buf = 136315138;
      v118 = v65;
      v26 = "Unable to redirect stderr (%s).";
      goto LABEL_9;
    }
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask stdinPipe](self, "stdinPipe"));

  if (v66)
  {
    if (!_CPLSilentLogging)
    {
      v67 = sub_10000610C();
      v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        v110 = (char *)*v10;
        v111 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask stdinPipe](self, "stdinPipe"));
        v69 = (void *)objc_claimAutoreleasedReturnValue([v111 fileHandleForReading]);
        v70 = [v69 fileDescriptor];
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask stdinPipe](self, "stdinPipe"));
        v72 = (void *)objc_claimAutoreleasedReturnValue([v71 fileHandleForWriting]);
        v73 = [v72 fileDescriptor];
        *(_DWORD *)buf = 136315650;
        v118 = v110;
        v119 = 1024;
        LODWORD(v120[0]) = v70;
        WORD2(v120[0]) = 1024;
        *(_DWORD *)((char *)v120 + 6) = v73;
        _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEBUG,  "Setting up stdin for %s to %d (and closing %d)",  buf,  0x18u);
      }
    }

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask stdinPipe](self, "stdinPipe"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 fileHandleForReading]);
    v76 = posix_spawn_file_actions_adddup2(v19, (int)[v75 fileDescriptor], 0);

    if (v76)
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      v77 = sub_10000610C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
LABEL_73:
      v90 = __error();
      v91 = strerror(*v90);
      *(_DWORD *)buf = 136315138;
      v118 = v91;
      v26 = "Unable to perform spawn action (%s).";
      goto LABEL_9;
    }

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask stdinPipe](self, "stdinPipe"));
    v79 = (void *)objc_claimAutoreleasedReturnValue([v78 fileHandleForWriting]);
    v21 = posix_spawn_file_actions_addclose(v19, (int)[v79 fileDescriptor]);

    if (v21) {
      goto LABEL_13;
    }
  }

  if (-[CPLTask redirectStdoutToFileDescriptor](self, "redirectStdoutToFileDescriptor") != -1)
  {
    if (!_CPLSilentLogging)
    {
      v80 = sub_10000610C();
      v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      {
        v82 = (char *)*v10;
        v83 = -[CPLTask redirectStdoutToFileDescriptor](self, "redirectStdoutToFileDescriptor");
        *(_DWORD *)buf = 136315394;
        v118 = v82;
        v119 = 1024;
        LODWORD(v120[0]) = v83;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "Setting up stdout for %s to %d", buf, 0x12u);
      }
    }

    if (posix_spawn_file_actions_adddup2( v19,  -[CPLTask redirectStdoutToFileDescriptor](self, "redirectStdoutToFileDescriptor"),  1))
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      v84 = sub_10000610C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      goto LABEL_73;
    }
  }

  if (-[CPLTask redirectStderrToFileDescriptor](self, "redirectStderrToFileDescriptor") != -1)
  {
    if (!_CPLSilentLogging)
    {
      v85 = sub_10000610C();
      v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        v87 = (char *)*v10;
        v88 = -[CPLTask redirectStderrToFileDescriptor](self, "redirectStderrToFileDescriptor");
        *(_DWORD *)buf = 136315394;
        v118 = v87;
        v119 = 1024;
        LODWORD(v120[0]) = v88;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "Setting up stderr for %s to %d", buf, 0x12u);
      }
    }

    if (posix_spawn_file_actions_adddup2( v19,  -[CPLTask redirectStderrToFileDescriptor](self, "redirectStderrToFileDescriptor"),  2))
    {
      if (_CPLSilentLogging) {
        goto LABEL_11;
      }
      v89 = sub_10000610C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      goto LABEL_73;
    }
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask argv](self, "argv"));
  v93 = objc_claimAutoreleasedReturnValue([v92 objectAtIndex:0]);
  v94 = (const char *)[v93 fileSystemRepresentation];
  if (self->_environ) {
    environ = self->_environ;
  }
  else {
    environ = (char **)::environ;
  }
  v96 = posix_spawnp(&v116, v94, v19, 0LL, (char *const *)v10, environ);

  if (v96)
  {
    if (!_CPLSilentLogging)
    {
      v97 = sub_10000610C();
      v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        v99 = strerror(v96);
        *(_DWORD *)buf = 136315138;
        v118 = v99;
        _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_ERROR,  "Unable to spawn a new process (%s).",  buf,  0xCu);
      }
    }

    self->_waitStatus = 0;
    goto LABEL_11;
  }

  v6[2](v6, v116);
  v100 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cplctl.task", 0LL);
  waitQueue = self->_waitQueue;
  self->_waitQueue = v100;

  v102 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
  v103 = (dispatch_queue_s *)self->_waitQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000614C;
  block[3] = &unk_100030BD8;
  v115 = v116;
  block[4] = self;
  v104 = v102;
  v114 = v104;
  dispatch_async(v103, block);
  -[CPLTask _updateWaitDeadline](self, "_updateWaitDeadline");
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask _waitDeadline](self, "_waitDeadline"));
  do
  {
    v106 = -[NSConditionLock lockWhenCondition:beforeDate:](v104, "lockWhenCondition:beforeDate:", 1LL, v105);
    if ((v106 & 1) != 0)
    {
      v27 = 0LL;
      v107 = v105;
      goto LABEL_91;
    }

    v107 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask _waitDeadline](self, "_waitDeadline"));

    [v107 timeIntervalSinceNow];
    v105 = v107;
  }

  while (v108 > 0.0);
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472LL;
  v112[2] = sub_10000618C;
  v112[3] = &unk_100030BF8;
  v112[4] = v10;
  v112[5] = v19;
  v109 = objc_retainBlock(v112);
  if (self->_waitInBackgroundIfTaskTimesOut)
  {
    +[CPLTask _enqueueTaskCompletionForLaterWait:](&OBJC_CLASS___CPLTask, "_enqueueTaskCompletionForLaterWait:", self);
    dispatch_async((dispatch_queue_t)self->_waitQueue, v109);
  }

  else
  {
    kill(v116, 15);
    ((void (*)(void *))v109[2])(v109);
  }

  -[NSConditionLock lock](v104, "lock");

  v27 = 2LL;
LABEL_91:
  -[NSConditionLock unlock](v104, "unlock");
  v7[2](v7, v27);

  if (v106)
  {
    v21 = 0;
    goto LABEL_13;
  }

  v16 = objc_autoreleasePoolPush();
  v17 = [a1 newMainCommandWithToolname:v10];
  v18 = v17;
  if (v17)
  {
    v19 = [v17 parseCommandOptionsWithArgc:v7 argv:a6];
    objc_autoreleasePoolPop(v16);
    if (v19)
    {
      v20 = [v18 execute];
    }

    else
    {
      [a1 _printUsage];
      v20 = 22;
    }
  }

  else
  {
    objc_autoreleasePoolPop(v16);
    v20 = -1;
  }

LABEL_29:
  objc_autoreleasePoolPop(v12);

  return v20;
}

  if (v15)
  {
    v56[v26] = "-b";
    v27 = [v15 UTF8String];
    v28 = v26 + 1;
    v26 = (v26 + 2);
    v56[v28] = v27;
  }

  if (v9)
  {
    v56[v26] = "-n";
    v26 = (v26 + 1);
  }

  v29 = objc_alloc_init(&OBJC_CLASS___CPLDiagnoseCommand);
  v30 = objc_alloc_init(&OBJC_CLASS___CPLOutput);
  -[CPLCTLCommand beginOutputTo:](v29, "beginOutputTo:", v30);

  -[CPLDiagnoseCommand parseCommandOptionsWithArgc:argv:](v29, "parseCommandOptionsWithArgc:argv:", v26, v56);
  uint64_t v31 = (dispatch_queue_s *)self->_queue;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10001BA9C;
  v46[3] = &unk_100030B88;
  v46[4] = self;
  dispatch_barrier_sync(v31, v46);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "starting cpldiagnose",  buf,  2u);
  }

  v32 = -[CPLDiagnoseService takeUserIdlePowerAssertionWithInterval:]( self,  "takeUserIdlePowerAssertionWithInterval:",  1800.0);
  v33 = (void *)os_transaction_create("running diagnose");
  if (-[CPLDiagnoseCommand execute](v29, "execute"))
  {
    -[CPLDiagnoseService releasePowerAssertion:](self, "releasePowerAssertion:", v32);
    v54[0] = NSLocalizedDescriptionKey;
    v54[1] = NSLocalizedFailureReasonErrorKey;
    v55[0] = @"Diagnostic request failed";
    v55[1] = @"Error running Photos Diagnostic.";
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  2LL));
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v39,  105LL,  v34));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001D0AC();
    }
    v36 = (dispatch_queue_s *)self->_queue;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10001BAA4;
    v43[3] = &unk_100031540;
    v43[4] = self;
    v44 = v35;
    v37 = v35;
    dispatch_barrier_sync(v36, v43);
  }

  else
  {
    if (v33) {

    }
    -[CPLDiagnoseService releasePowerAssertion:](self, "releasePowerAssertion:", v32);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "finished cpldiagnose",  buf,  2u);
    }

    v38 = (dispatch_queue_s *)self->_queue;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10001BADC;
    v42[3] = &unk_100030B88;
    v42[4] = self;
    dispatch_barrier_sync(v38, v42);
  }

LABEL_26:
  _Block_object_dispose(&v50, 8);
}

LABEL_22:
  if (-[CPLTask cleanupEmptyFiles](self, "cleanupEmptyFiles"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask redirectStderrToFileAtPath](self, "redirectStderrToFileAtPath"));
    v36 = [v35 length];

    if (v36)
    {
      v37 = objc_claimAutoreleasedReturnValue(-[CPLTask redirectStderrToFileAtPath](self, "redirectStderrToFileAtPath"));
      v38 = (char *)[v37 fileSystemRepresentation];
      sub_10000628C((int)v38, v38);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CPLTask redirectStdoutToFileAtPath](self, "redirectStdoutToFileAtPath"));
    v40 = [v39 length];

    if (v40)
    {
      v41 = objc_claimAutoreleasedReturnValue(-[CPLTask redirectStdoutToFileAtPath](self, "redirectStdoutToFileAtPath"));
      v42 = (char *)[v41 fileSystemRepresentation];
      sub_10000628C((int)v42, v42);
    }
  }

  return v27;
}

id sub_10000610C()
{
  if (qword_10003D360 != -1) {
    dispatch_once(&qword_10003D360, &stru_100030CB8);
  }
  return (id)qword_10003D368;
}

id sub_10000614C(uint64_t a1)
{
  return [*(id *)(a1 + 40) unlockWithCondition:1];
}

void sub_10000618C(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 32);
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = 1LL;
    do
    {
      free(v3);
      uint64_t v2 = *(void ***)(a1 + 32);
      uint64_t v3 = v2[v4++];
    }

    while (v3);
  }

  free(v2);
  if (posix_spawn_file_actions_destroy(*(posix_spawn_file_actions_t **)(a1 + 40))) {
    BOOL v5 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v6 = sub_10000610C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = __error();
      int64_t v9 = strerror(*v8);
      int v10 = 136315138;
      uint64_t v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Unable to detroy the file actions properly (%s).",  (uint8_t *)&v10,  0xCu);
    }
  }

  free(*(void **)(a1 + 40));
}

void sub_10000628C(int a1, char *a2)
{
  if (a2 && !stat(a2, &v3) && !v3.st_size) {
    unlink(a2);
  }
}

void sub_1000063C0(_Unwind_Exception *a1)
{
}

void sub_1000063E4(void *a1, int a2)
{
  *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = signal(2, (void (__cdecl *)(int))1);
  if (*(void *)(*(void *)(a1[5] + 8LL) + 24LL) == -1LL)
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_10000610C();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unable to retreive handler for SIGINT.",  buf,  2u);
      }
    }
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0LL, v5);
    uint64_t v7 = *(void *)(a1[6] + 8LL);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    int64_t v9 = *(dispatch_source_s **)(*(void *)(a1[6] + 8LL) + 40LL);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100006538;
    v12[3] = &unk_100030C20;
    int v13 = a2;
    v12[4] = a1[4];
    dispatch_source_set_event_handler(v9, v12);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1[6] + 8LL) + 40LL));
  }
}

void sub_100006538(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redirectStderrToFileAtPath]);
  if ([v2 length])
  {
  }

  else
  {
    unsigned int v3 = [*(id *)(a1 + 32) redirectStderrToFileDescriptor];

    if (v3 == -1) {
      return;
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redirectStderrToFileAtPath]);

  BOOL v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    if ([v5 redirectStderrToFileDescriptor] == 1
      && (int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redirectStdoutToFileAtPath]),
          v9,
          v9))
    {
      dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) redirectStdoutToFileAtPath]);
      if (v6) {
        goto LABEL_6;
      }
    }

    else
    {
      dispatch_source_t v6 = 0LL;
    }

LABEL_14:
    return;
  }

  dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 redirectStderrToFileAtPath]);
  if (!v6) {
    goto LABEL_14;
  }
LABEL_6:
  id v10 = v6;
  uint64_t v7 = fopen((const char *)[v10 UTF8String], "a+");
  if (v7)
  {
    uint64_t v8 = v7;
    fwrite("\n\n === Aborted by user", 0x16uLL, 1uLL, v7);
    fclose(v8);
  }
}

    unsigned int v3 = v15;
  }

  else
  {
    dispatch_source_t v6 = 0LL;
  }

  return v5;
}

void sub_100006688(uint64_t a1)
{
  uint64_t v1 = *(void (__cdecl **)(int))(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v1 != (void (__cdecl *)(int))-1LL)
  {
    signal(2, v1);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000672C;
    block[3] = &unk_100030C70;
    block[4] = *(void *)(a1 + 40);
    dispatch_sync(v4, block);
  }

void sub_10000672C(uint64_t a1)
{
}

void sub_1000068A8(id a1)
{
  uint64_t v1 = (const char *)_CPLOSLogSubsystem(a1);
  os_log_t v2 = os_log_create(v1, "cplctl.task");
  unsigned int v3 = (void *)qword_10003D368;
  qword_10003D368 = (uint64_t)v2;
}

void sub_100008760(id a1)
{
  putenv("LESS=EFKRSX");
  putenv("LESSCHARSET=utf-8");
}

id sub_100008784(uint64_t a1)
{
  return [*(id *)(a1 + 32) _taskHasFinished];
}

void sub_100008EE4(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 asPlist]);
  [v3 addObject:v4];
}

LABEL_9:
  return v10;
}

LABEL_24:
        int64_t v9 = 0LL;
LABEL_27:

        goto LABEL_28;
      }
    }

    int64_t v9 = 0LL;
LABEL_28:

    goto LABEL_29;
  }

  int64_t v9 = 0LL;
LABEL_31:

  return v9;
}

LABEL_20:
  return v12;
}

void sub_10000ACD4(_Unwind_Exception *a1)
{
}

uint64_t sub_10000ACF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000AD08(uint64_t a1)
{
}

void sub_10000AD10(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000AD64(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  unsigned int v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  double v5 = -v4;
  if (v2)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) localizedDescription]);
    [v3 printFormat:@"[force closing library manager after it took %.1f seconds to finally open and it failed miserably with error: %@]", *(void *)&v5, v9];
  }

  else
  {
    objc_msgSend( v3,  "printFormat:",  @"[force closing library manager after it took %.1f seconds to finally open]",  -v4);
    dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v7 = *(void **)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000AE7C;
    v10[3] = &unk_100030D60;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v6;
    id v8 = v6;
    [v7 closeWithCompletionHandler:v10];
  }

void sub_10000AE7C(uint64_t a1, void *a2)
{
  id v7 = a2;
  unsigned int v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  double v5 = -v4;
  if (v7)
  {
    dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
    [v3 printFormat:@"[force closing of library manager took %.2f seconds and it failed miserably with error: %@]", *(void *)&v5, v6];
  }

  else
  {
    [v3 printFormat:@"[force closing of library manager took %.2f seconds]", -v4];
  }
}

id sub_10000AF08()
{
  if (qword_10003D3B8 != -1) {
    dispatch_once(&qword_10003D3B8, &stru_100031020);
  }
  return (id)qword_10003D3C0;
}

void sub_10000B3DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && !_CPLSilentLogging)
  {
    id v4 = sub_10000AF08();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Error closing daemon's library manager: %@",  (uint8_t *)&v6,  0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000BB60(_Unwind_Exception *a1)
{
}

void sub_10000BBB4(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 0;
    v4[2]();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  }
}

id sub_10000BC1C(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    sub_10001CDEC();
  }
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
    sub_10001CDC4();
  }
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000BCF0;
  v10[3] = &unk_100030E00;
  double v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 proxyWithErrorHandler:v10]);

  return v8;
}

void sub_10000BCF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000BD78;
  v8[3] = &unk_100030BB0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_10000BD78(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v2 localizedDescription]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:description:",  150LL,  v2,  @"call to daemon proxy failed: %@",  v6));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000BDF4(uint64_t a1)
{
  uint64_t v1 = *(dispatch_semaphore_s **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (!v1) {
    sub_10001CE14();
  }
  dispatch_time_t v3 = dispatch_time(0LL, 40000000000LL);
  if (dispatch_semaphore_wait(v1, v3))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000BEBC;
    v9[3] = &unk_100030E50;
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    id v10 = v5;
    uint64_t v11 = v6;
    dispatch_sync(v4, v9);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0LL;
}

uint64_t sub_10000BEBC(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000BF18;
  v3[3] = &unk_100030C70;
  uint64_t v1 = *(void *)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return (*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void sub_10000BF18(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  83LL,  @"too too long"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000BF60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000C010;
  v11[3] = &unk_100030EA0;
  __int128 v14 = *(_OWORD *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v8 = *(void (**)(uint64_t, void *))(v7 + 16);
  id v9 = v6;
  id v10 = v5;
  v8(v7, v11);
}

void sub_10000C010(uint64_t a1)
{
}

void sub_10000C384( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void sub_10000C3BC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

uint64_t sub_10000C460(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000C474(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000C480(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  83LL,  @"Getting library identifiers did not complete in time"));
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0LL, v2);
}

id sub_10000CB64(uint64_t a1, void *a2)
{
  return [a2 setPrintHeader:*(char *)(a1 + 32)];
}

void sub_10000CD18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(dispatch_source_s **)(v2 + 16);
  if (v3)
  {
    if (v4) {
      sub_10001CEDC();
    }
    if (*(void *)(v2 + 8)) {
      sub_10001CEB4();
    }
    *(void *)(*(void *)(a1 + 32) + 8LL) = signal(2, (void (__cdecl *)(int))1);
    dispatch_source_t v5 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  2uLL,  0LL,  *(dispatch_queue_t *)(*(void *)(a1 + 32) + 24LL));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000CE58;
    handler[3] = &unk_100030FB0;
    handler[4] = *(void *)(a1 + 32);
    id v6 = v5;
    id v13 = v6;
    id v14 = *(id *)(a1 + 40);
    dispatch_source_set_event_handler(v6, handler);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;
    id v9 = v6;

    dispatch_resume(v9);
  }

  else
  {
    if (!v4) {
      sub_10001CE8C();
    }
    dispatch_source_cancel(v4);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = 0LL;

    signal(2, *(void (__cdecl **)(int))(*(void *)(a1 + 32) + 8LL));
    *(void *)(*(void *)(a1 + 32) + 8LL) = 0LL;
  }

void *sub_10000CE58(void *result)
{
  if (*(void *)(result[4] + 16LL) == result[5]) {
    return (void *)(*(uint64_t (**)(void))(result[6] + 16LL))();
  }
  return result;
}

void sub_10000CF20(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32LL)) {
    sub_10001CF04();
  }
  id v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

void sub_10000CFEC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 32);
  if (!v2) {
    sub_10001CF2C();
  }
  *(void *)(v1 + 32) = 0LL;
}

uint64_t sub_10000D068(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000D4E0(id a1)
{
  uint64_t v1 = (const char *)_CPLOSLogSubsystem(a1);
  os_log_t v2 = os_log_create(v1, "cplctl");
  uint64_t v3 = (void *)qword_10003D3C0;
  qword_10003D3C0 = (uint64_t)v2;
}

void sub_10000D50C( void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
}

uint64_t sub_10000D520()
{
  return objc_opt_class(v0);
}

BOOL sub_10000D528(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

LABEL_65:
            v21 = v22;
            goto LABEL_66;
          }

          v30 = self;
          uint64_t v31 = @"-l used twice";
LABEL_29:
          -[CPLCTLCommand printFormat:](v30, "printFormat:", v31);
          v21 = 0LL;
          break;
        case 'm':
          v23 = 480LL;
          goto LABEL_41;
        case 'n':
          v23 = 154LL;
          goto LABEL_41;
        case 'o':
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          v40 = [v39 stringWithFileSystemRepresentation:optarg length:strlen(optarg)];
          v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

          if ([v41 length])
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue([v41 lastPathComponent]);
            v85 = v42;
            if (self->_noAutoSuffix)
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue([v42 stringByDeletingPathExtension]);
              v44 = objc_claimAutoreleasedReturnValue([v86 stringByAppendingString:v43]);
            }

            else
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue([v42 stringByDeletingPathExtension]);
              v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@-T%@",  v86,  v62,  self->_timestamp));

              v44 = objc_claimAutoreleasedReturnValue([v43 stringByAppendingPathExtension:@"cpldiagnostics"]);
            }

            v63 = (void *)v44;

            v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/tmp",  1LL));
            v65 = (NSURL *)objc_claimAutoreleasedReturnValue([v64 URLByAppendingPathComponent:v63 isDirectory:1]);
            outputFolder = self->_outputFolder;
            self->_outputFolder = v65;

            v67 = (NSURL *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v41,  0LL));
            outputFile = self->_outputFile;
            self->_outputFile = v67;

            id v13 = &CFDictionaryGetTypeID_ptr;
          }

          else
          {
            v22 = 0LL;
          }

          v21 = v22;
          p_libraryPath = &self->_libraryPath;
          break;
        case 'p':
          goto LABEL_38;
        case 'r':
          v45 = objc_alloc((Class)v13[66]);
          v46 = [v45 initWithUTF8String:optarg];
          if (v46)
          {
            v47 = v46;
            v48 = objc_alloc(&OBJC_CLASS___NSRegularExpression);
            v89 = 0LL;
            v49 = -[NSRegularExpression initWithPattern:options:error:]( v48,  "initWithPattern:options:error:",  v47,  0LL,  &v89);
            v50 = v89;
            v51 = v50;
            if (v49)
            {
              libraryFilterRegExp = self->_libraryFilterRegExp;
              self->_libraryFilterRegExp = v49;

              p_libraryPath = &self->_libraryPath;
              id v13 = &CFDictionaryGetTypeID_ptr;
LABEL_38:
              v23 = 152LL;
LABEL_41:
              *((_BYTE *)&self->super.super.isa + v23) = 1;
LABEL_42:
              v21 = v22;
            }

            else
            {
              v69 = (void *)objc_claimAutoreleasedReturnValue([v50 localizedDescription]);
              -[CPLCTLCommand printFormat:](self, "printFormat:", @"Invalid pattern: %@", v69);

              v21 = 0LL;
              p_libraryPath = &self->_libraryPath;
              id v13 = &CFDictionaryGetTypeID_ptr;
            }
          }

          else
          {
            -[CPLCTLCommand printFormat:](self, "printFormat:", @"Invalid pattern");
            v21 = 0LL;
LABEL_66:
            id v13 = &CFDictionaryGetTypeID_ptr;
          }

          break;
        case 's':
          v23 = 474LL;
          goto LABEL_41;
        case 't':
          v23 = 448LL;
          goto LABEL_41;
        default:
          break;
      }

      v20 = getopt(a3, a4, "o:l:tdDa:f:LcsSOmPir:nb:") << 24;
    }

    while (v20 != -16777216);
    v16 = v87;
    if ((v21 & 1) == 0) {
      goto LABEL_83;
    }
  }

  if (*p_libraryPath)
  {
    if (!self->_pickInteractively && !self->_libraryFilterRegExp) {
      goto LABEL_80;
    }
  }

  else if (!self->_pickInteractively || !self->_libraryFilterRegExp)
  {
    LODWORD(v71) = 1;
    goto LABEL_77;
  }

  -[CPLCTLCommand printFormat:](self, "printFormat:", @"-l, -i and -r are mutually exclusive");
  v71 = *p_libraryPath;
  if (*p_libraryPath)
  {
LABEL_83:
    v77 = [(id)objc_opt_class(self) toolName];
    v76 = (id)objc_claimAutoreleasedReturnValue(v77);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Invalid parameters for %@", v76);
    v78 = 0;
    goto LABEL_84;
  }

LABEL_77:
  if (self->_noAutoIncludeSPLAndSyndication)
  {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"-l or -b are required if -n is specified");
    goto LABEL_83;
  }

  if (!(_DWORD)v71) {
    goto LABEL_83;
  }
LABEL_80:
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v73 = (void *)objc_claimAutoreleasedReturnValue( [v72 attributesOfItemAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/photos" error:0]);

  if (v73
    && (v74 = (void *)objc_claimAutoreleasedReturnValue([v73 fileOwnerAccountID]),
        v75 = [v74 intValue],
        v74,
        !v75))
  {
    v80 = v15;
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v91 = NSFileOwnerAccountName;
    v92 = @"mobile";
    v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
    v88 = 0LL;
    v83 = [v81 setAttributes:v82 ofItemAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/photos" error:&v88];
    v76 = v88;

    if ((v83 & 1) == 0)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue([v76 localizedDescription]);
      -[CPLCTLCommand printFormat:](self, "printFormat:", @"Failed to repair output folder ownership: %@", v84);
    }

    v15 = v80;
  }

  else
  {
    v76 = 0LL;
  }

  v78 = 1;
LABEL_84:

  return v78;
}

LABEL_12:
      uint64_t v7 = v18;
    }

    else
    {
      id v12 = @"/var/mobile/Media";
    }
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Failed to get the list of active libraries: %@", v8);
    id v12 = 0LL;
  }

  return v12;
}

void sub_1000110D0(id a1)
{
  byte_10003D3C8 = os_variant_has_internal_diagnostics("com.apple.Photos");
}

void sub_100012400(id a1)
{
  v30[0] = @"cloudd";
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification signalProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "signalProcessSpecification"));
  v31[0] = v29;
  v30[1] = @"cloudphotod";
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v28 addDefaultsDomain:@"com.apple.cloudphotod"]);
  v31[1] = v27;
  v30[2] = @"nsurlsessiond";
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[2] = v26;
  v30[3] = @"dasd";
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[3] = v25;
  v30[4] = @"deleted";
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[4] = v24;
  v30[5] = @"accountsd";
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[5] = v23;
  v30[6] = @"mediaanalysisd";
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v22 addDefaultsDomain:@"com.apple.mediaanalysisd"]);
  v31[6] = v21;
  v30[7] = @"photoanalysisd";
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification signalProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "signalProcessSpecification"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v20 addDefaultsDomain:@"com.apple.photoanalysisd"]);
  v31[7] = v19;
  v30[8] = @"coreduetd";
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification priviledgedProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "priviledgedProcessSpecification"));
  v31[8] = v18;
  v30[9] = @"deleted_helper";
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification priviledgedProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "priviledgedProcessSpecification"));
  v31[9] = v17;
  v30[10] = @"fseventsd";
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification priviledgedProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "priviledgedProcessSpecification"));
  v31[10] = v16;
  v30[11] = @"mstreamd";
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[11] = v15;
  v30[12] = @"com.apple.photos.VideoConversionService";
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[12] = v14;
  v30[13] = @"com.apple.photos.ImageConversionService";
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[13] = v13;
  v30[14] = @"assetsd";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification signalProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "signalProcessSpecification"));
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 addDefaultsDomain:@"com.apple.assetsd"]);
  v31[14] = v2;
  v30[15] = @"Photos";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 addDefaultsDomain:@"com.apple.mobileslideshow"]);
  v31[15] = v4;
  v30[16] = @"Camera";
  dispatch_source_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 addDefaultsDomain:@"com.apple.camera"]);
  v31[16] = v6;
  v30[17] = @"nebulad";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[17] = v7;
  v30[18] = @"mediaserverd";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[18] = v8;
  v30[19] = @"deferredmediad";
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[19] = v9;
  v30[20] = @"cameracaptured";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProcessSpecification baseProcessSpecification]( &OBJC_CLASS___CPLProcessSpecification,  "baseProcessSpecification"));
  v31[20] = v10;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  21LL));
  id v12 = (void *)qword_10003D3D8;
  qword_10003D3D8 = v11;
}

void sub_100012C88(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([@"~/Library/Logs/photoslibraryupgrade.log" stringByExpandingTildeInPath]);
  v47[0] = v36;
  v48[0] = @"Logs-mbfloagent";
  v34 = (void *)objc_claimAutoreleasedReturnValue([@"~/Library/Logs/PhotosUpgrade.log" stringByExpandingTildeInPath]);
  v47[1] = v34;
  v48[1] = @"Logs-Migration";
  v32 = (void *)objc_claimAutoreleasedReturnValue([@"~/Library/Logs/PhotosUpgrade.aapbz" stringByExpandingTildeInPath]);
  v47[2] = v32;
  v48[2] = @"Logs-Migration";
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([@"~/Library/Logs/PhotosUpgrade.aapbz.old" stringByExpandingTildeInPath]);
  v47[3] = v2;
  v48[3] = @"Logs-Migration";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([@"~/Library/Logs/PhotosLegacyUpgrade.aapbz" stringByExpandingTildeInPath]);
  v47[4] = v3;
  v48[4] = @"Logs-MigrationService";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([@"~/Library/Logs/PhotosLegacyUpgrade.aapbz.old" stringByExpandingTildeInPath]);
  v47[5] = v4;
  v48[5] = @"Logs-MigrationService";
  dispatch_source_t v5 = (void *)objc_claimAutoreleasedReturnValue([@"~/Library/Logs/PhotosUpgradeCompanion.log" stringByExpandingTildeInPath]);
  v47[6] = v5;
  v48[6] = @"Logs-MigrationService";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"~/Library/Logs/PhotosLegacyUpgradeCompanion.aapbz" stringByExpandingTildeInPath]);
  v47[7] = v6;
  v48[7] = @"Logs-MigrationService";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [@"~/Library/Logs/PhotosLegacyUpgradeCompanion.aapbz.old" stringByExpandingTildeInPath]);
  v47[8] = v7;
  v48[8] = @"Logs-MigrationService";
  id v8 = (void *)objc_claimAutoreleasedReturnValue([@"~/Library/Logs/PhotosSearch.aapbz" stringByExpandingTildeInPath]);
  v47[9] = v8;
  v48[9] = @"Logs-Search";
  id v9 = (void *)objc_claimAutoreleasedReturnValue([@"~/Library/Logs/PhotosSearch.aapbz.old" stringByExpandingTildeInPath]);
  v47[10] = v9;
  v48[10] = @"Logs-Search";
  uint64_t v10 = (void *)v1;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  11LL));

  uint64_t v12 = a1;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v43;
    uint64_t v33 = v10;
    id v35 = v13;
    do
    {
      v17 = 0LL;
      id v37 = v15;
      do
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v18]);
        char v41 = 1;
        else {
          BOOL v20 = 0;
        }
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v12 + 32) + 168) URLByAppendingPathComponent:v19]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v21 URLByAppendingPathComponent:v22]);

          id v40 = 0LL;
          LODWORD(v22) = [v10 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:&v40];
          id v24 = v40;
          if ((_DWORD)v22)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v18));
            id v39 = v24;
            unsigned __int8 v26 = [v10 copyItemAtURL:v25 toURL:v23 error:&v39];
            id v27 = v39;

            if ((v26 & 1) == 0)
            {
              v28 = *(void **)(a1 + 32);
              v29 = (void *)objc_claimAutoreleasedReturnValue([v28 _simplifiedPathForURL:v25]);
              v30 = (void *)objc_claimAutoreleasedReturnValue([v27 localizedDescription]);
              [v28 printFormat:@"Failed to copy %@: %@", v29, v30];

              goto LABEL_15;
            }
          }

          else
          {
            uint64_t v31 = *(void **)(v12 + 32);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v31 _simplifiedPathForURL:v21]);
            v29 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedDescription]);
            [v31 printFormat:@"Can't create %@: %@", v25, v29];
            id v27 = v24;
LABEL_15:

            uint64_t v10 = v33;
          }

          id v13 = v35;

          id v15 = v37;
          uint64_t v12 = a1;
        }

        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }

    while (v15);
  }
}

void sub_100013264(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  uint64_t v4 = *a3;
  if (sqlite3_value_type(*a3) != 4)
  {
    sqlite3_result_value(a1, v4);
    return;
  }

  dispatch_source_t v5 = sqlite3_value_blob(v4);
  id v13 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v5,  sqlite3_value_bytes(v4),  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:"));
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0) {
    goto LABEL_11;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"p"]);
  if (!v8 || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {
LABEL_10:

LABEL_11:
    sqlite3_result_value(a1, v4);
    goto LABEL_12;
  }

  [v8 removeObjectForKey:@"rD"];
  uint64_t v10 = malloc(-[NSData length](v13, "length"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSOutputStream outputStreamToBuffer:capacity:]( &OBJC_CLASS___NSOutputStream,  "outputStreamToBuffer:capacity:",  v10,  -[NSData length](v13, "length")));
  [v11 open];
  uint64_t v12 = +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "writePropertyList:toStream:format:options:error:",  v6,  v11,  200LL,  0LL,  0LL);
  [v11 close];
  if (v12 < 1)
  {
    free(v10);

    goto LABEL_10;
  }

  sqlite3_result_blob(a1, v10, v12, (void (__cdecl *)(void *))&_free);

LABEL_12:
}

void sub_100013530(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  uint64_t v4 = *a3;
  if (sqlite3_value_type(*a3) != 4)
  {
    sqlite3_result_value(a1, v4);
    return;
  }

  dispatch_source_t v5 = objc_autoreleasePoolPush();
  id v6 = sqlite3_value_blob(v4);
  uint64_t v7 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v6,  sqlite3_value_bytes(v4),  0LL);
  id v8 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v7,  objc_opt_class(&OBJC_CLASS___CPLLibraryInfo));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 momentShare]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 shareURL]);
  id v13 = v12;
  if (v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cpl_redactedShareURL"));

    [v11 setShareURL:v14];
  }

  else
  {
    id v14 = 0LL;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 previewData]);
  if (v15)
  {
    [v11 setPreviewData:0];
  }

  else if (!v13)
  {
    goto LABEL_11;
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  v10));

  uint64_t v7 = (NSData *)v16;
LABEL_11:
  if (!v7)
  {

LABEL_14:
    sqlite3_result_value(a1, v4);
    goto LABEL_15;
  }

  id v17 = -[NSData length](v7, "length");
  v18 = malloc((size_t)v17);
  -[NSData getBytes:range:](v7, "getBytes:range:", v18, 0LL, v17);
  sqlite3_result_blob(a1, v18, (int)v17, (void (__cdecl *)(void *))&_free);

LABEL_15:
  objc_autoreleasePoolPop(v5);
}

void sub_100013800(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  uint64_t v4 = *a3;
  if (sqlite3_value_type(*a3) == 3
    && (dispatch_source_t v5 = sqlite3_value_text(v4),
        (id v6 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v5,  strlen((const char *)v5),  4LL,  0LL)) != 0LL))
  {
    uint64_t v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString cpl_redactedShareURL](v6, "cpl_redactedShareURL"));

    id v9 = v8;
    sqlite3_result_text( a1,  (const char *)[v9 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    sqlite3_result_value(a1, v4);
  }

void sub_1000148C4(uint64_t a1, uint64_t a2)
{
  os_log_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stringByAppendingPathComponent:a2]);
  [v2 addObject:v3];
}

void sub_1000155A8(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v7[0] = v3[62];
  v7[1] = @"library";
  v7[2] = @"-l";
  v7[3] = v2;
  v7[4] = @"summary";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 5LL));
  dispatch_source_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Getting %@ summary",  *(void *)(a1 + 48)));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) stringByAppendingPathComponent:@"library_summary.log"]);
  [v3 collectOutputOfCommandAndArguments:v4 label:v5 filename:v6 outputIsStderr:0 timeout:1];
}

void sub_100015F3C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v17 = 1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingPathComponent:a2]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v17];
  int v6 = v17;

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contentsOfDirectoryAtPath:v3 error:0]);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100016050;
    v13[3] = &unk_1000310D8;
    id v10 = v3;
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(a1 + 48);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v12;
    [v9 enumerateObjectsUsingBlock:v13];
  }
}

void sub_100016050(uint64_t a1, uint64_t a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingPathComponent:a2]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  [*(id *)(a1 + 40) collectFileAtURL:v3 suffix:0 destinationDirectory:*(void *)(a1 + 48)];
}

void sub_1000161CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
}

void sub_100016348(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v5 shouldSample])
  {
    unsigned int v6 = [v5 requiresRoot];
    BOOL v7 = *(_BYTE **)(a1 + 32);
    if (!v6 || v7[447])
    {
      [v7 sampleProcess:v8];
    }
  }
}

void sub_100016460(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 defaultsDomain]);
  if (v5)
  {
    unsigned int v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"/usr/bin/defaults read /var/mobile/Library/Preferences/%@.plist",  v5);
    BOOL v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Getting defaults for %@",  v11);
    id v8 = objc_alloc(&OBJC_CLASS___NSString);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) processDetailPath:v11]);
    id v10 = -[NSString initWithFormat:](v8, "initWithFormat:", @"%@-defaults.txt", v9);

    [*(id *)(a1 + 32) collectOutputOfCommand:v6 label:v7 filename:v10];
  }
}

void sub_100016ECC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

uint64_t sub_100016F14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100016F24(uint64_t a1)
{
}

void sub_100016F2C(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 0;
    v4[2]();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  }
}

id sub_100016F94(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)) {
    sub_10001D044();
  }
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
    sub_10001D01C();
  }
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  id v5 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100017074;
  v9[3] = &unk_100031150;
  id v6 = *(id *)(a1 + 48);
  void v9[4] = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 72);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 proxyWithErrorHandler:v9]);

  return v7;
}

void sub_100017074(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100017104;
  v7[3] = &unk_100031128;
  uint64_t v4 = a1[5];
  v7[4] = a1[4];
  id v8 = v3;
  uint64_t v9 = a1[6];
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v7);
}

void sub_100017104(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localizedDescription]);
  [v2 printFormat:@"  call to daemon proxy failed: %@", v3];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
}

void sub_100017164(uint64_t a1)
{
  uint64_t v1 = *(dispatch_semaphore_s **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (!v1) {
    sub_10001D06C();
  }
  dispatch_time_t v3 = dispatch_time(0LL, 40000000000LL);
  if (dispatch_semaphore_wait(v1, v3))
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100017230;
    v8[3] = &unk_100030FD8;
    id v5 = *(id *)(a1 + 48);
    void v8[4] = *(void *)(a1 + 40);
    id v9 = v5;
    dispatch_sync(v4, v8);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0LL;
}

uint64_t sub_100017230(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001728C;
  v3[3] = &unk_100030B88;
  uint64_t v1 = *(void *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

id sub_10001728C(uint64_t a1)
{
  return [*(id *)(a1 + 32) printFormat:@"  took too long"];
}

void sub_10001729C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100017348;
  v12[3] = &unk_1000310B0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v6;
  id v9 = *(void (**)(uint64_t, void *))(v8 + 16);
  id v10 = v6;
  id v11 = v5;
  v9(v8, v12);
}

void sub_100017348(id *a1)
{
  id v2 = a1[5];
  if (a1[4])
  {
    [a1[5] printFormat:&stru_1000319D0];
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1[4] componentsSeparatedByString:@"\n"]);
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [a1[5] printFormat:@"  %@", *(void *)(*((void *)&v9 + 1) + 8 * (void)v7)];
          uint64_t v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v5);
    }

    [a1[5] printFormat:&stru_1000319D0];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([a1[6] localizedDescription]);
    [v2 printFormat:@"  failed: %@", v8];
  }

void sub_1000174DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100017588;
  v12[3] = &unk_1000310B0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v6;
  __int128 v9 = *(void (**)(uint64_t, void *))(v8 + 16);
  id v10 = v6;
  id v11 = v5;
  v9(v8, v12);
}

void sub_100017588(id *a1)
{
  id v2 = a1[4];
  if (v2)
  {
    if ([v2 count])
    {
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      id v3 = a1[4];
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v11;
        do
        {
          uint64_t v7 = 0LL;
          do
          {
            if (*(void *)v11 != v6) {
              objc_enumerationMutation(v3);
            }
            [a1[5] printFormat:@"  * %@", *(void *)(*((void *)&v10 + 1) + 8 * (void)v7)];
            uint64_t v7 = (char *)v7 + 1;
          }

          while (v5 != v7);
          id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }

        while (v5);
      }
    }

    else
    {
      [a1[5] printFormat:@"    no library managers are connected"];
    }
  }

  else
  {
    id v8 = a1[5];
    id v9 = (id)objc_claimAutoreleasedReturnValue([a1[6] localizedDescription]);
    [v8 printFormat:@"    failed: %@", v9];
  }

void sub_100017A44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100017A6C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    id v8 = v5;
  }

  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v8 = v11;
  }

  id v9 = v8;
  __int128 v10 = *v7;
  void *v7 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000183F4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if ([a3 shouldRunTaskInfo])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/usr/bin/taskinfo --threads %@",  v9));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Gathering taskinfo on %@",  v9));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) processDetailPath:v9]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-taskinfo.txt",  v7));

    [*(id *)(a1 + 32) collectOutputOfCommand:v5 label:v6 filename:v8];
  }
}

void sub_1000185F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 defaultsDomain]);

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 defaultsDomain]);
    [v5 writePreferenceInDomain:v6 withKey:0 toDirectory:*(void *)(a1 + 40) currentUser:1];
  }
}

void sub_1000187DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v19 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withMetrics:withError:",  v2,  0LL,  &v19));
  id v4 = v19;
  id v5 = v4;
  if (v3)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v7 = v6;
    double v8 = *(double *)(a1 + 48);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 40) + 168) URLByAppendingPathComponent:@"sysdiagnose"]);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v18 = v5;
    unsigned __int8 v12 = [v11 moveItemAtPath:v3 toPath:v10 error:&v18];
    id v13 = v18;

    if ((v12 & 1) != 0)
    {
      [*(id *)(a1 + 40) printFormat:@"  sysdiagnose elapsed time: %.2fs", v7 - v8];
    }

    else
    {
      uint64_t v16 = *(void **)(a1 + 40);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
      [v16 printFormat:@"  sysdiagnose error moving %@ to %@: %@", v3, v10, v17];
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(a1 + 40) + 476LL) = 1;
    uint64_t v14 = *(void **)(a1 + 40);
    if (v4)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
      [v14 printFormat:@"  sysdiagnose failed: %@", v15];
    }

    else
    {
      [v14 printFormat:@"  sysdiagnose failed: %@", @"unknown reason"];
    }
  }
}

id sub_100019060(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/ckctl dump" label:@"Dumping CloudKit state" filename:@"ckctl_dump.txt"];
}

_BYTE *sub_100019080(uint64_t a1)
{
  if ([*(id *)(a1 + 32) includeSPL]) {
    [*(id *)(a1 + 32) collectCloudPhotodStatusWithLibraryIdentifier:CPLLibraryIdentifierSystemLibrary subdirectory:0];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[16])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _readAppPrivateData]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKeyPath:@"Library.CPL.LibraryType"]);
    if ([v4 integerValue] == (id)1)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKeyPath:@"Library.Identifier.UUID"]);
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKeyPath:@"Library.Identifier.ContainerIdentifier"]);
      double v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_10;
      }

      uint64_t v8 = CPLLibraryIdentifierForApp(v6, v5);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

      if (v9)
      {
        [*(id *)(a1 + 32) collectCloudPhotodStatusWithLibraryIdentifier:v9 subdirectory:@"Library"];
        id v5 = (void *)v9;
LABEL_10:
      }
    }

    uint64_t v2 = *(void **)(a1 + 32);
  }

  [v2 collectAccountStatus];
  uint64_t result = *(_BYTE **)(a1 + 32);
  if (result[472]) {
    return [result collectDefaults];
  }
  return result;
}

id sub_1000191D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 473))
  {
    if (*(_BYTE *)(v2 + 451)) {
      goto LABEL_4;
    }
    v28[0] = *(void *)(v2 + 496);
    v28[1] = @"listcloudphotoguids";
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
    [(id)v2 collectOutputOfCommandAndArguments:v3 label:@"Getting local photo cloudGUIDs" filename:@"local_photo_cloud_guids.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    id v4 = *(void **)(a1 + 32);
    v27[0] = v4[62];
    v27[1] = @"librarysummary";
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
    [v4 collectOutputOfCommandAndArguments:v5 label:@"Getting local library summary" filename:@"local_asset_counts.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    double v6 = *(void **)(a1 + 32);
    v26[0] = v6[62];
    v26[1] = @"resource";
    v26[2] = @"status";
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
    [v6 collectOutputOfCommandAndArguments:v7 label:@"Getting resource model summary" filename:@"resource_model_status.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    uint64_t v8 = *(void **)(a1 + 32);
    v25[0] = v8[62];
    v25[1] = @"printmoments";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
    [v8 collectOutputOfCommandAndArguments:v9 label:@"Getting Moments info" filename:@"moments.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    __int128 v10 = *(void **)(a1 + 32);
    v24[0] = v10[62];
    v24[1] = @"graph";
    v24[2] = @"statistics";
    v24[3] = @"contactsuggestions";
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL));
    [v10 collectOutputOfCommandAndArguments:v11 label:@"Getting people contact suggestions diagnosis" filename:@"people_contact_suggestions_diagnosis.log" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    uint64_t v2 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v2 + 473))
    {
LABEL_4:
      v23[0] = *(void *)(v2 + 496);
      v23[1] = @"triage-log";
      v23[2] = @"json-pretty";
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));
      [(id)v2 collectOutputOfCommandAndArguments:v12 label:@"Getting triage logs" filename:@"triageLogs.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

      id v13 = *(void **)(a1 + 32);
      v22[0] = v13[62];
      v22[1] = @"printdbmetadata";
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
      [v13 collectOutputOfCommandAndArguments:v14 label:@"Getting db metadata" filename:@"dbMetadata.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

      uint64_t v15 = *(void **)(a1 + 32);
      v21[0] = v15[62];
      v21[1] = @"backgroundjob";
      v21[2] = @"status";
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
      [v15 collectOutputOfCommandAndArguments:v16 label:@"Getting backgroundjobservice status" filename:@"backgroundjobserviceStatus.txt" outputIsStderr:0 timeout:1];

      [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/backupctl restoreInfo" label:@"Getting backupd restore info" filename:0 timeout:1];
      [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/backupctl listFailures" label:@"Getting backupd failures" filename:0 timeout:1];
      [*(id *)(a1 + 32) collectLocalLibraryMetadataInfo];
      [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/ckctl -v prod -c com.apple.photos.cloud -x deviceID" label:@"Collecting deviceID" filename:@"deviceID.txt"];
      [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/accounts_tool listAccounts -v" label:@"Collecting accounts" filename:@"accounts_list.txt"];
      uint64_t v17 = *(void **)(a1 + 32);
      v20[0] = v17[62];
      v20[1] = @"sharing";
      v20[2] = @"syndicationResults";
      v20[3] = @"summary";
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 4LL));
      [v17 collectOutputOfCommandAndArguments:v18 label:@"Getting Syndication Results Summary" filename:@"syndication_results_summary.txt" outputIsStderr:0 timeout:1];

      [*(id *)(a1 + 32) collectSearchDiagnostics];
      [*(id *)(a1 + 32) collectSilentMover];
      [*(id *)(a1 + 32) collectLOFetchRecordings];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  id result = [*(id *)(v2 + 488) count];
  if (result) {
    return [*(id *)(a1 + 32) collectFeatureAreaDiagnostics];
  }
  return result;
}

void *CPLDiagnoseRecursiveFileListing(void *a1, void *a2, int a3, _BYTE *a4, int64x2_t *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  v126 = a5;
  if (!a5)
  {
    memset(v127, 0, sizeof(v127));
    v126 = (int64x2_t *)v127;
  }

  if (a4) {
    *a4 = 0;
  }
  v113 = a4;
  id v13 = v12;
  uint64_t v14 = fopen((const char *)[v13 fileSystemRepresentation], "wx");
  if (v14)
  {
    uint64_t v15 = v14;
    v114 = (char *)malloc(0x100000uLL);
    setvbuf(v15, v114, 0, 0x100000uLL);
    id v16 = v11;
    v134[0] = (char *)[v16 fileSystemRepresentation];
    v134[1] = 0LL;
    uint64_t v17 = fts_open_b(v134, 81, &stru_1000312A8);
    BOOL v115 = v17 != 0LL;
    if (v17)
    {
      id v18 = v17;
      id v111 = v13;
      id v112 = v11;
      fwrite( "mode link_count inode purgeable_flags uid gid file_size modification_date filename\n\n",  0x54uLL,  1uLL,  v15);
      id v19 = fts_read(v18);
      if (!v19) {
        goto LABEL_136;
      }
      BOOL v20 = v19;
      char v21 = 1;
      int v117 = a3;
      v116 = v18;
      while (1)
      {
        switch(v20->fts_info)
        {
          case 1u:
            fts_path = v20->fts_path;
            if (statfs(fts_path, &v137))
            {
              v23 = __stderrp;
              id v24 = __error();
              strerror(*v24);
              fprintf(v23, "error finding volume info for %s: %s\n");
            }

            else
            {
              *(_OWORD *)__str = xmmword_100023544;
              uint64_t v142 = 0LL;
              if (getattrlist(v137.f_mntonname, __str, flagset_p, 0x2CuLL, 0))
              {
                v25 = __stderrp;
                unsigned __int8 v26 = __error();
                strerror(*v26);
                fprintf(v25, "error finding volume capabilities for %s: %s\n");
              }

              else if ((v144 & 2) != 0)
              {
                uint64_t v139 = 0LL;
                *(_OWORD *)v138 = xmmword_10002355C;
                if (getattrlist(fts_path, v138, __bp, 8uLL, 0))
                {
                  v93 = __stderrp;
                  v94 = __error();
                  strerror(*v94);
                  fprintf(v93, "error finding ATTR_DIR_ENTRYCOUNT for %s: %s\n");
                }

                else if (*(_DWORD *)&__bp[4] >= 0xC351u)
                {
                  fprintf(v15, "ERROR too many entries (%ld): %s\n", *(unsigned int *)&__bp[4], v20->fts_path);
                  fts_set(v18, v20, 4);
                  goto LABEL_129;
                }
              }
            }

            id v27 = fts_children(v18, 0);
            if (!v27) {
              goto LABEL_128;
            }
            v28 = v27;
            if ((v21 & 1) == 0) {
              fputc(10, v15);
            }
            if (!v20->fts_level)
            {
              id v29 = objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString, "stringWithUTF8String:", v20->fts_path));
              id v30 = objc_claimAutoreleasedReturnValue([v29 stringByAppendingPathComponent:@".."]);
              fputc(10, v15);
            }

            fputs(v20->fts_path, v15);
            fputc(58, v15);
            fputc(10, v15);
            unsigned __int16 st_nlink = 0;
            uint64_t st_size = 0LL;
            uint64_t v33 = v28;
            int v122 = 1;
            int v123 = 1;
            int v121 = 1;
            do
            {
              int fts_info = v33->fts_info;
              if (fts_info == 10 || fts_info == 7)
              {
                v36 = strerror(v33->fts_errno);
                fprintf(v15, "ERROR %s: %s\n", v33->fts_name, v36);
              }

              else
              {
                fts_statp = v33->fts_statp;
                int v38 = snprintf(__str, 0x400uLL, "%u", fts_statp->st_uid);
                if (v38 <= v123) {
                  int v39 = v123;
                }
                else {
                  int v39 = v38;
                }
                int v123 = v39;
                int v40 = snprintf(__str, 0x400uLL, "%u", fts_statp->st_gid);
                if (v40 <= v122) {
                  int v41 = v122;
                }
                else {
                  int v41 = v40;
                }
                int v122 = v41;
                int v42 = snprintf(__str, 0x400uLL, "%llu", fts_statp->st_ino);
                if (v42 <= v121) {
                  int v43 = v121;
                }
                else {
                  int v43 = v42;
                }
                int v121 = v43;
                if (fts_statp->st_size > st_size) {
                  uint64_t st_size = fts_statp->st_size;
                }
              }

              uint64_t v33 = v33->fts_link;
            }

            while (v33);
            int v119 = snprintf(__str, 0x400uLL, "%hu", st_nlink);
            int v125 = snprintf(__str, 0x400uLL, "%lld", st_size);
            break;
          case 2u:
            fprintf(v15, "ERROR %s: directory causes a cycle\n");
            goto LABEL_129;
          case 4u:
          case 7u:
            strerror(v20->fts_errno);
            fprintf(v15, "ERROR %s: %s\n");
            goto LABEL_129;
          default:
            goto LABEL_129;
        }

        do
        {
          int v44 = v28->fts_info;
          if (v44 == 7 || v44 == 10) {
            goto LABEL_126;
          }
          v46 = (int64x2_t *)v28->fts_statp;
          __bp[11] = 0;
          strcpy(__bp, "          ");
          strmode(v46->u16[2], __bp);
          __bp[10] = 0;
          fputs(__bp, v15);
          if (v28->fts_level)
          {
            fts_name = __str;
            snprintf(__str, 0x400uLL, "%s/%s", v28->fts_parent->fts_accpath, v28->fts_name);
          }

          else
          {
            fts_name = v28->fts_name;
          }

          ssize_t v48 = listxattr(fts_name, 0LL, 0LL, 1);
          link_np = acl_get_link_np(fts_name, ACL_TYPE_EXTENDED);
          v50 = link_np;
          if (link_np && acl_get_entry(link_np, 0, &entry_p) == -1)
          {
            acl_free(v50);
            v50 = 0LL;
          }

          if (v50) {
            int v51 = 43;
          }
          else {
            int v51 = 32;
          }
          if (v48 >= 1) {
            int v52 = 64;
          }
          else {
            int v52 = v51;
          }
          fputc(v52, v15);
          v53 = localtime(v46[3].i64);
          strftime(v138, 0x28uLL, "%FT%T", v53);
          uint64_t v54 = v46[3].i64[1];
          if (v54 <= 0) {
            unint64_t v55 = v46[3].u64[1];
          }
          else {
            unint64_t v55 = v54 / 0xF4240uLL;
          }
          uint64_t v128 = 0LL;
          fsctl(fts_name, 0x40084A47uLL, &v128, 0);
          fprintf( v15,  " %*d %*llu %04llx %-*u  %-*u  %*lld %s.%03ld ",  v119,  v46->u16[3],  v121,  v46->i64[1],  v128,  v123,  v46[1].i32[0],  v122,  v46[1].i32[1],  v125,  v46[6].i64[0],  v138,  v55);
          sub_10001AE14(v28->fts_name, v15);
          int v56 = v46->i16[2] & 0xF000;
          v57 = (int64x2_t *)((char *)v126 + 40);
          if (v56 != 0x4000)
          {
            if (v56 == 40960)
            {
              if (v28->fts_level) {
                snprintf((char *)&v137, 0x401uLL, "%s/%s");
              }
              else {
                snprintf((char *)&v137, 0x401uLL, "%s");
              }
              int v58 = readlink((const char *)&v137, (char *)flagset_p, 0x400uLL);
              if (v58 == -1)
              {
                v59 = __error();
                v60 = strerror(*v59);
                fprintf(v15, "\nERROR ls: %s: %s\n", (const char *)&v137, v60);
              }

              else
              {
                *((_BYTE *)flagset_p + v5_Block_object_dispose(&STACK[0x210], 8) = 0;
                fwrite(" -> ", 4uLL, 1uLL, v15);
                sub_10001AE14((char *)flagset_p, v15);
              }

              v57 = v126 + 2;
            }

            else
            {
              v57 = (int64x2_t *)((char *)v126 + 24);
            }
          }

          ++v57->i64[0];
          fputc(10, v15);
          int64x2_t *v126 = vaddq_s64(*v126, v46[6]);
          if (!a3 || v48 < 1) {
            goto LABEL_124;
          }
          v118 = v46;
          acl = v50;
          size_t v61 = v48 & ~(v48 >> 63);
          v62 = (char *)malloc(v61);
          int v63 = 1;
          listxattr(fts_name, v62, v61, 1);
          uint64_t v64 = 0LL;
          v65 = 0LL;
          v126[1].i64[0] += v61;
          v66 = &v62[v61];
          size_t v67 = 4LL;
          __s1 = v62;
          v68 = v62;
          do
          {
            unsigned int v69 = v63;
            v65 = reallocf(v65, v67);
            int v70 = getxattr(fts_name, v68, 0LL, 0LL, 0, 1);
            if (v70 >= 1) {
              v126[1].i64[0] += v70;
            }
            *((_DWORD *)v65 + v64) = v70;
            v68 += strlen(v68) + 1;
            v67 += 4LL;
            ++v64;
            ++v63;
          }

          while (v68 < v66);
          a3 = v117;
          if ((_DWORD)v64)
          {
            uint64_t v71 = v69;
            v72 = (int *)v65;
            v73 = __s1;
            do
            {
              if (strcmp(v73, "com.apple.quarantine"))
              {
                fputc(9, v15);
                sub_10001AE14(v73, v15);
                fputc(9, v15);
                fprintf(v15, "%*jd ", v125, *v72);
                fputc(10, v15);
                v73 += strlen(v73) + 1;
              }

              ++v72;
              --v71;
            }

            while (v71);
          }

          free(__s1);
          free(v65);
          v50 = acl;
          if (acl)
          {
            __int16 v74 = v118->i16[2];
            *(void *)&v137.f_bsize = 0LL;
            if (!acl_get_entry(acl, 0, (acl_entry_t *)&v137))
            {
              int v75 = 0;
              if ((v74 & 0xF000) == 0x4000) {
                int v76 = 1;
              }
              else {
                int v76 = 2;
              }
              do
              {
                if (!acl_get_tag_type(*(acl_entry_t *)&v137.f_bsize, &tag_type_p)
                  && !acl_get_flagset_np(*(void **)&v137.f_bsize, flagset_p)
                  && !acl_get_permset(*(acl_entry_t *)&v137.f_bsize, &permset_p))
                {
                  qualifier = (unsigned __int8 *)acl_get_qualifier(*(acl_entry_t *)&v137.f_bsize);
                  if (qualifier)
                  {
                    v78 = qualifier;
                    v79 = (char *)malloc(0x105uLL);
                    if (!v79) {
                      sub_10001D094();
                    }
                    v80 = v79;
                    uuid_unparse_upper(v78, v79);
                    acl_free(v78);
                    v81 = "unknown";
                    if (tag_type_p == ACL_EXTENDED_DENY) {
                      v81 = "deny";
                    }
                    if (tag_type_p == ACL_EXTENDED_ALLOW) {
                      v82 = "allow";
                    }
                    else {
                      v82 = v81;
                    }
                    int flag_np = acl_get_flag_np(flagset_p[0], ACL_ENTRY_INHERITED);
                    v84 = " inherited";
                    if (!flag_np) {
                      v84 = "";
                    }
                    fprintf(v15, " %d: %s%s %s ", v75, v80, v84, v82);
                    free(v80);
                    uint64_t v85 = 0LL;
                    int v86 = 0;
                    do
                    {
                      v87 = (const char **)((char *)&unk_1000312C8 + v85);
                      if (acl_get_perm_np(permset_p, *(acl_perm_t *)((char *)&unk_1000312C8 + v85))
                        && ((_DWORD)v87[2] & v76) != 0)
                      {
                        v88 = ",";
                        if (!v86) {
                          v88 = "";
                        }
                        fprintf(v15, "%s%s", v88, v87[1]);
                        ++v86;
                        v50 = acl;
                      }

                      v85 += 24LL;
                    }

                    while (v85 != 408);
                    for (uint64_t i = 0LL; i != 96; i += 24LL)
                    {
                      v90 = (const char **)((char *)&unk_100031478 + i);
                      if (acl_get_flag_np(flagset_p[0], *(acl_flag_t *)((char *)&unk_100031478 + i))
                        && ((_DWORD)v90[2] & v76) != 0)
                      {
                        v91 = ",";
                        if (!v86) {
                          v91 = "";
                        }
                        fprintf(v15, "%s%s", v91, v90[1]);
                        ++v86;
                        v50 = acl;
                      }
                    }

                    fputc(10, v15);
                  }
                }

                ++v75;
                if (*(void *)&v137.f_bsize) {
                  int v92 = -1;
                }
                else {
                  int v92 = 0;
                }
              }

              while (!acl_get_entry(v50, v92, (acl_entry_t *)&v137));
            }

LABEL_124:
            if (v50) {
              acl_free(v50);
            }
          }

LABEL_126:
          v28 = v28->fts_link;
        }

        while (v28);
        char v21 = 0;
LABEL_128:
        id v18 = v116;
LABEL_129:
        BOOL v20 = fts_read(v18);
        if (!v20)
        {
LABEL_136:
          fts_close(v18);
          if (ftell(v15))
          {
            fprintf( v15,  "\nTOTALS st_size=%lld st_blocks=%lld xattr_size=%lld directories=%ld files=%ld symlinks=%ld\n",  v126->i64[0],  v126->i64[1],  v126[1].i64[0],  v126[2].i64[1],  v126[1].i64[1],  v126[2].i64[0]);
            uint64_t v95 = v126->i64[1];
            uint64_t v96 = v126->i64[0] + 0xFFFFF;
            if (v126->i64[0] >= 0) {
              uint64_t v96 = v126->i64[0];
            }
            uint64_t v97 = v96 >> 20;
            uint64_t v98 = v95 + 2047;
            if (v95 >= 0) {
              uint64_t v98 = v126->i64[1];
            }
            fprintf(v15, "       size in MiB: %lldMiB, blocks in MiB: %lldMiB\n", v97, v98 >> 11);
            fclose(v15);
            free(v114);
            id v13 = v111;
            id v11 = v112;
          }

          else
          {
            fclose(v15);
            free(v114);
            id v13 = v111;
            remove((const char *)[v111 fileSystemRepresentation]);
            id v11 = v112;
            if (v113) {
              _BYTE *v113 = 1;
            }
          }

          goto LABEL_149;
        }
      }
    }

    if (a6)
    {
      v105 = __error();
      v106 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v105));
      v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
      uint64_t v108 = *__error();
      v132[0] = NSLocalizedDescriptionKey;
      v132[1] = NSLocalizedFailureReasonErrorKey;
      v133[0] = @"Error opening path to find recursive listing.";
      v133[1] = v107;
      v132[2] = NSFilePathErrorKey;
      v133[2] = v16;
      v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v133,  v132,  3LL));
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v108,  v109));
    }

    fclose(v15);
    free(v114);
LABEL_149:
    a6 = (void *)v115;
  }

  else if (a6)
  {
    v99 = __error();
    v100 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v99));
    v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
    uint64_t v102 = *__error();
    v135[0] = NSLocalizedDescriptionKey;
    v135[1] = NSLocalizedFailureReasonErrorKey;
    v136[0] = @"Error opening recursive listing file for writing.";
    v136[1] = v101;
    v135[2] = NSFilePathErrorKey;
    v136[2] = v13;
    id v103 = v13;
    v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v136,  v135,  3LL));
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v102,  v104));

    id v13 = v103;
    a6 = 0LL;
  }

  return a6;
}

int sub_10001ACE4(id a1, const _ftsent **a2, const _ftsent **a3)
{
  return strcmp((*a2)->fts_name, (*a3)->fts_name);
}

uint64_t sub_10001ACF8(const char *a1, uint64_t a2, FILE *a3)
{
  __bp[11] = 0;
  strcpy(__bp, "          ");
  strmode(*(unsigned __int16 *)(a2 + 4), __bp);
  __bp[10] = 0;
  fprintf(a3, "stat %s: ", a1);
  fprintf( a3,  "st_dev=%d st_ino=%llu st_mode=%d (%s) st_nlink=%d st_uid=%d st_gid=%d st_rdev=%d st_size=%lld ",  *(_DWORD *)a2,  *(void *)(a2 + 8),  *(unsigned __int16 *)(a2 + 4),  __bp,  *(unsigned __int16 *)(a2 + 6),  *(_DWORD *)(a2 + 16),  *(_DWORD *)(a2 + 20),  *(_DWORD *)(a2 + 24),  *(void *)(a2 + 96));
  fprintf( a3,  "st_atime=%ld st_mtime=%ld st_ctime=%ld st_birthtime=%ld st_blksize=%d st_block=%lld st_flags=%d",  *(void *)(a2 + 32),  *(void *)(a2 + 48),  *(void *)(a2 + 64),  *(void *)(a2 + 80),  *(_DWORD *)(a2 + 112),  *(void *)(a2 + 104),  *(_DWORD *)(a2 + 116));
  return fputc(10, a3);
}

unint64_t sub_10001AE14(char *a1, FILE *a2)
{
  id v3 = a1;
  memset(&v17, 0, sizeof(v17));
  unint64_t result = mbrtowc(&v16, a1, 6uLL, &v17);
  if (result)
  {
    unint64_t v5 = result;
    int v6 = 0;
    while (v5 > 0xFFFFFFFFFFFFFFFDLL)
    {
      if (v5 == -1LL)
      {
        LODWORD(result) = 1;
LABEL_21:
        int v12 = 4 * result;
        id v13 = v3;
        uint64_t v14 = result;
        do
        {
          unsigned int v15 = *(unsigned __int8 *)v13++;
          fputc(92, a2);
          fputc((v15 >> 6) | 0x30, a2);
          fputc((v15 >> 3) & 7 | 0x30, a2);
          unint64_t result = fputc(v15 & 7 | 0x30, a2);
          --v14;
        }

        while (v14);
        v6 += v12;
        goto LABEL_24;
      }

      unint64_t result = strlen(v3);
LABEL_18:
LABEL_24:
      if (v5 == -1LL)
      {
        unint64_t v5 = 1LL;
        memset(&v17, 0, sizeof(v17));
      }

      else if (v5 == -2LL)
      {
        return result;
      }

      v3 += v5;
      unint64_t result = mbrtowc(&v16, v3, 6uLL, &v17);
      unint64_t v5 = result;
      if (!result) {
        return result;
      }
    }

    __darwin_ct_rune_t v7 = v16;
    if (v16 > 0x7F)
    {
      int v8 = __maskrune(v16, 0x40000uLL);
      __darwin_ct_rune_t v7 = v16;
      if (!v8)
      {
LABEL_17:
        unint64_t result = v5;
        goto LABEL_18;
      }
    }

    else if ((_DefaultRuneLocale.__runetype[v16] & 0x40000) == 0)
    {
      goto LABEL_17;
    }

    if (v7 != 34 && v7 != 92)
    {
      if ((int)v5 >= 1)
      {
        uint64_t v9 = v5;
        __int128 v10 = v3;
        do
        {
          int v11 = *(unsigned __int8 *)v10++;
          fputc(v11, a2);
          --v9;
        }

        while (v9);
        __darwin_ct_rune_t v7 = v16;
      }

      unint64_t result = wcwidth(v7);
      v6 += result;
      goto LABEL_24;
    }

    goto LABEL_17;
  }

  return result;
}

void sub_10001B18C(id a1)
{
  uint64_t v1 = MGCopyAnswer(@"ProductType", 0LL);
  uint64_t v2 = (void *)qword_10003D3F0;
  qword_10003D3F0 = v1;
}

void sub_10001BA1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void *sub_10001BA58(void *result)
{
  uint64_t v1 = result[4];
  if (*(_BYTE *)(v1 + 8) == 1)
  {
    *(_BYTE *)(*(void *)(result[6] + 8LL) + 24LL) = 1;
  }

  else
  {
    *(_BYTE *)(v1 + _Block_object_dispose(&STACK[0x210], 8) = 1;
    return (void *)(*(uint64_t (**)(void, uint64_t, void, void))(result[5] + 16LL))( result[5],  1LL,  *(void *)(result[4] + 16LL),  0LL);
  }

  return result;
}

id sub_10001BA9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyClientsStateChangedOnQueue];
}

id sub_10001BAA4(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = -1;
  return [*(id *)(a1 + 32) notifyClientsStateChangedOnQueue];
}

id sub_10001BADC(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 0;
  return [*(id *)(a1 + 32) notifyClientsStateChangedOnQueue];
}

uint64_t sub_10001BB68(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(char *)(*(void *)(a1 + 32) + 8LL));
}

void sub_10001BBE4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 remoteObjectProxy]);
  [v4 diagnosticServiceStateDidChange:*(char *)(*(void *)(a1 + 32) + 8) outputURL:*(void *)(*(void *)(a1 + 32) + 16) error:*(void *)(*(void *)(a1 + 32) + 24)];
}

void sub_10001BF1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

uint64_t sub_10001BF44(void *a1)
{
  return xpc_transaction_interrupt_clean_exit([*(id *)(a1[4] + 40) setObject:a1[5] forKey:a1[6]]);
}

void sub_10001BF68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained didInvalidateClientConnectionWithIdentifier:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void sub_10001C024(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "removing connection %@",  buf,  0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:*(void *)(a1 + 32)];
  if (![*(id *)(*(void *)(a1 + 40) + 40) count])
  {
    dispatch_time_t v3 = dispatch_time(0LL, 10000000000LL);
    uint64_t v4 = *(void *)(a1 + 40);
    unint64_t v5 = *(dispatch_queue_s **)(v4 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C130;
    block[3] = &unk_100030B88;
    block[4] = v4;
    dispatch_after(v3, v5, block);
  }

id sub_10001C130(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  if (!result) {
    return (id)xpc_transaction_exit_clean();
  }
  return result;
}

void sub_10001C2AC(id a1)
{
  uint64_t v1 = -[NSRegularExpression initWithPattern:options:error:]( objc_alloc(&OBJC_CLASS___NSRegularExpression),  "initWithPattern:options:error:",  @"[0-9,A-Z]{10}\\.(.*)",  0LL,  0LL);
  uint64_t v2 = (void *)qword_10003D400;
  qword_10003D400 = (uint64_t)v1;
}

int main(int argc, const char **argv, const char **envp)
{
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  uint64_t v4 = (void *)qword_10003D410;
  qword_10003D410 = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10003D410, &stru_1000315D0);
  dispatch_resume((dispatch_object_t)qword_10003D410);
  uint64_t v5 = CPLDiagnosticsService;
  +[CPLCTLCommand setToolName:](&OBJC_CLASS___CPLCTLCommand, "setToolName:", CPLDiagnosticsService);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "starting %@",  (uint8_t *)&v8,  0xCu);
  }

  int v6 = objc_alloc_init(&OBJC_CLASS___CPLDiagnoseService);
  __darwin_ct_rune_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v7 setDelegate:v6];
  [v7 resume];
  exit(1);
}

void sub_10001C5D4(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "exit on SIGTERM", v1, 2u);
  }

  exit(0);
}

void sub_10001C628( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10001C64C(uint64_t a1, uint64_t a2)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLGenericOSLogDomain();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Trying to get a proxy for %@ but the connection is closed",  buf,  0xCu);
    }
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  __darwin_ct_rune_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLDaemonProcessProtocol.m"));
  [v6 handleFailureInMethod:a2, a1, v7, 82, @"Trying to get a proxy for %@ but the connection is closed", a1 object file lineNumber description];

  abort();
}

void sub_10001C738(void *a1, uint64_t a2, uint64_t a3)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v6 = __CPLGenericOSLogDomain();
    __darwin_ct_rune_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue([a1 asPlist]);
      *(_DWORD *)buf = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to serialize %@: %@", buf, 0x16u);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLEngineParameters.m"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([a1 asPlist]);
  [v9 handleFailureInMethod:a3, a1, v10, 141, @"Failed to serialize %@: %@", v11, a2 object file lineNumber description];

  abort();
}

void sub_10001C860(uint64_t a1, uint64_t a2)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLGenericOSLogDomain();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Trying to get a proxy for %@ but the connection is closed",  buf,  0xCu);
    }
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  __darwin_ct_rune_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl-support/CPLPhotosDaemon.m"));
  [v6 handleFailureInMethod:a2, a1, v7, 79, @"Trying to get a proxy for %@ but the connection is closed", a1 object file lineNumber description];

  abort();
}

void sub_10001C94C()
{
}

void sub_10001C974()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 544, "status == 0");
}

void sub_10001C99C()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 542, "status == 0");
}

void sub_10001C9C4()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 540, "status == 0");
}

void sub_10001C9EC()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 538, "status == 0");
}

void sub_10001CA14()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 522, "pipe(pipes) == 0");
}

void sub_10001CA3C(uint64_t a1, const char *a2)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLGenericOSLogDomain();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (sub_10000D528(v5))
    {
      id v6 = (id)sub_10000D520();
      __darwin_ct_rune_t v7 = NSStringFromSelector(a2);
      char v21 = (void *)objc_claimAutoreleasedReturnValue(v7);
      sub_10000D50C((void *)&_mh_execute_header, v8, v9, "+[%@ %@] called twice", v10, v11, v12, v13, v19, v20, 2u);
    }
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"));
  uint64_t v16 = sub_10000D520();
  mbstate_t v17 = NSStringFromSelector(a2);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v14 handleFailureInMethod:a2, a1, v15, 58, @"+[%@ %@] called twice", v16, v18 object file lineNumber description];

  abort();
}

void sub_10001CB68(uint64_t a1, const char *a2)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLGenericOSLogDomain();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (sub_10000D528(v5))
    {
      id v6 = (id)sub_10000D520();
      __darwin_ct_rune_t v7 = NSStringFromSelector(a2);
      char v21 = (void *)objc_claimAutoreleasedReturnValue(v7);
      sub_10000D50C( (void *)&_mh_execute_header,  v8,  v9,  "+[%@ %@] has not been set yet",  v10,  v11,  v12,  v13,  v19,  v20,  2u);
    }
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"));
  uint64_t v16 = sub_10000D520();
  mbstate_t v17 = NSStringFromSelector(a2);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v14 handleFailureInMethod:a2, a1, v15, 63, @"+[%@ %@] has not been set yet", v16, v18 object file lineNumber description];

  abort();
}

void sub_10001CC94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v6 = __CPLGenericOSLogDomain();
    __darwin_ct_rune_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (sub_10000D528(v7))
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003D3A8 objectForKey:a1]);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = a1;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Command %@ is already registered (for %@)",  buf,  0x16u);
    }
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003D3A8 objectForKey:a1]);
  [v9 handleFailureInMethod:a2, a3, v10, 159, @"Command %@ is already registered (for %@)", a1, v11 object file lineNumber description];

  abort();
}

void sub_10001CDC4()
{
}

void sub_10001CDEC()
{
}

void sub_10001CE14()
{
}

void sub_10001CE3C()
{
}

void sub_10001CE64()
{
  __assert_rtn("-[CPLCTLCommand endOutputTo:]", "CPLCTLCommand.m", 1013, "_output == output");
}

void sub_10001CE8C()
{
}

void sub_10001CEB4()
{
}

void sub_10001CEDC()
{
}

void sub_10001CF04()
{
}

void sub_10001CF2C()
{
}

void sub_10001CF54()
{
}

void sub_10001CF7C()
{
}

void sub_10001CFA4()
{
}

void sub_10001CFCC()
{
}

void sub_10001CFF4()
{
}

void sub_10001D01C()
{
}

void sub_10001D044()
{
}

void sub_10001D06C()
{
}

void sub_10001D094()
{
}

void sub_10001D0AC()
{
}

void sub_10001D114()
{
}

void sub_10001D17C()
{
  __int16 v1 = 2114;
  uint64_t v2 = @"application-identifier";
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Invalid value of %{public}@ for entitlement %{public}@. We expect TEAMID.BUNDLEID, and insist that TEAMID is exactly 10 characters long, consisting of [0-9][A-Z].",  v0,  0x16u);
  sub_10001C638();
}

id objc_msgSend_collectOutputOfCommandAndArguments_label_filename_outputIsStderr_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectOutputOfCommandAndArguments:label:filename:outputIsStderr:timeout:");
}

id objc_msgSend_initWithClientLibraryBaseURL_cloudLibraryStateStorageURL_cloudLibraryResourceStorageURL_libraryIdentifier_mainScopeIdentifier_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mai nScopeIdentifier:options:");
}

id objc_msgSend_initWithName_mainScopeIdentifier_libraryIdentifier_libraryOptions_baseURL_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:mainScopeIdentifier:libraryIdentifier:libraryOptions:baseURL:");
}

id objc_msgSend_initWithShouldSignal_shouldSample_shouldRunMemoryTools_shouldRunTaskInfo_requiresRoot_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShouldSignal:shouldSample:shouldRunMemoryTools:shouldRunTaskInfo:requiresRoot:");
}

id objc_msgSend_openedLibraryManagerWithLibraryIdentifier_timeout_withTargetUserIdentifier_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openedLibraryManagerWithLibraryIdentifier:timeout:withTargetUserIdentifier:error:");
}

id objc_msgSend_runDiagnoseWithLibraryURL_bundleID_outputDirectoryURL_includeDatabases_includeSysdiagnose_excludeSPLAndSyndication_replyHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "runDiagnoseWithLibraryURL:bundleID:outputDirectoryURL:includeDatabases:includeSysdiagnose:excludeSPLAndSyndic ation:replyHandler:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}