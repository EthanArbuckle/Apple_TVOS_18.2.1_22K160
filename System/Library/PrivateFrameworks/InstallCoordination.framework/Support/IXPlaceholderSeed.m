@interface IXPlaceholderSeed
+ (BOOL)supportsSecureCoding;
- (BOOL)isAppExtension;
- (IXPlaceholderSeed)initWithCoder:(id)a3;
- (NSString)bundleID;
- (NSString)bundleName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)installType;
- (unint64_t)placeholderType;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBundleName:(id)a3;
- (void)setInstallType:(unint64_t)a3;
- (void)setPlaceholderType:(unint64_t)a3;
@end

@implementation IXPlaceholderSeed

- (IXPlaceholderSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___IXPlaceholderSeed;
  v5 = -[IXOwnedDataPromiseSeed initWithCoder:](&v19, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    bundleName = v5->_bundleName;
    v5->_bundleName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"installType"];
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v5->_installType = (unint64_t)[v13 unsignedLongLongValue];

    if ([v4 containsValueForKey:@"placeholderType"])
    {
      id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"placeholderType"];
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v5->_placeholderType = (unint64_t)[v15 unsignedLongLongValue];
    }

    else
    {
      unsigned int v16 = [v4 decodeBoolForKey:@"isPlugin"];
      uint64_t v17 = 1LL;
      if (v16) {
        uint64_t v17 = 2LL;
      }
      v5->_placeholderType = v17;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IXPlaceholderSeed;
  id v4 = a3;
  -[IXOwnedDataPromiseSeed encodeWithCoder:](&v9, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderSeed bundleName](self, "bundleName", v9.receiver, v9.super_class));
  [v4 encodeObject:v5 forKey:@"bundleName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderSeed bundleID](self, "bundleID"));
  [v4 encodeObject:v6 forKey:@"bundleID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXPlaceholderSeed installType](self, "installType")));
  [v4 encodeObject:v7 forKey:@"installType"];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXPlaceholderSeed placeholderType](self, "placeholderType")));
  [v4 encodeObject:v8 forKey:@"placeholderType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IXPlaceholderSeed;
  id v4 = -[IXOwnedDataPromiseSeed copyWithZone:](&v8, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderSeed bundleName](self, "bundleName"));
  [v4 setBundleName:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderSeed bundleID](self, "bundleID"));
  [v4 setBundleID:v6];

  objc_msgSend(v4, "setInstallType:", -[IXPlaceholderSeed installType](self, "installType"));
  objc_msgSend(v4, "setPlaceholderType:", -[IXPlaceholderSeed placeholderType](self, "placeholderType"));
  return v4;
}

- (BOOL)isAppExtension
{
  return IXIsAppExtensionForPlaceholderType(-[IXPlaceholderSeed placeholderType](self, "placeholderType"));
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)setInstallType:(unint64_t)a3
{
  self->_installType = a3;
}

- (unint64_t)placeholderType
{
  return self->_placeholderType;
}

- (void)setPlaceholderType:(unint64_t)a3
{
  self->_placeholderType = a3;
}

- (void).cxx_destruct
{
}

@end