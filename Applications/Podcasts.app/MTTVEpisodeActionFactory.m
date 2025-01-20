@interface MTTVEpisodeActionFactory
+ (id)addToUpNextAction;
+ (id)goToShowAction;
+ (id)markBookmarkedAction;
+ (id)markPlayedAction;
+ (id)markUnbookmarkedAction;
+ (id)markUnplayedAction;
+ (id)playNextAction;
+ (id)removeFromUpNext;
+ (id)viewAction;
+ (id)viewDescriptionAction;
@end

@implementation MTTVEpisodeActionFactory

+ (id)playNextAction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"UpNext"));
  v3 = objc_alloc(&OBJC_CLASS___IMAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"Play Next" value:&stru_100248948 table:0]);
  v6 = -[IMAction initWithTitle:icon:](v3, "initWithTitle:icon:", v5, v2);

  -[IMAction setConditionBlock:](v6, "setConditionBlock:", &stru_10023FC28);
  -[IMAction setActionBlock:](v6, "setActionBlock:", &stru_10023FC68);

  return v6;
}

+ (id)addToUpNextAction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"UpNext"));
  v3 = objc_alloc(&OBJC_CLASS___IMAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"Play Last" value:&stru_100248948 table:0]);
  v6 = -[IMAction initWithTitle:icon:](v3, "initWithTitle:icon:", v5, v2);

  -[IMAction setConditionBlock:](v6, "setConditionBlock:", &stru_10023FC88);
  -[IMAction setActionBlock:](v6, "setActionBlock:", &stru_10023FCA8);

  return v6;
}

+ (id)removeFromUpNext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"UpNext"));
  v3 = objc_alloc(&OBJC_CLASS___IMAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"REMOVE_FROM_QUEUE" value:&stru_100248948 table:0]);
  v6 = -[IMAction initWithTitle:icon:](v3, "initWithTitle:icon:", v5, v2);

  -[IMAction setConditionBlock:](v6, "setConditionBlock:", &stru_10023FCC8);
  -[IMAction setActionBlock:](v6, "setActionBlock:", &stru_10023FCE8);

  return v6;
}

+ (id)markUnplayedAction
{
  v2 = objc_opt_new(&OBJC_CLASS___IMDynamicTitleAction);
  -[IMDynamicTitleAction setTitleBlock:](v2, "setTitleBlock:", &stru_10023FD28);
  -[IMAction setConditionBlock:](v2, "setConditionBlock:", &stru_10023FD48);
  -[IMAction setActionBlock:](v2, "setActionBlock:", &stru_10023FD68);
  return v2;
}

+ (id)markPlayedAction
{
  v2 = objc_opt_new(&OBJC_CLASS___IMDynamicTitleAction);
  -[IMDynamicTitleAction setTitleBlock:](v2, "setTitleBlock:", &stru_10023FD88);
  -[IMAction setConditionBlock:](v2, "setConditionBlock:", &stru_10023FDA8);
  -[IMAction setActionBlock:](v2, "setActionBlock:", &stru_10023FDC8);
  return v2;
}

+ (id)markBookmarkedAction
{
  v2 = objc_opt_new(&OBJC_CLASS___IMDynamicTitleAction);
  -[IMDynamicTitleAction setTitleBlock:](v2, "setTitleBlock:", &stru_10023FDE8);
  -[IMAction setConditionBlock:](v2, "setConditionBlock:", &stru_10023FE08);
  -[IMAction setActionBlock:](v2, "setActionBlock:", &stru_10023FE28);
  return v2;
}

+ (id)markUnbookmarkedAction
{
  v2 = objc_opt_new(&OBJC_CLASS___IMDynamicTitleAction);
  -[IMDynamicTitleAction setTitleBlock:](v2, "setTitleBlock:", &stru_10023FE48);
  -[IMAction setConditionBlock:](v2, "setConditionBlock:", &stru_10023FE68);
  -[IMAction setActionBlock:](v2, "setActionBlock:", &stru_10023FE88);
  return v2;
}

+ (id)viewAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"VIEW_DOCUMENT" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_10023FEA8);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_10023FEC8);
  return v5;
}

+ (id)viewDescriptionAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"VIEW_DESCRIPTION" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_10023FEE8);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_10023FF08);
  return v5;
}

+ (id)goToShowAction
{
  v2 = objc_alloc(&OBJC_CLASS___IMAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Go to Show" value:&stru_100248948 table:0]);
  v5 = -[IMAction initWithTitle:icon:](v2, "initWithTitle:icon:", v4, 0LL);

  -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_10023FF28);
  -[IMAction setActionBlock:](v5, "setActionBlock:", &stru_10023FF48);
  return v5;
}

@end