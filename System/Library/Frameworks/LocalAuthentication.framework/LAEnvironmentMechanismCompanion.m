@interface LAEnvironmentMechanismCompanion
- (LAEnvironmentMechanismCompanion)initWithCoreMechanism:(id)a3;
- (NSData)stateHash;
- (int64_t)companionType;
- (int64_t)type;
@end

@implementation LAEnvironmentMechanismCompanion

- (LAEnvironmentMechanismCompanion)initWithCoreMechanism:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LAEnvironmentMechanismCompanion;
  return -[LAEnvironmentMechanism initWithCoreMechanism:](&v4, sel_initWithCoreMechanism_, a3);
}

- (int64_t)companionType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 companionType];

  return v3;
}

- (NSData)stateHash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stateHash];
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (int64_t)type
{
  return self->_type;
}

@end