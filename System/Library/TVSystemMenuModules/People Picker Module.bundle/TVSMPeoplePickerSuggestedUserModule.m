@interface TVSMPeoplePickerSuggestedUserModule
+ (id)_defaultShortNameFormatter;
+ (id)availableStyles;
- (NSString)accessibilityIdentifierSuffix;
- (NSString)analyticsActionType;
- (NSString)identifier;
- (TVPeoplePickerSuggestedUser)suggestedUser;
- (TVSMAnalyticsElementInfo)analyticsElementInfo;
- (TVSMModuleContentViewController)contentViewController;
- (TVSMModuleDelegate)delegate;
- (TVSMMonogramViewController)monogramVC;
- (TVSMPeoplePickerSuggestedUserModule)initWithSuggestedUser:(id)a3;
- (id)stringForNameComponents:(id)a3;
- (int64_t)style;
- (int64_t)type;
- (void)_updateProfilePhoto;
- (void)contentModuleViewControllerDidTriggerAction:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setMonogramVC:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSuggestedUser:(id)a3;
@end

@implementation TVSMPeoplePickerSuggestedUserModule

- (TVSMPeoplePickerSuggestedUserModule)initWithSuggestedUser:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0LL;
  v10.receiver = v3;
  v10.super_class = (Class)&OBJC_CLASS___TVSMPeoplePickerSuggestedUserModule;
  v9 = -[TVSMPeoplePickerSuggestedUserModule init](&v10, "init");
  v12 = v9;
  objc_storeStrong((id *)&v12, v9);
  if (v9)
  {
    v12->_style = 0LL;
    id v8 = [location[0] identifier];
    v4 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TVSMPeoplePicker.SuggestedUserModule.%@",  v8);
    identifier = v12->_identifier;
    v12->_identifier = v4;

    v12->_type = 1LL;
    objc_storeStrong((id *)&v12->_suggestedUser, location[0]);
    -[TVPeoplePickerSuggestedUser addObserver:forKeyPath:options:context:]( v12->_suggestedUser,  "addObserver:forKeyPath:options:context:",  v12,  @"profileImage",  0LL,  off_12DA0);
  }

  v7 = v12;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVPeoplePickerSuggestedUser removeObserver:forKeyPath:context:]( self->_suggestedUser,  "removeObserver:forKeyPath:context:",  self,  @"profileImage",  off_12DA0);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSMPeoplePickerSuggestedUserModule;
  -[TVSMPeoplePickerSuggestedUserModule dealloc](&v2, "dealloc");
}

+ (id)availableStyles
{
  return &off_CFD8;
}

- (NSString)accessibilityIdentifierSuffix
{
  return (NSString *)@"PeoplePicker.SuggestedUser";
}

- (TVSMModuleContentViewController)contentViewController
{
  if (!self->_contentViewController)
  {
    objc_super v2 = objc_alloc_init(&OBJC_CLASS___TVSMMonogramViewController);
    monogramVC = self->_monogramVC;
    self->_monogramVC = v2;

    v5 = self->_monogramVC;
    v6 = -[TVPeoplePickerSuggestedUser nameComponents](self->_suggestedUser, "nameComponents");
    -[TVSMMonogramViewController setNameComponents:](v5, "setNameComponents:");

    v7 = self->_monogramVC;
    v9 = -[TVPeoplePickerSuggestedUser nameComponents](self->_suggestedUser, "nameComponents");
    id v8 = -[TVSMPeoplePickerSuggestedUserModule stringForNameComponents:](self, "stringForNameComponents:");
    -[TVSMMonogramViewController setTitleText:](v7, "setTitleText:");

    objc_super v10 = self->_monogramVC;
    v11 = -[TVPeoplePickerSuggestedUser profileImage](self->_suggestedUser, "profileImage");
    -[TVSMMonogramViewController setImage:](v10, "setImage:");

    -[TVSMMonogramViewController setBadgeStyle:](self->_monogramVC, "setBadgeStyle:", 2LL);
    -[TVSMMonogramViewController setDelegate:](self->_monogramVC, "setDelegate:", self);
    objc_storeStrong((id *)&self->_contentViewController, self->_monogramVC);
  }

  return self->_contentViewController;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  objc_super v10 = a6;
  if (a6 == off_12DA0)
  {
    -[TVSMPeoplePickerSuggestedUserModule _updateProfilePhoto](v14, "_updateProfilePhoto");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVSMPeoplePickerSuggestedUserModule;
    -[TVSMPeoplePickerSuggestedUserModule observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateProfilePhoto
{
  monogramVC = self->_monogramVC;
  SEL v3 = -[TVPeoplePickerSuggestedUser profileImage](self->_suggestedUser, "profileImage");
  -[TVSMMonogramViewController setImage:](monogramVC, "setImage:");
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
  v4 = -[TVSMPeoplePickerSuggestedUserModule identifier](self, "identifier");
  v6[0] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v3, v4);

  v5 =  +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  v6[0],  TVSMAnalyticsElementTypeControl,  -[TVSMPeoplePickerSuggestedUserModule style](v7, "style"));
  objc_storeStrong(v6, 0LL);
  return v5;
}

- (void)contentModuleViewControllerDidTriggerAction:(id)a3
{
  objc_super v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v3 = -[TVSMPeoplePickerSuggestedUserModule suggestedUser](v10, "suggestedUser");
  id v8 = -[TVPeoplePickerSuggestedUser identifier](v3, "identifier");

  v7 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:root=SUGGESTED_USER&suggestedUserIdentifier=%@",  v8);
  v6 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7);
  id v4 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  [v4 openSensitiveURL:v6 withOptions:0];

  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  [WeakRetained moduleDidRequestSystemMenuDismissal:v10 animated:1 result:0];

  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)stringForNameComponents:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [(id)objc_opt_class(v7) _defaultShortNameFormatter];
  id v5 = [v4 stringFromPersonNameComponents:location[0]];

  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)_defaultShortNameFormatter
{
  id v4 = (dispatch_once_t *)&unk_12DB0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_C710);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_12DA8;
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

- (TVSMMonogramViewController)monogramVC
{
  return self->_monogramVC;
}

- (void)setMonogramVC:(id)a3
{
}

- (TVPeoplePickerSuggestedUser)suggestedUser
{
  return self->_suggestedUser;
}

- (void)setSuggestedUser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end