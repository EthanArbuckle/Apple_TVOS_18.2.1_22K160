@interface NEBundleProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)isWatchKitApp;
- (NEBundleProxy)initWithCoder:(id)a3;
- (NEBundleProxy)initWithIdentifier:(id)a3 url:(id)a4 machOUUIDs:(id)a5 name:(id)a6 appGroups:(id)a7;
- (NSArray)appGroups;
- (NSArray)machOUUIDs;
- (NSString)identifier;
- (NSString)name;
- (NSURL)url;
- (void)encodeWithCoder:(id)a3;
- (void)setIsWatchKitApp:(BOOL)a3;
@end

@implementation NEBundleProxy

- (NEBundleProxy)initWithIdentifier:(id)a3 url:(id)a4 machOUUIDs:(id)a5 name:(id)a6 appGroups:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NEBundleProxy;
  v17 = -[NEBundleProxy init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_url, a4);
    objc_storeStrong((id *)&v18->_machOUUIDs, a5);
    objc_storeStrong((id *)&v18->_name, a6);
    objc_storeStrong((id *)&v18->_appGroups, a7);
  }

  return v18;
}

- (NEBundleProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NEBundleProxy;
  v5 = -[NEBundleProxy init](&v23, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    v10 = (void *)MEMORY[0x189604010];
    uint64_t v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"machOUUIDs"];
    machOUUIDs = v5->_machOUUIDs;
    v5->_machOUUIDs = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v15;

    v17 = (void *)MEMORY[0x189604010];
    uint64_t v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"appGroups"];
    appGroups = v5->_appGroups;
    v5->_appGroups = (NSArray *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEBundleProxy identifier](self, "identifier");
  [v4 encodeObject:v5 forKey:@"identifier"];

  -[NEBundleProxy url](self, "url");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"url"];
  v7 = -[NEBundleProxy machOUUIDs](self, "machOUUIDs");
  [v4 encodeObject:v7 forKey:@"machOUUIDs"];

  -[NEBundleProxy name](self, "name");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"name"];

  -[NEBundleProxy appGroups](self, "appGroups");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"appGroups"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)url
{
  return self->_url;
}

- (NSArray)machOUUIDs
{
  return self->_machOUUIDs;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)appGroups
{
  return self->_appGroups;
}

- (BOOL)isWatchKitApp
{
  return self->_isWatchKitApp;
}

- (void)setIsWatchKitApp:(BOOL)a3
{
  self->_isWatchKitApp = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end