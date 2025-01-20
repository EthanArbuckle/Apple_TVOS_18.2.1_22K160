@interface TVSMSearchModule
- (BOOL)dismissAfterAction;
- (id)analyticsActionType;
- (id)analyticsElementInfo;
- (void)handleAction;
@end

@implementation TVSMSearchModule

- (BOOL)dismissAfterAction
{
  return 1;
}

- (void)handleAction
{
  v2 =  +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint");
  -[FBSOpenApplicationService openApplication:withOptions:completion:]( v2,  "openApplication:withOptions:completion:",  @"com.apple.TVSearch",  0LL);
}

- (id)analyticsActionType
{
  return TVSMClickAnalyticsActionTypeNavigate;
}

- (id)analyticsElementInfo
{
  return +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  @"search",  TVSMAnalyticsElementTypeControl,  -[TVSMSearchModule style](self, "style"),  0LL);
}

@end