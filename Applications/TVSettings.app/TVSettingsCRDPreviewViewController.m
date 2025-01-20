@interface TVSettingsCRDPreviewViewController
- (TVSettingsCRDPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_crdView;
- (id)_newCRDView;
- (id)contentContainerSnapshot;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setContentView:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation TVSettingsCRDPreviewViewController

- (TVSettingsCRDPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsCRDPreviewViewController;
  v4 = -[TVSettingsCRDPreviewViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
    [v5 addObserver:v4 forKeyPath:@"networkName" options:0 context:off_1001E0DF8];
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
    [v6 addObserver:v4 forKeyPath:@"conferenceRoomDisplayMessage" options:0 context:off_1001E0E00];
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
  [v3 removeObserver:self forKeyPath:@"networkName" context:off_1001E0DF8];
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"conferenceRoomDisplayMessage" context:off_1001E0E00];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsCRDPreviewViewController;
  -[TVSettingsCRDPreviewViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsCRDPreviewViewController;
  -[TVSettingsCRDPreviewViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCRDPreviewViewController _crdView](self, "_crdView"));
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  -[TVSettingsCRDPreviewViewController setContentView:](self, "setContentView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper wallpaperViewForVariant:]( &OBJC_CLASS___TVSUIWallpaper,  "wallpaperViewForVariant:",  1LL));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCRDPreviewViewController view](self, "view"));
  [v5 insertSubview:v4 atIndex:0];
}

- (void)setContentView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVSettingsCRDPreviewViewController;
  -[TVSettingsCRDPreviewViewController setContentView:animated:](&v18, "setContentView:animated:", v6, v4);
  if (-[TVSettingsCRDPreviewViewController isViewLoaded](self, "isViewLoaded"))
  {
    contentViewCenterXConstraint = self->_contentViewCenterXConstraint;
    if (contentViewCenterXConstraint && self->_contentViewCenterYConstraint)
    {
      -[NSLayoutConstraint setActive:](contentViewCenterXConstraint, "setActive:", 0LL);
      -[NSLayoutConstraint setActive:](self->_contentViewCenterYConstraint, "setActive:", 0LL);
    }

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 centerXAnchor]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCRDPreviewViewController contentContainer](self, "contentContainer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 centerXAnchor]);
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v10]);
    v12 = self->_contentViewCenterXConstraint;
    self->_contentViewCenterXConstraint = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 centerYAnchor]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCRDPreviewViewController contentContainer](self, "contentContainer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 centerYAnchor]);
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v15]);
    contentViewCenterYConstraint = self->_contentViewCenterYConstraint;
    self->_contentViewCenterYConstraint = v16;

    -[NSLayoutConstraint setActive:](self->_contentViewCenterXConstraint, "setActive:", 1LL);
    -[NSLayoutConstraint setActive:](self->_contentViewCenterYConstraint, "setActive:", 1LL);
  }
}

- (id)contentContainerSnapshot
{
  v3 = objc_alloc(&OBJC_CLASS____TVSettingsCRDPreviewContainerView);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCRDPreviewViewController contentContainer](self, "contentContainer"));
  [v4 frame];
  objc_super v5 = -[_TVSettingsCRDPreviewContainerView initWithFrame:](v3, "initWithFrame:");

  id v6 = -[TVSettingsCRDPreviewViewController _newCRDView](self, "_newCRDView");
  -[_TVSettingsCRDPreviewContainerView setContentView:](v5, "setContentView:", v6);

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001E0DF8 == a6)
  {
    crdView = self->_crdView;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 networkName]);
    -[TVSUIConferenceRoomDisplaySmallView setNetworkName:](crdView, "setNetworkName:", v15);
LABEL_6:

    goto LABEL_7;
  }

  if (off_1001E0E00 == a6)
  {
    v16 = self->_crdView;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 conferenceRoomDisplayMessage]);
    -[TVSUIConferenceRoomDisplaySmallView setCustomText:](v16, "setCustomText:", v15);
    goto LABEL_6;
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVSettingsCRDPreviewViewController;
  -[TVSettingsCRDPreviewViewController observeValueForKeyPath:ofObject:change:context:]( &v17,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_7:
}

- (id)_crdView
{
  crdView = self->_crdView;
  if (!crdView)
  {
    BOOL v4 = -[TVSettingsCRDPreviewViewController _newCRDView](self, "_newCRDView");
    objc_super v5 = self->_crdView;
    self->_crdView = v4;

    crdView = self->_crdView;
  }

  return crdView;
}

- (id)_newCRDView
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVSUIConferenceRoomDisplaySmallView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice userDeviceName](&OBJC_CLASS___TVSDevice, "userDeviceName"));
  -[TVSUIConferenceRoomDisplaySmallView setDeviceName:](v2, "setDeviceName:", v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 networkName]);
  -[TVSUIConferenceRoomDisplaySmallView setNetworkName:](v2, "setNetworkName:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 conferenceRoomDisplayMessage]);
  -[TVSUIConferenceRoomDisplaySmallView setCustomText:](v2, "setCustomText:", v7);

  return v2;
}

- (void).cxx_destruct
{
}

@end