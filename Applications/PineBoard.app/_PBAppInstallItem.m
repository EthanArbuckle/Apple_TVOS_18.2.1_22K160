@interface _PBAppInstallItem
- (NSDate)installStartDate;
- (NSString)bundleIdentifier;
- (_PBAppInstallItem)init;
- (_PBAppInstallItem)initWithBundleIdentifier:(id)a3;
- (id)description;
@end

@implementation _PBAppInstallItem

- (_PBAppInstallItem)init
{
  return 0LL;
}

- (_PBAppInstallItem)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____PBAppInstallItem;
  v5 = -[_PBAppInstallItem init](&v11, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    installStartDate = v5->_installStartDate;
    v5->_installStartDate = (NSDate *)v8;
  }

  return v5;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_bundleIdentifier withName:@"bundleIdentifier"];
  id v4 = [v3 appendObject:self->_installStartDate withName:@"installStartDate"];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSDate)installStartDate
{
  return self->_installStartDate;
}

- (void).cxx_destruct
{
}

@end