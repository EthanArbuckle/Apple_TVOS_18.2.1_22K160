@interface SATVChooseSetupMethodStepConfiguration
+ (id)defaultConfiguration;
- (NSString)description;
- (SATVChooseSetupMethodStepConfiguration)init;
- (SATVChooseSetupMethodStepConfiguration)initWithBluetoothKeyboardSetupMode:(int64_t)a3 passwordPromptSetting:(unint64_t)a4;
- (int64_t)bluetoothKeyboardSetupMode;
- (unint64_t)passwordPromptSetting;
@end

@implementation SATVChooseSetupMethodStepConfiguration

- (SATVChooseSetupMethodStepConfiguration)initWithBluetoothKeyboardSetupMode:(int64_t)a3 passwordPromptSetting:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodStepConfiguration;
  result = -[SATVChooseSetupMethodStepConfiguration init](&v7, "init");
  if (result)
  {
    result->_bluetoothKeyboardSetupMode = a3;
    result->_passwordPromptSetting = a4;
  }

  return result;
}

- (SATVChooseSetupMethodStepConfiguration)init
{
  return -[SATVChooseSetupMethodStepConfiguration initWithBluetoothKeyboardSetupMode:passwordPromptSetting:]( self,  "initWithBluetoothKeyboardSetupMode:passwordPromptSetting:",  2LL,  0LL);
}

+ (id)defaultConfiguration
{
  return objc_alloc_init((Class)a1);
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = v3;
  unint64_t v5 = self->_bluetoothKeyboardSetupMode - 1;
  if (v5 > 2) {
    v6 = @"NotSupported";
  }
  else {
    v6 = off_1000CAEA0[v5];
  }
  [v3 appendString:v6 withName:@"bluetoothKeyboardSetupMode"];
  objc_super v7 = sub_100049F54(self->_passwordPromptSetting);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 appendString:v8 withName:@"passwordPromptSetting"];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 build]);
  return (NSString *)v9;
}

- (int64_t)bluetoothKeyboardSetupMode
{
  return self->_bluetoothKeyboardSetupMode;
}

- (unint64_t)passwordPromptSetting
{
  return self->_passwordPromptSetting;
}

@end