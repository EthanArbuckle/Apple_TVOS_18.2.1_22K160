@interface UMProcessProvider
- (BOOL)terminatePID:(int)a3 withReasonNamespace:(unsigned int)a4 reasonCode:(unint64_t)a5 reasonString:(id)a6 error:(id *)a7;
- (id)pathForPID:(int)a3 error:(id *)a4;
- (id)pidsUsingVolumeAtPath:(id)a3 error:(id *)a4;
- (int)pidForLaunchdJobWithLabel:(id)a3 forUser:(unsigned int)a4 error:(id *)a5;
- (unint64_t)uniquePIDForPID:(int)a3 error:(id *)a4;
@end

@implementation UMProcessProvider

- (id)pathForPID:(int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  bzero(buffer, 0x401uLL);
  if (proc_pidpath(a3, buffer, 0x400u))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
  }

  else
  {
    int v7 = *__error();
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
    }
    if (qword_1000DBBE8 != -1) {
      dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
    }
    v8 = (os_log_s *)(id)qword_1000DBBE0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = 0LL;
      unsigned int v9 = sub_100053B4C(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v9 & 0xFFFFFFFE;
      }
      if ((_DWORD)v10)
      {
        v15[0] = 67109376;
        v15[1] = a3;
        __int16 v16 = 1024;
        int v17 = v7;
        v11 = (const char *)_os_log_send_and_compose_impl( v10,  &v14,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "proc_pidpath(%d) failed: %{darwin.errno}d",  v15,  14);
        v12 = (char *)v11;
        if (v11) {
          sub_100053B7C(v11);
        }
      }

      else
      {
        v12 = 0LL;
      }

      free(v12);
    }

    v6 = 0LL;
  }

  return v6;
}

- (unint64_t)uniquePIDForPID:(int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  int v6 = proc_pidinfo(a3, 17, 0LL, buffer, 56);
  if (v6 < 0)
  {
    int v9 = *__error();
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v9,  0LL));
    }
    if (qword_1000DBBE8 != -1) {
      dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
    }
    uint64_t v10 = (os_log_s *)(id)qword_1000DBBE0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = 0LL;
      unsigned int v11 = sub_100053B4C(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v11 & 0xFFFFFFFE;
      }
      if ((_DWORD)v12)
      {
        int v21 = 67109376;
        int v22 = a3;
        __int16 v23 = 1024;
        int v24 = v9;
        v13 = (const char *)_os_log_send_and_compose_impl( v12,  &v20,  0LL,  0LL,  &_mh_execute_header,  v10,  16LL,  "proc_pidinfo(%d, PROC_PIDUNIQIDENTIFIERINFO) failed: %{darwin.errno}d",  &v21,  14);
        uint64_t v14 = (char *)v13;
        if (v13) {
          sub_100053B7C(v13);
        }
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      free(v14);
    }
  }

  else
  {
    int v7 = v6;
    if (v6 == 56) {
      return v26;
    }
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  5LL,  0LL));
    }
    if (qword_1000DBBE8 != -1) {
      dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
    }
    v15 = (os_log_s *)(id)qword_1000DBBE0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = 0LL;
      unsigned int v16 = sub_100053B4C(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v17)
      {
        int v21 = 67109376;
        int v22 = a3;
        __int16 v23 = 1024;
        int v24 = v7;
        v18 = (const char *)_os_log_send_and_compose_impl( v17,  &v20,  0LL,  0LL,  &_mh_execute_header,  v15,  16LL,  "proc_pidinfo(%d, PROC_PIDUNIQIDENTIFIERINFO) returned unexpected size: %d",  &v21,  14);
        v19 = (char *)v18;
        if (v18) {
          sub_100053B7C(v18);
        }
      }

      else
      {
        v19 = 0LL;
      }

      free(v19);
    }
  }

  return 0LL;
}

- (id)pidsUsingVolumeAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  id v6 = v5;
  int v7 = proc_listpidspath(1u, 0, (const char *)[v6 UTF8String], 3u, 0, 0);
  if (v7 < 0)
  {
    int v19 = *__error();
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v19,  0LL));
    }
    if (qword_1000DBBE8 != -1) {
      dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
    }
    uint64_t v20 = (os_log_s *)(id)qword_1000DBBE0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = 0LL;
      unsigned int v21 = sub_100053B4C(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = v21 & 0xFFFFFFFE;
      }
      if ((_DWORD)v22)
      {
        int v33 = 138543618;
        id v34 = v6;
        __int16 v35 = 1024;
        int v36 = v19;
        __int16 v23 = (const char *)_os_log_send_and_compose_impl( v22,  &v32,  0LL,  0LL,  &_mh_execute_header,  v20,  16LL,  "proc_listpidspath(%{public}@, NULL) failed: %{darwin.errno}d",  &v33,  18);
        int v24 = (char *)v23;
        if (v23) {
          sub_100053B7C(v23);
        }
      }

      else
      {
        int v24 = 0LL;
      }

      free(v24);
    }

    uint64_t v14 = 0LL;
  }

  else
  {
    int v8 = v7 + 200;
    int v9 = malloc(v7 + 200);
    id v10 = v6;
    unsigned int v11 = proc_listpidspath(1u, 0, (const char *)[v10 UTF8String], 3u, v9, v8);
    unsigned int v12 = v11;
    if ((v11 & 0x80000000) != 0)
    {
      int v25 = *__error();
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v25,  0LL));
      }
      if (qword_1000DBBE8 != -1) {
        dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
      }
      unint64_t v26 = (os_log_s *)(id)qword_1000DBBE0;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = 0LL;
        unsigned int v27 = sub_100053B4C(0);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          uint64_t v28 = v27;
        }
        else {
          uint64_t v28 = v27 & 0xFFFFFFFE;
        }
        if ((_DWORD)v28)
        {
          int v33 = 138543618;
          id v34 = v10;
          __int16 v35 = 1024;
          int v36 = v25;
          v29 = (const char *)_os_log_send_and_compose_impl( v28,  &v32,  0LL,  0LL,  &_mh_execute_header,  v26,  16LL,  "proc_listpidspath(%{public}@) failed: %{darwin.errno}d",  &v33,  18);
          v30 = (char *)v29;
          if (v29) {
            sub_100053B7C(v29);
          }
        }

        else
        {
          v30 = 0LL;
        }

        free(v30);
      }

      uint64_t v14 = 0LL;
    }

    else
    {
      unsigned int v13 = v11 >> 2;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v11 >> 2));
      if (v12 >= 4)
      {
        if (v13 <= 1) {
          uint64_t v15 = 1LL;
        }
        else {
          uint64_t v15 = v13;
        }
        unsigned int v16 = (unsigned int *)v9;
        do
        {
          unsigned int v17 = *v16++;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v17));
          [v14 addObject:v18];

          --v15;
        }

        while (v15);
      }
    }

    free(v9);
  }

  return v14;
}

- (int)pidForLaunchdJobWithLabel:(id)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  id v7 = a3;
  if (objc_opt_class(&OBJC_CLASS___OSLaunchdJob))
  {
    if (a5) {
      *a5 = 0LL;
    }
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[OSLaunchdDomain systemDomain](&OBJC_CLASS___OSLaunchdDomain, "systemDomain"));
    id v9 = +[OSLaunchdJob copyJobWithLabel:domain:](&OBJC_CLASS___OSLaunchdJob, "copyJobWithLabel:domain:", v7, v8);
    if (!v9)
    {
      if (qword_1000DBBE8 != -1) {
        dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
      }
      v18 = (os_log_s *)(id)qword_1000DBBE0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = 0LL;
        unsigned int v19 = sub_100053B4C(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = v19 & 0xFFFFFFFE;
        }
        if ((_DWORD)v20)
        {
          *(_DWORD *)v42 = 138543618;
          *(void *)&v42[4] = v7;
          *(_WORD *)&v42[12] = 1024;
          *(_DWORD *)&v42[14] = a4;
          unsigned int v21 = (const char *)_os_log_send_and_compose_impl( v20,  &v32,  0LL,  0LL,  &_mh_execute_header,  v18,  16LL,  "Unable to find launchd job with label %{public}@ in domain for user %u.",  v42,  18);
          uint64_t v22 = (char *)v21;
          if (v21) {
            sub_100053B7C(v21);
          }
        }

        else
        {
          uint64_t v22 = 0LL;
        }

        free(v22);
      }

      int v12 = 0;
      if (a5) {
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL));
      }
      goto LABEL_51;
    }

    *(void *)v42 = 0LL;
    *(void *)&v42[8] = v42;
    *(void *)&v42[16] = 0x3032000000LL;
    v43 = sub_100080488;
    v44 = sub_100080498;
    id v45 = 0LL;
    uint64_t v32 = 0LL;
    int v33 = &v32;
    uint64_t v34 = 0x2020000000LL;
    int v35 = 8;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.usermanagerd.launchjobmonitor", 0LL);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000804A0;
    v31[3] = &unk_1000CDB48;
    v31[4] = v42;
    v31[5] = &v32;
    [v9 monitorOnQueue:v10 withHandler:v31];
    [v9 cancelMonitor];
    unsigned int v11 = *(void **)(*(void *)&v42[8] + 40LL);
    if (v11)
    {
      if ([v11 state] == (id)2)
      {
        int v12 = [*(id *)(*(void *)&v42[8] + 40) pid];
LABEL_50:

        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(v42, 8);

LABEL_51:
        goto LABEL_52;
      }
    }

    else
    {
      if (qword_1000DBBE8 != -1) {
        dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
      }
      __int16 v23 = (os_log_s *)(id)qword_1000DBBE0;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = 0LL;
        unsigned int v24 = sub_100053B4C(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          uint64_t v25 = v24;
        }
        else {
          uint64_t v25 = v24 & 0xFFFFFFFE;
        }
        if ((_DWORD)v25)
        {
          int v26 = *((_DWORD *)v33 + 6);
          int v36 = 138543874;
          id v37 = v7;
          __int16 v38 = 1024;
          unsigned int v39 = a4;
          __int16 v40 = 1024;
          int v41 = v26;
          unsigned int v27 = (const char *)_os_log_send_and_compose_impl( v25,  &v30,  0LL,  0LL,  &_mh_execute_header,  v23,  16LL,  "Failed to get launchd job info for %{public}@ in domain for user %u:%{darwin.errno}d",  &v36,  24);
          uint64_t v28 = (char *)v27;
          if (v27) {
            sub_100053B7C(v27);
          }
        }

        else
        {
          uint64_t v28 = 0LL;
        }

        free(v28);
      }

      if (a5)
      {
        int v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL));
        goto LABEL_50;
      }
    }

    int v12 = 0;
    goto LABEL_50;
  }

  if (qword_1000DBBE8 != -1) {
    dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
  }
  unsigned int v13 = (os_log_s *)(id)qword_1000DBBE0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v32 = 0LL;
    unsigned int v14 = sub_100053B4C(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v14 & 0xFFFFFFFE;
    }
    if ((_DWORD)v15)
    {
      *(_DWORD *)v42 = 138543362;
      *(void *)&v42[4] = v7;
      unsigned int v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v32,  0LL,  0LL,  &_mh_execute_header,  v13,  16LL,  "Unable to find pid for launchd job %{public}@; OSLaunchJob is not available.",
                            v42,
                            12);
      unsigned int v17 = (char *)v16;
      if (v16) {
        sub_100053B7C(v16);
      }
    }

    else
    {
      unsigned int v17 = 0LL;
    }

    free(v17);
  }

  int v12 = 0;
  if (a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  45LL,  0LL));
  }
LABEL_52:

  return v12;
}

- (BOOL)terminatePID:(int)a3 withReasonNamespace:(unsigned int)a4 reasonCode:(unint64_t)a5 reasonString:(id)a6 error:(id *)a7
{
  if (a7) {
    *a7 = 0LL;
  }
  int v11 = terminate_with_reason( *(void *)&a3, *(void *)&a4, a5, [a6 UTF8String], 129);
  if (v11)
  {
    int v12 = *__error();
    if (a7) {
      *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v12,  0LL));
    }
    if (qword_1000DBBE8 != -1) {
      dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
    }
    unsigned int v13 = (os_log_s *)(id)qword_1000DBBE0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = 0LL;
      unsigned int v14 = sub_100053B4C(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v14 & 0xFFFFFFFE;
      }
      if ((_DWORD)v15)
      {
        *(_DWORD *)buf = 67109888;
        int v22 = a3;
        __int16 v23 = 1024;
        unsigned int v24 = a4;
        __int16 v25 = 2048;
        unint64_t v26 = a5;
        __int16 v27 = 1024;
        int v28 = v12;
        unsigned int v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v20,  0LL,  0LL,  &_mh_execute_header,  v13,  16LL,  "terminate_with_reason(%d, %u, %llu) failed: %{darwin.errno}d",  buf,  30);
        unsigned int v17 = (char *)v16;
        if (v16) {
          sub_100053B7C(v16);
        }
      }

      else
      {
        unsigned int v17 = 0LL;
      }

      free(v17);
    }
  }

  else
  {
    if (qword_1000DBBE8 != -1) {
      dispatch_once(&qword_1000DBBE8, &stru_1000CDB68);
    }
    v18 = (os_log_s *)qword_1000DBBE0;
    if (os_log_type_enabled((os_log_t)qword_1000DBBE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Terminated process %d", buf, 8u);
    }
  }

  return v11 == 0;
}

@end