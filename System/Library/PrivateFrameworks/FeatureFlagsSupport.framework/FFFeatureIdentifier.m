@interface FFFeatureIdentifier
+ (id)identifierFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FFFeatureIdentifier)initWithDomain:(id)a3 feature:(id)a4;
- (NSString)domainName;
- (NSString)featureName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FFFeatureIdentifier

- (FFFeatureIdentifier)initWithDomain:(id)a3 feature:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___FFFeatureIdentifier;
  v9 = -[FFFeatureIdentifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domainName, a3);
    objc_storeStrong((id *)&v10->_featureName, a4);
  }

  return v10;
}

+ (id)identifierFromString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 count] != 2) {
    goto LABEL_5;
  }
  [v3 objectAtIndexedSubscript:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = +[FFConfiguration isValidName:](&OBJC_CLASS___FFConfiguration, "isValidName:", v4);

  v6 = 0LL;
  if (v5)
  {
    [v3 objectAtIndexedSubscript:1];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = +[FFConfiguration isValidName:](&OBJC_CLASS___FFConfiguration, "isValidName:", v7);

    if (v8)
    {
      v9 = objc_alloc(&OBJC_CLASS___FFFeatureIdentifier);
      [v3 objectAtIndexedSubscript:0];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 objectAtIndexedSubscript:1];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[FFFeatureIdentifier initWithDomain:feature:](v9, "initWithDomain:feature:", v10, v11);

      goto LABEL_6;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_domainName, "hash");
  return -[NSString hash](self->_featureName, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    domainName = self->_domainName;
    [v7 domainName];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](domainName, "isEqualToString:", v9))
    {
      featureName = self->_featureName;
      [v7 featureName];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v6 = -[NSString isEqualToString:](featureName, "isEqualToString:", v11);
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FFFeatureIdentifier initWithDomain:feature:]( +[FFFeatureIdentifier allocWithZone:](&OBJC_CLASS___FFFeatureIdentifier, "allocWithZone:", a3),  "initWithDomain:feature:",  self->_domainName,  self->_featureName);
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
}

@end