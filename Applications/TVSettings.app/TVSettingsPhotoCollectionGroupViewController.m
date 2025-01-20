@interface TVSettingsPhotoCollectionGroupViewController
- (BOOL)hasFullscreenPreview;
- (TVPhotoCollectionGroup)photoCollectionGroup;
- (TVSettingsPhotoCollectionGroupViewController)initWithPhotoCollectionGroup:(id)a3;
- (TVSettingsPhotoCollectionGroupViewControllerDelegate)delegate;
- (TVSettingsPhotoCollectionPreviewViewController)photoPreviewController;
- (id)_localizedTitleForPhotoCollection:(id)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)title;
- (void)_updatePhotoCollectionWithIndexPath:(id)a3;
- (void)controller:(id)a3 didSelectAsset:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPhotoCollectionGroup:(id)a3;
- (void)setPhotoPreviewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsPhotoCollectionGroupViewController

- (TVSettingsPhotoCollectionGroupViewController)initWithPhotoCollectionGroup:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoCollectionGroupViewController;
  v6 = -[TVSettingsPhotoCollectionGroupViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoCollectionGroup, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___TVSettingsPhotoCollectionPreviewViewController);
    photoPreviewController = v7->_photoPreviewController;
    v7->_photoPreviewController = v8;

    -[TVSettingsPhotoCollectionGroupViewController tableViewPadding](v7, "tableViewPadding");
    -[TVSettingsPhotoCollectionGroupViewController setTableViewPadding:](v7, "setTableViewPadding:", 13.0);
    -[TVSettingsPhotoCollectionGroupViewController setTableViewWidth:](v7, "setTableViewWidth:", 440.0);
  }

  return v7;
}

- (void)viewDidLoad
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoCollectionGroupViewController;
  -[TVSettingsPhotoCollectionGroupViewController viewDidLoad](&v46, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
  id v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( self->_backdropView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionGroupViewController view](self, "view"));
  [v7 insertSubview:self->_backdropView atIndex:0];

  v8 = objc_opt_new(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UILabel setTextAlignment:](v8, "setTextAlignment:", 1LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
  -[UILabel setFont:](v8, "setFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 traitCollection]);
  if (qword_1001E1BB0 != -1) {
    dispatch_once(&qword_1001E1BB0, &stru_100193FD0);
  }
  id v12 = [v11 userInterfaceStyle];
  BOOL v13 = v12 == (id)2 || v12 == (id)1000;
  v14 = &qword_1001E1BA8;
  if (!v13) {
    v14 = &qword_1001E1BA0;
  }
  id v15 = (id)*v14;

  -[UILabel setTextColor:](v8, "setTextColor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollectionGroup photoCollections](self->_photoCollectionGroup, "photoCollections"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 photoSource]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sourceName]);
  -[UILabel setText:](v8, "setText:", v19);

  -[UILabel setNumberOfLines:](v8, "setNumberOfLines:", 2LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionGroupViewController tableView](self, "tableView"));
  [v20 setTableHeaderView:v8];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_backdropView, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionGroupViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 topAnchor]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v23]);
  [v24 setActive:1];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_backdropView, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionGroupViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 bottomAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v27]);
  [v28 setActive:1];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_backdropView, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionGroupViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 trailingAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v31]);
  [v32 setActive:1];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView widthAnchor](self->_backdropView, "widthAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToConstant:630.0]);
  [v34 setActive:1];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v8, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionGroupViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 topAnchor]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v37 constant:13.0]);
  [v38 setActive:1];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v8, "heightAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintGreaterThanOrEqualToConstant:140.0]);
  [v40 setActive:1];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v8, "widthAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToConstant:440.0]);
  [v42 setActive:1];

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v8, "centerXAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerXAnchor](self->_backdropView, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintEqualToAnchor:v44]);
  [v45 setActive:1];
}

- (id)loadSettingGroups
{
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_1000C79B0;
  v10 = &unk_100193FB0;
  objc_copyWeak(&v11, &location);
  v3 = objc_retainBlock(&v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  self->_photoCollectionGroup,  @"photoCollections",  v3,  v7,  v8,  v9,  v10));
  BOOL v13 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

- (id)title
{
  return 0LL;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  return self->_photoPreviewController;
}

- (BOOL)hasFullscreenPreview
{
  return 1;
}

- (void)controller:(id)a3 didSelectAsset:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionGroupViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "controller:didSelectAsset:inCollection:") & 1) != 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 collection]);
    [v7 controller:self didSelectAsset:v6 inCollection:v8];
  }
}

- (id)_localizedTitleForPhotoCollection:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 providerInfo]);
  id v6 = v5;
  if (v5
    && (objc_msgSend(v5, "tvs_BOOLForKey:defaultValue:", PBScreensaverShowInSettings, 1) & 1) == 0
    && (v7 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionIdentifier]),
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 screenSaverPhotoCollectionIdentifier]),
        unsigned int v9 = [v7 isEqualToString:v8],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 screenSaverName]);
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v3 collectionName]);
  }

  id v11 = (void *)v10;

  return v11;
}

- (void)_updatePhotoCollectionWithIndexPath:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsPhotoCollectionGroupViewController indexPathForLastFocusedItem]( self,  "indexPathForLastFocusedItem"));
  if ([v4 isEqual:v7])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollectionGroup photoCollections](self->_photoCollectionGroup, "photoCollections"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v7, "item")));

    -[TVSettingsPhotoCollectionPreviewViewController setPhotoCollection:]( self->_photoPreviewController,  "setPhotoCollection:",  v6);
  }
}

- (TVSettingsPhotoCollectionGroupViewControllerDelegate)delegate
{
  return (TVSettingsPhotoCollectionGroupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVPhotoCollectionGroup)photoCollectionGroup
{
  return self->_photoCollectionGroup;
}

- (void)setPhotoCollectionGroup:(id)a3
{
}

- (TVSettingsPhotoCollectionPreviewViewController)photoPreviewController
{
  return self->_photoPreviewController;
}

- (void)setPhotoPreviewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end