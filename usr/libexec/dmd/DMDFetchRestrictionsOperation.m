@interface DMDFetchRestrictionsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchRestrictionsOperation

+ (id)whitelistedClassesForRequest
{
  v5[0] = objc_opt_class(&OBJC_CLASS___DMFFetchRestrictionsRequest);
  v5[1] = objc_opt_class(&OBJC_CLASS___DMFFetchGlobalRestrictionsRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000A5850;
}

- (void)runWithRequest:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v8 currentRestrictions]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultRestrictions]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:",  v4,  v5));

  id v7 = [[DMFFetchRestrictionsResultObject alloc] initWithRestrictions:v6];
  -[DMDFetchRestrictionsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v7);
}

@end