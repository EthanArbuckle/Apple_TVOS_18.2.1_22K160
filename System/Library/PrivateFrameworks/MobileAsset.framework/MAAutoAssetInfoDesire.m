@interface MAAutoAssetInfoDesire
+ (BOOL)supportsSecureCoding;
- (BOOL)downloadProgressDesired;
- (MAAutoAssetInfoDesire)initWithCoder:(id)a3;
- (MAAutoAssetInfoDesire)initWithDesiredCategory:(id)a3 forClientAssetPolicy:(id)a4 reasonDesired:(id)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8;
- (MAAutoAssetPolicy)clientAssetPolicy;
- (NSString)desireReason;
- (NSString)updateCategoryDesiredByClient;
- (id)summary;
- (int64_t)checkWaitTimeoutSecs;
- (int64_t)lockWaitTimeoutSecs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoDesire

- (MAAutoAssetInfoDesire)initWithDesiredCategory:(id)a3 forClientAssetPolicy:(id)a4 reasonDesired:(id)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoDesire;
  v18 = -[MAAutoAssetInfoDesire init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_updateCategoryDesiredByClient, a3);
    objc_storeStrong((id *)&v19->_clientAssetPolicy, a4);
    objc_storeStrong((id *)&v19->_desireReason, a5);
    v19->_checkWaitTimeoutSecs = a6;
    v19->_lockWaitTimeoutSecs = a7;
    v19->_downloadProgressDesired = a8;
  }

  return v19;
}

- (MAAutoAssetInfoDesire)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoDesire;
  v5 = -[MAAutoAssetInfoDesire init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateCategoryDesiredByClient"];
    updateCategoryDesiredByClient = v5->_updateCategoryDesiredByClient;
    v5->_updateCategoryDesiredByClient = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientAssetPolicy"];
    clientAssetPolicy = v5->_clientAssetPolicy;
    v5->_clientAssetPolicy = (MAAutoAssetPolicy *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desireReason"];
    desireReason = v5->_desireReason;
    v5->_desireReason = (NSString *)v10;

    v5->_checkWaitTimeoutSecs = [v4 decodeIntegerForKey:@"checkWaitTimeoutSecs"];
    v5->_lockWaitTimeoutSecs = [v4 decodeIntegerForKey:@"lockWaitTimeoutSecs"];
    v5->_downloadProgressDesired = [v4 decodeBoolForKey:@"downloadProgressDesired"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v4 forKey:@"updateCategoryDesiredByClient"];
  v5 = -[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy");
  [v7 encodeObject:v5 forKey:@"clientAssetPolicy"];

  -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v6 forKey:@"desireReason"];

  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MAAutoAssetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"),  @"checkWaitTimeoutSecs");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MAAutoAssetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"),  @"lockWaitTimeoutSecs");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[MAAutoAssetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"),  @"downloadProgressDesired");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:&stru_189FFC530];
  -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (-[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy"),
        (id v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
  }

  else
  {
    v14 = -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
    if (!v14)
    {
      [v3 appendString:@"byPolicy"];
      goto LABEL_17;
    }
  }
  v5 = -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  if (v5)
  {
  }

  else
  {
    -[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 appendString:v13];
      goto LABEL_16;
    }
  }

  -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendFormat:@"categ:%@", v8];
  }
  v9 = -[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy");
  if (v9)
  {
    -[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 summary];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendFormat:@"policy:%@", v11];
  }
  v12 = -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
  if (v12)
  {
    -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendFormat:@"|%@", v13];
LABEL_16:
  }

- (NSString)updateCategoryDesiredByClient
{
  return self->_updateCategoryDesiredByClient;
}

- (MAAutoAssetPolicy)clientAssetPolicy
{
  return self->_clientAssetPolicy;
}

- (int64_t)checkWaitTimeoutSecs
{
  return self->_checkWaitTimeoutSecs;
}

- (NSString)desireReason
{
  return self->_desireReason;
}

- (int64_t)lockWaitTimeoutSecs
{
  return self->_lockWaitTimeoutSecs;
}

- (BOOL)downloadProgressDesired
{
  return self->_downloadProgressDesired;
}

- (void).cxx_destruct
{
}

@end