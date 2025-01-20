@interface TVSSVPNPanelPlatterController
- (NSDictionary)vpnConfigurationsByIdentifier;
- (PBSSuppressVPNBulletinAssertion)suppressBulletinAssertion;
- (TVSPLayout)currentLayout;
- (TVSSVPNController)vpnController;
- (TVSSVPNPanelPlatterController)initWithIdentifier:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)setCurrentLayout:(id)a3;
- (void)setVpnConfigurationsByIdentifier:(id)a3;
- (void)vpnController:(id)a3 didUpdateConfigurations:(id)a4;
@end

@implementation TVSSVPNPanelPlatterController

- (TVSSVPNPanelPlatterController)initWithIdentifier:(id)a3
{
  id v53 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v33 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"VPN");
  v57[0] = v33;
  id v32 = +[TVSPRow spacer](&OBJC_CLASS___TVSPRow, "spacer");
  v57[1] = v32;
  v31 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Configurations");
  v57[2] = v31;
  +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
  id v30 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", v3);
  v57[3] = v30;
  id v51 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 4LL);

  id v50 = +[TVSPLayout layoutWithRows:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:", v51);
  v29 =  +[TVSPContent contentWithTitle:image:text1:isSelected:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:isSelected:",  @"VPN",  0LL,  @"Loading",  0LL);
  v28 =  +[TVSSVPNStatusRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSVPNStatusRenderer,  "rendererWithIdentifier:format:content:",  @"VPN",  18LL);
  v56[0] = v28;
  id v27 = TVSSLocString(@"TVSSVPNConfigurationsTitle");
  v26 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v25 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Configurations",  3LL);
  v56[1] = v25;
  id v49 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 2LL);

  id v4 = v53;
  id v53 = 0LL;
  v48.receiver = v4;
  v48.super_class = (Class)&OBJC_CLASS___TVSSVPNPanelPlatterController;
  id v53 = -[TVSSVPNPanelPlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v48,  "initWithIdentifier:layout:renderers:rendererProvider:",  @"VPNPlatter",  v50,  v49,  0LL);
  objc_storeStrong(&v53, v53);
  if (v53)
  {
    objc_initWeak(&from, v53);
    id v24 = v53;
    v41 = _NSConcreteStackBlock;
    int v42 = -1073741824;
    int v43 = 0;
    v44 = sub_100064DD8;
    v45 = &unk_1001B6940;
    objc_copyWeak(&v46, &from);
    [v24 setRendererProvider:&v41];
    v23 = objc_alloc(&OBJC_CLASS___PBSSuppressVPNBulletinAssertion);
    aClass = (objc_class *)objc_opt_class(v53);
    v20 = NSStringFromClass(aClass);
    v21 = -[PBSSuppressVPNBulletinAssertion initWithIdentifier:](v23, "initWithIdentifier:");
    v5 = (void *)*((void *)v53 + 4);
    *((void *)v53 + 4) = v21;

    [*((id *)v53 + 4) acquire];
    v19 = objc_alloc_init(&OBJC_CLASS___TVSSVPNController);
    v6 = (void *)*((void *)v53 + 1);
    *((void *)v53 + 1) = v19;

    [*((id *)v53 + 1) addObserver:v53];
    [*((id *)v53 + 1) addObserver:v53 forKeyPath:@"activeConfiguration.connectionStatus" options:1 context:off_10021F798];
    id v18 = [*((id *)v53 + 1) activeConfiguration];
    BOOL v17 = [v18 connectionStatus] != (id)5;

    if (!v17)
    {
      v7 = (void *)*((void *)v53 + 1);
      char v38 = 0;
      char v36 = 0;
      if ([v7 includesRelays])
      {
        id v39 = TVSSLocString(@"TVSSVPNAndRelaysTitle");
        char v38 = 1;
        id v8 = v39;
      }

      else
      {
        id v37 = TVSSLocString(@"TVSSVPNTitle");
        char v36 = 1;
        id v8 = v37;
      }

      id v40 = v8;
      if ((v36 & 1) != 0) {

      }
      if ((v38 & 1) != 0) {
      id v15 = [*((id *)v53 + 1) activeConfiguration];
      }
      id v16 = [v15 connectionStatus];

      id v35 = v16;
      id v34 =  +[TVSSVPNConfiguration localizedConnectionStatus:]( &OBJC_CLASS___TVSSVPNConfiguration,  "localizedConnectionStatus:",  v16);
      id v13 = v53;
      v54 = @"VPN";
      BOOL v14 = 1;
      if (v16 != (id)3) {
        BOOL v14 = v35 == (id)5;
      }
      v12 =  +[TVSPContent contentWithTitle:image:text1:isSelected:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:isSelected:",  v40,  0LL,  v34,  v14);
      v55 = v12;
      v11 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL);
      objc_msgSend(v13, "applyContent:");

      objc_storeStrong(&v34, 0LL);
      objc_storeStrong(&v40, 0LL);
    }

    objc_destroyWeak(&v46);
    objc_destroyWeak(&from);
  }

  v10 = (TVSSVPNPanelPlatterController *)v53;
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(&v51, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v53, 0LL);
  return v10;
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  -[TVSSVPNController removeObserver:](self->_vpnController, "removeObserver:", self);
  -[TVSSVPNController removeObserver:forKeyPath:context:]( v4->_vpnController,  "removeObserver:forKeyPath:context:",  v4,  @"activeConfiguration.connectionStatus",  off_10021F798);
  -[PBSSuppressVPNBulletinAssertion relinquish](v4->_suppressBulletinAssertion, "relinquish");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSVPNPanelPlatterController;
  -[TVSSVPNPanelPlatterController dealloc](&v2, "dealloc");
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  BOOL v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  v11.receiver = v14;
  v11.super_class = (Class)&OBJC_CLASS___TVSSVPNPanelPlatterController;
  -[TVSSVPNPanelPlatterController rendererWasSelected:context:](&v11, "rendererWasSelected:context:", location[0], v12);
  id v10 = [location[0] identifier];
  v7 = -[TVSSVPNPanelPlatterController vpnConfigurationsByIdentifier](v14, "vpnConfigurationsByIdentifier");
  id v9 = -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v10);

  if (v9)
  {
    v5 = -[TVSSVPNPanelPlatterController vpnController](v14, "vpnController");
    -[TVSSVPNController setActiveConfiguration:](v5, "setActiveConfiguration:", v9);
  }

  else if ([v10 isEqualToString:@"VPN"])
  {
    id v4 = -[TVSSVPNPanelPlatterController vpnController](v14, "vpnController");
    id v8 = -[TVSSVPNController activeConfiguration](v4, "activeConfiguration");

    if ([v8 connectionStatus] == (id)3) {
      [v8 disconnect];
    }
    else {
      [v8 connect];
    }
    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)vpnController:(id)a3 didUpdateConfigurations:(id)a4
{
  id v49 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v47 = 0LL;
  objc_storeStrong(&v47, a4);
  id v46 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v29 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"VPN");
  objc_msgSend(v45, "addObject:");

  id v30 = +[TVSPRow spacer](&OBJC_CLASS___TVSPRow, "spacer");
  objc_msgSend(v45, "addObject:");

  v31 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Configurations");
  objc_msgSend(v45, "addObject:");

  +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
  id v32 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  objc_msgSend(v45, "addObject:");

  memset(__b, 0, sizeof(__b));
  id v33 = v47;
  id v34 = [v33 countByEnumeratingWithState:__b objects:v52 count:16];
  if (v34)
  {
    uint64_t v25 = *(void *)__b[2];
    uint64_t v26 = 0LL;
    id v27 = v34;
    while (1)
    {
      uint64_t v24 = v26;
      if (*(void *)__b[2] != v25) {
        objc_enumerationMutation(v33);
      }
      id v44 = *(id *)(__b[1] + 8 * v26);
      id v16 = v45;
      id v19 = [v44 identifier];
      id v18 = [v19 UUIDString];
      +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
      BOOL v17 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", v18);
      objc_msgSend(v16, "addObject:");

      id v20 = v44;
      id v21 = v46;
      id v23 = [v44 identifier];
      id v22 = [v23 UUIDString];
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v20);

      ++v26;
      if (v24 + 1 >= (unint64_t)v27)
      {
        uint64_t v26 = 0LL;
        id v27 = [v33 countByEnumeratingWithState:__b objects:v52 count:16];
        if (!v27) {
          break;
        }
      }
    }
  }

  -[TVSSVPNPanelPlatterController setVpnConfigurationsByIdentifier:](v49, "setVpnConfigurationsByIdentifier:", v46);
  id v14 = v45;
  id v15 = -[TVSSVPNPanelPlatterController renderers](v49, "renderers");
  id v42 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v14);

  id v41 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  -[TVSSVPNPanelPlatterController reloadContent](v49, "reloadContent");
  -[TVSSVPNPanelPlatterController applyLayout:animator:](v49, "applyLayout:animator:", v42, v41);
  -[TVSSVPNPanelPlatterController _updatePlatterSizeWithAnimator:](v49, "_updatePlatterSizeWithAnimator:", v41);
  char v38 = 0;
  char v36 = 0;
  if ((unint64_t)[v47 count] <= 1)
  {
    id v37 = TVSSLocString(@"TVSSVPNConfigurationTitle");
    char v36 = 1;
    id v4 = v37;
  }

  else
  {
    id v39 = TVSSLocString(@"TVSSVPNConfigurationsTitle");
    char v38 = 1;
    id v4 = v39;
  }

  id v40 = v4;
  if ((v36 & 1) != 0) {

  }
  if ((v38 & 1) != 0) {
  v7 = v49;
  }
  id v50 = @"Configurations";
  id v9 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:", v40, &v50);
  id v51 = v9;
  id v8 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  v6,  1LL);
  -[TVSSVPNPanelPlatterController applyContent:](v7, "applyContent:");

  id v10 = v49;
  id v13 = [v47 firstObject];
  id v12 = [v13 identifier];
  id v11 = [v12 UUIDString];
  id v35 = -[TVSSVPNPanelPlatterController rendererForIdentifier:](v10, "rendererForIdentifier:");

  BOOL v5 = [v47 count] == (id)1;
  [v35 setDimCheckmark:v5];
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  id v18 = a6;
  if (a6 == off_10021F798)
  {
    queue = &_dispatch_main_q;
    id v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = sub_100065A94;
    id v15 = &unk_1001B61C0;
    id v16 = v19;
    BOOL v17 = v22;
    dispatch_async(queue, &v11);

    objc_storeStrong((id *)&v17, 0LL);
    objc_storeStrong(&v16, 0LL);
  }

  else
  {
    v10.receiver = v22;
    v10.super_class = (Class)&OBJC_CLASS___TVSSVPNPanelPlatterController;
    -[TVSSVPNPanelPlatterController observeValueForKeyPath:ofObject:change:context:]( &v10,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v20,  v19,  v18);
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSVPNController)vpnController
{
  return self->_vpnController;
}

- (NSDictionary)vpnConfigurationsByIdentifier
{
  return self->_vpnConfigurationsByIdentifier;
}

- (void)setVpnConfigurationsByIdentifier:(id)a3
{
}

- (TVSPLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
}

- (PBSSuppressVPNBulletinAssertion)suppressBulletinAssertion
{
  return self->_suppressBulletinAssertion;
}

- (void).cxx_destruct
{
}

@end