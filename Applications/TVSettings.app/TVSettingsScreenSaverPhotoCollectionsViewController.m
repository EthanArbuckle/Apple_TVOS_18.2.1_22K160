@interface TVSettingsScreenSaverPhotoCollectionsViewController
- (BOOL)hasFullscreenPreview;
- (TVSettingsScreenSaverPhotoCollectionsViewController)initWithPhotoCollectionGroup:(id)a3;
- (id)_photoCollectionTitleFormatter;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)title;
- (void)_updatePhotoCollectionWithIndexPath:(id)a3;
- (void)radioSettingsGroup:(id)a3 didSelectItem:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVSettingsScreenSaverPhotoCollectionsViewController

- (TVSettingsScreenSaverPhotoCollectionsViewController)initWithPhotoCollectionGroup:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverPhotoCollectionsViewController;
  v6 = -[TVSettingsScreenSaverPhotoCollectionsViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoCollectionsGroup, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___TVSettingsPhotoCollectionPreviewViewController);
    photoPreviewController = v7->_photoPreviewController;
    v7->_photoPreviewController = v8;

    -[TVSettingsScreenSaverPhotoCollectionsViewController tableViewPadding](v7, "tableViewPadding");
    -[TVSettingsScreenSaverPhotoCollectionsViewController setTableViewPadding:](v7, "setTableViewPadding:", 13.0);
    -[TVSettingsScreenSaverPhotoCollectionsViewController setTableViewWidth:](v7, "setTableViewWidth:", 440.0);
  }

  return v7;
}

- (void)viewDidLoad
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverPhotoCollectionsViewController;
  -[TVSettingsScreenSaverPhotoCollectionsViewController viewDidLoad](&v46, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5003LL));
  id v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( self->_backdropView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverPhotoCollectionsViewController view](self, "view"));
  [v7 insertSubview:self->_backdropView atIndex:0];

  v8 = objc_opt_new(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UILabel setTextAlignment:](v8, "setTextAlignment:", 1LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
  -[UILabel setFont:](v8, "setFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 traitCollection]);
  if (qword_1001E1B98 != -1) {
    dispatch_once(&qword_1001E1B98, &stru_100193E78);
  }
  id v12 = [v11 userInterfaceStyle];
  BOOL v13 = v12 == (id)2 || v12 == (id)1000;
  v14 = &qword_1001E1B90;
  if (!v13) {
    v14 = &qword_1001E1B88;
  }
  id v15 = (id)*v14;

  -[UILabel setTextColor:](v8, "setTextColor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollectionGroup photoCollections](self->_photoCollectionsGroup, "photoCollections"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 photoSource]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sourceName]);
  -[UILabel setText:](v8, "setText:", v19);

  -[UILabel setNumberOfLines:](v8, "setNumberOfLines:", 2LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverPhotoCollectionsViewController view](self, "view"));
  [v20 addSubview:v8];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_backdropView, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverPhotoCollectionsViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 topAnchor]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v23]);
  [v24 setActive:1];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_backdropView, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverPhotoCollectionsViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 bottomAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v27]);
  [v28 setActive:1];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_backdropView, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverPhotoCollectionsViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 trailingAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v31]);
  [v32 setActive:1];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView widthAnchor](self->_backdropView, "widthAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToConstant:630.0]);
  [v34 setActive:1];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v8, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverPhotoCollectionsViewController view](self, "view"));
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
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  v4 = objc_alloc(&OBJC_CLASS___TVSettingsScreenSaverRadioSettingGroup);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollectionGroup photoCollections](self->_photoCollectionsGroup, "photoCollections"));
  v6 = -[TVSettingsScreenSaverRadioSettingGroup initWithTitle:representedObject:keyPath:availableValues:]( v4,  "initWithTitle:representedObject:keyPath:availableValues:",  0LL,  v3,  @"selectedPhotoCollection",  v5);

  -[TVSettingsScreenSaverRadioSettingGroup setDelegate:](v6, "setDelegate:", self);
  -[TVSettingsScreenSaverRadioSettingGroup setEnabledInStoreDemoMode:](v6, "setEnabledInStoreDemoMode:", 1LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsScreenSaverPhotoCollectionsViewController _photoCollectionTitleFormatter]( self,  "_photoCollectionTitleFormatter"));
  -[TVSettingsScreenSaverRadioSettingGroup setLocalizedValueFormatter:](v6, "setLocalizedValueFormatter:", v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C37E4;
  v11[3] = &unk_10018E608;
  id v12 = v3;
  id v8 = v3;
  -[TVSettingsScreenSaverRadioSettingGroup setItemUpdateBlock:](v6, "setItemUpdateBlock:", v11);
  BOOL v13 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  return v9;
}

- (id)title
{
  return 0LL;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_updatePhotoCollectionWithIndexPath:",  0LL);
  -[TVSettingsScreenSaverPhotoCollectionsViewController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_updatePhotoCollectionWithIndexPath:",  v4,  0.25);

  return self->_photoPreviewController;
}

- (BOOL)hasFullscreenPreview
{
  return 1;
}

- (void)radioSettingsGroup:(id)a3 didSelectItem:(id)a4
{
  id v4 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TVSettingsScreenSaverFacade sharedInstance](&OBJC_CLASS___TVSettingsScreenSaverFacade, "sharedInstance"));
  [v7 setSelectedPhotoCollection:v4];

  id v5 = [v7 idleScreenSaverType];
  if (v5 == (id)TVISScreenSaverTypeAerial
    || (id v6 = [v7 idleScreenSaverType], v6 == (id)TVISScreenSaverTypeMemory))
  {
    [v7 setScreenSaverStyle:TVScreenSaverStyleKenBurns];
  }
}

- (id)_photoCollectionTitleFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100193E58];
}

- (void)_updatePhotoCollectionWithIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsScreenSaverPhotoCollectionsViewController indexPathForLastFocusedItem]( self,  "indexPathForLastFocusedItem"));
  if ([v4 isEqual:v7])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollectionGroup photoCollections](self->_photoCollectionsGroup, "photoCollections"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v7, "item")));

    -[TVSettingsPhotoCollectionPreviewViewController setPhotoCollection:]( self->_photoPreviewController,  "setPhotoCollection:",  v6);
  }
}

- (void).cxx_destruct
{
}

@end