@interface VSDeveloperSettingsSetTopBoxViewModel
+ (id)keyPathsForValuesAffectingCurrentSubscriptionHash;
- (BOOL)preparingForSetupTesting;
- (BOOL)setTopBoxModeEnabled;
- (BOOL)setTopBoxSupportsOptOut;
- (BOOL)setTopBoxUseProfileToken;
- (NSString)profileUserToken;
- (NSString)setTopBoxBundleIdentifier;
- (NSString)setTopBoxUserToken;
- (NSString)setTopBoxUserTokenDisplayValue;
- (VSDeveloperSettingsSetTopBoxViewModel)initWithSettings:(id)a3;
- (VSSubscription)currentSubscription;
- (unint64_t)currentSubscriptionHash;
- (void)setCurrentSubscription:(id)a3;
- (void)setPreparingForSetupTesting:(BOOL)a3;
- (void)setProfileUserToken:(id)a3;
- (void)setSetTopBoxBundleIdentifier:(id)a3;
- (void)setSetTopBoxModeEnabled:(BOOL)a3;
- (void)setSetTopBoxSupportsOptOut:(BOOL)a3;
- (void)setSetTopBoxUseProfileToken:(BOOL)a3;
- (void)setSetTopBoxUserToken:(id)a3;
- (void)setSetTopBoxUserTokenDisplayValue:(id)a3;
@end

@implementation VSDeveloperSettingsSetTopBoxViewModel

- (VSDeveloperSettingsSetTopBoxViewModel)initWithSettings:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsSetTopBoxViewModel;
  v5 = -[VSDeveloperSettingsSetTopBoxViewModel init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 setTopBoxUserToken]);
    -[VSDeveloperSettingsSetTopBoxViewModel setSetTopBoxUserToken:](v5, "setSetTopBoxUserToken:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 setTopBoxBundleIdentifier]);
    -[VSDeveloperSettingsSetTopBoxViewModel setSetTopBoxBundleIdentifier:](v5, "setSetTopBoxBundleIdentifier:", v7);

    -[VSDeveloperSettingsSetTopBoxViewModel setSetTopBoxModeEnabled:]( v5,  "setSetTopBoxModeEnabled:",  [v4 isInSetTopBoxMode]);
    -[VSDeveloperSettingsSetTopBoxViewModel setSetTopBoxSupportsOptOut:]( v5,  "setSetTopBoxSupportsOptOut:",  [v4 setTopBoxSupportsOptOut]);
    -[VSDeveloperSettingsSetTopBoxViewModel setSetTopBoxUseProfileToken:]( v5,  "setSetTopBoxUseProfileToken:",  [v4 setTopBoxUseDeviceProfile]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_4A7C;
    v10[3] = &unk_14368;
    v11 = v5;
    id v12 = v4;
    [v8 fetchDeviceManagedSetTopBoxProfileWithCompletion:v10];
  }

  return v5;
}

- (unint64_t)currentSubscriptionHash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewModel setTopBoxBundleIdentifier](self, "setTopBoxBundleIdentifier"));
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewModel currentSubscription](self, "currentSubscription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 modificationDate]);
  unint64_t v7 = (unint64_t)[v6 hash] ^ v4;

  uint64_t v8 = VSDefaultLogObject();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    unint64_t v12 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Current subscription hash is %lu.", (uint8_t *)&v11, 0xCu);
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingCurrentSubscriptionHash
{
  if (qword_1A0F8 != -1) {
    dispatch_once(&qword_1A0F8, &stru_143A8);
  }
  return (id)qword_1A0F0;
}

- (NSString)setTopBoxUserToken
{
  return self->_setTopBoxUserToken;
}

- (void)setSetTopBoxUserToken:(id)a3
{
}

- (NSString)setTopBoxUserTokenDisplayValue
{
  return self->_setTopBoxUserTokenDisplayValue;
}

- (void)setSetTopBoxUserTokenDisplayValue:(id)a3
{
}

- (NSString)setTopBoxBundleIdentifier
{
  return self->_setTopBoxBundleIdentifier;
}

- (void)setSetTopBoxBundleIdentifier:(id)a3
{
}

- (BOOL)setTopBoxModeEnabled
{
  return self->_setTopBoxModeEnabled;
}

- (void)setSetTopBoxModeEnabled:(BOOL)a3
{
  self->_setTopBoxModeEnabled = a3;
}

- (BOOL)setTopBoxUseProfileToken
{
  return self->_setTopBoxUseProfileToken;
}

- (void)setSetTopBoxUseProfileToken:(BOOL)a3
{
  self->_setTopBoxUseProfileToken = a3;
}

- (NSString)profileUserToken
{
  return self->_profileUserToken;
}

- (void)setProfileUserToken:(id)a3
{
}

- (BOOL)setTopBoxSupportsOptOut
{
  return self->_setTopBoxSupportsOptOut;
}

- (void)setSetTopBoxSupportsOptOut:(BOOL)a3
{
  self->_setTopBoxSupportsOptOut = a3;
}

- (VSSubscription)currentSubscription
{
  return self->_currentSubscription;
}

- (void)setCurrentSubscription:(id)a3
{
}

- (BOOL)preparingForSetupTesting
{
  return self->_preparingForSetupTesting;
}

- (void)setPreparingForSetupTesting:(BOOL)a3
{
  self->_preparingForSetupTesting = a3;
}

- (void).cxx_destruct
{
}

@end