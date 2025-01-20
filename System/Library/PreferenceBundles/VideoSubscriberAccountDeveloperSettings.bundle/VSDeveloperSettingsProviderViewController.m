@interface VSDeveloperSettingsProviderViewController
- (NSOperationQueue)privateQueue;
- (VSDeveloperSettingsFacade)facade;
- (VSDeveloperSettingsProviderViewController)initWithIdentityProvider:(id)a3;
- (VSDeveloperSettingsProviderViewModel)viewModel;
- (VSIdentityProvider)identityProvider;
- (id)loadSettingGroups;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)dealloc;
- (void)deletePressed:(id)a3;
- (void)donePressed:(id)a3;
- (void)handleSchemeUpdateWithOldValue:(BOOL)a3 newValue:(BOOL)a4 isSAML:(BOOL)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)persistProvider:(BOOL)a3;
- (void)presentAuthenticationSchemeErrorAlert;
- (void)setFacade:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setViewModel:(id)a3;
- (void)testSystemTrustPressed:(id)a3;
@end

@implementation VSDeveloperSettingsProviderViewController

- (VSDeveloperSettingsProviderViewController)initWithIdentityProvider:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsProviderViewController;
  v6 = -[VSDeveloperSettingsProviderViewController init](&v18, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[VSDeveloperSettingsFacade sharedFacade](&OBJC_CLASS___VSDeveloperSettingsFacade, "sharedFacade"));
    facade = v6->_facade;
    v6->_facade = (VSDeveloperSettingsFacade *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = v9;

    v11 = v6->_privateQueue;
    v12 = (objc_class *)objc_opt_class(v6);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[NSOperationQueue setName:](v11, "setName:", v14);

    if (v5) {
      objc_storeStrong((id *)&v6->_identityProvider, a3);
    }
    v15 = -[VSDeveloperSettingsProviderViewModel initWithIdentityProvider:]( objc_alloc(&OBJC_CLASS___VSDeveloperSettingsProviderViewModel),  "initWithIdentityProvider:",  v5);
    viewModel = v6->_viewModel;
    v6->_viewModel = v15;

    -[VSDeveloperSettingsProviderViewController _startObservingViewModel:]( v6,  "_startObservingViewModel:",  v6->_viewModel);
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsProviderViewController;
  -[VSDeveloperSettingsProviderViewController dealloc](&v3, "dealloc");
}

- (void)_startObservingViewModel:(id)a3
{
  v4 = off_1A0B8;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"displayName" options:1 context:v4];
  [v5 addObserver:self forKeyPath:@"identifier" options:1 context:off_1A0B8];
  [v5 addObserver:self forKeyPath:@"authURL" options:1 context:off_1A0B8];
  [v5 addObserver:self forKeyPath:@"supportSAML" options:3 context:off_1A0C0];
  [v5 addObserver:self forKeyPath:@"supportAPI" options:3 context:off_1A0C8];
  [v5 addObserver:self forKeyPath:@"requireAuthUrlSystemTrust" options:1 context:off_1A0D0];
  [v5 addObserver:self forKeyPath:@"requireXHRRequestSystemTrust" options:1 context:off_1A0D0];
}

- (void)_stopObservingViewModel:(id)a3
{
  v4 = off_1A0B8;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"displayName" context:v4];
  [v5 removeObserver:self forKeyPath:@"identifier" context:off_1A0B8];
  [v5 removeObserver:self forKeyPath:@"authURL" context:off_1A0B8];
  [v5 removeObserver:self forKeyPath:@"supportSAML" context:off_1A0C0];
  [v5 removeObserver:self forKeyPath:@"supportAPI" context:off_1A0C8];
  [v5 removeObserver:self forKeyPath:@"requireAuthUrlSystemTrust" context:off_1A0D0];
  [v5 removeObserver:self forKeyPath:@"requireXHRRequestSystemTrust" context:off_1A0D0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (off_1A0B8 == a6) {
    goto LABEL_10;
  }
  if (off_1A0C0 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    id v15 = [v14 BOOLValue];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    id v17 = [v16 BOOLValue];

    objc_super v18 = self;
    id v19 = v15;
    id v20 = v17;
    uint64_t v21 = 1LL;
LABEL_8:
    -[VSDeveloperSettingsProviderViewController handleSchemeUpdateWithOldValue:newValue:isSAML:]( v18,  "handleSchemeUpdateWithOldValue:newValue:isSAML:",  v19,  v20,  v21);
    goto LABEL_11;
  }

  if (off_1A0C8 == a6)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    id v23 = [v22 BOOLValue];

    v24 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    id v25 = [v24 BOOLValue];

    objc_super v18 = self;
    id v19 = v23;
    id v20 = v25;
    uint64_t v21 = 0LL;
    goto LABEL_8;
  }

  if (off_1A0D0 == a6)
  {
    -[VSDeveloperSettingsProviderViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
LABEL_10:
    -[VSDeveloperSettingsProviderViewController persistProvider:](self, "persistProvider:", 0LL);
    goto LABEL_11;
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsProviderViewController;
  -[VSDeveloperSettingsProviderViewController observeValueForKeyPath:ofObject:change:context:]( &v26,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_11:
}

- (void)handleSchemeUpdateWithOldValue:(BOOL)a3 newValue:(BOOL)a4 isSAML:(BOOL)a5
{
  BOOL v6 = a3;
  viewModel = self->_viewModel;
  if (a5)
  {
    unsigned __int8 v9 = -[VSDeveloperSettingsProviderViewModel supportAPI](viewModel, "supportAPI");
    if (!a4 && (v9 & 1) == 0)
    {
      -[VSDeveloperSettingsProviderViewModel setSupportSAML:](self->_viewModel, "setSupportSAML:", v6);
LABEL_8:
      -[VSDeveloperSettingsProviderViewController presentAuthenticationSchemeErrorAlert]( self,  "presentAuthenticationSchemeErrorAlert");
    }
  }

  else
  {
    unsigned __int8 v10 = -[VSDeveloperSettingsProviderViewModel supportSAML](viewModel, "supportSAML");
    if (!a4 && (v10 & 1) == 0)
    {
      -[VSDeveloperSettingsProviderViewModel setSupportAPI:](self->_viewModel, "setSupportAPI:", v6);
      goto LABEL_8;
    }
  }

  -[VSDeveloperSettingsProviderViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  -[VSDeveloperSettingsProviderViewController persistProvider:](self, "persistProvider:", 0LL);
}

- (void)persistProvider:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (VSIdentityProvider *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController identityProvider](self, "identityProvider"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController viewModel](self, "viewModel"));
  if (!v5 && v3)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___VSIdentityProvider);
    -[VSIdentityProvider setDeveloper:](v5, "setDeveloper:", 1LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[VSOptional optionalWithObject:](&OBJC_CLASS___VSOptional, "optionalWithObject:", v8));
    -[VSIdentityProvider setUniqueID:](v5, "setUniqueID:", v9);
  }

  if (v5)
  {
    unsigned __int8 v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    BOOL v11 = !v3;
    -[VSIdentityProvider setSupportedAuthenticationSchemes:](v5, "setSupportedAuthenticationSchemes:", v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VSOptional optionalWithObject:](&OBJC_CLASS___VSOptional, "optionalWithObject:", v12));
    -[VSIdentityProvider setProviderID:](v5, "setProviderID:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
    -[VSIdentityProvider setNameForSorting:](v5, "setNameForSorting:", v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 authURL]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v15));
    -[VSIdentityProvider setAuthenticationURL:](v5, "setAuthenticationURL:", v16);

    -[VSIdentityProvider setRequireAuthenticationURLSystemTrust:]( v5,  "setRequireAuthenticationURLSystemTrust:",  [v6 requireAuthUrlSystemTrust]);
    -[VSIdentityProvider setRequireXHRRequestSystemTrust:]( v5,  "setRequireXHRRequestSystemTrust:",  [v6 requireXHRRequestSystemTrust]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController facade](self, "facade"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_A8A0;
    v18[3] = &unk_14718;
    v18[4] = self;
    [v17 enqueueChange:v11 withIdentityProvider:v5 completionHandler:v18];
  }
}

- (void)presentAuthenticationSchemeErrorAlert
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"DEVELOPER_SETTINGS_AUTH_SCHEME_ERROR_TITLE" value:0 table:0]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"DEVELOPER_SETTINGS_AUTH_SCHEME_ERROR_MESSAGE" value:0 table:0]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_AAA8;
  v11[3] = &unk_145E0;
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));
  id v9 = v12;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  0LL,  v11));
  [v9 addAction:v10];

  -[VSDeveloperSettingsProviderViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
}

- (void)testSystemTrustPressed:(id)a3
{
  if (+[VSProxyDetector isProxyConfigured](&OBJC_CLASS___VSProxyDetector, "isProxyConfigured", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController facade](self, "facade"));
    id v21 = (id)objc_claimAutoreleasedReturnValue([v4 alertTitleForProxyDetection]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController facade](self, "facade"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 alertMessageForProxyDetection]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v21,  v6,  1LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController facade](self, "facade"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dismissTitleForProxyDetection]);

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  0LL,  0LL));
    [v7 addAction:v10];

    -[VSDeveloperSettingsProviderViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v7,  1LL,  0LL);
  }

  else
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController viewModel](self, "viewModel"));
    [v11 setTestingSystemTrust:1];

    id v12 = objc_alloc(&OBJC_CLASS___NSURL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController viewModel](self, "viewModel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 authURL]);
    id v15 = -[NSURL initWithString:](v12, "initWithString:", v14);

    id v16 = [[VSApplicationBootURLOperation alloc] initWithBootURL:v15 isDeveloper:0];
    [v16 setTest:1];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_ACF4;
    v22[3] = &unk_149F8;
    id v23 = v16;
    v24 = self;
    id v17 = v16;
    uint64_t v18 = VSMainThreadOperationWithBlock(v22);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v19 addDependency:v17];
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController privateQueue](self, "privateQueue"));
    [v20 addOperation:v17];

    VSEnqueueCompletionOperation(v19);
  }

- (void)donePressed:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController navigationController](self, "navigationController"));
  id v4 = [v5 popViewControllerAnimated:1];
}

- (void)deletePressed:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController identityProvider](self, "identityProvider", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VSDeveloperSettingsFacade sharedFacade](&OBJC_CLASS___VSDeveloperSettingsFacade, "sharedFacade"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_B228;
  v8[3] = &unk_14718;
  v8[4] = self;
  [v5 enqueueChange:2 withIdentityProvider:v4 completionHandler:v8];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController navigationController](self, "navigationController"));
  id v7 = [v6 popViewControllerAnimated:1];
}

- (id)loadSettingGroups
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v90 = "-[VSDeveloperSettingsProviderViewController loadSettingGroups]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController viewModel](self, "viewModel"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"DEVELOPER_PROVIDER_DISPLAY_NAME_TITLE" value:0 table:0]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"DEVELOPER_PROVIDER_DISPLAY_NAME_DESCRIPTION" value:0 table:0]);

  v63 = self;
  v80 = (void *)v10;
  v81 = (void *)v8;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v8,  v10,  v6,  @"displayName"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"DEVELOPER_PROVIDER_IDENTIFIER_TITLE" value:0 table:0]);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"DEVELOPER_PROVIDER_IDENTIFIER_DESCRIPTION" value:0 table:0]);

  v77 = (void *)v15;
  v78 = (void *)v13;
  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v13,  v15,  v6,  @"identifier"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 localizedStringForKey:@"DEVELOPER_PROVIDER_AUTH_URL_TITLE" value:0 table:0]);

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v20 = objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"DEVELOPER_PROVIDER_AUTH_URL_DESCRIPTION" value:0 table:0]);

  v74 = (void *)v20;
  v75 = (void *)v18;
  v79 = (void *)v11;
  v88[0] = v11;
  v88[1] = v16;
  v76 = (void *)v16;
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v18,  v20,  v6,  @"authURL"));
  v88[2] = v73;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v88, 3LL));
  uint64_t v22 = objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v21));

  v72 = (void *)v22;
  -[NSMutableArray addObject:](v5, "addObject:", v22);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v24 = objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"DEVELOPER_PROVIDER_SAML_DESCRIPTION" value:0 table:0]);

  v71 = (void *)v24;
  uint64_t v25 = objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  @"SAML",  v24,  v6,  @"supportSAML",  0LL,  0LL));
  objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 localizedStringForKey:@"DEVELOPER_PROVIDER_API_DESCRIPTION" value:0 table:0]);

  v69 = (void *)v27;
  uint64_t v28 = objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  @"API",  v27,  v6,  @"supportAPI",  0LL,  0LL));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v30 = objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"DEVELOPER_PROVIDER_AUTH_SCHEME_TITLE" value:0 table:0]);

  v70 = (void *)v25;
  v87[0] = v25;
  v87[1] = v28;
  v68 = (void *)v28;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v87, 2LL));
  v67 = (void *)v30;
  uint64_t v32 = objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v30,  v31));

  v66 = (void *)v32;
  -[NSMutableArray addObject:](v5, "addObject:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v34 = objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"DEVELOPER_PROVIDER_AUTH_URL_SYSTEM_TRUST" value:0 table:0]);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v36 = objc_claimAutoreleasedReturnValue( [v35 localizedStringForKey:@"DEVELOPER_PROVIDER_AUTH_URL_SYSTEM_TRUST_DESCRIPTION" value:0 table:0]);

  v64 = (void *)v36;
  v65 = (void *)v34;
  uint64_t v37 = objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v34,  v36,  v6,  @"requireAuthUrlSystemTrust",  0LL,  0LL));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v39 = objc_claimAutoreleasedReturnValue( [v38 localizedStringForKey:@"DEVELOPER_PROVIDER_XHR_REQUEST_SYSTEM_TRUST" value:0 table:0]);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v41 = objc_claimAutoreleasedReturnValue( [v40 localizedStringForKey:@"DEVELOPER_PROVIDER_XHR_REQUEST_SYSTEM_TRUST_DESCRIPTION" value:0 table:0]);

  v60 = (void *)v41;
  v61 = (void *)v39;
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v39,  v41,  v6,  @"requireXHRRequestSystemTrust",  0LL,  0LL));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  uint64_t v44 = objc_claimAutoreleasedReturnValue( [v43 localizedStringForKey:@"DEVELOPER_TEST_SYSTEM_TRUST_ACTION_TITLE" value:0 table:0]);

  v59 = (void *)v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v44,  0LL,  v6,  @"testSystemTrustHash",  v63,  "testSystemTrustPressed:"));
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_BBAC;
  v84[3] = &unk_146D0;
  id v46 = v6;
  id v85 = v46;
  [v45 setUpdateBlock:v84];
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue( [v47 localizedStringForKey:@"DEVELOPER_PROVIDER_PRODUCTION_SECURITY_GROUP_TITLE" value:0 table:0]);

  v62 = (void *)v37;
  v86[0] = v37;
  v86[1] = v42;
  v86[2] = v45;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v86, 3LL));
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v48,  v49));

  -[NSMutableArray addObject:](v5, "addObject:", v50);
  v51 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewController identityProvider](v63, "identityProvider"));

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v54 = v53;
  if (v52)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue( [v53 localizedStringForKey:@"DEVELOPER_DELETION_ACTION_TITLE" value:0 table:0]);

    v56 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v55,  0LL,  0LL,  0LL,  v63,  "deletePressed:"));
    -[NSMutableArray addObject:](v51, "addObject:", v56);
  }

  else
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue([v53 localizedStringForKey:@"DONE_BUTTON_TITLE" value:0 table:0]);

    v56 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v55,  0LL,  0LL,  0LL,  v63,  "donePressed:"));
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472LL;
    v82[2] = sub_BC40;
    v82[3] = &unk_146D0;
    id v83 = v46;
    [v56 setUpdateBlock:v82];
    -[NSMutableArray addObject:](v51, "addObject:", v56);
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v51));
  -[NSMutableArray addObject:](v5, "addObject:", v57);

  return v5;
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (VSDeveloperSettingsProviderViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (VSDeveloperSettingsFacade)facade
{
  return self->_facade;
}

- (void)setFacade:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end