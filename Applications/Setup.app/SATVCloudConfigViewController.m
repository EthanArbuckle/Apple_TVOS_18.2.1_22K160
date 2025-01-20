@interface SATVCloudConfigViewController
- (BOOL)consentViewControllerCanSelectDissent:(id)a3;
- (id)_aboutText;
- (id)auxiliaryButtonTextForConsentViewController:(id)a3;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footerButtonTextForConsentViewController:(id)a3;
- (id)footnoteTextForConsentViewController:(id)a3;
- (id)subtitleTextForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_applyConfiguration:(BOOL)a3;
- (void)_leaveRemoteManagementAndErase;
- (void)_obliterate;
- (void)_presentEraseAlertWithTitle:(id)a3 message:(id)a4 eraseHandler:(id)a5;
- (void)_showEraseDeviceAlert;
- (void)autoAdvance;
- (void)consentViewControllerDidSelectAuxiliary:(id)a3;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectDissent:(id)a3;
- (void)consentViewControllerDidSelectFooter:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)showLeaveRemoteManagementAlert;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SATVCloudConfigViewController

- (void)autoAdvance
{
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVCloudConfigViewController;
  -[SATVCloudConfigViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___SATVConsentViewController);
  -[SATVConsentViewController setDelegate:](v3, "setDelegate:", self);
  -[SATVConsentViewController setDataSource:](v3, "setDataSource:", self);
  -[SATVCloudConfigViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](v3, "view"));
  [v4 addSubview:v5];

  -[SATVConsentViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVCloudConfigViewController;
  -[SATVCloudConfigViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATVCloudConfigViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  4LL,  4LL);
}

- (id)titleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"REMOTE_MANAGEMENT_TITLE", @"Localizable");
}

- (id)subtitleTextForConsentViewController:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection", a3));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudConfigurationDetails]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMCCCIsMandatoryKey]);
  unsigned int v6 = [v5 BOOLValue];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMCCCOrganizationNameKey]);
  if (v6) {
    v8 = @"CLOUD_CONFIG_DESCRIPTION_MANDATORY_APPLETV";
  }
  else {
    v8 = @"CLOUD_CONFIG_DESCRIPTION_OPTIONAL_APPLETV";
  }
  id v9 = sub_10000D7CC(v8, @"Localizable");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v7));

  return v11;
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection", a3));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudConfigurationDetails]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMCCCIsMandatoryKey]);
  unsigned int v6 = [v5 BOOLValue];

  if (v6) {
    v7 = @"CONTINUE_BUTTON";
  }
  else {
    v7 = @"CLOUD_CONFIG_ACCEPT";
  }
  id v8 = sub_10000D7CC(v7, @"Localizable");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection", a3));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudConfigurationDetails]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMCCCIsMandatoryKey]);
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) != 0)
  {
    v7 = 0LL;
  }

  else
  {
    id v8 = sub_10000D7CC(@"CLOUD_CONFIG_SKIP", @"Localizable");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (id)footerButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"REMOTE_MANAGEMENT_ABOUT", @"Localizable");
}

- (id)footnoteTextForConsentViewController:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection", a3));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudConfigurationDetails]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMCCCOrganizationNameKey]);
  id v6 = sub_10000D7CC(@"REMOTE_MANAGEMENT_WHAT_DETAIL_APPLETV", @"Localizable");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v5));

  return v8;
}

- (id)auxiliaryButtonTextForConsentViewController:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection", a3));
  unsigned int v4 = [v3 isProvisionallyEnrolled];

  if (v4)
  {
    id v5 = sub_10000D7CC(@"REMOTE_MANAGEMENT_LEAVE", @"Localizable");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)consentViewControllerDidSelectConsent:(id)a3
{
  id v4 = sub_10002AF94();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "User wants to apply the cloud configuration",  v6,  2u);
  }

  -[SATVCloudConfigViewController _applyConfiguration:](self, "_applyConfiguration:", 1LL);
}

- (void)consentViewControllerDidSelectDissent:(id)a3
{
  id v4 = sub_10002AF94();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "User does not want to apply the cloud configuration",  v6,  2u);
  }

  -[SATVCloudConfigViewController _applyConfiguration:](self, "_applyConfiguration:", 0LL);
}

- (void)consentViewControllerDidSelectFooter:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[SATVLegalPresentation sharedInstance](&OBJC_CLASS___SATVLegalPresentation, "sharedInstance", a3));
  id v4 = sub_10000D7CC(@"REMOTE_MANAGEMENT_TITLE", @"Localizable");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigViewController _aboutText](self, "_aboutText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigViewController navigationController](self, "navigationController"));
  [v8 displayLegalNoticeWithTitle:v5 terms:v6 navigationController:v7];
}

- (void)consentViewControllerDidSelectAuxiliary:(id)a3
{
}

- (BOOL)consentViewControllerCanSelectDissent:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection", a3));
  char v4 = [v3 wasCloudConfigurationApplied] ^ 1;

  return v4;
}

- (id)_aboutText
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableString, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  char v4 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationName]);

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationName]);
    [v2 appendString:v6];

    [v2 appendString:@"\n"];
  }

  v7 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationAddressLine1]);
  [v7 setValue:v8 forKey:CNPostalAddressStreetKey];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationAddressLine2]);
  [v7 setValue:v9 forKey:CNPostalAddressSubLocalityKey];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationCity]);
  [v7 setValue:v10 forKey:CNPostalAddressCityKey];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationRegion]);
  [v7 setValue:v11 forKey:CNPostalAddressStateKey];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationZipCode]);
  [v7 setValue:v12 forKey:CNPostalAddressPostalCodeKey];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationCountry]);
  [v7 setValue:v13 forKey:CNPostalAddressCountryKey];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[CNPostalAddress postalAddressWithDictionaryRepresentation:]( &OBJC_CLASS___CNPostalAddress,  "postalAddressWithDictionaryRepresentation:",  v7));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[CNPostalAddressFormatter stringFromPostalAddress:style:]( &OBJC_CLASS___CNPostalAddressFormatter,  "stringFromPostalAddress:style:",  v14,  0LL));
    if ([v15 length])
    {
      [v2 appendString:v15];
      [v2 appendString:@"\n"];

LABEL_12:
      v20 = v14;
      goto LABEL_13;
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationAddress]);

  if (!v16) {
    goto LABEL_12;
  }
  v18 = (void *)objc_opt_new(&OBJC_CLASS___CNPostalAddressFormatter, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationAddress]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 postalAddressFromString:v19]);

  if (!v20
    || (uint64_t v21 = objc_claimAutoreleasedReturnValue( +[CNPostalAddressFormatter stringFromPostalAddress:style:]( &OBJC_CLASS___CNPostalAddressFormatter,  "stringFromPostalAddress:style:",  v20,  0LL))) == 0)
  {
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v3 organizationAddress]);
  }

  v22 = (void *)v21;
  [v2 appendString:v21];

  [v2 appendString:@"\n"];
LABEL_13:
  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationSupportPhone]);

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationSupportPhone]);
    [v2 appendString:v24];

    [v2 appendString:@"\n"];
  }

  [v2 appendString:@"\n"];
  [v2 appendString:@"\n"];
  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationName]);

  if (v25)
  {
    id v26 = sub_10000D7CC(@"REMOTE_MANAGEMENT_ABOUT_DESCRIPTION_APPLETV", @"Localizable");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationName]);
    objc_msgSend(v2, "appendFormat:", v27, v28);

    [v2 appendString:@"\n"];
  }

  id v29 = [v2 copy];

  return v29;
}

- (void)_applyConfiguration:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
    [v5 cloudConfigDidFinishWasApplied:0];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigViewController completionHandler](self, "completionHandler"));

  if (v6)
  {
    v7 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATVCloudConfigViewController completionHandler]( self,  "completionHandler"));
    v7[2](v7, v3);
  }

- (void)_presentEraseAlertWithTitle:(id)a3 message:(id)a4 eraseHandler:(id)a5
{
  id v8 = a5;
  id v16 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  a3,  a4,  1LL));
  id v9 = sub_10000D7CC(@"ERASE", @"Localizable");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  2LL,  v8));

  [v16 addAction:v11];
  id v12 = sub_10000D7CC(@"CANCEL", @"Localizable");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  1LL,  0LL));

  [v16 addAction:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCloudConfigViewController navigationController](self, "navigationController"));
  [v15 presentViewController:v16 animated:1 completion:0];
}

- (void)showLeaveRemoteManagementAlert
{
  id v3 = sub_10000D7CC(@"REMOTE_MANAGEMENT_LEAVE", @"Localizable");
  char v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_10000D7CC(@"REMOTE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT_ALERT_BODY_APPLETV", @"Localizable");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F0E0;
  v7[3] = &unk_1000C9418;
  objc_copyWeak(&v8, &location);
  -[SATVCloudConfigViewController _presentEraseAlertWithTitle:message:eraseHandler:]( self,  "_presentEraseAlertWithTitle:message:eraseHandler:",  v4,  v6,  v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_showEraseDeviceAlert
{
  id v3 = sub_10000D7CC(@"REMOTE_MANAGEMENT_ERASE_ALERT_TITLE_APPLETV", @"Localizable");
  char v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_10000D7CC(@"REMOTE_MANAGEMENT_ERASE_ALERT_BODY", @"Localizable");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F284;
  v7[3] = &unk_1000C9418;
  objc_copyWeak(&v8, &location);
  -[SATVCloudConfigViewController _presentEraseAlertWithTitle:message:eraseHandler:]( self,  "_presentEraseAlertWithTitle:message:eraseHandler:",  v4,  v6,  v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_leaveRemoteManagementAndErase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000F3EC;
  v3[3] = &unk_1000C9668;
  objc_copyWeak(&v4, &location);
  [v2 unenrollWithCompletionBlock:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_obliterate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateService sharedInstance](&OBJC_CLASS___PBSOSUpdateService, "sharedInstance"));
  [v2 obliterateDataPreservingPaths:0 withCompletion:&stru_1000C96D0];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end