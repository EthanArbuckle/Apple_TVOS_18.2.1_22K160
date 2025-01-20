@interface MAAutoAssetInfoInstance
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoInstance)initWithCoder:(id)a3;
- (MAAutoAssetSelector)clientAssetSelector;
- (NSString)autoAssetClientName;
- (NSString)clientProcessName;
- (NSUUID)frameworkInstanceUUID;
- (id)description;
- (id)initForClientName:(id)a3 withProcessName:(id)a4 withProcessID:(int64_t)a5 usingAssetSelector:(id)a6 associatingFrameworkUUID:(id)a7;
- (id)summary;
- (int64_t)clientProcessID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoInstance

- (id)initForClientName:(id)a3 withProcessName:(id)a4 withProcessID:(int64_t)a5 usingAssetSelector:(id)a6 associatingFrameworkUUID:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoInstance;
  v17 = -[MAAutoAssetInfoInstance init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_autoAssetClientName, a3);
    objc_storeStrong((id *)&v18->_clientProcessName, a4);
    v18->_clientProcessID = a5;
    objc_storeStrong((id *)&v18->_clientAssetSelector, a6);
    objc_storeStrong((id *)&v18->_frameworkInstanceUUID, a7);
  }

  return v18;
}

- (MAAutoAssetInfoInstance)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoInstance;
  v5 = -[MAAutoAssetInfoInstance init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAssetClientName"];
    autoAssetClientName = v5->_autoAssetClientName;
    v5->_autoAssetClientName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientProcessName"];
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v8;

    v5->_clientProcessID = [v4 decodeIntegerForKey:@"clientProcessID"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientAssetSelector"];
    clientAssetSelector = v5->_clientAssetSelector;
    v5->_clientAssetSelector = (MAAutoAssetSelector *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frameworkInstanceUUID"];
    frameworkInstanceUUID = v5->_frameworkInstanceUUID;
    v5->_frameworkInstanceUUID = (NSUUID *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetInfoInstance autoAssetClientName](self, "autoAssetClientName");
  [v4 encodeObject:v5 forKey:@"autoAssetClientName"];

  -[MAAutoAssetInfoInstance clientProcessName](self, "clientProcessName");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"clientProcessName"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetInfoInstance clientProcessID](self, "clientProcessID"),  @"clientProcessID");
  v7 = -[MAAutoAssetInfoInstance clientAssetSelector](self, "clientAssetSelector");
  [v4 encodeObject:v7 forKey:@"clientAssetSelector"];

  -[MAAutoAssetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"frameworkInstanceUUID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)NSString;
  -[MAAutoAssetInfoInstance summary](self, "summary");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID");
  [v3 stringWithFormat:@"%@|%@", v4, v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)summary
{
  v3 = (void *)NSString;
  -[MAAutoAssetInfoInstance autoAssetClientName](self, "autoAssetClientName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetInfoInstance clientAssetSelector](self, "clientAssetSelector");
  [v5 summary];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MAAutoAssetInfoInstance clientProcessName](self, "clientProcessName");
  [v3 stringWithFormat:@"%@(%@)%@:%ld", v4, v6, v7, -[MAAutoAssetInfoInstance clientProcessID](self, "clientProcessID")];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (MAAutoAssetSelector)clientAssetSelector
{
  return self->_clientAssetSelector;
}

- (NSUUID)frameworkInstanceUUID
{
  return self->_frameworkInstanceUUID;
}

- (void).cxx_destruct
{
}

@end