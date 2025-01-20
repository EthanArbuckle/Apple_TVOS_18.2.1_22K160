@interface _LSBundleIdentifierAndType
+ (id)createRepresentingProxy:(id)a3;
+ (id)createRepresentingRecord:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleID;
- (NSString)type;
- (_LSBundleIdentifierAndType)initWithBundleID:(id)a3 type:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _LSBundleIdentifierAndType

- (_LSBundleIdentifierAndType)initWithBundleID:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____LSBundleIdentifierAndType;
  v9 = -[_LSBundleIdentifierAndType init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_type, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_bundleID, "hash");
  return -[NSString hash](self->_type, "hash") ^ (2 * v3);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    [v5 bundleID];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 isEqualToString:self->_bundleID])
    {
      [v5 type];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      char v8 = [v7 isEqual:self->_type];
    }

    else
    {
      char v8 = 0;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_LSBundleIdentifierAndType initWithBundleID:type:]( objc_alloc(&OBJC_CLASS____LSBundleIdentifierAndType),  "initWithBundleID:type:",  self->_bundleID,  self->_type);
}

+ (id)createRepresentingProxy:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 createRepresentingRecord:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)createRepresentingRecord:(id)a3
{
  id v4 = a3;
  [v4 bundleIdentifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 typeForInstallMachinery];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = 0LL;
  if (v5 && v6) {
    id v7 = (void *)[objc_alloc((Class)a1) initWithBundleID:v5 type:v6];
  }

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end