@interface TVAppSettingsSyncMySportsEnabledShim
- (NSNumber)syncMySportsEnabled;
- (TVAppSettingsSyncMySportsEnabledDelegate)delegate;
- (TVAppSettingsSyncMySportsEnabledShim)initWithDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSyncMySportsEnabled:(id)a3;
@end

@implementation TVAppSettingsSyncMySportsEnabledShim

- (TVAppSettingsSyncMySportsEnabledShim)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVAppSettingsSyncMySportsEnabledShim;
  v5 = -[TVAppSettingsSyncMySportsEnabledShim init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (NSNumber)syncMySportsEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppSettingsSyncMySportsEnabledShim delegate](self, "delegate"));
  else {
    v3 = &__kCFBooleanFalse;
  }

  return (NSNumber *)v3;
}

- (void)setSyncMySportsEnabled:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppSettingsSyncMySportsEnabledShim delegate](self, "delegate"));
}

- (TVAppSettingsSyncMySportsEnabledDelegate)delegate
{
  return (TVAppSettingsSyncMySportsEnabledDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end