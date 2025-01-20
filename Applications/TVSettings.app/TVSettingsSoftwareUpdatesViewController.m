@interface TVSettingsSoftwareUpdatesViewController
+ (id)progressTextFromData:(id)a3;
- (BOOL)_shouldShowInternalSettings;
- (BOOL)_shouldShowUpdateProgressForItem:(id)a3;
- (BOOL)checkingForUpdates;
- (NSArray)availableBetaSeedPrograms;
- (NSString)lastProgressText;
- (PBSAssertion)downloadPriorityAssertion;
- (SDBetaProgram)selectedBetaSeedProgram;
- (TSKSettingItem)advancedSettingsItem;
- (TSKSettingItem)betaSoftwareItem;
- (TSKSettingItem)updateSoftwareItem;
- (TVSettingsSoftwareUpdatesViewController)init;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_handleCheckForUpdates:(BOOL)a3;
- (void)_initializeBetaSeedPrograms;
- (void)_selectBetaSeedProgram;
- (void)_setShouldShowInternalSettings:(BOOL)a3;
- (void)_showConfirmationForEnrollmentInProgram:(id)a3;
- (void)_toggleBetaEnrollment:(id)a3;
- (void)_toggleInternalSettingsItem:(id)a3;
- (void)_updateBetaSoftwareItem:(id)a3;
- (void)_updateInternalSettingsItem:(id)a3;
- (void)_updateSWUpdateItem:(id)a3;
- (void)_updateSWUpdateProgressFromData:(id)a3;
- (void)betaTermsViewController:(id)a3 didAcceptAllTerms:(BOOL)a4;
- (void)checkForUpdates:(id)a3;
- (void)dealloc;
- (void)osUpdateServiceDidFinishCheckWithData:(id)a3;
- (void)osUpdateServiceDidFinishDownloadWithData:(id)a3;
- (void)osUpdateServiceDidStartCheckWithData:(id)a3;
- (void)osUpdateServiceDidStartDownloadWithData:(id)a3;
- (void)osUpdateServiceDidUpdateDownloadProgressWithData:(id)a3;
- (void)setAdvancedSettingsItem:(id)a3;
- (void)setAvailableBetaSeedPrograms:(id)a3;
- (void)setBetaSoftwareItem:(id)a3;
- (void)setCheckingForUpdates:(BOOL)a3;
- (void)setDownloadPriorityAssertion:(id)a3;
- (void)setLastProgressText:(id)a3;
- (void)setSelectedBetaSeedProgram:(id)a3;
- (void)setUpdateSoftwareItem:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsSoftwareUpdatesViewController

- (TVSettingsSoftwareUpdatesViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsSoftwareUpdatesViewController;
  v2 = -[TVSettingsSoftwareUpdatesViewController init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___PBSAssetDownloadPriorityAssertion);
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = -[PBSAssetDownloadPriorityAssertion initWithIdentifier:](v3, "initWithIdentifier:", v6);
    downloadPriorityAssertion = v2->_downloadPriorityAssertion;
    v2->_downloadPriorityAssertion = v7;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsSoftwareUpdatesViewController;
  -[TVSettingsSoftwareUpdatesViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateService sharedInstance](&OBJC_CLASS___PBSOSUpdateService, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100022768;
  v9[3] = &unk_10018F430;
  objc_copyWeak(&v10, &location);
  [v3 isUpdateRunningWithCompletion:v9];

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsSoftwareUpdatesViewController;
  -[TVSettingsSoftwareUpdatesViewController viewDidLoad](&v8, "viewDidLoad");
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController defaultPreviewViewController]( self,  "defaultPreviewViewController"));
  LODWORD(v5) = 0;
  [v4 setProgress:0 animated:v5];

  v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_toggleInternalSettingsItem:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", &off_1001AEB30);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v6, "setNumberOfTapsRequired:", 4LL);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", &__NSArray0__struct);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController tableView](self, "tableView"));
  [v7 addGestureRecognizer:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsSoftwareUpdatesViewController;
  -[TVSettingsSoftwareUpdatesViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateService sharedInstance](&OBJC_CLASS___PBSOSUpdateService, "sharedInstance"));
  [v4 setDelegate:self];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController downloadPriorityAssertion](self, "downloadPriorityAssertion"));
  [v5 acquire];

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController defaultPreviewViewController]( self,  "defaultPreviewViewController"));
  LODWORD(v7) = 0;
  [v6 setProgress:0 animated:v7];

  -[TVSettingsSoftwareUpdatesViewController setSelectedBetaSeedProgram:](self, "setSelectedBetaSeedProgram:", 0LL);
  -[TVSettingsSoftwareUpdatesViewController _initializeBetaSeedPrograms](self, "_initializeBetaSeedPrograms");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsSoftwareUpdatesViewController;
  -[TVSettingsSoftwareUpdatesViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateService sharedInstance](&OBJC_CLASS___PBSOSUpdateService, "sharedInstance"));
  [v4 setDelegate:0];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController downloadPriorityAssertion](self, "downloadPriorityAssertion"));
  [v5 relinquish];
}

- (id)loadSettingGroups
{
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  objc_super v3 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v30 = v3;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  double v5 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
  uint64_t v6 = TSKLocString(@"OSUpdateSoftwareTitle");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v7,  0LL,  0LL,  0LL,  self,  "checkForUpdates:"));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100022DD8;
  v27[3] = &unk_10018E9B0;
  objc_copyWeak(&v28, &location);
  [v8 setUpdateBlock:v27];
  [v5 addObject:v8];
  objc_storeWeak((id *)&self->_updateSoftwareItem, v8);
  uint64_t v9 = TSKLocString(@"OSUpdateAutomaticallyTitle");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = TSKLocString(@"OSUpdateAutomaticallyDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v10,  v12,  v22,  @"updateSoftwareAutomatically",  0LL,  0LL));

  [v5 addObject:v13];
  uint64_t v14 = TSKLocString(@"OSBetaSoftwareUpdatesTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v15,  0LL,  0LL,  0LL,  self,  "_toggleBetaEnrollment:"));

  v17 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController availableBetaSeedPrograms]( self,  "availableBetaSeedPrograms"));
  objc_msgSend(v16, "setHidden:", objc_msgSend(v17, "count") == 0);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100022E20;
  v25[3] = &unk_10018E9B0;
  objc_copyWeak(&v26, &location);
  [v16 setUpdateBlock:v25];
  [v5 addObject:v16];
  objc_storeWeak((id *)&self->_betaSoftwareItem, v16);
  id v18 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  @"Internal Settings",  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsOSUpdateInternalSettingsViewController));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  objc_msgSend( v19,  "setHidden:",  -[TVSettingsSoftwareUpdatesViewController _shouldShowInternalSettings]( self,  "_shouldShowInternalSettings") ^ 1);
  [v19 setLocalizedDescription:@"Configure settings for internal and carry updates."];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100022E68;
  v23[3] = &unk_10018E9B0;
  objc_copyWeak(&v24, &location);
  [v19 setUpdateBlock:v23];
  [v5 addObject:v19];
  objc_storeWeak((id *)&self->_advancedSettingsItem, v19);
  -[TSKSettingGroup setSettingItems:](v3, "setSettingItems:", v5);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&location);
  return v21;
}

+ (id)progressTextFromData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_safeNumberForKey:", PBSOSUpdateServiceKeyProgressTime));
  [v4 doubleValue];
  double v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_safeNumberForKey:", PBSOSUpdateServiceKeyProgressIsQueued));
  id v8 = objc_msgSend( v3,  "bs_safeObjectForKey:ofType:",  PBSOSUpdateServiceKeyCurrentDownload,  objc_opt_class(PBSOSUpdateDownload));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 progress]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 phase]);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 descriptor]);
    [v13 updateType];
  }

  else
  {
    v12 = 0LL;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_safeNumberForKey:", PBSOSUpdateServiceKeyIsRedownload));
  unsigned int v15 = [v14 BOOLValue];

  uint64_t v16 = kPBSOSUpdatePhasePreparing;
  unsigned int v17 = [v12 isEqualToString:kPBSOSUpdatePhasePreparing];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v19 = v18;
  v20 = @"OSUpdateOperationDownloadingText";
  if (v15) {
    v20 = @"OSUpdateOperationRedownloadingText";
  }
  id v21 = @"OSUpdateOperationPreparingAfterRedownloadText";
  if (!v15) {
    id v21 = @"OSUpdateOperationPreparingText";
  }
  if (v17) {
    v22 = v21;
  }
  else {
    v22 = v20;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedStringForKey:v22 value:&stru_100195DD8 table:0]);

  if ([v7 BOOLValue])
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"OSUpdateDownloadQueuedText" value:&stru_100195DD8 table:0]);

    id v26 = 0LL;
  }

  else
  {
    if (v6 <= 0.0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"OSUpdateDownloadEstimatingText" value:&stru_100195DD8 table:0]);
    }

    else
    {
      if (qword_1001E15D8 != -1) {
        dispatch_once(&qword_1001E15D8, &stru_10018F450);
      }
      id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001E15D0, "stringFromTimeInterval:", fmax(v6, 60.0)));
    }

    v25 = 0LL;
  }

  if ([v12 isEqualToString:v16] && OTAImplementationType() == 2)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 localizedStringForKey:@"OSUpdateOperationPreparingProgressText" value:&stru_100195DD8 table:0]);
  }

  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:@"OSUpdateOperationEstimatedTimeRemainingText" value:&stru_100195DD8 table:0]);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v28, v23, v26));
  }

  return v29;
}

- (void)checkForUpdates:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 osUpdateServiceProxy]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002335C;
  v7[3] = &unk_10018F430;
  objc_copyWeak(&v8, &location);
  [v6 isCheckingForUpdates:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleCheckForUpdates:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = TSKLocString(@"OSUpdateSoftwareTitle");
    double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = TSKLocString(@"OSUpdateCancelText");
    double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v7,  1LL));

    uint64_t v8 = TSKLocString(@"OSUpdateContinue");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  0LL,  0LL));

    [v17 addAction:v10];
    uint64_t v11 = TSKLocString(@"OSUpdateCancel");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  &stru_10018F470));

    [v17 addAction:v13];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController navigationController](self, "navigationController"));
    [v14 presentViewController:v17 animated:1 completion:0];
  }

  else
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 osUpdateServiceProxy]);
    [v16 checkForUpdate];

    -[TVSettingsSoftwareUpdatesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsSoftwareUpdatesViewController;
  id v5 = -[TVSettingsSoftwareUpdatesViewController previewForItemAtIndexPath:](&v10, "previewForItemAtIndexPath:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v4));
    objc_msgSend( v6,  "setShouldShowProgress:",  -[TVSettingsSoftwareUpdatesViewController _shouldShowUpdateProgressForItem:]( self,  "_shouldShowUpdateProgressForItem:",  v8));
  }

  return v6;
}

- (void)osUpdateServiceDidStartCheckWithData:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000237E8;
  v3[3] = &unk_10018E440;
  v3[4] = self;
  TVSPerformBlockOnMainThread(v3);
}

- (void)osUpdateServiceDidFinishCheckWithData:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100023864;
  v3[3] = &unk_10018E440;
  v3[4] = self;
  TVSPerformBlockOnMainThread(v3);
}

- (void)osUpdateServiceDidStartDownloadWithData:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000238E0;
  v3[3] = &unk_10018E440;
  v3[4] = self;
  TVSPerformBlockOnMainThread(v3);
}

- (void)osUpdateServiceDidUpdateDownloadProgressWithData:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000239A0;
  v4[3] = &unk_10018E468;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  TVSPerformBlockOnMainThread(v4);
}

- (void)osUpdateServiceDidFinishDownloadWithData:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000239FC;
  v3[3] = &unk_10018E440;
  v3[4] = self;
  TVSPerformBlockOnMainThread(v3);
}

- (void)betaTermsViewController:(id)a3 didAcceptAllTerms:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDBetaManager sharedManager](&OBJC_CLASS___SDBetaManager, "sharedManager", a3));
  uint64_t v7 = v6;
  if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController selectedBetaSeedProgram](self, "selectedBetaSeedProgram"));
    unsigned int v9 = [v7 enrollInBetaProgram:v8];

    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController selectedBetaSeedProgram]( self,  "selectedBetaSeedProgram"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
        int v12 = 138412290;
        v13 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Enrolled this Apple TV in the %@ program.",  (uint8_t *)&v12,  0xCu);
      }

      -[TVSettingsSoftwareUpdatesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
      -[TVSettingsSoftwareUpdatesViewController checkForUpdates:](self, "checkForUpdates:", 0LL);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000F6CDC(self);
      }
      -[TVSettingsSoftwareUpdatesViewController setSelectedBetaSeedProgram:](self, "setSelectedBetaSeedProgram:", 0LL);
    }
  }

  else
  {
    [v6 declinedLegal];

    -[TVSettingsSoftwareUpdatesViewController setSelectedBetaSeedProgram:](self, "setSelectedBetaSeedProgram:", 0LL);
  }

- (void)_toggleInternalSettingsItem:(id)a3
{
}

- (void)_updateInternalSettingsItem:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_advancedSettingsItem);
  objc_msgSend( WeakRetained,  "setHidden:",  -[TVSettingsSoftwareUpdatesViewController _shouldShowInternalSettings]( self,  "_shouldShowInternalSettings") ^ 1);
}

- (void)_updateSWUpdateItem:(id)a3
{
  id v23 = a3;
  unint64_t v4 = (unint64_t)[v23 accessoryTypes];
  if (-[TVSettingsSoftwareUpdatesViewController checkingForUpdates](self, "checkingForUpdates") != ((v4 >> 2) & 1)) {
    [v23 setAccessoryTypes:v4 ^ 4];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 systemName]);

  uint64_t v7 = TSKLocString(@"OSUpdateSystemVersionFormat");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 systemSoftwareVersion]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v6, v10));

  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastCheckDate]);

  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v13,  3LL,  2LL));
    uint64_t v15 = TSKLocString(@"OSUpdateLastCheckDate");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v16, v14));

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v11, v17));
    uint64_t v11 = (void *)v18;
  }

  uint64_t v19 = objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController lastProgressText](self, "lastProgressText"));
  v20 = (void *)v19;
  if (v19) {
    id v21 = (void *)v19;
  }
  else {
    id v21 = v11;
  }
  id v22 = v21;

  [v23 setLocalizedDescription:v22];
}

- (void)_updateSWUpdateProgressFromData:(id)a3
{
  id v13 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsSoftwareUpdatesViewController progressTextFromData:]( &OBJC_CLASS___TVSettingsSoftwareUpdatesViewController,  "progressTextFromData:"));
  -[TVSettingsSoftwareUpdatesViewController setLastProgressText:](self, "setLastProgressText:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController indexPathForLastFocusedItem]( self,  "indexPathForLastFocusedItem"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v5));
  if (-[TVSettingsSoftwareUpdatesViewController _shouldShowUpdateProgressForItem:]( self,  "_shouldShowUpdateProgressForItem:",  v6))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController defaultPreviewViewController]( self,  "defaultPreviewViewController"));
    [v7 setDescriptionText:v4];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bs_safeNumberForKey:", PBSOSUpdateServiceKeyProgressAmount));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController defaultPreviewViewController]( self,  "defaultPreviewViewController"));
    [v8 floatValue];
    *(float *)&double v11 = v10 / 100.0;
    [v9 setProgress:v11];

    int v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController defaultPreviewViewController]( self,  "defaultPreviewViewController"));
    [v12 setShouldShowProgress:1];

    -[TVSettingsSoftwareUpdatesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }
}

- (BOOL)_shouldShowUpdateProgressForItem:(id)a3
{
  p_updateSoftwareItem = &self->_updateSoftwareItem;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_updateSoftwareItem);

  if (WeakRetained == v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController lastProgressText](self, "lastProgressText"));
    BOOL v7 = [v8 length] != 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_initializeBetaSeedPrograms
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDBetaManager sharedManager](&OBJC_CLASS___SDBetaManager, "sharedManager"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 availableBetaPrograms]);
  -[TVSettingsSoftwareUpdatesViewController setAvailableBetaSeedPrograms:](self, "setAvailableBetaSeedPrograms:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController availableBetaSeedPrograms](self, "availableBetaSeedPrograms"));
  id v6 = [v5 count];

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = (_DWORD)v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%u available beta software programs.",  (uint8_t *)&buf,  8u);
    }
  }

  else
  {
    objc_initWeak(&buf, self);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDBetaManager sharedManager](&OBJC_CLASS___SDBetaManager, "sharedManager"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000241C0;
    v8[3] = &unk_10018F498;
    objc_copyWeak(&v9, &buf);
    [v7 queryProgramsForSystemAccountsWithCompletion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&buf);
  }

- (void)_updateBetaSoftwareItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDBetaManager sharedManager](&OBJC_CLASS___SDBetaManager, "sharedManager"));
  unsigned int v6 = [v5 isEnrolledInBetaProgram];

  if (v6) {
    BOOL v7 = @"OSBetaSoftwareUpdatesOnValue";
  }
  else {
    BOOL v7 = @"OSBetaSoftwareUpdatesOffValue";
  }
  if (v6) {
    uint64_t v8 = @"OSBetaSoftwareUpdatesEnrolledInfoText";
  }
  else {
    uint64_t v8 = @"OSBetaSoftwareUpdatesUnenrolledInfoText";
  }
  uint64_t v9 = TSKLocString(v7);
  float v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v4 setLocalizedValue:v10];

  uint64_t v11 = TSKLocString(v8);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v4 setLocalizedDescription:v12];

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController availableBetaSeedPrograms](self, "availableBetaSeedPrograms"));
  objc_msgSend(v4, "setHidden:", objc_msgSend(v13, "count") == 0);
}

- (void)_toggleBetaEnrollment:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDBetaManager sharedManager](&OBJC_CLASS___SDBetaManager, "sharedManager", a3));
  unsigned int v5 = [v4 isEnrolledInBetaProgram];

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDBetaManager sharedManager](&OBJC_CLASS___SDBetaManager, "sharedManager"));
    [v6 unenrollFromBetaProgram];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Un-enrolled this Apple TV from the beta software program.",  v7,  2u);
    }

    -[TVSettingsSoftwareUpdatesViewController setSelectedBetaSeedProgram:](self, "setSelectedBetaSeedProgram:", 0LL);
    -[TVSettingsSoftwareUpdatesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  else
  {
    -[TVSettingsSoftwareUpdatesViewController _selectBetaSeedProgram](self, "_selectBetaSeedProgram");
  }

- (void)_selectBetaSeedProgram
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController availableBetaSeedPrograms](self, "availableBetaSeedPrograms"));
  id v3 = [v2 count];

  if (v3)
  {
    if (v3 == (id)1)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController availableBetaSeedPrograms]( self,  "availableBetaSeedPrograms"));
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
      -[TVSettingsSoftwareUpdatesViewController setSelectedBetaSeedProgram:](self, "setSelectedBetaSeedProgram:", v5);

      id v20 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController selectedBetaSeedProgram](self, "selectedBetaSeedProgram"));
      -[TVSettingsSoftwareUpdatesViewController _showConfirmationForEnrollmentInProgram:]( self,  "_showConfirmationForEnrollmentInProgram:",  v20);
    }

    else
    {
      objc_initWeak(&location, self);
      id v21 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  0LL,  1LL));
      uint64_t v6 = TSKLocString(@"OSBetaSoftwareSelectionMessage");
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      [v21 setMessage:v7];

      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSoftwareUpdatesViewController availableBetaSeedPrograms]( self,  "availableBetaSeedPrograms"));
      id v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v29;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v8);
            }
            int v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
            if ([v13 length])
            {
              v26[0] = _NSConcreteStackBlock;
              v26[1] = 3221225472LL;
              v26[2] = sub_1000248BC;
              v26[3] = &unk_10018F4C0;
              objc_copyWeak(&v27, &location);
              v26[4] = v12;
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  v26));
              [v21 addAction:v14];

              objc_destroyWeak(&v27);
            }

            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              sub_1000F6D80(&buf, v25);
            }
          }

          id v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }

        while (v9);
      }

      uint64_t v15 = TSKLocString(@"OSBetaSoftwareEnrollCancelItem");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100024904;
      v22[3] = &unk_10018F4E8;
      objc_copyWeak(&v23, &location);
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  v22));

      [v21 addAction:v17];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController navigationController](self, "navigationController"));
      [v18 presentViewController:v21 animated:1 completion:0];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }

- (void)_showConfirmationForEnrollmentInProgram:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  0LL,  1LL));
  uint64_t v6 = TSKLocString(@"OSBetaSoftwareEnrollConfirmMessage");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

  [v5 setMessage:v9];
  uint64_t v10 = TSKLocString(@"OSBetaSoftwareEnrollItem");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100024BD8;
  v20[3] = &unk_10018F4C0;
  objc_copyWeak(&v22, &location);
  id v12 = v4;
  id v21 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v20));

  [v5 addAction:v13];
  uint64_t v14 = TSKLocString(@"OSBetaSoftwareEnrollCancelItem");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100024C8C;
  v18[3] = &unk_10018F4E8;
  objc_copyWeak(&v19, &location);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  v18));

  [v5 addAction:v16];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSoftwareUpdatesViewController navigationController](self, "navigationController"));
  [v17 presentViewController:v5 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

- (BOOL)_shouldShowInternalSettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:", v3));

  LOBYTE(v2) = [v4 BOOLForKey:@"OSUpdateInternalSettingsEnabled" defaultValue:0];
  return (char)v2;
}

- (void)_setShouldShowInternalSettings:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:", v5));

  if ([v6 BOOLForKey:@"OSUpdateInternalSettingsEnabled" defaultValue:0] != v3)
  {
    [v6 setBool:v3 forKey:@"OSUpdateInternalSettingsEnabled"];
    [v6 synchronize];
  }
}

- (BOOL)checkingForUpdates
{
  return self->_checkingForUpdates;
}

- (void)setCheckingForUpdates:(BOOL)a3
{
  self->_checkingForUpdates = a3;
}

- (PBSAssertion)downloadPriorityAssertion
{
  return self->_downloadPriorityAssertion;
}

- (void)setDownloadPriorityAssertion:(id)a3
{
}

- (NSString)lastProgressText
{
  return self->_lastProgressText;
}

- (void)setLastProgressText:(id)a3
{
}

- (TSKSettingItem)advancedSettingsItem
{
  return (TSKSettingItem *)objc_loadWeakRetained((id *)&self->_advancedSettingsItem);
}

- (void)setAdvancedSettingsItem:(id)a3
{
}

- (TSKSettingItem)updateSoftwareItem
{
  return (TSKSettingItem *)objc_loadWeakRetained((id *)&self->_updateSoftwareItem);
}

- (void)setUpdateSoftwareItem:(id)a3
{
}

- (TSKSettingItem)betaSoftwareItem
{
  return (TSKSettingItem *)objc_loadWeakRetained((id *)&self->_betaSoftwareItem);
}

- (void)setBetaSoftwareItem:(id)a3
{
}

- (SDBetaProgram)selectedBetaSeedProgram
{
  return self->_selectedBetaSeedProgram;
}

- (void)setSelectedBetaSeedProgram:(id)a3
{
}

- (NSArray)availableBetaSeedPrograms
{
  return self->_availableBetaSeedPrograms;
}

- (void)setAvailableBetaSeedPrograms:(id)a3
{
}

- (void).cxx_destruct
{
}

@end