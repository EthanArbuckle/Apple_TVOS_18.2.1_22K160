@interface SDAirDropHandler
+ (id)alertMessageLocalizedKeyForTypeDicts:(id)a3 senderIsMe:(BOOL)a4 isVerifiableIdentity:(BOOL)a5 isModernProgress:(BOOL)a6 transferState:(unint64_t)a7;
+ (id)persistedTransfersBaseURL;
+ (id)transferURLForTransfer:(id)a3;
+ (void)logReceiverBundleID:(id)a3 forURL:(id)a4;
- (BOOL)canAutoAccept;
- (BOOL)canHandleTransfer;
- (BOOL)handlingAppInstalled;
- (BOOL)hasFiles;
- (BOOL)hasLinks;
- (BOOL)isActivated;
- (BOOL)isJustFiles;
- (BOOL)isJustLinks;
- (BOOL)isModernProgress;
- (BOOL)openURLs:(id)a3;
- (BOOL)openURLs:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)shouldEndAfterOpen;
- (BOOL)supportsAutoOpen;
- (LSBundleProxy)bundleProxy;
- (NSString)defaultOpenActionBundleID;
- (NSString)handlingAppBundleID;
- (NSString)senderName;
- (NSString)singleItemActionTitle;
- (NSString)suitableContentsDescription;
- (NSString)suitableContentsTitle;
- (SDAirDropHandler)init;
- (SDAirDropHandler)initWithTransfer:(id)a3;
- (SDAirDropHandler)initWithTransfer:(id)a3 bundleIdentifier:(id)a4;
- (SFAirDropTransfer)transfer;
- (id)actionsForModernReadyForOpen;
- (id)alertMessageLocalizedKeyForTypeDicts:(id)a3;
- (id)applicationProxyForBundleProxy:(id)a3;
- (id)bundleProxyFromCandidateIdentifiers:(id)a3 handlesURL:(id)a4;
- (id)cancelActionTitleToAccompanyActions:(id)a3;
- (id)completionHandler;
- (id)defaultActionForBundleProxy:(id)a3;
- (id)defaultFolder;
- (id)description;
- (id)moveToShareSheetCompletion;
- (id)updateTransferStateHandler;
- (int64_t)transferTypes;
- (unint64_t)totalSharedItemsCount;
- (void)actionSelected:(id)a3;
- (void)activate;
- (void)addStatusMonitorObservers;
- (void)dealloc;
- (void)logReceiverBundleID:(id)a3 forAppProxy:(id)a4 andURL:(id)a5;
- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4;
- (void)performOpenSharesheetActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4;
- (void)performViewActionWithURLs:(id)a3;
- (void)prepareForAcceptWithCompletion:(id)a3;
- (void)prepareOrPerformOpenAction;
- (void)removeItemAtURLToFreeUpSpace:(id)a3;
- (void)removeNotificationObservers;
- (void)setBundleProxy:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setHandlingAppBundleID:(id)a3;
- (void)setHandlingAppInstalled:(BOOL)a3;
- (void)setIsActivated:(BOOL)a3;
- (void)setMoveToShareSheetCompletion:(id)a3;
- (void)setTransfer:(id)a3;
- (void)setUpdateTransferStateHandler:(id)a3;
- (void)transferUpdated;
- (void)triggerSelectedActionIfAppropriate;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandler

- (SDAirDropHandler)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = (objc_class *)objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSGenericException,  @"%@ is not a valid initializer for %@",  v4,  v8);

  return -[SDAirDropHandler initWithTransfer:](self, "initWithTransfer:", 0LL);
}

- (SDAirDropHandler)initWithTransfer:(id)a3
{
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](self, "initWithTransfer:bundleIdentifier:", a3, 0LL);
}

- (SDAirDropHandler)initWithTransfer:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SDAirDropHandler;
  v8 = -[SDAirDropHandler init](&v24, "init");
  v9 = v8;
  if (!v8) {
    goto LABEL_20;
  }
  -[SDAirDropHandler setTransfer:](v8, "setTransfer:", v6);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metaData", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 items]);

  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (!v9->_hasFiles) {
          v9->_hasFiles = [*(id *)(*((void *)&v20 + 1) + 8 * (void)i) isFile];
        }
        if (!v9->_hasLinks) {
          v9->_hasLinks = [v16 isFile] ^ 1;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v13);
  }

  if (v7 && (SFRemovableSystemAppAvailable(v7) & 1) == 0)
  {
    if ((SFRemovableSystemAppAvailable(v7) & 1) != 0) {
      goto LABEL_17;
    }
    char v17 = 0;
  }

  else
  {
    char v17 = 1;
  }

  v9->_handlingAppInstalled = v17;
LABEL_17:
  objc_storeStrong((id *)&v9->_handlingAppBundleID, a4);
  if (v7 && v9->_handlingAppInstalled)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleProxy bundleProxyForIdentifier:]( &OBJC_CLASS___LSBundleProxy,  "bundleProxyForIdentifier:",  v7));
    -[SDAirDropHandler setBundleProxy:](v9, "setBundleProxy:", v18);
  }

- (void)dealloc
{
  if (-[SDAirDropHandler isActivated](self, "isActivated")) {
    -[SDAirDropHandler removeNotificationObservers](self, "removeNotificationObservers");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropHandler;
  -[SDAirDropHandler dealloc](&v3, "dealloc");
}

- (void)activate
{
  int64_t v3 = -[SDAirDropHandler transferTypes](self, "transferTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metaData]);
  [v5 setTransferTypes:v3];

  -[SDAirDropHandler addStatusMonitorObservers](self, "addStatusMonitorObservers");
  -[SDAirDropHandler setIsActivated:](self, "setIsActivated:", 1LL);
}

- (id)description
{
  id v15 = 0LL;
  uint64_t v3 = objc_opt_class(self, a2);
  NSAppendPrintF(&v15, "<%@ %{ptr}", v3, self);
  id v4 = v15;
  id v14 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFAirDropTransfer identifier](self->_transfer, "identifier"));
  NSAppendPrintF(&v14, ", transferIdentifier: %@", v5);
  id v6 = v14;

  bundleProxy = self->_bundleProxy;
  if (bundleProxy)
  {
    id v13 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LSBundleProxy bundleIdentifier](bundleProxy, "bundleIdentifier"));
    NSAppendPrintF(&v13, ", bundleProxy: %@", v8);
    id v9 = v13;

    id v6 = v9;
  }

  id v12 = v6;
  NSAppendPrintF(&v12, ">");
  id v10 = v12;

  return v10;
}

- (void)transferUpdated
{
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v15 selectedAction]);

  if (v3)
  {
    -[SDAirDropHandler triggerSelectedActionIfAppropriate](self, "triggerSelectedActionIfAppropriate");
LABEL_8:
    uint64_t v5 = v15;
    goto LABEL_9;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v15 selectedAction]);
  if (v4)
  {

    uint64_t v5 = v15;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v15 possibleActions]);
    id v14 = [v13 count];

    uint64_t v5 = v15;
    if (v14) {
      goto LABEL_9;
    }
  }

  unint64_t v6 = (unint64_t)[v5 transferState];
  uint64_t v5 = v15;
  if (v6 <= 9)
  {
    if (((1LL << v6) & 0x25E) != 0)
    {
      -[SDAirDropHandler updatePossibleActions](self, "updatePossibleActions");
    }

    else
    {
      if (v6 != 7) {
        goto LABEL_9;
      }
      -[SDAirDropHandler prepareOrPerformOpenAction](self, "prepareOrPerformOpenAction");
    }

    goto LABEL_8;
  }

- (void)actionSelected:(id)a3
{
  id v5 = a3;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cancelAction]);
  unsigned int v8 = [v7 isEqual:v5];

  if (!v8)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 possibleActions]);

    id v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      char v17 = 0LL;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v14);
          }
          __int128 v20 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          if ([v20 isEqual:v5])
          {
            id v21 = v20;

            char v17 = v21;
          }
        }

        id v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v16);

      if (v17)
      {
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        [v22 setSelectedAction:v17];

        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        [v23 setPossibleActions:0];

        if ([v17 shouldUpdateUserResponse])
        {
          objc_super v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
          id v25 = [v24 userResponse];

          if (!v25)
          {
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472LL;
            v26[2] = sub_10000B17C;
            v26[3] = &unk_1005CB008;
            v26[4] = self;
            -[SDAirDropHandler prepareForAcceptWithCompletion:](self, "prepareForAcceptWithCompletion:", v26);
          }
        }

        -[SDAirDropHandler triggerSelectedActionIfAppropriate](self, "triggerSelectedActionIfAppropriate");
        goto LABEL_19;
      }
    }

    else
    {
    }

    char v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v17 handleFailureInMethod:a2, self, @"SDAirDropHandler.m", 221, @"Failed to find localAction for %@", v5 object file lineNumber description];
LABEL_19:

    goto LABEL_20;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cancelAction]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v11 setSelectedAction:v10];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  [v12 setUserResponse:2];

LABEL_20:
}

- (void)triggerSelectedActionIfAppropriate
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 selectedAction]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    id v6 = [v5 transferState];
    id v7 = [v4 minRequiredTransferState];

    if (v6 >= v7)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      id v13 = [v12 transferState];
      id v14 = [v4 maxTransferState];

      if (v13 > v14)
      {
        uint64_t v16 = airdrop_log(v15);
        char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 138412290;
          __int128 v30 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Cannot trigger action %@ as it is past requirement",  (uint8_t *)&v29,  0xCu);
        }

        id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        [v10 setSelectedAction:0];
        goto LABEL_17;
      }

      if (![v4 requiresUnlockedUI]
        || (uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor")),
            unsigned __int8 v19 = [v18 deviceUIUnlocked],
            v18,
            (v19 & 1) != 0))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        id v22 = [v21 transferState];

        if (v22 == (id)4)
        {
          objc_super v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
          [v24 setTransferState:6];
        }

        uint64_t v25 = airdrop_log(v23);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 138412290;
          __int128 v30 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Triggering action %@",  (uint8_t *)&v29,  0xCu);
        }

        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        [v27 setSelectedAction:0];

        id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 actionHandler]);
        ((void (**)(void, void *))v10)[2](v10, v4);
        goto LABEL_17;
      }

      uint64_t v28 = airdrop_log(v20);
      id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412290;
        __int128 v30 = v4;
        v11 = "Delaying trigger of action %@ till UI unlock";
        goto LABEL_5;
      }
    }

    else
    {
      uint64_t v9 = airdrop_log(v8);
      id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412290;
        __int128 v30 = v4;
        v11 = "Delaying trigger of action %@ till transferState reaches requirement";
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v29, 0xCu);
      }
    }

- (void)addStatusMonitorObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"lockStatusChanged:" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
}

- (void)removeNotificationObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (int64_t)transferTypes
{
  if (self->_hasLinks) {
    return (32LL * self->_hasFiles) | 0x2000000;
  }
  else {
    return 32LL * self->_hasFiles;
  }
}

- (NSString)suitableContentsTitle
{
  return (NSString *)SFLocalizedStringForKey(@"AirDrop", a2);
}

- (NSString)suitableContentsDescription
{
  return (NSString *)&stru_1005E3958;
}

- (BOOL)canAutoAccept
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___SDAirDropHandlerUnsupportedType, a2);
  return (objc_opt_isKindOfClass(self, v3) & 1) == 0;
}

- (BOOL)supportsAutoOpen
{
  return 1;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (NSString)singleItemActionTitle
{
  return (NSString *)SFLocalizedStringForKey(@"ACCEPT_BUTTON_TITLE", a2);
}

- (NSString)defaultOpenActionBundleID
{
  return 0LL;
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", a3));
  id v4 = (char *)[v3 transferState];

  else {
    id v6 = off_1005CB100[(void)(v4 - 1)];
  }
  uint64_t v7 = SFLocalizedStringForKey(v6, v5);
  return (id)objc_claimAutoreleasedReturnValue(v7);
}

- (void)updatePossibleActions
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cancelAction]);

  if (!v4)
  {
    uint64_t v6 = SFLocalizedStringForKey(@"DECLINE_BUTTON_TITLE", v5);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v7 = objc_alloc(&OBJC_CLASS___SFAirDropAction);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v10 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:]( v7,  "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:",  v9,  @"SDCancelActionIdentifier",  v12,  v12,  2LL);

    -[SFAirDropAction setMinRequiredTransferState:](v10, "setMinRequiredTransferState:", 1LL);
    -[SFAirDropAction setMaxTransferState:](v10, "setMaxTransferState:", 4LL);
    -[SFAirDropAction setActionHandler:](v10, "setActionHandler:", &stru_1005CB048);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    [v11 setCancelAction:v10];
  }

- (void)prepareOrPerformOpenAction
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 dockHasDownloadsFolder];

  if (v4)
  {
    if (+[SFAirDropUserDefaults_objc moveToAppEnabled]( &OBJC_CLASS___SFAirDropUserDefaults_objc,  "moveToAppEnabled")) {

    }
    uint64_t v6 = SFLocalizedStringForKey(@"OPEN_BUTTON_TITLE", v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_alloc(&OBJC_CLASS___SFAirDropAction);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    v11 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:]( v8,  "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:",  v10,  @"SDOpenActionIdentifier",  v7,  v7,  3LL);

    -[SFAirDropAction setMinRequiredTransferState:](v11, "setMinRequiredTransferState:", 7LL);
    -[SFAirDropAction setMaxTransferState:](v11, "setMaxTransferState:", 7LL);
    id location = 0LL;
    objc_initWeak(&location, self);
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    uint64_t v16 = sub_10000B960;
    char v17 = &unk_1005CB070;
    objc_copyWeak(&v18, &location);
    -[SFAirDropAction setActionHandler:](v11, "setActionHandler:", &v14);
    uint64_t v20 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v20,  1LL,  v14,  v15,  v16,  v17));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    [v13 setPossibleActions:v12];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

- (id)defaultFolder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 temporaryDirectory]);

  return v3;
}

+ (id)persistedTransfersBaseURL
{
  id v2 = sub_100115790();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"com.apple.AirDrop" isDirectory:1]);

  return v4;
}

+ (id)transferURLForTransfer:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 customDestinationURL]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 customDestinationURL]);
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropHandler persistedTransfersBaseURL]( &OBJC_CLASS___SDAirDropHandler,  "persistedTransfersBaseURL"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v7 isDirectory:1]);
  }

  return v5;
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, SDAirDropHandlerImportResult *, void))a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SDAirDropHandlerImportResult);
  -[SDAirDropHandlerImportResult setImportedFiles:](v7, "setImportedFiles:", v6);

  v5[2](v5, v7, 0LL);
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, BOOL, void))a4;
  v6[2](v6, -[SDAirDropHandler openURLs:](self, "openURLs:", a3), 0LL);
}

- (void)performOpenSharesheetActionWithImportedURLs:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000BC94;
  v8[3] = &unk_1005CB098;
  id v9 = a4;
  id v6 = v9;
  id v7 = a3;
  -[SDAirDropHandler setMoveToShareSheetCompletion:](self, "setMoveToShareSheetCompletion:", v8);
  -[SDAirDropHandler launchMoveToAppShareSheetForFiles:](self, "launchMoveToAppShareSheetForFiles:", v7);
}

- (void)prepareForAcceptWithCompletion:(id)a3
{
}

- (id)actionsForModernReadyForOpen
{
  return &__NSArray0__struct;
}

- (void)performViewActionWithURLs:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  -[SDAirDropHandler openURLs:](self, "openURLs:", v5, v6);
}

- (id)defaultActionForBundleProxy:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2 object:self file:@"SDAirDropHandler.m" lineNumber:528 description:@"Cannot generate default action for nil bundleProxy"];
  }

  id v6 = objc_alloc(&OBJC_CLASS___SFAirDropAction);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedName]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
  id v12 = -[SFAirDropAction initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:]( v6,  "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:",  v8,  v9,  v10,  v11,  1LL);

  return v12;
}

- (id)applicationProxyForBundleProxy:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v3));

  return v4;
}

- (BOOL)isJustFiles
{
  return self->_hasFiles && !self->_hasLinks;
}

- (BOOL)isJustLinks
{
  return !self->_hasFiles && self->_hasLinks;
}

- (BOOL)isModernProgress
{
  return +[SFAirDropUserDefaults_objc systemLevelProgressEnabled]( &OBJC_CLASS___SFAirDropUserDefaults_objc,  "systemLevelProgressEnabled");
}

- (unint64_t)totalSharedItemsCount
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 metaData]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 items]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += (unint64_t)[*(id *)(*((void *)&v11 + 1) + 8 * (void)i) count];
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (id)alertMessageLocalizedKeyForTypeDicts:(id)a3
{
  id v4 = a3;
  id v6 = (void *)objc_opt_class(self, v5);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 metaData]);
  id v9 = [v8 senderIsMe];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 metaData]);
  id v12 = [v11 isVerifiableIdentity];
  BOOL v13 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "alertMessageLocalizedKeyForTypeDicts:senderIsMe:isVerifiableIdentity:isModernProgress:transferState:",  v4,  v9,  v12,  v13,  objc_msgSend(v14, "transferState")));

  return v15;
}

+ (id)alertMessageLocalizedKeyForTypeDicts:(id)a3 senderIsMe:(BOOL)a4 isVerifiableIdentity:(BOOL)a5 isModernProgress:(BOOL)a6 transferState:(unint64_t)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  int v9 = a4;
  id v10 = a3;
  if (v7) {
    __int128 v11 = @"MODERN_TRANSFER";
  }
  else {
    __int128 v11 = @"TRANSFER_FROM";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v11));
  uint64_t v13 = airdrop_ui_log();
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = @"NO";
    if (v7) {
      uint64_t v15 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v40 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "isModernProgress: %@", buf, 0xCu);
  }

  BOOL v31 = v7;
  if (!v7)
  {
    if ((v8 & ~v9) != 0) {
      uint64_t v16 = @"_PERSON";
    }
    else {
      uint64_t v16 = @"_DEVICE";
    }
    [v12 appendString:v16];
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v10;
  id v17 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allKeys]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);

        [v12 appendFormat:@"_%@", v23];
        objc_super v24 = (void *)objc_claimAutoreleasedReturnValue([v21 allValues]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);
        uint64_t v26 = (uint64_t)[v25 integerValue];

        if (v26 <= 1) {
          __int128 v27 = &stru_1005E3958;
        }
        else {
          __int128 v27 = @"_PLURAL";
        }
        [v12 appendString:v27];
      }

      id v18 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v18);
  }

  if (!v31)
  {
    uint64_t v28 = @"_IN_PROGRESS";
    switch(a7)
    {
      case 1uLL:
      case 3uLL:
        if (obj) {
          goto LABEL_31;
        }
        uint64_t v28 = @"_CANCELED";
        break;
      case 2uLL:
        goto LABEL_26;
      case 4uLL:
      case 6uLL:
      case 8uLL:
        goto LABEL_31;
      case 7uLL:
        uint64_t v28 = @"_COMPLETED";
        goto LABEL_26;
      default:
        if (obj) {
          goto LABEL_31;
        }
        uint64_t v28 = @"_FAILED";
        break;
    }

    goto LABEL_26;
  }

  if (a7 - 2 <= 7)
  {
    uint64_t v28 = @"_CAPITALIZED";
LABEL_26:
    [v12 appendString:v28];
  }

- (id)bundleProxyFromCandidateIdentifiers:(id)a3 handlesURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 URLOverrideForURL:v7]);

  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  uint64_t v20 = sub_10000C564;
  id v21 = &unk_1005CB0C0;
  id v22 = v6;
  uint64_t v23 = self;
  id v10 = v6;
  __int128 v11 = objc_retainBlock(&v18);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace",  v18,  v19,  v20,  v21));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 applicationsAvailableForOpeningURL:v9]);

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  uint64_t v15 = ((uint64_t (*)(void ***, void *))v11[2])(v11, v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (NSString)senderName
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 metaData]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 senderCompositeName]);

  uint64_t v5 = SFTruncateAirDropSenderNameForUI(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@" " withString:@" "]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"\n" withString:@" "]);

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByReplacingOccurrencesOfString:@"\t" withString:@" "]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByReplacingOccurrencesOfString:&stru_1005E3CB8 withString:&stru_1005E3958]);

  return (NSString *)v10;
}

- (void)logReceiverBundleID:(id)a3 forAppProxy:(id)a4 andURL:(id)a5
{
  id v9 = a5;
  if (a4)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([a4 bundleIdentifier]);
    +[SDAirDropHandler logReceiverBundleID:forURL:]( &OBJC_CLASS___SDAirDropHandler,  "logReceiverBundleID:forURL:",  v7,  v9);

    BOOL v8 = (void *)v7;
  }

  else
  {
    +[SDAirDropHandler logReceiverBundleID:forURL:]( &OBJC_CLASS___SDAirDropHandler,  "logReceiverBundleID:forURL:",  a3,  v9);
    BOOL v8 = v9;
  }
}

+ (void)logReceiverBundleID:(id)a3 forURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    BOOL v8 = (__CFString *)v5;
LABEL_3:
    if ((-[__CFString hasPrefix:](v8, "hasPrefix:", @"com.apple.") & 1) == 0)
    {

      BOOL v8 = @"3rd-party";
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"com.apple.airdrop.transfer.receiver.id.",  v8));
    off_1006413B8((uint64_t)v9, 1LL);

    goto LABEL_10;
  }

  if (v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationsAvailableForOpeningURL:v7]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 applicationIdentifier]);

    if (v8) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = airdrop_log(v6);
  BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    sub_10000CF88((os_log_s *)v8, v14, v15, v16, v17, v18, v19, v20);
  }
LABEL_10:
}

- (void)removeItemAtURLToFreeUpSpace:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = 0LL;
  unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v10];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    uint64_t v8 = airdrop_log(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000CFBC(v3, v9);
    }
  }
}

- (BOOL)openURLs:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (!v8)
  {
    uint64_t v17 = airdrop_log(0LL);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000D050(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    BOOL v26 = 0;
    goto LABEL_38;
  }

  v56 = self;
  uint64_t v9 = airdrop_log(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = SFCompactStringFromCollection(v6);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      v65 = v13;
      __int16 v66 = 2112;
      id v67 = v7;
      uint64_t v14 = "Opening URLs: %@ in %@";
      uint64_t v15 = v10;
      uint32_t v16 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }

  else if (v11)
  {
    uint64_t v27 = SFCompactStringFromCollection(v6);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138412290;
    v65 = v13;
    uint64_t v14 = "Opening URLs: %@";
    uint64_t v15 = v10;
    uint32_t v16 = 12;
    goto LABEL_10;
  }

  id v52 = v7;

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  uint64_t v18 = (os_log_s *)v6;
  id v28 = -[os_log_s countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v59,  v63,  16LL);
  if (v28)
  {
    id v29 = v28;
    id v51 = v6;
    v57 = v18;
    uint64_t v58 = *(void *)v60;
    __int128 v30 = v56;
    while (1)
    {
      BOOL v31 = 0LL;
      id v55 = v29;
      do
      {
        if (*(void *)v60 != v58) {
          objc_enumerationMutation(v18);
        }
        v32 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 scheme]);
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 lowercaseString]);
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v32 scheme]);
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 lowercaseString]);
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v32 scheme]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 lowercaseString]);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v32 scheme]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 lowercaseString]);
        v54 = v39;
        v53 = (void *)objc_claimAutoreleasedReturnValue([v32 scheme]);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v53 lowercaseString]);
        if ([v41 isEqualToString:@"stocks"])
        {

          v39 = v54;
LABEL_22:

          id v29 = v55;
          __int128 v30 = v56;
LABEL_23:

          uint64_t v18 = v57;
LABEL_24:

LABEL_25:
LABEL_26:
          v42 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
          unsigned __int8 v43 = [v42 openSensitiveURL:v32 withOptions:0];

          if ((v43 & 1) == 0) {
            goto LABEL_34;
          }
          goto LABEL_27;
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue([v32 scheme]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v49 lowercaseString]);
        unsigned __int8 v50 = [v48 isEqualToString:@"mobilephone"];

        __int128 v30 = v56;
        uint64_t v18 = v57;
        id v29 = v55;
        if ((v50 & 1) != 0) {
          goto LABEL_26;
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
        unsigned int v45 = [v44 openURL:v32 withOptions:0];

        if (!v45)
        {
LABEL_34:
          BOOL v26 = 0;
          goto LABEL_35;
        }

- (BOOL)openURLs:(id)a3
{
  return -[SDAirDropHandler openURLs:bundleIdentifier:](self, "openURLs:bundleIdentifier:", a3, 0LL);
}

- (SFAirDropTransfer)transfer
{
  return self->_transfer;
}

- (void)setTransfer:(id)a3
{
}

- (id)updateTransferStateHandler
{
  return self->_updateTransferStateHandler;
}

- (void)setUpdateTransferStateHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)hasFiles
{
  return self->_hasFiles;
}

- (BOOL)hasLinks
{
  return self->_hasLinks;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (void)setIsActivated:(BOOL)a3
{
  self->_isActivated = a3;
}

- (id)moveToShareSheetCompletion
{
  return self->_moveToShareSheetCompletion;
}

- (void)setMoveToShareSheetCompletion:(id)a3
{
}

- (LSBundleProxy)bundleProxy
{
  return self->_bundleProxy;
}

- (void)setBundleProxy:(id)a3
{
}

- (BOOL)handlingAppInstalled
{
  return self->_handlingAppInstalled;
}

- (void)setHandlingAppInstalled:(BOOL)a3
{
  self->_handlingAppInstalled = a3;
}

- (NSString)handlingAppBundleID
{
  return self->_handlingAppBundleID;
}

- (void)setHandlingAppBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end