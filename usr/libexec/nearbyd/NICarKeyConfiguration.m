@interface NICarKeyConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)_labTestModeConfigurationWithOptions:(id)a3;
+ (id)_vehicleSimConfigurationWithOptions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NICarKeyConfiguration)initWithCoder:(id)a3;
- (NICarKeyConfiguration)initWithConfiguration:(id)a3;
- (NICarKeyConfiguration)initWithVehicleIdentifier:(id)a3;
- (NSDictionary)debugOptions;
- (NSString)vehicleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)initLabTestModeConfiguration:(id)a3;
- (id)initVehicleSimConfiguration:(id)a3;
- (int64_t)configurationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDebugOptions:(id)a3;
- (void)setVehicleIdentifier:(id)a3;
@end

@implementation NICarKeyConfiguration

- (NICarKeyConfiguration)initWithVehicleIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2, self, @"NICarKeyConfiguration.mm", 17, @"Invalid parameter not satisfying: %@", @"vehicleIdentifier" object file lineNumber description];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NICarKeyConfiguration;
  v7 = -[NIConfiguration initInternal](&v11, "initInternal");
  v8 = (NICarKeyConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 5, a3);
    v8->_configurationTypeInternal = 1LL;
  }

  return v8;
}

- (id)initVehicleSimConfiguration:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"NICarKeyConfiguration.mm", 27, @"Invalid parameter not satisfying: %@", @"debugOptions" object file lineNumber description];
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NICarKeyConfiguration;
  v7 = -[NIConfiguration initInternal](&v12, "initInternal");
  v8 = (id *)v7;
  if (v7)
  {
    v9 = (void *)v7[5];
    v7[5] = @"VEHICLE SIMULATION CONFIGURATION";

    objc_storeStrong(v8 + 6, a3);
    v8[4] = (id)2;
  }

  return v8;
}

- (id)initLabTestModeConfiguration:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"NICarKeyConfiguration.mm", 38, @"Invalid parameter not satisfying: %@", @"debugOptions" object file lineNumber description];
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NICarKeyConfiguration;
  v7 = -[NIConfiguration initInternal](&v12, "initInternal");
  v8 = (id *)v7;
  if (v7)
  {
    v9 = (void *)v7[5];
    v7[5] = @"TEST MODE CONFIGURATION";

    objc_storeStrong(v8 + 6, a3);
    v8[4] = (id)3;
  }

  return v8;
}

+ (id)_vehicleSimConfigurationWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = -[NICarKeyConfiguration initVehicleSimConfiguration:]( objc_alloc(&OBJC_CLASS___NICarKeyConfiguration),  "initVehicleSimConfiguration:",  v3);

  return v4;
}

+ (id)_labTestModeConfigurationWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = -[NICarKeyConfiguration initLabTestModeConfiguration:]( objc_alloc(&OBJC_CLASS___NICarKeyConfiguration),  "initLabTestModeConfiguration:",  v3);

  return v4;
}

- (NICarKeyConfiguration)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"NICarKeyConfiguration.mm", 57, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NICarKeyConfiguration;
  id v6 = -[NIConfiguration initInternal](&v13, "initInternal");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 vehicleIdentifier]);
    vehicleIdentifier = v6->_vehicleIdentifier;
    v6->_vehicleIdentifier = (NSString *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 debugOptions]);
    debugOptions = v6->_debugOptions;
    v6->_debugOptions = (NSDictionary *)v9;

    v6->_configurationTypeInternal = (int64_t)[v5 configurationType];
  }

  return v6;
}

- (int64_t)configurationType
{
  return self->_configurationTypeInternal;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NICarKeyConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v9, "copyWithZone:");
  [v5 setVehicleIdentifier:self->_vehicleIdentifier];
  v5[4] = self->_configurationTypeInternal;
  if (self->_debugOptions)
  {
    id v6 = -[NSDictionary initWithDictionary:copyItems:]( +[NSDictionary allocWithZone:](&OBJC_CLASS___NSDictionary, "allocWithZone:", a3),  "initWithDictionary:copyItems:",  self->_debugOptions,  1LL);
    uint64_t v7 = (void *)v5[6];
    v5[6] = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_vehicleIdentifier forKey:@"vehicleIdentifier"];
  [v4 encodeObject:self->_debugOptions forKey:@"debugOptions"];
  [v4 encodeInteger:self->_configurationTypeInternal forKey:@"configurationType"];
}

- (NICarKeyConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"vehicleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString, v7);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

    v21[0] = objc_opt_class(&OBJC_CLASS___NSString, v11);
    v21[1] = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
    v21[2] = objc_opt_class(&OBJC_CLASS___NSData, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeDictionaryWithKeysOfClasses:v10 objectsOfClasses:v15 forKey:@"debugOptions"]);
    id v17 = [v4 decodeIntegerForKey:@"configurationType"];
    if (v17 == (id)1)
    {
      v19 = -[NICarKeyConfiguration initWithVehicleIdentifier:]( objc_alloc(&OBJC_CLASS___NICarKeyConfiguration),  "initWithVehicleIdentifier:",  v8);
      -[NICarKeyConfiguration setDebugOptions:](v19, "setDebugOptions:", v16);
    }

    else
    {
      if (v17 == (id)2)
      {
        v18 = -[NICarKeyConfiguration initVehicleSimConfiguration:]( objc_alloc(&OBJC_CLASS___NICarKeyConfiguration),  "initVehicleSimConfiguration:",  v16);
      }

      else
      {
        if (v17 != (id)3)
        {
          v19 = 0LL;
          goto LABEL_11;
        }

        v18 = -[NICarKeyConfiguration initLabTestModeConfiguration:]( objc_alloc(&OBJC_CLASS___NICarKeyConfiguration),  "initLabTestModeConfiguration:",  v16);
      }

      v19 = v18;
    }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = (NICarKeyConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      char v14 = 1;
    }

    else
    {
      vehicleIdentifier = self->_vehicleIdentifier;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration vehicleIdentifier](v7, "vehicleIdentifier"));
      unsigned __int8 v11 = -[NSString isEqualToString:](vehicleIdentifier, "isEqualToString:", v10);

      debugOptions = self->_debugOptions;
      if (debugOptions)
      {
        BOOL v13 = 0;
      }

      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](v8, "debugOptions"));
        BOOL v13 = v15 == 0LL;

        debugOptions = self->_debugOptions;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration debugOptions](v8, "debugOptions"));
      unsigned __int8 v17 = -[NSDictionary isEqualToDictionary:](debugOptions, "isEqualToDictionary:", v16);

      char v14 = v11 & (v17 | v13);
    }
  }

  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_vehicleIdentifier, "hash");
  return (unint64_t)-[NSDictionary hash](self->_debugOptions, "hash") ^ v3 ^ self->_configurationTypeInternal;
}

- (id)description
{
  NSUInteger v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NICarKeyConfiguration descriptionInternal](self, "descriptionInternal"));
  objc_super v9 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<vehicle identifier: %@, debug options: <%@>>",  self->_vehicleIdentifier,  self->_debugOptions);
}

- (NSString)vehicleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setVehicleIdentifier:(id)a3
{
}

- (NSDictionary)debugOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDebugOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end