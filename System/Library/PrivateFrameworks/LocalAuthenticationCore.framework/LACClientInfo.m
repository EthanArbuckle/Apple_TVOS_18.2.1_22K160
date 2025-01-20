@interface LACClientInfo
+ (BOOL)supportsSecureCoding;
+ (id)emptyClientInfo;
- (LACClientInfo)initWithBundleId:(id)a3 displayName:(id)a4;
- (LACClientInfo)initWithCoder:(id)a3;
- (NSString)bundleId;
- (NSString)displayName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACClientInfo

- (LACClientInfo)initWithBundleId:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACClientInfo;
  v9 = -[LACClientInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

+ (id)emptyClientInfo
{
  return (id)[objc_alloc((Class)a1) initWithBundleId:0 displayName:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[LACClientInfo bundleId](self, "bundleId");
  NSStringFromSelector(sel_bundleId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:v6];

  -[LACClientInfo displayName](self, "displayName");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_displayName);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:v7];
}

- (LACClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  NSStringFromSelector(sel_bundleId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v5 forKey:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = objc_opt_class();
  NSStringFromSelector(sel_displayName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v8 forKey:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LACClientInfo initWithBundleId:displayName:](self, "initWithBundleId:displayName:", v7, v10);
  return v11;
}

- (id)description
{
  v15[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (void *)NSString;
  v6 = -[LACClientInfo bundleId](self, "bundleId");
  [v5 stringWithFormat:@"bundleID: %@", v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  uint64_t v8 = (void *)NSString;
  v9 = -[LACClientInfo displayName](self, "displayName");
  [v8 stringWithFormat:@"displayName: %@", v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 componentsJoinedByString:@"; "];
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
}

@end