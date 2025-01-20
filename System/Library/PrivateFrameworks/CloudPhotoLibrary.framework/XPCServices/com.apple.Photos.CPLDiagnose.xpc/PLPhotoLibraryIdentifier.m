@interface PLPhotoLibraryIdentifier
+ (BOOL)supportsSecureCoding;
- (NSString)containerIdentifier;
- (NSString)name;
- (NSString)path;
- (NSString)userDescription;
- (NSString)uuid;
- (PLPhotoLibraryIdentifier)initWithCoder:(id)a3;
- (int64_t)domain;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLPhotoLibraryIdentifier

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoLibraryIdentifier name](self, "name"));
  [v4 encodeObject:v5 forKey:@"Name"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoLibraryIdentifier userDescription](self, "userDescription"));
  [v4 encodeObject:v6 forKey:@"UserDescription"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoLibraryIdentifier uuid](self, "uuid"));
  [v4 encodeObject:v7 forKey:@"UUID"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoLibraryIdentifier path](self, "path"));
  [v4 encodeObject:v8 forKey:@"Path"];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotoLibraryIdentifier containerIdentifier](self, "containerIdentifier"));
  [v4 encodeObject:v9 forKey:@"ContainerIdentifier"];
}

- (PLPhotoLibraryIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PLPhotoLibraryIdentifier;
  v5 = -[PLPhotoLibraryIdentifier init](&v22, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"Name"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    name = v5->_name;
    v5->_name = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"UserDescription"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    userDescription = v5->_userDescription;
    v5->_userDescription = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"UUID"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"Path"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    path = v5->_path;
    v5->_path = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ContainerIdentifier"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v19;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (int64_t)domain
{
  return self->_domain;
}

- (NSString)userDescription
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end