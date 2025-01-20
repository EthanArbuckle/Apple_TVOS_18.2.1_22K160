@interface APSProcessModePreferences
- (APSProcessModePreferences)initWithUser:(id)a3;
- (APSUser)user;
- (NSDictionary)defaultUserPersistentTopics;
- (NSDictionary)persistentTopics;
- (NSDictionary)tokenTopics;
- (void)setDefaultUserPersistentTopics:(id)a3;
- (void)setPersistentTopics:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation APSProcessModePreferences

- (APSProcessModePreferences)initWithUser:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___APSProcessModePreferences;
  result = -[APSProcessModePreferences init](&v5, "init");
  if (result) {
    result->_user = (APSUser *)a3;
  }
  return result;
}

- (NSDictionary)defaultUserPersistentTopics
{
  v2 = (void *)sub_10007783C(APSPersistentTopicsKey, 1);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }

  return (NSDictionary *)v5;
}

- (void)setDefaultUserPersistentTopics:(id)a3
{
}

- (NSDictionary)persistentTopics
{
  v2 = (void *)sub_10007783C(APSPersistentTopicsKey, -[APSUser isDefaultUser](self->_user, "isDefaultUser"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }

  return (NSDictionary *)v5;
}

- (void)setPersistentTopics:(id)a3
{
  uint64_t v4 = (const __CFString *)APSPersistentTopicsKey;
  user = self->_user;
  id v6 = a3;
  sub_10007792C(v4, v6, -[APSUser isDefaultUser](user, "isDefaultUser"));

  sub_100077A2C(-[APSUser isDefaultUser](self->_user, "isDefaultUser"));
}

- (NSDictionary)tokenTopics
{
  return 0LL;
}

- (APSUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  self->_user = (APSUser *)a3;
}

@end