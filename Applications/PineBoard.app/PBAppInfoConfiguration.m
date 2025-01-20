@interface PBAppInfoConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPBAppInfoConfiguration;
- (Class)classForCoder;
- (NSDictionary)singleAppModeOptions;
- (NSString)description;
- (PBAppInfoConfiguration)initWithConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation PBAppInfoConfiguration

- (PBAppInfoConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBAppInfoConfiguration;
  v5 = -[PBAppInfoConfiguration initWithConfiguration:](&v10, "initWithConfiguration:", v4);
  if (v5 && [v4 isPBAppInfoConfiguration])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 singleAppModeOptions]);
    v7 = (NSDictionary *)[v6 copy];
    singleAppModeOptions = v5->_singleAppModeOptions;
    v5->_singleAppModeOptions = v7;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBAppInfoConfiguration);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v12.receiver = self,
        v12.super_class = (Class)&OBJC_CLASS___PBAppInfoConfiguration,
        -[PBAppInfoConfiguration isEqual:](&v12, "isEqual:", v4)))
  {
    singleAppModeOptions = self->_singleAppModeOptions;
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v4 singleAppModeOptions]);
    if (singleAppModeOptions == v7)
    {
      unsigned __int8 v10 = 1;
    }

    else
    {
      v8 = self->_singleAppModeOptions;
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 singleAppModeOptions]);
      unsigned __int8 v10 = -[NSDictionary isEqual:](v8, "isEqual:", v9);
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoConfiguration singleAppModeOptions](self, "singleAppModeOptions"));
  id v5 = [v3 appendObject:v4 withName:@"singleAppModeOptions"];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v6;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBAppInfoConfiguration;
  id v4 = objc_msgSend(v3, "appendUnsignedInteger:", -[PBAppInfoConfiguration hash](&v9, "hash"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoConfiguration singleAppModeOptions](self, "singleAppModeOptions"));
  id v6 = [v3 appendObject:v5];

  id v7 = [v3 hash];
  return (unint64_t)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBMutableAppInfoConfiguration initWithConfiguration:]( +[PBMutableAppInfoConfiguration allocWithZone:]( &OBJC_CLASS___PBMutableAppInfoConfiguration,  "allocWithZone:",  a3),  "initWithConfiguration:",  self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___PBSAppInfoConfiguration);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)isPBAppInfoConfiguration
{
  return 1;
}

- (NSDictionary)singleAppModeOptions
{
  return self->_singleAppModeOptions;
}

- (void).cxx_destruct
{
}

@end