id sub_100002F3C(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  int v11;
  char *v12;
  _BYTE *v13;
  void *v14;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  NSFileAttributeType v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  v5 = a1;
  v6 = [[RMECacheEnumerator alloc] initCacheEnumeratorWithVolume:v5];
  v7 = sub_10000A580(0, 0LL, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (a3) {
    *a3 = 0LL;
  }
  if (!v8 || ![v8 count]) {
    goto LABEL_8;
  }
  v10 = 0.75;
  v11 = (int)(float)(v10 * (float)(unint64_t)[v8 count]);
  v12 = (char *)[v8 count];
  v13 = [v8 count];
  if (v12 != (char *)v11)
  {
    v25 = a3;
    v26 = v6;
    v27 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 subarrayWithRange:v13 - &v12[-v11]]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v16)
    {
      v17 = v16;
      v18 = 0LL;
      v19 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v14);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v9 attributesOfItemAtPath:v21 error:0]);
          v23 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue([v22 fileType]);

          if (v23 == NSFileTypeDirectory) {
            v24 = sub_1000031F0(v21);
          }
          else {
            v24 = (uint64_t)[v22 fileSize];
          }
          v18 += v24;
        }

        v17 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }

      while (v17);
    }

    else
    {
      v18 = 0LL;
    }

    if (v25) {
      *v25 = v18;
    }
    v6 = v26;
    v5 = v27;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v33 = v18;
      v34 = 2112;
      v35 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Can purge %lu from %@",  buf,  0x16u);
    }
  }

  else
  {
LABEL_8:
    v14 = 0LL;
  }

  return v14;
}

uint64_t sub_1000031F0(void *a1)
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  id v1 = a1;
  if ((dirstat_np([v1 fileSystemRepresentation], 0, v6, 16) & 0x80000000) != 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v4 = __error();
    v5 = strerror(*v4);
    *(_DWORD *)buf = 138412546;
    id v8 = v1;
    __int16 v9 = 2080;
    v10 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Directory sizing for %@ failed with error %s",  buf,  0x16u);
  }

  uint64_t v2 = v6[0];

  return v2;
}

CFTypeRef sub_1000032D8(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v3,  @"CACHE_DELETE_VOLUME");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v5,  @"CACHE_DELETE_AMOUNT");

  CFTypeRef v6 = CFRetain(v4);
  return v6;
}

void sub_100003370()
{
  v3[0] = 0LL;
  v3[1] = v3;
  v3[2] = 0x3032000000LL;
  v3[3] = sub_100003470;
  v3[4] = sub_100003480;
  v4 = objc_alloc_init(&OBJC_CLASS___RMECacheDeleter);
  v1[4] = v3;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100003488;
  v2[3] = &unk_1000104D8;
  v2[4] = v3;
  v0[4] = v3;
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = sub_100003510;
  v1[3] = &unk_1000104D8;
  v0[0] = _NSConcreteStackBlock;
  v0[1] = 3221225472LL;
  v0[2] = sub_100003690;
  v0[3] = &unk_1000104D8;
  CacheDeleteRegisterInfoCallbacks(@"com.apple.ReportMemoryException.CacheDelete", v2, v1, &stru_100010518, v0);
  _Block_object_dispose(v3, 8);
}

void sub_100003458(_Unwind_Exception *a1)
{
}

uint64_t sub_100003470(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003480(uint64_t a1)
{
}

CFTypeRef sub_100003488(uint64_t a1, int a2, void *a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v8 = 0LL;
  id v5 = sub_100002F3C(v4, a2, &v8);
  CFTypeRef v6 = sub_1000032D8(v4, v8);

  return v6;
}

CFTypeRef sub_100003510(uint64_t a1, int a2, void *a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v19 = 0LL;
  id v5 = sub_100002F3C(v4, a2, &v19);
  CFTypeRef v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend( v7,  "removeItemAtPath:error:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)v12),  0,  (void)v15);
          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }

      while (v10);
    }
  }

  CFTypeRef v13 = sub_1000032D8(v4, v19);

  return v13;
}

CFTypeRef sub_100003690(uint64_t a1, uint64_t a2, void *a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    return 0LL;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  id v27 = [[RMECacheEnumerator alloc] initCacheEnumeratorWithVolume:v28];
  id v3 = sub_10000A580(0, 0LL, v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -345600.0));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Removing applicable files older than %{public}@",  buf,  0xCu);
  }

  CFTypeRef v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator", v4));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v36 objects:buf count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v37;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        CFTypeRef v13 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesOfItemAtPath:v12 error:0]);
        v14 = v13;
        if (v13)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 fileCreationDate]);
          id v16 = [v31 compare:v15];

          if (v16 == (id)-1LL)
          {

            goto LABEL_20;
          }

          [v30 addObject:v12];
          NSFileAttributeType v17 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue([v14 fileType]);

          if (v17 == NSFileTypeDirectory) {
            uint64_t v18 = sub_1000031F0(v12);
          }
          else {
            uint64_t v18 = (uint64_t)[v14 fileSize];
          }
          v9 += v18;
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v36 objects:buf count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

LABEL_20:
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v19 = v30;
  id v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        [v5 removeItemAtPath:*(void *)(*((void *)&v32 + 1) + 8 * (void)j) error:0];
      }

      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v21);
  }

  CFTypeRef v24 = sub_1000032D8(v28, v9);
  return v24;
}

id sub_100003B58(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v30 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesOfItemAtPath:v3 error:&v30]);
    id v6 = v30;

    BOOL v7 = v6 == 0LL;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
        *(_DWORD *)buf = 138412546;
        id v34 = v3;
        __int16 v35 = 2112;
        __int128 v36 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve file size for %@ with error: %@",  buf,  0x16u);
      }

      id v9 = 0LL;
    }

    else
    {
      id v9 = [v5 fileSize];
    }
  }

  else
  {
    id v9 = 0LL;
    BOOL v7 = 0LL;
  }

  v31[0] = @"execName";
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v29 = v10;
  if (!v10) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v28 = (void *)v10;
  v32[0] = v10;
  v31[1] = @"bundleID";
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v27 = v11;
  if (!v11) {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v32[1] = v11;
  v31[2] = @"exceptionType";
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  *(void *)(a1 + 56),  v11));
  v32[2] = v26;
  v31[3] = @"footprint";
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 64)));
  v32[3] = v25;
  v31[4] = @"footprintPeak";
  CFTypeRef v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 72)));
  v32[4] = v24;
  v31[5] = @"jetsamLimit";
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 80)));
  v32[5] = v12;
  v31[6] = @"memgraphAttempted";
  CFTypeRef v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 104)));
  v32[6] = v13;
  v31[7] = @"reasonMemgraphSkipped";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 88)));
  v32[7] = v14;
  v31[8] = @"memgraphSucceeded";
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 105)));
  v32[8] = v15;
  v31[9] = @"reasonMemgraphFailed";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 96)));
  v32[9] = v16;
  v31[10] = @"diagFileSizeSucceeded";
  NSFileAttributeType v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  v32[10] = v17;
  v31[11] = @"diagFileSize";
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v9));
  v32[11] = v18;
  v31[12] = @"isMSLEnabled";
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 106)));
  v32[12] = v19;
  v31[13] = @"isGcoreCapture";
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 107)));
  v32[13] = v20;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  14LL));

  if (!v27) {
  if (!v29)
  }

  return v21;
}

void sub_100003F54(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = a5;
  if (qword_100014680 != -1) {
    dispatch_once(&qword_100014680, &stru_100010560);
  }
  do
    int v12 = __ldaxr(&dword_100014678);
  while (__stlxr(v12 + 1, &dword_100014678));
  if (v12 >= 2)
  {
    if (v11)
    {
      CFTypeRef v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  13LL,  0LL));
      v11[2](v11, v13);
    }

    id v29 = 0LL;
    id v30 = 0LL;
    +[MemoryResourceException extractExecNameAndBundleIDMinimal:execNameOut:bundleIDOut:]( &OBJC_CLASS___MemoryResourceException,  "extractExecNameAndBundleIDMinimal:execNameOut:bundleIDOut:",  a1,  &v30,  &v29);
    id v14 = v30;
    id v15 = v29;
    LOWORD(v21) = 0;
    LOBYTE(v20) = 0;
    LOBYTE(v19) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:]( &OBJC_CLASS___RMETelemetry,  "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkip pedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:",  v14,  v15,  7LL,  0LL,  0LL,  0LL,  v19,  5LL,  v20,  0LL,  0LL,  v21);
    do
      unsigned int v16 = __ldaxr(&dword_100014678);
    while (__stlxr(v16 - 1, &dword_100014678));
    goto LABEL_15;
  }

  if (!mach_port_mod_refs(mach_task_self_, a1, 0, 1))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004200;
    block[3] = &unk_100010588;
    int v27 = a1;
    char v28 = a2;
    id v23 = (id)os_transaction_create("com.apple.ReportMemoryException");
    CFTypeRef v24 = (dispatch_queue_s *)v9;
    id v25 = v10;
    v26 = v11;
    id v14 = v23;
    dispatch_async(v24, block);

    id v15 = v23;
LABEL_15:

    goto LABEL_16;
  }

  NSFileAttributeType v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  3LL,  0LL));
  v11[2](v11, v17);

  do
    unsigned int v18 = __ldaxr(&dword_100014678);
  while (__stlxr(v18 - 1, &dword_100014678));
LABEL_16:
}

void sub_1000041D0(id a1)
{
  uint64_t v1 = sub_100008ED8(0LL);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_100014688;
  qword_100014688 = v2;
}

void sub_100004200(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 64);
  int v2 = *(unsigned __int8 *)(a1 + 68);
  id v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v159 = *(id *)(a1 + 32);
  v160 = v3;
  queue = v4;
  id v6 = v5;
  id v173 = 0LL;
  v163 = (void *)objc_claimAutoreleasedReturnValue( +[MemoryResourceException resourceExceptionFromTask:error:]( &OBJC_CLASS___MemoryResourceException,  "resourceExceptionFromTask:error:",  v1,  &v173));
  id v162 = v173;
  mach_port_deallocate(mach_task_self_, v1);
  if (!v163 || v162 || [v163 exceptionType] == (id)7)
  {
    if (v6) {
      v6[2](v6, v162);
    }
    goto LABEL_187;
  }

  id v7 = v163;
  if (qword_1000146A0 != -1) {
    dispatch_once(&qword_1000146A0, &stru_1000105F0);
  }
  id v8 = (void *)qword_100014698;
  if (qword_100014698 && os_signpost_enabled((os_log_t)qword_100014698))
  {
    loga = v8;
    v157 = (void *)objc_claimAutoreleasedReturnValue([v7 execName]);
    v154 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
    id v9 = [v7 exceptionType];
    id v150 = [v7 limitValue];
    id v148 = [v7 upTime];
    unsigned int v146 = [v7 pid];
    v144 = (void *)objc_claimAutoreleasedReturnValue([v7 coalitionBundleID]);
    id v142 = [v7 ledgerPhysFootprint];
    id v140 = [v7 ledgerPhysFootprintPeak];
    id v139 = [v7 ledgerInternal];
    id v137 = [v7 ledgerInternalCompressed];
    id v135 = [v7 ledgerAlternateAccounting];
    id v133 = [v7 ledgerAlternateAccountingCompressed];
    id v10 = [v7 ledgerIOKitMapped];
    id v11 = [v7 ledgerPageTable];
    id v12 = [v7 ledgerWiredMem];
    id v13 = [v7 ledgerPurgeableNonvolatile];
    id v14 = [v7 ledgerPurgeableNonvolatileCompressed];
    id v15 = [v7 ledgerNetworkNonvolatile];
    id v16 = [v7 ledgerNetworkNonvolatileCompressed];
    *(_DWORD *)buf = 138548226;
    *(void *)&uint8_t buf[4] = v157;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v154;
    *(_WORD *)&buf[22] = 2050;
    *(void *)&buf[24] = v9;
    *(_WORD *)v175 = 2050;
    *(void *)&v175[2] = v150;
    *(_WORD *)&v175[10] = 2050;
    *(void *)&v175[12] = v148;
    *(_WORD *)&v175[20] = 1026;
    *(_DWORD *)&v175[22] = v146;
    *(_WORD *)&v175[26] = 2114;
    *(void *)&v175[28] = v144;
    *(_WORD *)&v175[36] = 2050;
    *(void *)&v175[38] = v142;
    *(_WORD *)&v175[46] = 2050;
    id v176 = v140;
    __int16 v177 = 2050;
    id v178 = v139;
    __int16 v179 = 2050;
    id v180 = v137;
    __int16 v181 = 2050;
    id v182 = v135;
    __int16 v183 = 2050;
    id v184 = v133;
    __int16 v185 = 2050;
    id v186 = v10;
    __int16 v187 = 2050;
    id v188 = v11;
    __int16 v189 = 2050;
    id v190 = v12;
    __int16 v191 = 2050;
    id v192 = v13;
    __int16 v193 = 2050;
    id v194 = v14;
    __int16 v195 = 2050;
    id v196 = v15;
    __int16 v197 = 2050;
    id v198 = v16;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  loga,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CorpseReceived",  "execName=%{public,signpost.description:attribute}@ bundleID=%{public,signpost.description:attribute}@ exceptionTyp e=%{public,signpost.description:attribute}ld limitValue=%{public,signpost.description:attribute}llu upTime=%{publi c,signpost.description:attribute}lli pid=%{public,signpost.description:attribute}d coalitionBundleID=%{public,sign post.description:attribute}@ ledgerPhysFootprint=%{public,signpost.description:attribute}llu ledgerPhysFootprintPe ak=%{public,signpost.description:attribute}llu ledgerInternal=%{public,signpost.description:attribute}llu ledgerIn ternalCompressed=%{public,signpost.description:attribute}llu ledgerAlternateAccounting=%{public,signpost.descripti on:attribute}llu ledgerAlternateAccountingCompressed=%{public,signpost.description:attribute}llu ledgerIOKitMapped =%{public,signpost.description:attribute}llu ledgerPageTable=%{public,signpost.description:attribute}llu ledgerWir edMem=%{public,signpost.description:attribute}llu ledgerPurgeableNonvolatile=%{public,signpost.description:attribu te}llu ledgerPurgeableNonvolatileCompressed=%{public,signpost.description:attribute}llu ledgerNetworkNonvolatile=% {public,signpost.description:attribute}llu ledgerNetworkNonvolatileCompressed=%{public,signpost.description:attribute}llu ",  buf,  0xC6u);
  }

  v158 = (void *)objc_claimAutoreleasedReturnValue([v7 execName]);
  if (qword_1000146A8 - qword_1000146B0 >= (unint64_t)sub_1000060CC(v158))
  {
    [v7 releaseAnalyzedTask];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 execName]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
    id v23 = [v7 exceptionType];
    id v24 = [v7 ledgerPhysFootprint];
    id v25 = [v7 ledgerPhysFootprintPeak];
    id v26 = [v7 limitValue];
    unsigned __int8 v27 = [v7 isMSLEnabled];
    BYTE1(v112) = [v7 gcoreCapture];
    LOBYTE(v112) = v27;
    LOBYTE(v111) = 0;
    LOBYTE(v110) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:]( &OBJC_CLASS___RMETelemetry,  "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkip pedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:",  v21,  v22,  v23,  v24,  v25,  v26,  v110,  4LL,  v111,  0LL,  0LL,  v112);

    if (v6)
    {
      char v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  14LL,  0LL));
      v6[2](v6, v28);
    }

    goto LABEL_186;
  }

  unsigned int v147 = [v7 pid];
  if (([v7 isFirstParty] & 1) == 0 && (sub_100009F08() & 1) == 0)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([v7 execName]);
    v48 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
    id v49 = [v7 exceptionType];
    id v50 = [v7 ledgerPhysFootprint];
    id v51 = [v7 ledgerPhysFootprintPeak];
    id v52 = [v7 limitValue];
    unsigned __int8 v53 = [v7 isMSLEnabled];
    BYTE1(v112) = [v7 gcoreCapture];
    LOBYTE(v112) = v53;
    LOBYTE(v111) = 0;
    LOBYTE(v110) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:]( &OBJC_CLASS___RMETelemetry,  "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkip pedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:",  v47,  v48,  v49,  v50,  v51,  v52,  v110,  7LL,  v111,  0LL,  0LL,  v112);

    [v7 releaseAnalyzedTask];
    if (v6) {
      v6[2](v6, 0LL);
    }
    goto LABEL_186;
  }

  if (v2)
  {
    uint64_t v155 = 0LL;
    LOBYTE(v17) = 0;
    int v18 = 1;
    int v19 = 1;
    uint64_t v20 = v158;
    goto LABEL_170;
  }

  os_log_t log = (os_log_t)v7;
  unsigned int v120 = -[os_log_s pid](log, "pid");
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s execName](log, "execName"));
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s currentTime](log, "currentTime"));
  unsigned int v136 = -[os_log_s isMSLEnabled](log, "isMSLEnabled");
  v31 = (void *)qword_100014688;
  id v138 = -[os_log_s exceptionType](log, "exceptionType");
  id v151 = v31;
  id v32 = v29;
  id v156 = v30;
  LOBYTE(from) = 0;
  v143 = v32;
  if (!v32 || !v156 || !v151)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v120;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v156;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Insufficient data available to evaluation the available file quota. execname: %{public}@ [%d], date: %@",  buf,  0x1Cu);
    }

    id v44 = 0LL;
    int v45 = 0;
    int v17 = 0;
    BOOL v46 = 0;
    goto LABEL_155;
  }

  LOBYTE(location) = 0;
  int64_t v145 = sub_100009F74(v151, (uint64_t)v138, v32, &location, &from);
  v125 = (void *)objc_claimAutoreleasedReturnValue([v151 objectForKeyedSubscript:off_1000145E0[0]]);
  v124 = (void *)objc_claimAutoreleasedReturnValue([v151 objectForKeyedSubscript:off_1000145E8[0]]);
  v123 = (void *)objc_claimAutoreleasedReturnValue([v151 objectForKeyedSubscript:off_1000145F0[0]]);
  v121 = (void *)objc_claimAutoreleasedReturnValue([v151 objectForKeyedSubscript:off_100014600[0]]);
  v122 = (void *)objc_claimAutoreleasedReturnValue([v151 objectForKeyedSubscript:off_1000145F8[0]]);
  uint64_t v119 = sub_10000A4A0((uint64_t)v151);
  id v33 = [v125 integerValue];
  else {
    uint64_t v34 = (uint64_t)v33;
  }
  uint64_t v134 = v34;
  id v35 = [v124 integerValue];
  else {
    uint64_t v36 = (uint64_t)v35;
  }
  uint64_t v130 = v36;
  id v37 = [v123 integerValue];
  else {
    uint64_t v38 = (uint64_t)v37;
  }
  uint64_t v132 = v38;
  id v39 = [v122 integerValue];
  else {
    uint64_t v40 = (uint64_t)v39;
  }
  uint64_t v129 = v40;
  id v41 = [v121 integerValue];
  uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v131 = v42;
  if (!v134 && !v130 && !v42)
  {
    BOOL v43 = !v145 || location == 0;
    if (v43 && !v129)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "File limit set to 0. Skipping.",  buf,  2u);
      }

      id v44 = 0LL;
      int v45 = 0;
      int v17 = 0;
      BOOL v46 = 0;
      goto LABEL_154;
    }
  }

  v54 = (char *)[@".memgraph" length];
  id v149 = [[RMECacheEnumerator alloc] initCacheEnumerator];
  v55 = (void *)objc_claimAutoreleasedReturnValue([v149 nextValidURL]);
  if (!v55)
  {
    uint64_t v128 = 0LL;
    uint64_t v57 = 0LL;
    uint64_t v141 = 0LL;
    uint64_t v126 = 0LL;
    uint64_t v84 = 0LL;
    uint64_t v118 = 0LL;
    int64_t v56 = 0LL;
LABEL_116:
    if (v84 >= v131)
    {
      int v45 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_124;
      }
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v131;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v143;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v120;
      v85 = "The total lite diagnostic log limit of %ld has been exceeded in the last 24 hours. Skipping %{public}@ [%d]";
    }

    else
    {
      if (v118 < v119)
      {
        int v45 = 1;
LABEL_124:
        if (v136 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v134;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v57;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "MSL Enabled in Process: daily MSL memgraph limit = %ld, in the last 24 hours %li MSL memgraphs have been saved.",  buf,  0x16u);
        }

        if (v138 == (id)6)
        {
          if (v128 >= v129)
          {
            id v44 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"memgraph %@ limit of %ld has already been exceeded in the last 24 hours",  @"global",  v130));
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              *(void *)&uint8_t buf[4] = v129;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v143;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v120;
              v86 = "The total diagnostic threshold memgraph limit of %ld has been exceeded in the last 24 hours. Skippin"
                    "g %{public}@ [%d]";
LABEL_150:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v86,  buf,  0x1Cu);
              goto LABEL_151;
            }

            goto LABEL_151;
          }
        }

        else
        {
          unsigned int v87 = v136;
          if (v57 >= v134) {
            unsigned int v87 = 0;
          }
          if (v87 == 1)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "The MSL memgraph limit has NOT exceeded in the last 24 hours",  buf,  2u);
            }
          }

          else
          {
            if (!(_BYTE)location && v126 >= v130)
            {
              id v44 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"memgraph %@ limit of %ld has already been exceeded in the last 24 hours",  @"global",  v130));
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218498;
                *(void *)&uint8_t buf[4] = v130;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v143;
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = v120;
                v86 = "The total full diagnostic log limit of %ld has been exceeded in the last 24 hours. Skipping %{public}@ [%d]";
                goto LABEL_150;
              }

LABEL_151:
              int v17 = 0;
              goto LABEL_152;
            }

            if (v56 >= v145)
            {
              if ((_BYTE)location) {
                v88 = @"critical per process";
              }
              else {
                v88 = @"per process";
              }
              id v44 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"memgraph %@ limit of %ld has already been exceeded in the last 24 hours",  v88,  v145));
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_151;
              }
              *(_DWORD *)buf = 134218498;
              *(void *)&uint8_t buf[4] = v145;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v143;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v120;
              v86 = "The per process full diagnostic log limit of %ld has already been exceeded in the last 24 hours. Ski"
                    "pping %{public}@ [%d]";
              goto LABEL_150;
            }
          }
        }

        id v44 = 0LL;
        int v17 = 1;
LABEL_152:
        BOOL v46 = v141 < v132;
        goto LABEL_153;
      }

      int v45 = 0;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_124;
      }
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v119;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v143;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v120;
      v85 = "The per process lite diagnostic log limit of %ld has been exceeded in the last 24 hours. Skipping %{public}@ [%d]";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v85, buf, 0x1Cu);
    int v45 = 0;
    goto LABEL_124;
  }

  int64_t v56 = 0LL;
  uint64_t v118 = 0LL;
  uint64_t v126 = 0LL;
  uint64_t v127 = 0LL;
  uint64_t v141 = 0LL;
  uint64_t v57 = 0LL;
  uint64_t v128 = 0LL;
  v117 = v54 + 25;
  while (1)
  {
    if ((_BYTE)location) {
      BOOL v58 = v56 < v145;
    }
    else {
      BOOL v58 = 0;
    }
    if (!v58)
    {
      char v59 = v57 < v134 ? v136 : 0;
      BOOL v60 = v138 == (id)6 && v128 < v129;
      BOOL v61 = v60;
      if ((v59 & 1) == 0 && v126 >= v130 && v141 >= v132 && v127 >= v131 && !v61)
      {
LABEL_114:
        uint64_t v84 = v127;
        goto LABEL_116;
      }
    }

    v62 = objc_autoreleasePoolPush();
    block[0] = 0LL;
    [v55 getResourceValue:block forKey:NSURLCreationDateKey error:0];
    id v63 = block[0];
    v64 = v63;
    if (!v63) {
      goto LABEL_113;
    }
    if ([v63 compare:v156] == (id)1) {
      break;
    }
    [v156 timeIntervalSinceDate:v64];
    if (v65 <= 86400.0)
    {
      v171[0] = 0LL;
      [v55 getResourceValue:v171 forKey:NSURLNameKey error:0];
      id v66 = v171[0];
      if (v66)
      {
        v67 = v66;
        unsigned int v68 = [v66 containsString:off_100014628];
        if (v141 < v132) {
          uint64_t v69 = v68;
        }
        else {
          uint64_t v69 = 0LL;
        }
        v141 += v69;
        if ([v67 hasSuffix:@".memgraph"])
        {
          uint64_t v70 = MREExceptionTypeToString(6LL);
          v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
          unsigned int v72 = [v67 hasPrefix:v71];

          if (v72)
          {
            ++v128;
LABEL_112:

            goto LABEL_113;
          }

          unsigned int v78 = [v67 containsString:off_100014620[0]];
          unsigned int v79 = v78;
          if (v57 < v134) {
            unsigned int v80 = v78;
          }
          else {
            unsigned int v80 = 0;
          }
          if (v80 == 1)
          {
            ++v57;
            goto LABEL_112;
          }

          if (!(_BYTE)location)
          {
            if (v126 >= v130) {
              goto LABEL_112;
            }
            ++v126;
          }

          if (v145 == 0x7FFFFFFFFFFFFFFFLL || v56 >= v145) {
            goto LABEL_112;
          }
          uint64_t v81 = MREExceptionTypeToString(v138);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v81);
          if ([v67 hasPrefix:v74])
          {
            v116 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@_%@",  v74,  v143);
            NSUInteger v114 = -[NSString length](v116, "length");
            if (v79) {
              id v82 = -[__CFString length](off_100014620[0], "length");
            }
            else {
              id v82 = 0LL;
            }
            if ([v67 hasPrefix:v116]
              && [v67 length] == &v117[v114 + (void)v82])
            {
              ++v56;
            }
          }
        }

        else
        {
          if (v127 >= v131) {
            goto LABEL_112;
          }
          ++v127;
          if (v119 == 0x7FFFFFFFFFFFFFFFLL || v118 >= v119) {
            goto LABEL_112;
          }
          id v115 = [@".lite_diag" length];
          uint64_t v73 = MREExceptionTypeToString(v138);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
          if ([v67 hasPrefix:v74])
          {
            v75 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@_%@",  v74,  v143);
            v113 = -[NSString length](v75, "length");
            if ([v67 hasPrefix:v75])
            {
              v76 = (char *)[v67 length];
              uint64_t v77 = v118;
              if (v76 == &v113[(void)v115 + 25]) {
                uint64_t v77 = v118 + 1;
              }
              uint64_t v118 = v77;
            }
          }
        }

        goto LABEL_112;
      }

      v67 = 0LL;
      goto LABEL_112;
    }

LABEL_113:
    objc_autoreleasePoolPop(v62);
    uint64_t v83 = objc_claimAutoreleasedReturnValue([v149 nextValidURL]);

    v55 = (void *)v83;
    if (!v83) {
      goto LABEL_114;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v143;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v120;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "The system clock may be out of sync, and prevents us from determining available quota for a memgraph for %{public}@ [%d]",  buf,  0x12u);
  }

  objc_autoreleasePoolPop(v62);
  id v44 = 0LL;
  int v45 = 0;
  int v17 = 0;
  BOOL v46 = 0;
LABEL_153:

LABEL_154:
LABEL_155:

  id v89 = v44;
  if (v89) {
    -[os_log_s setMemgraphError:](log, "setMemgraphError:", v89);
  }

  if (!v17)
  {
    int v18 = 0;
    uint64_t v94 = 2LL;
    goto LABEL_167;
  }

  if (qword_1000146B8 != -1) {
    dispatch_once(&qword_1000146B8, &stru_100010660);
  }
  unint64_t v90 = dword_10001467C;
  if (!dword_10001467C
    || (id v91 = -[os_log_s limitValue](log, "limitValue"), v92 = (double)v90 * 0.75, v92 >= (double)(unint64_t)v91))
  {
    uint64_t v155 = 0LL;
    LOBYTE(v17) = 0;
    int v18 = 1;
    goto LABEL_168;
  }

  if (from | v46)
  {
    uint64_t v20 = v158;
    int v19 = v45;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v158;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v147;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Attempting memgraph generation for large process %{public}@ [%d].",  buf,  0x12u);
    }

    if (v46)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v158;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v147;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Will use gcore for large process collection %{public}@ [%d].",  buf,  0x12u);
      }

      uint64_t v155 = 0LL;
      int v18 = 1;
      LOBYTE(v17) = 1;
    }

    else
    {
      uint64_t v155 = 0LL;
      LOBYTE(v17) = 0;
      int v18 = 1;
    }
  }

  else
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"memgraph is larger than its limit of %dMB to generate",  (int)v92));
    -[os_log_s setMemgraphError:](log, "setMemgraphError:", v93);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v158;
      *(void *)&uint8_t buf[4] = v158;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v147;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Skipping memgraph generation for %{public}@ [%d] because it is too large. (gcoreDiagAllowed=%{BOOL}i)",  buf,  0x18u);
      int v18 = 0;
      LOBYTE(v17) = 0;
      uint64_t v155 = 3LL;
      goto LABEL_169;
    }

    int v18 = 0;
    LOBYTE(v17) = 0;
    uint64_t v94 = 3LL;
LABEL_167:
    uint64_t v155 = v94;
LABEL_168:
    uint64_t v20 = v158;
LABEL_169:
    int v19 = v45;
  }

LABEL_170:
  if (v19 | v18)
  {
    v171[0] = 0LL;
    v171[1] = v171;
    v171[2] = (id)0x2810000000LL;
    v171[3] = "";
    int v172 = 0;
    v95 = (void *)++qword_1000146A8;
    if (v6) {
      dispatch_qos_class_t v96 = QOS_CLASS_UTILITY;
    }
    else {
      dispatch_qos_class_t v96 = QOS_CLASS_BACKGROUND;
    }
    if ((v17 & 1) != 0)
    {
      uint64_t v97 = 300LL;
      goto LABEL_181;
    }

    if (v20 && (sub_100009608(v20) & 1) != 0)
    {
      uint64_t v97 = 120LL;
LABEL_181:
      qword_100014670 += v97;
    }

    else
    {
      uint64_t v97 = 60LL;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v97;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v147;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Using timeout of %llu seconds for process %@ [%d]",  buf,  0x1Cu);
    }

    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_1000061AC;
    *(void *)&buf[24] = &unk_100010618;
    id v104 = v7;
    *(void *)v175 = v104;
    *(void *)&v175[24] = v171;
    LOBYTE(v176) = v19;
    BYTE1(v176) = v18;
    BYTE2(v176) = v17;
    *(void *)&v175[32] = v97;
    *(void *)&v175[40] = v155;
    v105 = v6;
    *(void *)&v175[16] = v105;
    *(void *)&v175[8] = v159;
    v106 = objc_retainBlock(buf);
    dispatch_block_t v107 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, v96, 0, v106);

    dispatch_async(queue, v107);
    objc_initWeak(&location, v104);
    objc_initWeak(&from, v105);
    dispatch_time_t v108 = dispatch_time(0LL, 1000000000LL * v97);
    block[0] = _NSConcreteStackBlock;
    block[1] = (id)3221225472LL;
    block[2] = sub_1000070E4;
    block[3] = &unk_100010640;
    v166[1] = v95;
    objc_copyWeak(&v165, &location);
    objc_copyWeak(v166, &from);
    char v167 = v19;
    char v168 = v18;
    void block[4] = v171;
    v166[2] = (id)v97;
    v166[3] = (id)v155;
    dispatch_after(v108, v160, block);
    objc_destroyWeak(v166);
    objc_destroyWeak(&v165);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    _Block_object_dispose(v171, 8);
  }

  else
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue([v7 execName]);
    v99 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
    id v100 = [v7 exceptionType];
    id v101 = [v7 ledgerPhysFootprint];
    id v102 = [v7 ledgerPhysFootprintPeak];
    id v103 = [v7 limitValue];
    BYTE1(v112) = v155 == 3;
    LOBYTE(v112) = [v7 isMSLEnabled];
    LOBYTE(v111) = 0;
    LOBYTE(v110) = 0;
    +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:]( &OBJC_CLASS___RMETelemetry,  "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkip pedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:",  v98,  v99,  v100,  v101,  v102,  v103,  v110,  v155,  v111,  0LL,  0LL,  v112);

    [v7 releaseAnalyzedTask];
    if (v6) {
      v6[2](v6, 0LL);
    }
  }

LABEL_186:
LABEL_187:
  do
    unsigned int v109 = __ldaxr(&dword_100014678);
  while (__stlxr(v109 - 1, &dword_100014678));
}

void sub_1000059A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_1000059C4(mach_port_name_t a1, void *a2, int a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (qword_100014690 != -1) {
    dispatch_once(&qword_100014690, &stru_1000105A8);
  }
  do
    int v17 = __ldaxr(&dword_100014678);
  while (__stlxr(v17 + 1, &dword_100014678));
  if (v17 < 2)
  {
    if (mach_port_mod_refs(mach_task_self_, a1, 0, 1))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  3LL,  0LL));
      v16[2](v16, v20);

      do
        unsigned int v21 = __ldaxr(&dword_100014678);
      while (__stlxr(v21 - 1, &dword_100014678));
    }

    else
    {
      uint64_t v22 = (void *)os_transaction_create("com.apple.ReportMemoryException");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100005C2C;
      block[3] = &unk_1000105D0;
      mach_port_name_t v31 = a1;
      int v32 = a3;
      uint64_t v30 = a4;
      id v25 = v13;
      id v26 = v22;
      unsigned __int8 v27 = (dispatch_queue_s *)v14;
      id v28 = v15;
      id v29 = v16;
      id v23 = v22;
      dispatch_async(v27, block);
    }
  }

  else
  {
    if (v16)
    {
      int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  13LL,  0LL));
      v16[2](v16, v18);
    }

    do
      unsigned int v19 = __ldaxr(&dword_100014678);
    while (__stlxr(v19 - 1, &dword_100014678));
  }
}

void sub_100005BFC(id a1)
{
  uint64_t v1 = sub_100008ED8(0LL);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_100014688;
  qword_100014688 = v2;
}

void sub_100005C2C(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 80);
  int v2 = *(_DWORD *)(a1 + 84);
  id v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v6 = *(void **)(a1 + 64);
  id v7 = *(void **)(a1 + 72);
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = v4;
  id v11 = v5;
  id v12 = v6;
  if (qword_1000146F0 != -1) {
    dispatch_once(&qword_1000146F0, &stru_100010720);
  }
  id v43 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MemoryResourceException resourceExceptionFromTask:error:]( &OBJC_CLASS___MemoryResourceException,  "resourceExceptionFromTask:error:",  v1,  &v43));
  id v14 = v43;
  mach_port_deallocate(mach_task_self_, v1);
  if (!v13 || v14 || [v13 exceptionType] == (id)7)
  {
    if (v12) {
      v12[2](v12, v14);
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 execName]);
    if (qword_1000146A8 - qword_1000146B0 >= (unint64_t)sub_1000060CC(v15))
    {
      [v13 releaseAnalyzedTask];
      if (v12)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  14LL,  0LL));
        v12[2](v12, v23);
      }
    }

    else
    {
      mach_port_name_t v31 = v7;
      unsigned int v16 = [v13 pid];
      id v29 = (void *)++qword_1000146A8;
      if (v12) {
        int v17 = 17;
      }
      else {
        int v17 = 9;
      }
      dispatch_qos_class_t qos_class = v17;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "liteAnalysisMemgraphOnly";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2112;
        int v45 = v15;
        LOWORD(v46) = 1024;
        *(_DWORD *)((char *)&v46 + 2) = v16;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: Using timeout of %llu seconds for process %@ [%d]",  buf,  0x26u);
      }

      v41[0] = 0LL;
      v41[1] = v41;
      v41[2] = 0x2020000000LL;
      char v42 = 0;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_1000086E0;
      v34[3] = &unk_100010770;
      uint64_t v30 = v15;
      id v18 = v13;
      int v40 = v2;
      id v35 = v18;
      id v39 = v41;
      id v26 = v8;
      id v36 = v26;
      unsigned int v19 = v12;
      uint64_t v38 = v19;
      id v37 = v9;
      uint64_t v20 = objc_retainBlock(v34);
      dispatch_block_t v21 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, qos_class, 0, v20);
      *(void *)qos_classa = v8;
      uint64_t v22 = v21;

      dispatch_async(v11, v22);
      objc_initWeak(&location, v18);
      objc_initWeak(&from, v19);
      dispatch_time_t when = dispatch_time(0LL, 1000000000LL * (void)v31);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_100008A5C;
      int v45 = &unk_100010798;
      v49[1] = v29;
      v47 = v41;
      objc_copyWeak(&v48, &location);
      objc_copyWeak(v49, &from);
      id v46 = v26;
      v49[2] = v31;
      id v15 = v30;
      dispatch_after(when, v10, buf);

      objc_destroyWeak(v49);
      objc_destroyWeak(&v48);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      id v8 = *(id *)qos_classa;
      _Block_object_dispose(v41, 8);
    }
  }

  do
    unsigned int v24 = __ldaxr(&dword_100014678);
  while (__stlxr(v24 - 1, &dword_100014678));
}

void sub_10000609C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.ReportMemoryException", "MemoryResourceException");
  int v2 = (void *)qword_100014698;
  qword_100014698 = (uint64_t)v1;
}

uint64_t sub_1000060CC(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1 && sub_100009608(v1))
  {
    uint64_t v3 = 2LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109634;
      v5[1] = 1;
      __int16 v6 = 1024;
      int v7 = 2;
      __int16 v8 = 2114;
      id v9 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Bumping max bulk requests in flight from %d to %d for critical process %{public}@.",  (uint8_t *)v5,  0x18u);
    }
  }

  else
  {
    uint64_t v3 = 1LL;
  }

  return v3;
}

void sub_1000061AC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 48);
  int v2 = *(os_unfair_lock_s **)(*(void *)(a1 + 56) + 8LL);
  int v3 = *(unsigned __int8 *)(a1 + 80);
  int v4 = *(unsigned __int8 *)(a1 + 81);
  int v5 = *(unsigned __int8 *)(a1 + 82);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v92 = *(void *)(a1 + 72);
  id v7 = *(id *)(a1 + 32);
  uint64_t v94 = v1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 execName]);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v7 pid];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Begin analysis for %{public}@ [%d]",  buf,  0x12u);
  }

  sub_10000757C(v7);
  v93 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100014688 objectForKeyedSubscript:off_100014610[0]]);
  else {
    uint64_t v9 = 0LL;
  }
  [v7 _populateAddtionalMetadataWithOptions:v9 timeoutSecs:v6];
  dispatch_qos_class_t v96 = v7;
  if (!v5 && v3 && v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 execName]);
      unsigned int v11 = [v7 pid];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Attempting to save lite diagnostic before generating a memgraph for process %@ [%d]",  buf,  0x12u);
    }

    id v100 = 0LL;
    id v12 = sub_1000077AC(v7, 1, 0, &v100);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = v100;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v96 execName]);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Successfully saved initial lite diagnostic for process %@ at %@",  buf,  0x16u);
      }

      [v96 setLiteDiagFilePath:v13];
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v96 execName]);
      id v82 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v81;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v82;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to save initial lite diagnostic for process %@: %{public}@",  buf,  0x16u);
    }

    id v7 = v96;
  }

  unint64_t v99 = 0LL;
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v7 execName]);
  uint64_t v17 = 2LL;
  if (v16)
  {
    id v18 = (void *)v16;
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100014688 objectForKeyedSubscript:off_100014618[0]]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 execName]);
    unsigned int v21 = [v19 containsObject:v20];

    if (v21) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
  }

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v96 execName]);
      unsigned int v23 = [v96 pid];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v23;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Attempting to create a gcore for process %@ [%d]",  buf,  0x12u);
    }

    id v98 = 0LL;
    id v24 = v96;
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[RMECacheEnumerator getGcoreSpoolWithCreateIfNecessary:]( &OBJC_CLASS___RMECacheEnumerator,  "getGcoreSpoolWithCreateIfNecessary:",  1LL));
    id v26 = v25;
    if (v25)
    {
      unsigned __int8 v27 = sub_100008060(v25, &v98, @".core", v24);
      id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = v29;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to get gcore spool file path",  buf,  2u);
        }

        id v29 = 0LL;
        uint64_t v30 = 0LL;
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to get gcore spool directory",  buf,  2u);
      }

      v101[0] = NSLocalizedDescriptionKey;
      *(void *)buf = @"Failed to get gcore spool directory";
      id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v101,  1LL));
      uint64_t v30 = 0LL;
      id v98 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ReportMemoryExceptionError",  1LL,  v29));
    }

    id v31 = v98;
    if (!v30)
    {
      int v32 = v96;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        unsigned int v79 = (void *)objc_claimAutoreleasedReturnValue([v24 execName]);
        unsigned int v80 = [v24 pid];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v79;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v80;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v31;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to get filepath to save the gcore for  %@ [%d]: %@",  buf,  0x1Cu);
      }

      goto LABEL_57;
    }

    if (!qword_1000146D8)
    {
      *(_OWORD *)buf = off_1000106A0;
      *(void *)&buf[16] = 0LL;
      qword_1000146D8 = _sl_dlopen(buf, 0LL);
    }

    if (qword_1000146D8 && sub_1000083C8())
    {
      id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v34 = -[NSNumber initWithInt:]([NSNumber alloc], "initWithInt:", [v24 task]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v34, @"port");

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  &off_1000112C0,  @"pid");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"annotations");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v30, @"filename");
      id v35 = v33;
      id v36 = (uint64_t (*)(NSMutableDictionary *))sub_1000083C8();
      if (!v36)
      {
        uint64_t v83 = dlerror();
        abort_report_np("%s", v83);
      }

      int v37 = v36(v35);

      [v24 releaseAnalyzedTask];
      if (!v37)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v24 execName]);
          unsigned int v39 = [v24 pid];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v38;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v39;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v30;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Successfully created a gcore for %{public}@ [%d] at %@",  buf,  0x1Cu);
        }

        [v24 setGcoreCapture:1];
        [v24 setGcoreFilePath:v30];
        [v24 _generateMemgraphWithContentLevel:v17 timeoutSecs:v6 memgraphFailedReasonOut:&v99];
LABEL_53:
        int v32 = v96;
        id v42 = v30;
        unlink((const char *)[v42 UTF8String]);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v42;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Deleted gcore at %@",  buf,  0xCu);
        }

LABEL_57:
        goto LABEL_58;
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "GCoreFramework is not available, will not collect gcore",  buf,  2u);
      }

      [v24 releaseAnalyzedTask];
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = (void *)objc_claimAutoreleasedReturnValue([v24 execName]);
      unsigned int v41 = [v24 pid];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v40;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v41;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cannot create a gcore for %{public}@ [%d] ",  buf,  0x12u);
    }

    unint64_t v99 = 4LL;
    goto LABEL_53;
  }

  if (v4) {
    [v96 _generateMemgraphWithContentLevel:v17 timeoutSecs:v6 memgraphFailedReasonOut:&v99];
  }
  [v96 releaseAnalyzedTask];
  id v31 = 0LL;
  int v32 = v96;
LABEL_58:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v32 execName]);
    unsigned int v44 = [v32 pid];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v43;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v44;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Saving log file for %{public}@ [%d]",  buf,  0x12u);
  }

  os_unfair_lock_lock(v2 + 8);
  id v97 = v31;
  int v45 = sub_1000077AC(v32, v3 != 0, v4 != 0, &v97);
  uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
  id v47 = v97;

  os_unfair_lock_unlock(v2 + 8);
  BOOL v48 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  v95 = (void *)v46;
  id v91 = v47;
  if (v46)
  {
    if (v48)
    {
      id v49 = (void *)objc_claimAutoreleasedReturnValue([v32 execName]);
      unsigned int v50 = [v32 pid];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v49;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v50;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v95;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Memory Resource Exception log for %{public}@ [%d] saved at %{public}@",  buf,  0x1Cu);
    }

    int v51 = sub_100009E90();
    if (v4 && v51)
    {
      id v52 = v32;
      id v53 = v95;
      id v54 = objc_alloc_init(&OBJC_CLASS___SDRDiagnosticReporter);
      uint64_t v55 = MREExceptionTypeToString([v52 exceptionType]);
      int64_t v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      else {
        uint64_t v57 = &stru_100010E00;
      }
      BOOL v58 = (void *)objc_claimAutoreleasedReturnValue([v52 execName]);
      char v59 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"%llu",  [v52 limitValue]);
      BOOL v60 = (void *)objc_claimAutoreleasedReturnValue( [v54 signatureWithDomain:@"Performance" type:@"MemoryResourceException" subType:v56 subtypeContext:v57 detectedProcess:v58 triggerThresholdValues:v59]);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v60;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Symptoms Diagnostic Reporter signature created: %@",  buf,  0xCu);
      }

      BOOL v61 = (void *)objc_claimAutoreleasedReturnValue([v52 memoryGraph]);

      if (v61)
      {
        id v104 = v53;
        uint64_t v105 = kSymptomDiagnosticKeyPayloadPath;
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v104, 1LL));
        v106 = v62;
        id v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v106,  &v105,  1LL));
      }

      else
      {
        id v63 = 0LL;
      }

      int v32 = v96;
      id v66 = (void *)objc_claimAutoreleasedReturnValue([v52 cachedMetaDataDict]);

      if (!v66) {
        id v67 = [v52 createMetaDataDict];
      }
      unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue([v52 cachedMetaDataDict]);

      if (v68)
      {
        uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v52 cachedMetaDataDict]);
        id v103 = v69;
        unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v103, 1LL));
      }

      v101[0] = kSymptomDiagnosticActionLogArchive;
      v101[1] = kSymptomDiagnosticActionGetNetworkInfo;
      *(void *)buf = &__kCFBooleanFalse;
      *(void *)&buf[8] = &__kCFBooleanFalse;
      v101[2] = kSymptomDiagnosticActionCrashAndSpinLogs;
      v101[3] = kSymptomDiagnosticActionDiagnosticExtensions;
      *(void *)&buf[16] = &__kCFBooleanFalse;
      *(void *)&_BYTE buf[24] = &__kCFBooleanFalse;
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v101,  4LL));
      [v54 snapshotWithSignature:v60 duration:v68 events:v63 payload:v70 actions:&stru_100010700 reply:0.0];
    }
  }

  else
  {
    if (v48)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue([v32 execName]);
      unsigned int v65 = [v32 pid];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v64;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v65;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v47;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Memory Resource Exception log for %{public}@ [%d] could not be saved due to error: %@",  buf,  0x1Cu);
    }

    sub_100009E90();
  }

  id v89 = (void *)objc_claimAutoreleasedReturnValue([v32 execName]);
  unsigned int v87 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleID]);
  id v90 = [v32 exceptionType];
  id v88 = [v32 ledgerPhysFootprint];
  id v71 = [v32 ledgerPhysFootprintPeak];
  id v72 = [v32 limitValue];
  if (v4) {
    uint64_t v73 = 0LL;
  }
  else {
    uint64_t v73 = v92;
  }
  v74 = (void *)objc_claimAutoreleasedReturnValue([v32 memoryGraph]);
  v75 = (void *)objc_claimAutoreleasedReturnValue([v32 memoryGraph]);
  uint64_t v76 = 0LL;
  if (!v75)
  {
    if (v99 > 6) {
      uint64_t v76 = 3LL;
    }
    else {
      uint64_t v76 = qword_10000D9A0[v99];
    }
    int v32 = v96;
  }

  BOOL v77 = v4 != 0;
  unsigned __int8 v78 = [v32 isMSLEnabled];
  BYTE1(v86) = [v32 gcoreCapture];
  LOBYTE(v86) = v78;
  LOBYTE(v85) = v74 != 0LL;
  LOBYTE(v84) = v77;
  +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:]( &OBJC_CLASS___RMETelemetry,  "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippe dReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:",  v89,  v87,  v90,  v88,  v71,  v72,  v84,  v73,  v85,  v76,  v95,  v86);

  free((void *)qword_1000146C0);
  qword_1000146C0 = 0LL;
  qword_100014638 = (uint64_t)"Bulk analysis completed.";
  if (v94) {
    v94[2](v94, v91);
  }

  ++qword_1000146B0;
}

void sub_1000070E4(uint64_t a1)
{
  if ((unint64_t)qword_1000146B0 < *(void *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = objc_loadWeakRetained((id *)(a1 + 48));
    int v4 = *(os_unfair_lock_s **)(*(void *)(a1 + 32) + 8LL);
    int v5 = *(unsigned __int8 *)(a1 + 80);
    int v6 = *(unsigned __int8 *)(a1 + 81);
    __int16 v8 = *(void **)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    id v35 = WeakRetained;
    uint64_t v9 = (void (**)(id, void *))v3;
    if (v35)
    {
      id v10 = v4 + 8;
      os_unfair_lock_lock(v4 + 8);
      id v11 = [v35 copy];
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 memoryGraph]);

      if (!v12)
      {
        id v13 = v9;
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"memgraph analysis has timed out (timeout: %llu secs)",  v8));
        [v11 setMemgraphError:v14];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 execName]);
          *(_DWORD *)buf = 138543874;
          uint64_t v38 = v15;
          __int16 v39 = 1024;
          unsigned int v40 = [v11 pid];
          __int16 v41 = 2048;
          uint64_t v42 = (uint64_t)v8;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Begin timeout operations for %{public}@ [%d] (timeout: %llu secs)",  buf,  0x1Cu);
        }

        if (v6 | v5)
        {
          id v36 = 0LL;
          uint64_t v17 = sub_1000077AC(v11, v5 != 0, v6 != 0, &v36);
          uint64_t v34 = objc_claimAutoreleasedReturnValue(v17);
          id v16 = v36;
        }

        else
        {
          id v16 = 0LL;
          uint64_t v34 = 0LL;
        }

        if (v13)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  8LL,  0LL));
          v13[2](v13, v18);
        }

        BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v34)
        {
          if (v19)
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 execName]);
            unsigned int v23 = [v11 pid];
            *(_DWORD *)buf = 138543874;
            uint64_t v38 = v22;
            __int16 v39 = 1024;
            unsigned int v40 = v23;
            __int16 v41 = 2114;
            uint64_t v42 = v34;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Analysis of %{public}@ [%d] timed out. Saved out lite_diag: %{public}@. Self-destructing.",  buf,  0x1Cu);
          }
        }

        else if (v19)
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 execName]);
          unsigned int v21 = [v11 pid];
          *(_DWORD *)buf = 138543874;
          uint64_t v38 = v20;
          __int16 v39 = 1024;
          unsigned int v40 = v21;
          __int16 v41 = 2112;
          uint64_t v42 = (uint64_t)v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Analysis of %{public}@ [%d] timed out. Failed to save out lite_diag due to error: %@",  buf,  0x1Cu);
        }

        id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 execName]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
        id v26 = [v11 exceptionType];
        id v27 = [v11 ledgerPhysFootprint];
        id v28 = [v11 ledgerPhysFootprintPeak];
        id v29 = [v11 limitValue];
        unsigned __int8 v30 = [v11 isMSLEnabled];
        BYTE1(v33) = [v35 gcoreCapture];
        LOBYTE(v33) = v30;
        LOBYTE(v32) = 0;
        LOBYTE(v31) = v7 == 0;
        +[RMETelemetry emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraphSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:]( &OBJC_CLASS___RMETelemetry,  "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgraph SkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:",  v24,  v25,  v26,  v27,  v28,  v29,  v31,  v7,  v32,  2LL,  v34,  v33);

        _exit(-1);
      }

      os_unfair_lock_unlock(v10);
    }
  }
}

void sub_100007530(id a1)
{
  size_t v1 = 4LL;
  if (sysctlbyname("kern.max_task_pmem", &dword_10001467C, &v1, 0LL, 0LL)) {
    dword_10001467C = 0;
  }
}

void sub_10000757C(void *a1)
{
  id v1 = a1;
  unsigned int v21 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v1 execName]);
  int v2 = (void *)objc_claimAutoreleasedReturnValue([v1 bundleID]);
  id v19 = [v1 exceptionType];
  id v18 = [v1 ledgerPhysFootprint];
  id v17 = [v1 ledgerInternal];
  id v3 = [v1 ledgerInternalCompressed];
  id v4 = [v1 ledgerAlternateAccounting];
  id v5 = [v1 ledgerAlternateAccountingCompressed];
  id v6 = [v1 ledgerIOKitMapped];
  id v7 = [v1 ledgerPageTable];
  id v8 = [v1 ledgerWiredMem];
  id v9 = [v1 ledgerPurgeableNonvolatile];
  id v10 = [v1 ledgerPurgeableNonvolatileCompressed];

  id v11 = -[NSString initWithFormat:]( v21,  "initWithFormat:",  @"execName=%@, bundleId=%@, excType=%ld, physFootprint=%llu, internal=%llu, internalComp=%llu, alt=%llu, altComp=%llu, iokit=%llu, pageTable=%llu, wired=%llu, purgNonvol=%llu, purgNonvolComp=%llu",  v20,  v2,  v19,  v18,  v17,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10);
  id v12 = v11;
  id v13 = -[NSString UTF8String](v12, "UTF8String");
  if (v13)
  {
    id v14 = v13;
    free((void *)qword_1000146C0);
    id v15 = strdup(v14);
    qword_1000146C0 = (uint64_t)v15;
    if (v15)
    {
      qword_100014638 = (uint64_t)v15;
    }

    else
    {
      int v16 = *__error();
      qword_100014638 = (uint64_t)"Bulk analysis in flight. Unable to format corpse info.";
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v23 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to copy string for CrashReporterInfo: %{darwin.errno}d",  buf,  8u);
      }
    }
  }

  else
  {
    qword_100014638 = (uint64_t)"Bulk analysis in flight. Unable to format corpse info.";
  }
}

NSString *sub_1000077AC(void *a1, char a2, int a3, void *a4)
{
  id v8 = a1;
  if (a3) {
    id v9 = @".memgraph";
  }
  else {
    id v9 = @".lite_diag";
  }
  if ((a2 & 1) != 0 || (a3 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[RMECacheEnumerator getLogContainer:](&OBJC_CLASS___RMECacheEnumerator, "getLogContainer:", 1LL));
    id v13 = v12;
    if (!v12)
    {
      if (!a4)
      {
        id v10 = 0LL;
        goto LABEL_29;
      }

      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      *(void *)buf = @"Failed to get log container";
      id v19 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v47,  1LL));
      id v10 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ReportMemoryExceptionError",  1LL,  v19));
LABEL_28:

LABEL_29:
      int v23 = -[NSFileHandle initWithFileDescriptor:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:",  v4);
      if (v23)
      {
        id v24 = [v8 _saveLogFileWithHandle:v23 error:a4];
        -[NSFileHandle closeFile](v23, "closeFile");
        if (v24 != (id)2)
        {
          if (v24 == (id)1 && -[__CFString isEqualToString:](v9, "isEqualToString:", @".memgraph"))
          {
            BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if ((a2 & 1) == 0)
            {
              if (v25)
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v10;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Attempted to save out memgraph, but no memgraph data could be written to file. Now attempting to delet e invalid memgraph, since we don't have quota remaining for lite diags: %{public}@",  buf,  0xCu);
              }

              else {
                id v36 = v10;
              }
              uint64_t v34 = v36;
              goto LABEL_50;
            }

            if (v25)
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v10;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Attempted to save out memgraph, but no memgraph data could be written to file. Changing to lite diag: %{public}@",  buf,  0xCu);
            }

            id v26 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSString stringByReplacingOccurrencesOfString:withString:]( v10,  "stringByReplacingOccurrencesOfString:withString:",  @".memgraph",  @".lite_diag"));
            id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            unsigned __int8 v28 = [v27 moveItemAtPath:v10 toPath:v26 error:0];

            if ((v28 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v10;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not rename invalid memgraph to lite_diag. Attempting to delete: %{public}@",  buf,  0xCu);
              }

              else {
                int v37 = v10;
              }
              id v11 = v37;

              goto LABEL_51;
            }

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v10;
              __int16 v41 = 2114;
              uint64_t v42 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Successfully renamed invalid memgraph to lite_diag. %{public}@ -> %{public}@",  buf,  0x16u);
            }
          }

          else
          {
            id v26 = v10;
          }

          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 liteDiagFilePath]);

          if (v31 && a3)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v8 liteDiagFilePath]);
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v32;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Deleting initial lite diagnostic so we don't have 2 diagnostics on-device: %{public}@",  buf,  0xCu);
            }

            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v8 liteDiagFilePath]);
            sub_100007F04(v33);

            [v8 setLiteDiagFilePath:0];
          }

          uint64_t v34 = v26;
          id v10 = v34;
LABEL_50:
          id v11 = v34;
          goto LABEL_51;
        }
      }

      else
      {
        close(v4);
        if (a4)
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create file handle from fd: %d",  v4));
          NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
          unsigned int v44 = v29;
          unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ReportMemoryExceptionError",  1LL,  v30));
        }
      }

      id v11 = 0LL;
LABEL_51:

      goto LABEL_52;
    }

    id v14 = sub_100008060(v12, a4, v9, v8);
    id v15 = objc_claimAutoreleasedReturnValue(v14);
    int v16 = strdup((const char *)[v15 UTF8String]);
    if (v16)
    {
      id v17 = v16;
      id v38 = v15;
      id v39 = v8;
      uint64_t v4 = mkstemps(v16, (int)-[__CFString length](v9, "length"));
      uint64_t v18 = *__error();
      id v19 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v17);
      free(v17);
      if ((_DWORD)v4 == -1)
      {
        if (a4)
        {
          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create file (errno: %d)",  v18));
          uint64_t v4 = (uint64_t)&OBJC_CLASS___NSError;
          NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
          *(void *)buf = v21;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v47,  1LL));
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ReportMemoryExceptionError",  1LL,  v22));
        }

        id v10 = 0LL;
        goto LABEL_22;
      }

      if ((sub_100008DB8(v19, v4, (uint64_t)a4) & 1) != 0)
      {
        id v19 = v19;
        id v10 = v19;
LABEL_22:
        id v15 = v38;
        id v8 = v39;
LABEL_27:

        goto LABEL_28;
      }

      close(v4);
      id v15 = v38;
      if (a4)
      {
        NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
        *(void *)buf = @"Failed to set proper permissions";
        uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v47,  1LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ReportMemoryExceptionError",  1LL,  v4));
      }
    }

    else
    {
      if (a4)
      {
        NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
        *(void *)buf = @"Failed to create file name C string";
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v47,  1LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ReportMemoryExceptionError",  1LL,  v20));
      }

      id v19 = 0LL;
    }

    id v10 = 0LL;
    goto LABEL_27;
  }

  if (a4)
  {
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    uint64_t v46 = @"Quotas for both lite and full diags unavailable";
    id v10 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    id v11 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ReportMemoryExceptionError",  1LL,  v10));
LABEL_52:

    goto LABEL_53;
  }

  id v11 = 0LL;
LABEL_53:

  return v11;
}

id sub_100007F04(void *a1)
{
  id v1 = a1;
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = 0LL;
  id v3 = [v2 removeItemAtPath:v1 error:&v7];
  id v4 = v7;

  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v1;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Successfully deleted %{public}@",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    *(_DWORD *)buf = 138543618;
    id v9 = v1;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to delete %{public}@ due to error %@",  buf,  0x16u);
  }

  return v3;
}

NSString *sub_100008060(void *a1, void *a2, void *a3, void *a4)
{
  id v6 = a1;
  id v28 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 execName]);

  if (v8) {
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 execName]);
  }
  else {
    id v9 = @"UNKNOWN_PROCESS";
  }
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 currentTime]);
  if (v10 || (__int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"))) != 0LL)
  {
    if (qword_1000146D0 != -1) {
      dispatch_once(&qword_1000146D0, &stru_100010680);
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000146C8 components:252 fromDate:v10]);
  }

  else
  {
    id v11 = 0LL;
  }

  uint64_t v12 = MREExceptionTypeToString([v7 exceptionType]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  unsigned int v14 = [v7 isMSLEnabled];
  id v15 = off_100014620[0];
  if (!v14) {
    id v15 = &stru_100010E00;
  }
  int v16 = v15;
  unsigned int v17 = [v7 gcoreCapture];
  uint64_t v18 = off_100014628;
  if (!v17) {
    uint64_t v18 = &stru_100010E00;
  }
  id v19 = v18;
  uint64_t v20 = objc_alloc(&OBJC_CLASS___NSString);
  if (v11)
  {
    unsigned int v21 = v16;
    uint64_t v22 = -[NSString initWithFormat:]( v20,  "initWithFormat:",  @"%@/%@%@%@_%@_%04ld-%02ld-%02ld_%02ld%02ld%02ld.XXXXXX%@",  v6,  v13,  v19,  v16,  v9,  [v11 year],  objc_msgSend(v11, "month"),  objc_msgSend(v11, "day"),  objc_msgSend(v11, "hour"),  objc_msgSend(v11, "minute"),  objc_msgSend(v11, "second"),  v28);
    if (v22)
    {
LABEL_15:
      int v23 = v22;
      id v24 = v7;
      goto LABEL_19;
    }
  }

  else
  {
    uint64_t v22 = -[NSString initWithFormat:]( v20,  "initWithFormat:",  @"%@/%@%@%@_%@.XXXXXX%@",  v6,  v13,  v19,  v16,  v9,  v28);
    unsigned int v21 = v16;
    if (v22) {
      goto LABEL_15;
    }
  }

  id v24 = v7;
  if (a2)
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    unsigned __int8 v30 = @"Failed to create file name NSString";
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ReportMemoryExceptionError",  1LL,  v25));
  }

LABEL_19:
  return v22;
}

void sub_100008390(id a1)
{
  id v1 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  int v2 = (void *)qword_1000146C8;
  qword_1000146C8 = (uint64_t)v1;
}

uint64_t sub_1000083C8()
{
  uint64_t v3 = 0LL;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = qword_1000146E0;
  uint64_t v6 = qword_1000146E0;
  if (!qword_1000146E0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_100008474;
    v2[3] = &unk_1000106C0;
    v2[4] = &v3;
    sub_100008474((uint64_t)v2);
    uint64_t v0 = v4[3];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000845C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *sub_100008474(uint64_t a1)
{
  uint64_t v5 = 0LL;
  if (!qword_1000146D8)
  {
    __int128 v6 = off_1000106A0;
    uint64_t v7 = 0LL;
    qword_1000146D8 = _sl_dlopen(&v6, &v5);
    uint64_t v3 = v5;
    int v2 = (void *)qword_1000146D8;
    if (qword_1000146D8)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      uint64_t v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  int v2 = (void *)qword_1000146D8;
LABEL_5:
  result = dlsym(v2, "create_gcore_with_options");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_1000146E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100008564(id a1, NSDictionary *a2)
{
  int v2 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2,  "objectForKeyedSubscript:",  kSymptomDiagnosticReplySuccess));
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2,  "objectForKeyedSubscript:",  kSymptomDiagnosticReplySessionID));
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }

    int v7 = 138412290;
    id v8 = v5;
    __int128 v6 = "Symptoms Diagnostic Reporter accepted the memory resource exception. SessionID: %@";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
    goto LABEL_7;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v2,  "objectForKeyedSubscript:",  kSymptomDiagnosticReplyReason));
    int v7 = 138412290;
    id v8 = v5;
    __int128 v6 = "Symptoms Diagnostic Reporter rejected the memory resource exception with reason %@.";
    goto LABEL_6;
  }

LABEL_8:
}

void sub_1000086B4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ReportMemoryException.saveMemgraph", 0LL);
  int v2 = (void *)qword_1000146E8;
  qword_1000146E8 = (uint64_t)v1;
}

void sub_1000086E0(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 72);
  id v3 = *(id *)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 execName]);
    *(_DWORD *)buf = 136315650;
    unsigned int v14 = "bulkAnalysisMemgraphOnly";
    __int16 v15 = 2114;
    int v16 = v4;
    __int16 v17 = 1024;
    unsigned int v18 = [v3 pid];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: Begin analysis for %{public}@ [%d]",  buf,  0x1Cu);
  }

  sub_10000757C(v3);
  unsigned __int8 v5 = [v3 generateMemoryGraphWithContentLevel:v2 memgraphFailedReasonOut:0];
  [v3 releaseAnalyzedTask];
  free((void *)qword_1000146C0);
  qword_1000146C0 = 0LL;
  qword_100014638 = (uint64_t)"Bulk analysis completed.";

  ++qword_1000146B0;
  __int128 v6 = (dispatch_queue_s *)qword_1000146E8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000088AC;
  block[3] = &unk_100010748;
  uint64_t v11 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 32);
  unsigned __int8 v12 = v5;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  dispatch_sync(v6, block);
}

void sub_1000088AC(uint64_t a1)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    int v1 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v2 = *(void **)(a1 + 40);
    id v3 = *(void **)(a1 + 48);
    id v4 = *(id *)(a1 + 32);
    id v5 = v2;
    __int128 v6 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 execName]);
      *(_DWORD *)id v10 = 136315650;
      *(void *)&v10[4] = "saveMemgraphOnly";
      __int16 v11 = 2114;
      unsigned __int8 v12 = v7;
      __int16 v13 = 1024;
      unsigned int v14 = [v4 pid];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: Saving log file for %{public}@ [%d]",  v10,  0x1Cu);
    }

    sub_10000757C(v4);
    if (v1)
    {
      *(void *)id v10 = 0LL;
      [v4 _saveLogFileWithHandle:v5 error:v10];
      id v8 = *(id *)v10;
    }

    else
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  4LL,  0LL));
    }

    id v9 = v8;
    free((void *)qword_1000146C0);
    qword_1000146C0 = 0LL;
    qword_100014638 = (uint64_t)"Bulk analysis completed.";
    if (v6) {
      v6[2](v6, v9);
    }
  }

void sub_100008A5C(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)qword_1000146E8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_100008B28;
  v6[3] = &unk_100010798;
  uint64_t v3 = *(void *)(a1 + 40);
  v10[1] = *(id *)(a1 + 64);
  uint64_t v8 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(v10, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 32);
  id v5 = *(void **)(a1 + 72);
  id v7 = v4;
  v10[2] = v5;
  dispatch_sync(v2, v6);

  objc_destroyWeak(v10);
  objc_destroyWeak(&v9);
}

void sub_100008B28(uint64_t a1)
{
  if ((unint64_t)qword_1000146B0 < *(void *)(a1 + 64))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v3 = objc_loadWeakRetained((id *)(a1 + 56));
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 72);
    id v6 = WeakRetained;
    id v7 = v4;
    uint64_t v8 = (void (**)(id, void *))v3;
    if (v6)
    {
      id v9 = [v6 copy];
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 memoryGraph]);

      if (!v10)
      {
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"memgraph-only analysis has timed out (timeout: %llu secs)",  v5));
        [v6 setMemgraphError:v11];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 execName]);
          *(_DWORD *)buf = 136315906;
          __int16 v17 = "bulkAnalysisMemgraphOnlyTimeout";
          __int16 v18 = 2114;
          id v19 = v12;
          __int16 v20 = 1024;
          unsigned int v21 = [v6 pid];
          __int16 v22 = 2048;
          uint64_t v23 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: Begin timeout memgraph-only operations for %{public}@ [%d] (timeout: %llu secs)",  buf,  0x26u);
        }

        [v7 closeFile];
        if (v8)
        {
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  8LL,  0LL));
          v8[2](v8, v13);
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 execName]);
          unsigned int v15 = [v9 pid];
          *(_DWORD *)buf = 136315650;
          __int16 v17 = "bulkAnalysisMemgraphOnlyTimeout";
          __int16 v18 = 2114;
          id v19 = v14;
          __int16 v20 = 1024;
          unsigned int v21 = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: Memgraph-only analysis of %{public}@ [%d] timed out.",  buf,  0x1Cu);
        }
      }
    }
  }

id sub_100008DB8(void *a1, uint64_t a2, uint64_t a3)
{
  NSFileAttributeKey v9 = NSFileProtectionKey;
  NSFileProtectionType v10 = NSFileProtectionNone;
  id v4 = a1;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = [v6 setAttributes:v5 ofItemAtPath:v4 error:a3];

  return v7;
}

id sub_100008E94()
{
  uint64_t v0 = sub_100008ED8(0LL);
  int v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:off_100014608[0]]);

  return v2;
}

NSMutableDictionary *sub_100008ED8(__CFString *a1)
{
  int v1 = @"/Library/Managed Preferences/mobile/com.apple.ReportMemoryException.plist";
  if (a1) {
    int v1 = a1;
  }
  uint64_t v2 = v1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v4 = [v3 fileExistsAtPath:v2];
  if (v4) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = v5;

  id v7 = 0LL;
  if (v4) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v2));
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RMECacheEnumerator getEPLProfilePath](&OBJC_CLASS___RMECacheEnumerator, "getEPLProfilePath"));
  uint64_t v76 = v6;
  if (v8)
  {
    NSFileAttributeKey v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    else {
      NSFileProtectionType v10 = 0LL;
    }
    id v11 = v10;

    if (v11) {
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v11));
    }
    else {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  id v75 = v7;
  id v74 = v11;
  unsigned __int8 v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v78 = 0LL;
  uint64_t v79 = 0LL;
  uint64_t v77 = 0LL;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.ReportMemoryException");
  if (has_internal_diagnostics)
  {
    uint64_t v77 = 10LL;
    unsigned int v14 = &v79;
    unsigned int v15 = &v78;
    uint64_t v16 = 12LL;
    uint64_t v17 = 2LL;
    uint64_t v18 = 1LL;
    uint64_t v19 = 120LL;
    uint64_t v20 = 30LL;
  }

  else
  {
    uint64_t v20 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v78 = 0LL;
    unsigned int v14 = &v77;
    unsigned int v15 = &v79;
  }

  uint64_t v21 = has_internal_diagnostics ^ 1u;
  *unsigned int v15 = 0LL;
  uint64_t *v14 = 0LL;
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v20));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v22, off_1000145E8[0]);

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v79));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v23, off_1000145F0[0]);

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v19));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v24, off_100014600[0]);

  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v25,  @"PerProcessLimit");

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v26,  @"LitePerProcessLimit");

  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v27,  @"PerCriticalProcessLimit");

  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v78));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v28, off_1000145E0[0]);

  NSErrorUserInfoKey v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v77));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v29, off_1000145F8[0]);

  unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v30,  @"ProcessSpecificFullDiagQuotas");

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v31,  @"AllowAllProcessesInSysdiagnose");

  uint64_t v32 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", &off_1000112F0);
  if (-[NSMutableSet count](v32, "count")) {
    uint64_t v33 = (NSMutableSet *)-[NSMutableSet mutableCopy](v32, "mutableCopy");
  }
  else {
    uint64_t v33 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }
  uint64_t v34 = v33;
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v33,  @"ProcessesAllowedInSysdiagnose");

  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v35,  @"LargeExemptedProcesses");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v32, off_100014608[0]);
  id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v36, off_100014610[0]);

  int v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v37, off_100014618[0]);

  id v38 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v40 = -[NSMutableDictionary initWithObjectsAndKeys:](v38, "initWithObjectsAndKeys:", v39, @"ExecNameList", 0LL);
  uint64_t v41 = MREExceptionTypeToString(2LL);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v40, v42);

  NSErrorUserInfoKey v43 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  NSErrorUserInfoKey v45 = -[NSMutableDictionary initWithObjectsAndKeys:](v43, "initWithObjectsAndKeys:", v44, @"ExecNameList", 0LL);
  uint64_t v46 = MREExceptionTypeToString(3LL);
  NSErrorUserInfoKey v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v45, v47);

  BOOL v48 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v50 = -[NSMutableDictionary initWithObjectsAndKeys:](v48, "initWithObjectsAndKeys:", v49, @"ExecNameList", 0LL);
  uint64_t v51 = MREExceptionTypeToString(4LL);
  id v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v50, v52);

  id v53 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v54 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v55 = -[NSMutableDictionary initWithObjectsAndKeys:](v53, "initWithObjectsAndKeys:", v54, @"ExecNameList", 0LL);
  uint64_t v56 = MREExceptionTypeToString(5LL);
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v55, v57);

  BOOL v58 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  char v59 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  BOOL v60 = -[NSMutableDictionary initWithObjectsAndKeys:](v58, "initWithObjectsAndKeys:", v59, @"ExecNameList", 0LL);
  uint64_t v61 = MREExceptionTypeToString(1LL);
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v60, v62);

  id v63 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v64 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v65 = -[NSMutableDictionary initWithObjectsAndKeys:](v63, "initWithObjectsAndKeys:", v64, @"ExecNameList", 0LL);
  uint64_t v66 = MREExceptionTypeToString(6LL);
  id v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v65, v67);

  unsigned int v68 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v69 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v70 = -[NSMutableDictionary initWithObjectsAndKeys:](v68, "initWithObjectsAndKeys:", v69, @"ExecNameList", 0LL);
  uint64_t v71 = MREExceptionTypeToString(0LL);
  id v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v70, v72);

  if (v74) {
    sub_100009654(v12, v74);
  }
  if (v75) {
    sub_100009654(v12, v75);
  }

  return v12;
}

id sub_100009608(void *a1)
{
  id v1 = a1;
  id v2 = sub_100008E94();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 containsObject:v1];

  return v4;
}

void sub_100009654(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = &AnalyticsSendEventLazy_ptr;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ExpirationDate"]);
    if (!v7)
    {
LABEL_5:
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
      id v12 = [v11 countByEnumeratingWithState:&v63 objects:v73 count:16];
      if (!v12) {
        goto LABEL_77;
      }
      id v13 = v12;
      uint64_t v14 = *(void *)v64;
      id v53 = v3;
      while (1)
      {
        unsigned int v15 = 0LL;
        do
        {
          if (*(void *)v64 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)v15);
          if ((objc_msgSend(v16, "isEqualToString:", off_1000145E8[0], v51) & 1) != 0
            || ([v16 isEqualToString:off_1000145F0[0]] & 1) != 0
            || ([v16 isEqualToString:off_1000145E0[0]] & 1) != 0
            || ([v16 isEqualToString:off_1000145F8[0]] & 1) != 0
            || ([v16 isEqualToString:off_100014600[0]] & 1) != 0
            || ([v16 isEqualToString:@"PerProcessLimit"] & 1) != 0
            || ([v16 isEqualToString:@"LitePerProcessLimit"] & 1) != 0
            || ([v16 isEqualToString:@"PerCriticalProcessLimit"] & 1) != 0
            || [v16 isEqualToString:@"AllowAllProcessesInSysdiagnose"])
          {
            id v17 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v16]);
            if (v17)
            {
              uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0
                && (unint64_t)[v17 integerValue] + 1 <= 0x2711)
              {
                [v3 setObject:v17 forKeyedSubscript:v16];
              }
            }
          }

          else if ([v16 isEqualToString:@"ProcessSpecificFullDiagQuotas"])
          {
            id v17 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v16]);
            if (v17)
            {
              uint64_t v19 = objc_opt_class(v5[17]);
              if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
              {
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v16]);
                uint64_t v21 = v11;
                __int16 v22 = v5;
                uint64_t v23 = v20;
                sub_10000AC24(v20, v17);

                uint64_t v5 = v22;
                id v11 = v21;
              }
            }
          }

          else if (([v16 isEqualToString:@"LargeExemptedProcesses"] & 1) != 0 {
                 || ([v16 isEqualToString:off_100014618[0]] & 1) != 0
          }
                 || [v16 isEqualToString:off_100014608[0]])
          {
            id v17 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v16]);
            if (v17)
            {
              uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSArray);
              if ((objc_opt_isKindOfClass(v17, v24) & 1) != 0)
              {
                uint64_t v51 = v7;
                id v52 = v11;
                __int128 v61 = 0u;
                __int128 v62 = 0u;
                __int128 v59 = 0u;
                __int128 v60 = 0u;
                id v17 = v17;
                id v25 = [v17 countByEnumeratingWithState:&v59 objects:v72 count:16];
                if (v25)
                {
                  id v26 = v25;
                  uint64_t v54 = *(void *)v60;
                  do
                  {
                    for (i = 0LL; i != v26; i = (char *)i + 1)
                    {
                      if (*(void *)v60 != v54) {
                        objc_enumerationMutation(v17);
                      }
                      id v28 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
                      uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
                      if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
                      {
                        if (![v16 isEqualToString:off_100014618[0]]
                          || os_variant_has_internal_diagnostics("com.apple.ReportMemoryException")
                          && ([v28 isEqualToString:@"mediaserverd"] & 1) != 0)
                        {
                          unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v16, v51));
                          [v30 addObject:v28];

                          id v3 = v53;
                          if ([v16 isEqualToString:off_100014608[0]])
                          {
                            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( [v53 objectForKeyedSubscript:@"ProcessesAllowedInSysdiagnose"]);
                            [v31 addObject:v28];

                            id v3 = v53;
                          }
                        }

                        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v69 = v28;
                          __int16 v70 = 2112;
                          uint64_t v71 = off_100014618[0];
                          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Ignoring process %@ for %@ key, since it isn't know to have received privacy approva l for collecting fullContent memgraphs for this OS configuration.",  buf,  0x16u);
                        }
                      }
                    }

                    id v26 = [v17 countByEnumeratingWithState:&v59 objects:v72 count:16];
                  }

                  while (v26);
                }

                goto LABEL_50;
              }
            }
          }

          else
          {
            if (![v16 isEqualToString:@"ProcessesAllowedInSysdiagnose"])
            {
              id v52 = v11;
              unsigned int v40 = v5;
              unsigned int v41 = [v16 isEqualToString:off_100014610[0]];
              uint64_t v42 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v16]);
              id v17 = (id)v42;
              if (v41)
              {
                uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSNumber);
                uint64_t v5 = v40;
                if ((objc_opt_isKindOfClass(v17, v43) & 1) != 0) {
                  [v3 setObject:v17 forKeyedSubscript:off_100014610[0]];
                }
                goto LABEL_51;
              }

              if (v42)
              {
                uint64_t v51 = v7;
                unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v16]);
                NSErrorUserInfoKey v45 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"PerProcessLimit"]);
                if (v45 && (uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v45, v46) & 1) != 0))
                {
                  if ((unint64_t)[v45 integerValue] + 1 <= 0x2711)
                  {
                    [v44 setObject:v45 forKeyedSubscript:@"PerProcessLimit"];
                    goto LABEL_73;
                  }
                }

                else
                {
LABEL_73:
                  NSErrorUserInfoKey v47 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:@"ExecNameList"]);
                  BOOL v48 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"ExecNameList"]);
                  sub_10000AC24(v47, v48);

                  id v3 = v53;
                }

                id v7 = v51;
              }

              uint64_t v5 = v40;
              goto LABEL_51;
            }

            id v17 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v16]);
            if (v17)
            {
              uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSArray);
              if ((objc_opt_isKindOfClass(v17, v32) & 1) != 0)
              {
                uint64_t v51 = v7;
                id v52 = v11;
                __int128 v57 = 0u;
                __int128 v58 = 0u;
                __int128 v55 = 0u;
                __int128 v56 = 0u;
                id v17 = v17;
                id v33 = [v17 countByEnumeratingWithState:&v55 objects:v67 count:16];
                if (v33)
                {
                  id v34 = v33;
                  uint64_t v35 = *(void *)v56;
                  do
                  {
                    for (j = 0LL; j != v34; j = (char *)j + 1)
                    {
                      if (*(void *)v56 != v35) {
                        objc_enumerationMutation(v17);
                      }
                      uint64_t v37 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)j);
                      uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSString);
                      if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
                      {
                        id v39 = (void *)objc_claimAutoreleasedReturnValue( [v53 objectForKeyedSubscript:@"ProcessesAllowedInSysdiagnose"]);
                        [v39 addObject:v37];
                      }
                    }

                    id v34 = [v17 countByEnumeratingWithState:&v55 objects:v67 count:16];
                  }

                  while (v34);
                }

                id v3 = v53;
LABEL_50:
                id v7 = v51;
                uint64_t v5 = &AnalyticsSendEventLazy_ptr;
LABEL_51:
                id v11 = v52;
              }
            }
          }

          unsigned int v15 = (char *)v15 + 1;
        }

        while (v15 != v13);
        id v49 = [v11 countByEnumeratingWithState:&v63 objects:v73 count:16];
        id v13 = v49;
        if (!v49)
        {
LABEL_77:

          goto LABEL_81;
        }
      }
    }

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      NSFileAttributeKey v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v10 = [v7 compare:v9];

      if (v10 != (id)-1LL) {
        goto LABEL_5;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_81;
      }
      *(_WORD *)buf = 0;
      unsigned int v50 = "The input preferences have expired. Skipping.";
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
LABEL_81:

        goto LABEL_82;
      }

      *(_WORD *)buf = 0;
      unsigned int v50 = "The input preferences are malformed. Skipping.";
    }

    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v50, buf, 2u);
    goto LABEL_81;
  }

LABEL_82:
}

uint64_t sub_100009E90()
{
  if (qword_100014700 != -1) {
    dispatch_once(&qword_100014700, &stru_1000107B8);
  }
  return byte_1000146F8;
}

void sub_100009ED0(id a1)
{
  char v1 = DiagnosticLogSubmissionEnabled(a1);
  byte_1000146F8 = os_variant_has_internal_diagnostics("com.apple.ReportMemoryException") & v1;
}

uint64_t sub_100009F08()
{
  if (qword_100014708 != -1) {
    dispatch_once(&qword_100014708, &stru_1000107D8);
  }
  return byte_1000146F9;
}

void sub_100009F48(id a1)
{
}

unint64_t sub_100009F74(void *a1, uint64_t a2, void *a3, _BYTE *a4, _BYTE *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = v10;
  if (v9)
  {
    if (sub_100009608(v10))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"PerCriticalProcessLimit"]);
      id v13 = [v12 integerValue];

      *a4 = 1;
    }

    else
    {
      id v13 = 0LL;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v33 = *a4;
      int v37 = 136315650;
      uint64_t v38 = "RMEGetMemgraphLimitForExecName";
      __int16 v39 = 1024;
      LODWORD(v40[0]) = v33;
      WORD2(v40[0]) = 2048;
      *(void *)((char *)v40 + 6) = v13;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s - isCriticalProcess: %d, dailyCriticalProcessLimit: %ld",  (uint8_t *)&v37,  0x1Cu);
    }

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"LargeExemptedProcesses"]);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v34 = *a5;
      int v37 = 136315394;
      uint64_t v38 = "RMEGetMemgraphLimitForExecName";
      __int16 v39 = 1024;
      LODWORD(v40[0]) = v34;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s - isLargeExemptProcess: %d",  (uint8_t *)&v37,  0x12u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"PerProcessLimit"]);
    id v17 = [v16 integerValue];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v37 = 136315394;
      uint64_t v38 = "RMEGetMemgraphLimitForExecName";
      __int16 v39 = 2048;
      v40[0] = v17;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s - fullDiagPerProcessLimit: %ld",  (uint8_t *)&v37,  0x16u);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ProcessSpecificFullDiagQuotas"]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v11]);

    if (v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v11]);
      id v17 = [v20 integerValue];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        int v37 = 136315394;
        uint64_t v38 = "RMEGetMemgraphLimitForExecName";
        __int16 v39 = 2048;
        v40[0] = v17;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s - specificLimit: %ld",  (uint8_t *)&v37,  0x16u);
      }
    }

    uint64_t v21 = MREExceptionTypeToString(a2);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v22]);

    if (v23)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"PerProcessLimit"]);
      id v25 = v24;
      if (v24) {
        id v17 = [v24 integerValue];
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        id v35 = [v25 integerValue];
        int v37 = 136315394;
        uint64_t v38 = "RMEGetMemgraphLimitForExecName";
        __int16 v39 = 2048;
        v40[0] = v35;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s - typeLimit: %ld",  (uint8_t *)&v37,  0x16u);
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"ExecNameList"]);
      id v27 = v26;
      if (v26)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v11]);
        uint64_t v29 = v28;
        if (v28) {
          id v17 = [v28 integerValue];
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          id v36 = [v29 integerValue];
          int v37 = 136315394;
          uint64_t v38 = "RMEGetMemgraphLimitForExecName";
          __int16 v39 = 2048;
          v40[0] = v36;
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s - exceptionSpecificLimit: %ld",  (uint8_t *)&v37,  0x16u);
        }
      }
    }

    unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    else {
      unint64_t v31 = (unint64_t)v17;
    }
    if (v30 <= v31) {
      unint64_t v14 = v31;
    }
    else {
      unint64_t v14 = v30;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v37 = 136315394;
      uint64_t v38 = "RMEGetMemgraphLimitForExecName";
      __int16 v39 = 2048;
      v40[0] = v14;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s - final limit: %ld",  (uint8_t *)&v37,  0x16u);
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  return v14;
}

uint64_t sub_10000A4A0(uint64_t result)
{
  if (result)
  {
    char v1 = (void *)objc_claimAutoreleasedReturnValue([(id)result objectForKeyedSubscript:@"LitePerProcessLimit"]);
    id v2 = [v1 integerValue];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 136315394;
      id v4 = "RMEGetLiteLimitForExecName";
      __int16 v5 = 2048;
      id v6 = v2;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s - liteDiagPerProcessLimit: %ld",  (uint8_t *)&v3,  0x16u);
    }

    else {
      return (uint64_t)v2;
    }
  }

  return result;
}

id sub_10000A580(char a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -3600.0));
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v61 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 nextValidURL]);
  __int128 v59 = v5;
  __int128 v60 = (void *)v7;
  if (v9)
  {
    id v10 = (void *)v9;
    __int128 v58 = v4;
    while (1)
    {
      id v11 = objc_autoreleasePoolPush();
      id v74 = 0LL;
      [v10 getResourceValue:&v74 forKey:NSURLCreationDateKey error:0];
      id v12 = v74;
      if (v12) {
        break;
      }
LABEL_26:

      objc_autoreleasePoolPop(v11);
      uint64_t v33 = objc_claimAutoreleasedReturnValue([v5 nextValidURL]);

      id v10 = (void *)v33;
      if (!v33) {
        goto LABEL_37;
      }
    }

    id v73 = 0LL;
    [v10 getResourceValue:&v73 forKey:NSURLNameKey error:0];
    id v13 = v73;
    if (!v13 || (a1 & 1) == 0 && [v12 compare:v7] != (id)-1 && objc_msgSend(v12, "compare:", v7))
    {
LABEL_25:

      goto LABEL_26;
    }

    if (!v4 || [v13 hasSuffix:@".lite_diag"])
    {
      -[NSMutableArray addObject:](v61, "addObject:", v10);
      goto LABEL_25;
    }

    id v14 = v13;
    id v15 = [v14 rangeOfString:@"_"];
    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_23;
    }
    id v56 = v15;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", ".memgraph"));
    unsigned __int8 v17 = [v14 hasSuffix:v16];

    if ((v17 & 1) != 0)
    {
      uint64_t v18 = 34LL;
      id v19 = v56;
    }

    else
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", ".lite_diag"));
      unsigned int v21 = [v14 hasSuffix:v20];

      id v5 = v59;
      id v19 = v56;
      if (!v21) {
        goto LABEL_23;
      }
      uint64_t v18 = 35LL;
    }

    uint64_t v22 = (uint64_t)v19 + 1;
    uint64_t v23 = v22 + v18;
    uint64_t v24 = (char *)[v14 length];
    id v26 = &v24[-v23];
    BOOL v25 = (uint64_t)v24 <= v23;
    id v5 = v59;
    if (!v25)
    {
      uint64_t v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", v22, v26));

      id v28 = (void *)v27;
      id v4 = v58;
      uint64_t v7 = (uint64_t)v60;
      if (!v28) {
        goto LABEL_25;
      }
      id v57 = v28;
      id v29 = v58;
      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"AllowAllProcessesInSysdiagnose"]);
      unint64_t v31 = v30;
      if (v30 && [v30 BOOLValue])
      {

        uint64_t v32 = v57;
      }

      else
      {
        int v34 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"ProcessesAllowedInSysdiagnose"]);
        unsigned int v54 = [v34 containsObject:v57];

        id v5 = v59;
        uint64_t v32 = v57;

        if (!v54)
        {
LABEL_36:

          goto LABEL_24;
        }
      }

      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v32));
      if (v35)
      {
        id v72 = 0LL;
        [v10 getResourceValue:&v72 forKey:NSURLCreationDateKey error:0];
        id v36 = v72;
        int v37 = v35;
        id v38 = v36;
        id v71 = 0LL;
        id v53 = v37;
        [v37 getResourceValue:&v71 forKey:NSURLCreationDateKey error:0];
        __int128 v55 = v38;
        if ([v71 compare:v38] == (id)-1)
        {
          id v35 = v53;
          -[NSMutableArray addObject:](v61, "addObject:", v53);
          uint64_t v32 = v57;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v57);
        }

        else
        {
          -[NSMutableArray addObject:](v61, "addObject:", v10);
          uint64_t v32 = v57;
          id v35 = v53;
        }
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v32);
      }

      goto LABEL_36;
    }

LABEL_23:
LABEL_24:
    id v4 = v58;
    uint64_t v7 = (uint64_t)v60;
    goto LABEL_25;
  }

LABEL_37:
  -[NSMutableArray sortUsingComparator:](v61, "sortUsingComparator:", &stru_100010818);
  __int16 v39 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary keysSortedByValueUsingComparator:]( v8,  "keysSortedByValueUsingComparator:",  &stru_100010818));
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id v40 = [v39 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v68;
    do
    {
      for (i = 0LL; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v68 != v42) {
          objc_enumerationMutation(v39);
        }
        unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v67 + 1) + 8LL * (void)i)));
        NSErrorUserInfoKey v45 = (void *)objc_claimAutoreleasedReturnValue([v44 path]);
        [v6 addObject:v45];
      }

      id v41 = [v39 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }

    while (v41);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  uint64_t v46 = v61;
  id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v63,  v75,  16LL);
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v64;
    do
    {
      for (j = 0LL; j != v48; j = (char *)j + 1)
      {
        if (*(void *)v64 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v63 + 1) + 8 * (void)j) path]);
        [v6 addObject:v51];
      }

      id v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v63,  v75,  16LL);
    }

    while (v48);
  }

  return v6;
}

int64_t sub_10000AB8C(id a1, NSURL *a2, NSURL *a3)
{
  id v9 = 0LL;
  id v4 = a3;
  -[NSURL getResourceValue:forKey:error:](a2, "getResourceValue:forKey:error:", &v9, NSURLCreationDateKey, 0LL);
  id v8 = 0LL;
  id v5 = v9;
  -[NSURL getResourceValue:forKey:error:](v4, "getResourceValue:forKey:error:", &v8, NSURLCreationDateKey, 0LL);

  id v6 = [v8 compare:v5];
  return (int64_t)v6;
}

void sub_10000AC24(void *a1, void *a2)
{
  id v14 = a1;
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          id v9 = 0LL;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9);
            uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
            {
              id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v10]);
              if (v12)
              {
                uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
                if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
                  && (unint64_t)[v12 integerValue] + 1 <= 0x2711)
                {
                  [v14 setObject:v12 forKeyedSubscript:v10];
                }
              }
            }

            id v9 = (char *)v9 + 1;
          }

          while (v7 != v9);
          id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }

        while (v7);
      }
    }
  }
}

void start()
{
  if (getppid() == 1)
  {
    dispatch_queue_attr_t v0 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    char v1 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v0);
    id v2 = dispatch_queue_create("com.apple.ReportMemoryException.listener", v1);
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ReportMemoryException.analysis", v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ReportMemoryException.bulkAnalysis", 0LL);
    mach_service = xpc_connection_create_mach_service("com.apple.ReportMemoryException", v2, 1uLL);
    uint64_t v8 = objc_autoreleasePoolPush();
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000AF98;
    handler[3] = &unk_100010868;
    id v9 = v2;
    id v14 = v9;
    __int128 v15 = v5;
    __int128 v16 = v6;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(mach_service);
    sub_100003370();
    dispatch_time_t v10 = dispatch_time(0LL, 60000000000LL);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000B688;
    v11[3] = &unk_100010890;
    id v12 = v9;
    dispatch_after(v10, v12, v11);

    objc_autoreleasePoolPop(v8);
    dispatch_main();
  }

  fwrite("Error: This service may only be launched by launchd.\n", 0x35uLL, 1uLL, __stderrp);
  _exit(-1);
}

void sub_10000AF98(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      uint64_t v4 = "Got xpc error for peer: %s";
      uint32_t v5 = 12;
      goto LABEL_7;
    }
  }

  else
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
    {
      xpc_connection_set_target_queue((xpc_connection_t)v3, *(dispatch_queue_t *)(a1 + 32));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      void v6[2] = sub_10000B138;
      v6[3] = &unk_100010840;
      id v7 = *(id *)(a1 + 40);
      id v8 = *(id *)(a1 + 48);
      xpc_connection_set_event_handler((xpc_connection_t)v3, v6);
      xpc_connection_resume((xpc_connection_t)v3);

      goto LABEL_9;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v4 = "Unexpected XPC event";
      uint32_t v5 = 2;
LABEL_7:
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v4, buf, v5);
    }
  }

LABEL_9:
}

void sub_10000B138(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Got xpc error message in ReportMemoryException client connection: %s",  (uint8_t *)&buf,  0xCu);
    }
  }

  else if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint32_t v5 = *(void **)(a1 + 40);
    id v6 = v3;
    id v7 = v4;
    id v8 = v5;
    int64_t int64 = xpc_dictionary_get_int64(v6, "MessageType");
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v6);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    uint64_t v13 = reply;
    id v14 = 0LL;
    if (v11 && reply)
    {
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      id v40 = sub_10000B7A0;
      id v41 = &unk_1000108B8;
      id v42 = v6;
      id v43 = v13;
      id v14 = objc_retainBlock(&buf);
    }

    if (int64 != 3)
    {
      if (int64 == 2)
      {
        uint64_t v19 = xpc_dictionary_copy_mach_send(v6, "TaskPort");
        if ((v19 + 1) > 1)
        {
          uint64_t v32 = v19;
          char v33 = xpc_dictionary_get_BOOL(v6, "WithMemgraph");
          sub_100003F54(v32, v33, v7, v8, v14);
          mach_port_deallocate(mach_task_self_, v32);
          goto LABEL_46;
        }

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
LABEL_46:

          goto LABEL_47;
        }

        *(_WORD *)int v37 = 0;
        uint64_t v20 = "Unable to get port for memory analysis";
      }

      else
      {
        if (int64 != 1)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)int v37 = 136315138;
          string = xpc_dictionary_get_string(v6, _xpc_error_key_description);
          uint64_t v20 = "Unexpected message from ReportMemoryException client: %s";
          uint32_t v21 = 12;
LABEL_26:
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v20, v37, v21);
          goto LABEL_46;
        }

        int64_t v15 = xpc_dictionary_get_int64(v6, "AuthToken");
        if (v11 && v13)
        {
          xpc_dictionary_set_int64(v13, "AuthToken", ~v15);
          xpc_connection_send_message((xpc_connection_t)v11, v13);
          goto LABEL_46;
        }

        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
        *(_WORD *)int v37 = 0;
        uint64_t v20 = "Received an auth request without a reply context!";
      }

      uint32_t v21 = 2;
      goto LABEL_26;
    }

    mach_port_name_t v16 = xpc_dictionary_copy_mach_send(v6, "TaskPort");
    if (v16 + 1 > 1)
    {
      mach_port_name_t v22 = v16;
      int v23 = xpc_dictionary_get_int64(v6, "TimeoutSeconds");
      int v24 = v23;
      if (v23) {
        BOOL v25 = v23 <= 60;
      }
      else {
        BOOL v25 = 0;
      }
      int v26 = !v25;
      int v36 = v26;
      unsigned int v27 = xpc_dictionary_get_int64(v6, "ContentLevel");
      unsigned int v28 = v27;
      if (v27 >= 3)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_44;
        }
        *(_DWORD *)int v37 = 67109120;
        LODWORD(string) = v28;
        __int128 v17 = "Invalid content level for memgraph request: %d";
        uint32_t v18 = 8;
LABEL_42:
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v17, v37, v18);
LABEL_44:
        if (v14)
        {
          int v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MREErrorDomain[0],  16LL,  0LL));
          (*((void (**)(_OWORD *, void *))v14 + 2))(v14, v34);
        }

        goto LABEL_46;
      }

      int v35 = v27;
      uint64_t v29 = xpc_dictionary_dup_fd(v6, "MemgraphFileDescriptor");
      if ((_DWORD)v29 != -1)
      {
        unint64_t v30 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v29,  1LL);
        if (v36) {
          uint64_t v31 = 60LL;
        }
        else {
          uint64_t v31 = v24;
        }
        sub_1000059C4(v22, v30, v35, v31, v7, v8, v14);
        mach_port_deallocate(mach_task_self_, v22);

        goto LABEL_46;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      *(_WORD *)int v37 = 0;
      __int128 v17 = "Unable to get file descriptor to write out memgraph";
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      *(_WORD *)int v37 = 0;
      __int128 v17 = "Unable to get port for memory analysis";
    }

    uint32_t v18 = 2;
    goto LABEL_42;
  }

LABEL_47:
}

void sub_10000B688(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v2 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Calling xpc_transaction_exit_clean() and scheduling force exit.",  v2,  2u);
  }

  xpc_transaction_exit_clean();
  sub_10000B700(*(void **)(a1 + 32), 60LL);
}

void sub_10000B700(void *a1, uint64_t a2)
{
  id v3 = a1;
  dispatch_time_t v4 = dispatch_time(0LL, 1000000000 * a2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_10000B870;
  v6[3] = &unk_1000108E0;
  id v7 = v3;
  uint64_t v8 = a2;
  uint32_t v5 = (dispatch_queue_s *)v3;
  dispatch_after(v4, v5, v6);
}

void sub_10000B7A0(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = *(id *)(a1 + 32);
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v3);
  uint32_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    if (v6)
    {
      if (v8)
      {
        id v7 = objc_claimAutoreleasedReturnValue([v8 domain]);
        xpc_dictionary_set_string(v6, "ErrorDomain", (const char *)[v7 UTF8String]);

        xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 40), "ErrorCode", (int64_t)[v8 code]);
        id v6 = *(void **)(a1 + 40);
      }

      xpc_connection_send_message(v5, v6);
    }
  }
}

void sub_10000B870(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  if (qword_100014710 >= (unint64_t)qword_100014670)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v4) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "ReportMemoryException still alive after xpc_transaction_exit_clean() and has waited out timeouts for critical an alysis requests. Exiting at risk of data loss.\n",  (uint8_t *)&v4,  2u);
    }

    _exit(-1);
  }

  id v3 = v2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ReportMemoryException potentially still has pending critical bulk analysis requests. Checking again in %lld seconds.",  (uint8_t *)&v4,  0xCu);
  }

  sub_10000B700(v3, v1);
  qword_100014710 += v1;
}

id objc_msgSend_emitTelemetryForExecName_bundleID_exceptionType_footprint_footprintPeak_jetsamLimit_memgraphAttempted_memgraphSkippedReason_memgraphSucceeded_memgraphFailedReason_diagFilePath_isMSLEnabled_isGcoreCapture_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "emitTelemetryForExecName:bundleID:exceptionType:footprint:footprintPeak:jetsamLimit:memgraphAttempted:memgrap hSkippedReason:memgraphSucceeded:memgraphFailedReason:diagFilePath:isMSLEnabled:isGcoreCapture:");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}