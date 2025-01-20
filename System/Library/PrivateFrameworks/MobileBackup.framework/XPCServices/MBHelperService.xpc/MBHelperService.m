LABEL_12:
    v38 = 0;
    goto LABEL_13;
  }

  v26 = v25;
  v27 = [a1 _createSnapshotForVolumeFd:v25 volumeMountPoint:v24 name:v11 error:a5 cancelationHandler:v12];
  close(v26);
  if (!v27) {
    goto LABEL_12;
  }
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  v29 = v28;
  v30 = MBGetDefaultLog();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v51 = v11;
    v52 = 2114;
    v53 = v24;
    v54 = 2048;
    v55 = v29 - v23;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Created filesystem snapshot %{public}@ at %{public}@ in %.3fs",  buf,  0x20u);
    _MBLog( @"DEFAULT",  (uint64_t)"Created filesystem snapshot %{public}@ at %{public}@ in %.3fs",  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)v11);
  }

  v38 = 1;
LABEL_13:

  return v38;
}

  v6 = (id)v3;
  [*(id *)(a1 + 32) _finishWithError:v3];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }

  v13 = v10;
  v14 = open((const char *)[v13 fileSystemRepresentation], 0x100000);
  if ((v14 & 0x80000000) != 0)
  {
    v18 = *__error();
    v19 = MBGetDefaultLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v13;
      v30 = 1024;
      v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"Unable to open %@: %{errno}d", v21, v22, v23, v24, v25, v26, (uint64_t)v13);
    }

    if (a6)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v18,  v13,  @"Unable to open snapshot path"));
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  v15 = v14;
  v16 = [a1 _mountSnapshotForVolumeFd:v14 volumeMountPoint:v13 name:v11 mountPoint:v12 error:a6];
  close(v15);
LABEL_12:

  return v16;
}

LABEL_15:
  [(id)objc_opt_class(a1) deleteSnapshotForVolume:v16 name:v19 error:0];
  v37 = 0LL;
  if (a6) {
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  14LL,  @"No free mount points for APFS snapshot"));
  }
  v15 = v62;
LABEL_32:
  if (v18 >= 1) {
    close(v18);
  }
LABEL_34:

  return v37;
}

LABEL_18:
    v27 = 0;
    goto LABEL_19;
  }

  v7 = v5;
  if (unmount((const char *)[v7 fileSystemRepresentation], 0))
  {
    v8 = *__error();
    v9 = MBGetDefaultLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if ((_DWORD)v8 == 22)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Nothing to unmount at %{public}@",  buf,  0xCu);
        _MBLog(@"DEFAULT", (uint64_t)"Nothing to unmount at %{public}@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
      }

      if (a4)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  4LL,  v7,  @"Nothing to unmount"));
LABEL_17:
        v27 = 0;
        *a4 = v18;
        goto LABEL_19;
      }
    }

    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = v7;
        v37 = 1024;
        v38 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "unmount failed at %{public}@: %{errno}d",  buf,  0x12u);
        _MBLog( @"ERROR",  (uint64_t)"unmount failed at %{public}@: %{errno}d",  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)v7);
      }

      if (a4)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v8,  v7,  @"Unable to unmount snapshot"));
        goto LABEL_17;
      }
    }

    goto LABEL_18;
  }

  v19 = MBGetDefaultLog();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unmounted snapshot at %{public}@", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"Unmounted snapshot at %{public}@", v21, v22, v23, v24, v25, v26, (uint64_t)v7);
  }

  v27 = 1;
LABEL_19:

  return v27;
}

LABEL_5:
  return v15;
}

id sub_100005C50(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  id v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

id sub_100005D94(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 creationDate]);
  v5 = v4;
  if (v4 && [v4 compare:*(void *)(a1 + 32)] == (id)-1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    id v6 = [v7 hasPrefix:*(void *)(a1 + 40)];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

LABEL_24:
          }
        }

        objc_autoreleasePoolPop(v8);
        id v6 = (char *)v6 + 1;
      }

      while (v64 != v6);
      v57 = [v5 countByEnumeratingWithState:&v70 objects:v78 count:16];
      v64 = v57;
    }

    while (v57);
  }
}

    v41 = -[MBFileSystemSnapshot initWithName:uuid:creationDate:]( objc_alloc(&OBJC_CLASS___MBFileSystemSnapshot),  "initWithName:uuid:creationDate:",  v33,  v32,  v31);
    v42 = v13;
    -[NSMutableArray addObject:](v13, "addObject:", v41);
    v43 = MBGetDefaultLog();
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v88 = 138543362;
      *(void *)&v88[4] = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "Found file system snapshot: %{public}@",  v88,  0xCu);
      _MBLog( @"INFO",  (uint64_t)"Found file system snapshot: %{public}@",  v45,  v46,  v47,  v48,  v49,  v50,  (uint64_t)v41);
    }

    v13 = v42;
    goto LABEL_27;
  }

  v64 = *__error();
  v65 = MBGetDefaultLog();
  v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v88 = 138543618;
    *(void *)&v88[4] = v84;
    *(_WORD *)&v88[12] = 1024;
    *(_DWORD *)&v88[14] = v64;
    _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "fs_snapshot_list failed at %{public}@: %{errno}d",  v88,  0x12u);
    _MBLog( @"ERROR",  (uint64_t)"fs_snapshot_list failed at %{public}@: %{errno}d",  v67,  v68,  v69,  v70,  v71,  v72,  (uint64_t)v84);
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v64,  v84,  @"fs_snapshot_list failed"));
LABEL_41:
  close(v83);
  if (v52)
  {
    v73 = MBGetDefaultLog();
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v90 = v84;
      v91 = 2114;
      v92 = v52;
      _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_ERROR,  "Failed to list file system snapshots at %{public}@: %{public}@",  buf,  0x16u);
      _MBLog( @"ERROR",  (uint64_t)"Failed to list file system snapshots at %{public}@: %{public}@",  v75,  v76,  v77,  v78,  v79,  v80,  (uint64_t)v84);
    }

    v63 = 0LL;
    if (a4) {
      *a4 = v52;
    }
  }

  else
  {
    v63 = v13;
  }

LABEL_49:
  return v63;
}

BOOL sub_100006348(id a1, NSURL *a2, NSError *a3)
{
  return 1;
}

LABEL_23:
    v32 = 0LL;
    if (!v33)
    {
LABEL_27:
      if (v18 >= 1025) {
        sub_100011990();
      }
      v34 = 1;
      goto LABEL_29;
    }

LABEL_9:
    v26 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:path:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:path:format:",  v10,  v6,  @"open error"));
    v27 = 0LL;
    *a4 = v26;
    goto LABEL_11;
  }

  v27 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", (char *)v33 + 4);
  if (!v27) {
    sub_100011A30();
  }
LABEL_11:

  return v27;
}

uint64_t MBMobileUID()
{
  uint64_t result = qword_100021FF8;
  if (qword_100021FF8 < 0)
  {
    v1 = getpwnam((const char *)[@"mobile" UTF8String]);
    if (v1)
    {
      uint64_t result = v1->pw_uid;
      qword_100021FF8 = result;
    }

    else
    {
      v2 = objc_alloc(&OBJC_CLASS___MBException);
      id v3 = __error();
      id v4 = strerror(*v3);
      v5 =  -[MBException initWithCode:format:]( v2,  "initWithCode:format:",  1LL,  @"getpwnam(%@) failed: %s (%d)",  @"mobile",  v4,  *__error());
      objc_exception_throw(v5);
      return (uint64_t)+[MBHelperServiceDelegate sharedInstance](v6, v7);
    }
  }

  return result;
}

void sub_1000072BC(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100022228;
  qword_100022228 = (uint64_t)v1;
}

void sub_100007450(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) count] == (id)1)
  {
    v2 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
    Name = class_getName(v2);
    uint64_t v4 = os_transaction_create(Name);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;
  }
}

void sub_100007530(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 32);
    *(void *)(v2 + 32) = 0LL;

    dispatch_source_set_timer( *(dispatch_source_t *)(*(void *)(a1 + 32) + 16LL),  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0LL);
  }

void sub_100007768( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1000077A8(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MBHelperServiceProtocol));
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___MBFileEncodingTask);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v4 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v2,  v3,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v1 setClasses:v5 forSelector:"runEncodingTask:reply:" argumentIndex:0 ofReply:0];

  id v6 = (void *)qword_100022238;
  qword_100022238 = (uint64_t)v1;
}

void sub_100007868(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) _removeConnection:WeakRetained];
    id WeakRetained = v3;
  }
}

void sub_100007918(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = v2 + 1;
  if (!v2) {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
  }
}

void sub_1000079A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 24) - 1LL;
  *(void *)(v1 + 24) = v2;
  if (!v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 32))
    {
      uint64_t v5 = *(dispatch_source_s **)(v4 + 16);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100007A64;
      handler[3] = &unk_10001C7B8;
      handler[4] = v4;
      dispatch_source_set_event_handler(v5, handler);
      dispatch_time_t v6 = dispatch_time(0LL, 300000000000LL);
      uint64_t v4 = *(void *)(a1 + 32);
    }

    else
    {
      dispatch_time_t v6 = -1LL;
    }

    dispatch_source_set_timer(*(dispatch_source_t *)(v4 + 16), v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
  }

void sub_100007A64(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0LL;
}

id MBTemporaryPath()
{
  if (qword_100022248 != -1) {
    dispatch_once(&qword_100022248, &stru_10001C7D8);
  }
  uint64_t v5 = 0LL;
  dispatch_time_t v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = sub_100007E48;
  v9 = sub_100007E58;
  id v10 = 0LL;
  id v0 = sub_100007E60();
  uint64_t v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007EA0;
  block[3] = &unk_10001C800;
  block[4] = &v5;
  dispatch_sync(v1, block);

  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_100007D8C(id a1)
{
  uint64_t v1 = mkdtemp(v4);
  qword_100022250 = (uint64_t)v1;
  if (!v1)
  {
    id v2 = objc_alloc(&OBJC_CLASS___MBException);
    id v3 = @"Unable to create /var/tmp/backupd-XXXXXXXXXX directory (mkdtemp)";
    goto LABEL_6;
  }

  qword_100022250 = (uint64_t)strdup(v1);
  if (!qword_100022250)
  {
    id v2 = objc_alloc(&OBJC_CLASS___MBException);
    id v3 = @"Unable to create /var/tmp/backupd-XXXXXXXXXX directory (strdup)";
LABEL_6:
    objc_exception_throw(-[MBException initWithCode:format:](v2, "initWithCode:format:", 1LL, v3));
  }

uint64_t sub_100007E48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100007E58(uint64_t a1)
{
}

id sub_100007E60()
{
  if (qword_100022260 != -1) {
    dispatch_once(&qword_100022260, &stru_10001C820);
  }
  return (id)qword_100022258;
}

void sub_100007EA0(uint64_t a1)
{
  if (!qword_100022250) {
    objc_exception_throw(  -[MBException initWithCode:format:]( objc_alloc(&OBJC_CLASS___MBException),  "initWithCode:format:",  1LL,  @"Unable to create /var/tmp/backupd-XXXXXXXXXX directory"));
  }
  snprintf(__str, 0x401uLL, "%s/XXXXXXXXXXXXXXX", (const char *)qword_100022250);
  if (mktemp(__str))
  {
    id v2 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", __str);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v4 = *(os_log_s **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

  else
  {
    id v5 = MBGetDefaultLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = *__error();
      *(_DWORD *)buf = 67109120;
      int v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "mktemp failed: %{errno}d", buf, 8u);
      uint64_t v7 = __error();
      _MBLog(@"ERROR", (uint64_t)"mktemp failed: %{errno}d", v8, v9, v10, v11, v12, v13, *v7);
    }
  }
}

void sub_100007FE4(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("MBTemporaryPath", v4);
  uint64_t v3 = (void *)qword_100022258;
  qword_100022258 = (uint64_t)v2;
}

NSMutableString *MBStringWithArray(void *a1)
{
  dispatch_queue_t v2 = +[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"[");
  id v3 = [a1 objectEnumerator];
  id v4 = [v3 nextObject];
  if (v4)
  {
    id v5 = v4;
    do
    {
      if (-[NSMutableString length](v2, "length") != (id)1) {
        -[NSMutableString appendString:](v2, "appendString:", @", ");
      }
      -[NSMutableString appendString:](v2, "appendString:", MBStringWithObject(v5));
      id v5 = [v3 nextObject];
    }

    while (v5);
  }

  -[NSMutableString appendString:](v2, "appendString:", @"]");
  return v2;
}

NSMutableString *MBStringWithObject(void *a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(a1, v2) & 1) != 0) {
    return (NSMutableString *)MBStringWithArray(a1);
  }
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(a1, v4) & 1) != 0) {
    return (NSMutableString *)MBStringWithNibbles( (unsigned __int8 *)[a1 bytes],  2 * (void)objc_msgSend(a1, "length"));
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(a1, v5) & 1) != 0) {
    return MBStringWithDictionary(a1);
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet);
  if ((objc_opt_isKindOfClass(a1, v6) & 1) != 0) {
    return MBStringWithSet(a1);
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(a1, v7) & 1) != 0) {
    return (NSMutableString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  a1);
  }
  else {
    return (NSMutableString *)[a1 description];
  }
}

NSString *MBStringWithNibbles(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v4 = malloc(2 * a2);
  if (a2)
  {
    unint64_t v5 = 0LL;
    do
    {
      unsigned int v7 = *a1++;
      char v6 = v7;
      v4[v5] = a0123456789abcd[(unint64_t)v7 >> 4];
      if (v5 + 1 < a2) {
        v4[v5 + 1] = a0123456789abcd[v6 & 0xF];
      }
      v5 += 2LL;
    }

    while (v5 < a2);
  }

  return  -[NSString initWithCharactersNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCharactersNoCopy:length:freeWhenDone:",  v4,  a2,  1LL);
}

id MBStringWithDate(id result)
{
  if (result) {
    return +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  result,  1LL,  2LL);
  }
  return result;
}

NSMutableString *MBStringWithDictionary(void *a1)
{
  uint64_t v2 = +[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"{");
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      char v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(a1);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8LL * (void)v6);
        if (-[NSMutableString length](v2, "length") != (id)1) {
          -[NSMutableString appendString:](v2, "appendString:", @", ");
        }
        -[NSMutableString appendFormat:]( v2,  "appendFormat:",  @"%@: %@",  v7,  MBStringWithObject([a1 objectForKeyedSubscript:v7]));
        char v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  -[NSMutableString appendString:](v2, "appendString:", @"}");
  return v2;
}

NSMutableString *MBStringWithSet(void *a1)
{
  uint64_t v2 = +[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"{");
  id v3 = [a1 objectEnumerator];
  id v4 = [v3 nextObject];
  if (v4)
  {
    id v5 = v4;
    do
    {
      if (-[NSMutableString length](v2, "length") != (id)1) {
        -[NSMutableString appendString:](v2, "appendString:", @", ");
      }
      -[NSMutableString appendString:](v2, "appendString:", MBStringWithObject(v5));
      id v5 = [v3 nextObject];
    }

    while (v5);
  }

  -[NSMutableString appendString:](v2, "appendString:", @"}");
  return v2;
}

uint64_t MBHTTPDateFormatter()
{
  if (qword_100022268 != -1) {
    dispatch_once(&qword_100022268, &stru_10001C840);
  }
  return qword_100022270;
}

void sub_100008530(id a1)
{
  qword_100022270 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  dispatch_queue_attr_t v1 =  -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US");
  [(id)qword_100022270 setLocale:v1];
  objc_msgSend((id)qword_100022270, "setDateFormat:", @"EEE, dd MMM yyyy HH:mm:ss z");
}

char *sub_100008620(const char *a1, void *a2, char *a3)
{
  id v5 = a2;
  if (!a1) {
    sub_100011A80();
  }
  if (!v5) {
    sub_100011AA8();
  }
  id v6 = v5;
  snprintf(__str, 0x401uLL, "%s/%s_XXXXXXXXXXXXXXX", a1, (const char *)[v6 fileSystemRepresentation]);
  uint64_t v7 = mkdtemp(__str);
  if (v7)
  {
    a3 = strdup(v7);
  }

  else
  {
    id v8 = MBGetDefaultLog();
    __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = *__error();
      *(_DWORD *)buf = 136315394;
      v21 = __str;
      __int16 v22 = 1024;
      int v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "=tmpdir= Failed to create %s directory (mkdtemp error: %d)",  buf,  0x12u);
      __error();
      _MBLog( @"ERROR",  (uint64_t)"=tmpdir= Failed to create %s directory (mkdtemp error: %d)",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)__str);
    }

    if (a3)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", __str));
      id v18 = +[MBError posixErrorWithPath:format:]( &OBJC_CLASS___MBError,  "posixErrorWithPath:format:",  v17,  @"TempDir: Failed to create directory (mkdtemp error: %d)",  *__error());
      *(void *)a3 = (id)objc_claimAutoreleasedReturnValue(v18);

      a3 = 0LL;
    }
  }

  return a3;
}

uint64_t sub_1000089C0(const char *a1)
{
  if (!a1) {
    sub_100011B70();
  }
  uint64_t result = mkpath_np(a1, 0x1FFu);
  if ((_DWORD)result != 17) {
    return MBMobileUID();
  }
  return result;
}

id sub_100008C70(const char *a1)
{
  if (!a1) {
    sub_100011C60();
  }
  snprintf(__str, 0x401uLL, "%s/XXXXXXXXXXXXXXX", a1);
  mktemp(__str);
  return (id)objc_claimAutoreleasedReturnValue( +[NSString mb_stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "mb_stringWithFileSystemRepresentation:",  __str));
}

void sub_100009170(_Unwind_Exception *a1)
{
}

void sub_1000092F8(id a1)
{
  qword_100022278 = (uint64_t)strdup("/var/tmp/com.apple.backup.testing");
  sub_1000089C0((const char *)qword_100022278);
}

void sub_10000931C(id a1)
{
  qword_100022288 = (uint64_t)strdup("/var/mobile/tmp/com.apple.backup.testing");
  sub_1000089C0((const char *)qword_100022288);
}

void sub_100009340(id a1)
{
  qword_100022298 = (uint64_t)strdup("/var/tmp/com.apple.backup");
  sub_1000089C0((const char *)qword_100022298);
}

uint64_t MBIsTransientErrorCode(uint64_t a1)
{
  uint64_t result = 1LL;
  if (a1 > 299)
  {
    unint64_t v3 = a1 - 300;
    if (v3 > 8 || ((1LL << v3) & 0x135) == 0) {
      return 0LL;
    }
  }

  else if (((unint64_t)(a1 - 202) > 0x12 || ((1LL << (a1 + 54)) & 0x78041) == 0) {
         && ((unint64_t)a1 > 0x14 || ((1LL << a1) & 0x1A0000) == 0)
  }
         && (unint64_t)(a1 - 105) >= 2)
  {
    return 0LL;
  }

  return result;
}

uint64_t MBSimpleChecksumForString(void *a1)
{
  dispatch_queue_attr_t v1 = (const char *)[a1 UTF8String];
  int64_t v2 = strlen(v1);
  if (v2 < 1) {
    return 0LL;
  }
  unsigned int v3 = 0;
  id v4 = (char *)&v1[v2];
  do
  {
    int64_t v5 = v4 - v1;
    if ((unint64_t)(v4 - v1) < 4)
    {
      switch(v5)
      {
        case 1LL:
          int v6 = *v1 << 24;
          uint64_t v7 = 1LL;
          break;
        case 2LL:
          int v6 = (v1[1] << 16) | (*v1 << 24);
          uint64_t v7 = 2LL;
          break;
        case 3LL:
          int v6 = (v1[1] << 16) | (*v1 << 24) | (v1[2] << 8);
          uint64_t v7 = 3LL;
          break;
        default:
          sub_100011C88();
      }
    }

    else
    {
      int v6 = (v1[1] << 16) | (*v1 << 24) | (v1[2] << 8) | v1[3];
      uint64_t v7 = 4LL;
    }

    v1 += v7;
    v3 += v6;
  }

  while (v1 < v4);
  return v3;
}

id MBGetDefaultLog()
{
  if (qword_1000222B0 != -1) {
    dispatch_once(&qword_1000222B0, &stru_10001C8C0);
  }
  return (id)qword_1000222A8;
}

void sub_10000C190(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobilebackup", "Default");
  int64_t v2 = (void *)qword_1000222A8;
  qword_1000222A8 = (uint64_t)v1;
}

id MBGetLogDateFormatter()
{
  if (qword_1000222C0 != -1) {
    dispatch_once(&qword_1000222C0, &stru_10001C8E0);
  }
  return (id)qword_1000222B8;
}

void sub_10000C200(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  int64_t v2 = (void *)qword_1000222B8;
  qword_1000222B8 = (uint64_t)v1;

  [(id)qword_1000222B8 setFormatterBehavior:1040];
  [(id)qword_1000222B8 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

CFStringRef MBGetLogDir()
{
  else {
    return @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/MobileBackup";
  }
}

id sub_10000C278(void *a1)
{
  id v1 = a1;
  int64_t v2 = (char *)[v1 length];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", v2));
  if (v2)
  {
    int v4 = 0;
    unint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    while (1)
    {
      unsigned int v8 = [v1 characterAtIndex:v5];
      switch(v4)
      {
        case 0:
          int v4 = v8 == 37;
          goto LABEL_18;
        case 1:
          uint64_t v9 = v8 - 64;
          if (v9 == 16) {
            goto LABEL_21;
          }
          if (v9 != 59) {
            goto LABEL_24;
          }
          if (v7 < v5)
          {
            id v10 = v3;
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringWithRange:", v7, v5 - v7));
            [v10 appendString:v11];
          }

          int v4 = 2;
          unint64_t v7 = v5;
          goto LABEL_18;
        case 2:
          if (v8 == 125)
          {
            unint64_t v6 = v5 + 1;
            int v4 = 3;
          }

          else
          {
            int v4 = 2;
          }

          goto LABEL_18;
        case 3:
          uint64_t v12 = v8 - 64;
          if (v12 == 16)
          {
LABEL_21:
            if (v6 < v5)
            {
              id v13 = v3;
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringWithRange:", v6, v5 - v6));
              [v13 appendString:v14];
            }

            [v3 appendString:@"p"];
            unint64_t v6 = v5 + 1;
          }

          else
          {
LABEL_24:
            if (v8 != 37)
            {
              int v4 = 3;
              goto LABEL_18;
            }
          }

LABEL_17:
          int v4 = 0;
          unint64_t v7 = v6;
LABEL_18:
          break;
        default:
          goto LABEL_18;
      }
    }
  }

  unint64_t v7 = 0LL;
LABEL_27:
  BOOL v15 = (unint64_t)v2 > v7;
  uint64_t v16 = &v2[-v7];
  if (v15)
  {
    id v17 = v3;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringWithRange:", v7, v16));
    [v17 appendString:v18];
  }

  return v3;
}

void _MBLog( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (sFileLoggingEnabled)
  {
    uint64_t v11 = objc_autoreleasePoolPush();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  a2,  4LL));
    id v13 = objc_alloc(&OBJC_CLASS___NSString);
    id v14 = sub_10000C278(v12);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = -[NSString initWithFormat:arguments:](v13, "initWithFormat:arguments:", v15, &a9);

    sub_10000C580(v10, v16);
    objc_autoreleasePoolPop(v11);
  }
}

void sub_10000C580(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (qword_1000222E0 != -1) {
    dispatch_once(&qword_1000222E0, &stru_10001C948);
  }
  id v5 = MBGetLogDateFormatter();
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringFromDate:v7]);

  __uint64_t v80 = 0LL;
  if (pthread_threadid_np(0LL, &v80))
  {
    __uint64_t v9 = 0LL;
    __uint64_t v80 = 0LL;
  }

  else
  {
    __uint64_t v9 = v80;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %d.%llx %@: %@\n",  v8,  dword_1000222D8,  v9,  v3,  v4));
  uint64_t v11 = (const char *)[v10 UTF8String];
  size_t v12 = strlen(v11);
  pthread_mutex_lock(&stru_100022120);
  id v13 = &OBJC_PROTOCOL___MBHelperServiceProtocol;
  if (qword_1000222D0)
  {
    if (qword_1000222F8 != -1) {
      dispatch_once(&qword_1000222F8, &stru_10001C988);
    }
    if (qword_1000222D0) {
      fclose((FILE *)qword_1000222D0);
    }
  }

  if (qword_100022308 != -1) {
    dispatch_once(&qword_100022308, &stru_10001C9C8);
  }
  if (byte_100022300)
  {
    id v14 = MBGetLogDir();
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (const char *)[v15 fileSystemRepresentation];
    if (mkdir(v16, 0x1C0u) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100011ED0();
      }
    }

    else if (!geteuid())
    {
      if (lstat(v16, &v88))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100011E5C();
        }
      }

      else
      {
        uid_t v62 = MBMobileUID();
        if (v88.st_uid == v62 && v88.st_gid == v62 || !lchown(v16, v62, v62))
        {
          if ((~v88.st_mode & 0x1C0) != 0
            && lchmod(v16, 0x1C0u)
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100011D74();
          }
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100011DE8();
        }
      }
    }
  }

  if (qword_100022320 != -1) {
    dispatch_once(&qword_100022320, &stru_10001CA28);
  }
  if (!byte_100022318)
  {
    qword_1000222D0 = 0LL;
    goto LABEL_82;
  }

  size_t v71 = v12;
  id v72 = v3;
  id v17 = MBGetLogDir();
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = sub_10000CE94();
  v73 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:"));
  qword_1000222E8 = 0LL;
  id v21 = v20;
  v75 = v18;
  if (!lstat((const char *)[v21 fileSystemRepresentation], &v88))
  {
    if (qword_1000222F8 != -1) {
      dispatch_once(&qword_1000222F8, &stru_10001C988);
    }
    off_t v78 = qword_1000222F0;
    if (qword_100022340 != -1) {
      dispatch_once(&qword_100022340, &stru_10001CA68);
    }
    uint64_t v22 = qword_100022338;
    time_t v23 = time(0LL);
    __darwin_time_t v76 = v23;
    off_t st_size = v88.st_size;
    if (v78 < v88.st_size
      || (qword_1000222E8 = v88.st_size, v23 > v88.st_birthtimespec.tv_sec)
      && v23 - v88.st_birthtimespec.tv_sec >= 86401)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      if (qword_100022330 != -1) {
        dispatch_once(&qword_100022330, &stru_10001CA48);
      }
      if (byte_100022328)
      {
        id v66 = v21;
        v67 = v11;
        v68 = v10;
        v69 = v8;
        id v70 = v4;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 contentsOfDirectoryAtPath:v18 error:0]);
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472LL;
        v86[2] = sub_10000D110;
        v86[3] = &unk_10001C908;
        id v26 = v73;
        id v87 = v26;
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v86));
        v65 = v25;
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "filteredArrayUsingPredicate:"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v63 sortedArrayUsingComparator:&stru_10001C9A8]);
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        id obj = v27;
        id v28 = [v27 countByEnumeratingWithState:&v82 objects:v89 count:16];
        if (!v28) {
          goto LABEL_66;
        }
        id v29 = v28;
        uint64_t v30 = *(void *)v83;
        uint64_t v74 = v22;
        while (1)
        {
          for (i = 0LL; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v83 != v30) {
              objc_enumerationMutation(obj);
            }
            v32 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)i);
            v33 = (void *)objc_claimAutoreleasedReturnValue([v32 stringByDeletingPathExtension]);
            unsigned __int8 v34 = [v33 isEqualToString:v26];

            if ((v34 & 1) == 0)
            {
              unsigned int v36 = 0;
LABEL_48:
              v37 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v32]);
              v38 = v37;
              if (v22 <= v36)
              {
                id v49 = v37;
                if (!lstat((const char *)[v49 fileSystemRepresentation], &v88)
                  && v76 > v88.st_mtimespec.tv_sec
                  && v76 - v88.st_mtimespec.tv_sec >= 864001)
                {
                  v50 = v24;
                  id v51 = v49;
                  goto LABEL_60;
                }
              }

              else if (v78 < st_size)
              {
                if (v22 > v36 + 1)
                {
                  uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
                  v40 = v18;
                  v41 = (void *)objc_claimAutoreleasedReturnValue([(id)v39 description]);
                  v42 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByAppendingPathExtension:v41]);
                  v43 = (void *)objc_claimAutoreleasedReturnValue([v40 stringByAppendingPathComponent:v42]);

                  id v81 = 0LL;
                  v44 = v24;
                  LOBYTE(v39) = [v24 moveItemAtPath:v38 toPath:v43 error:&v81];
                  id v45 = v81;
                  v46 = v45;
                  if ((v39 & 1) == 0)
                  {
                    v47 = (void *)objc_claimAutoreleasedReturnValue([v45 domain]);
                    if ([v47 isEqualToString:NSCocoaErrorDomain])
                    {
                      id v48 = [v46 code];

                      if (v48 == (id)513) {
                        [v44 removeItemAtPath:v38 error:0];
                      }
                    }

                    else
                    {
                    }
                  }

                  v24 = v44;
                  uint64_t v22 = v74;
                  id v18 = v75;
                  goto LABEL_63;
                }

                v50 = v24;
                id v51 = v38;
LABEL_60:
                [v50 removeItemAtPath:v51 error:0];
              }

LABEL_63:
              continue;
            }

            v35 = (void *)objc_claimAutoreleasedReturnValue([v32 pathExtension]);
            unsigned int v36 = [v35 intValue];

            if ((v36 & 0x80000000) == 0) {
              goto LABEL_48;
            }
          }

          id v29 = [obj countByEnumeratingWithState:&v82 objects:v89 count:16];
          if (!v29)
          {
LABEL_66:

            unsigned int v8 = v69;
            id v4 = v70;
            uint64_t v11 = v67;
            id v10 = v68;
            id v13 = &OBJC_PROTOCOL___MBHelperServiceProtocol;
            id v21 = v66;
            goto LABEL_69;
          }
        }
      }

      [v24 removeItemAtPath:v21 error:0];
LABEL_69:
    }
  }

  v52 = v13;
  v53 = v11;
  id v54 = v21;
  v55 = fopen((const char *)[v54 fileSystemRepresentation], "a");
  if (v55)
  {
    uid_t v56 = MBMobileUID();
    int v57 = fileno(v55);
    if (!fstat(v57, &v88))
    {
      uid_t st_uid = v88.st_uid;
      if (v88.st_uid != v56 && st_uid == geteuid()) {
        fchown(v57, v56, 0xFFFFFFFF);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100011D00();
  }

  qword_1000222D0 = (uint64_t)v55;
  uint64_t v11 = v53;
  size_t v12 = v71;
  id v3 = v72;
  if (v55)
  {
    id v13 = v52;
    if (ftello(v55))
    {
      fputs("\n", (FILE *)qword_1000222D0);
      ++v52[10].inst_meths;
    }

LABEL_80:
    v59 = (FILE *)qword_1000222D0;
    if (qword_1000222D0)
    {
      v13[10].inst_meths = (__objc2_meth_list *)((char *)v13[10].inst_meths + v12);
      fputs(v11, v59);
      v60 = (dispatch_source_s *)qword_1000222C8;
      dispatch_time_t v61 = dispatch_time(0LL, 3000000000LL);
      dispatch_source_set_timer(v60, v61, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }
  }

LABEL_82:
  pthread_mutex_unlock(&stru_100022120);
}

id sub_10000CE94()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 processName]);

  if (!v1 || (id v2 = v1, !strcmp((const char *)[v2 UTF8String], "backupd"))) {
    id v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"MobileBackup",  @"log",  v6);
  }
  else {
    id v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@.%@",  @"MobileBackup",  v2,  @"log");
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

void sub_10000CF60(id a1)
{
  dword_1000222D8 = getpid();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v2);
  id v4 = (void *)qword_1000222C8;
  qword_1000222C8 = (uint64_t)v3;

  dispatch_source_set_timer((dispatch_source_t)qword_1000222C8, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000222C8, &stru_10001C968);
  dispatch_resume((dispatch_object_t)qword_1000222C8);
}

void sub_10000CFEC(id a1)
{
  if (qword_1000222D0) {
    fflush((FILE *)qword_1000222D0);
  }
  pthread_mutex_unlock(&stru_100022120);
}

void sub_10000D038(id a1)
{
  id v1 = getenv("MBMaxLogSize");
  if (v1)
  {
    uint64_t v2 = strtol(v1, 0LL, 10);
    else {
      uint64_t v3 = v2;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MBMaxLogSize=%ld",  (uint8_t *)&v4,  0xCu);
    }
  }

  else
  {
    uint64_t v3 = 10485760LL;
  }

  qword_1000222F0 = v3;
}

id sub_10000D110(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(a1 + 32)];
}

int64_t sub_10000D11C(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

void sub_10000D128(id a1)
{
  id v1 = MBGetLogDir();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByDeletingLastPathComponent]);

  uint64_t v4 = getpid();
  uint64_t v5 = SANDBOX_CHECK_NO_REPORT | 1u;
  id v9 = v3;
  [v9 fileSystemRepresentation];
  byte_100022300 = sandbox_check(v4, "file-write-create", v5) == 0;
  uint64_t v6 = os_log_set_hook(1LL, &stru_10001CA08);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = (void *)qword_100022310;
  qword_100022310 = v7;
}

void sub_10000D1E4(id a1, unsigned __int8 a2, os_log_message_s *a3)
{
  uint64_t v4 = a2;
  if (qword_100022310) {
    (*(void (**)(void))(qword_100022310 + 16))();
  }
  var16 = a3->var16;
  if (var16 && !strcmp(var16, "MBSwift"))
  {
    uint64_t v6 = os_log_copy_message_string(a3);
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      unsigned int v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", os_log_type_get_name(v4));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
      sub_10000C580(v9, v10);

      free(v7);
    }
  }

void sub_10000D2AC(id a1)
{
  id v1 = MBGetLogDir();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = getpid();
  uint64_t v4 = SANDBOX_CHECK_NO_REPORT | 1u;
  id v5 = v2;
  [v5 fileSystemRepresentation];
  byte_100022318 = sandbox_check(v3, "file-write-create", v4) == 0;
}

void sub_10000D334(id a1)
{
  id v1 = MBGetLogDir();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    id v9 = v2;
    uint64_t v3 = getpid();
    uint64_t v4 = SANDBOX_CHECK_NO_REPORT | 1u;
    id v8 = [v9 fileSystemRepresentation];
    if (sandbox_check(v3, "file-read-data", v4))
    {
      BOOL v5 = 0;
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo", v8));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 processName]);

      BOOL v5 = ([v7 isEqualToString:@"healthd"] & 1) == 0
        && ![v7 isEqualToString:@"imagent"];
    }

    uint64_t v2 = v9;
    byte_100022328 = v5;
  }
}

void sub_10000D414(id a1)
{
  id v1 = getenv("MBMaxLogCount");
  uint64_t v2 = 10LL;
  if (v1)
  {
    uint64_t v3 = strtol(v1, 0LL, 10);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MBMaxLogCount=%ld",  (uint8_t *)&v4,  0xCu);
    }
  }

  qword_100022338 = v2;
}

  ;
}

void sub_10000D4FC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *sub_10000D518()
{
  return __error();
}

uint64_t MBIsInternalInstall()
{
  if (qword_100022350 != -1) {
    dispatch_once(&qword_100022350, &stru_10001CA88);
  }
  return byte_100022348;
}

void sub_10000D560(id a1)
{
  id v1 = (void *)MGCopyAnswer(@"InternalBuild", 0LL);
  byte_100022348 = [v1 BOOLValue];
  if (v1) {
    CFRelease(v1);
  }
}

void sub_10000E16C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) encodingMethod];
  if (v2 - 2 < 2)
  {
    int v4 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48) == 1) {
      uint64_t v3 = objc_claimAutoreleasedReturnValue([v4 _archive]);
    }
    else {
      uint64_t v3 = objc_claimAutoreleasedReturnValue([v4 _unarchive]);
    }
  }

  else
  {
    if (v2 == -1)
    {
      [*(id *)(a1 + 32) setEncodingMethod:1];
    }

    else if (v2 != 1)
    {
      uint64_t v3 = objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( MBError,  "errorWithCode:format:",  1,  @"Unknown encoding method %ld",  (int)[*(id *)(a1 + 32) encodingMethod]));
      goto LABEL_12;
    }

    uint64_t v5 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48) == 1) {
      uint64_t v3 = objc_claimAutoreleasedReturnValue([v5 _compress]);
    }
    else {
      uint64_t v3 = objc_claimAutoreleasedReturnValue([v5 _decompress]);
    }
  }

BOOL sub_10000E7C8(int a1, int *a2, void *a3)
{
  if (!a2) {
    sub_100012174();
  }
  *a2 = 0;
  switch(a1)
  {
    case -1:
    case 2:
      id v4 = 0LL;
      int v5 = 2049;
      goto LABEL_9;
    case 1:
      id v4 = 0LL;
      int v5 = 517;
      goto LABEL_9;
    case 3:
      id v4 = 0LL;
      int v5 = 774;
LABEL_9:
      *a2 = v5;
      BOOL v6 = 1LL;
      break;
    default:
      id v4 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  1LL,  @"Invalid file compression method %ld",  a1));
      BOOL v6 = v4 == 0LL;
      if (a3 && v4)
      {
        id v4 = v4;
        BOOL v6 = 0LL;
        *a3 = v4;
      }

      break;
  }

  return v6;
}

uint64_t sub_10000E894(unsigned int a1, char *a2, void *a3)
{
  if (!a2) {
    sub_10001219C();
  }
  *a2 = 0;
  switch(a1)
  {
    case 0x205u:
      id v4 = 0LL;
      uint64_t v6 = 1LL;
      *a2 = 1;
      break;
    case 0x306u:
      id v4 = 0LL;
      char v5 = 3;
      goto LABEL_8;
    case 0x801u:
      id v4 = 0LL;
      char v5 = 2;
LABEL_8:
      *a2 = v5;
LABEL_9:
      uint64_t v6 = 1LL;
      break;
    default:
      id v4 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  1LL,  @"Invalid compression algorithm %ld",  a1));
      if (!v4)
      {
        id v4 = 0LL;
        goto LABEL_9;
      }

      if (a3)
      {
        id v4 = v4;
        uint64_t v6 = 0LL;
        *a3 = v4;
      }

      else
      {
        uint64_t v6 = 0LL;
      }

      break;
  }

  return v6;
}

LABEL_94:
    if (a3)
    {
      id v81 = MBGetDefaultLog();
      __int128 v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        __int128 v83 = -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
        *(_DWORD *)buf = 138414594;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v83;
        *(_WORD *)v150 = 2048;
        *(void *)&v150[2] = algorithm;
        v151 = 1024;
        v152 = v126;
        v153 = 2048;
        v154 = st_size;
        v155 = 2048;
        v156 = v131;
        v157 = 2048;
        v158 = v78 - Current;
        v159 = 2112;
        v160 = v148;
        v161 = 2112;
        v162 = v147;
        _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_INFO,  "Finished decompressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time:%.3fs, sr cDigest:%@, dstDigest:%@",  buf,  0x62u);
        v79 = v131;
        -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
        v24 = __fd;
        _MBLog( @"INFO",  (uint64_t)"Finished decompressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time: %.3fs, srcDigest:%@, dstDigest:%@",  v84,  v85,  v86,  v87,  v88,  v89,  (uint64_t)v12);
      }

      goto LABEL_103;
    }

    v90 = -1.0;
    v91 = MBGetDefaultLog();
    v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      v93 = -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
      v142 = v13;
      v95 = v147;
      v94 = v148;
      v96 = v78 - Current;
      *(_DWORD *)buf = 138415106;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v142;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v93;
      *(_WORD *)v150 = 2048;
      *(void *)&v150[2] = algorithm;
      v151 = 1024;
      v152 = v126;
      v153 = 2048;
      v154 = tv_sec;
      v155 = 2048;
      v156 = *(double *)&st_size;
      v157 = 2048;
      v158 = v131;
      v159 = 2048;
      v160 = v90;
      v161 = 2048;
      v162 = v96;
      v163 = 2112;
      v164 = v148;
      v165 = 2112;
      v166 = v147;
      _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_INFO,  "Finished compressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:%llu, savi ngs:%.3f, time:%.3fs, srcDigest:%@, dstDigest:%@",  buf,  0x76u);
      v122 = v94;
      v123 = v95;
      v24 = __fd;
      id v13 = v142;
      v120 = v90;
      v121 = v96;
      v118 = st_size;
      v119 = v131;
      v117 = tv_sec;
      v79 = v131;
      v115 = algorithm;
      v116 = v126;
      v114 = -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
      _MBLog( @"INFO",  (uint64_t)"Finished compressing, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:% llu, savings:%.3f, time:%.3fs, srcDigest:%@, dstDigest:%@",  v97,  v98,  v99,  v100,  v101,  v102,  (uint64_t)v12);
    }

    v103 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask spaceSavingsThreshold](self, "spaceSavingsThreshold"));
    [v103 doubleValue];
    v105 = v104;

    if (v105 == 0.0)
    {
LABEL_103:
      -[MBFileEncodingTask setSourceDigest:](self, "setSourceDigest:", *(void *)&v148);
      -[MBFileEncodingTask setDestinationDigest:](self, "setDestinationDigest:", *(void *)&v147);
      *(double *)v127 = v79;
      id v21 = 1;
      if (v24 != -1)
      {
LABEL_122:
        close(v24);
        goto LABEL_12;
      }

      goto LABEL_12;
    }

    if (v90 <= 0.0)
    {
      v112 = *(double *)&st_size;
      v113 = v79;
      v108 = @"Insufficient space savings, srcSize:%llu, dstSize:%llu";
    }

    else
    {
      if (v105 <= 0.0 || v90 >= v105) {
        goto LABEL_103;
      }
      v112 = v90;
      v113 = v105;
      v108 = @"Insufficient space savings: %.3f < %.3f";
    }

    v106 = +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  1LL,  v12,  v108,  *(void *)&v112,  *(void *)&v113,  v114,  v115,  v116,  v117,  v118,  *(void *)&v119,  *(void *)&v120,  *(void *)&v121,  *(void *)&v122,  *(void *)&v123);
LABEL_118:
    __uint64_t v80 = objc_claimAutoreleasedReturnValue(v106);
    goto LABEL_119;
  }

  __uint64_t v80 = objc_claimAutoreleasedReturnValue( +[MBError posixErrorWithPath:format:]( &OBJC_CLASS___MBError,  "posixErrorWithPath:format:",  v13,  @"Failed to fstat dst file"));
LABEL_119:
  v110 = (void *)v80;

  v20 = v110;
LABEL_120:
  v20 = v20;
  *v139 = v20;
  if (v24 != -1)
  {
LABEL_121:
    ftruncate(v24, 0LL);
    id v21 = 0;
    goto LABEL_122;
  }

  id v21 = 0;
LABEL_12:
  if (v17 != -1) {
    close(v17);
  }

  return v21;
}

void sub_100010250(id a1)
{
  id v1 = NSTemporaryDirectory();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"tmpbackupXXXXXXXX"]);
  uint64_t v3 = (void *)qword_100022358;
  qword_100022358 = v2;
}

void sub_100010C2C(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(2LL);
  uint64_t v2 = (void *)qword_100022368;
  qword_100022368 = (uint64_t)v1;
}

void sub_100010C50(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_UTILITY, 0);
  attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.backupd.encoding", attr);
  char v5 = (void *)qword_100022378;
  qword_100022378 = (uint64_t)v4;
}

void sub_100010CC4(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1LL);
  uint64_t v2 = (void *)qword_100022388;
  qword_100022388 = (uint64_t)v1;
}

void sub_100010CE8(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_UTILITY, 0);
  attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.backupd.decoding", attr);
  char v5 = (void *)qword_100022398;
  qword_100022398 = (uint64_t)v4;
}

int main(int argc, const char **argv, const char **envp)
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MBHelperServiceDelegate sharedInstance](&OBJC_CLASS___MBHelperServiceDelegate, "sharedInstance"));
  [v3 setDelegate:v4];

  [v3 resume];
  return 0;
}

LABEL_16:
    id v26 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  1LL,  @"Failed to create tmp file"));
    ((void (**)(void, id))v7)[2](v7, v26);
    [v8 idle];
    goto LABEL_17;
  }

  id v9 = mkstemp(v57);
  if (v9 == -1)
  {
    unsigned int v36 = MBGetDefaultLog();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v37 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v46) = v37;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "mkstemp failed: %{errno}d", buf, 8u);
      v38 = *__error();
      v35 = "mkstemp failed: %{errno}d";
      goto LABEL_15;
    }

    goto LABEL_16;
  }

  id v10 = v9;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v57));
  if (!v11) {
    sub_1000125D4();
  }
  size_t v12 = (void *)v11;
  [v5 setDestinationPath:v11];
  [v5 setValidate:1];
  id v13 = MBGetDefaultLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v5 sourcePath]);
    *(_DWORD *)buf = 138413570;
    v46 = v5;
    v47 = 2112;
    id v48 = v15;
    id v49 = 2112;
    v50 = v12;
    id v51 = 2048;
    v52 = (int)[v5 encodingMethod];
    v53 = 2048;
    id v54 = (int)[v5 compressionMethod];
    v55 = 1024;
    uid_t v56 = [v5 protectionClass];
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Starting task:%@, sourcePath:%@, destinationPath:%@, encodingMethod:%ld, compressionMethod:%ld, pc:%d",  buf,  0x3Au);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 sourcePath]);
    [v5 encodingMethod];
    [v5 compressionMethod];
    [v5 protectionClass];
    _MBLog( @"INFO",  (uint64_t)"Starting task:%@, sourcePath:%@, destinationPath:%@, encodingMethod:%ld, compressionMethod:%ld, pc:%d",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v5);
  }

  time_t v23 = dispatch_group_create();
  [v5 setGroup:v23];
  [v5 start];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011230;
  block[3] = &unk_10001CB98;
  v40 = v12;
  v44 = v10;
  v43 = v7;
  v41 = v5;
  v42 = v8;
  id v26 = v12;
  dispatch_group_notify(v23, v25, block);

LABEL_17:
}

void sub_1000111E8(id a1)
{
  dispatch_queue_attr_t v1 = NSTemporaryDirectory();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"tmpbackupencodeXXXXXXXX"]);
  dispatch_queue_attr_t v3 = (void *)qword_1000223A8;
  qword_1000223A8 = v2;
}

void sub_100011230(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  unlink((const char *)[*(id *)(a1 + 32) fileSystemRepresentation]);
  close(*(_DWORD *)(a1 + 64));
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) error]);
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  id v5 = MBGetDefaultLog();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Finished task:%@, error:%@", buf, 0x16u);

    id v9 = *(void **)(a1 + 40);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
    _MBLog(@"INFO", (uint64_t)"Finished task:%@, error:%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  }

  [*(id *)(a1 + 48) idle];
  objc_autoreleasePoolPop(v2);
}

void sub_100011940()
{
}

void sub_100011968()
{
}

void sub_100011990()
{
  __assert_rtn( "+[MBFileSystemManager listSnapshotsForVolume:error:]",  "MBFileSystemManager.m",  505,  "p <= attrBuf + sizeof(attrBuf)");
}

void sub_1000119B8()
{
  __assert_rtn( "+[MBFileSystemManager listSnapshotsForVolume:error:]",  "MBFileSystemManager.m",  484,  "namePtr[nameLength - 1] == '\\0'");
}

void sub_1000119E0()
{
}

void sub_100011A08()
{
}

void sub_100011A30()
{
}

void sub_100011A58()
{
}

void sub_100011A80()
{
}

void sub_100011AA8()
{
}

void sub_100011AD0()
{
}

void sub_100011AF8()
{
}

void sub_100011B20()
{
}

void sub_100011B48()
{
}

void sub_100011B70()
{
}

void sub_100011B98()
{
}

void sub_100011BC0()
{
}

void sub_100011BE8()
{
}

void sub_100011C10()
{
}

void sub_100011C38()
{
}

void sub_100011C60()
{
}

void sub_100011C88()
{
}

void sub_100011CB0()
{
}

void sub_100011CD8()
{
}

void sub_100011D00()
{
}

void sub_100011D74()
{
}

void sub_100011DE8()
{
}

void sub_100011E5C()
{
}

void sub_100011ED0()
{
}

void sub_100011F44()
{
  __assert_rtn( "-[MBFileEncodingTask initWithType:encodingMethod:]",  "MBFileEncodingTask.m",  54,  "type != MBFileEncodingTypeUnspecified");
}

void sub_100011F6C()
{
  __assert_rtn( "-[MBFileEncodingTask initWithType:encodingMethod:]",  "MBFileEncodingTask.m",  55,  "encodingMethod != MBFileEncodingMethodUnspecified");
}

void sub_100011F94()
{
  __assert_rtn( "-[MBFileEncodingTask start]",  "MBFileEncodingTask.m",  108,  "type == MBFileEncodingTypeEncode || type == MBFileEncodingTypeDecode");
}

void sub_100011FBC()
{
}

void sub_100011FE4()
{
}

void sub_10001200C()
{
  __assert_rtn( "-[MBFileEncodingTask _compress]",  "MBFileEncodingTask.m",  249,  "self.encodingMethod != MBFileEncodingMethodUnspecified");
}

void sub_100012034()
{
  __assert_rtn( "-[MBFileEncodingTask _compress]",  "MBFileEncodingTask.m",  250,  "self.encodingMethod != MBFileEncodingMethodDefault");
}

void sub_10001205C()
{
}

void sub_100012084()
{
}

void sub_1000120AC()
{
}

void sub_1000120D4()
{
}

void sub_1000120FC()
{
  __assert_rtn( "-[MBFileEncodingTask _compress]",  "MBFileEncodingTask.m",  246,  "dstCompressionMethod != MBFileCompressionMethodUnspecified");
}

void sub_100012124()
{
  __assert_rtn( "-[MBFileEncodingTask _compress]",  "MBFileEncodingTask.m",  247,  "dstCompressionMethod != MBFileCompressionMethodDefault");
}

void sub_10001214C()
{
}

void sub_100012174()
{
}

void sub_10001219C()
{
}

void sub_1000121C4()
{
  __assert_rtn( "makeFileCompressionMethodFromCompressionAlgorithm",  "MBFileEncodingTask.m",  227,  "*compressionMethod != MBFileCompressionMethodUnspecified && *compressionMethod != MBFileCompressionMethodDefault");
}

void sub_1000121EC()
{
}

void sub_100012214()
{
}

void sub_10001223C()
{
  __assert_rtn( "-[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]",  "MBFileEncodingTask.m",  318,  "operation == COMPRESSION_STREAM_ENCODE || operation == COMPRESSION_STREAM_DECODE");
}

void sub_100012264()
{
}

void sub_10001228C()
{
}

void sub_1000122B4()
{
}

void sub_1000122DC()
{
  __assert_rtn( "-[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]",  "MBFileEncodingTask.m",  325,  "pc != MBProtectionClassUnspecified");
}

void sub_100012304()
{
}

void sub_10001232C()
{
  __assert_rtn( "handleCompressionOperation",  "MBFileEncodingTask.m",  461,  "stream.src_ptr == MAP_FAILED || (stream.src_ptr - srcBuffer) <= srcBufferSize");
}

void sub_100012354()
{
  __assert_rtn("handleCompressionOperation", "MBFileEncodingTask.m", 505, "stream.dst_ptr - dstBuffer <= dstBufferSize");
}

void sub_10001237C()
{
  __assert_rtn("handleCompressionOperation", "MBFileEncodingTask.m", 506, "stream.dst_size <= dstBufferSize");
}

void sub_1000123A4()
{
}

void sub_1000123CC()
{
}

void sub_1000123F4()
{
}

void sub_10001241C()
{
}

void sub_100012444()
{
  __assert_rtn( "-[MBFileEncodingTask _archive]",  "MBFileEncodingTask.m",  620,  "self.encodingMethod == MBFileEncodingMethodCompressedSQLiteText || self.encodingMethod == MBFileEncodingMethodCompre ssedSQLiteBinary");
}

void sub_10001246C()
{
  __assert_rtn( "-[MBFileEncodingTask _archive]",  "MBFileEncodingTask.m",  618,  "dstCompressionMethod != MBFileCompressionMethodUnspecified");
}

void sub_100012494()
{
  __assert_rtn( "-[MBFileEncodingTask _archive]",  "MBFileEncodingTask.m",  619,  "dstCompressionMethod != MBFileCompressionMethodDefault");
}

void sub_1000124BC()
{
}

void sub_1000124E4()
{
  __assert_rtn("-[MBFileEncodingTask _archive]", "MBFileEncodingTask.m", 594, "!pa || count == 1");
}

void sub_10001250C()
{
}

void sub_100012534()
{
}

void sub_10001255C()
{
  __assert_rtn("-[MBFileEncodingTask _unarchive]", "MBFileEncodingTask.m", 747, "!pa || count >= 1");
}

void sub_100012584()
{
}

void sub_1000125AC()
{
  __assert_rtn( "-[MBHelperService runEncodingTask:reply:]",  "MBHelperService.m",  27,  "task.compressionMethod != MBFileEncodingMethodUnspecified");
}

void sub_1000125D4()
{
  __assert_rtn("-[MBHelperService runEncodingTask:reply:]", "MBHelperService.m", 53, "dstFd == -1");
}

id objc_msgSend__createSnapshotForVolumeFd_volumeMountPoint_name_error_cancelationHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createSnapshotForVolumeFd:volumeMountPoint:name:error:cancelationHandler:");
}

id objc_msgSend_volumeMountPointForFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeMountPointForFile:error:");
}