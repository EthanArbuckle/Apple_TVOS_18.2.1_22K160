@interface LACEnvironmentMechanismBiometry
+ (BOOL)supportsSecureCoding;
+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6;
- (BOOL)enrolled;
- (BOOL)isEqual:(id)a3;
- (BOOL)lockedOut;
- (BOOL)sensorInaccessible;
- (LACEnvironmentMechanismBiometry)initWithAvailabilityError:(id)a3 biometryType:(int64_t)a4 enrolled:(BOOL)a5 lockedOut:(BOOL)a6 stateHash:(id)a7 sensorInaccessible:(BOOL)a8 approvalState:(int64_t)a9;
- (LACEnvironmentMechanismBiometry)initWithCoder:(id)a3;
- (NSData)stateHash;
- (id)descriptionDetails;
- (int64_t)approvalState;
- (int64_t)biometryType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACEnvironmentMechanismBiometry

- (LACEnvironmentMechanismBiometry)initWithAvailabilityError:(id)a3 biometryType:(int64_t)a4 enrolled:(BOOL)a5 lockedOut:(BOOL)a6 stateHash:(id)a7 sensorInaccessible:(BOOL)a8 approvalState:(int64_t)a9
{
  id v16 = a7;
  id v17 = a3;
  NSLocalizedStringFromLACBiometryType(a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 1LL:
      v19 = @"touchid";
      break;
    case 2LL:
      v19 = @"faceid";
      break;
    case 4LL:
      v19 = @"opticid";
      break;
    default:
      v19 = @"questionmark";
      break;
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanismBiometry;
  v20 = -[LACEnvironmentMechanism initWithAvailabilityError:localizedName:iconSystemName:]( &v22,  sel_initWithAvailabilityError_localizedName_iconSystemName_,  v17,  v18,  v19);

  if (v20)
  {
    v20->_biometryType = a4;
    v20->_enrolled = a5;
    v20->_lockedOut = a6;
    objc_storeStrong((id *)&v20->_stateHash, a7);
    v20->_sensorInaccessible = a8;
    v20->_approvalState = a9;
  }

  return v20;
}

+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LACLogEnvironment();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[LACEnvironmentMechanismBiometry environmentMechanismForUser:auditToken:dependencies:error:].cold.1( (uint64_t)v7,  v8);
  }

  if (a6) {
    *a6 = v7;
  }

  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanismBiometry;
  id v4 = a3;
  -[LACEnvironmentMechanism encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  int64_t v5 = -[LACEnvironmentMechanismBiometry biometryType](self, "biometryType", v17.receiver, v17.super_class);
  NSStringFromSelector(sel_biometryType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v5 forKey:v6];

  BOOL v7 = -[LACEnvironmentMechanismBiometry enrolled](self, "enrolled");
  NSStringFromSelector(sel_enrolled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v7 forKey:v8];

  BOOL v9 = -[LACEnvironmentMechanismBiometry lockedOut](self, "lockedOut");
  NSStringFromSelector(sel_lockedOut);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v9 forKey:v10];
  v11 = -[LACEnvironmentMechanismBiometry stateHash](self, "stateHash");
  NSStringFromSelector(sel_stateHash);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:v12];

  BOOL v13 = -[LACEnvironmentMechanismBiometry sensorInaccessible](self, "sensorInaccessible");
  NSStringFromSelector(sel_sensorInaccessible);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v13 forKey:v14];

  int64_t v15 = -[LACEnvironmentMechanismBiometry approvalState](self, "approvalState");
  NSStringFromSelector(sel_approvalState);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt:v15 forKey:v16];
}

- (LACEnvironmentMechanismBiometry)initWithCoder:(id)a3
{
  id v3 = a3;
  NSStringFromSelector(sel_availabilityError);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 decodeObjectForKey:v20];
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_biometryType);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v3 decodeIntegerForKey:v19];
  NSStringFromSelector(sel_enrolled);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v15 = [v3 decodeBoolForKey:v4];
  NSStringFromSelector(sel_lockedOut);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v3 decodeBoolForKey:v5];
  NSStringFromSelector(sel_stateHash);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 decodeObjectForKey:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sensorInaccessible);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v3 decodeBoolForKey:v9];
  NSStringFromSelector(sel_approvalState);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v3 decodeIntForKey:v11];

  BOOL v13 = -[LACEnvironmentMechanismBiometry initWithAvailabilityError:biometryType:enrolled:lockedOut:stateHash:sensorInaccessible:approvalState:]( self,  "initWithAvailabilityError:biometryType:enrolled:lockedOut:stateHash:sensorInaccessible:approvalState:",  v17,  v16,  v15,  v6,  v8,  v10,  v12);
  return v13;
}

- (id)descriptionDetails
{
  id v3 = (void *)objc_opt_new();
  objc_msgSend( NSString,  "stringWithFormat:",  @"biometryType: %d",  -[LACEnvironmentMechanismBiometry biometryType](self, "biometryType"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];

  if (!-[LACEnvironmentMechanismBiometry enrolled](self, "enrolled")) {
    [v3 addObject:@"not enrolled"];
  }
  if (-[LACEnvironmentMechanismBiometry lockedOut](self, "lockedOut")) {
    [v3 addObject:@"locked out"];
  }
  if (-[LACEnvironmentMechanismBiometry sensorInaccessible](self, "sensorInaccessible")) {
    [v3 addObject:@"sensor inaccessible"];
  }
  if (-[LACEnvironmentMechanismBiometry approvalState](self, "approvalState") != 1)
  {
    int64_t v5 = (void *)NSString;
    NSStringFromLACEnvironmentMechanismApprovalState(-[LACEnvironmentMechanismBiometry approvalState](self, "approvalState"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 stringWithFormat:@"approvalState: %@", v6];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v7];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentMechanismBiometry *)a3;
  if (v4 == self)
  {
    LOBYTE(v15) = 1;
    goto LABEL_13;
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanismBiometry;
  if (!-[LACEnvironmentMechanism isEqual:](&v18, sel_isEqual_, v4)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v15) = 0;
    goto LABEL_13;
  }

  int64_t v5 = v4;
  int64_t v6 = -[LACEnvironmentMechanismBiometry biometryType](self, "biometryType");
  if (v6 != -[LACEnvironmentMechanismBiometry biometryType](v5, "biometryType")) {
    goto LABEL_9;
  }
  BOOL v7 = -[LACEnvironmentMechanismBiometry enrolled](self, "enrolled");
  if (v7 != -[LACEnvironmentMechanismBiometry enrolled](v5, "enrolled")) {
    goto LABEL_9;
  }
  BOOL v8 = -[LACEnvironmentMechanismBiometry lockedOut](self, "lockedOut");
  if (v8 != -[LACEnvironmentMechanismBiometry lockedOut](v5, "lockedOut")) {
    goto LABEL_9;
  }
  -[LACEnvironmentMechanismBiometry stateHash](self, "stateHash");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[LACEnvironmentMechanismBiometry stateHash](v5, "stateHash");
  if (v9 == (void *)v10)
  {

    goto LABEL_15;
  }

  v11 = (void *)v10;
  -[LACEnvironmentMechanismBiometry stateHash](self, "stateHash");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACEnvironmentMechanismBiometry stateHash](v5, "stateHash");
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v12 isEqualToData:v13];

  if (v14)
  {
LABEL_15:
    BOOL v17 = -[LACEnvironmentMechanismBiometry sensorInaccessible](self, "sensorInaccessible");
    BOOL v15 = v17 ^ -[LACEnvironmentMechanismBiometry sensorInaccessible](v5, "sensorInaccessible") ^ 1;
    goto LABEL_10;
  }

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (BOOL)enrolled
{
  return self->_enrolled;
}

- (BOOL)lockedOut
{
  return self->_lockedOut;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (BOOL)sensorInaccessible
{
  return self->_sensorInaccessible;
}

- (int64_t)approvalState
{
  return self->_approvalState;
}

- (void).cxx_destruct
{
}

+ (void)environmentMechanismForUser:(uint64_t)a1 auditToken:(os_log_s *)a2 dependencies:error:.cold.1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_189219000,  a2,  OS_LOG_TYPE_ERROR,  "LACEnvironmentMechanismBiometry: %{public}@",  (uint8_t *)&v2,  0xCu);
}

@end