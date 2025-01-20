@interface TVSettingsUserProfileAppleIDAuthenticationController
- (TVSettingsUserProfileAppleIDAuthenticationController)initWithUserProfileAuthenticationType:(int64_t)a3;
- (TVSettingsUserProfilesValidator)validator;
- (int64_t)userProfileAuthenticationType;
- (void)authenticateWithContext:(id)a3 completion:(id)a4;
- (void)setUserProfileAuthenticationType:(int64_t)a3;
- (void)setValidator:(id)a3;
@end

@implementation TVSettingsUserProfileAppleIDAuthenticationController

- (TVSettingsUserProfileAppleIDAuthenticationController)initWithUserProfileAuthenticationType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfileAppleIDAuthenticationController;
  v4 = -[TVSettingsUserProfileAppleIDAuthenticationController init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_userProfileAuthenticationType = a3;
    v6 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfilesValidator);
    validator = v5->_validator;
    v5->_validator = v6;
  }

  return v5;
}

- (void)authenticateWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007E9D4;
  v12[3] = &unk_100191CF0;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a2;
  v12[4] = self;
  id v9 = v8;
  id v14 = v9;
  id v10 = v7;
  id v13 = v10;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfileAppleIDAuthenticationController;
  -[TVSettingsUserProfileAppleIDAuthenticationController authenticateWithContext:completion:]( &v11,  "authenticateWithContext:completion:",  v10,  v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (int64_t)userProfileAuthenticationType
{
  return self->_userProfileAuthenticationType;
}

- (void)setUserProfileAuthenticationType:(int64_t)a3
{
  self->_userProfileAuthenticationType = a3;
}

- (TVSettingsUserProfilesValidator)validator
{
  return self->_validator;
}

- (void)setValidator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end