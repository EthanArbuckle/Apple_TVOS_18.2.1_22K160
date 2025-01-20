@interface MANAutoAssetSetInfoInstance
+ (BOOL)supportsSecureCoding;
- (MANAutoAssetSetInfoInstance)initWithCoder:(id)a3;
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
- (void)setAtomicInstance:(id)a3;
@end

@implementation MANAutoAssetSetInfoInstance

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
  v29.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoInstance;
  v18 = -[MANAutoAssetSetInfoInstance init](&v29, "init");
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

- (id)summary
{
  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance clientDomainName](self, "clientDomainName"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance autoAssetSetClientName](self, "autoAssetSetClientName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance clientProcessName](self, "clientProcessName"));
  int64_t v3 = -[MANAutoAssetSetInfoInstance clientProcessID](self, "clientProcessID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance assetSetIdentifier](self, "assetSetIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance atomicInstance](self, "atomicInstance"));
  if (v5) {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance atomicInstance](self, "atomicInstance"));
  }
  else {
    v6 = @"N";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries"));
  if (v7)
  {
    v8 = objc_alloc(&OBJC_CLASS___NSString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries"));
    v9 = -[NSString initWithFormat:](v8, "initWithFormat:", @"%ld", [v19 count]);
  }

  else
  {
    v9 = @"N";
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting"));
  if (v10)
  {
    v11 = objc_alloc(&OBJC_CLASS___NSString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting"));
    v13 = -[NSString initWithFormat:](v11, "initWithFormat:", @"%ld", [v12 count]);
    int64_t v17 = v3;
    v14 = (void *)v20;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"domainName:%@|clientName:%@|processName:%@|pid:%ld|setIdentifier:%@|atomicInstance:%@|entries:%@(WhenTargeting:%@)",  v20,  v22,  v21,  v17,  v4,  v6,  v9,  v13));
  }

  else
  {
    int64_t v18 = v3;
    v14 = (void *)v20;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"domainName:%@|clientName:%@|processName:%@|pid:%ld|setIdentifier:%@|atomicInstance:%@|entries:%@(WhenTargeting:%@)",  v20,  v22,  v21,  v18,  v4,  v6,  v9,  @"N"));
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

- (void).cxx_destruct
{
}

- (NSUUID)frameworkInstanceUUID
{
  return self->_frameworkInstanceUUID;
}

- (MANAutoAssetSetInfoInstance)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoInstance;
  v5 = -[MANAutoAssetSetInfoInstance init](&v35, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"autoAssetSetClientName"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    autoAssetSetClientName = v5->_autoAssetSetClientName;
    v5->_autoAssetSetClientName = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientProcessName"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v13;

    v5->_clientProcessID = (int64_t)[v4 decodeIntegerForKey:@"clientProcessID"];
    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"atomicInstance"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    atomicInstance = v5->_atomicInstance;
    v5->_atomicInstance = (NSString *)v19;

    v21 = objc_alloc(&OBJC_CLASS___NSSet);
    v37[0] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v37[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v37[2] = objc_opt_class(&OBJC_CLASS___NSArray);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 3LL));
    id v23 = -[NSSet initWithArray:](v21, "initWithArray:", v22);
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v23 forKey:@"autoAssetEntries"]);
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v24;

    id v26 = objc_alloc(&OBJC_CLASS___NSSet);
    v36[0] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetTarget);
    v36[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v36[2] = objc_opt_class(&OBJC_CLASS___NSString);
    v36[3] = objc_opt_class(&OBJC_CLASS___NSArray);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 4LL));
    id v28 = -[NSSet initWithArray:](v26, "initWithArray:", v27);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v28 forKey:@"entriesWhenTargeting"]);
    entriesWhenTargeting = v5->_entriesWhenTargeting;
    v5->_entriesWhenTargeting = (NSArray *)v29;

    id v31 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"frameworkInstanceUUID"];
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    frameworkInstanceUUID = v5->_frameworkInstanceUUID;
    v5->_frameworkInstanceUUID = (NSUUID *)v32;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance clientDomainName](self, "clientDomainName"));
  [v4 encodeObject:v5 forKey:@"clientDomainName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance autoAssetSetClientName](self, "autoAssetSetClientName"));
  [v4 encodeObject:v6 forKey:@"autoAssetSetClientName"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance clientProcessName](self, "clientProcessName"));
  [v4 encodeObject:v7 forKey:@"clientProcessName"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MANAutoAssetSetInfoInstance clientProcessID](self, "clientProcessID"),  @"clientProcessID");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance assetSetIdentifier](self, "assetSetIdentifier"));
  [v4 encodeObject:v8 forKey:@"assetSetIdentifier"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance atomicInstance](self, "atomicInstance"));
  [v4 encodeObject:v9 forKey:@"atomicInstance"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries"));
  [v4 encodeObject:v10 forKey:@"autoAssetEntries"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting"));
  [v4 encodeObject:v11 forKey:@"entriesWhenTargeting"];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID"));
  [v4 encodeObject:v12 forKey:@"frameworkInstanceUUID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance summary](self, "summary"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID"));
  uint64_t v7 = (void *)v6;
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 description]);
    uint64_t v10 = (void *)v9;
    if (v4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@\nautoAssetEntries:\n%@\nentriesWhenTargeting:\n%@",  v5,  v7,  v10,  v12));
    }

    else
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@\nautoAssetEntries:\n%@",  v5,  v7,  v9));
    }
  }

  else
  {
    if (!v4)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@|%@", v5, v6));
      goto LABEL_9;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@\nentriesWhenTargeting:\n%@",  v5,  v7,  v14));
  }

LABEL_9:
  return v13;
}

- (void)setAtomicInstance:(id)a3
{
}

@end