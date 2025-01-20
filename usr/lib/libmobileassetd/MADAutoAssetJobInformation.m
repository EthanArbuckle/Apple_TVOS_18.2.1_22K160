@interface MADAutoAssetJobInformation
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoDesire)clientDesire;
- (MAAutoAssetInfoFound)foundContent;
- (MAAutoAssetInfoInstance)clientInstance;
- (MAAutoAssetSelector)fullAssetSelector;
- (MAAutoAssetSelector)initialAssetSelector;
- (MAAutoAssetStatus)currentStatus;
- (MADAutoAssetJobInformation)initWithCoder:(id)a3;
- (id)initForAssetSelector:(id)a3;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setClientDesire:(id)a3;
- (void)setClientInstance:(id)a3;
- (void)setCurrentStatus:(id)a3;
- (void)setFoundContent:(id)a3;
- (void)setFullAssetSelector:(id)a3;
@end

@implementation MADAutoAssetJobInformation

- (id)initForAssetSelector:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MADAutoAssetJobInformation;
  v6 = -[MADAutoAssetJobInformation init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_initialAssetSelector, a3);
    fullAssetSelector = v7->_fullAssetSelector;
    v7->_fullAssetSelector = 0LL;

    clientInstance = v7->_clientInstance;
    v7->_clientInstance = 0LL;

    clientDesire = v7->_clientDesire;
    v7->_clientDesire = 0LL;

    foundContent = v7->_foundContent;
    v7->_foundContent = 0LL;

    currentStatus = v7->_currentStatus;
    v7->_currentStatus = 0LL;
  }

  return v7;
}

- (MADAutoAssetJobInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MADAutoAssetJobInformation;
  id v5 = -[MADAutoAssetJobInformation init](&v25, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"initialAssetSelector"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    initialAssetSelector = v5->_initialAssetSelector;
    v5->_initialAssetSelector = (MAAutoAssetSelector *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"fullAssetSelector"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetInfoInstance) forKey:@"clientInstance"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    clientInstance = v5->_clientInstance;
    v5->_clientInstance = (MAAutoAssetInfoInstance *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetInfoDesire) forKey:@"clientDesire"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    clientDesire = v5->_clientDesire;
    v5->_clientDesire = (MAAutoAssetInfoDesire *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetInfoFound) forKey:@"foundContent"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    foundContent = v5->_foundContent;
    v5->_foundContent = (MAAutoAssetInfoFound *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetStatus) forKey:@"currentStatus"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    currentStatus = v5->_currentStatus;
    v5->_currentStatus = (MAAutoAssetStatus *)v22;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation initialAssetSelector](self, "initialAssetSelector"));
  [v4 encodeObject:v5 forKey:@"initialAssetSelector"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation fullAssetSelector](self, "fullAssetSelector"));
  [v4 encodeObject:v6 forKey:@"fullAssetSelector"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation clientInstance](self, "clientInstance"));
  [v4 encodeObject:v7 forKey:@"clientInstance"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation clientDesire](self, "clientDesire"));
  [v4 encodeObject:v8 forKey:@"clientDesire"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation foundContent](self, "foundContent"));
  [v4 encodeObject:v9 forKey:@"foundContent"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation currentStatus](self, "currentStatus"));
  [v4 encodeObject:v10 forKey:@"currentStatus"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation initialAssetSelector](self, "initialAssetSelector"));
  if (v3)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation initialAssetSelector](self, "initialAssetSelector"));
    objc_super v25 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 summary]);
  }

  else
  {
    objc_super v25 = @"N";
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation fullAssetSelector](self, "fullAssetSelector"));
  if (v4)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation fullAssetSelector](self, "fullAssetSelector"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v20 summary]);
  }

  else
  {
    v24 = @"N";
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation clientInstance](self, "clientInstance"));
  if (v5)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation clientInstance](self, "clientInstance"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 summary]);
  }

  else
  {
    v23 = @"N";
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation clientDesire](self, "clientDesire"));
  if (v6)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation clientDesire](self, "clientDesire"));
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 summary]);
  }

  else
  {
    uint64_t v7 = @"N";
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation foundContent](self, "foundContent"));
  if (v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation foundContent](self, "foundContent"));
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 summary]);
  }

  else
  {
    id v9 = @"N";
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation currentStatus](self, "currentStatus"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobInformation currentStatus](self, "currentStatus"));
    id v12 = v4;
    uint64_t v13 = v3;
    objc_super v14 = v11;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[initialSelector:%@|fullSelector:%@|clientInstance:%@|clientDesire:%@|foundContent:%@|currentStatus:%@]",  v25,  v24,  v23,  v7,  v9,  v15));

    v3 = v13;
    id v4 = v12;
  }

  else
  {
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[initialSelector:%@|fullSelector:%@|clientInstance:%@|clientDesire:%@|foundContent:%@|currentStatus:%@]",  v25,  v24,  v23,  v7,  v9,  @"N"));
  }

  if (v8)
  {
  }

  if (v6)
  {
  }

  if (v5)
  {
  }

  if (v4)
  {
  }

  if (v3)
  {
  }

  return v22;
}

- (MAAutoAssetSelector)initialAssetSelector
{
  return self->_initialAssetSelector;
}

- (MAAutoAssetSelector)fullAssetSelector
{
  return self->_fullAssetSelector;
}

- (void)setFullAssetSelector:(id)a3
{
}

- (MAAutoAssetInfoInstance)clientInstance
{
  return self->_clientInstance;
}

- (void)setClientInstance:(id)a3
{
}

- (MAAutoAssetInfoDesire)clientDesire
{
  return self->_clientDesire;
}

- (void)setClientDesire:(id)a3
{
}

- (MAAutoAssetInfoFound)foundContent
{
  return self->_foundContent;
}

- (void)setFoundContent:(id)a3
{
}

- (MAAutoAssetStatus)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end