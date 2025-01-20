@interface VSSetupFlowController
+ (id)sharedInstance;
- (BOOL)didSelectNoAppsforInstall;
- (BOOL)isInSTBMode;
- (BOOL)isSigningIn;
- (BOOL)notifyDelegateFromActivation;
- (NSArray)freeOnBoardingBundleIDs;
- (NSArray)supportedApps;
- (NSOperationQueue)privateQueue;
- (NSString)providerAccountUsername;
- (NSUndoManager)undoManager;
- (VSAccountSerializationCenter)serializationCenter;
- (VSAppDescription)appDescription;
- (VSDevice)currentDevice;
- (VSIdentityProviderRequestManager)requestManager;
- (VSPersistentStorage)storage;
- (VSPreferences)preferences;
- (VSRemoteNotifier)remoteNotifier;
- (VSSetupFlowController)init;
- (VSSetupFlowControllerDelegate)delegate;
- (id)_getProviderWithUserTokenFromAllProviders:(id)a3;
- (id)goingBackActivationCompletionBlock;
- (void)_didStartLoading;
- (void)_dismissViewController:(id)a3 completion:(id)a4;
- (void)_finishAfterOfferingOptions:(BOOL)a3 endingUndoGrouping:(BOOL)a4;
- (void)_goBack;
- (void)_obtainConsentForBundleIDs:(id)a3 vouchers:(id)a4 withAppleAccountName:(id)a5 identityProvider:(id)a6 endingUndoGrouping:(BOOL)a7 arrivedViaNotNowButton:(BOOL)a8 arrivedAfterSigningIn:(BOOL)a9 goingBack:(BOOL)a10;
- (void)_offerAuthenticationForProvider:(id)a3 withSupportedAppsButton:(BOOL)a4 msoAppDescription:(id)a5;
- (void)_offerAuthenticationForSTBProvider:(id)a3 msoAppDescription:(id)a4 providerAccountUsername:(id)a5;
- (void)_offerAuthenticationWithSupportedAppsButton:(BOOL)a3;
- (void)_offerFreeOnBoardingIfNeededAfterOfferingOptions:(BOOL)a3 endingUndoGrouping:(BOOL)a4 arrivedViaNotNowButton:(BOOL)a5 arrivedAfterSigningIn:(BOOL)a6 goingBack:(BOOL)a7;
- (void)_pickProviderWithViewController:(id)a3;
- (void)_presentError:(id)a3;
- (void)_presentViewController:(id)a3 completion:(id)a4;
- (void)_requestAccessWithViewController:(id)a3;
- (void)_startLoadingAfterOfferingOptions:(BOOL)a3 endingUndoGrouping:(BOOL)a4 arrivedViaNotNowButton:(BOOL)a5 arrivedAfterSigningIn:(BOOL)a6 goingBack:(BOOL)a7;
- (void)dealloc;
- (void)dismissIdentityProviderViewController:(id)a3;
- (void)finishOrIsGoingBack:(BOOL)a3 didOfferOptions:(BOOL)a4 endingUndoGrouping:(BOOL)a5;
- (void)finishSTBSuccessFlowForProvider:(id)a3 shouldShowBulkConsent:(BOOL)a4;
- (void)forceSignOutWithAccount:(id)a3;
- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4;
- (void)identityProviderPickerViewControllerDidCancel:(id)a3;
- (void)identityProviderRequestManager:(id)a3 finishedRequest:(id)a4 withResult:(id)a5;
- (void)identityProviderViewController:(id)a3 didAuthenticateAccount:(id)a4 forRequest:(id)a5;
- (void)identityProviderViewController:(id)a3 didFinishRequest:(id)a4 withResult:(id)a5;
- (void)markShouldSkipSetup;
- (void)notNow;
- (void)notNowWithIdentityProvider:(id)a3;
- (void)performDismissalOfIdentityProviderViewController:(id)a3;
- (void)setAppDescription:(id)a3;
- (void)setCurrentDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSelectNoAppsforInstall:(BOOL)a3;
- (void)setFreeOnBoardingBundleIDs:(id)a3;
- (void)setGoingBackActivationCompletionBlock:(id)a3;
- (void)setNotifyDelegateFromActivation:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setProviderAccountUsername:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setRequestManager:(id)a3;
- (void)setSerializationCenter:(id)a3;
- (void)setSigningIn:(BOOL)a3;
- (void)setStorage:(id)a3;
- (void)setSupportedApps:(id)a3;
- (void)showMultiAppInstallVC:(id)a3;
- (void)showSupportedApps;
- (void)signOutForNotNowFlowWithIdentityProvider:(id)a3;
- (void)startLoadingWhenGoingBack:(BOOL)a3 serializedAccountDataToImport:(id)a4;
- (void)startSigningIn;
- (void)startSigningInForIdentityProvider:(id)a3;
- (void)startSilentSigningInForSTBFromActivation:(BOOL)a3 withCompletion:(id)a4;
- (void)supportedAppsViewControllerDidFinish:(id)a3;
@end

@implementation VSSetupFlowController

+ (id)sharedInstance
{
  if (qword_2BFB0 != -1) {
    dispatch_once(&qword_2BFB0, &stru_247C8);
  }
  return (id)qword_2BFA8;
}

- (VSSetupFlowController)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VSSetupFlowController;
  v2 = -[VSSetupFlowController init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___VSPersistentStorage);
    storage = v2->_storage;
    v2->_storage = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController undoManager](v2, "undoManager"));
    -[VSPreferences setUndoManager:](v2->_preferences, "setUndoManager:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSPersistentStorage channelsCenter](v2->_storage, "channelsCenter"));
    [v8 setUndoManager:v7];

    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v9;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", @"VSSetupFlowController");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_privateQueue, "setMaxConcurrentOperationCount:", 1LL);
    v11 = objc_alloc_init(&OBJC_CLASS___VSDevice);
    currentDevice = v2->_currentDevice;
    v2->_currentDevice = v11;

    v2->_notifyDelegateFromActivation = 1;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___VSSetupFlowController;
  -[VSSetupFlowController dealloc](&v2, "dealloc");
}

- (void)_didStartLoading
{
  uint64_t v3 = VSDefaultLogObject(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Setup flow did start loading.", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v5 setupFlowControllerDidStartLoading:self];
}

- (void)_offerAuthenticationWithSupportedAppsButton:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = VSDefaultLogObject(self);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setup flow will offer authentication.", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v7 setupFlowController:self offerAuthenticationWithSupportedAppsButton:v3];
}

- (void)_offerAuthenticationForProvider:(id)a3 withSupportedAppsButton:(BOOL)a4 msoAppDescription:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = VSDefaultLogObject(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Setup flow will offer authentication for SOLE provider.", v13, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v12 setupFlowController:self offerAuthenticationForProvider:v9 withSupportedAppsButton:v5 msoAppDescription:v8 isSTB:0 providerAccountUsername:0];
}

- (void)_offerAuthenticationForSTBProvider:(id)a3 msoAppDescription:(id)a4 providerAccountUsername:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = VSDefaultLogObject(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v14 = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Setup flow will offer authentication for STB.", v14, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v13 setupFlowController:self offerAuthenticationForProvider:v10 withSupportedAppsButton:0 msoAppDescription:v9 isSTB:1 providerAccountUsername:v8];
}

- (void)_pickProviderWithViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setup flow will offer provider picker: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v7 setupFlowController:self pickProviderWithViewController:v4];
}

- (void)_requestAccessWithViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setup flow will request access.", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v7 setupFlowController:self requestAccessWithViewController:v4];
}

- (void)_presentViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VSDefaultLogObject(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Setup flow will present view controller: %@.",  (uint8_t *)&v11,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v10 setupFlowController:self presentViewController:v6 completion:v7];
}

- (void)_dismissViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VSDefaultLogObject(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Setup flow will dismiss view controller: %@",  (uint8_t *)&v11,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v10 setupFlowController:self dismissViewController:v6 completion:v7];
}

- (void)_goBack
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Setup flow will go back.", v6, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v5 goBackForSetupFlowController:self];
}

- (void)_finishAfterOfferingOptions:(BOOL)a3 endingUndoGrouping:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = VSDefaultLogObject(self);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Setup flow will finish.", buf, 2u);
  }

  if (v5 && v4)
  {
    uint64_t v10 = VSDefaultLogObject(v9);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v14 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "End undo grouping.", v14, 2u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController undoManager](self, "undoManager"));
    [v12 endUndoGrouping];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v13 setupFlowControllerDidFinish:self];
}

- (void)_presentError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSErrorLogObject();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_15FC4();
  }

  uint64_t v7 = VSAlertForError(v4, 0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[VSSetupFlowController _presentViewController:completion:](self, "_presentViewController:completion:", v8, 0LL);
}

- (void)_obtainConsentForBundleIDs:(id)a3 vouchers:(id)a4 withAppleAccountName:(id)a5 identityProvider:(id)a6 endingUndoGrouping:(BOOL)a7 arrivedViaNotNowButton:(BOOL)a8 arrivedAfterSigningIn:(BOOL)a9 goingBack:(BOOL)a10
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  BOOL v19 = [v15 count] != 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[VSViewControllerFactory sharedFactory](&OBJC_CLASS___VSViewControllerFactory, "sharedFactory"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_8E10;
  v25[3] = &unk_24818;
  BOOL v27 = v19;
  v25[4] = self;
  id v26 = v15;
  BOOL v28 = a7;
  BOOL v29 = a8;
  BOOL v30 = a9;
  BOOL v31 = a10;
  id v21 = v15;
  v22 = (void *)objc_claimAutoreleasedReturnValue( [v20 viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs:v18 grantingVouchers:v19 appleAccountName:v17 id entityProvider:v16 completionHandler:v25]);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 forceUnwrapObject]);
  -[VSSetupFlowController _requestAccessWithViewController:](self, "_requestAccessWithViewController:", v23);
}

- (VSAccountSerializationCenter)serializationCenter
{
  serializationCenter = self->_serializationCenter;
  if (!serializationCenter)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___VSAccountSerializationCenter);
    uint64_t v5 = self->_serializationCenter;
    self->_serializationCenter = v4;

    id v6 = self->_serializationCenter;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
    -[VSAccountSerializationCenter setStorage:](v6, "setStorage:", v7);

    uint64_t v8 = self->_serializationCenter;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController undoManager](self, "undoManager"));
    -[VSAccountSerializationCenter setUndoManager:](v8, "setUndoManager:", v9);

    serializationCenter = self->_serializationCenter;
  }

  return serializationCenter;
}

- (BOOL)isInSTBMode
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController preferences](self, "preferences"));
  unsigned __int8 v3 = [v2 isInSTBMode];

  return v3;
}

- (BOOL)didSelectNoAppsforInstall
{
  return self->_didSelectNoAppsforInstall;
}

- (NSUndoManager)undoManager
{
  p_undoManager = &self->_undoManager;
  unsigned __int8 v3 = self->_undoManager;
  if (!v3)
  {
    unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___NSUndoManager);
    objc_storeStrong((id *)p_undoManager, v3);
    if (!v3) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The undoManager parameter must not be nil.");
    }
  }

  return v3;
}

- (void)startLoadingWhenGoingBack:(BOOL)a3 serializedAccountDataToImport:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_94F8;
  v24[3] = &unk_24840;
  objc_copyWeak(&v25, &location);
  BOOL v26 = v4;
  uint64_t v7 = objc_retainBlock(v24);
  if (v4 && -[VSSetupFlowController isInSTBMode](self, "isInSTBMode"))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_9544;
    v22[3] = &unk_24868;
    v23 = v7;
    -[VSSetupFlowController startSilentSigningInForSTBFromActivation:withCompletion:]( self,  "startSilentSigningInForSTBFromActivation:withCompletion:",  0LL,  v22);
    uint64_t v8 = v23;
    goto LABEL_15;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountStore]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 firstAccountIfLoaded]);

  if (v8)
  {
    id v11 = v8;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 authenticationToken]);
    BOOL v13 = v12 == 0LL;

    if (!v6) {
      goto LABEL_11;
    }
  }

  else
  {
    BOOL v13 = 1;
    if (!v6)
    {
LABEL_11:
      ((void (*)(void *))v7[2])(v7);
      goto LABEL_15;
    }
  }

  if (!v13) {
    goto LABEL_11;
  }
  if (v4) {
    goto LABEL_11;
  }
  BOOL v14 = -[VSSetupFlowController isInSTBMode](self, "isInSTBMode");
  if (v14) {
    goto LABEL_11;
  }
  uint64_t v15 = VSDefaultLogObject(v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "We are *not* in STB mode and are *not* going back but we have serialized account data. Will try importing that.",  buf,  2u);
  }

  -[VSSetupFlowController _didStartLoading](self, "_didStartLoading");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController serializationCenter](self, "serializationCenter"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_9550;
  v19[3] = &unk_248B8;
  v20 = v7;
  id v18 = [v17 importData:v6 withCompletionHandler:v19];

LABEL_15:
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_startLoadingAfterOfferingOptions:(BOOL)a3 endingUndoGrouping:(BOOL)a4 arrivedViaNotNowButton:(BOOL)a5 arrivedAfterSigningIn:(BOOL)a6 goingBack:(BOOL)a7
{
  uint64_t v13 = VSDefaultLogObject(self);
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Setup flow will start loading.", buf, 2u);
  }

  -[VSSetupFlowController _didStartLoading](self, "_didStartLoading");
  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___VSSetupFlowPreparationOperation);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[VSOptional optionalWithObject:](&OBJC_CLASS___VSOptional, "optionalWithObject:", v16));
  -[VSSetupFlowPreparationOperation setStorage:](v15, "setStorage:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController privateQueue](self, "privateQueue"));
  [v18 addOperation:v15];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_9840;
  v22[3] = &unk_24958;
  void v22[4] = self;
  v23 = v15;
  BOOL v24 = a7;
  BOOL v25 = a3;
  BOOL v26 = a4;
  BOOL v27 = a5;
  BOOL v28 = a6;
  BOOL v19 = v15;
  uint64_t v20 = VSMainThreadOperationWithBlock(v22);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v21 addDependency:v19];
  VSEnqueueCompletionOperation(v21);
}

- (void)finishOrIsGoingBack:(BOOL)a3 didOfferOptions:(BOOL)a4 endingUndoGrouping:(BOOL)a5
{
  if (a3) {
    -[VSSetupFlowController _goBack](self, "_goBack", a3, a4, a5);
  }
  else {
    -[VSSetupFlowController _finishAfterOfferingOptions:endingUndoGrouping:]( self,  "_finishAfterOfferingOptions:endingUndoGrouping:",  a4,  a5);
  }
}

- (void)startSigningIn
{
  uint64_t v3 = VSDefaultLogObject(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Setup flow will start signing in.", buf, 2u);
  }

  if (!-[VSSetupFlowController isSigningIn](self, "isSigningIn"))
  {
    uint64_t v5 = VSDefaultLogObject(-[VSSetupFlowController setSigningIn:](self, "setSigningIn:", 1LL));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Begin undo grouping.", buf, 2u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController undoManager](self, "undoManager"));
    [v7 beginUndoGrouping];

    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    id v18 = sub_A204;
    BOOL v19 = &unk_24A20;
    uint64_t v20 = self;
    id v21 = objc_alloc_init(&OBJC_CLASS___VSIdentityProviderFetchAllOperation);
    id v22 = objc_alloc_init(&OBJC_CLASS___VSStorefrontCodeLoadOperation);
    id v23 = objc_alloc_init(&OBJC_CLASS___VSAMSStorefrontFetchAllOperation);
    id v8 = v23;
    id v9 = v22;
    id v10 = v21;
    uint64_t v11 = VSMainThreadOperationWithBlock(&v16);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v8, "addDependency:", v9, v16, v17, v18, v19, v20);
    [v10 addDependency:v8];
    [v12 addDependency:v10];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController privateQueue](self, "privateQueue"));
    [v13 addOperation:v9];

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController privateQueue](self, "privateQueue"));
    [v14 addOperation:v8];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController privateQueue](self, "privateQueue"));
    [v15 addOperation:v10];

    VSEnqueueCompletionOperation(v12);
  }

- (void)finishSTBSuccessFlowForProvider:(id)a3 shouldShowBulkConsent:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = VSDefaultLogObject(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v42 = "-[VSSetupFlowController finishSTBSuccessFlowForProvider:shouldShowBulkConsent:]";
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController preferences](self, "preferences"));
  [v8 setIsInSTBMode:1];

  if (v5)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[VSSetupFlowController appDescription](self, "appDescription"));
    id v10 = (void *)v9;
    if (v9)
    {
      uint64_t v40 = v9;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 appPlacementPosition]);
      +[VSRequestAppInstallUtility markSTBProviderAppsForInstallation:rootAppPlacementPosition:]( &OBJC_CLASS___VSRequestAppInstallUtility,  "markSTBProviderAppsForInstallation:rootAppPlacementPosition:",  v11,  v12);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController appDescription](self, "appDescription"));
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);

    if (!v14)
    {
      uint64_t v15 = VSErrorLogObject();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_16138();
      }

      -[VSSetupFlowController markShouldSkipSetup](self, "markShouldSkipSetup");
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController appDescription](self, "appDescription"));
    if (!v17)
    {
      uint64_t v18 = VSErrorLogObject();
      BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1610C();
      }

      -[VSSetupFlowController markShouldSkipSetup](self, "markShouldSkipSetup");
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 adamID]);
    if (v20)
    {
      id v21 = objc_alloc(&OBJC_CLASS___VSPrivacyConsentVoucher);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 providerID]);
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v23 forceUnwrapObject]);
      id v25 = [v21 initWithAppAdamID:v22 providerID:v24];

      if (v25)
      {
        uint64_t v27 = VSDefaultLogObject(v26);
        BOOL v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = (const char *)v20;
          _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "finishSTBSuccessFlowForProvider: issue voucher for adam# %@",  buf,  0xCu);
        }

        BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
        BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v29 voucherLockbox]);
        id v39 = v25;
        BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
        [v30 issueVouchers:v31];

LABEL_28:
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_AD14;
        v37[3] = &unk_24A48;
        v37[4] = self;
        id v38 = v5;
        +[VSMultiAppInstallUtility determineMultiAppEnabledForProvider:completion:]( &OBJC_CLASS___VSMultiAppInstallUtility,  "determineMultiAppEnabledForProvider:completion:",  v38,  v37);

        goto LABEL_29;
      }
    }

    else
    {
      uint64_t v34 = VSErrorLogObject();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_160E0();
      }
    }

    uint64_t v36 = VSDefaultLogObject(v26);
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)v29, OS_LOG_TYPE_DEFAULT, "finishSTBSuccessFlowForProvider: no voucher", buf, 2u);
    }

    id v25 = 0LL;
    goto LABEL_28;
  }

  uint64_t v32 = VSErrorLogObject();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_160B4();
  }

  -[VSSetupFlowController markShouldSkipSetup](self, "markShouldSkipSetup");
LABEL_29:
}

- (void)markShouldSkipSetup
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController preferences](self, "preferences"));
  [v2 setShouldSkipSetup];
}

- (void)showMultiAppInstallVC:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  BOOL v6 = -[VSSetupFlowController isInSTBMode](self, "isInSTBMode");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountStore]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstAccount]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController currentDevice](self, "currentDevice"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[VSMultiAppInstallUtility appsToShowInMAIForProvider:isInSTBMode:forAccount:device:]( &OBJC_CLASS___VSMultiAppInstallUtility,  "appsToShowInMAIForProvider:isInSTBMode:forAccount:device:",  v4,  v6,  v9,  v10));
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[VSMultiAppInstallUtility generateAppModelsFromSupportedAppDescriptions:]( &OBJC_CLASS___VSMultiAppInstallUtility,  "generateAppModelsFromSupportedAppDescriptions:",  v5));
  if (-[NSMutableArray count](v5, "count"))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController appDescription](self, "appDescription"));
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);

    if (v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
      id v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 forceUnwrapObject]);
    }

    else
    {
      id v16 = &stru_257C0;
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_B000;
    v21[3] = &unk_24AC0;
    v21[4] = self;
    id v22 = v12;
    id v23 = v5;
    id v24 = v13;
    id v25 = v4;
    id v19 = v13;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[VideosUISwiftExternal multiAppViewControllerWithApps:providerName:shouldShowPrivacyText:selectedAppsCompletion:]( &OBJC_CLASS___VideosUISwiftExternal,  "multiAppViewControllerWithApps:providerName:shouldShowPrivacyText:selectedAppsCompletion:",  v22,  v16,  0LL,  v21));
    if (v20) {
      -[VSSetupFlowController _presentViewController:completion:](self, "_presentViewController:completion:", v20, 0LL);
    }
  }

  else
  {
    uint64_t v17 = VSErrorLogObject();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_16164();
    }

    id v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
    -[__CFString setupFlowControllerDidFinish:](v16, "setupFlowControllerDidFinish:", self);
  }
}

- (void)startSigningInForIdentityProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = -[VSSetupFlowController isInSTBMode](self, "isInSTBMode");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController providerAccountUsername](self, "providerAccountUsername"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController appDescription](self, "appDescription"));
    int v24 = 138413058;
    id v25 = v4;
    __int16 v26 = 1024;
    unsigned int v27 = v7;
    __int16 v28 = 2112;
    BOOL v29 = v8;
    __int16 v30 = 2112;
    BOOL v31 = v9;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "startSigningInForIdentityProvider: %@, STB %d, providerAccountUsername %@, app desc %@",  (uint8_t *)&v24,  0x26u);
  }

  if (-[VSSetupFlowController isInSTBMode](self, "isInSTBMode")
    && (id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController providerAccountUsername](self, "providerAccountUsername")),
        id v11 = [v10 length],
        v10,
        v11))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 userToken]);
    BOOL v13 = [v12 length] == 0;

    -[VSSetupFlowController finishSTBSuccessFlowForProvider:shouldShowBulkConsent:]( self,  "finishSTBSuccessFlowForProvider:shouldShowBulkConsent:",  v4,  v13);
  }

  else
  {
    id v14 = [v4 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];
    if ((_DWORD)v14)
    {
      uint64_t v15 = VSDefaultLogObject(v14);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Begin undo grouping.", (uint8_t *)&v24, 2u);
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController undoManager](self, "undoManager"));
      [v17 beginUndoGrouping];

      id v18 = [[VSIdentityProviderViewController alloc] initWithIdentityProvider:v4];
      [v18 setDelegate:self];
      [v18 setCanIssuePrivacyVouchers:1];
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[VSIdentityProviderRequest makeAccountRequestWithStorage:]( &OBJC_CLASS___VSIdentityProviderRequest,  "makeAccountRequestWithStorage:",  v19));

      [v18 enqueueRequest:v20];
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
      [v21 setupFlowController:self authenticateProviderWithViewController:v18];
    }

    else
    {
      uint64_t v22 = VSErrorLogObject();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_16190();
      }
    }
  }
}

- (void)_offerFreeOnBoardingIfNeededAfterOfferingOptions:(BOOL)a3 endingUndoGrouping:(BOOL)a4 arrivedViaNotNowButton:(BOOL)a5 arrivedAfterSigningIn:(BOOL)a6 goingBack:(BOOL)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  BOOL v11 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[VSACAccount sharedInstance](&OBJC_CLASS___VSACAccount, "sharedInstance"));
  if ([v16 hasAccount])
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController freeOnBoardingBundleIDs](self, "freeOnBoardingBundleIDs"));
    if ([v13 count])
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v16 username]);
      BYTE1(v15) = a7;
      LOBYTE(v15) = a6;
      -[VSSetupFlowController _obtainConsentForBundleIDs:vouchers:withAppleAccountName:identityProvider:endingUndoGrouping:arrivedViaNotNowButton:arrivedAfterSigningIn:goingBack:]( self,  "_obtainConsentForBundleIDs:vouchers:withAppleAccountName:identityProvider:endingUndoGrouping:arrivedViaNotNowBut ton:arrivedAfterSigningIn:goingBack:",  v13,  &__NSArray0__struct,  v14,  0LL,  v10,  v9,  v15);
    }

    else
    {
      -[VSSetupFlowController _finishAfterOfferingOptions:endingUndoGrouping:]( self,  "_finishAfterOfferingOptions:endingUndoGrouping:",  v11,  v10);
    }
  }

  else
  {
    -[VSSetupFlowController _finishAfterOfferingOptions:endingUndoGrouping:]( self,  "_finishAfterOfferingOptions:endingUndoGrouping:",  v11,  v10);
  }
}

- (void)notNow
{
}

- (void)notNowWithIdentityProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setup flow will not now.", v9, 2u);
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController preferences](self, "preferences"));
  [v7 removeSkipSetupPreset];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController preferences](self, "preferences"));
  [v8 noteDesiredApp:0];

  -[VSSetupFlowController signOutForNotNowFlowWithIdentityProvider:]( self,  "signOutForNotNowFlowWithIdentityProvider:",  v4);
  if (!-[VSSetupFlowController isSigningIn](self, "isSigningIn")) {
    -[VSSetupFlowController _offerFreeOnBoardingIfNeededAfterOfferingOptions:endingUndoGrouping:arrivedViaNotNowButton:arrivedAfterSigningIn:goingBack:]( self,  "_offerFreeOnBoardingIfNeededAfterOfferingOptions:endingUndoGrouping:arrivedViaNotNowButton:arrivedAfterSigningIn:goingBack:",  1LL,  0LL,  1LL,  0LL,  0LL);
  }
}

- (void)signOutForNotNowFlowWithIdentityProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountStore]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstAccountIfLoaded]);

  if (v7)
  {
    id v8 = v7;
    if (v4 && [v4 isFullySupportedForRequestsExpectingAuthenticationSchemes:0])
    {
      id v9 = v4;
      BOOL v10 = -[VSIdentityProviderRequestManager initWithIdentityProvider:]( objc_alloc(&OBJC_CLASS___VSIdentityProviderRequestManager),  "initWithIdentityProvider:",  v9);
      -[VSIdentityProviderRequestManager setDelegate:](v10, "setDelegate:", self);
      -[VSSetupFlowController setRequestManager:](self, "setRequestManager:", v10);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[VSIdentityProviderRequest deleteAccountRequestWithAccount:storage:]( &OBJC_CLASS___VSIdentityProviderRequest,  "deleteAccountRequestWithAccount:storage:",  v8,  v11));

      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController requestManager](self, "requestManager"));
      [v13 enqueueRequest:v12];
    }

    else
    {
      uint64_t v14 = VSErrorLogObject();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_161E8();
      }

      -[VSSetupFlowController forceSignOutWithAccount:](self, "forceSignOutWithAccount:", v8);
    }
  }

  else
  {
    uint64_t v16 = VSErrorLogObject();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_161BC();
    }
  }
}

- (void)forceSignOutWithAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountStore]);
  id v8 = v4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  [v6 removeAccounts:v7 withCompletionHandler:&stru_24B00];
}

- (void)showSupportedApps
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Setup flow will show supported apps.", v9, 2u);
  }

  if (!-[VSSetupFlowController isSigningIn](self, "isSigningIn"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[VSViewControllerFactory sharedFactory](&OBJC_CLASS___VSViewControllerFactory, "sharedFactory"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController supportedApps](self, "supportedApps"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 viewControllerForAppsSupportedByIdentityProvider:0 supportedApps:v6 delegate:self]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 forceUnwrapObject]);

    -[VSSetupFlowController _presentViewController:completion:](self, "_presentViewController:completion:", v8, 0LL);
  }

- (id)_getProviderWithUserTokenFromAllProviders:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned int v7 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userToken", (void)v13));
        id v9 = [v8 length];

        if (v9)
        {
          id v4 = v7;
          uint64_t v10 = VSDefaultLogObject(v4);
          BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v4;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Found stb provider %@", buf, 0xCu);
          }

          goto LABEL_13;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)startSilentSigningInForSTBFromActivation:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(void))a4;
  uint64_t v7 = VSDefaultLogObject(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[VSSetupFlowController startSilentSigningInForSTBFromActivation:withCompletion:]";
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSSetupFlowController _didStartLoading](self, "_didStartLoading");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_C154;
  v20[3] = &unk_24558;
  v20[4] = self;
  id v9 = objc_retainBlock(v20);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountStore]);
  unsigned int v12 = [v11 isFirstAccountLoaded];

  if (v12)
  {
    if (v4)
    {
      ((void (*)(void *))v9[2])(v9);
    }

    else if (v6)
    {
      v6[2](v6);
    }
  }

  else
  {
    -[VSSetupFlowController setNotifyDelegateFromActivation:](self, "setNotifyDelegateFromActivation:", v4);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController currentDevice](self, "currentDevice"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_C194;
    v16[3] = &unk_24BA0;
    BOOL v19 = v4;
    uint64_t v17 = v9;
    id v18 = v6;
    v16[4] = self;
    uint64_t v14 = VSDefaultLogObject([v13 fetchSetTopBoxProfileWithCompletion:v16]);
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[VSSetupFlowController startSilentSigningInForSTBFromActivation:withCompletion:]";
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Will exit %s", buf, 0xCu);
    }
  }
}

- (void)identityProviderRequestManager:(id)a3 finishedRequest:(id)a4 withResult:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = VSDefaultLogObject(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[VSSetupFlowController identityProviderRequestManager:finishedRequest:withResult:]";
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v19, 0xCu);
  }

  VSRequireMainThread(v11, v12);
  uint64_t v13 = VSDefaultLogObject(-[VSSetupFlowController setRequestManager:](self, "setRequestManager:", 0LL));
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[VSSetupFlowController identityProviderRequestManager:finishedRequest:withResult:]";
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%s: result: %@", (uint8_t *)&v19, 0x16u);
  }

  __int128 v15 = (int *)[v8 type];
  if (v15 == &dword_4)
  {
    if (-[VSSetupFlowController notifyDelegateFromActivation](self, "notifyDelegateFromActivation"))
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
      [v16 setupFlowControllerDidFinishSilentSigningIn:self];
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[VSSetupFlowController goingBackActivationCompletionBlock]( self,  "goingBackActivationCompletionBlock"));

      if (v17)
      {
        id v18 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[VSSetupFlowController goingBackActivationCompletionBlock]( self,  "goingBackActivationCompletionBlock"));
        v18[2]();

        -[VSSetupFlowController setGoingBackActivationCompletionBlock:]( self,  "setGoingBackActivationCompletionBlock:",  0LL);
      }
    }
  }

  else if (v15 == (int *)((char *)&dword_0 + 2))
  {
    [v7 unwrapObject:&stru_24BE0 error:&stru_24C00];
  }
}

- (void)identityProviderPickerViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setup flow will dismiss picker.", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_C9B0;
  v7[3] = &unk_24558;
  v7[4] = self;
  -[VSSetupFlowController _dismissViewController:completion:](self, "_dismissViewController:completion:", v4, v7);
}

- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VSDefaultLogObject(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Setup flow did pick provider: %@", buf, 0xCu);
  }

  id v10 = [v7 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];
  int v11 = (int)v10;
  uint64_t v12 = VSDefaultLogObject(v10);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Provider is supported.", buf, 2u);
    }

    id v15 = [[VSIdentityProviderViewController alloc] initWithIdentityProvider:v7];
    [v15 setDelegate:self];
    [v15 setCanIssuePrivacyVouchers:1];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[VSIdentityProviderRequest makeAccountRequestWithStorage:]( &OBJC_CLASS___VSIdentityProviderRequest,  "makeAccountRequestWithStorage:",  v16));

    [v15 enqueueRequest:v17];
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 navigationController]);
    [v18 pushViewController:v15 animated:1];
  }

  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Unsupported Provider selected", buf, 2u);
    }

    int v19 = (void *)objc_claimAutoreleasedReturnValue(+[VSViewControllerFactory sharedFactory](&OBJC_CLASS___VSViewControllerFactory, "sharedFactory"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController storage](self, "storage"));
    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    id v25 = sub_CCD4;
    __int16 v26 = &unk_24C78;
    unsigned int v27 = self;
    id v21 = v6;
    id v28 = v21;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( [v19 viewControllerForUnsupportedProvider:v7 withRequestingAppDisplayName:0 storage:v20 acknowledgementHandler:&v23]);
    id v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "forceUnwrapObject", v23, v24, v25, v26, v27));

    [v21 presentViewController:v15 animated:1 completion:0];
  }
}

- (void)dismissIdentityProviderViewController:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSSetupFlowController delegate](self, "delegate"));
  [v4 setupFlowControllerNeedsDismissalOfSetupView];

  -[VSSetupFlowController performDismissalOfIdentityProviderViewController:]( self,  "performDismissalOfIdentityProviderViewController:",  v5);
}

- (void)performDismissalOfIdentityProviderViewController:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 navigationController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 presentingViewController]);
    [v6 dismissViewControllerAnimated:1 completion:0];
  }

  else
  {
    id v5 = [v7 popViewControllerAnimated:1];
  }
}

- (void)identityProviderViewController:(id)a3 didFinishRequest:(id)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = VSDefaultLogObject(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 identityProvider]);
    *(_DWORD *)buf = 138413058;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    __int16 v25 = 1024;
    unsigned int v26 = -[VSSetupFlowController isInSTBMode](self, "isInSTBMode");
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "Setup flow identity auth request %@ did finish: %@ for provider %@, isInSTBMode %d",  buf,  0x26u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_D2A4;
  v17[3] = &unk_24CA0;
  v17[4] = self;
  id v18 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_D38C;
  v15[3] = &unk_24CC8;
  v15[4] = self;
  id v16 = v18;
  id v14 = v18;
  [v10 unwrapObject:v17 error:v15];
}

- (void)identityProviderViewController:(id)a3 didAuthenticateAccount:(id)a4 forRequest:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = VSDefaultLogObject(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Setup flow did authenticate account: %@", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_D678;
  v11[3] = &unk_24558;
  v11[4] = self;
  -[VSSetupFlowController _dismissViewController:completion:](self, "_dismissViewController:completion:", v8, v11);
}

- (void)supportedAppsViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setup flow supported apps did finish: %@", (uint8_t *)&v7, 0xCu);
  }

  -[VSSetupFlowController _dismissViewController:completion:](self, "_dismissViewController:completion:", v4, 0LL);
}

- (VSSetupFlowControllerDelegate)delegate
{
  return (VSSetupFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (NSArray)freeOnBoardingBundleIDs
{
  return self->_freeOnBoardingBundleIDs;
}

- (void)setFreeOnBoardingBundleIDs:(id)a3
{
}

- (BOOL)isSigningIn
{
  return self->_signingIn;
}

- (void)setSigningIn:(BOOL)a3
{
  self->_signingIn = a3;
}

- (void)setDidSelectNoAppsforInstall:(BOOL)a3
{
  self->_didSelectNoAppsforInstall = a3;
}

- (VSAppDescription)appDescription
{
  return self->_appDescription;
}

- (void)setAppDescription:(id)a3
{
}

- (NSString)providerAccountUsername
{
  return self->_providerAccountUsername;
}

- (void)setProviderAccountUsername:(id)a3
{
}

- (VSIdentityProviderRequestManager)requestManager
{
  return self->_requestManager;
}

- (void)setRequestManager:(id)a3
{
}

- (BOOL)notifyDelegateFromActivation
{
  return self->_notifyDelegateFromActivation;
}

- (void)setNotifyDelegateFromActivation:(BOOL)a3
{
  self->_notifyDelegateFromActivation = a3;
}

- (id)goingBackActivationCompletionBlock
{
  return self->_goingBackActivationCompletionBlock;
}

- (void)setGoingBackActivationCompletionBlock:(id)a3
{
}

- (VSDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
}

- (void)setSerializationCenter:(id)a3
{
}

- (NSArray)supportedApps
{
  return self->_supportedApps;
}

- (void)setSupportedApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end