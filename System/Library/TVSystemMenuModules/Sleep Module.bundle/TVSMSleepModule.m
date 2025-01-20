@interface TVSMSleepModule
+ (id)availableStyles;
- (BOOL)dismissAfterAction;
- (id)analyticsActionType;
- (id)analyticsElementInfo;
- (id)contentViewController;
- (void)handleAction;
@end

@implementation TVSMSleepModule

+ (id)availableStyles
{
  return &off_47B0;
}

- (BOOL)dismissAfterAction
{
  return 1;
}

- (void)handleAction
{
  id v3 = +[PBSSystemServiceConnection sharedConnection](&OBJC_CLASS___PBSSystemServiceConnection, "sharedConnection");
  id v2 = [v3 systemServiceProxy];
  [v2 sleepSystemForReason:PBSSleepReasonUserSystemMenu];
}

- (id)contentViewController
{
  v8 = self;
  v7[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSMSleepModule;
  v7[0] = -[TVSMSleepModule contentViewController](&v6, "contentViewController");
  id v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v8));
  v5 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"TVSMSleepModuleSubtitle",  &stru_4738);

  [v7[0] setSecondaryText:v5];
  [v7[0] setSymbolStyle:2];
  id v4 = v7[0];
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(v7, 0LL);
  return v4;
}

- (id)analyticsActionType
{
  return TVSMClickAnalyticsActionTypeExit;
}

- (id)analyticsElementInfo
{
  return +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  @"sleep",  TVSMAnalyticsElementTypeControl,  -[TVSMSleepModule style](self, "style"),  0LL);
}

@end