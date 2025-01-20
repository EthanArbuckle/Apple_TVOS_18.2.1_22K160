@interface MAAutoAssetSetInfoInstance
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetSetInfoInstance)initWithCoder:(id)a3;
- (NSArray)autoAssetEntries;
- (NSArray)entriesWhenTargeting;
- (NSString)assetSetIdentifier;
- (NSString)atomicInstance;
- (NSString)autoAssetSetClientName;
- (NSString)clientDomainName;
- (NSString)clientProcessName;
- (NSUUID)frameworkInstanceUUID;
- (id)description;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 withProcessName:(id)a5 withProcessID:(int64_t)a6 forAssetSetIdentifier:(id)a7 forAtomicInstance:(id)a8 comprisedOfEntries:(id)a9 asEntriesWhenTargeting:(id)a10 associatingFrameworkUUID:(id)a11;
- (id)summary;
- (int64_t)clientProcessID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInfoInstance

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 withProcessName:(id)a5 withProcessID:(int64_t)a6 forAssetSetIdentifier:(id)a7 forAtomicInstance:(id)a8 comprisedOfEntries:(id)a9 asEntriesWhenTargeting:(id)a10 associatingFrameworkUUID:(id)a11
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v17 = a11;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInfoInstance;
  v18 = -[MAAutoAssetSetInfoInstance init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientDomainName, a3);
    objc_storeStrong((id *)&v19->_autoAssetSetClientName, a4);
    objc_storeStrong((id *)&v19->_clientProcessName, a5);
    v19->_clientProcessID = a6;
    objc_storeStrong((id *)&v19->_assetSetIdentifier, a7);
    objc_storeStrong((id *)&v19->_atomicInstance, a8);
    objc_storeStrong((id *)&v19->_autoAssetEntries, a9);
    objc_storeStrong((id *)&v19->_entriesWhenTargeting, a10);
    objc_storeStrong((id *)&v19->_frameworkInstanceUUID, a11);
  }

  return v19;
}

- (MAAutoAssetSetInfoInstance)initWithCoder:(id)a3
{
  v31[3] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInfoInstance;
  v5 = -[MAAutoAssetSetInfoInstance init](&v29, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAssetSetClientName"];
    autoAssetSetClientName = v5->_autoAssetSetClientName;
    v5->_autoAssetSetClientName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientProcessName"];
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v10;

    v5->_clientProcessID = [v4 decodeIntegerForKey:@"clientProcessID"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atomicInstance"];
    atomicInstance = v5->_atomicInstance;
    v5->_atomicInstance = (NSString *)v14;

    id v16 = objc_alloc(MEMORY[0x189604010]);
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v31 count:3];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)[v16 initWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"autoAssetEntries"];
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v19;

    id v21 = objc_alloc(MEMORY[0x189604010]);
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v30[3] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v30 count:4];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = (void *)[v21 initWithArray:v22];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"entriesWhenTargeting"];
    entriesWhenTargeting = v5->_entriesWhenTargeting;
    v5->_entriesWhenTargeting = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frameworkInstanceUUID"];
    frameworkInstanceUUID = v5->_frameworkInstanceUUID;
    v5->_frameworkInstanceUUID = (NSUUID *)v26;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetSetInfoInstance clientDomainName](self, "clientDomainName");
  [v4 encodeObject:v5 forKey:@"clientDomainName"];

  -[MAAutoAssetSetInfoInstance autoAssetSetClientName](self, "autoAssetSetClientName");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"autoAssetSetClientName"];
  v7 = -[MAAutoAssetSetInfoInstance clientProcessName](self, "clientProcessName");
  [v4 encodeObject:v7 forKey:@"clientProcessName"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetSetInfoInstance clientProcessID](self, "clientProcessID"),  @"clientProcessID");
  -[MAAutoAssetSetInfoInstance assetSetIdentifier](self, "assetSetIdentifier");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"assetSetIdentifier"];
  v9 = -[MAAutoAssetSetInfoInstance atomicInstance](self, "atomicInstance");
  [v4 encodeObject:v9 forKey:@"atomicInstance"];

  -[MAAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"autoAssetEntries"];
  v11 = -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
  [v4 encodeObject:v11 forKey:@"entriesWhenTargeting"];

  -[MAAutoAssetSetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"frameworkInstanceUUID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)NSString;
  -[MAAutoAssetSetInfoInstance summary](self, "summary");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[MAAutoAssetSetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID");
  uint64_t v8 = (void *)v7;
  if (v3)
  {
    v9 = -[MAAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries");
    uint64_t v10 = [v9 description];
    v11 = (void *)v10;
    if (v4)
    {
      -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 description];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 stringWithFormat:@"%@|%@\nautoAssetEntries:\n%@\nentriesWhenTargeting:\n%@", v6, v8, v11, v13];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v5 stringWithFormat:@"%@|%@\nautoAssetEntries:\n%@", v6, v8, v10];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    if (!v4)
    {
      [v5 stringWithFormat:@"%@|%@", v6, v7];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v9 = -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
    [v9 description];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 stringWithFormat:@"%@|%@\nentriesWhenTargeting:\n%@", v6, v8, v15];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v14;
}

- (id)summary
{
  v20 = (void *)NSString;
  uint64_t v21 = -[MAAutoAssetSetInfoInstance clientDomainName](self, "clientDomainName");
  -[MAAutoAssetSetInfoInstance autoAssetSetClientName](self, "autoAssetSetClientName");
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInfoInstance clientProcessName](self, "clientProcessName");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = -[MAAutoAssetSetInfoInstance clientProcessID](self, "clientProcessID");
  -[MAAutoAssetSetInfoInstance assetSetIdentifier](self, "assetSetIdentifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSetInfoInstance atomicInstance](self, "atomicInstance");
  if (v5)
  {
    -[MAAutoAssetSetInfoInstance atomicInstance](self, "atomicInstance");
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = @"N";
  }

  -[MAAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    id v8 = objc_alloc(NSString);
    -[MAAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (__CFString *)objc_msgSend(v8, "initWithFormat:", @"%ld", objc_msgSend(v19, "count"));
  }

  else
  {
    v9 = @"N";
  }

  -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    id v11 = objc_alloc(NSString);
    -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", @"%ld", objc_msgSend(v12, "count"));
    int64_t v17 = v3;
    uint64_t v14 = (void *)v21;
    [v20 stringWithFormat:@"domainName:%@|clientName:%@|processName:%@|pid:%ld|setIdentifier:%@|atomicInstance:%@|entries:%@(WhenTargeting:%@)", v21, v23, v22, v17, v4, v6, v9, v13];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v18 = v3;
    uint64_t v14 = (void *)v21;
    [v20 stringWithFormat:@"domainName:%@|clientName:%@|processName:%@|pid:%ld|setIdentifier:%@|atomicInstance:%@|entries:%@(WhenTargeting:%@)", v21, v23, v22, v18, v4, v6, v9, @"N"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  {
  }

  if (v5) {
  return v15;
  }
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)autoAssetSetClientName
{
  return self->_autoAssetSetClientName;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (NSString)atomicInstance
{
  return self->_atomicInstance;
}

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

- (NSArray)entriesWhenTargeting
{
  return self->_entriesWhenTargeting;
}

- (NSUUID)frameworkInstanceUUID
{
  return self->_frameworkInstanceUUID;
}

- (void).cxx_destruct
{
}

@end