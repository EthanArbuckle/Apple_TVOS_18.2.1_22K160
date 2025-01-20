@interface TVSMHomeSceneButtonViewController
- (HFItem)homeItem;
- (TVSMHomeSceneButtonViewController)initWithHFItem:(id)a3;
- (id)_iconTintColorForIconIdentifier:(id)a3;
- (void)_toggleActionSet;
- (void)toggleActionSetWithAppleRemote:(BOOL)a3;
- (void)updateContentViewController;
@end

@implementation TVSMHomeSceneButtonViewController

- (TVSMHomeSceneButtonViewController)initWithHFItem:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0LL;
  v7.receiver = v3;
  v7.super_class = (Class)&OBJC_CLASS___TVSMHomeSceneButtonViewController;
  v6 = -[TVSMHomeSceneButtonViewController init](&v7, "init");
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    objc_storeStrong((id *)&v9->_homeItem, location[0]);
    -[TVSMHomeSceneButtonViewController updateContentViewController](v9, "updateContentViewController");
  }

  v5 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v5;
}

- (void)updateContentViewController
{
  v29 = self;
  v28[1] = (id)a2;
  v16 = -[TVSMHomeSceneButtonViewController homeItem](self, "homeItem");
  unsigned __int8 v17 = -[HFItem isActionSet](v16, "isActionSet");

  if ((v17 & 1) != 0)
  {
    -[TVSMHomeSceneButtonViewController setStyle:](v29, "setStyle:", 5LL);
    v12 = -[TVSMHomeSceneButtonViewController homeItem](v29, "homeItem");
    v28[0] = -[HFItem latestResults](v12, "latestResults");

    id v13 = [v28[0] objectForKeyedSubscript:HFResultPrimaryStateKey];
    BOOL v14 = [v13 integerValue] == (char *)&dword_0 + 2;

    BOOL v27 = v14;
    id v15 = [v28[0] objectForKeyedSubscript:HFResultDisplayTitleKey];
    char v24 = 0;
    if (v15)
    {
      id v2 = v15;
    }

    else
    {
      id v25 = [v28[0] objectForKeyedSubscript:HFResultDisplayTitlePlaceholderKey];
      char v24 = 1;
      id v2 = v25;
    }

    id v26 = v2;
    if ((v24 & 1) != 0) {

    }
    id v23 = [v28[0] objectForKeyedSubscript:HFResultDisplayIconDescriptorKey];
    id v22 = [v23 identifier];
    if (v22) {
      id v3 = v22;
    }
    else {
      id v3 = HFImageIconIdentifierGeneric;
    }
    id v21 = v3;
    id location = 0LL;
    if (v27)
    {
      v8 = -[TVSMHomeSceneButtonViewController homeItem](v29, "homeItem");
      v9 = -[HFItem actionSetItem](v8, "actionSetItem");
      id v10 = -[HFActionSetItem actionSet](v9, "actionSet");
      id v11 = objc_msgSend(v10, "hf_iconTintColor");
      char v18 = 0;
      if (v11)
      {
        objc_storeStrong(&location, v11);
      }

      else
      {
        id v19 =  -[TVSMHomeSceneButtonViewController _iconTintColorForIconIdentifier:]( v29,  "_iconTintColorForIconIdentifier:",  v21);
        char v18 = 1;
        objc_storeStrong(&location, v19);
      }

      if ((v18 & 1) != 0) {
    }
      }

    else
    {
      v4 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.556862745,  0.556862745,  0.576470588,  1.0);
      id v5 = location;
      id location = v4;
    }

    -[TVSMHomeSceneButtonViewController setTitleText:](v29, "setTitleText:", v26);
    -[TVSMHomeSceneButtonViewController setSymbolStyle:](v29, "setSymbolStyle:", 3LL);
    -[TVSMHomeSceneButtonViewController setImageSymbolName:](v29, "setImageSymbolName:", v21);
    -[TVSMHomeSceneButtonViewController setActive:](v29, "setActive:", v27);
    -[TVSMHomeSceneButtonViewController setSymbolTintColor:](v29, "setSymbolTintColor:", location);
    v6 = v29;
    objc_super v7 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.996078431,  0.231372549,  0.188235294,  1.0);
    -[TVSMHomeSceneButtonViewController setSubtitleTintColor:](v6, "setSubtitleTintColor:");

    objc_storeStrong(&location, 0LL);
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong(&v22, 0LL);
    objc_storeStrong(&v23, 0LL);
    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(v28, 0LL);
  }

- (void)toggleActionSetWithAppleRemote:(BOOL)a3
{
  v63 = self;
  SEL v62 = a2;
  BOOL v61 = a3;
  v38 = -[TVSMHomeSceneButtonViewController homeItem](self, "homeItem");
  v37 = -[HFItem actionSetItem](v38, "actionSetItem");
  id v36 = -[HFActionSetItem actionSet](v37, "actionSet");
  unsigned __int8 v39 = [v36 requiresDeviceUnlock];

  if ((v39 & 1) != 0)
  {
    id v34 =  +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults");
    v35 = (char *)objc_msgSend(v34, "pbs_secureHomeKitAccessoryAllowedRemotes");

    v60 = v35;
    BOOL v59 = 0;
    if (v35 == (_BYTE *)&dword_0 + 1) {
      BOOL v59 = v61;
    }
    else {
      BOOL v59 = v60 == (_BYTE *)&dword_0 + 2;
    }
    id location = (id)home_module_log();
    os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      if (v59) {
        id v3 = "yes";
      }
      else {
        id v3 = "no";
      }
      if (v61) {
        v4 = "yes";
      }
      else {
        v4 = "no";
      }
      sub_2988((uint64_t)v64, (uint64_t)v3, (uint64_t)v60, (uint64_t)v4);
      _os_log_impl( &dword_0,  (os_log_t)location,  v57,  "Allowing secure accessory control %s with allowed remotes pref %ld isAppleRemoteEvent %s",  v64,  0x20u);
    }

    objc_storeStrong(&location, 0LL);
    id v56 = 0LL;
    id v55 = 0LL;
    if (v59)
    {
      v29 = -[TVSMHomeSceneButtonViewController homeItem](v63, "homeItem");
      id v30 = -[HFItem latestResults](v29, "latestResults");
      id v31 = [v30 objectForKeyedSubscript:HFResultDisplayTitleKey];
      char v52 = 0;
      char v50 = 0;
      char v48 = 0;
      if (v31)
      {
        id v9 = v31;
      }

      else
      {
        v53 = -[TVSMHomeSceneButtonViewController homeItem](v63, "homeItem");
        char v52 = 1;
        id v51 = -[HFItem latestResults](v53, "latestResults");
        char v50 = 1;
        id v49 = [v51 objectForKeyedSubscript:HFResultDisplayTitlePlaceholderKey];
        char v48 = 1;
        id v9 = v49;
      }

      id v54 = v9;
      if ((v48 & 1) != 0) {

      }
      if ((v50 & 1) != 0) {
      if ((v52 & 1) != 0)
      }

      id v26 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
      id v25 =  -[NSBundle localizedStringForKey:value:table:]( v26,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleSecureScenePromptAlertTitle");
      id v10 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v54);
      id v11 = v56;
      id v56 = v10;

      v28 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Home-Module");
      BOOL v27 =  -[NSBundle localizedStringForKey:value:table:]( v28,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleSecureScenePromptAlertDescription",  &stru_192D0,  0LL);
      v12 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v54);
      id v13 = v55;
      id v55 = v12;

      objc_storeStrong(&v54, 0LL);
    }

    else
    {
      v32 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
      id v5 =  -[NSBundle localizedStringForKey:value:table:]( v32,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleSecureSceneFailedAlertTitle");
      id v6 = v56;
      id v56 = v5;

      v33 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Home-Module");
      objc_super v7 =  -[NSBundle localizedStringForKey:value:table:]( v33,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleSecureSceneFailedAlertDescription",  &stru_192D0,  0LL);
      id v8 = v55;
      id v55 = v7;
    }

    v47 =  +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v56,  v55,  1LL);
    if (v59)
    {
      id v46 = objc_alloc_init(&OBJC_CLASS___TVHMSecureAccessoryHeaderViewController);
      -[UIAlertController _setHeaderContentViewController:](v47, "_setHeaderContentViewController:", v46);
      unsigned __int8 v17 = v47;
      v20 = +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:");
      id v19 =  -[NSBundle localizedStringForKey:value:table:]( v20,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleSecureScenePromptAlertButtonTitle");
      v40 = _NSConcreteStackBlock;
      int v41 = -1073741824;
      int v42 = 0;
      v43 = sub_29F0;
      v44 = &unk_18540;
      v45 = v63;
      char v18 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  0LL,  &v40);
      -[UIAlertController addAction:](v17, "addAction:");

      id v21 = v47;
      char v24 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Home-Module");
      id v23 =  -[NSBundle localizedStringForKey:value:table:]( v24,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleSecureScenePromptAlertCancelButtonTitle",  &stru_192D0,  0LL);
      id v22 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:");
      -[UIAlertController addAction:](v21, "addAction:");

      objc_storeStrong((id *)&v45, 0LL);
      objc_storeStrong(&v46, 0LL);
    }

    else
    {
      v16 =  +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVSystemMenu.Home-Module");
      id v15 =  -[NSBundle localizedStringForKey:value:table:]( v16,  "localizedStringForKey:value:table:",  @"TVSMHomeModuleSecureSceneFailedAlertButtonTitle",  &stru_192D0);
      BOOL v14 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:");
      -[UIAlertController addAction:](v47, "addAction:");
    }

    -[TVSMHomeSceneButtonViewController presentViewController:animated:completion:]( v63,  "presentViewController:animated:completion:",  v47,  1LL);
    objc_storeStrong((id *)&v47, 0LL);
    objc_storeStrong(&v55, 0LL);
    objc_storeStrong(&v56, 0LL);
  }

  else
  {
    -[TVSMHomeSceneButtonViewController _toggleActionSet](v63, "_toggleActionSet");
  }

- (void)_toggleActionSet
{
  v32 = self;
  v31[1] = (id)a2;
  v31[0] = 0LL;
  v16 = -[TVSMHomeSceneButtonViewController homeItem](self, "homeItem");
  id v15 = -[HFItem latestResults](v16, "latestResults");
  id v14 = [v15 valueForKey:HFResultPrimaryStateKey];
  BOOL v17 = [v14 integerValue] != (char *)&dword_0 + 2;

  if (v17)
  {
    v12 = -[TVSMHomeSceneButtonViewController homeItem](v32, "homeItem");
    id v4 = -[HFItem executeActionSet](v12, "executeActionSet");
    id v5 = v31[0];
    v31[0] = v4;
  }

  else
  {
    id v13 = -[TVSMHomeSceneButtonViewController homeItem](v32, "homeItem");
    id v2 = -[HFItem turnOffActionSet](v13, "turnOffActionSet");
    id v3 = v31[0];
    v31[0] = v2;
  }

  id v8 = v31[0];
  id v25 = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  v28 = sub_2D24;
  v29 = &unk_185A8;
  id v30 = v32;
  id v6 = [v8 addSuccessBlock:&v25];
  id v9 = v31[0];
  id v19 = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  id v22 = sub_2F14;
  id v23 = &unk_185F8;
  char v24 = v32;
  id v7 = [v9 addFailureBlock:&v19];
  id v18 = objc_alloc_init(&OBJC_CLASS___TVSMProgressView);
  id v10 = v18;
  id v11 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
  objc_msgSend(v10, "setTintColor:");

  [v18 startWithFuture:v31[0]];
  -[TVSMHomeSceneButtonViewController setProgressView:](v32, "setProgressView:", v18);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong((id *)&v24, 0LL);
  objc_storeStrong((id *)&v30, 0LL);
  objc_storeStrong(v31, 0LL);
}

- (id)_iconTintColorForIconIdentifier:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = sub_33AC(&stru_18638);
  id v5 = [v6 objectForKeyedSubscript:location[0]];
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (HFItem)homeItem
{
  return self->_homeItem;
}

- (void).cxx_destruct
{
}

@end