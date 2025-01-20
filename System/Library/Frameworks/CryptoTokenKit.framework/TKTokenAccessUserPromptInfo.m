@interface TKTokenAccessUserPromptInfo
+ (BOOL)supportsSecureCoding;
- (NSString)clientDisplayName;
- (NSString)providerDisplayName;
- (NSUUID)correlationID;
- (TKTokenAccessUserPromptInfo)initWithCoder:(id)a3;
- (TKTokenAccessUserPromptInfo)initWithTokenAccessRequest:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TKTokenAccessUserPromptInfo

- (TKTokenAccessUserPromptInfo)initWithTokenAccessRequest:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TKTokenAccessUserPromptInfo;
  v5 = -[TKTokenAccessUserPromptInfo init](&v17, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 correlationID];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSUUID *)v6;

    [v4 clientName];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }

    else
    {
      [v4 clientBundleID];
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    clientDisplayName = v5->_clientDisplayName;
    v5->_clientDisplayName = v10;

    [v4 providerName];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }

    else
    {
      [v4 providerBundleID];
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

    providerDisplayName = v5->_providerDisplayName;
    v5->_providerDisplayName = v14;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenAccessUserPromptInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TKTokenAccessUserPromptInfo;
  v5 = -[TKTokenAccessUserPromptInfo init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kClientDisplayName"];
    clientDisplayName = v5->_clientDisplayName;
    v5->_clientDisplayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kProviderDisplayName"];
    providerDisplayName = v5->_providerDisplayName;
    v5->_providerDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCorrelationID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSUUID *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clientDisplayName = self->_clientDisplayName;
  id v5 = a3;
  [v5 encodeObject:clientDisplayName forKey:@"kClientDisplayName"];
  [v5 encodeObject:self->_providerDisplayName forKey:@"kProviderDisplayName"];
  [v5 encodeObject:self->_correlationID forKey:@"kCorrelationID"];
}

- (NSString)clientDisplayName
{
  return self->_clientDisplayName;
}

- (NSString)providerDisplayName
{
  return self->_providerDisplayName;
}

- (NSUUID)correlationID
{
  return self->_correlationID;
}

- (void).cxx_destruct
{
}

@end