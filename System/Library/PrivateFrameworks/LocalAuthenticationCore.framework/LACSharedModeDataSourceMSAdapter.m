@interface LACSharedModeDataSourceMSAdapter
- (BOOL)_isManagedSettingsFrameworkAvailable;
- (LACSharedModeDataSourceMSAdapter)initWithReplyQueue:(id)a3;
- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModeDataSourceMSAdapter

- (LACSharedModeDataSourceMSAdapter)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACSharedModeDataSourceMSAdapter;
  v6 = -[LACSharedModeDataSourceMSAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
  }

  return v7;
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  BOOL v6 = -[LACSharedModeDataSourceMSAdapter _isManagedSettingsFrameworkAvailable]( self,  "_isManagedSettingsFrameworkAvailable");
  v7 = +[LACSharedMode defaultSharedMode](&OBJC_CLASS___LACSharedMode, "defaultSharedMode");
  LACLogSharedMode();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v9) {
      goto LABEL_5;
    }
  }

  else if (v9)
  {
LABEL_5:
    -[LACSharedModeDataSourceMSAdapter fetchSharedModeWithOptions:completion:].cold.1();
  }

  v5[2](v5, v7);
}

- (BOOL)_isManagedSettingsFrameworkAvailable
{
  return 0;
}

- (void).cxx_destruct
{
}

- (void)fetchSharedModeWithOptions:completion:.cold.1()
{
}

@end