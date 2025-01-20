@interface TVSettingsTapToAddUserResult
- (BOOL)isVoiceProfileAvailable;
- (NSArray)homeUserInfo;
- (PBSUserProfile)userProfile;
- (TVSettingsTapToAddUserResult)initWithUserProfile:(id)a3 isVoiceProfileAvailable:(BOOL)a4 homeUserInfo:(id)a5;
@end

@implementation TVSettingsTapToAddUserResult

- (TVSettingsTapToAddUserResult)initWithUserProfile:(id)a3 isVoiceProfileAvailable:(BOOL)a4 homeUserInfo:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSettingsTapToAddUserResult;
  v11 = -[TVSettingsTapToAddUserResult init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userProfile, a3);
    v12->_isVoiceProfileAvailable = a4;
    objc_storeStrong((id *)&v12->_homeUserInfo, a5);
  }

  return v12;
}

- (PBSUserProfile)userProfile
{
  return self->_userProfile;
}

- (BOOL)isVoiceProfileAvailable
{
  return self->_isVoiceProfileAvailable;
}

- (NSArray)homeUserInfo
{
  return self->_homeUserInfo;
}

- (void).cxx_destruct
{
}

@end