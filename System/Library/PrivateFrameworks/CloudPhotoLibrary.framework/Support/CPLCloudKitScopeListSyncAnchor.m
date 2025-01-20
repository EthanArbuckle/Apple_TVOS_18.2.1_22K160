@interface CPLCloudKitScopeListSyncAnchor
+ (BOOL)supportsSecureCoding;
+ (CPLCloudKitScopeListSyncAnchor)cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:(id)a3;
- (CKServerChangeToken)privateChangeToken;
- (CKServerChangeToken)sharedChangeToken;
- (CPLCloudKitScopeListSyncAnchor)initWithCoder:(id)a3;
- (CPLCloudKitScopeListSyncAnchor)initWithPrivateChangeToken:(id)a3 sharedChangeToken:(id)a4;
- (NSData)scopeListSyncAnchor;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLCloudKitScopeListSyncAnchor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (CPLCloudKitScopeListSyncAnchor)cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:(id)a3
{
  id v4 = a3;
  if (!v4
    || (id v5 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v4,  objc_opt_class(a1)),  (v6 = (id)objc_claimAutoreleasedReturnValue(v5)) == 0LL))
  {
    id v6 = [objc_alloc((Class)a1) initWithPrivateChangeToken:0 sharedChangeToken:0];
  }

  return (CPLCloudKitScopeListSyncAnchor *)v6;
}

- (CPLCloudKitScopeListSyncAnchor)initWithPrivateChangeToken:(id)a3 sharedChangeToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLCloudKitScopeListSyncAnchor;
  v9 = -[CPLCloudKitScopeListSyncAnchor init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privateChangeToken, a3);
    objc_storeStrong((id *)&v10->_sharedChangeToken, a4);
  }

  return v10;
}

- (CPLCloudKitScopeListSyncAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CPLCloudKitScopeListSyncAnchor;
  id v5 = -[CPLCloudKitScopeListSyncAnchor init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(CKServerChangeToken) forKey:@"private"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    privateChangeToken = v5->_privateChangeToken;
    v5->_privateChangeToken = (CKServerChangeToken *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(CKServerChangeToken) forKey:@"shared"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    sharedChangeToken = v5->_sharedChangeToken;
    v5->_sharedChangeToken = (CKServerChangeToken *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  privateChangeToken = self->_privateChangeToken;
  id v5 = a3;
  [v5 encodeObject:privateChangeToken forKey:@"private"];
  [v5 encodeObject:self->_sharedChangeToken forKey:@"shared"];
}

- (NSData)scopeListSyncAnchor
{
  return (NSData *)+[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  self);
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKServerChangeToken data](self->_privateChangeToken, "data"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 base64EncodedStringWithOptions:0]);
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (const __CFString *)v5;
  }
  else {
    uint64_t v7 = @"none";
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKServerChangeToken data](self->_sharedChangeToken, "data"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 base64EncodedStringWithOptions:0]);
  uint64_t v10 = (void *)v9;
  if (v9) {
    v11 = (const __CFString *)v9;
  }
  else {
    v11 = @"none";
  }
  objc_super v12 = -[NSString initWithFormat:](v3, "initWithFormat:", @"private: %@ / shared: %@", v7, v11);

  return v12;
}

- (CKServerChangeToken)privateChangeToken
{
  return self->_privateChangeToken;
}

- (CKServerChangeToken)sharedChangeToken
{
  return self->_sharedChangeToken;
}

- (void).cxx_destruct
{
}

@end