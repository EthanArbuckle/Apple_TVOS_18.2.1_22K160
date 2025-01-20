@interface SCProcessUtility
+ (BOOL)isProcessRunning:(int)a3;
+ (BOOL)isResponsibleProcessEntitledForAuditToken:(id *)a3 entitlement:(id)a4;
+ (BOOL)isValidProcessId:(int)a3;
+ (id)applicationProcessIdListForProcessId:(int)a3 hostProcessIdentifier:(int *)a4;
+ (id)getHostedPidsForPid:(int)a3;
+ (id)hostApplicationWithAuditToken:(id *)a3 bundleID:(id)a4;
+ (id)listAllRunningProcesses:(id)a3;
+ (id)listOfProcessesMatchingSameParentPid:(int)a3 withProcessList:(id)a4;
+ (int)avcdProcessId;
+ (int)parentProcessIdForProcessId:(int)a3;
@end

@implementation SCProcessUtility

+ (id)hostApplicationWithAuditToken:(id *)a3 bundleID:(id)a4
{
  return a4;
}

+ (id)applicationProcessIdListForProcessId:(int)a3 hostProcessIdentifier:(int *)a4
{
  uint64_t v4 = *(void *)&a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v36 = "+[SCProcessUtility applicationProcessIdListForProcessId:hostProcessIdentifier:]";
    __int16 v37 = 1024;
    int v38 = 57;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  v5 = &OBJC_IVAR___RPDelegateBase__protocol;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SCProcessUtility listAllRunningProcesses:]( &OBJC_CLASS___SCProcessUtility,  "listAllRunningProcesses:",  0LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  id v34 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v7,  &v34));
  id v9 = v34;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 hostProcess]);
  id v11 = [v10 pid];

  unsigned int v12 = +[SCProcessUtility isValidProcessId:](&OBJC_CLASS___SCProcessUtility, "isValidProcessId:", v11);
  if (v12)
  {
    id v32 = v9;
    v13 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SCProcessUtility getHostedPidsForPid:](&OBJC_CLASS___SCProcessUtility, "getHostedPidsForPid:", v4));
    id v15 = [v14 mutableCopy];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
    [v15 addObject:v16];
    int v17 = 0;
    id v18 = 0LL;
    LODWORD(v19) = (_DWORD)v11;
  }

  else
  {
    uint64_t v19 = +[SCProcessUtility parentProcessIdForProcessId:]( &OBJC_CLASS___SCProcessUtility,  "parentProcessIdForProcessId:",  v4);
    if (!+[SCProcessUtility isValidProcessId:](&OBJC_CLASS___SCProcessUtility, "isValidProcessId:", v19))
    {
      int v21 = 0;
      id v15 = 0LL;
      id v18 = 0LL;
      goto LABEL_10;
    }

    id v32 = v9;
    v13 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[SCProcessUtility listOfProcessesMatchingSameParentPid:withProcessList:]( &OBJC_CLASS___SCProcessUtility,  "listOfProcessesMatchingSameParentPid:withProcessList:",  v19,  v6));
    id v18 = [v20 mutableCopy];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19));
    [v18 addObject:v16];
    id v15 = 0LL;
    int v17 = v19;
  }

  int v21 = v12 ^ 1;

  id v9 = v32;
  *a4 = v19;
  LODWORD(v19) = v17;
  v6 = v13;
  v5 = &OBJC_IVAR___RPDelegateBase__protocol;
LABEL_10:
  if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v36 = "+[SCProcessUtility applicationProcessIdListForProcessId:hostProcessIdentifier:]";
    __int16 v37 = 1024;
    int v38 = 84;
    __int16 v39 = 1024;
    int v40 = v4;
    __int16 v41 = 1024;
    *(_DWORD *)v42 = (_DWORD)v11;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v19;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d processId=%d hostPid=%d parentPid=%d",  buf,  0x24u);
  }

  if (((v12 | v21) & 1) == 0 && [v5 + 874 isValidProcessId:v4])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v5 + 874 getHostedPidsForPid:v4]);
    id v23 = [v22 mutableCopy];

    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 + 874 listOfProcessesMatchingSameParentPid:v4 withProcessList:v6]);
    id v25 = [v24 mutableCopy];

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
    [v25 addObject:v26];

    *a4 = v4;
    id v15 = v23;
    id v18 = v25;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v18 arrayByAddingObjectsFromArray:v15]);
  id v28 = [v27 mutableCopy];

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v36 = "+[SCProcessUtility applicationProcessIdListForProcessId:hostProcessIdentifier:]";
    __int16 v37 = 1024;
    int v38 = 95;
    __int16 v39 = 1024;
    int v40 = v4;
    __int16 v41 = 2112;
    *(void *)v42 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d processId=%d has relatedPids=%@",  buf,  0x22u);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 allObjects]);

  return v30;
}

+ (id)getHostedPidsForPid:(int)a3
{
  return +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", *(void *)&a3);
}

+ (int)parentProcessIdForProcessId:(int)a3
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v21 = "+[SCProcessUtility parentProcessIdForProcessId:]";
    __int16 v22 = 1024;
    int v23 = 117;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  size_t v8 = 648LL;
  *(void *)int v17 = 0xE00000001LL;
  int v18 = 1;
  int v19 = a3;
  int v4 = sysctl(v17, 4u, buf, &v8, 0LL, 0LL);
  if (v8) {
    BOOL v5 = v4 < 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    int v6 = 0;
  }
  else {
    int v6 = v24;
  }
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v9 = 136446978;
    v10 = "+[SCProcessUtility parentProcessIdForProcessId:]";
    __int16 v11 = 1024;
    int v12 = 126;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d parentPid=%d for processId=%d",  v9,  0x1Eu);
  }

  return v6;
}

+ (id)listOfProcessesMatchingSameParentPid:(int)a3 withProcessList:(id)a4
{
  id v5 = a4;
  if (!v5) {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[SCProcessUtility listAllRunningProcesses:]( &OBJC_CLASS___SCProcessUtility,  "listAllRunningProcesses:",  0LL));
  }
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (+[SCProcessUtility parentProcessIdForProcessId:]( SCProcessUtility,  "parentProcessIdForProcessId:",  objc_msgSend(v12, "intValue", (void)v14)) == a3) {
          [v6 addObject:v12];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  return v6;
}

+ (id)listAllRunningProcesses:(id)a3
{
  id v3 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "+[SCProcessUtility listAllRunningProcesses:]";
    __int16 v21 = 1024;
    int v22 = 144;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  int v4 = &off_100084000;
  if (!dword_100084858)
  {
    *(void *)buf = 4LL;
    *(void *)v29 = 0x800000001LL;
    if (sysctl(v29, 2u, &dword_100084858, (size_t *)buf, 0LL, 0LL) == -1) {
      dword_100084858 = 4096;
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  int v28 = 0;
  *(void *)v27 = 0xE00000001LL;
  if (sysctl(v27, 3u, 0LL, &__size, 0LL, 0LL) < 0) {
    goto LABEL_25;
  }
  int v6 = (unsigned int *)malloc(__size);
  if (!v6) {
    goto LABEL_25;
  }
  id v7 = v6;
  if (sysctl(v27, 3u, v6, &__size, 0LL, 0LL) < 0)
  {
    free(v7);
    goto LABEL_25;
  }

  int v18 = v7;
  uint64_t v8 = ((int)__size / 0x288uLL);
  id v9 = v7 + 10;
  while (1)
  {
    uint64_t v10 = *v9;
    if ((_DWORD)v10) {
      break;
    }
LABEL_20:
    v9 += 162;
    if (!--v8) {
      goto LABEL_21;
    }
  }

  *(void *)buf = *((int *)v4 + 534);
  __int16 v11 = (char *)malloc(__size);
  *(void *)id v25 = 0x3100000001LL;
  int v26 = v10;
  if (sysctl(v25, 3u, v11, (size_t *)buf, 0LL, 0LL))
  {
LABEL_19:
    free(v11);
    goto LABEL_20;
  }

  if (!v3)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
    [v5 addObject:v15];
    goto LABEL_18;
  }

  int v12 = v4;
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11 + 4,  4LL));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByDeletingPathExtension]);

  if (![v15 isEqualToString:v3])
  {
    int v4 = v12;
LABEL_18:

    goto LABEL_19;
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
  [v5 addObject:v17];

  free(v11);
LABEL_21:
  free(v18);
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "+[SCProcessUtility listAllRunningProcesses:]";
    __int16 v21 = 1024;
    int v22 = 190;
    __int16 v23 = 2048;
    int v24 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d process list obtained process=%p",  buf,  0x1Cu);
  }

+ (int)avcdProcessId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SCProcessUtility listAllRunningProcesses:]( &OBJC_CLASS___SCProcessUtility,  "listAllRunningProcesses:",  @"avconferenced"));
  if ([v2 count])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
    int v4 = [v3 unsignedIntValue];
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (BOOL)isValidProcessId:(int)a3
{
  return a3 > 1;
}

+ (BOOL)isResponsibleProcessEntitledForAuditToken:(id *)a3 entitlement:(id)a4
{
  return 0;
}

+ (BOOL)isProcessRunning:(int)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(void *)&a3));
  uint64_t v8 = 0LL;
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v3,  &v8));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentState]);
    unsigned __int8 v6 = [v5 isRunning];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end