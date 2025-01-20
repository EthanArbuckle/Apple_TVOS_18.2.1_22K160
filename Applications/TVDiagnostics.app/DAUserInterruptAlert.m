@interface DAUserInterruptAlert
- (DAUserInterruptAlert)initWithSuiteName:(id)a3 withHandler:(id)a4;
- (NSString)suiteName;
- (id)handler;
- (void)activate;
- (void)setHandler:(id)a3;
- (void)setSuiteName:(id)a3;
@end

@implementation DAUserInterruptAlert

- (DAUserInterruptAlert)initWithSuiteName:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DAUserInterruptAlert;
  v9 = -[DAUserInterruptAlert init](&v13, "init");
  if (v9)
  {
    id v10 = objc_retainBlock(v8);
    id handler = v9->_handler;
    v9->_id handler = v10;

    objc_storeStrong((id *)&v9->_suiteName, a3);
  }

  return v9;
}

- (void)activate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlert suiteName](self, "suiteName"));
  id v10 = sub_10001837C(@"SKIP_SUITE", @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  id v17 = (id)objc_claimAutoreleasedReturnValue(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DAPlatform currentPlatform](&OBJC_CLASS___DAPlatform, "currentPlatform"));
  id v12 = sub_1000182A4(@"SKIP");
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = sub_1000182A4(@"CANCEL");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DAUserInterruptAlert handler](self, "handler"));
  [v11 activateSimpleAlertWithTitle:v17 message:0 defaultButtonName:v13 cancelButtonName:v15 handler:v16];
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end