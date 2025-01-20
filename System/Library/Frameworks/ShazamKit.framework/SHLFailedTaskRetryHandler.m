@interface SHLFailedTaskRetryHandler
- (void)retryTask:(id)a3 withContext:(id)a4;
- (void)retryTaskWithTimer:(id)a3;
@end

@implementation SHLFailedTaskRetryHandler

- (void)retryTask:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 outcome]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
  if ([v12 isEqualToString:CKErrorDomain])
  {
    id v13 = [v11 code];

    if (v13 == (id)111)
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v41 = sub_10003E5F0;
      *(void *)&__int128 v42 = sub_10003E600;
      *((void *)&v42 + 1) = 0LL;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v15 = CKIdentityUpdateNotification;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10003E608;
      v37[3] = &unk_10006DE90;
      id v38 = v7;
      v39 = buf;
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 addObserverForName:v15 object:0 queue:0 usingBlock:v37]);
      v17 = *(void **)(*(void *)&buf[8] + 40LL);
      *(void *)(*(void *)&buf[8] + 40LL) = v16;

      _Block_object_dispose(buf, 8);
      goto LABEL_12;
    }
  }

  else
  {
  }

  +[SHLError retrySecondsForError:](&OBJC_CLASS___SHLError, "retrySecondsForError:", v11);
  double v19 = v18;
  id v20 = sub_10002D0D8();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v19 <= 0.0)
  {
    if (v22)
    {
      v30 = (objc_class *)objc_opt_class(v6);
      v31 = NSStringFromClass(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v7 outcome]);
      v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v34 error]);
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2112;
      v41 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Retrying <task: %{public}@ %@> immediately <error: %@>",  buf,  0x20u);
    }

    v36 = (void (**)(void))objc_claimAutoreleasedReturnValue([v7 retryBlock]);
    v36[2]();
  }

  else
  {
    if (v22)
    {
      v23 = (objc_class *)objc_opt_class(v6);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v7 outcome]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 error]);
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2048;
      v41 = *(uint64_t (**)(uint64_t, uint64_t))&v19;
      LOWORD(v42) = 2112;
      *(void *)((char *)&v42 + 2) = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Retrying <task: %{public}@ %@> after %f seconds <error: %@>",  buf,  0x2Au);
    }

    id v29 =  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "retryTaskWithTimer:",  v7,  0LL,  v19);
  }

- (void)retryTaskWithTimer:(id)a3
{
  id v9 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SHLTaskRetryContext);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    [v9 invalidate];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 retryBlock]);

    if (v7)
    {
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue([v6 retryBlock]);
      v8[2]();
    }
  }

  else
  {
    [v9 invalidate];
  }
}

@end