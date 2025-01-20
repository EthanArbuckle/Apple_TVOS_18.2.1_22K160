@interface PDCloudStoreContainerConfiguration
+ (id)passSyncConfigWithDataSource:(id)a3;
+ (id)passSyncSecureConfigWithDataSource:(id)a3;
- (BOOL)canInitializeContainer;
- (BOOL)isEndToEndEncrypted;
- (NSArray)validScopes;
- (NSString)applicationBundleIdentifier;
- (NSString)containerIdentifier;
- (PDCloudStoreContainerConfiguration)initWithCanInitializeContainer:(BOOL)a3 isEndToEndEncrypted:(BOOL)a4 containerIdentifier:(id)a5 validScopes:(id)a6 environment:(int64_t)a7 applicationBundleIdenifier:(id)a8 dataSource:(id)a9;
- (PDCloudStoreContainerDatabaseDataSource)containerDatabaseDataSource;
- (PDCloudStoreDataSource)dataSource;
- (id)description;
- (id)logDescription;
- (id)stringPrefixedWithContainerName:(id)a3;
- (int64_t)environment;
- (void)setContainerDatabaseDataSource:(id)a3;
@end

@implementation PDCloudStoreContainerConfiguration

+ (id)passSyncConfigWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v7 = PKIsPhone(v5, v6);
  if ((v7 & 1) != 0 || (PKIsWatch(v7) & 1) != 0 || (uint64_t v8 = PKIsPad(), (v8 & 1) != 0) || (PKIsMac(v8, v9) & 1) != 0) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = PKIsVision();
  }
  id v11 = [v5 initWithCanInitializeContainer:v10 isEndToEndEncrypted:0 containerIdentifier:PKCloudStorePassesSyncContainerName validScopes:&off_1006910A0 environment:PKPassSyncContainerEnvironment() applicationBund leIdenifier:PKPassdBundleIdentifier dataSource:v4];

  return v11;
}

+ (id)passSyncSecureConfigWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v7 = PKIsPhone(v5, v6);
  if ((v7 & 1) != 0 || (PKIsWatch(v7) & 1) != 0 || (uint64_t v8 = PKIsPad(), (v8 & 1) != 0) || (PKIsMac(v8, v9) & 1) != 0) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = PKIsVision();
  }
  id v11 = [v5 initWithCanInitializeContainer:v10 isEndToEndEncrypted:1 containerIdentifier:PKCloudStorePassesSyncSecureContainerName validScopes:&off_1006910B8 environment:PKPassSyncSecureContainerEnvironment() applicationBund leIdenifier:PKPassdBundleIdentifier dataSource:v4];

  return v11;
}

- (PDCloudStoreContainerConfiguration)initWithCanInitializeContainer:(BOOL)a3 isEndToEndEncrypted:(BOOL)a4 containerIdentifier:(id)a5 validScopes:(id)a6 environment:(int64_t)a7 applicationBundleIdenifier:(id)a8 dataSource:(id)a9
{
  id v22 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDCloudStoreContainerConfiguration;
  v18 = -[PDCloudStoreContainerConfiguration init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    v18->_canInitializeContainer = a3;
    v18->_isEndToEndEncrypted = a4;
    objc_storeStrong((id *)&v18->_containerIdentifier, a5);
    objc_storeStrong((id *)&v19->_validScopes, a6);
    v19->_environment = a7;
    objc_storeStrong((id *)&v19->_applicationBundleIdentifier, a8);
    objc_storeStrong((id *)&v19->_dataSource, a9);
  }

  return v19;
}

- (id)logDescription
{
  if (self->_isEndToEndEncrypted) {
    return @"SyncSecure";
  }
  else {
    return @"Sync";
  }
}

- (id)stringPrefixedWithContainerName:(id)a3
{
  return -[NSString stringByAppendingString:](self->_containerIdentifier, "stringByAppendingString:", a3);
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_canInitializeContainer));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"canInitializeContainer: %@", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isEndToEndEncrypted));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"isEndToEndEncrypted: %@", v5);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"containerIdentifier: %@", self->_containerIdentifier);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"validScopes: %@", self->_validScopes);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_environment));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"environment: %@", v6);

  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"applicationBundleIdenifier: %@",  self->_applicationBundleIdentifier);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"dataSource: %@", self->_dataSource);
  id v7 = -[NSMutableString copy](v3, "copy");

  return v7;
}

- (BOOL)canInitializeContainer
{
  return self->_canInitializeContainer;
}

- (BOOL)isEndToEndEncrypted
{
  return self->_isEndToEndEncrypted;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSArray)validScopes
{
  return self->_validScopes;
}

- (int64_t)environment
{
  return self->_environment;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (PDCloudStoreDataSource)dataSource
{
  return self->_dataSource;
}

- (PDCloudStoreContainerDatabaseDataSource)containerDatabaseDataSource
{
  return (PDCloudStoreContainerDatabaseDataSource *)objc_loadWeakRetained((id *)&self->_containerDatabaseDataSource);
}

- (void)setContainerDatabaseDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end