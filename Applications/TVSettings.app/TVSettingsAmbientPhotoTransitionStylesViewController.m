@interface TVSettingsAmbientPhotoTransitionStylesViewController
- (TSKPreviewViewController)photosPreviewViewController;
- (TVSettingsAmbientFacade)ambientFacade;
- (TVSettingsAmbientPhotoTransitionStylesViewController)initWithAmbientFacade:(id)a3 previewViewController:(id)a4;
- (id)_actionItemForStyle:(id)a3;
- (id)_childPanelItemForStyle:(id)a3;
- (id)_styleItemForStyle:(id)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_didSelectPreview;
- (void)_didSelectStyleItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsAmbientPhotoTransitionStylesViewController

- (TVSettingsAmbientPhotoTransitionStylesViewController)initWithAmbientFacade:(id)a3 previewViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPhotoTransitionStylesViewController;
  v9 = -[TVSettingsAmbientPhotoTransitionStylesViewController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ambientFacade, a3);
    objc_storeStrong((id *)&v10->_photosPreviewViewController, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPhotoTransitionStylesViewController;
  -[TVSettingsAmbientPhotoTransitionStylesViewController viewDidLoad](&v5, "viewDidLoad");
  uint64_t v3 = TSKLocString(@"SaverBackdropPhotoTransitionStyleTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[TVSettingsAmbientPhotoTransitionStylesViewController setTitle:](self, "setTitle:", v4);
}

- (id)loadSettingGroups
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoTransitionStylesViewController ambientFacade](self, "ambientFacade"));
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"SaverPreviewTitle" value:&stru_100195DD8 table:0]);
  id v6 = objc_loadWeakRetained(&location);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  0LL,  0LL,  v6,  "_didSelectPreview"));

  v20 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v8));

  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_1000698E0;
  v16 = &unk_100191290;
  objc_copyWeak(&v17, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v3,  @"transitionStyles",  &v13));
  v19[0] = v9;
  v19[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v19,  2LL,  v13,  v14,  v15,  v16));

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoTransitionStylesViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a3));
  photosPreviewViewController = self->_photosPreviewViewController;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  -[TSKPreviewViewController setDescriptionText:](photosPreviewViewController, "setDescriptionText:", v6);

  id v7 = self->_photosPreviewViewController;
  return v7;
}

- (id)_styleItemForStyle:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 childItems]);
  id v6 = [v5 count];

  if (v6) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoTransitionStylesViewController _childPanelItemForStyle:]( self,  "_childPanelItemForStyle:",  v4));
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoTransitionStylesViewController _actionItemForStyle:]( self,  "_actionItemForStyle:",  v4));
  }
  id v8 = (void *)v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100069A78;
  v11[3] = &unk_1001912B8;
  id v12 = v4;
  BOOL v13 = v6 != 0LL;
  id v9 = v4;
  [v8 setUpdateBlock:v11];

  return v8;
}

- (id)_actionItemForStyle:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  v6,  v4,  @"selected",  self,  "_didSelectStyleItem:"));

  return v7;
}

- (id)_childPanelItemForStyle:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoTransitionStylesViewController ambientFacade](self, "ambientFacade"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoTransitionStylesViewController photosPreviewViewController]( self,  "photosPreviewViewController"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100069CE8;
  v14[3] = &unk_100190300;
  id v15 = v4;
  id v16 = v5;
  id v17 = v6;
  id v9 = v6;
  id v10 = v5;
  id v11 = v4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v7,  v8,  v11,  @"selectedValue",  v14));

  return v12;
}

- (void)_didSelectStyleItem:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoTransitionStylesViewController ambientFacade](self, "ambientFacade"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v4 setSelectedTransitionStyleWithStyleID:v5 effectID:0];
}

- (void)_didSelectPreview
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v2 activateScreenSaverForPosterBundleID:@"com.apple.IdleScreen.MemoryPoster"];
}

- (TVSettingsAmbientFacade)ambientFacade
{
  return self->_ambientFacade;
}

- (TSKPreviewViewController)photosPreviewViewController
{
  return self->_photosPreviewViewController;
}

- (void).cxx_destruct
{
}

@end