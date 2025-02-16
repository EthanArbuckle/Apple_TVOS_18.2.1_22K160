id MTLoggingContinuousRecordingFilterManager()
{
  if (MTLoggingContinuousRecordingFilterManager::onceToken != -1) {
    dispatch_once(&MTLoggingContinuousRecordingFilterManager::onceToken, &__block_literal_global);
  }
  return (id)MTLoggingContinuousRecordingFilterManager::__logObj;
}

id MTLoggingCrownFilterManager()
{
  if (MTLoggingCrownFilterManager::onceToken != -1) {
    dispatch_once(&MTLoggingCrownFilterManager::onceToken, &__block_literal_global_3);
  }
  return (id)MTLoggingCrownFilterManager::__logObj;
}

id MTLoggingRemoteFilterManager()
{
  if (MTLoggingRemoteFilterManager::onceToken != -1) {
    dispatch_once(&MTLoggingRemoteFilterManager::onceToken, &__block_literal_global_5);
  }
  return (id)MTLoggingRemoteFilterManager::__logObj;
}

id MTLoggingAnalyticsFilterManager()
{
  if (MTLoggingAnalyticsFilterManager::onceToken != -1) {
    dispatch_once(&MTLoggingAnalyticsFilterManager::onceToken, &__block_literal_global_7);
  }
  return (id)MTLoggingAnalyticsFilterManager::__logObj;
}

void sub_1000015E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000017B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100001AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

LABEL_8:
  v10[2](v10, v19, v12);
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   v21 = @"No file handle";
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  0LL,  v15));

LABEL_6:
    goto LABEL_8;
  }

  v18 = 0LL;
  v11 = [v9 seekToEndReturningOffset:&v19 error:&v18];
  v12 = v18;
  if (v11)
  {
    v17 = 0LL;
    v13 = [v9 writeData:v8 error:&v17];
    v14 = v17;

    if (!v13)
    {
      v12 = v14;
      goto LABEL_8;
    }

    v16 = 0LL;
    [v9 getOffset:&v19 error:&v16];
    v12 = v16;
    goto LABEL_6;
  }

- (void)fileExistsAtURL:(id)a3 isDirectory:(BOOL)a4 withReply:(id)a5
{
  int v5 = a4;
  unsigned __int8 v13 = 0;
  v7 = (void (**)(id, void))a5;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);

  unsigned int v11 = [v9 fileExistsAtPath:v10 isDirectory:&v13];
  if (v13 == v5) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0LL;
  }
  v7[2](v7, v12);
}

@end