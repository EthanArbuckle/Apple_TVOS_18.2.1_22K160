@interface MSDViewServiceModel
+ (id)sharedInstance;
- (BOOL)showCancelButton;
- (MSDViewServiceModel)init;
- (NSError)errorToReport;
- (NSMutableArray)errors;
- (NSNumber)progress;
- (NSString)errorMessage;
- (id)errorMessageFromErrors;
- (void)didReceiveAllowCancel:(BOOL)a3;
- (void)didReceiveError:(id)a3;
- (void)didReceiveProgress:(int64_t)a3;
- (void)operationCompleted;
- (void)operationFailed:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setErrorToReport:(id)a3;
- (void)setErrors:(id)a3;
- (void)setProgress:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
@end

@implementation MSDViewServiceModel

+ (id)sharedInstance
{
  if (qword_1000122D0 != -1) {
    dispatch_once(&qword_1000122D0, &stru_10000C408);
  }
  return (id)qword_1000122C8;
}

- (MSDViewServiceModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDViewServiceModel;
  v2 = -[MSDViewServiceModel init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
    [v3 setDelegate:v2];

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[MSDViewServiceModel setErrors:](v2, "setErrors:", v4);

    LODWORD(v5) = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v5));
    -[MSDViewServiceModel setProgress:](v2, "setProgress:", v6);

    -[MSDViewServiceModel setShowCancelButton:](v2, "setShowCancelButton:", 0LL);
    v7 = v2;
  }

  return v2;
}

- (id)errorMessageFromErrors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceModel errors](self, "errors"));
  id v4 = [v3 count];

  if (v4)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[MSDViewServiceModel errors](self, "errors"));
    id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v5)
    {
      id v6 = v5;
      v7 = 0LL;
      v8 = &stru_10000C558;
      uint64_t v9 = *(void *)v26;
      do
      {
        v10 = 0LL;
        v11 = v8;
        do
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedFailureReason]);

          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
          id v15 = [v12 code];
          id v16 = v15;
          if (v13)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedFailureReason]);
            uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(0x%lx) - %@\n",  v14,  v16,  v17));

            v7 = (void *)v18;
          }

          else
          {
            v17 = v7;
            v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(0x%lx)\n",  v14,  v15));
          }

          v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v7));
          v10 = (char *)v10 + 1;
          v11 = v8;
        }

        while (v6 != v10);
        id v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }

      while (v6);
    }

    else
    {
      v8 = &stru_10000C558;
    }

    id v21 = sub_100003834();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Full message is now: %{public}@", buf, 0xCu);
    }

    v20 = v8;
    v19 = v20;
  }

  else
  {
    v19 = 0LL;
    v20 = &stru_10000C558;
  }

  return v19;
}

- (void)didReceiveError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceModel errors](self, "errors"));
  [v5 addObject:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDViewServiceModel errorMessageFromErrors](self, "errorMessageFromErrors"));
  -[MSDViewServiceModel setErrorMessage:](self, "setErrorMessage:", v6);
}

- (void)didReceiveProgress:(int64_t)a3
{
  id v5 = sub_100003834();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received progress: %ld", (uint8_t *)&v9, 0xCu);
  }

  if (a3 >= 1)
  {
    *(float *)&double v7 = (float)a3 / 100.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v7));
    -[MSDViewServiceModel setProgress:](self, "setProgress:", v8);
  }

- (void)operationCompleted
{
  id v3 = sub_100003834();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Operation completed, informing the view controller.",  v5,  2u);
  }

  -[MSDViewServiceModel setErrorToReport:](self, "setErrorToReport:", 0LL);
}

- (void)operationFailed:(id)a3
{
  id v4 = a3;
  id v5 = sub_100003834();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Operation failed, informing the view controller.",  v7,  2u);
  }

  -[MSDViewServiceModel setErrorToReport:](self, "setErrorToReport:", v4);
}

- (void)didReceiveAllowCancel:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100003834();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received allow cancel status: %d",  (uint8_t *)v7,  8u);
  }

  -[MSDViewServiceModel setShowCancelButton:](self, "setShowCancelButton:", v3);
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setErrorMessage:(id)a3
{
}

- (NSError)errorToReport
{
  return (NSError *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setErrorToReport:(id)a3
{
}

- (NSNumber)progress
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end