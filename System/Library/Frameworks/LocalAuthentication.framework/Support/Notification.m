@interface Notification
- (BOOL)suspended;
- (LANotificationObserverXPC)observer;
- (NSString)className;
- (NSString)description;
- (Notification)initWithObserver:(id)a3 observerPid:(int)a4 className:(id)a5;
- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5;
- (void)resumeAndNotify:(BOOL)a3 completionHandler:(id)a4;
- (void)suspendWithCompletionHandler:(id)a3;
@end

@implementation Notification

- (Notification)initWithObserver:(id)a3 observerPid:(int)a4 className:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___Notification;
  v11 = -[Notification init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_observer, a3);
    v12->_observerPid = a4;
    objc_storeStrong((id *)&v12->_className, a5);
  }

  return v12;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Notification className](self, "className"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: className:%@, suspended:%d, PID:%d>",  v5,  self,  v6,  -[Notification suspended](self, "suspended"),  self->_observerPid));

  return (NSString *)v7;
}

- (void)resumeAndNotify:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  id v7 = sub_100002CE0();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = "resume";
    if (v4) {
      id v9 = "resume and notify observer";
    }
    int v13 = 138543618;
    objc_super v14 = self;
    __int16 v15 = 2082;
    v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ will %{public}s",  (uint8_t *)&v13,  0x16u);
  }

  self->_suspended = 0;
  if (v4)
  {
    id v10 = (void *)qword_10003E1B0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[Notification className](self, "className"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
    -[Notification newValue:oldValue:completionHandler:](self, "newValue:oldValue:completionHandler:", v12, 0LL, v6);
  }

  else
  {
    v6[2](v6);
  }
}

- (void)suspendWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v5 = sub_100002CE0();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will suspend", (uint8_t *)&v7, 0xCu);
  }

  self->_suspended = 1;
  v4[2](v4);
}

- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (-[Notification suspended](self, "suspended"))
  {
    v10[2](v10);
  }

  else
  {
    if (v8)
    {
      if (qword_10003E1B8 != -1) {
        dispatch_once(&qword_10003E1B8, &stru_100030878);
      }
      v11 = (void *)qword_10003E1B0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[Notification className](self, "className"));
      [v11 setObject:v8 forKey:v12];
    }

    id v13 = sub_100002CE0();
    objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int observerPid = self->_observerPid;
      int v17 = 138544130;
      v18 = self;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v9;
      __int16 v23 = 1024;
      int v24 = observerPid;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ has received newValue: %{public}@, oldValue: %{public}@, notifying PID %d",  (uint8_t *)&v17,  0x26u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[Notification observer](self, "observer"));
    [v16 newValue:v8 oldValue:v9 completionHandler:v10];
  }
}

- (NSString)className
{
  return self->_className;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (LANotificationObserverXPC)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
}

@end