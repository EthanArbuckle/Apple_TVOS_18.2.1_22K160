@interface TVSettingsUsageAppRecord
- (LSApplicationRecord)lsRecord;
- (NSNumber)size;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)name;
- (NSString)vendor;
- (TVSettingsUsageAppRecord)initWithName:(id)a3 bundleIdentifier:(id)a4 bundleVersion:(id)a5 vendor:(id)a6 size:(id)a7;
@end

@implementation TVSettingsUsageAppRecord

- (TVSettingsUsageAppRecord)initWithName:(id)a3 bundleIdentifier:(id)a4 bundleVersion:(id)a5 vendor:(id)a6 size:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVSettingsUsageAppRecord;
  v17 = -[TVSettingsUsageAppRecord init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v18->_bundleVersion, a5);
    objc_storeStrong((id *)&v18->_vendor, a6);
    objc_storeStrong((id *)&v18->_size, a7);
  }

  return v18;
}

- (LSApplicationRecord)lsRecord
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUsageAppRecord bundleIdentifier](self, "bundleIdentifier"));
  v3 = sub_10008F154(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (LSApplicationRecord *)v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)vendor
{
  return self->_vendor;
}

- (NSNumber)size
{
  return self->_size;
}

- (void).cxx_destruct
{
}

@end