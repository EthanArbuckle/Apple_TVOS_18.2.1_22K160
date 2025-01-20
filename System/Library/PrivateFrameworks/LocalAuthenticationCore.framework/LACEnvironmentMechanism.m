@interface LACEnvironmentMechanism
+ (BOOL)supportsSecureCoding;
+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (LACEnvironmentMechanism)initWithAvailabilityError:(id)a3 localizedName:(id)a4 iconSystemName:(id)a5;
- (LACEnvironmentMechanism)initWithCoder:(id)a3;
- (NSError)availabilityError;
- (NSString)iconSystemName;
- (NSString)localizedName;
- (id)description;
- (id)descriptionDetails;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACEnvironmentMechanism

- (LACEnvironmentMechanism)initWithAvailabilityError:(id)a3 localizedName:(id)a4 iconSystemName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACEnvironmentMechanism;
  v12 = -[LACEnvironmentMechanism init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_availabilityError, a3);
    objc_storeStrong((id *)&v13->_localizedName, a4);
    objc_storeStrong((id *)&v13->_iconSystemName, a5);
  }

  return v13;
}

+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  if (a6)
  {
    +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"Call must be made on a subclass",  a5);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
  NSStringFromSelector(sel_availabilityError);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:v6];
  v7 = -[LACEnvironmentMechanism localizedName](self, "localizedName");
  NSStringFromSelector(sel_localizedName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:v8];

  -[LACEnvironmentMechanism iconSystemName](self, "iconSystemName");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_iconSystemName);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:v9];
}

- (LACEnvironmentMechanism)initWithCoder:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_availabilityError);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectForKey:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectForKey:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_iconSystemName);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectForKey:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = -[LACEnvironmentMechanism initWithAvailabilityError:localizedName:iconSystemName:]( self,  "initWithAvailabilityError:localizedName:iconSystemName:",  v6,  v8,  v10);
  return v11;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[LACError error:hasCode:](&OBJC_CLASS___LACError, "error:hasCode:", v4, -1004LL))
  {
    v5 = @"usable";
  }

  else
  {
    v6 = (void *)NSString;
    v7 = -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
    [v7 domain];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringWithFormat:@"%@ error %d", v8, objc_msgSend(v9, "code")];
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  id v10 = (void *)NSString;
  -[LACEnvironmentMechanism localizedName](self, "localizedName");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", @", ");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringWithFormat:@"<'%@' %@ (%@)>", v11, v5, v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)descriptionDetails
{
  return (id)MEMORY[0x189604A58];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LACEnvironmentMechanism *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
      uint64_t v7 = -[LACEnvironmentMechanism availabilityError](v5, "availabilityError");
      if (v6 == (void *)v7)
      {
      }

      else
      {
        v8 = (void *)v7;
        -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACEnvironmentMechanism availabilityError](v5, "availabilityError");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_11;
        }
      }
      v13 = -[LACEnvironmentMechanism localizedName](self, "localizedName");
      uint64_t v14 = -[LACEnvironmentMechanism localizedName](v5, "localizedName");
      if (v13 == (void *)v14)
      {
      }

      else
      {
        objc_super v15 = (void *)v14;
        v16 = -[LACEnvironmentMechanism localizedName](self, "localizedName");
        v17 = -[LACEnvironmentMechanism localizedName](v5, "localizedName");
        int v18 = [v16 isEqualToString:v17];

        if (!v18)
        {
LABEL_11:
          char v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      v19 = -[LACEnvironmentMechanism iconSystemName](self, "iconSystemName");
      uint64_t v20 = -[LACEnvironmentMechanism iconSystemName](v5, "iconSystemName");
      if (v19 == (void *)v20)
      {
        char v12 = 1;
        v21 = v19;
      }

      else
      {
        v21 = (void *)v20;
        v22 = -[LACEnvironmentMechanism iconSystemName](self, "iconSystemName");
        v23 = -[LACEnvironmentMechanism iconSystemName](v5, "iconSystemName");
        char v12 = [v22 isEqualToString:v23];
      }

      goto LABEL_17;
    }

    char v12 = 0;
  }

- (NSError)availabilityError
{
  return self->_availabilityError;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void).cxx_destruct
{
}

@end