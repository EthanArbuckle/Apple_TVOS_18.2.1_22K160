@interface TVSSRestrictionsPlatterController
- (id)initWIthRestrictionsController:(id)a3;
- (void)_launchSettingsWithURLPath:(id)a3;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
@end

@implementation TVSSRestrictionsPlatterController

- (id)initWIthRestrictionsController:(id)a3
{
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v45 = 0;
  char v43 = 0;
  if ([location[0] restrictionsEnabled])
  {
    id v46 = TVSSLocString(@"TVSSRestrictionsEnabledDescription");
    char v45 = 1;
    id v3 = v46;
  }

  else
  {
    id v44 = TVSSLocString(@"TVSSRestrictionsDisabledHelpDescription");
    char v43 = 1;
    id v3 = v44;
  }

  id v47 = v3;
  if ((v43 & 1) != 0) {

  }
  if ((v45 & 1) != 0) {
  id v42 = +[TVSSConstants extraLargeGlyphFont](&OBJC_CLASS___TVSSConstants, "extraLargeGlyphFont");
  }
  id v41 =  +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v42);
  id v27 = TVSSLocString(@"TVSSRestrictionsTitle");
  v26 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v25 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");
  v50[0] = v25;
  v24 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");
  v50[1] = v24;
  v14 = objc_alloc(&OBJC_CLASS___TVSSInterstitialInfoRenderer);
  id v23 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"figure.child.and.lock.fill",  v41);
  v22 = +[TVSPContent contentWithTitle:image:text1:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:text1:", 0LL);
  v21 = -[TVSSInterstitialInfoRenderer initWithIdentifier:content:](v14, "initWithIdentifier:content:");
  v50[2] = v21;
  id v20 = TVSSLocString(@"TVSSRestrictionsSettingsButtonTitle");
  v19 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v18 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Restrictions-Help-Button");
  v50[3] = v18;
  id v17 = TVSSLocString(@"TVSSRestrictionsTurnOffRestrictionsButtonTitle");
  v16 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v15 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Turn-Off-Restrictions-Button",  15LL);
  v50[4] = v15;
  id v40 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 5LL);

  id v39 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v28 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Title");
  objc_msgSend(v39, "addObject:");

  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v29 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  objc_msgSend(v39, "addObject:");

  +[TVSPConstants separatorHeight](&OBJC_CLASS___TVSPConstants, "separatorHeight");
  v30 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"Separator");
  objc_msgSend(v39, "addObject:");

  v31 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Restrictions-Help-Glyph");
  objc_msgSend(v39, "addObject:");

  id v32 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 26.0);
  objc_msgSend(v39, "addObject:");

  if ([location[0] restrictionsEnabled])
  {
    +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
    v13 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"Turn-Off-Restrictions-Button");
    objc_msgSend(v39, "addObject:");
  }

  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v11 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"Restrictions-Help-Button");
  objc_msgSend(v39, "addObject:");

  id v38 =  +[TVSPLayout layoutWithRows:sizeProviders:]( &OBJC_CLASS___TVSPLayout,  "layoutWithRows:sizeProviders:",  v39,  v40);
  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(double *)&__int128 v36 = v4;
  *((double *)&v36 + 1) = v5;
  *(double *)&__int128 v37 = v6;
  *((double *)&v37 + 1) = v7;
  __int128 v34 = v36;
  __int128 v35 = v37;
  objc_msgSend(v38, "setContentInsets:", v4, v5, v6, v7);
  v8 = v49;
  v49 = 0LL;
  v33.receiver = v8;
  v33.super_class = (Class)&OBJC_CLASS___TVSSRestrictionsPlatterController;
  v12 = -[TVSSRestrictionsPlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v33,  "initWithIdentifier:layout:renderers:rendererProvider:",  @"Restrictions-Platter",  v38,  v40,  0LL);
  v49 = v12;
  objc_storeStrong((id *)&v49, v12);
  if (v12) {
    objc_storeStrong((id *)&v49->_restrictionsController, location[0]);
  }
  v10 = v49;
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v49, 0LL);
  return v10;
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
  v20.super_class = (Class)&OBJC_CLASS___TVSSRestrictionsPlatterController;
  -[TVSSRestrictionsPlatterController rendererWasSelected:context:]( &v20,  "rendererWasSelected:context:",  location[0],  v21);
  id v19 = [location[0] identifier];
  if ([v19 isEqualToString:@"Restrictions-Help-Button"])
  {
    -[TVSSRestrictionsPlatterController _launchSettingsWithURLPath:]( v23,  "_launchSettingsWithURLPath:",  @"prefs:root=Restrictions");
    [v21 dismissSystemMenuWithSourceIdentifier:v19];
  }

  else if ([v19 isEqualToString:@"Turn-Off-Restrictions-Button"])
  {
    double v7 = +[TVCSRestrictionsDataProvider sharedInstance](&OBJC_CLASS___TVCSRestrictionsDataProvider, "sharedInstance");
    unsigned __int8 v8 = -[TVCSRestrictionsDataProvider isLoadingContentRestrictions]( v7,  "isLoadingContentRestrictions");

    if ((v8 & 1) != 0)
    {
      double v6 =  +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance");
      -[TVCSRestrictionsDataProvider reloadIfNeeded](v6, "reloadIfNeeded");
    }

    objc_initWeak(&from, v23);
    double v5 = +[PBSRestrictionService sharedInstance](&OBJC_CLASS___PBSRestrictionService, "sharedInstance");
    v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    v13 = sub_1000AD474;
    v14 = &unk_1001B9B80;
    objc_copyWeak(&v17, &from);
    id v15 = v21;
    id v16 = v19;
    id v4 =  -[PBSRestrictionService validateRestrictionForSetting:allowInteraction:withCompletion:]( v5,  "validateRestrictionForSetting:allowInteraction:withCompletion:",  5LL,  1LL,  &v10);

    objc_storeStrong(&v16, 0LL);
    objc_storeStrong(&v15, 0LL);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_launchSettingsWithURLPath:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v10 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", location[0]);
  queue = dispatch_get_global_queue(0LL, 0LL);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  double v7 = sub_1000AD798;
  unsigned __int8 v8 = &unk_1001B5A60;
  v9 = v10;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end