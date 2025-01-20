@interface PAMediaConversionServiceCompositeImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithPolicies:(id)a3;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSArray)policies;
- (PAMediaConversionServiceCompositeImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPolicies:(id)a3;
@end

@implementation PAMediaConversionServiceCompositeImageMetadataPolicy

- (PAMediaConversionServiceCompositeImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"policyList"])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"policyList"]);
    -[PAMediaConversionServiceCompositeImageMetadataPolicy setPolicies:](self, "setPolicies:", v5);
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceCompositeImageMetadataPolicy policies](self, "policies"));
  [v4 encodeObject:v5 forKey:@"policyList"];
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceCompositeImageMetadataPolicy policies](self, "policies", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)i) metadataNeedsProcessing:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceCompositeImageMetadataPolicy policies](self, "policies", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v10 metadataNeedsProcessing:v4])
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 processMetadata:v4]);

          id v4 = (id)v11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (NSArray)policies
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPolicies:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)policyWithPolicies:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 335, @"Invalid parameter not satisfying: %@", @"policies" object file lineNumber description];
  }

  id v6 = objc_opt_new(&OBJC_CLASS___PAMediaConversionServiceCompositeImageMetadataPolicy);
  -[PAMediaConversionServiceCompositeImageMetadataPolicy setPolicies:](v6, "setPolicies:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end