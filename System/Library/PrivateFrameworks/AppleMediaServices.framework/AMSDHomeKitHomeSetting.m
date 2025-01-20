@interface AMSDHomeKitHomeSetting
- (AMSDHomeKitHomeSetting)initWithSetting:(id)a3;
- (BOOL)BOOLValue;
- (HMSetting)setting;
- (NSString)hashedDescription;
- (void)setSetting:(id)a3;
@end

@implementation AMSDHomeKitHomeSetting

- (AMSDHomeKitHomeSetting)initWithSetting:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSDHomeKitHomeSetting;
  v6 = -[AMSDHomeKitHomeSetting init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_setting, a3);
  }

  return v7;
}

- (BOOL)BOOLValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeSetting setting](self, "setting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 value]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  unsigned __int8 v7 = [v6 BOOLValue];
  return v7;
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeSetting setting](self, "setting"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyPath]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHomeSetting setting](self, "setting"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
  uint64_t v8 = AMSHashIfNeeded(v7);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p keyPath = %@ | value = %@>",  v3,  self,  v5,  v9));

  return (NSString *)v10;
}

- (HMSetting)setting
{
  return self->_setting;
}

- (void)setSetting:(id)a3
{
}

- (void).cxx_destruct
{
}

@end