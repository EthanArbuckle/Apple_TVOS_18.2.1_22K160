@interface SDAirDropHandlerGenericFiles
- (BOOL)isBundleiWorkType:(id)a3;
- (BOOL)shouldEndAfterOpen;
- (BOOL)shouldOpenAutomaticallyAfterUserAccepts;
- (LSBundleProxy)selectedApplication;
- (NSArray)availableApplications;
- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3;
- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3 bundleIdentifier:(id)a4;
- (id)actionForBundleProxy:(id)a3;
- (id)actionsForModernReadyForOpen;
- (id)cancelActionTitleToAccompanyActions:(id)a3;
- (id)defaultFolder;
- (id)defaultOpenActionBundleID;
- (id)firstReceivedFilename;
- (id)saveToDefaultFolderWithError:(id *)a3;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)acceptActionTriggered;
- (void)addOpenWithActions;
- (void)launchFilesToDefaultFolder;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
- (void)performActionWithBundleProxy:(id)a3 completionHandler:(id)a4;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)saveAndUpdateTransfer;
- (void)setAvailableApplications:(id)a3;
- (void)setSelectedApplication:(id)a3;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerGenericFiles

- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3
{
  return -[SDAirDropHandlerGenericFiles initWithTransfer:bundleIdentifier:]( self,  "initWithTransfer:bundleIdentifier:",  a3,  0LL);
}

- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerGenericFiles;
  v7 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v13, "initWithTransfer:bundleIdentifier:", v6, a4);
  if (v7)
  {
    v8 = -[SDAirDropHandleriCloudDrive initWithTransfer:]( objc_alloc(&OBJC_CLASS___SDAirDropHandleriCloudDrive),  "initWithTransfer:",  v6);
    icloudDriveHandler = v7->_icloudDriveHandler;
    v7->_icloudDriveHandler = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    workOperationsQueue = v7->_workOperationsQueue;
    v7->_workOperationsQueue = v10;

    -[NSOperationQueue setMaxConcurrentOperationCount:]( v7->_workOperationsQueue,  "setMaxConcurrentOperationCount:",  1LL);
  }

  return v7;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, SDAirDropHandlerImportResult *, void))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v7 setCompletedURLs:v9];

  if (+[SFAirDropUserDefaults_objc moveToAppEnabled]( &OBJC_CLASS___SFAirDropUserDefaults_objc,  "moveToAppEnabled")) {
    -[SDAirDropHandlerGenericFiles shouldEndAfterOpen](self, "shouldEndAfterOpen");
  }
  v8 = objc_alloc_init(&OBJC_CLASS___SDAirDropHandlerImportResult);
  -[SDAirDropHandlerImportResult setImportedFiles:](v8, "setImportedFiles:", v9);
  v6[2](v6, v8, 0LL);
}

- (BOOL)isBundleiWorkType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.Keynote"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.Pages"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.Numbers"];
  }

  return v4;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerGenericFiles;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x1000000;
}

- (id)firstReceivedFilename
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 metaData]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rawFiles]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSFOperationFileNameKey]);

  return v6;
}

- (id)suitableContentsDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  unint64_t v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  if (v4 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles firstReceivedFilename](self, "firstReceivedFilename"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  &off_1005FADF0));
    unsigned int v7 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    uint64_t v9 = SFLocalizedStringForKey(v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v7) {
      v11 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v10, v5, v22);
    }
    else {
      v11 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v10, v3, v5);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    unint64_t v12 = v4;
    v23 = @"GENERIC_FILE";
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
    v24 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v25 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:]( self,  "alertMessageLocalizedKeyForTypeDicts:",  v15));

    LODWORD(v14) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    uint64_t v17 = SFLocalizedStringForKey(v6, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((_DWORD)v14) {
      v19 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v18, v12, v22);
    }
    else {
      v19 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v18, v3, v12);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }

  return v20;
}

- (void)updatePossibleActions
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerGenericFiles;
  -[SDAirDropHandler updatePossibleActions](&v28, "updatePossibleActions");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  if ([v3 userResponse] != (id)1)
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler handlingAppBundleID](self, "handlingAppBundleID"));
    if (SFRemovableSystemAppAvailable(v4))
    {
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler handlingAppBundleID](self, "handlingAppBundleID"));
      BOOL v7 = v6 == 0LL;

      if (!v7) {
        return;
      }
    }

    uint64_t v8 = (objc_class *)objc_opt_class(self, v5);
    uint64_t v9 = NSStringFromClass(v8);
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v10 = objc_alloc(&OBJC_CLASS___SFAirDropAction);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    uint64_t v14 = SFLocalizedStringForKey(@"ACCEPT_BUTTON_TITLE", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    uint64_t v17 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:]( v10,  "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:",  v12,  v3,  v15,  v16,  1LL);

    id location = 0LL;
    objc_initWeak(&location, self);
    uint64_t v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472LL;
    v24 = sub_1000A26F0;
    v25 = &unk_1005CB070;
    objc_copyWeak(&v26, &location);
    -[SFAirDropAction setActionHandler:](v17, "setActionHandler:", &v22);
    if (+[SFAirDropUserDefaults_objc moveToAppEnabled]( &OBJC_CLASS___SFAirDropUserDefaults_objc,  "moveToAppEnabled",  v22,  v23,  v24,  v25))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultOpenActionBundleID](self, "defaultOpenActionBundleID"));
      BOOL v19 = v18 == 0LL;
    }

    else
    {
      BOOL v19 = 1LL;
    }

    -[SFAirDropAction setRequiresUnlockedUI:](v17, "setRequiresUnlockedUI:", v19);
    v29 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    [v21 setPossibleActions:v20];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  if (self->_willUseOpenWithAlert)
  {
    uint64_t v3 = SFLocalizedStringForKey(@"CANCEL_BUTTON_TITLE", a2);
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___SDAirDropHandlerGenericFiles;
    id v5 = -[SDAirDropHandler cancelActionTitleToAccompanyActions:](&v7, "cancelActionTitleToAccompanyActions:", a3);
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return v4;
}

- (id)actionForBundleProxy:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v4));
  [v5 setMinRequiredTransferState:6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A281C;
  v8[3] = &unk_1005CD3F0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 setActionHandler:v8];

  return v5;
}

- (BOOL)shouldOpenAutomaticallyAfterUserAccepts
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles availableApplications](self, "availableApplications"));
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles availableApplications](self, "availableApplications"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 firstObject]);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);

    LODWORD(v5) = [v7 hasPrefix:@"com.apple."];
    int v8 = v5 & ([v7 isEqualToString:@"com.apple.TapToRadar"] ^ 1);
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)acceptActionTriggered
{
  if (+[SFAirDropUserDefaults_objc moveToAppEnabled]( &OBJC_CLASS___SFAirDropUserDefaults_objc,  "moveToAppEnabled")
    && (uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultOpenActionBundleID](self, "defaultOpenActionBundleID")),
        v3,
        v3))
  {
    -[SDAirDropHandlerGenericFiles saveAndUpdateTransfer](self, "saveAndUpdateTransfer");
  }

  else if (-[SDAirDropHandlerGenericFiles shouldOpenAutomaticallyAfterUserAccepts]( self,  "shouldOpenAutomaticallyAfterUserAccepts"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles availableApplications](self, "availableApplications"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles actionForBundleProxy:](self, "actionForBundleProxy:", v5));

    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v7 actionHandler]);
    v6[2](v6, 0LL);
  }

  else
  {
    -[SDAirDropHandlerGenericFiles addOpenWithActions](self, "addOpenWithActions");
    self->_willUseOpenWithAlert = 1;
  }

- (void)addOpenWithActions
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = self->_availableApplications;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    int v8 = 1;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles actionForBundleProxy:](self, "actionForBundleProxy:", v10, (void)v17));
        -[NSMutableArray addObject:](v3, "addObject:", v11);

        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
        LODWORD(v11) = [v12 isEqualToString:@"com.apple.DocumentsApp"];

        v8 &= v11 ^ 1;
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v6);
  }

  else
  {
    int v8 = 1;
  }

  if (-[SDAirDropHandleriCloudDrive canHandleTransfer](self->_icloudDriveHandler, "canHandleTransfer")) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    -[SDAirDropHandleriCloudDrive setUseOpenWithText:](self->_icloudDriveHandler, "setUseOpenWithText:", 0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
    -[SDAirDropHandler setCompletionHandler:](self->_icloudDriveHandler, "setCompletionHandler:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive action](self->_icloudDriveHandler, "action"));
    -[NSMutableArray addObject:](v3, "addObject:", v15);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", (void)v17));
  [v16 setPossibleActions:v3];
}

- (void)performActionWithBundleProxy:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler applicationProxyForBundleProxy:](self, "applicationProxyForBundleProxy:", a3));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 appState]);
  if (([v9 isInstalled] & 1) == 0)
  {

    goto LABEL_14;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 appState]);
  unsigned int v11 = [v10 isRestricted];

  if (v11)
  {
LABEL_14:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 completedURLs]);
    objc_super v28 = (void *)objc_claimAutoreleasedReturnValue([v27 firstObject]);
    [v25 _LSFailedToOpenURL:v28 withBundle:v8];

    v6[2](v6, 1LL);
    goto LABEL_15;
  }

  v30 = v7;
  v29 = v6;
  v33 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 completedURLs]);

  id obj = v13;
  id v14 = [v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v38;
    uint64_t v17 = LSMoveDocumentOnOpenKey;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v45 = v17;
        v46 = &__kCFBooleanTrue;
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
        v21 = (void *)objc_claimAutoreleasedReturnValue( [v32 operationToOpenResource:v19 usingApplication:v8 uniqueDocumentIdentifier:0 userInfo:v20 delegate:self]);
        uint64_t v22 = airdrop_log(v21);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v42 = v30;
          __int16 v43 = 2112;
          uint64_t v44 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enqueuing resource open operation for %@, with URL: %@",  buf,  0x16u);
        }

        -[NSMutableArray addObject:](v33, "addObject:", v21);
        -[SDAirDropHandler logReceiverBundleID:forAppProxy:andURL:]( self,  "logReceiverBundleID:forAppProxy:andURL:",  v8,  0LL,  0LL);
      }

      id v15 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    }

    while (v15);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v33, "lastObject"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000A3058;
  v34[3] = &unk_1005CB830;
  uint64_t v7 = v30;
  id v35 = v30;
  id v6 = v29;
  v36 = v29;
  [v24 setCompletionBlock:v34];

  -[NSOperationQueue addOperations:waitUntilFinished:]( self->_workOperationsQueue,  "addOperations:waitUntilFinished:",  v33,  0LL);
LABEL_15:
}

- (id)defaultOpenActionBundleID
{
  return @"com.apple.DocumentsApp";
}

- (void)saveAndUpdateTransfer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[SDAirDropHandlerGenericFiles saveToDefaultFolderWithError:]( self,  "saveToDefaultFolderWithError:",  0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v4 setCompletedURLs:v3];

  id v5 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue( -[SDAirDropHandler updateTransferStateHandler]( self,  "updateTransferStateHandler"));
  v5[2](v5, 7LL);
}

- (id)defaultFolder
{
  if (!-[SDAirDropHandleriCloudDrive iCloudDriveIsAccessible](self->_icloudDriveHandler, "iCloudDriveIsAccessible")
    || (uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive iCloudDriveURL](self->_icloudDriveHandler, "iCloudDriveURL")),
        v3,
        !v3)
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive iCloudDriveURL](self->_icloudDriveHandler, "iCloudDriveURL")),
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"Downloads" isDirectory:1]),
        v4,
        !v5))
  {
    id v6 = sub_100115790();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

- (id)saveToDefaultFolderWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultFolder](self, "defaultFolder"));
  uint64_t v6 = airdrop_log(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      int v18 = 138412546;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Saving files to %@ for transfer %@",  (uint8_t *)&v18,  0x16u);
    }

    LOBYTE(v18) = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 completedURLs]);
    id v12 = sub_100115D18(v11, v5, &v18, a3);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (!(_BYTE)v18)
    {
      uint64_t v15 = airdrop_log(v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000A38B0((uint64_t)v5, self);
      }
    }
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000A3824(self);
    }

    BOOL v13 = &__NSArray0__struct;
  }

  return v13;
}

- (void)launchFilesToDefaultFolder
{
  uint64_t v3 = (void *)objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 completedURLs]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultFolder](self, "defaultFolder"));
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A3494;
  v8[3] = &unk_1005CBBF8;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A34A0;
  v7[3] = &unk_1005CB008;
  [v3 launchFilesToDefaultFolderWithURLs:v5 defaultFolder:v6 openURLs:v8 completion:v7];
}

- (id)actionsForModernReadyForOpen
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultOpenActionBundleID](self, "defaultOpenActionBundleID"));

  if (v2) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  else {
    uint64_t v3 = &__NSArray0__struct;
  }
  return v3;
}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  id v5 = a4;
  uint64_t v6 = airdrop_log(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles selectedApplication](self, "selectedApplication"));
    int v9 = 136315650;
    v10 = "-[SDAirDropHandlerGenericFiles openResourceOperation:didFinishCopyingResource:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %@ to %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)openResourceOperationDidComplete:(id)a3
{
  uint64_t v4 = airdrop_log(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles selectedApplication](self, "selectedApplication"));
    int v7 = 136315394;
    int v8 = "-[SDAirDropHandlerGenericFiles openResourceOperationDidComplete:]";
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = airdrop_log(v5);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000A3958(self);
  }
}

- (NSArray)availableApplications
{
  return self->_availableApplications;
}

- (void)setAvailableApplications:(id)a3
{
}

- (LSBundleProxy)selectedApplication
{
  return self->_selectedApplication;
}

- (void)setSelectedApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end