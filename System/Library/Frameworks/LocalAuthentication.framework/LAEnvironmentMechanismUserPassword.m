@interface LAEnvironmentMechanismUserPassword
- (BOOL)isSet;
- (LAEnvironmentMechanismUserPassword)initWithCoreMechanism:(id)a3;
@end

@implementation LAEnvironmentMechanismUserPassword

- (LAEnvironmentMechanismUserPassword)initWithCoreMechanism:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LAEnvironmentMechanismUserPassword;
  return -[LAEnvironmentMechanism initWithCoreMechanism:](&v4, sel_initWithCoreMechanism_, a3);
}

- (BOOL)isSet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 set];

  return v3;
}

@end