@interface MCTVPayloadDetailsViewController
- (DMCPayloadViewModel)payloadViewModel;
- (MCTVPayloadDetailsViewController)initWithPayloadViewModel:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)loadSettingGroups;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MCTVPayloadDetailsViewController

- (MCTVPayloadDetailsViewController)initWithPayloadViewModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCTVPayloadDetailsViewController;
  v6 = -[MCTVPayloadDetailsViewController initWithStyle:](&v10, "initWithStyle:", 1LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payloadViewModel, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 friendlyName]);
    -[MCTVPayloadDetailsViewController setTitle:](v7, "setTitle:", v8);
  }

  return v7;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCTVPayloadDetailsViewController;
  -[MCTVPayloadDetailsViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVPayloadDetailsViewController tableView](self, "tableView"));
  [v3 setEstimatedRowHeight:66.0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVPayloadDetailsViewController tableView](self, "tableView"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MCTVExpandedDetailCell);
  v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVExpandedDetailCell);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 registerClass:v5 forCellReuseIdentifier:v8];
}

- (id)loadSettingGroups
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMCPayloadViewModel certificateProperties](self->_payloadViewModel, "certificateProperties"));
  id v5 = [v4 count];

  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___DMCCertificateProperties);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMCPayloadViewModel certificateProperties](self->_payloadViewModel, "certificateProperties"));
    v8 = -[DMCCertificateProperties initWithCertificateProperties:](v6, "initWithCertificateProperties:", v7);

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMCCertificateProperties keyValueSections](v8, "keyValueSections"));
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( -[DMCPayloadViewModel payloadDescriptionKeyValueSections]( self->_payloadViewModel,  "payloadDescriptionKeyValueSections"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v10);

  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  obj = v3;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sectionTitle]);
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v17,  v16,  @"sectionKeyValues",  &stru_289F8));

        v19 = (void *)objc_claimAutoreleasedReturnValue([v16 sectionFooter]);
        [v18 setLocalizedDescription:v19];

        -[NSMutableArray addObject:](v11, "addObject:", v18);
      }

      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v13);
  }

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVPayloadDetailsViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a4));
  v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVExpandedDetailCell);
  objc_super v9 = NSStringFromClass(v8);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v10]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedTitle]);
  [v11 setTitleText:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedValue]);
  [v11 setDetailText:v13];

  [v11 updateConstraintsIfNeeded];
  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (DMCPayloadViewModel)payloadViewModel
{
  return self->_payloadViewModel;
}

- (void).cxx_destruct
{
}

@end