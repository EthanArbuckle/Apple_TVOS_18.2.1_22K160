@interface MTStoreActionFactory
+ (id)subscribeAction;
+ (id)unsubscribeAction;
+ (id)viewStoreDescriptionAction;
@end

@implementation MTStoreActionFactory

+ (id)subscribeAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Follow" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_100244F70);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_100244FB0);
  return v5;
}

+ (id)unsubscribeAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Unfollow" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_100244FD0);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_100244FF0);
  return v5;
}

+ (id)viewStoreDescriptionAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"VIEW_DESCRIPTION" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_100245010);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_100245030);
  return v5;
}

@end