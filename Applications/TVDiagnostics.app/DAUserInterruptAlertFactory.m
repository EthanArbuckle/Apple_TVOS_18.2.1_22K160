@interface DAUserInterruptAlertFactory
+ (id)sharedInstance;
+ (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4;
+ (void)reset;
- (DAUserInterruptAlert)visibleAlert;
- (DAUserInterruptAlertFactory)init;
- (NSLock)alertVisibleLock;
- (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4;
- (void)setAlertVisibleLock:(id)a3;
- (void)setVisibleAlert:(id)a3;
@end

@implementation DAUserInterruptAlertFactory

+ (id)sharedInstance
{
  if (qword_10003A608 != -1) {
    dispatch_once(&qword_10003A608, &stru_10002CA40);
  }
  return (id)qword_10003A600;
}

+ (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  [v8 activateAlertForSuiteName:v7 withHandler:v6];
}

+ (void)reset
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v4 alertVisibleLock]);
  [v2 lock];

  [v4 setVisibleAlert:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 alertVisibleLock]);
  [v3 unlock];
}

- (DAUserInterruptAlertFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DAUserInterruptAlertFactory;
  v2 = -[DAUserInterruptAlertFactory init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSLock);
    alertVisibleLock = v2->_alertVisibleLock;
    v2->_alertVisibleLock = v3;
  }

  return v2;
}

- (void)activateAlertForSuiteName:(id)a3 withHandler:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory alertVisibleLock](self, "alertVisibleLock"));
  [v7 lock];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory visibleAlert](self, "visibleAlert"));
  if (!v8)
  {
    v9 = -[DAUserInterruptAlert initWithSuiteName:withHandler:]( objc_alloc(&OBJC_CLASS___DAUserInterruptAlert),  "initWithSuiteName:withHandler:",  v14,  v6);
    -[DAUserInterruptAlertFactory setVisibleAlert:](self, "setVisibleAlert:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory alertVisibleLock](self, "alertVisibleLock"));
    [v10 unlock];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory visibleAlert](self, "visibleAlert"));
    [v11 activate];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory alertVisibleLock](self, "alertVisibleLock"));
    [v12 lock];

    -[DAUserInterruptAlertFactory setVisibleAlert:](self, "setVisibleAlert:", 0LL);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlertFactory alertVisibleLock](self, "alertVisibleLock"));
  [v13 unlock];
}

- (NSLock)alertVisibleLock
{
  return self->_alertVisibleLock;
}

- (void)setAlertVisibleLock:(id)a3
{
}

- (DAUserInterruptAlert)visibleAlert
{
  return self->_visibleAlert;
}

- (void)setVisibleAlert:(id)a3
{
}

- (void).cxx_destruct
{
}

@end