@interface DebugHierarchyResetAction
+ (id)resetRequest;
- (void)performInContext:(id)a3;
@end

@implementation DebugHierarchyResetAction

+ (id)resetRequest
{
  v2 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyResetAction);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithDiscoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithDiscoveryType:actions:completion:",  0LL,  v3,  &__block_literal_global_2));

  [v4 setName:@"Cleanup"];
  return v4;
}

- (void)performInContext:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub", a3));
  [v3 clearAllRequestsAndData];
}

@end