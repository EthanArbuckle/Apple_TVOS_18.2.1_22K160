@interface MAAutoAssetSetInfoDesire
+ (BOOL)supportsSecureCoding;
- (BOOL)awaitDownloadingOfDiscovered;
- (BOOL)downloadProgressDesired;
- (MAAutoAssetSetInfoDesire)initWithCoder:(id)a3;
- (MAAutoAssetSetPolicy)clientAssetSetPolicy;
- (NSString)desireReason;
- (id)initForClientAssetSetPolicy:(id)a3 reasonDesired:(id)a4 awaitingDownloadOfDiscovered:(BOOL)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8;
- (id)summary;
- (int64_t)checkWaitTimeoutSecs;
- (int64_t)lockWaitTimeoutSecs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInfoDesire

- (id)initForClientAssetSetPolicy:(id)a3 reasonDesired:(id)a4 awaitingDownloadOfDiscovered:(BOOL)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInfoDesire;
  v17 = -[MAAutoAssetSetInfoDesire init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientAssetSetPolicy, a3);
    objc_storeStrong((id *)&v18->_desireReason, a4);
    v18->_awaitDownloadingOfDiscovered = a5;
    v18->_checkWaitTimeoutSecs = a6;
    v18->_lockWaitTimeoutSecs = a7;
    v18->_downloadProgressDesired = a8;
  }

  return v18;
}

- (MAAutoAssetSetInfoDesire)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInfoDesire;
  v5 = -[MAAutoAssetSetInfoDesire init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientAssetSetPolicy"];
    clientAssetSetPolicy = v5->_clientAssetSetPolicy;
    v5->_clientAssetSetPolicy = (MAAutoAssetSetPolicy *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desireReason"];
    desireReason = v5->_desireReason;
    v5->_desireReason = (NSString *)v8;

    v5->_awaitDownloadingOfDiscovered = [v4 decodeBoolForKey:@"awaitDownloadingOfDiscovered"];
    v5->_checkWaitTimeoutSecs = [v4 decodeIntegerForKey:@"checkWaitTimeoutSecs"];
    v5->_lockWaitTimeoutSecs = [v4 decodeIntegerForKey:@"lockWaitTimeoutSecs"];
    v5->_downloadProgressDesired = [v4 decodeBoolForKey:@"downloadProgressDesired"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  -[MAAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v4 forKey:@"clientAssetSetPolicy"];
  v5 = -[MAAutoAssetSetInfoDesire desireReason](self, "desireReason");
  [v6 encodeObject:v5 forKey:@"desireReason"];

  objc_msgSend( v6,  "encodeBool:forKey:",  -[MAAutoAssetSetInfoDesire awaitDownloadingOfDiscovered](self, "awaitDownloadingOfDiscovered"),  @"awaitDownloadingOfDiscovered");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"),  @"checkWaitTimeoutSecs");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"),  @"lockWaitTimeoutSecs");
  objc_msgSend( v6,  "encodeBool:forKey:",  -[MAAutoAssetSetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"),  @"downloadProgressDesired");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
  }

  else
  {
    v5 = -[MAAutoAssetSetInfoDesire desireReason](self, "desireReason");
    if (!v5)
    {
      objc_super v11 = @"byPolicy";
      goto LABEL_13;
    }
  }

  id v6 = objc_alloc(NSString);
  v7 = -[MAAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy");
  if (v7)
  {
    v2 = -[MAAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy");
    [v2 summary];
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = @"N";
  }
  v9 = -[MAAutoAssetSetInfoDesire desireReason](self, "desireReason");
  if (v9)
  {
    v10 = -[MAAutoAssetSetInfoDesire desireReason](self, "desireReason");
    objc_super v11 = (__CFString *)[v6 initWithFormat:@"clientAssetSetPolicy:%@|desireReason:%@", v8, v10];
  }

  else
  {
    objc_super v11 = (__CFString *)[v6 initWithFormat:@"clientAssetSetPolicy:%@|desireReason:%@", v8, @"N"];
  }

  if (v7)
  {
  }

LABEL_13:
  v12 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%ld",  -[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"));
  v13 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%ld",  -[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"));
  if (-[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"))
  {
    if (-[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs") != -2) {
      goto LABEL_18;
    }
    v14 = @"DEFAULT";
  }

  else
  {
    v14 = @"NO_WAIT";
  }

  v12 = (__CFString *)v14;
LABEL_18:
  if (!-[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"))
  {
    id v15 = @"NO_WAIT";
    goto LABEL_24;
  }

  if (-[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs") == -2)
  {
    id v15 = @"DEFAULT";
LABEL_24:

    v13 = (__CFString *)v15;
    goto LABEL_25;
  }

  if (-[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs") == -3)
  {
    id v15 = @"NO_WAIT_NOT_PERSISTED";
    goto LABEL_24;
  }

- (MAAutoAssetSetPolicy)clientAssetSetPolicy
{
  return self->_clientAssetSetPolicy;
}

- (NSString)desireReason
{
  return self->_desireReason;
}

- (BOOL)awaitDownloadingOfDiscovered
{
  return self->_awaitDownloadingOfDiscovered;
}

- (int64_t)checkWaitTimeoutSecs
{
  return self->_checkWaitTimeoutSecs;
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