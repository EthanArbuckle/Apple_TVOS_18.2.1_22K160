@interface TVSSAnalyticsManager
- (TVSSAnalyticsManager)initWithDataSourceControllerOverlord:(id)a3;
- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord;
- (TVSSMenuModeController)menuModeController;
- (id)_analyticsForegroundAppFromBundleID:(id)a3;
- (id)_availablePanelsFromCurrentMenuItems;
- (id)_baseAnalyticsDictionaryFromCurrentState;
- (id)_currentViewMode;
- (void)controlCenterActionSelected:(id)a3;
- (void)dealloc;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)reportControlCenterActionWithIdentifier:(id)a3;
- (void)reportControlCenterOpened;
- (void)setDataSourceControllerOverlord:(id)a3;
- (void)setMenuModeController:(id)a3;
@end

@implementation TVSSAnalyticsManager

- (TVSSAnalyticsManager)initWithDataSourceControllerOverlord:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSAnalyticsManager;
  v10 = -[TVSSAnalyticsManager init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dataSourceControllerOverlord, location[0]);
    v4 = (TVSSMenuModeController *)[location[0] menuModeController];
    menuModeController = v10->_menuModeController;
    v10->_menuModeController = v4;

    -[TVSSMenuModeController addControllerObserver:](v10->_menuModeController, "addControllerObserver:", v10);
  }

  v7 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSMenuModeController removeControllerObserver:](self->_menuModeController, "removeControllerObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSAnalyticsManager;
  -[TVSSAnalyticsManager dealloc](&v2, "dealloc");
}

- (void)controlCenterActionSelected:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSAnalyticsManager reportControlCenterActionWithIdentifier:]( v4,  "reportControlCenterActionWithIdentifier:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)reportControlCenterOpened
{
  v9[2] = self;
  v9[1] = (id)a2;
  id v2 =  -[TVSSAnalyticsManager _baseAnalyticsDictionaryFromCurrentState]( self,  "_baseAnalyticsDictionaryFromCurrentState");
  v9[0] = [v2 copy];

  SEL v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_10012BB68;
  v7 = &unk_1001BBBB8;
  id v8 = v9[0];
  AnalyticsSendEventLazy(@"com.apple.appletv.controlcenter.presented");
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(v9, 0LL);
}

- (void)reportControlCenterActionWithIdentifier:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 =  -[TVSSAnalyticsManager _baseAnalyticsDictionaryFromCurrentState]( v12,  "_baseAnalyticsDictionaryFromCurrentState");
  [v10 setObject:location[0] forKeyedSubscript:@"action"];
  id v9 = [v10 copy];
  SEL v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_10012BCA8;
  v7 = &unk_1001BBBB8;
  id v8 = v9;
  AnalyticsSendEventLazy(@"com.apple.appletv.controlcenter.action");
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id v5 = [v6 interactivePresentationReason];
  if ([location[0] mode] == (id)3 && v5) {
    -[TVSSAnalyticsManager reportControlCenterOpened](v8, "reportControlCenterOpened");
  }
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_baseAnalyticsDictionaryFromCurrentState
{
  v17 = self;
  v16[1] = (id)a2;
  int v4 = -[TVSSAnalyticsManager menuModeController](self, "menuModeController");
  SEL v3 = -[TVSSMenuModeController provider](v4, "provider");
  v16[0] = -[TVSSMenuModeStateProvider state](v3, "state");

  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = -[TVSSAnalyticsManager _availablePanelsFromCurrentMenuItems](v17, "_availablePanelsFromCurrentMenuItems");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:");

  id v6 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v16[0] isFaceTimeActive] & 1);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:");

  v7 = v17;
  id v10 = [v16[0] focusedApp];
  id v9 = [v10 bundleIdentifier];
  id v8 = -[TVSSAnalyticsManager _analyticsForegroundAppFromBundleID:](v7, "_analyticsForegroundAppFromBundleID:");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:");

  id v12 = [v16[0] interactionRequestReason];
  id v11 = (id)PBSystemUIServicePresentMenuReasonName([v12 unsignedIntegerValue]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:");

  id v13 = -[TVSSAnalyticsManager _currentViewMode](v17, "_currentViewMode");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:");

  v14 = v15;
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(v16, 0LL);
  return v14;
}

- (id)_availablePanelsFromCurrentMenuItems
{
  v18 = self;
  v17[1] = (id)a2;
  v17[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v16 =  -[TVSSMenuDataSourceControllerOverlord controllerForMode:]( v18->_dataSourceControllerOverlord,  "controllerForMode:",  3LL);
  id v10 = [v16 dataSource];
  id location = [v10 items];

  memset(__b, 0, sizeof(__b));
  id obj = location;
  id v12 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v12)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v12;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v8);
      id v4 = v17[0];
      id v5 = [v14 identifier];
      objc_msgSend(v4, "addObject:");

      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v3 = [v17[0] copy];
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(v17, 0LL);
  return v3;
}

- (id)_analyticsForegroundAppFromBundleID:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = &off_1001C87F8;
  else {
    uint64_t v6 = @"Other";
  }
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (id)_currentViewMode
{
  id location[2] = self;
  location[1] = (id)a2;
  id v4 = -[TVSSAnalyticsManager menuModeController](self, "menuModeController");
  id v3 = -[TVSSMenuModeController provider](v4, "provider");
  location[0] = -[TVSSMenuModeStateProvider state](v3, "state");

  if ([location[0] isSplitViewVisible])
  {
    uint64_t v6 = @"Split Screen";
  }

  else if ([location[0] isPipActive])
  {
    uint64_t v6 = @"PIP";
  }

  else
  {
    uint64_t v6 = @"Full Screen";
  }

  objc_storeStrong(location, 0LL);
  return v6;
}

- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord
{
  return self->_dataSourceControllerOverlord;
}

- (void)setDataSourceControllerOverlord:(id)a3
{
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (void)setMenuModeController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end