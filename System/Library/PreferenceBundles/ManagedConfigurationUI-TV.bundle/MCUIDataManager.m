@interface MCUIDataManager
+ (BOOL)_isDeviceManagementHiddenConcrete;
+ (id)sharedManager;
- (BOOL)isDeviceManagementHidden;
- (BOOL)isProfileSectionEmpty;
- (BOOL)observing;
- (LSApplicationWorkspace)appWorkspace;
- (MCProfileInfo)mdmProfileInfo;
- (MCUIDataManager)init;
- (NSArray)blockedApplications;
- (NSArray)configurationProfilesInfo;
- (NSArray)enterpriseAppSigners;
- (NSArray)freeDeveloperAppSigners;
- (NSArray)uninstalledProfilesInfo;
- (OS_dispatch_queue)memberQueue;
- (OS_dispatch_queue)reloadQueue;
- (id)configurationProfiles;
- (id)mdmProfile;
- (int)appsChangedNotifyToken;
- (int)provisioningProfileInstalledToken;
- (int)provisioningProfileRemovedToken;
- (unint64_t)appSignerCount;
- (unint64_t)installedProfileCount;
- (unint64_t)itemCount;
- (void)_reloadQueueReloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6;
- (void)allDeviceManagementOutMDMProfileInfo:(id *)a3 outConfigurationProfilesInfo:(id *)a4 outUninstalledProfilesInfo:(id *)a5 outEnterpriseAppSigners:(id *)a6 outFreeDevAppSigners:(id *)a7 outBlockedApplications:(id *)a8;
- (void)appMovedToBackground:(id)a3;
- (void)appMovedToForeground:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)profilesChanged:(id)a3;
- (void)reloadAllDataInBackgroundWithCompletion:(id)a3;
- (void)reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:(id)a3;
- (void)reloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6;
- (void)reloadProfilesInBackgroundWithCompletion:(id)a3;
- (void)setAppWorkspace:(id)a3;
- (void)setAppsChangedNotifyToken:(int)a3;
- (void)setBlockedApplications:(id)a3;
- (void)setConfigurationProfilesInfo:(id)a3;
- (void)setEnterpriseAppSigners:(id)a3;
- (void)setFreeDeveloperAppSigners:(id)a3;
- (void)setMdmProfileInfo:(id)a3;
- (void)setMemberQueue:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)setProvisioningProfileInstalledToken:(int)a3;
- (void)setProvisioningProfileRemovedToken:(int)a3;
- (void)setReloadQueue:(id)a3;
- (void)setUninstalledProfilesInfo:(id)a3;
@end

@implementation MCUIDataManager

+ (BOOL)_isDeviceManagementHiddenConcrete
{
  return +[UIApplication isRunningInStoreDemoMode]( &OBJC_CLASS___UIApplication,  "isRunningInStoreDemoMode");
}

- (BOOL)isDeviceManagementHidden
{
  return +[MCUIDataManager _isDeviceManagementHiddenConcrete]( &OBJC_CLASS___MCUIDataManager,  "_isDeviceManagementHiddenConcrete");
}

+ (id)sharedManager
{
  if (qword_31228 != -1) {
    dispatch_once(&qword_31228, &stru_28F58);
  }
  return (id)qword_31220;
}

- (MCUIDataManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCUIDataManager;
  v2 = -[MCUIDataManager init](&v23, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MCUIDataManager member queue", 0LL);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("MCUIDataManager reload queue", 0LL);
    reloadQueue = v2->_reloadQueue;
    v2->_reloadQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    appWorkspace = v2->_appWorkspace;
    v2->_appWorkspace = (LSApplicationWorkspace *)v7;

    -[LSApplicationWorkspace addObserver:](v2->_appWorkspace, "addObserver:", v2);
    v2->_observing = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v10 = MCProfileListChangedNotification;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v9 addObserver:v2 selector:"profilesChanged:" name:v10 object:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v2 selector:"appMovedToBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v2 selector:"appMovedToForeground:" name:UIApplicationDidBecomeActiveNotification object:0];

    objc_initWeak(&location, v2);
    v14 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_17338;
    handler[3] = &unk_285E8;
    objc_copyWeak(&v21, &location);
    uint32_t v15 = notify_register_dispatch( "MISProvisioningProfileInstalled",  &v2->_provisioningProfileInstalledToken,  &_dispatch_main_q,  handler);

    if (v15) {
      NSLog(@"Failed to register for provisioning profile installation");
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_17368;
    v18[3] = &unk_285E8;
    objc_copyWeak(&v19, &location);
    uint32_t v16 = notify_register_dispatch( "MISProvisioningProfileRemoved",  &v2->_provisioningProfileInstalledToken,  &_dispatch_main_q,  v18);

    if (v16) {
      NSLog(@"Failed to register for provisioning profile removal");
    }
    if (-[MCUIDataManager isDeviceManagementHidden](v2, "isDeviceManagementHidden"))
    {
      NSLog(@"Data manager not preloading data because the profile section is restricted");
    }

    else
    {
      NSLog(@"Data manager preloading data in background");
      -[MCUIDataManager reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:]( v2,  "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:",  1LL,  1LL,  0LL,  0LL);
      -[MCUIDataManager reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:]( v2,  "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:",  0LL,  0LL,  1LL,  0LL);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:MCProfileListChangedNotification object:0];

  if (self->_observing)
  {
    -[LSApplicationWorkspace removeObserver:](self->_appWorkspace, "removeObserver:", self);
    self->_observing = 0;
  }

  notify_cancel(self->_appsChangedNotifyToken);
  notify_cancel(self->_provisioningProfileInstalledToken);
  notify_cancel(self->_provisioningProfileRemovedToken);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCUIDataManager;
  -[MCUIDataManager dealloc](&v6, "dealloc");
}

- (void)appMovedToBackground:(id)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MCUIDataManager appWorkspace](self, "appWorkspace", a3));
  if (v4)
  {
    dispatch_queue_t v5 = (void *)v4;
    unsigned int v6 = -[MCUIDataManager observing](self, "observing");

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager appWorkspace](self, "appWorkspace"));
      [v7 removeObserver:self];

      -[MCUIDataManager setObserving:](self, "setObserving:", 0LL);
    }
  }

- (void)appMovedToForeground:(id)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MCUIDataManager appWorkspace](self, "appWorkspace", a3));
  if (v4)
  {
    dispatch_queue_t v5 = (void *)v4;
    unsigned __int8 v6 = -[MCUIDataManager observing](self, "observing");

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager appWorkspace](self, "appWorkspace"));
      [v7 addObserver:self];

      -[MCUIDataManager setObserving:](self, "setObserving:", 1LL);
    }
  }

  -[MCUIDataManager reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:]( self,  "reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:",  0LL);
}

- (void)profilesChanged:(id)a3
{
}

- (BOOL)isProfileSectionEmpty
{
  return -[MCUIDataManager itemCount](self, "itemCount") == 0;
}

- (unint64_t)itemCount
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_17694;
  v6[3] = &unk_28F80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)appSignerCount
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_177DC;
  v6[3] = &unk_28F80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)installedProfileCount
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_178E0;
  v6[3] = &unk_28F80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)mdmProfile
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_179FC;
  v11 = sub_17A0C;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_17A14;
  v6[3] = &unk_28F80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)configurationProfiles
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_179FC;
  v11 = sub_17A0C;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_17B08;
  v6[3] = &unk_28F80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSArray)uninstalledProfilesInfo
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_179FC;
  v11 = sub_17A0C;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_17BFC;
  v6[3] = &unk_28F80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)freeDeveloperAppSigners
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_179FC;
  v11 = sub_17A0C;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_17CF0;
  v6[3] = &unk_28F80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)enterpriseAppSigners
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_179FC;
  v11 = sub_17A0C;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_17DE4;
  v6[3] = &unk_28F80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)blockedApplications
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_179FC;
  v11 = sub_17A0C;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_17ED8;
  v6[3] = &unk_28F80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)allDeviceManagementOutMDMProfileInfo:(id *)a3 outConfigurationProfilesInfo:(id *)a4 outUninstalledProfilesInfo:(id *)a5 outEnterpriseAppSigners:(id *)a6 outFreeDevAppSigners:(id *)a7 outBlockedApplications:(id *)a8
{
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_179FC;
  v51 = sub_17A0C;
  id v52 = 0LL;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_179FC;
  v45 = sub_17A0C;
  id v46 = 0LL;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_179FC;
  v39 = sub_17A0C;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_179FC;
  v33 = sub_17A0C;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_179FC;
  v27 = sub_17A0C;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_179FC;
  id v21 = sub_17A0C;
  id v22 = 0LL;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_18178;
  block[3] = &unk_28FA8;
  block[4] = self;
  block[5] = &v47;
  block[6] = &v41;
  block[7] = &v35;
  block[8] = &v29;
  block[9] = &v23;
  block[10] = &v17;
  dispatch_sync(v12, block);

  if (a3) {
    *a3 = (id) v48[5];
  }
  if (a4) {
    *a4 = (id) v42[5];
  }
  if (a5) {
    *a5 = (id) v36[5];
  }
  if (a6) {
    *a6 = (id) v30[5];
  }
  if (a7) {
    *a7 = (id) v24[5];
  }
  if (a8) {
    *a8 = (id) v18[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
}

- (void)reloadAllDataInBackgroundWithCompletion:(id)a3
{
}

- (void)reloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  if (!-[MCUIDataManager isDeviceManagementHidden](self, "isDeviceManagementHidden"))
  {
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager reloadQueue](self, "reloadQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_182F4;
    block[3] = &unk_28FD0;
    block[4] = self;
    BOOL v14 = a3;
    BOOL v15 = a4;
    BOOL v16 = a5;
    id v13 = v10;
    dispatch_async(v11, block);
  }
}

- (void)_reloadQueueReloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  if (!-[MCUIDataManager isDeviceManagementHidden](self, "isDeviceManagementHidden"))
  {
    if (v8)
    {
      if ((MCUIForPairedDevice() & 1) != 0) {
        id v11 = &dword_0 + 2;
      }
      else {
        id v11 = +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType");
      }
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
      id v58 = 0LL;
      v59[0] = 0LL;
      id v57 = 0LL;
      [v14 allProfilesOutMDMProfileInfo:v59 outConfigurationProfilesInfo:&v58 outUninstalledProfilesInfo:&v57 forDeviceType:v11];
      id v32 = v59[0];
      id v13 = v58;
      id v12 = v57;

      NSLog(@"Data manager returned after loading profiles from profiled");
    }

    else
    {
      id v12 = 0LL;
      id v13 = 0LL;
      id v32 = 0LL;
    }

    BOOL v33 = v7;
    if (v7)
    {
      id v56 = 0LL;
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[MCUIAppSigner enterpriseAppSignersWithOutDeveloperAppSigners:]( &OBJC_CLASS___MCUIAppSigner,  "enterpriseAppSignersWithOutDeveloperAppSigners:",  &v56));
      id v16 = v56;
      NSLog( @"Data manager returned after loading %d enterprise app signers and %d developer app signers from LaunchServices",  [v15 count],  objc_msgSend(v16, "count"));
    }

    else
    {
      id v16 = 0LL;
      BOOL v15 = 0LL;
    }

    id v34 = v10;
    if (v6)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[DMCApplicationProxy blockedApplications]( &OBJC_CLASS___DMCApplicationProxy,  "blockedApplications"));
      NSLog( @"Data manager returned after loading %d blocked apps from LaunchServices",  [v17 count]);
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    v18 = v12;
    uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCUIDataManager memberQueue](self, "memberQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1866C;
    block[3] = &unk_28FF8;
    BOOL v53 = v8;
    block[4] = self;
    id v20 = v32;
    id v47 = v20;
    id v21 = v13;
    id v48 = v21;
    id v22 = v18;
    id v49 = v22;
    BOOL v54 = v33;
    id v23 = v15;
    id v50 = v23;
    id v24 = v16;
    id v51 = v24;
    BOOL v55 = v6;
    id v25 = v17;
    id v52 = v25;
    dispatch_sync(v19, block);

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_18704;
    v35[3] = &unk_29020;
    id v41 = v25;
    id v42 = v34;
    id v36 = v20;
    id v37 = v21;
    id v38 = v22;
    id v39 = v23;
    id v40 = v24;
    BOOL v43 = v8;
    BOOL v44 = v33;
    BOOL v45 = v6;
    id v26 = v25;
    id v27 = v24;
    id v28 = v23;
    id v29 = v22;
    id v30 = v21;
    id v31 = v20;
    dispatch_async(&_dispatch_main_q, v35);

    id v10 = v34;
  }
}

- (void)reloadProfilesInBackgroundWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_18940;
  v6[3] = &unk_29048;
  id v7 = a3;
  id v4 = v7;
  dispatch_queue_t v5 = objc_retainBlock(v6);
  -[MCUIDataManager reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:]( self,  "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:",  1LL,  0LL,  0LL,  v5);
}

- (void)reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_189F0;
  v6[3] = &unk_29048;
  id v7 = a3;
  id v4 = v7;
  dispatch_queue_t v5 = objc_retainBlock(v6);
  -[MCUIDataManager reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:]( self,  "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:",  0LL,  1LL,  1LL,  v5);
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (MCProfileInfo)mdmProfileInfo
{
  return self->_mdmProfileInfo;
}

- (void)setMdmProfileInfo:(id)a3
{
}

- (NSArray)configurationProfilesInfo
{
  return self->_configurationProfilesInfo;
}

- (void)setConfigurationProfilesInfo:(id)a3
{
}

- (void)setUninstalledProfilesInfo:(id)a3
{
}

- (void)setFreeDeveloperAppSigners:(id)a3
{
}

- (void)setEnterpriseAppSigners:(id)a3
{
}

- (void)setBlockedApplications:(id)a3
{
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)setAppWorkspace:(id)a3
{
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (void)setReloadQueue:(id)a3
{
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (BOOL)observing
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (int)appsChangedNotifyToken
{
  return self->_appsChangedNotifyToken;
}

- (void)setAppsChangedNotifyToken:(int)a3
{
  self->_appsChangedNotifyToken = a3;
}

- (int)provisioningProfileInstalledToken
{
  return self->_provisioningProfileInstalledToken;
}

- (void)setProvisioningProfileInstalledToken:(int)a3
{
  self->_provisioningProfileInstalledToken = a3;
}

- (int)provisioningProfileRemovedToken
{
  return self->_provisioningProfileRemovedToken;
}

- (void)setProvisioningProfileRemovedToken:(int)a3
{
  self->_provisioningProfileRemovedToken = a3;
}

- (void).cxx_destruct
{
}

@end