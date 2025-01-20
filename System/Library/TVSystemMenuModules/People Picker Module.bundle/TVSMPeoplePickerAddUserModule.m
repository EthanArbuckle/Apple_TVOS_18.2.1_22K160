@interface TVSMPeoplePickerAddUserModule
+ (id)availableStyles;
- (NSString)accessibilityIdentifierSuffix;
- (NSString)analyticsActionType;
- (NSString)identifier;
- (TVSMAnalyticsElementInfo)analyticsElementInfo;
- (TVSMModuleContentViewController)contentViewController;
- (TVSMModuleDelegate)delegate;
- (TVSMPeoplePickerAddUserModule)init;
- (int64_t)style;
- (int64_t)type;
- (void)contentModuleViewControllerDidTriggerAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation TVSMPeoplePickerAddUserModule

+ (id)availableStyles
{
  return &off_CFC0;
}

- (TVSMPeoplePickerAddUserModule)init
{
  SEL v5 = a2;
  v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSMPeoplePickerAddUserModule;
  v6 = -[TVSMPeoplePickerAddUserModule init](&v4, "init");
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    v6->_style = 0LL;
    objc_storeStrong((id *)&v6->_identifier, @"TVSMPeoplePicker.AddUserModule");
    v6->_type = 1LL;
  }

  v3 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v3;
}

- (NSString)accessibilityIdentifierSuffix
{
  return (NSString *)@"PeoplePicker.AddUser";
}

- (TVSMModuleContentViewController)contentViewController
{
  v7 = self;
  v6[1] = (id)a2;
  if (!self->_contentViewController)
  {
    v6[0] = objc_alloc_init(&OBJC_CLASS___TVSMButtonViewController);
    [v6[0] setStyle:v7->_style];
    [v6[0] setSymbolStyle:1];
    [v6[0] setImageSymbolName:@"plus"];
    id v3 = v6[0];
    SEL v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v7));
    objc_super v4 =  -[NSBundle localizedStringForKey:value:table:]( v5,  "localizedStringForKey:value:table:",  @"PeoplePickerAddUserActionTitle",  &stru_CD90);
    objc_msgSend(v3, "setTitleText:");

    [v6[0] setDelegate:v7];
    objc_storeStrong((id *)&v7->_contentViewController, v6[0]);
    objc_storeStrong(v6, 0LL);
  }

  return v7->_contentViewController;
}

- (NSString)analyticsActionType
{
  return (NSString *)TVSMClickAnalyticsActionTypeSelect;
}

- (TVSMAnalyticsElementInfo)analyticsElementInfo
{
  v7 = self;
  v6[1] = (id)a2;
  uint64_t v3 = TVSMClickReportableUndefinedIdentiferPrefix;
  objc_super v4 = -[TVSMPeoplePickerAddUserModule identifier](self, "identifier");
  v6[0] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v3, v4);

  SEL v5 =  +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  v6[0],  TVSMAnalyticsElementTypeControl,  -[TVSMPeoplePickerAddUserModule style](v7, "style"));
  objc_storeStrong(v6, 0LL);
  return v5;
}

- (void)contentModuleViewControllerDidTriggerAction:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  SEL v5 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=NEW_USER");
  id v3 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  [v3 openSensitiveURL:v5 withOptions:0];

  id WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
  [WeakRetained moduleDidRequestSystemMenuDismissal:v7 animated:1 result:0];

  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSMModuleDelegate)delegate
{
  return (TVSMModuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end