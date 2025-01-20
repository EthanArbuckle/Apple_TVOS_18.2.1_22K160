@interface LAEnvironmentMechanismBiometry
- (BOOL)builtInSensorInaccessible;
- (BOOL)isEnrolled;
- (BOOL)isLockedOut;
- (LAEnvironmentMechanismBiometry)initWithCoreMechanism:(id)a3;
- (NSData)stateHash;
- (id)unsaltedStateHash;
- (int64_t)approvalState;
- (int64_t)biometryType;
- (void)setApprovalState:(int64_t)a3;
@end

@implementation LAEnvironmentMechanismBiometry

- (LAEnvironmentMechanismBiometry)initWithCoreMechanism:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LAEnvironmentMechanismBiometry;
  return -[LAEnvironmentMechanism initWithCoreMechanism:](&v4, sel_initWithCoreMechanism_, a3);
}

- (int64_t)biometryType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 biometryType];

  return v3;
}

- (BOOL)isEnrolled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 enrolled];

  return v3;
}

- (BOOL)isLockedOut
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 lockedOut];

  return v3;
}

- (NSData)stateHash
{
  v2 = (void *)MEMORY[0x189610798];
  -[LAEnvironmentMechanismBiometry unsaltedStateHash](self, "unsaltedStateHash");
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896077F8] mainBundle];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 bundleIdentifier];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 saltHash:v3 withBundleID:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v6;
}

- (id)unsaltedStateHash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stateHash];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)builtInSensorInaccessible
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 sensorInaccessible];

  return v3;
}

- (int64_t)approvalState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 approvalState];

  return v3;
}

- (void)setApprovalState:(int64_t)a3
{
  self->_approvalState = a3;
}

@end