@interface TVSettingsAmbientPhotoOptionsViewController
- (TSKPreviewViewController)photosPreviewViewController;
- (TVSettingsAmbientFacade)ambientFacade;
- (TVSettingsAmbientPhotoOptionsViewController)initWithAmbientFacade:(id)a3;
- (id)_actionItemForSource:(id)a3;
- (id)_childPanelItemForSource:(id)a3;
- (id)_myPhotosItemForSource:(id)a3;
- (id)_otherItemForSource:(id)a3;
- (id)_transitionStylesItem;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_didSelectItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsAmbientPhotoOptionsViewController

- (TVSettingsAmbientPhotoOptionsViewController)initWithAmbientFacade:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPhotoOptionsViewController;
  v6 = -[TVSettingsAmbientPhotoOptionsViewController init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ambientFacade, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"settings-screensaver-photos"));
    id v9 = [[TSKVibrantImageView alloc] initWithImage:v8];
    v10 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    photosPreviewViewController = v7->_photosPreviewViewController;
    v7->_photosPreviewViewController = v10;

    -[TSKPreviewViewController setContentView:](v7->_photosPreviewViewController, "setContentView:", v9);
  }

  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPhotoOptionsViewController;
  -[TVSettingsAmbientPhotoOptionsViewController viewDidLoad](&v5, "viewDidLoad");
  uint64_t v3 = TSKLocString(@"SaverBackdropPhotosTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[TVSettingsAmbientPhotoOptionsViewController setTitle:](self, "setTitle:", v4);
}

- (id)loadSettingGroups
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoOptionsViewController ambientFacade](self, "ambientFacade"));
  uint64_t v4 = TSKLocString(@"SaverBackdropYourPhotosGroupTitle");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000C9CB4;
  v23[3] = &unk_100194090;
  objc_copyWeak(&v24, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v5,  v3,  @"myPhotoSources",  v23));

  uint64_t v7 = TSKLocString(@"SaverBackdropOtherPhotosGroupTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_1000C9D08;
  v21 = &unk_100194090;
  objc_copyWeak(&v22, &location);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v8,  v3,  @"otherPhotoSources",  &v18));

  v10 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v11 = TSKLocString(@"SaverBackdropPhotoTransitionStylesGroupTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_super v13 = -[TSKSettingGroup initWithTitle:](v10, "initWithTitle:", v12, v18, v19, v20, v21);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoOptionsViewController _transitionStylesItem](self, "_transitionStylesItem"));
  v27 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  -[TSKSettingGroup setSettingItems:](v13, "setSettingItems:", v15);

  v26[0] = v6;
  v26[1] = v9;
  v26[2] = v13;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
  return v16;
}

- (id)_otherItemForSource:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 childItems]);
  if ([v5 count]) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoOptionsViewController _childPanelItemForSource:]( self,  "_childPanelItemForSource:",  v4));
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoOptionsViewController _actionItemForSource:](self, "_actionItemForSource:", v4));
  }
  uint64_t v7 = (void *)v6;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C9E24;
  v10[3] = &unk_10018E608;
  id v11 = v4;
  id v8 = v4;
  [v7 setUpdateBlock:v10];

  return v7;
}

- (id)_myPhotosItemForSource:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = [v5 isDisabled];
  if ((v6 & 1) == 0)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v5 childItems]);
    if ([v3 count])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoOptionsViewController _childPanelItemForSource:]( self,  "_childPanelItemForSource:",  v5));
LABEL_5:

      goto LABEL_6;
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoOptionsViewController _actionItemForSource:](self, "_actionItemForSource:", v5));
  if ((v6 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_6:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C9FB8;
  v10[3] = &unk_10018E608;
  id v11 = v5;
  id v8 = v5;
  [v7 setUpdateBlock:v10];

  return v7;
}

- (id)_actionItemForSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  v6,  v4,  @"selected",  self,  "_didSelectItem:"));

  return v7;
}

- (id)_childPanelItemForSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoOptionsViewController ambientFacade](self, "ambientFacade"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoOptionsViewController photosPreviewViewController]( self,  "photosPreviewViewController"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000CA288;
  v14[3] = &unk_100190300;
  id v15 = v4;
  id v16 = v5;
  id v17 = v6;
  id v9 = v6;
  id v10 = v5;
  id v11 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v7,  v8,  v11,  @"selectedValue",  v14));

  return v12;
}

- (id)_transitionStylesItem
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoOptionsViewController ambientFacade](self, "ambientFacade"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoOptionsViewController photosPreviewViewController]( self,  "photosPreviewViewController"));
  uint64_t v5 = TSKLocString(@"SaverBackdropPhotoTransitionStyles");
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"SaverBackdropPhotoTransitionStylesDescription");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_super v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1000CA3D8;
  id v16 = &unk_1001904D0;
  id v17 = v3;
  id v18 = v4;
  id v9 = v4;
  id v10 = v3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v6,  v8,  v10,  @"selectedTransitionStyleValue",  &v13));

  objc_msgSend(v11, "setUpdateBlock:", &stru_1001940B0, v13, v14, v15, v16);
  return v11;
}

- (void)_didSelectItem:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  if ([v7 isMyPhotosOption] && objc_msgSend(v7, "isDisabled"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoOptionsViewController ambientFacade](self, "ambientFacade"));
    objc_msgSend(v4, "setupPhotosWithOptions:presentingViewController:", objc_msgSend(v7, "photosSetupOptions"), self);
  }

  else
  {
    unsigned int v5 = [v7 isNavigating];
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPhotoOptionsViewController ambientFacade](self, "ambientFacade"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    if (v5) {
      [v4 navigateToPhotoSourceWithID:v6];
    }
    else {
      [v4 setSelectedPhotoSourceWithID:v6];
    }
  }
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsAmbientPhotoOptionsViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a3));
  photosPreviewViewController = self->_photosPreviewViewController;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  -[TSKPreviewViewController setDescriptionText:](photosPreviewViewController, "setDescriptionText:", v6);

  id v7 = self->_photosPreviewViewController;
  return v7;
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