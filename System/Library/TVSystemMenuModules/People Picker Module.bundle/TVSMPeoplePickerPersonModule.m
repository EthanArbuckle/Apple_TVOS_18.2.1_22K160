@interface TVSMPeoplePickerPersonModule
+ (id)availableStyles;
- (BOOL)dismissAfterAction;
- (BOOL)selected;
- (NSString)accessibilityIdentifierSuffix;
- (NSString)analyticsActionType;
- (NSString)analyticsIdentifier;
- (NSString)identifier;
- (TVPeoplePickerUser)user;
- (TVSMAnalyticsElementInfo)analyticsElementInfo;
- (TVSMModuleContentViewController)contentViewController;
- (TVSMModuleDelegate)delegate;
- (TVSMPeoplePickerPersonModule)initWithUser:(id)a3;
- (id)actionHandler;
- (int64_t)style;
- (int64_t)type;
- (void)_updateContentViewControllerForUser:(id)a3;
- (void)contentModuleViewControllerDidTriggerAction:(id)a3;
- (void)handleAction;
- (void)setActionHandler:(id)a3;
- (void)setAnalyticsIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation TVSMPeoplePickerPersonModule

+ (id)availableStyles
{
  return &off_CFA8;
}

- (TVSMPeoplePickerPersonModule)initWithUser:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0LL;
  v12.receiver = v3;
  v12.super_class = (Class)&OBJC_CLASS___TVSMPeoplePickerPersonModule;
  v11 = -[TVSMPeoplePickerPersonModule init](&v12, "init");
  v14 = v11;
  objc_storeStrong((id *)&v14, v11);
  if (v11)
  {
    id v10 = [(id)objc_opt_class(v14) availableStyles];
    id v9 = [v10 firstObject];
    id v4 = [v9 integerValue];
    v14->_style = (int64_t)v4;

    objc_storeStrong((id *)&v14->_user, location[0]);
    v5 = (NSString *)[location[0] identifier];
    identifier = v14->_identifier;
    v14->_identifier = v5;

    v14->_type = 1LL;
  }

  v8 = v14;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  return v8;
}

- (BOOL)dismissAfterAction
{
  return 1;
}

- (void)handleAction
{
  if (self->_actionHandler) {
    (*((void (**)(id))self->_actionHandler + 2))(self->_actionHandler);
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[TVSMPeoplePickerPersonModule _updateContentViewControllerForUser:]( self,  "_updateContentViewControllerForUser:",  self->_user);
  }

- (NSString)accessibilityIdentifierSuffix
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PeoplePicker.User.%@",  self->_identifier);
}

- (TVSMModuleContentViewController)contentViewController
{
  v13 = self;
  v12[1] = (id)a2;
  if (!self->_contentViewController)
  {
    v12[0] = objc_alloc_init(&OBJC_CLASS___TVSMMonogramViewController);
    objc_storeStrong((id *)&v13->_contentViewController, v12[0]);
    -[TVSMModuleContentViewController setDelegate:](v13->_contentViewController, "setDelegate:", v13);
    -[TVSMPeoplePickerPersonModule _updateContentViewControllerForUser:]( v13,  "_updateContentViewControllerForUser:",  v13->_user);
    v5 =  +[NSObservableKeyPath keyPathWithRootObject:path:]( &OBJC_CLASS___NSObservableKeyPath,  "keyPathWithRootObject:path:",  v13->_user,  "profilePhoto");
    v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_50C4;
    id v10 = &unk_C240;
    id v11 = v12[0];
    v2 = (NSObservation *)-[NSObservableKeyPath addObserverBlock:](v5, "addObserverBlock:", &v6);
    profilePhotoObserver = v13->_profilePhotoObserver;
    v13->_profilePhotoObserver = v2;

    objc_storeStrong(&v11, 0LL);
    objc_storeStrong(v12, 0LL);
  }

  return v13->_contentViewController;
}

- (NSString)analyticsActionType
{
  return (NSString *)TVSMClickAnalyticsActionTypeSelect;
}

- (TVSMAnalyticsElementInfo)analyticsElementInfo
{
  v5 = -[TVSMPeoplePickerPersonModule analyticsIdentifier](self, "analyticsIdentifier");
  int64_t v6 = -[TVSMPeoplePickerPersonModule style](self, "style");
  if (-[TVSMPeoplePickerPersonModule selected](self, "selected")) {
    uint64_t v4 = TVSMAnalyticsElementStateActive;
  }
  else {
    uint64_t v4 = TVSMAnalyticsElementStateInactive;
  }
  v3 =  +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  v5,  @"user",  v6,  v4);

  return v3;
}

- (void)contentModuleViewControllerDidTriggerAction:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMPeoplePickerPersonModule handleAction](v5, "handleAction");
  id v3 = -[TVSMPeoplePickerPersonModule delegate](v5, "delegate");
  [v3 moduleDidPerformAction:v5];
  if (-[TVSMPeoplePickerPersonModule dismissAfterAction](v5, "dismissAfterAction")) {
    [v3 moduleDidRequestSystemMenuDismissal:v5 animated:1 result:0];
  }
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateContentViewControllerForUser:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  contentViewController = v10->_contentViewController;
  id v4 = [location[0] personNameComponents];
  -[TVSMModuleContentViewController setNameComponents:](contentViewController, "setNameComponents:");

  v5 = v10->_contentViewController;
  id v6 = [location[0] formattedShortName];
  -[TVSMModuleContentViewController setTitleText:](v5, "setTitleText:");

  int v7 = v10->_contentViewController;
  id v8 = [location[0] profilePhoto];
  -[TVSMModuleContentViewController setImage:](v7, "setImage:");

  -[TVSMModuleContentViewController setBadgeStyle:](v10->_contentViewController, "setBadgeStyle:", v10->_selected);
  objc_storeStrong(location, 0LL);
}

- (TVSMModuleDelegate)delegate
{
  return (TVSMModuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TVPeoplePickerUser)user
{
  return self->_user;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

@end