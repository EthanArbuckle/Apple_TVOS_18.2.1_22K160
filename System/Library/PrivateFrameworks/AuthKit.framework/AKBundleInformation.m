@interface AKBundleInformation
+ (BOOL)supportsSecureCoding;
- (AKBundleInformation)initWithBundleIdentifier:(id)a3 bundleName:(id)a4 bundleDescription:(id)a5 bundleType:(unint64_t)a6 otherInfo:(id)a7;
- (AKBundleInformation)initWithCoder:(id)a3;
- (NSDictionary)otherInfo;
- (NSString)bundleDescription;
- (NSString)bundleIdentifier;
- (NSString)bundleName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)bundleType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKBundleInformation

- (AKBundleInformation)initWithBundleIdentifier:(id)a3 bundleName:(id)a4 bundleDescription:(id)a5 bundleType:(unint64_t)a6 otherInfo:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___AKBundleInformation;
  v17 = -[AKBundleInformation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleName, a4);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v18->_bundleDescription, a5);
    v18->_bundleType = a6;
    objc_storeStrong((id *)&v18->_otherInfo, a7);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  bundleName = self->_bundleName;
  id v6 = a3;
  [v6 encodeObject:bundleName forKey:@"_bundleName"];
  [v6 encodeObject:self->_bundleIdentifier forKey:@"_bundleIdentifier"];
  [v6 encodeObject:self->_bundleDescription forKey:@"_bundleDescription"];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_bundleType));
  [v6 encodeObject:v5 forKey:@"_bundleType"];

  [v6 encodeObject:self->_otherInfo forKey:@"_otherInfo"];
}

- (AKBundleInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = -[AKBundleInformation init](self, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"_bundleName");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    bundleName = v6->_bundleName;
    v6->_bundleName = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"_bundleIdentifier");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"_bundleDescription");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    bundleDescription = v6->_bundleDescription;
    v6->_bundleDescription = (NSString *)v16;

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v18),  @"_bundleType");
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v6->_bundleType = (unint64_t)[v20 integerValue];

    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary, v21);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v23);
    v26 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v22,  v24,  objc_opt_class(&OBJC_CLASS___NSValue, v25),  0LL);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v27 forKey:@"_otherInfo"]);
    otherInfo = v6->_otherInfo;
    v6->_otherInfo = (NSDictionary *)v28;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___AKBundleInformation);
  uint64_t v5 = (NSString *)-[NSString copy](self->_bundleName, "copy");
  bundleName = v4->_bundleName;
  v4->_bundleName = v5;

  id v7 = (NSString *)-[NSString copy](self->_bundleIdentifier, "copy");
  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = v7;

  v9 = (NSString *)-[NSString copy](self->_bundleDescription, "copy");
  bundleDescription = v4->_bundleDescription;
  v4->_bundleDescription = v9;

  v4->_bundleType = self->_bundleType;
  id v11 = (NSDictionary *)-[NSDictionary copy](self->_otherInfo, "copy");
  otherInfo = v4->_otherInfo;
  v4->_otherInfo = v11;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)bundleDescription
{
  return self->_bundleDescription;
}

- (unint64_t)bundleType
{
  return self->_bundleType;
}

- (NSDictionary)otherInfo
{
  return self->_otherInfo;
}

- (void).cxx_destruct
{
}

@end