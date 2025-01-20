@interface MANAutoAssetSetInfoDesire
+ (BOOL)supportsSecureCoding;
- (BOOL)awaitDownloadingOfDiscovered;
- (BOOL)downloadProgressDesired;
- (MANAutoAssetSetInfoDesire)initWithCoder:(id)a3;
- (MANAutoAssetSetPolicy)clientAssetSetPolicy;
- (NSString)desireReason;
- (id)copy;
- (id)initForClientAssetSetPolicy:(id)a3 reasonDesired:(id)a4 awaitingDownloadOfDiscovered:(BOOL)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8;
- (id)summary;
- (int64_t)checkWaitTimeoutSecs;
- (int64_t)lockWaitTimeoutSecs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MANAutoAssetSetInfoDesire

- (id)initForClientAssetSetPolicy:(id)a3 reasonDesired:(id)a4 awaitingDownloadOfDiscovered:(BOOL)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoDesire;
  v17 = -[MANAutoAssetSetInfoDesire init](&v20, "init");
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

- (id)summary
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy"));
  if (v4)
  {
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire desireReason](self, "desireReason"));

    if (!v5)
    {
      v11 = @"byPolicy";
      goto LABEL_13;
    }
  }

  v6 = objc_alloc(&OBJC_CLASS___NSString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy"));
  if (v7)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 summary]);
  }

  else
  {
    v8 = @"N";
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire desireReason](self, "desireReason"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire desireReason](self, "desireReason"));
    v11 = -[NSString initWithFormat:](v6, "initWithFormat:", @"clientAssetSetPolicy:%@|desireReason:%@", v8, v10);
  }

  else
  {
    v11 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"clientAssetSetPolicy:%@|desireReason:%@",  v8,  @"N");
  }

  if (v7)
  {
  }

LABEL_13:
  p_isa = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%ld",  -[MANAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"));
  v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%ld",  -[MANAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"));
  if (-[MANAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"))
  {
    if (-[MANAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs") != -2) {
      goto LABEL_18;
    }
    v14 = @"DEFAULT";
  }

  else
  {
    v14 = @"NO_WAIT";
  }

  p_isa = &v14->isa;
LABEL_18:
  if (!-[MANAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"))
  {
    id v15 = @"NO_WAIT";
    goto LABEL_24;
  }

  if (-[MANAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs") == -2)
  {
    id v15 = @"DEFAULT";
LABEL_24:

    v13 = &v15->isa;
    goto LABEL_25;
  }

  if (-[MANAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs") == -3)
  {
    id v15 = @"NO_WAIT_NOT_PERSISTED";
    goto LABEL_24;
  }

- (MANAutoAssetSetPolicy)clientAssetSetPolicy
{
  return self->_clientAssetSetPolicy;
}

- (NSString)desireReason
{
  return self->_desireReason;
}

- (int64_t)checkWaitTimeoutSecs
{
  return self->_checkWaitTimeoutSecs;
}

- (int64_t)lockWaitTimeoutSecs
{
  return self->_lockWaitTimeoutSecs;
}

- (BOOL)awaitDownloadingOfDiscovered
{
  return self->_awaitDownloadingOfDiscovered;
}

- (BOOL)downloadProgressDesired
{
  return self->_downloadProgressDesired;
}

- (void).cxx_destruct
{
}

- (MANAutoAssetSetInfoDesire)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoDesire;
  v5 = -[MANAutoAssetSetInfoDesire init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetPolicy) forKey:@"clientAssetSetPolicy"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientAssetSetPolicy = v5->_clientAssetSetPolicy;
    v5->_clientAssetSetPolicy = (MANAutoAssetSetPolicy *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"desireReason"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    desireReason = v5->_desireReason;
    v5->_desireReason = (NSString *)v10;

    v5->_awaitDownloadingOfDiscovered = [v4 decodeBoolForKey:@"awaitDownloadingOfDiscovered"];
    v5->_checkWaitTimeoutSecs = (int64_t)[v4 decodeIntegerForKey:@"checkWaitTimeoutSecs"];
    v5->_lockWaitTimeoutSecs = (int64_t)[v4 decodeIntegerForKey:@"lockWaitTimeoutSecs"];
    v5->_downloadProgressDesired = [v4 decodeBoolForKey:@"downloadProgressDesired"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy"));
  [v6 encodeObject:v4 forKey:@"clientAssetSetPolicy"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire desireReason](self, "desireReason"));
  [v6 encodeObject:v5 forKey:@"desireReason"];

  objc_msgSend( v6,  "encodeBool:forKey:",  -[MANAutoAssetSetInfoDesire awaitDownloadingOfDiscovered](self, "awaitDownloadingOfDiscovered"),  @"awaitDownloadingOfDiscovered");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"),  @"checkWaitTimeoutSecs");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"),  @"lockWaitTimeoutSecs");
  objc_msgSend( v6,  "encodeBool:forKey:",  -[MANAutoAssetSetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"),  @"downloadProgressDesired");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInfoDesire);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy"));
  id v5 = [v4 copy];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire desireReason](self, "desireReason"));
  id v7 = -[MANAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( v3,  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout :desiringProgress:",  v5,  v6,  -[MANAutoAssetSetInfoDesire awaitDownloadingOfDiscovered](self, "awaitDownloadingOfDiscovered"),  -[MANAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"),  -[MANAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"),  -[MANAutoAssetSetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"));

  return v7;
}

@end