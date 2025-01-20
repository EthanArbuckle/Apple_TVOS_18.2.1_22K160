@interface SATVPasswordSettingStepConfiguration
+ (id)defaultConfiguration;
- (NSString)description;
- (SATVPasswordSettingStepConfiguration)init;
- (SATVPasswordSettingStepConfiguration)initWithPasswordPromptSetting:(unint64_t)a3;
- (unint64_t)passwordPromptSetting;
@end

@implementation SATVPasswordSettingStepConfiguration

- (SATVPasswordSettingStepConfiguration)initWithPasswordPromptSetting:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVPasswordSettingStepConfiguration;
  result = -[SATVPasswordSettingStepConfiguration init](&v5, "init");
  if (result) {
    result->_passwordPromptSetting = a3;
  }
  return result;
}

- (SATVPasswordSettingStepConfiguration)init
{
  return -[SATVPasswordSettingStepConfiguration initWithPasswordPromptSetting:]( self,  "initWithPasswordPromptSetting:",  0LL);
}

+ (id)defaultConfiguration
{
  return objc_alloc_init((Class)a1);
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = sub_100049F54(self->_passwordPromptSetting);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:@"passwordPromptSetting"];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v6;
}

- (unint64_t)passwordPromptSetting
{
  return self->_passwordPromptSetting;
}

@end