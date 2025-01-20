@interface RMConfigurationPayload
+ (BOOL)isSignificantChange:(id)a3;
- (id)reportDetails;
@end

@implementation RMConfigurationPayload

+ (BOOL)isSignificantChange:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"ui"));
  unsigned __int8 v5 = [v3 isSubsetOfSet:v4];

  return v5 ^ 1;
}

- (id)reportDetails
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___RMConfigurationPayload;
  id v3 = -[RMDeclarationPayload reportDetails](&v17, "reportDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPayload assetReferences](self, "assetReferences"));
  if ([v6 count])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"assetIdentifier"]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  }

  else
  {
    v9 = &__NSArray0__struct;
  }

  [v5 setObject:v9 forKeyedSubscript:@"assetReferences"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPayload ui](self, "ui"));
  v11 = v10;
  if (v10)
  {
    unsigned int v12 = [v10 visible];
    v13 = @"hidden";
    if (v12) {
      v13 = @"visible";
    }
    v14 = v13;
  }

  else
  {
    v14 = @"undefined";
  }

  [v5 setObject:v14 forKeyedSubscript:@"ui"];

  id v15 = [v5 copy];
  return v15;
}

@end