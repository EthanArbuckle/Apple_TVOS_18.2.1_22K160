@interface PLPhotoLibrarySearchCriteria
+ (BOOL)supportsSecureCoding;
- (NSDictionary)internalTestOptions;
- (NSString)containerIdentifier;
- (NSString)uuid;
- (PLPhotoLibrarySearchCriteria)initWithCoder:(id)a3;
- (int64_t)domain;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setInternalTestOptions:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PLPhotoLibrarySearchCriteria

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoLibrarySearchCriteria uuid](self, "uuid"));
  [v4 encodeObject:v5 forKey:@"uuid"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PLPhotoLibrarySearchCriteria domain](self, "domain"), @"domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoLibrarySearchCriteria containerIdentifier](self, "containerIdentifier"));
  [v4 encodeObject:v6 forKey:@"containerIdentifier"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotoLibrarySearchCriteria internalTestOptions](self, "internalTestOptions"));
  [v4 encodeObject:v7 forKey:@"internalTestOptions"];
}

- (PLPhotoLibrarySearchCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PLPhotoLibrarySearchCriteria;
  v5 = -[PLPhotoLibrarySearchCriteria init](&v19, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"uuid"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    v5->_domain = (int64_t)[v4 decodeIntegerForKey:@"domain"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"containerIdentifier"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSURL);
    v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  v13,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"internalTestOptions"]);
    internalTestOptions = v5->_internalTestOptions;
    v5->_internalTestOptions = (NSDictionary *)v16;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSDictionary)internalTestOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInternalTestOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end