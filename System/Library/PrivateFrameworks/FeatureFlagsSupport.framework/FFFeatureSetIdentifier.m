@interface FFFeatureSetIdentifier
+ (id)identifierFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FFFeatureSetIdentifier)initWithGroup:(id)a3 set:(id)a4;
- (NSString)featureGroupName;
- (NSString)featureSetName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FFFeatureSetIdentifier

- (FFFeatureSetIdentifier)initWithGroup:(id)a3 set:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___FFFeatureSetIdentifier;
  v9 = -[FFFeatureSetIdentifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureGroupName, a3);
    objc_storeStrong((id *)&v10->_featureSetName, a4);
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
      v9 = objc_alloc(&OBJC_CLASS___FFFeatureSetIdentifier);
      [v3 objectAtIndexedSubscript:0];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 objectAtIndexedSubscript:1];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[FFFeatureSetIdentifier initWithGroup:set:](v9, "initWithGroup:set:", v10, v11);

      goto LABEL_6;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_featureGroupName, "hash");
  return -[NSString hash](self->_featureSetName, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    featureGroupName = self->_featureGroupName;
    [v7 featureGroupName];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](featureGroupName, "isEqualToString:", v9))
    {
      featureSetName = self->_featureSetName;
      [v7 featureSetName];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v6 = -[NSString isEqualToString:](featureSetName, "isEqualToString:", v11);
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
  return -[FFFeatureSetIdentifier initWithGroup:set:]( +[FFFeatureSetIdentifier allocWithZone:](&OBJC_CLASS___FFFeatureSetIdentifier, "allocWithZone:", a3),  "initWithGroup:set:",  self->_featureGroupName,  self->_featureSetName);
}

- (NSString)featureGroupName
{
  return self->_featureGroupName;
}

- (NSString)featureSetName
{
  return self->_featureSetName;
}

- (void).cxx_destruct
{
}

@end