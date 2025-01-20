@interface InAppReviewRequest
+ (id)entityForContext:(id)a3;
- (id)valueHash;
@end

@implementation InAppReviewRequest

+ (id)entityForContext:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 persistentStoreCoordinator]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectModel]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 entitiesByName]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"InAppReviewRequest"]);

  return v6;
}

- (id)valueHash
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[InAppReviewRequest bundleIdentifier](self, "bundleIdentifier"));
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[InAppReviewRequest bundleVersion](self, "bundleVersion"));
    if (!v5)
    {
      v13 = 0LL;
      goto LABEL_7;
    }

    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReviewRequest date](self, "date"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReviewRequest bundleIdentifier](self, "bundleIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReviewRequest bundleVersion](self, "bundleVersion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[InAppReviewRequest date](self, "date"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
      v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v8,  v9,  v11));

      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 hash]));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);

LABEL_7:
      return v13;
    }
  }

  v13 = 0LL;
  return v13;
}

@end