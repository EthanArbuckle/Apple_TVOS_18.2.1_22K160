@interface MTStoreActionController
- (id)allActions;
@end

@implementation MTStoreActionController

- (id)allActions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreActionFactory subscribeAction](&OBJC_CLASS___MTStoreActionFactory, "subscribeAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreActionFactory unsubscribeAction](&OBJC_CLASS___MTStoreActionFactory, "unsubscribeAction", v2));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreActionFactory viewStoreDescriptionAction]( &OBJC_CLASS___MTStoreActionFactory,  "viewStoreDescriptionAction"));
  v7[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL));

  return v5;
}

@end