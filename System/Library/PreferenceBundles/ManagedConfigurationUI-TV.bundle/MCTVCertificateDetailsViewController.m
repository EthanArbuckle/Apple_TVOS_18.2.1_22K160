@interface MCTVCertificateDetailsViewController
+ (id)_dateFormatter;
- (DMCCertificateProperties)certInfo;
- (MCTVCertificateDetailsViewController)initWithCertificate:(__SecCertificate *)a3;
- (MCTVCertificateDetailsViewController)initWithPayloadViewModel:(id)a3;
- (id)loadSettingGroups;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MCTVCertificateDetailsViewController

- (MCTVCertificateDetailsViewController)initWithCertificate:(__SecCertificate *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCTVCertificateDetailsViewController;
  v4 = -[MCTVCertificateDetailsViewController initWithStyle:](&v9, "initWithStyle:", 1LL);
  if (v4)
  {
    v5 = -[DMCCertificateProperties initWithCertificate:]( objc_alloc(&OBJC_CLASS___DMCCertificateProperties),  "initWithCertificate:",  a3);
    certInfo = v4->_certInfo;
    v4->_certInfo = v5;

    v7 = (__CFString *)SecCertificateCopySubjectSummary(a3);
    if (v7) {
      -[MCTVCertificateDetailsViewController setTitle:](v4, "setTitle:", v7);
    }
  }

  return v4;
}

- (MCTVCertificateDetailsViewController)initWithPayloadViewModel:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCTVCertificateDetailsViewController;
  v5 = -[MCTVCertificateDetailsViewController initWithStyle:](&v11, "initWithStyle:", 1LL);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 certificateProperties]);
    v7 = -[DMCCertificateProperties initWithCertificateProperties:]( objc_alloc(&OBJC_CLASS___DMCCertificateProperties),  "initWithCertificateProperties:",  v6);
    certInfo = v5->_certInfo;
    v5->_certInfo = v7;

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v4 friendlyName]);
    -[MCTVCertificateDetailsViewController setTitle:](v5, "setTitle:", v9);
  }

  return v5;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCTVCertificateDetailsViewController;
  -[MCTVCertificateDetailsViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVCertificateDetailsViewController tableView](self, "tableView"));
  [v3 setRowHeight:UITableViewAutomaticDimension];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVCertificateDetailsViewController tableView](self, "tableView"));
  [v4 setEstimatedRowHeight:66.0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVCertificateDetailsViewController tableView](self, "tableView"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MCTVExpandedDetailCell);
  v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVExpandedDetailCell);
  v8 = NSStringFromClass(v7);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v5 registerClass:v6 forCellReuseIdentifier:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVCertificateDetailsViewController tableView](self, "tableView"));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___MCTVMultiLineCell);
  v12 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVMultiLineCell);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v10 registerClass:v11 forCellReuseIdentifier:v14];
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMCCertificateProperties keyValueSections](self->_certInfo, "keyValueSections"));
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sectionTitle]);
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v9,  v8,  @"sectionKeyValues",  &stru_28780));

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 sectionFooter]);
        [v10 setLocalizedDescription:v11];

        -[NSMutableArray addObject:](v3, "addObject:", v10);
      }

      id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v5);
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVCertificateDetailsViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSKSettingItem valueForSettingItem:](&OBJC_CLASS___TSKSettingItem, "valueForSettingItem:", v7));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
    || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v8, v10) & 1) != 0))
  {
    uint64_t v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVMultiLineCell);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v13]);

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedTitle]);
    [v14 setTitleText:v15];

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedValue]);
    [v14 setSubtitle1Text:v16];
  }

  else
  {
    __int128 v17 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVExpandedDetailCell);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v19]);

    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedTitle]);
    [v14 setTitleText:v20];

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedValue]);
    [v14 setDetailText:v16];
  }

  return v14;
}

+ (id)_dateFormatter
{
  v2 = (void *)qword_311D8;
  if (!qword_311D8)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    id v4 = (void *)qword_311D8;
    qword_311D8 = (uint64_t)v3;

    [(id)qword_311D8 setDateStyle:2];
    [(id)qword_311D8 setTimeStyle:2];
    v2 = (void *)qword_311D8;
  }

  return v2;
}

- (DMCCertificateProperties)certInfo
{
  return self->_certInfo;
}

- (void).cxx_destruct
{
}

@end