@interface NEFlowMetaData
+ (BOOL)supportsSecureCoding;
- (BOOL)fastOpenRequested;
- (BOOL)multipathRequested;
- (NEFlowMetaData)initWithCoder:(id)a3;
- (NSData)sourceAppAuditToken;
- (NSData)sourceAppUniqueIdentifier;
- (NSString)sourceAppSigningIdentifier;
- (NSUUID)filterFlowIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEFlowMetaData

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[NEFlowMetaData sourceAppSigningIdentifier](self, "sourceAppSigningIdentifier");
  v5 = -[NEFlowMetaData sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  [v3 stringWithFormat:@"%@[%@]", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NEFlowMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEFlowMetaData;
  v5 = -[NEFlowMetaData init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppSigningIdentifier"];
    sourceAppSigningIdentifier = v5->_sourceAppSigningIdentifier;
    v5->_sourceAppSigningIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppUniqueIdentifier"];
    sourceAppUniqueIdentifier = v5->_sourceAppUniqueIdentifier;
    v5->_sourceAppUniqueIdentifier = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppAuditToken"];
    sourceAppAuditToken = v5->_sourceAppAuditToken;
    v5->_sourceAppAuditToken = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filterFlowID"];
    filterFlowIdentifier = v5->_filterFlowIdentifier;
    v5->_filterFlowIdentifier = (NSUUID *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEFlowMetaData sourceAppSigningIdentifier](self, "sourceAppSigningIdentifier");
  [v4 encodeObject:v5 forKey:@"sourceAppSigningIdentifier"];

  -[NEFlowMetaData sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"sourceAppUniqueIdentifier"];
  v7 = -[NEFlowMetaData sourceAppAuditToken](self, "sourceAppAuditToken");
  [v4 encodeObject:v7 forKey:@"sourceAppAuditToken"];

  -[NEFlowMetaData filterFlowIdentifier](self, "filterFlowIdentifier");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"filterFlowID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEFlowMetaData allocWithZone:](&OBJC_CLASS___NEFlowMetaData, "allocWithZone:", a3);
  v5 = -[NEFlowMetaData sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  -[NEFlowMetaData sourceAppSigningIdentifier](self, "sourceAppSigningIdentifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = -[NEFlowMetaData fastOpenRequested](self, "fastOpenRequested");
  BOOL v7 = -[NEFlowMetaData multipathRequested](self, "multipathRequested");
  -[NEFlowMetaData sourceAppAuditToken](self, "sourceAppAuditToken");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NEFlowMetaData filterFlowIdentifier](self, "filterFlowIdentifier");
  id v10 = v5;
  id v11 = v6;
  id v12 = v8;
  id v13 = v9;
  if (v4)
  {
    v17.receiver = v4;
    v17.super_class = (Class)&OBJC_CLASS___NEFlowMetaData;
    v14 = -[NEFlowMetaData init](&v17, sel_init);
    id v4 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_sourceAppSigningIdentifier, v6);
      objc_storeStrong((id *)&v4->_sourceAppUniqueIdentifier, v5);
      v4->_fastOpenRequested = v16;
      v4->_multipathRequested = v7;
      objc_storeStrong((id *)&v4->_sourceAppAuditToken, v8);
      objc_storeStrong((id *)&v4->_filterFlowIdentifier, v9);
    }
  }

  return v4;
}

- (NSData)sourceAppUniqueIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)sourceAppSigningIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSData)sourceAppAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSUUID)filterFlowIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (BOOL)fastOpenRequested
{
  return self->_fastOpenRequested;
}

- (BOOL)multipathRequested
{
  return self->_multipathRequested;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end