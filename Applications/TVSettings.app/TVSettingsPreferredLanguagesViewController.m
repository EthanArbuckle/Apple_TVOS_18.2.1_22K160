@interface TVSettingsPreferredLanguagesViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (PLSInternationalizationSettings)intlSettings;
- (TSKPreviewViewController)languagePreviewViewController;
- (TSKSettingGroup)addGroup;
- (TSKSettingGroup)preferredLanguagesGroup;
- (TVSettingsPreferredLanguagesViewController)init;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (UIBarButtonItem)editButton;
- (UIGestureRecognizer)backGestureRecognizer;
- (id)displayNameForKeyboardInputModeVariantWithLanguageIdentifier:(id)a3;
- (id)languageFormatter;
- (id)languageIdentifierWithoutCurrentRegion:(id)a3;
- (id)languageListFilter;
- (id)loadSettingGroups;
- (id)localizedLanguageDisplayName:(id)a3;
- (id)localizedLanguageDisplayName:(id)a3 removeCurrentRegion:(BOOL)a4;
- (id)localizedLanguageFormatter;
- (id)preferredLanguagesManager;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)systemLanguageIdentifier;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)preferredLanguagesGroupCount;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)addPreferredLanguageWithIdentifier:(id)a3 presenter:(id)a4 completion:(id)a5;
- (void)cancelEditing:(id)a3;
- (void)commitLanguageChanges:(BOOL)a3;
- (void)confirmSiriActivationIfNeededWithNewLanguage:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleEditingButton:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareLanguageChangeAfterSiriActivation;
- (void)setAddGroup:(id)a3;
- (void)setBackGestureRecognizer:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIntlSettings:(id)a3;
- (void)setPreferredLanguagesGroup:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)updateViews;
- (void)updateViewsAnimated:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsPreferredLanguagesViewController

- (TVSettingsPreferredLanguagesViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsPreferredLanguagesViewController;
  v2 = -[TVSettingsPreferredLanguagesViewController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PLSInternationalizationSettings);
    intlSettings = v2->_intlSettings;
    v2->_intlSettings = v3;
  }

  return v2;
}

- (id)preferredLanguagesManager
{
  return +[TVCSPreferredLanguagesManager sharedInstance](&OBJC_CLASS___TVCSPreferredLanguagesManager, "sharedInstance");
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSettingsPreferredLanguagesViewController;
  -[TVSettingsPreferredLanguagesViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "cancelEditing:");
  -[UITapGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1001AEC50);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  -[TVSettingsPreferredLanguagesViewController setBackGestureRecognizer:](self, "setBackGestureRecognizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  [v5 addGestureRecognizer:v3];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController tableView](self, "tableView"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v6 registerClass:v7 forCellReuseIdentifier:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController tableView](self, "tableView"));
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___TSKTableViewTextCell);
  v13 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewTextCell);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v11 registerClass:v12 forCellReuseIdentifier:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  [v16 addObserver:self forKeyPath:@"preferredLanguages" options:0 context:off_1001DF9C0];

  v17 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  [v17 addObserver:self forKeyPath:@"preferredInputModes" options:0 context:off_1001DF9C8];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController tableView](self, "tableView"));
  [v18 setAllowsSelectionDuringEditing:1];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v19 addObserver:self selector:"cancelEditing:" name:UIApplicationWillResignActiveNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsPreferredLanguagesViewController;
  -[TVSettingsPreferredLanguagesViewController viewWillAppear:](&v5, "viewWillAppear:");
  -[TVSettingsPreferredLanguagesViewController updateViewsAnimated:](self, "updateViewsAnimated:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController backGestureRecognizer](self, "backGestureRecognizer"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController backGestureRecognizer](self, "backGestureRecognizer"));
  [v6 removeGestureRecognizer:v7];

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsPreferredLanguagesViewController;
  -[TVSettingsPreferredLanguagesViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[TVSettingsPreferredLanguagesViewController updateViewsAnimated:](self, "updateViewsAnimated:", a4);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsPreferredLanguagesViewController;
  -[TVSettingsPreferredLanguagesViewController setEditing:animated:](&v7, "setEditing:animated:", v5, v4);
}

- (id)loadSettingGroups
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController languageFormatter](self, "languageFormatter"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController localizedLanguageFormatter]( self,  "localizedLanguageFormatter"));
  uint64_t v5 = TSKLocString(@"LanguagePreferredGroupTitle");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10003EDD4;
  v22[3] = &unk_100190328;
  objc_copyWeak(&v26, &location);
  id v8 = v3;
  id v23 = v8;
  id v9 = v4;
  id v24 = v9;
  v25 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v6,  v7,  @"preferredLanguages",  v22));

  -[TVSettingsPreferredLanguagesViewController setPreferredLanguagesGroup:](self, "setPreferredLanguagesGroup:", v10);
  uint64_t v11 = TSKLocString(@"LanguagePreferredAddAction");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10003F038;
  v20[3] = &unk_10018E9D8;
  objc_copyWeak(&v21, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v12,  0LL,  0LL,  0LL,  v20));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003F200;
  v18[3] = &unk_10018E9B0;
  objc_copyWeak(&v19, &location);
  [v13 setUpdateBlock:v18];
  v29 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v14));

  -[TVSettingsPreferredLanguagesViewController setAddGroup:](self, "setAddGroup:", v15);
  v28[0] = v10;
  v28[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  return v16;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF9C0 == a6 || off_1001DF9C8 == a6)
  {
    -[TVSettingsPreferredLanguagesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVSettingsPreferredLanguagesViewController;
    -[TVSettingsPreferredLanguagesViewController observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)dealloc
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  [v3 removeObserver:self forKeyPath:@"preferredLanguages" context:off_1001DF9C0];

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  [v4 removeObserver:self forKeyPath:@"preferredInputModes" context:off_1001DF9C8];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsPreferredLanguagesViewController;
  -[TVSettingsPreferredLanguagesViewController dealloc](&v6, "dealloc");
}

- (UIBarButtonItem)editButton
{
  editButton = self->_editButton;
  if (!editButton)
  {
    BOOL v4 = objc_alloc(&OBJC_CLASS___UIBarButtonItem);
    uint64_t v5 = TSKLocString(@"LanguageEditButtonTitle");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_super v7 = -[UIBarButtonItem initWithTitle:style:target:action:]( v4,  "initWithTitle:style:target:action:",  v6,  0LL,  self,  "handleEditingButton:");
    -[TVSettingsPreferredLanguagesViewController setEditButton:](self, "setEditButton:", v7);

    -[UIBarButtonItem setTag:](self->_editButton, "setTag:", 0LL);
    editButton = self->_editButton;
  }

  return editButton;
}

- (UIBarButtonItem)doneButton
{
  doneButton = self->_doneButton;
  if (!doneButton)
  {
    BOOL v4 = objc_alloc(&OBJC_CLASS___UIBarButtonItem);
    uint64_t v5 = TSKLocString(@"LanguageDoneButtonTitle");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_super v7 = -[UIBarButtonItem initWithTitle:style:target:action:]( v4,  "initWithTitle:style:target:action:",  v6,  0LL,  self,  "handleEditingButton:");
    -[TVSettingsPreferredLanguagesViewController setDoneButton:](self, "setDoneButton:", v7);

    -[UIBarButtonItem setTag:](self->_doneButton, "setTag:", 1LL);
    doneButton = self->_doneButton;
  }

  return doneButton;
}

- (UIBarButtonItem)cancelButton
{
  cancelButton = self->_cancelButton;
  if (!cancelButton)
  {
    BOOL v4 = objc_alloc(&OBJC_CLASS___UIBarButtonItem);
    uint64_t v5 = TSKLocString(@"LanguageCancelButtonTitle");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_super v7 = -[UIBarButtonItem initWithTitle:style:target:action:]( v4,  "initWithTitle:style:target:action:",  v6,  0LL,  self,  "handleEditingButton:");
    -[TVSettingsPreferredLanguagesViewController setCancelButton:](self, "setCancelButton:", v7);

    -[UIBarButtonItem setTag:](self->_cancelButton, "setTag:", 2LL);
    cancelButton = self->_cancelButton;
  }

  return cancelButton;
}

- (void)handleEditingButton:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v30 = (objc_class *)objc_opt_class(&OBJC_CLASS___UIBarButtonItem);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value for '%@' was unexpectedly nil. Expected %@.",  @"sender",  v32));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F74D0(a2);
    }
LABEL_36:
    _bs_set_crash_log_message([v33 UTF8String]);
    __break(0);
    JUMPOUT(0x10003F8C0LL);
  }

  objc_super v6 = v5;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIBarButtonItem);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v34 = (objc_class *)[v6 classForCoder];
    if (!v34) {
      v34 = (objc_class *)objc_opt_class(v6);
    }
    v35 = NSStringFromClass(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (objc_class *)objc_opt_class(&OBJC_CLASS___UIBarButtonItem);
    v38 = NSStringFromClass(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value for '%@' was of unexpected class %@. Expected %@.",  @"sender",  v36,  v39));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F74D0(a2);
    }
    goto LABEL_36;
  }

  id v8 = v6;
  id v9 = [v8 tag];
  if (v9 == (id)2)
  {
    uint64_t v15 = TVCSLanguageLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Cancel in edit mode for preferred languages",  v42,  2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
    unsigned int v18 = [v17 isDirty];

    uint64_t v19 = TVCSLanguageLog();
    objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v21)
      {
        *(_WORD *)v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Discarding changes", v41, 2u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
      [v22 revertPreferredLanguages];

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController tableView](self, "tableView"));
      [v23 setEditing:0];

      -[TVSettingsPreferredLanguagesViewController reloadSettings](self, "reloadSettings");
      goto LABEL_28;
    }

    if (v21)
    {
      *(_WORD *)v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "No changes to discard", v40, 2u);
    }

LABEL_26:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController tableView](self, "tableView"));
    v13 = v12;
    uint64_t v14 = 0LL;
LABEL_27:
    [v12 setEditing:v14];

    -[TVSettingsPreferredLanguagesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
    goto LABEL_28;
  }

  if (v9 == (id)1)
  {
    uint64_t v24 = TVCSLanguageLog();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Apply changes in edit mode for preferred languages",  v43,  2u);
    }

    -[TVSettingsPreferredLanguagesViewController prepareLanguageChangeAfterSiriActivation]( self,  "prepareLanguageChangeAfterSiriActivation");
    goto LABEL_26;
  }

  if (!v9)
  {
    uint64_t v10 = TVCSLanguageLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Entering edit mode for preferred languages",  buf,  2u);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController tableView](self, "tableView"));
    v13 = v12;
    uint64_t v14 = 1LL;
    goto LABEL_27;
  }

  uint64_t v26 = TVCSLanguageLog();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_1000F75E8(v27);
  }

  uint64_t v28 = TVCSLanguageLog();
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_1000F7574((uint64_t)v8, v29);
  }

LABEL_28:
  -[TVSettingsPreferredLanguagesViewController updateViews](self, "updateViews");
}

- (void)updateViews
{
}

- (void)updateViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController navigationItem](self, "navigationItem"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController tableView](self, "tableView"));
  unsigned int v7 = [v6 isEditing];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController doneButton](self, "doneButton"));
    v14[0] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController cancelButton](self, "cancelButton"));
    v14[1] = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
    [v5 setRightBarButtonItems:v10 animated:v3];
  }

  else if (-[TVSettingsPreferredLanguagesViewController preferredLanguagesGroupCount]( self,  "preferredLanguagesGroupCount") < 2)
  {
    [v5 setRightBarButtonItems:0];
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController editButton](self, "editButton"));
    v13 = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v5 setRightBarButtonItems:v12 animated:v3];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v6 section]));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController addGroup](self, "addGroup"));

  uint64_t v10 = &OBJC_CLASS___TSKTableViewTextCell_ptr;
  if (v8 != v9) {
    uint64_t v10 = &OBJC_CLASS___TSKTableViewSubtitleTextCell_ptr;
  }
  uint64_t v11 = (objc_class *)objc_opt_class(*v10);
  uint64_t v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v13 forIndexPath:v6]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v6));
  if (v15)
  {
    [v14 settingItem:v15 didUpdateMetadataWithGroup:v8];
    [v15 setDirty:0];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    unsigned int v18 = "-[TVSettingsPreferredLanguagesViewController tableView:cellForRowAtIndexPath:]";
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: Setting item could not be found at index path. Will return empty cell. Index Path: %{public}@.",  (uint8_t *)&v17,  0x16u);
  }

  return v14;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  objc_msgSend(a4, "section", a3)));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController preferredLanguagesGroup](self, "preferredLanguagesGroup"));

  int64_t v7 = v5 == v6
    && -[TVSettingsPreferredLanguagesViewController preferredLanguagesGroupCount](self, "preferredLanguagesGroupCount") > 1;

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  if (a4 == 1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);

    uint64_t v10 = TVCSLanguageLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      id v16 = [v7 row];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Deleting language code %{public}@ at index %ld",  (uint8_t *)&v13,  0x16u);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
    objc_msgSend(v12, "removePreferredLanguageAtIndex:", objc_msgSend(v7, "row"));

    -[TVSettingsPreferredLanguagesViewController updateViews](self, "updateViews");
    -[TVSettingsPreferredLanguagesViewController reloadSettings](self, "reloadSettings");
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  objc_msgSend(a4, "section", a3)));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController preferredLanguagesGroup](self, "preferredLanguagesGroup"));
  if (v5 == v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 settingItems]);
    BOOL v7 = (unint64_t)[v8 count] > 1;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  BOOL v4 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  objc_msgSend(a4, "section", a3)));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController preferredLanguagesGroup](v4, "preferredLanguagesGroup"));
  LOBYTE(v4) = v5 == v6;

  return (char)v4;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 section];
  id v10 = [v7 section];
  id v11 = [v8 section];
  if ((uint64_t)v11 <= (uint64_t)[v7 section])
  {
    id v12 = [v8 row];
    int64_t v13 = -[TVSettingsPreferredLanguagesViewController preferredLanguagesGroupCount]( self,  "preferredLanguagesGroupCount");
    if ((uint64_t)v9 >= (uint64_t)v10)
    {
      if (v12 != (id)v13)
      {
        id v17 = v8;
        goto LABEL_9;
      }

      goto LABEL_7;
    }
  }

  else if ((uint64_t)v9 >= (uint64_t)v10)
  {
LABEL_7:
    id v16 = (char *)-[TVSettingsPreferredLanguagesViewController preferredLanguagesGroupCount]( self,  "preferredLanguagesGroupCount")
        - 1;
    id v14 = [v7 section];
    __int16 v15 = v16;
    goto LABEL_8;
  }

  id v14 = [v7 section];
  __int16 v15 = 0LL;
LABEL_8:
  id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v15,  v14));
LABEL_9:
  unsigned int v18 = v17;

  return v18;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 preferredLanguages]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row")));

  uint64_t v12 = TVCSLanguageLog();
  int64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    id v16 = v11;
    __int16 v17 = 2048;
    id v18 = [v7 row];
    __int16 v19 = 2048;
    id v20 = [v8 row];
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "moving language %@ from index %ld to %ld",  (uint8_t *)&v15,  0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  objc_msgSend(v14, "movePreferredLanguageAtIndex:toIndex:", objc_msgSend(v7, "row"), objc_msgSend(v8, "row"));

  -[TVSettingsPreferredLanguagesViewController updateViews](self, "updateViews");
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_languagePreviewViewController)
  {
    id v5 = objc_alloc(&OBJC_CLASS___TSKVibrantImageView);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsUtilities languageImage](&OBJC_CLASS___TVSettingsUtilities, "languageImage"));
    id v7 = [v5 initWithImage:v6 identifier:@"languageFlag"];

    id v8 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    languagePreviewViewController = self->_languagePreviewViewController;
    self->_languagePreviewViewController = v8;

    -[TSKPreviewViewController setContentView:](self->_languagePreviewViewController, "setContentView:", v7);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v4 section]));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController preferredLanguagesGroup](self, "preferredLanguagesGroup"));

  if (v10 == v11)
  {
    uint64_t v13 = TSKLocString(@"LanguagePreferredLanguagesDescription");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  unsigned int v15 = [v14 isDirty];

  if (v15)
  {
    uint64_t v16 = TSKLocString(@"LanguagePreviewDescription");
    if (v12)
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n\n%@", v12, v17));

      uint64_t v12 = (void *)v18;
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
    }
  }

  -[TSKPreviewViewController setDescriptionText:](self->_languagePreviewViewController, "setDescriptionText:", v12);
  __int16 v19 = self->_languagePreviewViewController;

  return v19;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController backGestureRecognizer](self, "backGestureRecognizer"));

  if (v5 != v4) {
    return 0;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController tableView](self, "tableView"));
  unsigned __int8 v8 = [v7 isEditing];

  return v8;
}

- (void)cancelEditing:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController tableView](self, "tableView", a3));
  unsigned int v5 = [v4 isEditing];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController cancelButton](self, "cancelButton"));
    -[TVSettingsPreferredLanguagesViewController handleEditingButton:](self, "handleEditingButton:", v6);
  }

- (void)addPreferredLanguageWithIdentifier:(id)a3 presenter:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v43 = a4;
  id v9 = a5;
  uint64_t v10 = TVCSLanguageLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v65 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Request to add language %@", buf, 0xCu);
  }

  id v12 = objc_alloc(&OBJC_CLASS___IPLanguageListManager);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredLanguages]);
  id v49 = [v12 initWithPreferredLanguages:v14];

  v50 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController localizedLanguageDisplayName:]( self,  "localizedLanguageDisplayName:",  v8));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v49 systemDisplayLanguage]);
  v48 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController localizedLanguageDisplayName:]( self,  "localizedLanguageDisplayName:",  v15));

  uint64_t v16 = TSKLocString(@"LanguageAddNewLanguagePrompt");
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v50));

  uint64_t v18 = TSKLocString(@"LanguageAddNewLanguageActionChange");
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v19, v50));

  uint64_t v20 = TSKLocString(@"LanguageAddNewLanguageActionKeep");
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v21, v48));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);

  uint64_t v23 = TSKLocString(@"LanguageAddNewLanguageMessage");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v24, v47));

  v42 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUtilities _attributedStringForAlertDetailMessage:]( &OBJC_CLASS___TVSettingsUtilities,  "_attributedStringForAlertDetailMessage:",  v45));
  objc_initWeak((id *)buf, self);
  v25 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 defaultInputModeVariantsForLanguageIdentifier:v8]);

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v46,  0LL,  1LL));
  [v27 _setAttributedDetailMessage:v42];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1000409AC;
  v59[3] = &unk_100190378;
  objc_copyWeak(&v63, (id *)buf);
  id v28 = v8;
  id v60 = v28;
  id v29 = v26;
  id v61 = v29;
  id v30 = v9;
  id v62 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v44,  0LL,  v59));
  [v27 addAction:v31];

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_100040AA0;
  v54[3] = &unk_100190378;
  objc_copyWeak(&v58, (id *)buf);
  id v32 = v28;
  id v55 = v32;
  id v33 = v29;
  id v56 = v33;
  id v34 = v30;
  id v57 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v41,  0LL,  v54));
  [v27 addAction:v35];

  uint64_t v36 = TSKLocString(@"LanguageAddNewLanguageActionCancel");
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100040B94;
  v51[3] = &unk_1001903A0;
  id v38 = v32;
  id v52 = v38;
  id v39 = v34;
  id v53 = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v37,  1LL,  v51));
  [v27 addAction:v40];

  [v43 presentViewController:v27 animated:1 completion:0];
  objc_destroyWeak(&v58);

  objc_destroyWeak(&v63);
  objc_destroyWeak((id *)buf);
}

- (void)prepareLanguageChangeAfterSiriActivation
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  unsigned __int8 v4 = [v3 isDirty];

  if ((v4 & 1) != 0)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredLanguages]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TVSInternationalization systemLanguage](&OBJC_CLASS___TVSInternationalization, "systemLanguage"));
    if (!v7)
    {
      uint64_t v8 = TVCSLanguageLog();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_1000F76B0();
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
    }

    if (!v27)
    {
      uint64_t v10 = TVCSLanguageLog();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1000F7628();
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v7));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v27));
    unsigned __int8 v26 = [v25 isEquivalentTo:v24];
    if ((v26 & 1) != 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v12 getChanges]);

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v23 insertions]);
      BOOL v14 = [v13 count] == 0;

      if (v14)
      {
        id v19 = 0LL;
      }

      else
      {
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v23 insertions]);
        id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v33;
LABEL_14:
          uint64_t v18 = 0LL;
          while (1)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v15);
            }
            id v19 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v32 + 1) + 8 * v18) object]);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
            unsigned __int8 v21 = [v20 isSiriSupportedForLanguage:v19];

            if ((v21 & 1) != 0) {
              break;
            }

            if (v16 == (id)++v18)
            {
              id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
              if (v16) {
                goto LABEL_14;
              }
              goto LABEL_20;
            }
          }
        }

        else
        {
LABEL_20:
          id v19 = 0LL;
        }
      }
    }

    else
    {
      id v19 = v7;
    }

    objc_initWeak(buf, self);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    void v28[2] = sub_100040FF4;
    v28[3] = &unk_1001903C8;
    objc_copyWeak(&v29, buf);
    char v30 = v26 ^ 1;
    -[TVSettingsPreferredLanguagesViewController confirmSiriActivationIfNeededWithNewLanguage:completion:]( self,  "confirmSiriActivationIfNeededWithNewLanguage:completion:",  v19,  v28);
    objc_destroyWeak(&v29);
    objc_destroyWeak(buf);
  }

  else
  {
    uint64_t v22 = TVCSLanguageLog();
    id v19 = (id)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_INFO,  "TVCSPreferredLanguagesManager is not dirty. Aborting committing language change.",  (uint8_t *)buf,  2u);
    }
  }
}

- (void)commitLanguageChanges:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredLanguages]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredInputModeList]);

  if (_os_feature_enabled_impl("PineBoard", "UserProfileLanguages"))
  {
    objc_initWeak((id *)location, self);
    intlSettings = self->_intlSettings;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100041338;
    v23[3] = &unk_10018F430;
    objc_copyWeak(&v24, (id *)location);
    -[PLSInternationalizationSettings setPreferredLanguages:withVariants:completion:]( intlSettings,  "setPreferredLanguages:withVariants:completion:",  v6,  v8,  v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);
  }

  else
  {
    uint64_t v10 = TVCSLanguageLog();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v6;
      __int16 v26 = 2114;
      v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Updating device languages \n{languages=%{public}@}\n{inputModes=%{public}@}",  location,  0x16u);
    }

    uint64_t v12 = TVCSLanguageLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v14)
      {
        *(_WORD *)id location = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Applying device language changes - killing required processes",  location,  2u);
      }

      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
      [v15 killPhotoSourcesDaemon];

      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
      [v16 applyPreferredLanguagesChanges];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsITMSFacade sharedInstance](&OBJC_CLASS___TVSettingsITMSFacade, "sharedInstance"));
      [v17 killStoreApps];

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
      [v18 launchPhotoSourcesDaemon];

      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 delegate]);
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 window]);
      [v21 setUserInteractionEnabled:0];
    }

    else
    {
      if (v14)
      {
        *(_WORD *)id location = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Applying secondary language changes to device",  location,  2u);
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
      [v22 applyPreferredLanguagesChanges];
    }
  }
}

- (void)confirmSiriActivationIfNeededWithNewLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bestSiriLanguageForLanguage:v6]);
  if (!v9)
  {
    [v8 isSiriEnabled];
LABEL_8:
    v7[2](v7, 0LL);
    goto LABEL_9;
  }

  unsigned __int8 v10 = [v8 offeredEnableAssistant];
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  @"com.apple.onboarding.siri"));
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v11 flow]);

  __int128 v35 = self;
  objc_initWeak(location, self);
  uint64_t v12 = TSKLocString(@"SiriAvailableTitle");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = TSKLocString(@"SiriAvailableMessage");
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v13,  v15,  1LL));

  uint64_t v17 = TSKLocString(@"SiriUseSiriButton");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100041808;
  v47[3] = &unk_1001903F0;
  id v19 = v8;
  id v48 = v19;
  id v20 = v9;
  id v49 = v20;
  unsigned __int8 v21 = v7;
  id v50 = v21;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  0LL,  v47));
  [v16 addAction:v22];

  uint64_t v23 = TSKLocString(@"SiriDontUseSiriButton");
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100041884;
  v43[3] = &unk_1001903F0;
  id v44 = v19;
  id v45 = v20;
  v25 = v21;
  id v46 = v25;
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v24,  0LL,  v43));
  [v16 addAction:v26];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v36 localizedButtonTitle]);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000418E8;
  v40[3] = &unk_10018FF80;
  id v28 = v36;
  id v41 = v28;
  objc_copyWeak(&v42, location);
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v27,  0LL,  v40));
  [v16 addAction:v29];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100041958;
  v37[3] = &unk_100190418;
  objc_copyWeak(&v39, location);
  id v38 = v25;
  char v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v37));
  [v16 addAction:v30];

  v31 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedButtonCaption]);
  if (v31)
  {
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedButtonCaption]);
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUtilities _attributedStringForAlertDetailMessage:]( &OBJC_CLASS___TVSettingsUtilities,  "_attributedStringForAlertDetailMessage:",  v32));

    [v16 _setAttributedDetailMessage:v33];
  }

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController navigationController](v35, "navigationController", v35));
  [v34 presentViewController:v16 animated:1 completion:0];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v42);

  objc_destroyWeak(location);
LABEL_9:
}

- (id)languageFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100190438];
}

- (id)localizedLanguageFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100190458];
}

- (id)localizedLanguageDisplayName:(id)a3
{
  return -[TVSettingsPreferredLanguagesViewController localizedLanguageDisplayName:removeCurrentRegion:]( self,  "localizedLanguageDisplayName:removeCurrentRegion:",  a3,  0LL);
}

- (id)localizedLanguageDisplayName:(id)a3 removeCurrentRegion:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4) {
    id v8 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController languageIdentifierWithoutCurrentRegion:]( self,  "languageIdentifierWithoutCurrentRegion:",  v6));
  }
  else {
    id v8 = v6;
  }
  id v9 = v8;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForLanguage:v9 context:1]);

  return v11;
}

- (id)languageListFilter
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredLanguages]);

  [v3 addObjectsFromArray:v5];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      unsigned __int8 v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController languageIdentifierWithoutCurrentRegion:]( self,  "languageIdentifierWithoutCurrentRegion:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10),  (void)v14));
        [v3 addObject:v11];

        unsigned __int8 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = [v3 copy];
  return v12;
}

- (id)languageIdentifierWithoutCurrentRegion:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale componentsFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "componentsFromLocaleIdentifier:",  v3));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:NSLocaleCountryCode]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 countryCode]);
  unsigned int v8 = [v5 isEqualToString:v7];

  if (v8) {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale baseLanguageFromLanguage:](&OBJC_CLASS___NSLocale, "baseLanguageFromLanguage:", v3));
  }
  else {
    id v9 = v3;
  }
  unsigned __int8 v10 = v9;

  return v10;
}

- (id)systemLanguageIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredLanguages]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  unsigned int v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVSInternationalization systemLanguage](&OBJC_CLASS___TVSInternationalization, "systemLanguage"));
  }
  id v7 = v6;

  return v7;
}

- (id)displayNameForKeyboardInputModeVariantWithLanguageIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPreferredLanguagesViewController preferredLanguagesManager]( self,  "preferredLanguagesManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredInputModes]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t Variant = UIKeyboardInputModeGetVariant(*(void *)(*((void *)&v22 + 1) + 8LL * (void)i));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(Variant);
        if ([v15 length])
        {
          id v16 = [v11 length];
          uint64_t v17 = TUIKeyboardTitle(v15);
          uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
          id v19 = (void *)v18;
          if (v16)
          {
            uint64_t v20 = objc_claimAutoreleasedReturnValue([v11 stringByAppendingFormat:@", %@", v18]);

            id v11 = v19;
            id v19 = (void *)v20;
          }

          id v11 = v19;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v10);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (int64_t)preferredLanguagesGroupCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPreferredLanguagesViewController preferredLanguagesGroup](self, "preferredLanguagesGroup"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 settingItems]);
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (TSKPreviewViewController)languagePreviewViewController
{
  return self->_languagePreviewViewController;
}

- (TSKSettingGroup)preferredLanguagesGroup
{
  return self->_preferredLanguagesGroup;
}

- (void)setPreferredLanguagesGroup:(id)a3
{
}

- (TSKSettingGroup)addGroup
{
  return self->_addGroup;
}

- (void)setAddGroup:(id)a3
{
}

- (void)setEditButton:(id)a3
{
}

- (void)setDoneButton:(id)a3
{
}

- (void)setCancelButton:(id)a3
{
}

- (UIGestureRecognizer)backGestureRecognizer
{
  return self->_backGestureRecognizer;
}

- (void)setBackGestureRecognizer:(id)a3
{
}

- (PLSInternationalizationSettings)intlSettings
{
  return self->_intlSettings;
}

- (void)setIntlSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end