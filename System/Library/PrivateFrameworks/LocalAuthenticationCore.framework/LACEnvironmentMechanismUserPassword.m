@interface LACEnvironmentMechanismUserPassword
+ (BOOL)supportsSecureCoding;
+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)set;
- (LACEnvironmentMechanismUserPassword)initWithAvailabilityError:(id)a3 set:(BOOL)a4;
- (LACEnvironmentMechanismUserPassword)initWithCoder:(id)a3;
- (id)descriptionDetails;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACEnvironmentMechanismUserPassword

- (LACEnvironmentMechanismUserPassword)initWithAvailabilityError:(id)a3 set:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanismUserPassword;
  result = -[LACEnvironmentMechanism initWithAvailabilityError:localizedName:iconSystemName:]( &v6,  sel_initWithAvailabilityError_localizedName_iconSystemName_,  a3,  @"Passcode",  @"lock.shield");
  if (result) {
    result->_set = a4;
  }
  return result;
}

+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LACLogEnvironment();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[LACEnvironmentMechanismUserPassword environmentMechanismForUser:auditToken:dependencies:error:].cold.1( (uint64_t)v7,  v8);
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
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanismUserPassword;
  id v4 = a3;
  -[LACEnvironmentMechanism encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  BOOL v5 = -[LACEnvironmentMechanismUserPassword set](self, "set", v7.receiver, v7.super_class);
  NSStringFromSelector("set");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v5 forKey:v6];
}

- (LACEnvironmentMechanismUserPassword)initWithCoder:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_availabilityError);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectForKey:v5];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("set");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v4 decodeBoolForKey:v7];

  v9 = -[LACEnvironmentMechanismUserPassword initWithAvailabilityError:set:]( self,  "initWithAvailabilityError:set:",  v6,  v8);
  return v9;
}

- (id)descriptionDetails
{
  v5[1] = *MEMORY[0x1895F89C0];
  BOOL v2 = -[LACEnvironmentMechanismUserPassword set](self, "set");
  v3 = @"not set";
  if (v2) {
    v3 = @"set";
  }
  v5[0] = v3;
  [MEMORY[0x189603F18] arrayWithObjects:v5 count:1];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentMechanismUserPassword *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanismUserPassword;
    if (-[LACEnvironmentMechanism isEqual:](&v10, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v5 = v4;
      BOOL v6 = -[LACEnvironmentMechanismUserPassword set](self, "set");
      BOOL v7 = -[LACEnvironmentMechanismUserPassword set](v5, "set");

      char v8 = v6 ^ v7 ^ 1;
    }

    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)set
{
  return self->_set;
}

+ (void)environmentMechanismForUser:(uint64_t)a1 auditToken:(os_log_s *)a2 dependencies:error:.cold.1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_189219000,  a2,  OS_LOG_TYPE_ERROR,  "LACEnvironmentMechanismUserPassword: %{public}@",  (uint8_t *)&v2,  0xCu);
}

@end