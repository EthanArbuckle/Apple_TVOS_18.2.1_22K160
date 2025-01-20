@interface TVPPhotoCollectionPreviewViewController
- (CGRect)imageFrame;
- (PHAssetCollection)photoCollection;
- (void)_updateViewWithImageProxies:(id)a3 inCollection:(id)a4;
- (void)loadView;
- (void)setImageFrame:(CGRect)a3;
- (void)setPhotoCollection:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation TVPPhotoCollectionPreviewViewController

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPPhotoCollectionPreviewViewController;
  -[TVPPhotoCollectionPreviewViewController loadView](&v6, "loadView");
  v3 = objc_alloc_init(&OBJC_CLASS___TVPDeckImageView);
  deckImageView = self->_deckImageView;
  self->_deckImageView = v3;

  -[TVPDeckImageView setImageProxies:](self->_deckImageView, "setImageProxies:", self->_assetImageProxies);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCollectionPreviewViewController view](self, "view"));
  [v5 addSubview:self->_deckImageView];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVPPhotoCollectionPreviewViewController;
  -[TVPPhotoCollectionPreviewViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCollectionPreviewViewController view](self, "view"));
  [v3 bounds];
  double x = v4;
  double y = v6;
  double width = v8;
  double height = v10;

  -[TVPDeckImageView setFrame:](self->_deckImageView, "setFrame:", x, y, width, height);
  p_imageFrame = &self->_imageFrame;
  if (CGRectIsNull(self->_imageFrame))
  {
    p_imageFrame->origin.double x = x;
    self->_imageFrame.origin.double y = y;
    self->_imageFrame.size.double width = width;
    self->_imageFrame.size.double height = height;
  }

  else
  {
    double x = p_imageFrame->origin.x;
    double y = self->_imageFrame.origin.y;
    double width = self->_imageFrame.size.width;
    double height = self->_imageFrame.size.height;
  }

  -[TVPDeckImageView setImageFrame:](self->_deckImageView, "setImageFrame:", x, y, width, height);
}

- (void)setPhotoCollection:(id)a3
{
  id v5 = a3;
  if ((-[PHAssetCollection isEqual:](self->_photoCollection, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_photoCollection, a3);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000710FC;
    block[3] = &unk_1000CC4D0;
    id v10 = v5;
    objc_copyWeak(&v11, &location);
    dispatch_async(v7, block);
    assetImageProxies = self->_assetImageProxies;
    self->_assetImageProxies = 0LL;

    -[TVPDeckImageView setImageProxies:](self->_deckImageView, "setImageProxies:", 0LL);
    objc_destroyWeak(&v11);

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

    -[TVPDeckImageView setImageProxies:](self->_deckImageView, "setImageProxies:", self->_assetImageProxies);
  }
}

- (PHAssetCollection)photoCollection
{
  return self->_photoCollection;
}

- (CGRect)imageFrame
{
  double x = self->_imageFrame.origin.x;
  double y = self->_imageFrame.origin.y;
  double width = self->_imageFrame.size.width;
  double height = self->_imageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageFrame:(CGRect)a3
{
  self->_imageFrame = a3;
}

- (void).cxx_destruct
{
}

@end