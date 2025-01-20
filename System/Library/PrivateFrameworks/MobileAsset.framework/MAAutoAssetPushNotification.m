@interface MAAutoAssetPushNotification
+ (BOOL)supportsSecureCoding;
+ (id)pushReasonName:(int64_t)a3;
- (MAAutoAssetPushNotification)initWithCoder:(id)a3;
- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3;
- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6;
- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7;
- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7 withAdditional:(id)a8;
- (MAAutoAssetUpdatePolicy)autoUpdatePolicy;
- (NSDictionary)additionalPushParameters;
- (NSDictionary)historyRepresentation;
- (NSString)assetSpecifier;
- (NSString)assetType;
- (NSString)assetVersion;
- (id)newAssetName;
- (id)newSummaryDictionary;
- (id)pushReasonName;
- (id)summary;
- (int64_t)pushReason;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalPushParameters:(id)a3;
- (void)setPushReason:(int64_t)a3;
@end

@implementation MAAutoAssetPushNotification

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3
{
  return -[MAAutoAssetPushNotification initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:]( self,  "initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:",  a3,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6
{
  return -[MAAutoAssetPushNotification initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:]( self,  "initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:",  a3,  a4,  a5,  a6,  0LL,  0LL);
}

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7
{
  return -[MAAutoAssetPushNotification initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:]( self,  "initWithPushReason:forAssetType:withAssetSpecifier:matchingAssetVersion:withUpdatePolicy:withAdditional:",  a3,  a4,  a5,  a6,  a7,  0LL);
}

- (MAAutoAssetPushNotification)initWithPushReason:(int64_t)a3 forAssetType:(id)a4 withAssetSpecifier:(id)a5 matchingAssetVersion:(id)a6 withUpdatePolicy:(id)a7 withAdditional:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MAAutoAssetPushNotification;
  v18 = -[MAAutoAssetPushNotification init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_pushReason = a3;
    objc_storeStrong((id *)&v18->_assetType, a4);
    objc_storeStrong((id *)&v19->_assetSpecifier, a5);
    objc_storeStrong((id *)&v19->_assetVersion, a6);
    objc_storeStrong((id *)&v19->_autoUpdatePolicy, a7);
    objc_storeStrong((id *)&v19->_additionalPushParameters, a8);
  }

  return v19;
}

- (MAAutoAssetPushNotification)initWithCoder:(id)a3
{
  v21[8] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MAAutoAssetPushNotification;
  v5 = -[MAAutoAssetPushNotification init](&v20, sel_init);
  if (v5)
  {
    v5->_pushReason = [v4 decodeIntegerForKey:@"pushReason"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSpecifier"];
    assetSpecifier = v5->_assetSpecifier;
    v5->_assetSpecifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetVersion"];
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoUpdatePolicy"];
    autoUpdatePolicy = v5->_autoUpdatePolicy;
    v5->_autoUpdatePolicy = (MAAutoAssetUpdatePolicy *)v12;

    v14 = (void *)MEMORY[0x189604010];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    v21[5] = objc_opt_class();
    v21[6] = objc_opt_class();
    v21[7] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v21 count:8];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setWithArray:v15];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"additionalPushParameters"];
    additionalPushParameters = v5->_additionalPushParameters;
    v5->_additionalPushParameters = (NSDictionary *)v17;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetPushNotification pushReason](self, "pushReason"),  @"pushReason");
  v5 = -[MAAutoAssetPushNotification assetType](self, "assetType");
  [v4 encodeObject:v5 forKey:@"assetType"];

  -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"assetSpecifier"];
  v7 = -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
  [v4 encodeObject:v7 forKey:@"assetVersion"];

  -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"autoUpdatePolicy"];

  -[MAAutoAssetPushNotification additionalPushParameters](self, "additionalPushParameters");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"additionalPushParameters"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)newAssetName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    return &stru_189FFC530;
  }
  -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
    id v6 = objc_alloc(NSString);
    v7 = -[MAAutoAssetPushNotification assetType](self, "assetType");
    uint64_t v8 = -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
    id v9 = (void *)v8;
    if (v5)
    {
      -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)[v6 initWithFormat:@"(%@|%@|%@)", v7, v9, v10];
    }

    else
    {
      v11 = (void *)[v6 initWithFormat:@"(%@|%@)", v7, v8];
    }
  }

  else
  {
    id v12 = objc_alloc(NSString);
    v7 = -[MAAutoAssetPushNotification assetType](self, "assetType");
    v11 = (void *)[v12 initWithFormat:@"(%@)", v7];
  }

  return v11;
}

- (id)summary
{
  id v4 = (void *)NSString;
  v5 = -[MAAutoAssetPushNotification pushReasonName](self, "pushReasonName");
  id v6 = -[MAAutoAssetPushNotification newAssetName](self, "newAssetName");
  v7 = -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
  if (v7)
  {
    v2 = -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
    [v2 summary];
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = @"NONE";
  }

  -[MAAutoAssetPushNotification additionalPushParameters](self, "additionalPushParameters");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = @"PRESENT";
  if (!v9) {
    uint64_t v10 = @"NONE";
  }
  [v4 stringWithFormat:@"%@%@|policy:%@|additional:%@", v5, v6, v8, v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
  }

  return v11;
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[MAAutoAssetPushNotification pushReasonName](self, "pushReasonName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setSafeObject:v4 forKey:@"pushReason"];

  id v5 = -[MAAutoAssetPushNotification newAssetName](self, "newAssetName");
  [v3 setSafeObject:v5 forKey:@"assetName"];

  -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)[v7 newSummaryDictionary];
    [v3 setSafeObject:v8 forKey:@"autoUpdatePolicy"];
  }

  else
  {
    id v7 = objc_alloc_init(MEMORY[0x189603F68]);
    [v3 setSafeObject:v7 forKey:@"autoUpdatePolicy"];
  }

  -[MAAutoAssetPushNotification additionalPushParameters](self, "additionalPushParameters");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MAAutoAssetPushNotification additionalPushParameters](self, "additionalPushParameters");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = objc_alloc_init(MEMORY[0x189603F68]);
  }

  v11 = v10;
  [v3 setSafeObject:v10 forKey:@"additionalPushParameters"];

  return v3;
}

- (id)pushReasonName
{
  return +[MAAutoAssetPushNotification pushReasonName:]( &OBJC_CLASS___MAAutoAssetPushNotification,  "pushReasonName:",  -[MAAutoAssetPushNotification pushReason](self, "pushReason"));
}

+ (id)pushReasonName:(int64_t)a3
{
  else {
    return off_189FF98D8[a3];
  }
}

- (NSDictionary)historyRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetPushNotification assetType](self, "assetType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MAAutoAssetPushNotification assetType](self, "assetType");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setSafeObject:v5 forKey:@"assetType"];
  }

  -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MAAutoAssetPushNotification assetSpecifier](self, "assetSpecifier");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setSafeObject:v7 forKey:@"assetSpecifier"];
  }

  -[MAAutoAssetPushNotification pushReasonName](self, "pushReasonName");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MAAutoAssetPushNotification pushReasonName](self, "pushReasonName");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setSafeObject:v9 forKey:@"pushReasonName"];
  }

  uint64_t v10 = -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
  if (v10)
  {
    v11 = (void *)v10;
    -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 updatePolicyName];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = -[MAAutoAssetPushNotification autoUpdatePolicy](self, "autoUpdatePolicy");
      [v14 updatePolicyName];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setSafeObject:v15 forKey:@"autoUpdatePolicy"];
    }
  }

  -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MAAutoAssetPushNotification assetVersion](self, "assetVersion");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setSafeObject:v17 forKey:@"assetVersion"];
  }

  v18 = (void *)[v3 copy];

  return (NSDictionary *)v18;
}

- (int64_t)pushReason
{
  return self->_pushReason;
}

- (void)setPushReason:(int64_t)a3
{
  self->_pushReason = a3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (MAAutoAssetUpdatePolicy)autoUpdatePolicy
{
  return self->_autoUpdatePolicy;
}

- (NSDictionary)additionalPushParameters
{
  return self->_additionalPushParameters;
}

- (void)setAdditionalPushParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end