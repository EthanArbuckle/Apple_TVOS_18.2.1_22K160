@interface LACEnvironmentMechanismCompanion
+ (BOOL)supportsSecureCoding;
+ (id)companionForUser:(unsigned int)a3 type:(int64_t)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (LACEnvironmentMechanismCompanion)initWithAvailabilityError:(id)a3 companionType:(int64_t)a4 stateHash:(id)a5;
- (LACEnvironmentMechanismCompanion)initWithCoder:(id)a3;
- (NSData)stateHash;
- (id)descriptionDetails;
- (int64_t)companionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACEnvironmentMechanismCompanion

- (LACEnvironmentMechanismCompanion)initWithAvailabilityError:(id)a3 companionType:(int64_t)a4 stateHash:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  NSStringFromLACCompanionType(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1) {
    v12 = @"applewatch";
  }
  else {
    v12 = @"questionmark";
  }
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanismCompanion;
  v13 = -[LACEnvironmentMechanism initWithAvailabilityError:localizedName:iconSystemName:]( &v15,  sel_initWithAvailabilityError_localizedName_iconSystemName_,  v10,  v11,  v12);

  if (v13)
  {
    v13->_companionType = a4;
    objc_storeStrong((id *)&v13->_stateHash, a5);
  }

  return v13;
}

+ (id)companionForUser:(unsigned int)a3 type:(int64_t)a4 error:(id *)a5
{
  int v6 = a4;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v8 = +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"companions not supported");
  LACLogEnvironment();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11[0] = 67109634;
    v11[1] = a3;
    __int16 v12 = 1024;
    int v13 = v6;
    __int16 v14 = 2114;
    objc_super v15 = v8;
    _os_log_error_impl( &dword_189219000,  v9,  OS_LOG_TYPE_ERROR,  "companionForUser:%u type:%d -> %{public}@",  (uint8_t *)v11,  0x18u);
  }

  if (a5) {
    *a5 = v8;
  }

  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanismCompanion;
  id v4 = a3;
  -[LACEnvironmentMechanism encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  int64_t v5 = -[LACEnvironmentMechanismCompanion companionType](self, "companionType", v9.receiver, v9.super_class);
  NSStringFromSelector(sel_companionType);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v5 forKey:v6];
  v7 = -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
  NSStringFromSelector(sel_stateHash);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:v8];
}

- (LACEnvironmentMechanismCompanion)initWithCoder:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_availabilityError);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectForKey:v5];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_companionType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v4 decodeIntegerForKey:v7];
  NSStringFromSelector(sel_stateHash);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectForKey:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LACEnvironmentMechanismCompanion initWithAvailabilityError:companionType:stateHash:]( self,  "initWithAvailabilityError:companionType:stateHash:",  v6,  v8,  v10);
  return v11;
}

- (id)descriptionDetails
{
  v12[1] = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x189603FA8];
  objc_msgSend( NSString,  "stringWithFormat:",  @"companionType: %d",  -[LACEnvironmentMechanismCompanion companionType](self, "companionType"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 arrayWithArray:v5];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
  if (v7)
  {
    uint64_t v8 = (void *)NSString;
    -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFormat:@"stateHash: %@", v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addObject:v10];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentMechanismCompanion *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanismCompanion;
    if (-[LACEnvironmentMechanism isEqual:](&v14, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v5 = v4;
      int64_t v6 = -[LACEnvironmentMechanismCompanion companionType](self, "companionType");
      if (v6 == -[LACEnvironmentMechanismCompanion companionType](v5, "companionType"))
      {
        v7 = -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
        uint64_t v8 = -[LACEnvironmentMechanismCompanion stateHash](v5, "stateHash");
        if (v7 == (void *)v8)
        {
          char v12 = 1;
          objc_super v9 = v7;
        }

        else
        {
          objc_super v9 = (void *)v8;
          -[LACEnvironmentMechanismCompanion stateHash](self, "stateHash");
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[LACEnvironmentMechanismCompanion stateHash](v5, "stateHash");
          char v12 = [v10 isEqualToData:v11];
        }
      }

      else
      {
        char v12 = 0;
      }
    }

    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (int64_t)companionType
{
  return self->_companionType;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (void).cxx_destruct
{
}

@end