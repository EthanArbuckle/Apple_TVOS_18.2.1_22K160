@interface MADMarker
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSetJob;
- (MAAutoAssetSelector)assetSelector;
- (MADAutoSetPolicy)pushedPolicy;
- (MADAutoSetPolicy)setPolicy;
- (MADMarker)initWithCoder:(id)a3;
- (NSString)assetSetIdentifier;
- (NSString)assetType;
- (NSString)clientDomainName;
- (id)description;
- (id)initForAssetType:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5 forAssetSelector:(id)a6 forSetJob:(BOOL)a7 withSetPolicy:(id)a8 withPushedPolicy:(id)a9;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setPushedPolicy:(id)a3;
@end

@implementation MADMarker

- (id)initForAssetType:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5 forAssetSelector:(id)a6 forSetJob:(BOOL)a7 withSetPolicy:(id)a8 withPushedPolicy:(id)a9
{
  BOOL v10 = a7;
  id v28 = a3;
  id v27 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MADMarker;
  v20 = -[MADMarker init](&v29, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_assetType, a3);
    if (v10)
    {
      v21->_isSetJob = 1;
      objc_storeStrong((id *)&v21->_clientDomainName, a4);
      objc_storeStrong((id *)&v21->_assetSetIdentifier, a5);
      objc_storeStrong((id *)&v21->_setPolicy, a8);
      uint64_t v22 = 6LL;
      v23 = v19;
    }

    else
    {
      v21->_isSetJob = 0;
      uint64_t v22 = 7LL;
      v23 = v17;
    }

    v24 = v23;
    Class v25 = (&v21->super.isa)[v22];
    (&v21->super.isa)[v22] = v24;
  }

  return v21;
}

- (MADMarker)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MADMarker;
  v5 = -[MADMarker init](&v19, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetType"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"assetSelector"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v16;

    v5->_isSetJob = [v4 decodeBoolForKey:@"isSetJob"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetType](self, "assetType"));
  [v8 encodeObject:v4 forKey:@"assetType"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker clientDomainName](self, "clientDomainName"));
  [v8 encodeObject:v5 forKey:@"clientDomainName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSetIdentifier](self, "assetSetIdentifier"));
  [v8 encodeObject:v6 forKey:@"assetSetIdentifier"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSelector](self, "assetSelector"));
  [v8 encodeObject:v7 forKey:@"assetSelector"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MADMarker isSetJob](self, "isSetJob"), @"isSetJob");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetType](self, "assetType"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"assetType: %@\n",  v3));

  if (-[MADMarker isSetJob](self, "isSetJob"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker clientDomainName](self, "clientDomainName"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSetIdentifier](self, "assetSetIdentifier"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker setPolicy](self, "setPolicy"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@clientDomainName: %@\nassetSetIdentifier: %@\nsetPolicy: %@",  v4,  v5,  v6,  v8));

    id v4 = v7;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSelector](self, "assetSelector"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@assetSelector: %@",  v4,  v6));
  }

  return v9;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetType](self, "assetType"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"assetType: %@\n",  v3));

  if (-[MADMarker isSetJob](self, "isSetJob"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker clientDomainName](self, "clientDomainName"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSetIdentifier](self, "assetSetIdentifier"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker setPolicy](self, "setPolicy"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@clientDomainName: %@\nassetSetIdentifier: %@\nsetPolicy: %@",  v4,  v5,  v6,  v8));

    id v4 = v7;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSelector](self, "assetSelector"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@assetSelector: %@",  v4,  v6));
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MADMarker *)a3;
  if (v4 == self)
  {
    unsigned __int8 v7 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___MADMarker);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
      && (unsigned int v6 = -[MADMarker isSetJob](self, "isSetJob"), v6 == -[MADMarker isSetJob](v4, "isSetJob")))
    {
      if (-[MADMarker isSetJob](self, "isSetJob"))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker clientDomainName](self, "clientDomainName"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker clientDomainName](v4, "clientDomainName"));
        if ([v8 isEqualToString:v9])
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSetIdentifier](self, "assetSetIdentifier"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSetIdentifier](v4, "assetSetIdentifier"));
          unsigned __int8 v7 = [v10 isEqualToString:v11];
        }

        else
        {
          unsigned __int8 v7 = 0;
        }
      }

      else
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSelector](self, "assetSelector"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADMarker assetSelector](v4, "assetSelector"));
        unsigned __int8 v7 = [v8 isEqual:v9];
      }
    }

    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isSetJob
{
  return self->_isSetJob;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (MADAutoSetPolicy)setPolicy
{
  return self->_setPolicy;
}

- (MADAutoSetPolicy)pushedPolicy
{
  return self->_pushedPolicy;
}

- (void)setPushedPolicy:(id)a3
{
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void).cxx_destruct
{
}

@end