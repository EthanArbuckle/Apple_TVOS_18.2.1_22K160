@interface MCTVProfileDetailViewController
+ (id)_titleForMode:(unint64_t)a3 profileViewModel:(id)a4;
- (BOOL)canPop;
- (DMCProfileViewModel)profileViewModel;
- (MCTVProfileDetailViewController)initWithProfileViewModel:(id)a3 mode:(unint64_t)a4;
- (NSArray)sections;
- (id)_appSettingItemForModelObj:(id)a3 profileViewModel:(id)a4;
- (id)_certificateSettingItemForModelObj:(id)a3;
- (id)_payloadSettingItemForModelObj:(id)a3;
- (id)_sections;
- (id)_textForLabel:(id)a3 value:(id)a4;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)mode;
- (void)_pop;
- (void)_profileChanged:(id)a3;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MCTVProfileDetailViewController

- (MCTVProfileDetailViewController)initWithProfileViewModel:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCTVProfileDetailViewController;
  v8 = -[MCTVProfileDetailViewController initWithStyle:](&v16, "initWithStyle:", 1LL);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_profileViewModel, a3);
    v9->_mode = a4;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController _sections](v9, "_sections"));
    sections = v9->_sections;
    v9->_sections = (NSArray *)v10;

    id v12 = [(id)objc_opt_class(v9) _titleForMode:a4 profileViewModel:v7];
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[MCTVProfileDetailViewController setTitle:](v9, "setTitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v9 selector:"_profileChanged:" name:@"kMCUIProfileDidChangeNotification" object:v9->_profileViewModel];
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"kMCUIProfileDidChangeNotification" object:self->_profileViewModel];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVProfileDetailViewController;
  -[MCTVProfileDetailViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCTVProfileDetailViewController;
  -[MCTVProfileDetailViewController viewDidLoad](&v10, "viewDidLoad");
  if (self->_mode != 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController tableView](self, "tableView"));
    [v3 setRowHeight:UITableViewAutomaticDimension];

    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController tableView](self, "tableView"));
    [v4 setEstimatedRowHeight:500.0];

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController tableView](self, "tableView"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___MCTVMultiLineCell);
    id v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVMultiLineCell);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v5 registerClass:v6 forCellReuseIdentifier:v9];
  }

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVProfileDetailViewController;
  -[MCTVProfileDetailViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  self->_canPop = 1;
  if (!-[NSArray count](self->_sections, "count")) {
    -[MCTVProfileDetailViewController _pop](self, "_pop");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVProfileDetailViewController;
  -[MCTVProfileDetailViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  self->_canPop = 0;
}

- (void)_profileChanged:(id)a3
{
  objc_super v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController _sections](self, "_sections", a3));
  sections = self->_sections;
  self->_sections = v4;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController _sections](self, "_sections"));
  id v7 = [v6 count];

  if (v7)
  {
    -[MCTVProfileDetailViewController reloadSettings](self, "reloadSettings");
  }

  else if (self->_canPop)
  {
    -[MCTVProfileDetailViewController _pop](self, "_pop");
  }

- (void)_pop
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_CB00;
  v2[3] = &unk_28610;
  objc_copyWeak(&v3, &location);
  dispatch_async(&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (id)loadSettingGroups
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  obj = self->_sections;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v7);
        v9 = self->_profileViewModel;
        unint64_t mode = self->_mode;
        id v11 = v8;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sectionTitle]);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_CD64;
        v19[3] = &unk_28A20;
        v20 = v9;
        unint64_t v21 = mode;
        v19[4] = self;
        v13 = v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v12,  v11,  @"payloadViewModels",  v19));

        v15 = (void *)objc_claimAutoreleasedReturnValue([v11 sectionFooter]);
        [v14 setLocalizedDescription:v15];

        -[NSMutableArray addObject:](v3, "addObject:", v14);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v5);
  }

  id v16 = -[NSMutableArray copy](v3, "copy");
  return v16;
}

- (id)_appSettingItemForModelObj:(id)a3 profileViewModel:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 managedApp]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedName]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_CF20;
    v12[3] = &unk_28A48;
    id v13 = v5;
    id v14 = v7;
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  v8,  0LL,  v12));
  }

  else
  {
    objc_super v10 = 0LL;
  }

  return v10;
}

- (id)_payloadSettingItemForModelObj:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 friendlyName]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_D020;
  v8[3] = &unk_28A70;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  0LL,  v5,  0LL,  v8));

  objc_msgSend(v6, "setEditable:", objc_msgSend(v5, "hasDetails"));
  return v6;
}

- (id)_certificateSettingItemForModelObj:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_D128;
  v4[3] = &unk_28A90;
  v4[4] = a3;
  return (id)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  0LL,  0LL,  a3,  0LL,  v4));
}

- (id)previewForItemAtIndexPath:(id)a3
{
  if (self->_mode == 1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a3));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);
    id v5 = objc_alloc(&OBJC_CLASS___UIImageView);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tv_applicationFlatIcon"));
    id v7 = -[UIImageView initWithImage:](v5, "initWithImage:", v6);

    -[UIImageView setBounds:](v7, "setBounds:", 0.0, 0.0, 370.0, 222.0);
    id v8 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    [v8 setContentView:v7];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
    [v8 setDescriptionText:v9];

    return v8;
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___MCTVProfileDetailViewController;
    id v11 = -[MCTVProfileDetailViewController previewForItemAtIndexPath:](&v12, "previewForItemAtIndexPath:", a3);
    return (id)objc_claimAutoreleasedReturnValue(v11);
  }

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);
  if (self->_mode == 1)
  {
    v39.receiver = self;
    v39.super_class = (Class)&OBJC_CLASS___MCTVProfileDetailViewController;
    id v10 = -[MCTVProfileDetailViewController tableView:cellForRowAtIndexPath:]( &v39,  "tableView:cellForRowAtIndexPath:",  v6,  v7);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  else
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___DMCPayloadViewModel);
    if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
    {
      id v13 = v9;
      id v14 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVMultiLineCell);
      v15 = NSStringFromClass(v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v16 forIndexPath:v7]);

      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 title]);
      [v11 setTitleText:v17];

      v18 = (void *)objc_claimAutoreleasedReturnValue([v13 subtitle1Label]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v13 subtitle1Description]);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController _textForLabel:value:](self, "_textForLabel:value:", v18, v19));
      [v11 setSubtitle1Text:v20];

      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 subtitle2Label]);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v13 subtitle2Description]);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController _textForLabel:value:](self, "_textForLabel:value:", v21, v22));
      [v11 setSubtitle2Text:v23];

      LODWORD(v23) = [v13 hasDetails];
      [v11 setAccessoryType:v23];
      [v11 updateConstraintsIfNeeded];
    }

    else
    {
      __int128 v24 = (objc_class *)objc_opt_class(&OBJC_CLASS___MCTVMultiLineCell);
      __int128 v25 = NSStringFromClass(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v26 forIndexPath:v7]);

      v27 = (__CFString *)SecCertificateCopySubjectSummary((SecCertificateRef)v9);
      if (v27) {
        [v11 setTitleText:v27];
      }
      v28 = (void *)SecCertificateCopyIssuerSummary(v9);
      if (v28)
      {
        id v29 = MCUILocalizedString(@"ISSUED_BY");
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController _textForLabel:value:](self, "_textForLabel:value:", v30, v28));
        [v11 setSubtitle1Text:v31];
      }

      SecCertificateNotValidAfter(v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
      uint64_t v33 = objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v32,  3LL,  0LL));
      v34 = (void *)v33;
      if (v32 && v33)
      {
        v38 = v27;
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[DMCProfileDetailsCell localizedExpirationLabelForExpiry:]( &OBJC_CLASS___DMCProfileDetailsCell,  "localizedExpirationLabelForExpiry:",  v32));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileDetailViewController _textForLabel:value:](self, "_textForLabel:value:", v35, v34));
        [v11 setSubtitle2Text:v36];

        v27 = v38;
      }

      [v11 setAccessoryType:1];
      [v11 updateConstraintsIfNeeded];
    }
  }

  return v11;
}

+ (id)_titleForMode:(unint64_t)a3 profileViewModel:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 == 2)
  {
    id v7 = @"RESTRICTIONS";
  }

  else
  {
    if (a3 != 1)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 friendlyName]);

      goto LABEL_7;
    }

    id v7 = @"APPS";
  }

  id v8 = MCUILocalizedString(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
LABEL_7:

  return v9;
}

- (id)_sections
{
  unint64_t mode = self->_mode;
  if (mode == 2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMCProfileViewModel restrictionSections](self->_profileViewModel, "restrictionSections"));
  }

  else if (mode == 1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMCProfileViewModel managedAppSections](self->_profileViewModel, "managedAppSections"));
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMCProfileViewModel moreDetailsSections](self->_profileViewModel, "moreDetailsSections"));
  }

  id v4 = v3;
  id v5 = [v3 copy];

  return v5;
}

- (id)_textForLabel:(id)a3 value:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if ([v6 length]) {
      id v7 = (id)objc_claimAutoreleasedReturnValue([v5 stringByAppendingFormat:@" %@", v6]);
    }
    else {
      id v7 = v5;
    }
  }

  else
  {
    id v7 = v6;
  }

  id v8 = v7;

  return v8;
}

- (DMCProfileViewModel)profileViewModel
{
  return self->_profileViewModel;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)canPop
{
  return self->_canPop;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
}

@end