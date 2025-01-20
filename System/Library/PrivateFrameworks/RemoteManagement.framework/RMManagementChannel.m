@interface RMManagementChannel
- (id)initWithManagementSource:(id)a3;
- (unint64_t)protocolType;
@end

@implementation RMManagementChannel

- (id)initWithManagementSource:(id)a3
{
  id v3 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 conduitConfig]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v17 state]);
  uint64_t v5 = (int)[v3 enrollmentType];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 storeDescription]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 bootstrapURI]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 enrollmentToken]);
  v12 = v11;
  if (!v11) {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  }
  LOBYTE(v15) = [v3 enrolled];
  v13 = -[RMManagementChannel initWithType:identifier:accountIdentifier:accountDescription:organizationDescription:enrollmentURL:enrollmentToken:isEnrolled:]( self,  "initWithType:identifier:accountIdentifier:accountDescription:organizationDescription:enrollmentURL:enrollmentT oken:isEnrolled:",  v5,  v6,  v7,  v8,  v9,  v10,  v12,  v15);
  if (!v11) {

  }
  return v13;
}

- (unint64_t)protocolType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementChannel enrollmentURL](self, "enrollmentURL"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 scheme]);

  if ([v3 caseInsensitiveCompare:@"https"]
    && [v3 caseInsensitiveCompare:@"file"])
  {
    if ([v3 caseInsensitiveCompare:@"mdm"]) {
      unint64_t v4 = 2LL;
    }
    else {
      unint64_t v4 = 1LL;
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

@end