@interface DVTTVHangsMainViewController
+ (id)durationFormatter;
+ (id)hangLogPreviewViewControllerForHangDurationLevel:(int64_t)a3;
+ (id)hangLogPreviewViewControllerForHangsDataEntry:(id)a3;
+ (id)monospaceDigitDescriptionFromText:(id)a3;
- (DVTTVHangsFacade)settingsFacade;
- (DVTTVHangsMainViewController)init;
- (TSKAppIconPreviewViewController)appIconPreviewViewController;
- (TSKSettingItem)lastFocusedItemForPreview;
- (id)appsRowGroup;
- (id)loadSettingGroups;
- (id)logsRowGroup;
- (id)makeRowDescriptionFrom:(id)a3;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)settingsRowGroup;
- (void)setAppIconPreviewViewController:(id)a3;
- (void)setLastFocusedItemForPreview:(id)a3;
- (void)setSettingsFacade:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DVTTVHangsMainViewController

- (DVTTVHangsMainViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DVTTVHangsMainViewController;
  v2 = -[DVTTVHangsMainViewController init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___DVTTVHangsFacade);
    settingsFacade = v2->_settingsFacade;
    v2->_settingsFacade = v3;
  }

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DVTTVHangsMainViewController;
  -[DVTTVHangsMainViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsMainViewController settingsFacade](self, "settingsFacade"));
  [v4 fetchAllAppsAndHangEvents];
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsMainViewController settingsRowGroup](self, "settingsRowGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsMainViewController appsRowGroup](self, "appsRowGroup", v3));
  v8[1] = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsMainViewController logsRowGroup](self, "logsRowGroup"));
  v8[2] = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));

  return v6;
}

- (id)makeRowDescriptionFrom:(id)a3
{
  id v4 = a3;
  if (!-[DVTTVHangsFacade isInternalBuild](self->_settingsFacade, "isInternalBuild"))
  {
    objc_super v6 = (__CFString *)v4;
    goto LABEL_5;
  }

  objc_super v5 = @"INTERNAL: Hang Detection is on for all processes. Go to Internal Settings → UI → HangTracer HUD to enable the Heads-Up Display and see logs.";
  if ([v4 length])
  {
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"%@\n\n%@",  v4,  @"INTERNAL: Hang Detection is on for all processes. Go to Internal Settings → UI → HangTracer HUD to enable the Heads-Up Display and see logs."));
LABEL_5:
    objc_super v5 = v6;
  }

  return v5;
}

- (id)settingsRowGroup
{
  uint64_t v3 = HTUIActivationToggleTitle(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = HTUIActivationToggleFooterPart1(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsMainViewController makeRowDescriptionFrom:](self, "makeRowDescriptionFrom:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v4,  v7,  self->_settingsFacade,  @"enabled",  0LL,  0LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsFacade availableThresholdValues](self->_settingsFacade, "availableThresholdValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsFacade availableThresholdLabels](self->_settingsFacade, "availableThresholdLabels"));
  uint64_t v11 = HTUILogsThresholdSelectorTitle();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = HTUIThresholdFooter();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsMainViewController makeRowDescriptionFrom:](self, "makeRowDescriptionFrom:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v12,  v15,  self->_settingsFacade,  @"hangTracerThreshold",  v9));

  id v17 = [[TSKMappingFormatter alloc] initWithInputs:v9 outputs:v10];
  [v16 setLocalizedValueFormatter:v17];

  objc_initWeak(&location, self);
  v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  v27 = sub_E43C;
  v28 = &unk_18630;
  objc_copyWeak(&v29, &location);
  uint64_t v18 = HTUILearnMoreTitle([v16 setUpdateBlock:&v25]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[DVTTVHangsMainViewController makeRowDescriptionFrom:]( self,  "makeRowDescriptionFrom:",  0LL,  v25,  v26,  v27,  v28));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v19,  v20,  0LL,  0LL,  &stru_18988));

  [v21 setShouldPresentChildController:1];
  v31[0] = v8;
  v31[1] = v16;
  v31[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v22));

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v23;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsMainViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v4));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v5, "representedObject"));
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___HTDeveloperApp);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    if (self->_lastFocusedItemForPreview != v5 || !self->_appIconPreviewViewController)
    {
      id v10 = v6;
      uint64_t v11 = objc_alloc(&OBJC_CLASS___TSKAppIconPreviewViewController);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);

      uint64_t v13 = -[TSKAppIconPreviewViewController initWithApplicationBundleIdentifier:]( v11,  "initWithApplicationBundleIdentifier:",  v12);
      objc_storeStrong((id *)&self->_lastFocusedItemForPreview, v5);
      appIconPreviewViewController = self->_appIconPreviewViewController;
      self->_appIconPreviewViewController = v13;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
    -[TSKAppIconPreviewViewController setDescriptionText:]( self->_appIconPreviewViewController,  "setDescriptionText:",  v15);
    v16 = self->_appIconPreviewViewController;
  }

  else
  {
    uint64_t v17 = objc_opt_self(&OBJC_CLASS___HTHangsDataEntry);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    char v19 = objc_opt_isKindOfClass(v6, v18);

    if ((v19 & 1) == 0)
    {
      v23.receiver = self;
      v23.super_class = (Class)&OBJC_CLASS___DVTTVHangsMainViewController;
      id v21 = -[DVTTVHangsMainViewController previewForItemAtIndexPath:](&v23, "previewForItemAtIndexPath:", v4);
      v16 = (TSKAppIconPreviewViewController *)objc_claimAutoreleasedReturnValue(v21);
      goto LABEL_10;
    }

    v16 = (TSKAppIconPreviewViewController *)objc_claimAutoreleasedReturnValue( +[DVTTVHangsMainViewController hangLogPreviewViewControllerForHangsDataEntry:]( &OBJC_CLASS___DVTTVHangsMainViewController,  "hangLogPreviewViewControllerForHangsDataEntry:",  v6));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem localizedDescription](v5, "localizedDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[DVTTVHangsMainViewController monospaceDigitDescriptionFromText:]( &OBJC_CLASS___DVTTVHangsMainViewController,  "monospaceDigitDescriptionFromText:",  v20));

    -[TSKAppIconPreviewViewController setAttributedDescriptionText:](v16, "setAttributedDescriptionText:", v15);
  }

LABEL_10:
  return v16;
}

+ (id)hangLogPreviewViewControllerForHangsDataEntry:(id)a3
{
  id v4 = (char *)[a3 durationLevel];
  if (v4 == (_BYTE *)&dword_0 + 2)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_EA44;
    void v8[3] = &unk_189A8;
    v8[4] = a1;
    if (qword_1E6C0 != -1) {
      dispatch_once(&qword_1E6C0, v8);
    }
    objc_super v6 = &qword_1E6B8;
    goto LABEL_13;
  }

  if (v4 == (_BYTE *)&dword_0 + 1)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_EA18;
    v9[3] = &unk_189A8;
    v9[4] = a1;
    if (qword_1E6B0 != -1) {
      dispatch_once(&qword_1E6B0, v9);
    }
    objc_super v6 = &qword_1E6A8;
    goto LABEL_13;
  }

  if (!v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_E9EC;
    block[3] = &unk_189A8;
    block[4] = a1;
    if (qword_1E6A0 != -1) {
      dispatch_once(&qword_1E6A0, block);
    }
    objc_super v6 = &qword_1E698;
LABEL_13:
    id v5 = (id)*v6;
  }

  return v5;
}

+ (id)hangLogPreviewViewControllerForHangDurationLevel:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:weight:scale:",  2LL,  -1LL,  505.0));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationPreferringMulticolor]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationPreferringMulticolor"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 configurationByApplyingConfiguration:v5]);

  if (a3 == 2)
  {
    v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DVTTVHangsMainViewController));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = @"doc.text.below.ecg.fill.badge.xmark";
LABEL_7:
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:withConfiguration:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:withConfiguration:",  v10,  v9,  v6));

    goto LABEL_9;
  }

  if (a3 == 1)
  {
    uint64_t v11 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DVTTVHangsMainViewController));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v10 = @"doc.text.below.ecg.fill.trianglebadge.exclamationmark";
    goto LABEL_7;
  }

  if (a3) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"doc.text.below.ecg.fill",  v6));
  }
LABEL_9:
  id v12 = [[TSKVibrantImageView alloc] initWithImage:v7 identifier:@"hangIcon"];
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
  -[TSKPreviewViewController setContentView:](v13, "setContentView:", v12);

  return v13;
}

+ (id)monospaceDigitDescriptionFromText:(id)a3
{
  uint64_t v3 = qword_1E6D0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1E6D0, &stru_189C8);
  }
  id v5 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  NSAttributedStringKey v9 = NSFontAttributeName;
  uint64_t v10 = qword_1E6C8;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  uint64_t v7 = -[NSAttributedString initWithString:attributes:](v5, "initWithString:attributes:", v4, v6);

  return v7;
}

- (id)appsRowGroup
{
  uint64_t v3 = HTUIAppsSectionTitle(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  settingsFacade = self->_settingsFacade;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_EF90;
  v11[3] = &unk_189F0;
  v11[4] = self;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v4,  settingsFacade,  @"appRows",  v11));

  [v6 setAutoHide:0];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_F0BC;
  void v8[3] = &unk_18630;
  objc_copyWeak(&v9, &location);
  [v6 setUpdateBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

+ (id)durationFormatter
{
  if (qword_1E6E0 != -1) {
    dispatch_once(&qword_1E6E0, &stru_18A10);
  }
  return (id)qword_1E6D8;
}

- (id)logsRowGroup
{
  uint64_t v3 = HTUILogsSectionTitle(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  settingsFacade = self->_settingsFacade;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_F340;
  v11[3] = &unk_189F0;
  v11[4] = self;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v4,  settingsFacade,  @"logRows",  v11));

  [v6 setAutoHide:0];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_F688;
  void v8[3] = &unk_18630;
  objc_copyWeak(&v9, &location);
  [v6 setUpdateBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

- (DVTTVHangsFacade)settingsFacade
{
  return self->_settingsFacade;
}

- (void)setSettingsFacade:(id)a3
{
}

- (TSKAppIconPreviewViewController)appIconPreviewViewController
{
  return self->_appIconPreviewViewController;
}

- (void)setAppIconPreviewViewController:(id)a3
{
}

- (TSKSettingItem)lastFocusedItemForPreview
{
  return self->_lastFocusedItemForPreview;
}

- (void)setLastFocusedItemForPreview:(id)a3
{
}

- (void).cxx_destruct
{
}

@end