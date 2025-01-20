@interface TVSettingsCertificateTrustViewController
- (id)loadSettingGroups;
- (void)_toggleTrust:(id)a3;
@end

@implementation TVSettingsCertificateTrustViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCertificateTrustFacade sharedInstance]( &OBJC_CLASS___TVSettingsCertificateTrustFacade,  "sharedInstance"));
  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_1000CA700;
  v10 = &unk_100193C68;
  objc_copyWeak(&v11, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v3,  @"trustCertificates",  &v7));
  v13 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v13,  1LL,  v7,  v8,  v9,  v10));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

- (void)_toggleTrust:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  if ([v4 isTrusted])
  {
    [v4 setTrusted:0];
  }

  else
  {
    uint64_t v5 = TSKLocString(@"RootCertificateWarningTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = TSKLocString(@"RootCertificateWarningMessage");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));

    uint64_t v10 = TSKLocString(@"Continue");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000CA9F4;
    v17[3] = &unk_10018F018;
    id v18 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v17));
    [v9 addAction:v12];

    uint64_t v13 = TSKLocString(@"Cancel");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  0LL));
    [v9 addAction:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCertificateTrustViewController navigationController](self, "navigationController"));
    [v16 presentViewController:v9 animated:1 completion:0];
  }
}

@end