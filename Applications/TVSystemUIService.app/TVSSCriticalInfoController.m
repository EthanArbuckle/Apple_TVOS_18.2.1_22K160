@interface TVSSCriticalInfoController
+ (id)_cameraItemWithUsedRecently:(BOOL)a3;
+ (id)_groupMatchingAttributions:(id)a3;
+ (id)_locationItemWithUsedRecently:(BOOL)a3;
+ (id)_micItemWithUsedRecently:(BOOL)a3;
+ (id)_testingCriticalInfo;
- (BOOL)attributions:(id)a3 wasUsedRecentlyForSensorType:(unint64_t)a4;
- (BOOL)hasCriticalInfo;
- (PBSAppInfoController)appInfoController;
- (TVSSBluetoothRemoteController)bluetoothRemoteController;
- (TVSSCriticalInfo)criticalInfo;
- (TVSSCriticalInfoController)init;
- (TVSSCriticalInfoController)initWithBluetoothRemoteController:(id)a3 sensorActivityController:(id)a4;
- (TVSSSensorActivityController)sensorActivityController;
- (id)_criticalInfoFromAttributionGroups;
- (void)_updateCriticalInfo;
- (void)bluetoothRemoteController:(id)a3 didUpdateCurrentRemote:(id)a4;
- (void)dealloc;
- (void)sensorActivityControllerDidUpdate:(id)a3;
- (void)setAppInfoController:(id)a3;
- (void)setBluetoothRemoteController:(id)a3;
- (void)setCriticalInfo:(id)a3;
- (void)setSensorActivityController:(id)a3;
@end

@implementation TVSSCriticalInfoController

- (TVSSCriticalInfoController)init
{
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSCriticalInfoController;
  v8 = -[TVSSCriticalInfoController init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVSSCriticalInfo);
    criticalInfo = v8->_criticalInfo;
    v8->_criticalInfo = v2;
  }

  v5 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (TVSSCriticalInfoController)initWithBluetoothRemoteController:(id)a3 sensorActivityController:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0LL;
  v10.receiver = v4;
  v10.super_class = (Class)&OBJC_CLASS___TVSSCriticalInfoController;
  v13 = -[TVSSCriticalInfoController init](&v10, "init");
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)&v13->_bluetoothRemoteController, location[0]);
    -[TVSSBluetoothRemoteController addObserver:](v13->_bluetoothRemoteController, "addObserver:", v13);
    objc_storeStrong((id *)&v13->_sensorActivityController, v11);
    -[TVSSSensorActivityController addObserver:](v13->_sensorActivityController, "addObserver:", v13);
    v5 = +[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance");
    appInfoController = v13->_appInfoController;
    v13->_appInfoController = v5;

    -[TVSSCriticalInfoController _updateCriticalInfo](v13, "_updateCriticalInfo");
  }

  v8 = v13;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v8;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSBluetoothRemoteController removeObserver:](self->_bluetoothRemoteController, "removeObserver:", self);
  -[TVSSSensorActivityController removeObserver:](v4->_sensorActivityController, "removeObserver:", v4);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSCriticalInfoController;
  -[TVSSCriticalInfoController dealloc](&v2, "dealloc");
}

- (BOOL)hasCriticalInfo
{
  v4 = -[TVSSCriticalInfoController criticalInfo](self, "criticalInfo");
  SEL v3 = -[TVSSCriticalInfo groups](v4, "groups");
  BOOL v5 = -[NSArray count](v3, "count") != 0;

  return v5;
}

- (void)bluetoothRemoteController:(id)a3 didUpdateCurrentRemote:(id)a4
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSCriticalInfoController _updateCriticalInfo](v7, "_updateCriticalInfo");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)sensorActivityControllerDidUpdate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSCriticalInfoController _updateCriticalInfo](v4, "_updateCriticalInfo");
  objc_storeStrong(location, 0LL);
}

- (void)_updateCriticalInfo
{
  id v2 = -[TVSSCriticalInfoController _criticalInfoFromAttributionGroups](self, "_criticalInfoFromAttributionGroups");
  -[TVSSCriticalInfoController setCriticalInfo:](self, "setCriticalInfo:");
}

+ (id)_groupMatchingAttributions:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v12 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0LL;
    id v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(id *)(__b[1] + 8 * v9);
      objc_super v6 = v23;
      v14 = _NSConcreteStackBlock;
      int v15 = -1073741824;
      int v16 = 0;
      v17 = sub_1000B19B4;
      v18 = &unk_1001B9DC8;
      id v19 = v22;
      id v20 = -[NSMutableArray bs_firstObjectPassingTest:](v6, "bs_firstObjectPassingTest:", &v14);
      if (v20)
      {
        [v20 addAttributionIfMatched:v22];
      }

      else
      {
        SEL v3 = objc_alloc(&OBJC_CLASS___TVSSSensorActivityAttributionGroup);
        v13 = -[TVSSSensorActivityAttributionGroup initWithAttribution:](v3, "initWithAttribution:", v22);
        -[NSMutableArray addObject:](v23, "addObject:", v13);
        objc_storeStrong((id *)&v13, 0LL);
      }

      objc_storeStrong(&v20, 0LL);
      objc_storeStrong(&v19, 0LL);
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v5 = -[NSMutableArray copy](v23, "copy");
  objc_storeStrong((id *)&v23, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)_cameraItemWithUsedRecently:(BOOL)a3
{
  id v16 = a1;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v13 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 5LL);
  id v12 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v13,  2LL);
  uint64_t v7 = v12;
  id v8 =  +[UIImageSymbolConfiguration configurationPreferringMulticolor]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationPreferringMulticolor");
  SEL v3 = (UIImageSymbolConfiguration *) -[UIImageSymbolConfiguration configurationByApplyingConfiguration:]( v7,  "configurationByApplyingConfiguration:");
  v4 = v12;
  id v12 = v3;

  id v11 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"video.circle.fill",  v12);
  id v10 = TVSSLocString(@"TVSSSensorNameCamera");
  id v5 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfoItem);
  uint64_t v9 = -[TVSSCriticalInfoItem initWithImage:title:kind:usedRecently:]( v5,  "initWithImage:title:kind:usedRecently:",  v11,  v10,  1LL,  v14);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  return v9;
}

+ (id)_micItemWithUsedRecently:(BOOL)a3
{
  id v16 = a1;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v13 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 5LL);
  id v12 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v13,  2LL);
  uint64_t v7 = v12;
  id v8 =  +[UIImageSymbolConfiguration configurationPreferringMulticolor]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationPreferringMulticolor");
  SEL v3 = (UIImageSymbolConfiguration *) -[UIImageSymbolConfiguration configurationByApplyingConfiguration:]( v7,  "configurationByApplyingConfiguration:");
  v4 = v12;
  id v12 = v3;

  id v11 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"mic.circle.fill",  v12);
  id v10 = TVSSLocString(@"TVSSSensorNameMicrophone");
  id v5 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfoItem);
  uint64_t v9 = -[TVSSCriticalInfoItem initWithImage:title:kind:usedRecently:]( v5,  "initWithImage:title:kind:usedRecently:",  v11,  v10,  0LL,  v14);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  return v9;
}

+ (id)_locationItemWithUsedRecently:(BOOL)a3
{
  id v16 = a1;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v13 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 5LL);
  id v12 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v13);
  uint64_t v7 = v12;
  id v8 =  +[UIImageSymbolConfiguration configurationPreferringMulticolor]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationPreferringMulticolor");
  SEL v3 = (UIImageSymbolConfiguration *) -[UIImageSymbolConfiguration configurationByApplyingConfiguration:]( v7,  "configurationByApplyingConfiguration:");
  v4 = v12;
  id v12 = v3;

  id v11 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"location.circle.fill",  v12);
  id v10 = TVSSLocString(@"TVSSSensorNameLocation");
  id v5 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfoItem);
  uint64_t v9 = -[TVSSCriticalInfoItem initWithImage:title:kind:usedRecently:]( v5,  "initWithImage:title:kind:usedRecently:",  v11,  v10,  2LL,  v14);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  return v9;
}

- (id)_criticalInfoFromAttributionGroups
{
  v66 = self;
  v65[1] = (id)a2;
  v65[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v39 = -[TVSSCriticalInfoController sensorActivityController](v66, "sensorActivityController");
  id v64 =  -[TVSSSensorActivityController activeAndRecentActivityAttributions]( v39,  "activeAndRecentActivityAttributions");

  id v63 = [(id)objc_opt_class(v66) _groupMatchingAttributions:v64];
  memset(__b, 0, sizeof(__b));
  id obj = v63;
  id v41 = [obj countByEnumeratingWithState:__b objects:v67 count:16];
  if (v41)
  {
    uint64_t v36 = *(void *)__b[2];
    uint64_t v37 = 0LL;
    id v38 = v41;
    while (1)
    {
      uint64_t v35 = v37;
      if (*(void *)__b[2] != v36) {
        objc_enumerationMutation(obj);
      }
      id v62 = *(id *)(__b[1] + 8 * v37);
      v60 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v34 = [v62 attributions];
      id v59 = [v34 firstObject];

      if ([v62 hasCameraSensor])
      {
        v29 = v66;
        id v30 = [v62 attributions];
        unsigned __int8 v31 = -[TVSSCriticalInfoController attributions:wasUsedRecentlyForSensorType:]( v29,  "attributions:wasUsedRecentlyForSensorType:");

        char v58 = v31 & 1;
        v32 = v60;
        id v2 = (void *)objc_opt_class(v66);
        id v33 = [v2 _cameraItemWithUsedRecently:v58 & 1];
        -[NSMutableArray addObject:](v32, "addObject:");
      }

      if ([v62 hasMicrophoneSensor])
      {
        v24 = v66;
        id v25 = [v62 attributions];
        unsigned __int8 v26 = -[TVSSCriticalInfoController attributions:wasUsedRecentlyForSensorType:]( v24,  "attributions:wasUsedRecentlyForSensorType:");

        char v57 = v26 & 1;
        v27 = v60;
        SEL v3 = (void *)objc_opt_class(v66);
        id v28 = [v3 _micItemWithUsedRecently:v57 & 1];
        -[NSMutableArray addObject:](v27, "addObject:");
      }

      if ([v62 hasLocationSensor])
      {
        id v19 = v66;
        id v20 = [v62 attributions];
        unsigned __int8 v21 = -[TVSSCriticalInfoController attributions:wasUsedRecentlyForSensorType:]( v19,  "attributions:wasUsedRecentlyForSensorType:");

        char v56 = v21 & 1;
        id v22 = v60;
        v4 = (void *)objc_opt_class(v66);
        id v23 = [v4 _locationItemWithUsedRecently:v56 & 1];
        -[NSMutableArray addObject:](v22, "addObject:");
      }

      id v55 = [v59 _effectiveDisplayName];
      id v54 = 0LL;
      id v53 = [v59 bundleIdentifier];
      BOOL v5 = [v53 length] == 0;
      char v51 = 0;
      char v49 = 0;
      BOOL v18 = 0;
      if (!v5)
      {
        id v52 = -[PBSAppInfoController appInfos](v66->_appInfoController, "appInfos");
        char v51 = 1;
        id v50 = [v52 objectForKeyedSubscript:v53];
        char v49 = 1;
        BOOL v18 = v50 != 0LL;
      }

      if ((v49 & 1) != 0) {

      }
      if ((v51 & 1) != 0) {
      if (v18)
      }
      {
        id v6 = objc_alloc(&OBJC_CLASS___ISIcon);
        id v48 = [v6 initWithBundleIdentifier:v53];
        id v17 = objc_alloc(&OBJC_CLASS___ISImageDescriptor);
        sub_1000B2644();
        double v45 = v7;
        double v46 = v8;
        id v47 = [v17 initWithSize:v7 scale:v8];
        id v9 = [v48 prepareImageForDescriptor:v47];
        id v44 = [v48 CGImageForDescriptor:v47];
        id v10 = objc_alloc(&OBJC_CLASS___UIImage);
        id v11 = -[UIImage initWithCGImage:scale:orientation:](v10, "initWithCGImage:scale:orientation:", v44, 0LL, 2.0);
        id v12 = v54;
        id v54 = v11;

        objc_storeStrong(&v47, 0LL);
        objc_storeStrong(&v48, 0LL);
      }

      id v13 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfoGroup);
      v43 = -[TVSSCriticalInfoGroup initWithGroupName:image:items:]( v13,  "initWithGroupName:image:items:",  v55,  v54,  v60);
      [v65[0] addObject:v43];
      objc_storeStrong((id *)&v43, 0LL);
      objc_storeStrong(&v53, 0LL);
      objc_storeStrong(&v54, 0LL);
      objc_storeStrong(&v55, 0LL);
      objc_storeStrong(&v59, 0LL);
      objc_storeStrong((id *)&v60, 0LL);
      ++v37;
      if (v35 + 1 >= (unint64_t)v38)
      {
        uint64_t v37 = 0LL;
        id v38 = [obj countByEnumeratingWithState:__b objects:v67 count:16];
        if (!v38) {
          break;
        }
      }
    }
  }

  BOOL v14 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfo);
  id v42 = -[TVSSCriticalInfo initWithGroups:](v14, "initWithGroups:", v65[0]);
  id v16 = v42;
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong(&v64, 0LL);
  objc_storeStrong(v65, 0LL);
  return v16;
}

  ;
}

- (BOOL)attributions:(id)a3 wasUsedRecentlyForSensorType:(unint64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unint64_t v16 = a4;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
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
      id v15 = *(id *)(__b[1] + 8 * v8);
      id v4 = [v15 sensorType];
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          goto LABEL_10;
        }
      }
    }

    char v18 = 1;
    int v13 = 1;
  }

  else
  {
LABEL_10:
    int v13 = 0;
  }

  if (!v13) {
    char v18 = 0;
  }
  objc_storeStrong(location, 0LL);
  return v18 & 1;
}

+ (id)_testingCriticalInfo
{
  id v19 = a1;
  v18[1] = (id)a2;
  id v6 = [a1 _cameraItemWithUsedRecently:1];
  v21[0] = v6;
  id v5 = [v19 _locationItemWithUsedRecently:0];
  v21[1] = v5;
  id v4 = [v19 _micItemWithUsedRecently:1];
  v21[2] = v4;
  v18[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21);

  uint64_t v7 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfoGroup);
  id v15 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"video");
  BOOL v14 = -[TVSSCriticalInfoGroup initWithGroupName:image:items:](v7, "initWithGroupName:image:items:", @"FaceTime");
  v20[0] = v14;
  uint64_t v8 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfoGroup);
  id v13 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"gear.circle");
  id v12 = -[TVSSCriticalInfoGroup initWithGroupName:image:items:](v8, "initWithGroupName:image:items:", @"Settings");
  v20[1] = v12;
  id v9 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfoGroup);
  id v11 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"tv");
  id v10 = -[TVSSCriticalInfoGroup initWithGroupName:image:items:](v9, "initWithGroupName:image:items:", @"TV");
  v20[2] = v10;
  id v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL);

  id v2 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfo);
  unint64_t v16 = -[TVSSCriticalInfo initWithGroups:](v2, "initWithGroups:", v17);
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong(v18, 0LL);
  return v16;
}

- (TVSSCriticalInfo)criticalInfo
{
  return self->_criticalInfo;
}

- (void)setCriticalInfo:(id)a3
{
}

- (TVSSBluetoothRemoteController)bluetoothRemoteController
{
  return self->_bluetoothRemoteController;
}

- (void)setBluetoothRemoteController:(id)a3
{
}

- (TVSSSensorActivityController)sensorActivityController
{
  return self->_sensorActivityController;
}

- (void)setSensorActivityController:(id)a3
{
}

- (PBSAppInfoController)appInfoController
{
  return self->_appInfoController;
}

- (void)setAppInfoController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end