@interface VSDeveloperSettingsViewModel
- (BOOL)cacheBusterEnabled;
- (BOOL)requestTimeoutsDisabled;
- (BOOL)simulateExpiredToken;
- (VSDeveloperSettingsViewModel)initWithSettings:(id)a3;
- (void)setCacheBusterEnabled:(BOOL)a3;
- (void)setRequestTimeoutsDisabled:(BOOL)a3;
- (void)setSimulateExpiredToken:(BOOL)a3;
@end

@implementation VSDeveloperSettingsViewModel

- (VSDeveloperSettingsViewModel)initWithSettings:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsViewModel;
  v5 = -[VSDeveloperSettingsViewModel init](&v8, "init");
  if (v5)
  {
    if (v4)
    {
      v5->_cacheBusterEnabled = [v4 cacheBusterEnabled];
      v5->_requestTimeoutsDisabled = [v4 requestTimeoutsDisabled];
      unsigned __int8 v6 = [v4 simulateExpiredToken];
    }

    else
    {
      unsigned __int8 v6 = 0;
      *(_WORD *)&v5->_cacheBusterEnabled = 0;
    }

    v5->_simulateExpiredToken = v6;
  }

  return v5;
}

- (BOOL)cacheBusterEnabled
{
  return self->_cacheBusterEnabled;
}

- (void)setCacheBusterEnabled:(BOOL)a3
{
  self->_cacheBusterEnabled = a3;
}

- (BOOL)requestTimeoutsDisabled
{
  return self->_requestTimeoutsDisabled;
}

- (void)setRequestTimeoutsDisabled:(BOOL)a3
{
  self->_requestTimeoutsDisabled = a3;
}

- (BOOL)simulateExpiredToken
{
  return self->_simulateExpiredToken;
}

- (void)setSimulateExpiredToken:(BOOL)a3
{
  self->_simulateExpiredToken = a3;
}

@end