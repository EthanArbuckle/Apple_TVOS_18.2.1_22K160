@interface LAEnvironmentMechanism
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsable;
- (LACEnvironmentMechanism)coreMechanism;
- (LAEnvironmentMechanism)initWithCoreMechanism:(id)a3;
- (NSString)iconSystemName;
- (NSString)localizedName;
- (id)availabilityError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation LAEnvironmentMechanism

- (LAEnvironmentMechanism)initWithCoreMechanism:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___LAEnvironmentMechanism;
    v6 = -[LAEnvironmentMechanism init](&v10, sel_init);
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_coreMechanism, a3);
    }
    self = v7;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v4 initWithCoreMechanism:v5];

  return v6;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 description];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LAEnvironmentMechanism *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[LAEnvironmentMechanism coreMechanism](v4, "coreMechanism");
      char v7 = [v5 isEqual:v6];
    }

    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isUsable
{
  v2 = (void *)MEMORY[0x1896107C0];
  v3 = -[LAEnvironmentMechanism coreMechanism](self, "coreMechanism");
  [v3 availabilityError];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = [v2 error:v4 hasCode:*MEMORY[0x189610670]];

  return (char)v2;
}

- (NSString)localizedName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 localizedName];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)iconSystemName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 iconSystemName];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)availabilityError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 availabilityError];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (LACEnvironmentMechanism)coreMechanism
{
  return self->_coreMechanism;
}

- (void).cxx_destruct
{
}

@end