@interface TVSettingsInterfaceFactory
+ (id)sharedInterfaceFactory;
+ (void)initialize;
- (id)_styleSheetURLForTemplate:(id)a3;
- (void)setup;
@end

@implementation TVSettingsInterfaceFactory

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___TVSettingsInterfaceFactory) == a1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVSettingsInterfaceFactory,  "sharedInterfaceFactory"));
    [v2 setup];
  }

+ (id)sharedInterfaceFactory
{
  if (qword_1001E1BE0 != -1) {
    dispatch_once(&qword_1001E1BE0, &stru_100194950);
  }
  return (id)qword_1001E1BD8;
}

- (void)setup
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVInterfaceFactory sharedInterfaceFactory](&OBJC_CLASS___TVInterfaceFactory, "sharedInterfaceFactory"));
  [v3 setExtendedInterfaceCreator:self];
}

- (id)_styleSheetURLForTemplate:(id)a3
{
  if ([a3 isEqualToString:@"listTemplate"])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLForResource:@"SettingsListStyleSheet" withExtension:@"xml"]);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

@end