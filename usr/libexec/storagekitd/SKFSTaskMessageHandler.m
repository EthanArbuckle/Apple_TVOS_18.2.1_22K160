@interface SKFSTaskMessageHandler
- (BOOL)taskDone;
- (NSError)error;
- (NSUUID)taskID;
- (OS_dispatch_group)group;
- (SKFSTaskMessageHandler)initWithProgress:(id)a3 dispatchGroup:(id)a4;
- (SKProgress)progress;
- (void)completed:(id)a3 replyHandler:(id)a4;
- (void)getLocalizationSetup:(id)a3;
- (void)logMessage:(id)a3;
- (void)prompt:(id)a3 replyHandler:(id)a4;
- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4;
- (void)setError:(id)a3;
- (void)setTaskID:(id)a3;
@end

@implementation SKFSTaskMessageHandler

- (SKFSTaskMessageHandler)initWithProgress:(id)a3 dispatchGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SKFSTaskMessageHandler;
  v9 = -[SKFSTaskMessageHandler init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progress, a3);
    objc_storeStrong((id *)&v10->_group, a4);
    error = v10->_error;
    v10->_error = 0LL;

    v10->_taskDone = 0;
    v12 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler group](v10, "group"));
    dispatch_group_enter(v12);
  }

  return v10;
}

- (NSError)error
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_error;
  objc_sync_exit(v2);

  return v3;
}

- (void)setError:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v6) {
    objc_storeStrong((id *)&v5->_error, a3);
  }
  objc_sync_exit(v5);
}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = (void (**)(id, void, id))a4;
  if (-[SKFSTaskMessageHandler taskDone](self, "taskDone"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    [v8 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_1000456C0];

    id v9 = sub_10000E2BC();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler taskID](self, "taskID"));
      int v18 = 136315650;
      v19 = "-[SKFSTaskMessageHandler completed:replyHandler:]";
      __int16 v20 = 2112;
      uint64_t v21 = (uint64_t)v11;
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "%s: Reached an extra completion callback for task %@, error %@",  (uint8_t *)&v18,  0x20u);
    }
  }

  else
  {
    id v12 = sub_10000E2BC();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler taskID](self, "taskID"));
      v15 = (void *)v14;
      v16 = &stru_100046600;
      int v18 = 136315650;
      v19 = "-[SKFSTaskMessageHandler completed:replyHandler:]";
      __int16 v20 = 2112;
      if (v6) {
        v16 = v6;
      }
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Task %@ done %@", (uint8_t *)&v18, 0x20u);
    }

    -[SKFSTaskMessageHandler setError:](self, "setError:", v6);
    v17 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler group](self, "group"));
    dispatch_group_leave(v17);

    self->_taskDone = 1;
  }

  v7[2](v7, 0LL, v6);
}

- (void)logMessage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SKFSTaskMessageHandler progress](self, "progress"));
  [v5 setLocalizedAdditionalDescription:v4];
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
}

- (void)getLocalizationSetup:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  (*((void (**)(id, id, void *, void))a3 + 2))(v4, v6, v5, 0LL);
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 24LL, 1);
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 32LL, 1);
}

- (BOOL)taskDone
{
  return self->_taskDone;
}

- (NSUUID)taskID
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTaskID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end