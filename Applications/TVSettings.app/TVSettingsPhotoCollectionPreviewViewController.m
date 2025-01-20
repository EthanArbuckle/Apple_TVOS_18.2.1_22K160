@interface TVSettingsPhotoCollectionPreviewViewController
- (TVPhotoCollection)photoCollection;
- (void)_updateViewWithImageProxies:(id)a3 inCollection:(id)a4;
- (void)loadView;
- (void)setPhotoCollection:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation TVSettingsPhotoCollectionPreviewViewController

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoCollectionPreviewViewController;
  -[TVSettingsPhotoCollectionPreviewViewController loadView](&v6, "loadView");
  v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsDeckImageView);
  deckImageView = self->_deckImageView;
  self->_deckImageView = v3;

  -[TVSettingsDeckImageView setImageProxies:](self->_deckImageView, "setImageProxies:", self->_assetImageProxies);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionPreviewViewController view](self, "view"));
  [v5 addSubview:self->_deckImageView];
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoCollectionPreviewViewController;
  -[TVSettingsPhotoCollectionPreviewViewController viewDidLayoutSubviews](&v12, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoCollectionPreviewViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[TVSettingsDeckImageView setFrame:](self->_deckImageView, "setFrame:", v5, v7, v9, v11);
}

- (void)setPhotoCollection:(id)a3
{
  id v5 = a3;
  if ((-[TVPhotoCollection isEqual:](self->_photoCollection, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_photoCollection, a3);
    objc_initWeak(&location, self);
    uint64_t v17 = TVPhotoServiceOptionsMaxAssetsKey;
    v18 = &off_1001AD848;
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 photoSource]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionIdentifier]);
    double v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    objc_super v12 = sub_1000BB3E0;
    v13 = &unk_100193BD8;
    objc_copyWeak(&v15, &location);
    id v14 = v5;
    [v7 fetchAssetsForCollectionWithIdentifier:v8 options:v6 completion:&v10];

    assetImageProxies = self->_assetImageProxies;
    self->_assetImageProxies = 0LL;

    -[TVSettingsDeckImageView setImageProxies:](self->_deckImageView, "setImageProxies:", 0LL, v10, v11, v12, v13);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
}

- (void)_updateViewWithImageProxies:(id)a3 inCollection:(id)a4
{
  id v8 = a3;
  if ([a4 isEqual:self->_photoCollection])
  {
    double v6 = (NSArray *)[v8 copy];
    assetImageProxies = self->_assetImageProxies;
    self->_assetImageProxies = v6;

    -[TVSettingsDeckImageView setImageProxies:](self->_deckImageView, "setImageProxies:", self->_assetImageProxies);
  }
}

- (TVPhotoCollection)photoCollection
{
  return self->_photoCollection;
}

- (void).cxx_destruct
{
}

@end