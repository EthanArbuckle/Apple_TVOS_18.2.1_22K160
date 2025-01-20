@interface DelayedGotoSemaphore
+ (void)_accessSemaphorePoolUsingBlock:(id)a3;
+ (void)signalSemaphoreForPushToken:(id)a3;
- (DelayedGotoSemaphore)initWithDelayedGoto:(id)a3;
- (NSDictionary)bodyDictionary;
- (NSURL)URL;
- (void)wait;
@end

@implementation DelayedGotoSemaphore

- (DelayedGotoSemaphore)initWithDelayedGoto:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___DelayedGotoSemaphore;
  v5 = -[DelayedGotoSemaphore init](&v38, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"body"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (NSDictionary *)[v6 copy];
      bodyDictionary = v5->_bodyDictionary;
      v5->_bodyDictionary = v8;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"url"]);

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      v12 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v10);
      url = v5->_url;
      v5->_url = v12;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"delay"]);

    char v15 = objc_opt_respondsToSelector(v14, "doubleValue");
    double v16 = 30.0;
    if ((v15 & 1) != 0) {
      objc_msgSend(v14, "doubleValue", 30.0);
    }
    v5->_delay = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"apnsToken"]);

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    {
      uint64_t v32 = 0LL;
      v33 = &v32;
      uint64_t v34 = 0x3032000000LL;
      v35 = sub_100144848;
      v36 = sub_100144858;
      v37 = 0LL;
      v19 = (void *)objc_opt_class(v5);
      v26 = _NSConcreteStackBlock;
      uint64_t v27 = 3221225472LL;
      v28 = sub_100144860;
      v29 = &unk_10034FA50;
      v31 = &v32;
      id v20 = v17;
      id v30 = v20;
      [v19 _accessSemaphorePoolUsingBlock:&v26];
      objc_storeStrong((id *)&v5->_semaphore, (id)v33[5]);
      v21 = (NSString *)objc_msgSend(v20, "copy", v26, v27, v28, v29);
      pushToken = v5->_pushToken;
      v5->_pushToken = v21;

      _Block_object_dispose(&v32, 8);
      semaphore = v37;
    }

    else
    {
      dispatch_semaphore_t v24 = dispatch_semaphore_create(0LL);
      semaphore = v5->_semaphore;
      v5->_semaphore = (OS_dispatch_semaphore *)v24;
    }
  }

  return v5;
}

+ (void)signalSemaphoreForPushToken:(id)a3
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = sub_100144848;
  v13 = sub_100144858;
  id v14 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001449D4;
  v6[3] = &unk_10034FA50;
  v8 = &v9;
  id v4 = a3;
  id v7 = v4;
  [a1 _accessSemaphorePoolUsingBlock:v6];
  v5 = (dispatch_semaphore_s *)v10[5];
  if (v5) {
    dispatch_semaphore_signal(v5);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)wait
{
  if (self->_semaphore)
  {
    pushToken = self->_pushToken;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    v5 = (void *)v4;
    if (pushToken)
    {
      if (!v4) {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v6 = [v5 shouldLog];
      else {
        LODWORD(v7) = v6;
      }
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        uint64_t v7 = v7;
      }
      else {
        v7 &= 2u;
      }
      if (!(_DWORD)v7) {
        goto LABEL_25;
      }
      uint64_t v9 = (void *)objc_opt_class(self);
      double delay = self->_delay;
      uint64_t v11 = self->_pushToken;
      int v22 = 138412802;
      v23 = v9;
      __int16 v24 = 2048;
      double v25 = delay;
      __int16 v26 = 2112;
      uint64_t v27 = v11;
      id v12 = v9;
      uint64_t v13 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  2LL,  "%@: Waiting up to %.2f seconds for push: %@",  &v22,  32);
    }

    else
    {
      if (!v4) {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v14 = [v5 shouldLog];
      else {
        LODWORD(v15) = v14;
      }
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        uint64_t v15 = v15;
      }
      else {
        v15 &= 2u;
      }
      if (!(_DWORD)v15) {
        goto LABEL_25;
      }
      double v16 = (void *)objc_opt_class(self);
      double v17 = self->_delay;
      int v22 = 138412546;
      v23 = v16;
      __int16 v24 = 2048;
      double v25 = v17;
      id v12 = v16;
      uint64_t v13 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  2LL,  "%@: Waiting for %.2f seconds",  &v22,  22);
    }

    uint64_t v18 = (void *)v13;

    if (!v18) {
      goto LABEL_26;
    }
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
    free(v18);
    SSFileLog(v5, @"%@");
LABEL_25:

LABEL_26:
    semaphore = self->_semaphore;
    dispatch_time_t v20 = dispatch_time(0LL, (uint64_t)(self->_delay * 1000000000.0));
    dispatch_semaphore_wait((dispatch_semaphore_t)semaphore, v20);
    if (self->_pushToken)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100144D40;
      v21[3] = &unk_10034FA78;
      v21[4] = self;
      [(id)objc_opt_class(self) _accessSemaphorePoolUsingBlock:v21];
    }
  }

+ (void)_accessSemaphorePoolUsingBlock:(id)a3
{
  id v3 = a3;
  if (qword_1003A3520 != -1) {
    dispatch_once(&qword_1003A3520, &stru_10034FA98);
  }
  uint64_t v4 = (dispatch_queue_s *)qword_1003A3528;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100144E40;
  block[3] = &unk_10034ACB8;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (NSDictionary)bodyDictionary
{
  return self->_bodyDictionary;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end