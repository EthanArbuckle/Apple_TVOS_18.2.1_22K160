@interface TVSMExpanseNowPlayingModule
+ (id)availableStyles;
- (TVSMButtonViewController)buttonVC;
- (TVSMExpanseNowPlayingModule)init;
- (id)contentViewController;
- (void)dealloc;
- (void)expanseContextDidUpdate:(id)a3;
- (void)handleAction;
- (void)setButtonVC:(id)a3;
- (void)updateContextSpecificUI;
@end

@implementation TVSMExpanseNowPlayingModule

+ (id)availableStyles
{
  return &off_4320;
}

- (TVSMExpanseNowPlayingModule)init
{
  SEL v9 = a2;
  v10 = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSMExpanseNowPlayingModule;
  v7 = -[TVSMExpanseNowPlayingModule init](&v8, "init");
  v10 = v7;
  objc_storeStrong((id *)&v10, v7);
  if (v7)
  {
    id v6 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
    v4 = v10;
    v5 = &_dispatch_main_q;
    objc_msgSend(v6, "addObserver:queue:", v4);
  }

  v3 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v3;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  id v2 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  [v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSMExpanseNowPlayingModule;
  -[TVSMExpanseNowPlayingModule dealloc](&v3, "dealloc");
}

- (id)contentViewController
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSMExpanseNowPlayingModule;
  id v2 = (TVSMButtonViewController *)-[TVSMExpanseNowPlayingModule contentViewController](&v5, "contentViewController");
  buttonVC = v7->_buttonVC;
  v7->_buttonVC = v2;

  -[TVSMExpanseNowPlayingModule updateContextSpecificUI](v7, "updateContextSpecificUI");
  return v7->_buttonVC;
}

- (void)updateContextSpecificUI
{
  v15 = self;
  location[1] = (id)a2;
  id v12 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  id v13 = [v12 expanseMediaType];

  if ((unint64_t)v13 <= 5) {
    __asm { BR              X8 }
  }

  -[TVSMButtonViewController setImageSymbolName:](v15->_buttonVC, "setImageSymbolName:", @"shareplay");
  id v11 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  id v10 = [v11 currentActivitySession];
  id v9 = [v10 activity];
  location[0] = [v9 metadata];

  if (location[0])
  {
    buttonVC = v15->_buttonVC;
    id v6 = [location[0] title];
    -[TVSMButtonViewController setTitleText:](buttonVC, "setTitleText:");

    v7 = v15->_buttonVC;
    id v8 = [location[0] subTitle];
    -[TVSMButtonViewController setSecondaryText:](v7, "setSecondaryText:");
  }

  else
  {
    id v2 = v15->_buttonVC;
    SEL v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v15));
    objc_super v3 =  -[NSBundle localizedStringForKey:value:table:]( v4,  "localizedStringForKey:value:table:",  @"TVSMExpanseNothingShared",  &stru_4298,  @"Localizable-Expanse");
    -[TVSMButtonViewController setTitleText:](v2, "setTitleText:");

    -[TVSMButtonViewController setSecondaryText:](v15->_buttonVC, "setSecondaryText:", 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)handleAction
{
  id location[2] = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v2 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  objc_super v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_2D14;
  v7 = &unk_4158;
  objc_copyWeak(v8, location);
  [v2 launchCurrentActivitySessionWithCompletion:&v3];

  objc_destroyWeak(v8);
  objc_destroyWeak(location);
}

- (void)expanseContextDidUpdate:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMExpanseNowPlayingModule updateContextSpecificUI](v4, "updateContextSpecificUI");
  objc_storeStrong(location, 0LL);
}

- (TVSMButtonViewController)buttonVC
{
  return self->_buttonVC;
}

- (void)setButtonVC:(id)a3
{
}

- (void).cxx_destruct
{
}

@end