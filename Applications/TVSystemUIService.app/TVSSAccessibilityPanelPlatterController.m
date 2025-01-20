@interface TVSSAccessibilityPanelPlatterController
+ (id)emptyRows;
+ (id)menuOptionsRenderers;
+ (id)rowsWithMenuOptions:(unint64_t)a3;
- (TVSSAccessibilityPanelPlatterController)initWithIdentifier:(id)a3;
- (id)currentRows;
- (void)dealloc;
- (void)platterControllerDidActivate;
- (void)refresh;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
@end

@implementation TVSSAccessibilityPanelPlatterController

- (TVSSAccessibilityPanelPlatterController)initWithIdentifier:(id)a3
{
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v39 = +[TVSSConstants extraLargeGlyphFont](&OBJC_CLASS___TVSSConstants, "extraLargeGlyphFont");
  id v38 =  +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v39);
  id v28 = TVSSLocString(@"TVSSAccessibilityTitle");
  v27 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v26 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"title",  2LL);
  v42[0] = v26;
  v25 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"separator",  19LL,  0LL);
  v42[1] = v25;
  v16 = objc_alloc(&OBJC_CLASS___TVSSInterstitialInfoRenderer);
  id v24 =  +[UIImage _systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:withConfiguration:",  @"accessibility",  v38);
  id v23 = TVSSLocString(@"TVSSAccessibilityEmptyDescription");
  v22 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  0LL,  v24);
  v21 = -[TVSSInterstitialInfoRenderer initWithIdentifier:content:]( v16,  "initWithIdentifier:content:",  @"description");
  v42[2] = v21;
  id v20 = TVSSLocString(@"TVSSAccessibilitySettingsButton");
  v19 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:");
  v18 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"secondSettingsButton",  15LL);
  v42[3] = v18;
  v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 4LL);
  id v37 = +[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:");

  id v29 = [(id)objc_opt_class(v41) menuOptionsRenderers];
  objc_msgSend(v37, "addObjectsFromArray:");

  id v30 = -[TVSSAccessibilityPanelPlatterController currentRows](v41, "currentRows");
  id v36 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:");

  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(double *)&__int128 v34 = v3;
  *((double *)&v34 + 1) = v4;
  *(double *)&__int128 v35 = v5;
  *((double *)&v35 + 1) = v6;
  __int128 v32 = v34;
  __int128 v33 = v35;
  objc_msgSend(v36, "setContentInsets:", v3, v4, v5, v6);
  v7 = v41;
  v41 = 0LL;
  v31.receiver = v7;
  v31.super_class = (Class)&OBJC_CLASS___TVSSAccessibilityPanelPlatterController;
  v41 = -[TVSSAccessibilityPanelPlatterController initWithIdentifier:layout:renderers:]( &v31,  "initWithIdentifier:layout:renderers:",  location[0],  v36,  v37);
  objc_storeStrong((id *)&v41, v41);
  if (v41)
  {
    v12 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v12,  "addObserver:selector:name:object:",  v41,  "refresh",  kAXSVoiceOverTouchEnabledNotification);

    v13 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v13,  "addObserver:selector:name:object:",  v41,  "refresh",  kAXSZoomTouchEnabledNotification,  0LL);

    v14 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v14,  "addObserver:selector:name:object:",  v41,  "refresh",  kAXSHoverTextEnabledNotification,  0LL);

    v15 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v15,  "addObserver:selector:name:object:",  v41,  "refresh",  kAXSAssistiveTouchScannerEnabledNotification,  0LL);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v41,  (CFNotificationCallback)sub_1000570D4,  kMADisplayFilterSettingsChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v9,  v41,  (CFNotificationCallback)sub_1000570D4,  @"com.apple.mediaaccessibility.audibleMediaSettingsChanged",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  v11 = v41;
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v41, 0LL);
  return v11;
}

- (void)dealloc
{
  v7 = self;
  SEL v6 = a2;
  double v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v4, "removeObserver:", v7);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v7, kMADisplayFilterSettingsChangedNotification, 0LL);
  double v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v3, v7, @"com.apple.mediaaccessibility.audibleMediaSettingsChanged", 0LL);
  v5.receiver = v7;
  v5.super_class = (Class)&OBJC_CLASS___TVSSAccessibilityPanelPlatterController;
  -[TVSSAccessibilityPanelPlatterController dealloc](&v5, "dealloc");
}

- (void)platterControllerDidActivate
{
}

- (void)refresh
{
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = -[TVSSAccessibilityPanelPlatterController currentRows](self, "currentRows");
  id v6 = v14[0];
  id v7 = -[TVSSAccessibilityPanelPlatterController renderers](v15, "renderers");
  v13 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v6);

  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(double *)&__int128 v11 = v2;
  *((double *)&v11 + 1) = v3;
  *(double *)&__int128 v12 = v4;
  *((double *)&v12 + 1) = v5;
  __int128 v9 = v11;
  __int128 v10 = v12;
  -[TVSPLayout setContentInsets:](v13, "setContentInsets:", v2, v3, v4, v5);
  id v8 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  -[TVSSAccessibilityPanelPlatterController applyLayout:animator:](v15, "applyLayout:animator:", v13, v8);
  -[TVSSAccessibilityPanelPlatterController reloadContent](v15, "reloadContent");
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(v14, 0LL);
}

- (id)currentRows
{
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"title");
  objc_msgSend(v13[0], "addObject:");

  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v9 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  objc_msgSend(v13[0], "addObject:");

  id v10 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"separator");
  objc_msgSend(v13[0], "addObject:");

  __int128 v11 = +[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance");
  id v12 = -[PBSAccessibilitySettings accessibilityMenuOptions](v11, "accessibilityMenuOptions");

  if (v12)
  {
    +[TVSPConstants topSpacerHeight](&OBJC_CLASS___TVSPConstants, "topSpacerHeight");
    id v6 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    objc_msgSend(v13[0], "addObject:");

    id v7 = [(id)objc_opt_class(v14) rowsWithMenuOptions:v12];
    objc_msgSend(v13[0], "addObjectsFromArray:");
  }

  else
  {
    id v5 = [(id)objc_opt_class(v14) emptyRows];
    objc_msgSend(v13[0], "addObjectsFromArray:");
  }

  id v4 = objc_msgSend(v13[0], "copy", v13);
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)emptyRows
{
  id v7 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v8[0] = v7;
  id v6 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"description");
  v8[1] = v6;
  id v5 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 26.0);
  v8[2] = v5;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  double v3 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"secondSettingsButton");
  v8[3] = v3;
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL);

  return v4;
}

+ (id)menuOptionsRenderers
{
  v19[2] = a1;
  v19[1] = (id)a2;
  v19[0] = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = +[TVSSAccessibilityItem allAXItems](&OBJC_CLASS___TVSSAccessibilityItem, "allAXItems");
  id v16 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
  if (v16)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0LL;
    id v14 = v16;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(__b[1] + 8 * v13);
      id v9 = v19[0];
      id v10 =  +[TVSPRenderer rendererWithAccessibilityItem:format:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithAccessibilityItem:format:",  v18,  10LL);
      objc_msgSend(v9, "addObject:");

      ++v13;
      if (v11 + 1 >= (unint64_t)v14)
      {
        uint64_t v13 = 0LL;
        id v14 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  id v3 = v19[0];
  id v7 = TVSSLocString(@"TVSSAccessibilityGoToSettingsButton");
  id v6 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"gear");
  id v5 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v7);
  id v4 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"settingsButton",  18LL);
  objc_msgSend(v3, "addObject:");

  id v8 = v19[0];
  objc_storeStrong(v19, 0LL);
  return v8;
}

+ (id)rowsWithMenuOptions:(unint64_t)a3
{
  id v19[3] = a1;
  v19[2] = (id)a2;
  v19[1] = (id)a3;
  v19[0] =  +[TVSSAccessibilityItem visibleIdentifiersFromOptions:]( &OBJC_CLASS___TVSSAccessibilityItem,  "visibleIdentifiersFromOptions:",  a3);
  uint64_t v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = v19[0];
  id v15 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0LL;
    id v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(__b[1] + 8 * v12);
      id v8 = v18;
      uint64_t v7 = v17;
      +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
      id v9 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", v7);
      -[NSMutableArray addObject:](v8, "addObject:");

      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0LL;
        id v13 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  id v4 = v18;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  id v5 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"settingsButton");
  -[NSMutableArray addObject:](v4, "addObject:");

  id v6 = v18;
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(v19, 0LL);
  return v6;
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  v20.receiver = v23;
  v20.super_class = (Class)&OBJC_CLASS___TVSSAccessibilityPanelPlatterController;
  -[TVSSAccessibilityPanelPlatterController rendererWasSelected:context:]( &v20,  "rendererWasSelected:context:",  location[0],  v21);
  id v9 = [location[0] identifier];
  char v18 = 0;
  unsigned __int8 v10 = 1;
  if (([v9 isEqualToString:@"secondSettingsButton"] & 1) == 0)
  {
    id v19 = [location[0] identifier];
    char v18 = 1;
    unsigned __int8 v10 = [v19 isEqualToString:@"settingsButton"];
  }

  if ((v18 & 1) != 0) {

  }
  if ((v10 & 1) != 0)
  {
    uint64_t v17 =  +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"prefs:root=ACCESSIBILITY&path=TRIPLE_CLICK_TITLE");
    queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = sub_100057F9C;
    id v15 = &unk_1001B5A60;
    id v16 = v17;
    dispatch_async(queue, &v11);

    id v6 = v21;
    id v7 = [location[0] identifier];
    objc_msgSend(v6, "dismissSystemMenuWithSourceIdentifier:");

    objc_storeStrong((id *)&v16, 0LL);
    objc_storeStrong((id *)&v17, 0LL);
  }

  else
  {
    id v4 = [location[0] identifier];
    +[TVSSAccessibilityItem setSelectionForItemWithIdentifier:]( &OBJC_CLASS___TVSSAccessibilityItem,  "setSelectionForItemWithIdentifier:");

    -[TVSSAccessibilityPanelPlatterController refresh](v23, "refresh");
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

@end