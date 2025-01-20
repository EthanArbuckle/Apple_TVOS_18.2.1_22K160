@interface TVSSGameControllersPlatterController
- (BSInvalidatable)moreDetailsFocusHandle;
- (TVSSBluetoothController)bluetoothController;
- (TVSSGameControllersPlatterController)initWithBluetoothController:(id)a3;
- (id)_gameControllerForRendererIdentifier:(id)a3;
- (id)_layout;
- (id)_unpairActionForGameController:(id)a3;
- (id)contextMenuConfigurationForRenderer:(id)a3;
- (void)_connectGameController:(id)a3;
- (void)_disconnectGameController:(id)a3;
- (void)_launchSettingsWithURLPath:(id)a3;
- (void)_presentAlertWithError:(id)a3 forGameController:(id)a4;
- (void)_presentMoreDetailsAlert;
- (void)_unpairGameController:(id)a3;
- (void)_updateLayoutAndReloadContent:(BOOL)a3;
- (void)_updateRenderersWithGameControllers:(id)a3;
- (void)bluetoothControllerPairableDevicesDidUpdate:(id)a3;
- (void)bluetoothControllerPairedDevicesDidUpdate:(id)a3;
- (void)dealloc;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
@end

@implementation TVSSGameControllersPlatterController

- (TVSSGameControllersPlatterController)initWithBluetoothController:(id)a3
{
  id v95 = self;
  SEL v94 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v92 = location;
  id v91 = 0LL;
  Class v90 = NSClassFromString(@"TVSSBluetoothController");
  if (!v92)
  {
    id v89 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v88 = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v88, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v88;
      os_log_type_t v59 = type;
      v55 = NSStringFromSelector(v94);
      v56 = v55;
      id v86 = v56;
      aClass = (objc_class *)objc_opt_class(v95);
      v54 = NSStringFromClass(aClass);
      id v85 = v54;
      sub_10000583C( (uint64_t)v100,  (uint64_t)v56,  (uint64_t)v85,  (uint64_t)v95,  (uint64_t)@"TVSSGameControllersPlatterController.m",  104,  (uint64_t)v89);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v59,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v100,  0x3Au);

      objc_storeStrong(&v85, 0LL);
      objc_storeStrong(&v86, 0LL);
    }

    objc_storeStrong(&v88, 0LL);
    _bs_set_crash_log_message([v89 UTF8String]);
    __break(0);
    JUMPOUT(0x100123AE8LL);
  }

  if (((objc_opt_isKindOfClass(v92, v90) ^ 1) & 1) != 0)
  {
    id v84 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSBluetoothControllerClass]");
    id v83 = &_os_log_default;
    os_log_type_t v82 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_ERROR))
    {
      v52 = (os_log_s *)v83;
      os_log_type_t v53 = v82;
      v49 = NSStringFromSelector(v94);
      v50 = v49;
      id v81 = v50;
      v51 = (objc_class *)objc_opt_class(v95);
      v48 = NSStringFromClass(v51);
      id v80 = v48;
      sub_10000583C( (uint64_t)v99,  (uint64_t)v50,  (uint64_t)v80,  (uint64_t)v95,  (uint64_t)@"TVSSGameControllersPlatterController.m",  104,  (uint64_t)v84);
      _os_log_error_impl( (void *)&_mh_execute_header,  v52,  v53,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v99,  0x3Au);

      objc_storeStrong(&v80, 0LL);
      objc_storeStrong(&v81, 0LL);
    }

    objc_storeStrong(&v83, 0LL);
    _bs_set_crash_log_message([v84 UTF8String]);
    __break(0);
    JUMPOUT(0x100123D18LL);
  }

  objc_storeStrong(&v91, 0LL);
  objc_storeStrong(&v92, 0LL);
  id v47 = [location configuration];
  id v46 =  +[TVSSBluetoothControllerConfiguration gameControllersConfiguration]( &OBJC_CLASS___TVSSBluetoothControllerConfiguration,  "gameControllersConfiguration");
  int v45 = BSEqualObjects(v47, v46) ^ 1;

  if ((v45 & 1) != 0)
  {
    id v79 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"BSEqualObjects([bluetoothController configuration], [TVSSBluetoothControllerConfiguration gameControllersConfiguration])");
    id v78 = &_os_log_default;
    os_log_type_t v77 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_ERROR))
    {
      v43 = (os_log_s *)v78;
      os_log_type_t v44 = v77;
      v40 = NSStringFromSelector(v94);
      v41 = v40;
      id v76 = v41;
      v42 = (objc_class *)objc_opt_class(v95);
      v39 = NSStringFromClass(v42);
      id v75 = v39;
      sub_10000583C( (uint64_t)v98,  (uint64_t)v41,  (uint64_t)v75,  (uint64_t)v95,  (uint64_t)@"TVSSGameControllersPlatterController.m",  105,  (uint64_t)v79);
      _os_log_error_impl( (void *)&_mh_execute_header,  v43,  v44,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v98,  0x3Au);

      objc_storeStrong(&v75, 0LL);
      objc_storeStrong(&v76, 0LL);
    }

    objc_storeStrong(&v78, 0LL);
    _bs_set_crash_log_message([v79 UTF8String]);
    __break(0);
    JUMPOUT(0x100123FE8LL);
  }

  id v38 = TVSSLocString(@"TVSSGameControllersTitle");
  v37 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v36 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Title",  2LL);
  v97[0] = v36;
  v34 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Separator",  19LL,  0LL);
  v97[1] = v34;
  v35 = objc_alloc(&OBJC_CLASS___TVSSInterstitialInfoRenderer);
  v33 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"game_controller");
  v32 = -[UIImage imageWithRenderingMode:](v33, "imageWithRenderingMode:", 2LL);
  id v31 = TVSSLocString(@"TVSSGameControllersPairingHelpDescription");
  v29 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  0LL,  v32);
  sub_1001249BC();
  v73[1] = v3;
  v73[2] = v4;
  v73[3] = v5;
  v73[4] = v6;
  v30 = -[TVSSInterstitialInfoRenderer initWithIdentifier:content:contentInsets:]( v35,  "initWithIdentifier:content:contentInsets:",  @"No-GC-Pairing-Help-Glyph",  v29,  *(double *)&v3,  *(double *)&v4,  *(double *)&v5,  *(double *)&v6);
  v97[2] = v30;
  id v28 = TVSSLocString(@"TVSSGameControllersPairingHelpButtonTitle");
  v27 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v26 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"No-GC-Pairing-Help-Button",  15LL);
  v97[3] = v26;
  id v25 = TVSSLocString(@"TVSSGameControllersControllerSettingsTitle");
  id v24 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"gear");
  v23 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v25);
  v22 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"Controller-Settings",  16LL);
  v97[4] = v22;
  id v74 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v97, 5LL);

  v21 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Title");
  v96[0] = v21;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v20 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", v7);
  v96[1] = v20;
  id v19 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"Separator");
  v96[2] = v19;
  +[TVSPConstants topSpacerHeight](&OBJC_CLASS___TVSPConstants, "topSpacerHeight");
  id v18 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", v8);
  v96[3] = v18;
  v73[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v96, 4LL);

  id v72 =  +[TVSPLayout layoutWithRows:sizeProviders:]( &OBJC_CLASS___TVSPLayout,  "layoutWithRows:sizeProviders:",  v73[0],  v74);
  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(void *)&__int128 v17 = v9;
  *((void *)&v17 + 1) = v10;
  __int128 v70 = v17;
  *(void *)&__int128 v71 = v11;
  *((void *)&v71 + 1) = v12;
  __int128 v68 = v17;
  __int128 v69 = v71;
  objc_msgSend(v72, "setContentInsets:", v17, v71);
  id v13 = v95;
  id v95 = 0LL;
  v67.receiver = v13;
  v67.super_class = (Class)&OBJC_CLASS___TVSSGameControllersPlatterController;
  id v95 = -[TVSSGameControllersPlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v67,  "initWithIdentifier:layout:renderers:rendererProvider:",  @"Game-Controllers-Platter",  v72,  v74,  0LL);
  objc_storeStrong(&v95, v95);
  if (v95)
  {
    objc_storeStrong((id *)v95 + 1, location);
    [*((id *)v95 + 1) addPairedDevicesObserver:v95];
    [*((id *)v95 + 1) addPairableDevicesObserver:v95];
    objc_initWeak(&from, v95);
    id v16 = v95;
    v60 = _NSConcreteStackBlock;
    int v61 = -1073741824;
    int v62 = 0;
    v63 = sub_100124A08;
    v64 = &unk_1001B6940;
    objc_copyWeak(&v65, &from);
    [v16 setRendererProvider:&v60];
    [v95 _updateLayoutAndReloadContent:1];
    objc_destroyWeak(&v65);
    objc_destroyWeak(&from);
  }

  v15 = (TVSSGameControllersPlatterController *)v95;
  objc_storeStrong(&v72, 0LL);
  objc_storeStrong(v73, 0LL);
  objc_storeStrong(&v74, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v95, 0LL);
  return v15;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSBluetoothController removePairedDevicesObserver:]( self->_bluetoothController,  "removePairedDevicesObserver:",  self);
  -[TVSSBluetoothController removePairableDevicesObserver:]( v4->_bluetoothController,  "removePairableDevicesObserver:",  v4);
  -[BSInvalidatable invalidate](v4->_moreDetailsFocusHandle, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSGameControllersPlatterController;
  -[TVSSGameControllersPlatterController dealloc](&v2, "dealloc");
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v8.receiver = v11;
  v8.super_class = (Class)&OBJC_CLASS___TVSSGameControllersPlatterController;
  -[TVSSGameControllersPlatterController rendererWasSelected:context:]( &v8,  "rendererWasSelected:context:",  location[0],  v9);
  id v7 = [location[0] identifier];
  if ([v7 isEqualToString:@"Controller-Settings"])
  {
    -[TVSSGameControllersPlatterController _launchSettingsWithURLPath:]( v11,  "_launchSettingsWithURLPath:",  @"prefs:root=GameControllers");
    [v9 dismissSystemMenuWithSourceIdentifier:v7];
  }

  else if ([v7 isEqualToString:@"No-GC-Pairing-Help-Button"])
  {
    -[TVSSGameControllersPlatterController _presentMoreDetailsAlert](v11, "_presentMoreDetailsAlert");
  }

  else
  {
    id v6 =  -[TVSSGameControllersPlatterController _gameControllerForRendererIdentifier:]( v11,  "_gameControllerForRendererIdentifier:",  v7);
    if (v6)
    {
      id v5 = [v6 connectionState];
      if (v5)
      {
        if (v5 == (id)2) {
          -[TVSSGameControllersPlatterController _disconnectGameController:](v11, "_disconnectGameController:", v6);
        }
      }

      else
      {
        -[TVSSGameControllersPlatterController _connectGameController:](v11, "_connectGameController:", v6);
      }
    }

    objc_storeStrong(&v6, 0LL);
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)contextMenuConfigurationForRenderer:(id)a3
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  __int128 v17 = 0LL;
  id v7 = v19;
  id v8 = [location[0] identifier];
  id v16 =  -[TVSSGameControllersPlatterController _gameControllerForRendererIdentifier:]( v7,  "_gameControllerForRendererIdentifier:");

  if (([v16 isPaired] & 1) != 0
    && [v16 connectionState] == (id)2
    && ([v16 supportsDisconnectRequests] & 1) == 0)
  {
    id v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    uint64_t v12 = sub_100124F14;
    id v13 = &unk_1001BB9D0;
    v14 = v19;
    id v15 = v16;
    SEL v3 =  +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:]( &OBJC_CLASS___UIContextMenuConfiguration,  "configurationWithIdentifier:previewProvider:actionProvider:",  0LL,  0LL,  &v9);
    v4 = v17;
    __int128 v17 = v3;

    objc_storeStrong(&v15, 0LL);
    objc_storeStrong((id *)&v14, 0LL);
  }

  id v6 = v17;
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)bluetoothControllerPairedDevicesDidUpdate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSGameControllersPlatterController _updateLayoutAndReloadContent:](v4, "_updateLayoutAndReloadContent:", 1LL);
  objc_storeStrong(location, 0LL);
}

- (void)bluetoothControllerPairableDevicesDidUpdate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSGameControllersPlatterController _updateLayoutAndReloadContent:](v4, "_updateLayoutAndReloadContent:", 1LL);
  objc_storeStrong(location, 0LL);
}

- (id)_gameControllerForRendererIdentifier:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 =  +[TVSSBluetoothDevice gameControllerIdentifierFromRendererIdentifier:]( &OBJC_CLASS___TVSSBluetoothDevice,  "gameControllerIdentifierFromRendererIdentifier:",  location[0]);
  id v4 = -[TVSSBluetoothController deviceForIdentifier:](v7->_bluetoothController, "deviceForIdentifier:", v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)_launchSettingsWithURLPath:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v10 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", location[0]);
  queue = dispatch_get_global_queue(0LL, 0LL);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1001252A8;
  id v8 = &unk_1001B5A60;
  id v9 = v10;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_layout
{
  v50 = self;
  v49[1] = (id)a2;
  v49[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v39 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Title");
  objc_msgSend(v49[0], "addObject:");

  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v40 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  objc_msgSend(v49[0], "addObject:");

  +[TVSPConstants separatorHeight](&OBJC_CLASS___TVSPConstants, "separatorHeight");
  v41 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"Separator");
  objc_msgSend(v49[0], "addObject:");

  id v48 = -[TVSSBluetoothController pairedDevices](v50->_bluetoothController, "pairedDevices");
  id v47 = -[TVSSBluetoothController pairableDevices](v50->_bluetoothController, "pairableDevices");
  if ([v48 count] || objc_msgSend(v47, "count"))
  {
    memset(__b, 0, sizeof(__b));
    id obj = v48;
    id v38 = [obj countByEnumeratingWithState:__b objects:v52 count:16];
    if (v38)
    {
      uint64_t v34 = *(void *)__b[2];
      uint64_t v35 = 0LL;
      id v36 = v38;
      while (1)
      {
        uint64_t v33 = v35;
        if (*(void *)__b[2] != v34) {
          objc_enumerationMutation(obj);
        }
        id v46 = *(id *)(__b[1] + 8 * v35);
        id v28 = v49[0];
        +[TVSPConstants topSpacerHeight](&OBJC_CLASS___TVSPConstants, "topSpacerHeight");
        id v29 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
        objc_msgSend(v28, "addObject:");

        id v30 = v49[0];
        id v32 = [v46 rendererIdentifier];
        id v31 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:");
        objc_msgSend(v30, "addObject:");

        ++v35;
        if (v33 + 1 >= (unint64_t)v36)
        {
          uint64_t v35 = 0LL;
          id v36 = [obj countByEnumeratingWithState:__b objects:v52 count:16];
          if (!v36) {
            break;
          }
        }
      }
    }

    memset(v43, 0, sizeof(v43));
    id v26 = v47;
    id v27 = [v26 countByEnumeratingWithState:v43 objects:v51 count:16];
    if (v27)
    {
      uint64_t v23 = *(void *)v43[2];
      uint64_t v24 = 0LL;
      id v25 = v27;
      while (1)
      {
        uint64_t v22 = v24;
        if (*(void *)v43[2] != v23) {
          objc_enumerationMutation(v26);
        }
        id v44 = *(id *)(v43[1] + 8 * v24);
        id v17 = v49[0];
        +[TVSPConstants topSpacerHeight](&OBJC_CLASS___TVSPConstants, "topSpacerHeight");
        id v18 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
        objc_msgSend(v17, "addObject:");

        id v19 = v49[0];
        id v21 = [v44 rendererIdentifier];
        id v20 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:");
        objc_msgSend(v19, "addObject:");

        ++v24;
        if (v22 + 1 >= (unint64_t)v25)
        {
          uint64_t v24 = 0LL;
          id v25 = [v26 countByEnumeratingWithState:v43 objects:v51 count:16];
          if (!v25) {
            break;
          }
        }
      }
    }

    id v13 = v49[0];
    id v14 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
    objc_msgSend(v13, "addObject:");

    id v15 = v49[0];
    id v16 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"Controller-Settings");
    objc_msgSend(v15, "addObject:");
  }

  else
  {
    int v10 =  +[TVSPRow rowWithIdentifier:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:",  @"No-GC-Pairing-Help-Glyph");
    objc_msgSend(v49[0], "addObject:");

    id v11 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 26.0);
    objc_msgSend(v49[0], "addObject:");

    +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
    uint64_t v12 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"No-GC-Pairing-Help-Button");
    objc_msgSend(v49[0], "addObject:");
  }

  id v7 = v49[0];
  id v8 = -[TVSSGameControllersPlatterController renderers](v50, "renderers");
  id v42 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v7);

  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  objc_msgSend(v42, "setContentInsets:", v2, v3, v4, v5);
  id v9 = v42;
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(v49, 0LL);
  return v9;
}

- (void)_updateLayoutAndReloadContent:(BOOL)a3
{
  int v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id v7 = -[TVSSGameControllersPlatterController _layout](self, "_layout");
  id location = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  id v5 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  -[TVSSGameControllersPlatterController applyLayout:animator:](v10, "applyLayout:animator:", v7);

  -[TVSSGameControllersPlatterController _updatePlatterSizeWithAnimator:]( v10,  "_updatePlatterSizeWithAnimator:",  location);
  if (v8)
  {
    double v3 = -[TVSSBluetoothController pairedDevices](v10->_bluetoothController, "pairedDevices");
    -[TVSSGameControllersPlatterController _updateRenderersWithGameControllers:]( v10,  "_updateRenderersWithGameControllers:");

    double v4 = -[TVSSBluetoothController pairableDevices](v10->_bluetoothController, "pairableDevices");
    -[TVSSGameControllersPlatterController _updateRenderersWithGameControllers:]( v10,  "_updateRenderersWithGameControllers:");

    -[TVSSGameControllersPlatterController reloadContent](v10, "reloadContent");
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v7, 0LL);
}

- (void)_updateRenderersWithGameControllers:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v11 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(__b[1] + 8 * v8);
      id v13 = [v15 rendererIdentifier];
      id v4 = -[TVSSGameControllersPlatterController rendererForIdentifier:](v17, "rendererForIdentifier:", v13);
      uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSGameControllerRenderer);
      id v5 = sub_100125EF0(v4, v3);

      id v12 = v5;
      [v5 applyContent:v15];
      objc_storeStrong(&v12, 0LL);
      objc_storeStrong(&v13, 0LL);
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (id)_unpairActionForGameController:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v16);
  id v5 = TVSSLocString(@"TVSSGameControllersUnpairTitle");
  uint64_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_10012618C;
  int v10 = &unk_1001BB9F8;
  objc_copyWeak(v12, &from);
  id v11 = location[0];
  id v13 =  +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v5,  0LL,  0LL,  &v6);

  -[UIAction setAttributes:](v13, "setAttributes:", 2LL);
  id v4 = v13;
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(v12);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)_connectGameController:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v14);
  bluetoothController = v14->_bluetoothController;
  id v3 = [location[0] identifier];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_10012636C;
  id v9 = &unk_1001BBA20;
  objc_copyWeak(v11, &from);
  id v10 = location[0];
  -[TVSSBluetoothController connectDeviceWithIdentifier:withCompletion:]( bluetoothController,  "connectDeviceWithIdentifier:withCompletion:",  v3,  &v5);

  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
}

- (void)_disconnectGameController:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v14);
  bluetoothController = v14->_bluetoothController;
  id v3 = [location[0] identifier];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_10012655C;
  id v9 = &unk_1001BBA20;
  objc_copyWeak(v11, &from);
  id v10 = location[0];
  -[TVSSBluetoothController disconnectDeviceWithIdentifier:withCompletion:]( bluetoothController,  "disconnectDeviceWithIdentifier:withCompletion:",  v3,  &v5);

  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
}

- (void)_unpairGameController:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v14);
  bluetoothController = v14->_bluetoothController;
  id v3 = [location[0] identifier];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_10012674C;
  id v9 = &unk_1001BBA20;
  objc_copyWeak(v11, &from);
  id v10 = location[0];
  -[TVSSBluetoothController unpairDeviceWithIdentifier:withCompletion:]( bluetoothController,  "unpairDeviceWithIdentifier:withCompletion:",  v3,  &v5);

  objc_storeStrong(&v10, 0LL);
  objc_destroyWeak(v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
}

- (void)_presentAlertWithError:(id)a3 forGameController:(id)a4
{
  v56 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v54 = 0LL;
  objc_storeStrong(&v54, a4);
  id v53 = 0LL;
  v52 = 0LL;
  id v35 = [location[0] code];
  if (v35 == (id)1)
  {
    if (([v54 isPaired] & 1) == 0)
    {
      id v30 = TVSSLocString(@"TVSSGameControllersErrorGenericPairingDescriptionFormat");
      id v29 = [v54 displayName];
      v51 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v30, v29);

      id v31 = TVSSLocString(@"TVSSGameControllersErrorPairingTimeoutDescriptionFormat");
      int v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v51);
      id v7 = v53;
      id v53 = v6;

      objc_storeStrong((id *)&v51, 0LL);
    }
  }

  else if (v35 == (id)109)
  {
    id v33 = TVSSLocString(@"TVSSGameControllersErrorUnsupportedDeviceFormat");
    id v32 = [v54 displayName];
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v33, v32);
    id v5 = v53;
    id v53 = v4;
  }

  else if (v35 == (id)151 && ([v54 isPaired] & 1) != 0)
  {
    id v28 = TVSSLocString(@"TVSSGameControllersErrorLinkKeyDescriptionFormat");
    id v27 = [v54 displayName];
    int v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v28, v27);
    id v9 = v53;
    id v53 = v8;

    objc_initWeak(&from, v56);
    id v26 = TVSSLocString(@"TVSSGameControllersUnpairTitle");
    v43 = _NSConcreteStackBlock;
    int v44 = -1073741824;
    int v45 = 0;
    id v46 = sub_100126F78;
    id v47 = &unk_1001BBA48;
    objc_copyWeak(&v49, &from);
    id v48 = v54;
    id v10 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v26,  1LL,  &v43);
    id v11 = v52;
    v52 = v10;

    objc_storeStrong(&v48, 0LL);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&from);
  }

  if (!v53)
  {
    if ([v54 isPaired])
    {
      id v25 = TVSSLocString(@"TVSSGameControllersErrorGenericDescriptionFormat");
      id v24 = [v54 displayName];
      id v12 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v25, v24);
      id v13 = v53;
      id v53 = v12;
    }

    else
    {
      id v23 = TVSSLocString(@"TVSSGameControllersErrorGenericPairingDescriptionFormat");
      id v22 = [v54 displayName];
      id v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v22);
      id v15 = v53;
      id v53 = v14;
    }
  }

  char v40 = 0;
  char v38 = 0;
  if ([v54 isPaired])
  {
    id v41 = TVSSLocString(@"TVSSGameControllersErrorConnectingTitle");
    char v40 = 1;
    id v16 = v41;
  }

  else
  {
    id v39 = TVSSLocString(@"TVSSGameControllersErrorPairingTitle");
    char v38 = 1;
    id v16 = v39;
  }

  id v42 = v16;
  if ((v38 & 1) != 0) {

  }
  if ((v40 & 1) != 0) {
  v37 =  +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v42,  v53,  1LL);
  }
  if (!v52)
  {
    id v21 = TVSSLocString(@"TVSSGameControllersOKTitle");
    id v17 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:");
    id v18 = v52;
    v52 = v17;
  }

  -[UIAlertController addAction:](v37, "addAction:", v52);
  id v20 = -[TVSSGameControllersPlatterController contentView](v56, "contentView");
  id v19 = [v20 window];
  id v36 = [v19 rootViewController];

  objc_msgSend(v36, "presentViewController:animated:completion:", v37, 1);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong((id *)&v52, 0LL);
  objc_storeStrong(&v53, 0LL);
  objc_storeStrong(&v54, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_presentMoreDetailsAlert
{
  id v24 = self;
  v23[1] = (id)a2;
  id v2 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  id v4 = (id)TVCSLocalizedString(@"GameControllerHelpTitle");
  id v3 = (id)TVCSLocalizedString(@"GameControllerHelpDescription");
  v23[0] = objc_msgSend(v2, "initWithTitle:text:", v4);

  [v23[0] setShouldCenterAlignShortText:0];
  id v5 = v23[0];
  v17[1] = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  id v20 = sub_100127258;
  id v21 = &unk_1001B5A60;
  id v22 = v24;
  int v6 =  +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:");
  objc_msgSend(v5, "addButton:");

  id v8 = -[TVSSGameControllersPlatterController contentView](v24, "contentView");
  id v7 = [v8 window];
  v17[0] = [v7 rootViewController];

  id v10 = v17[0];
  id v9 = v23[0];
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_1001272B8;
  id v15 = &unk_1001B5A60;
  id v16 = v24;
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(v17, 0LL);
  objc_storeStrong((id *)&v22, 0LL);
  objc_storeStrong(v23, 0LL);
}

- (TVSSBluetoothController)bluetoothController
{
  return self->_bluetoothController;
}

- (BSInvalidatable)moreDetailsFocusHandle
{
  return self->_moreDetailsFocusHandle;
}

- (void).cxx_destruct
{
}

@end