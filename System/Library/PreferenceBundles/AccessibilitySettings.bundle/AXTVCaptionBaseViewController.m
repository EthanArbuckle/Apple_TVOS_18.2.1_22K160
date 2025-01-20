@interface AXTVCaptionBaseViewController
- (AXTVCaptionCloudView)captionImageView;
- (TSKPreviewViewController)captionPreviewViewController;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)loadView;
- (void)setCaptionImageView:(id)a3;
- (void)setCaptionPreviewViewController:(id)a3;
@end

@implementation AXTVCaptionBaseViewController

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVCaptionBaseViewController;
  -[AXTVCaptionBaseViewController loadView](&v8, "loadView");
  v3 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
  captionPreviewViewController = self->_captionPreviewViewController;
  self->_captionPreviewViewController = v3;

  v5 = objc_alloc(&OBJC_CLASS___AXTVCaptionCloudView);
  +[AXTVCaptionCloudView preferredSize](&OBJC_CLASS___AXTVCaptionCloudView, "preferredSize");
  v6 = -[AXTVCaptionCloudView initWithSize:](v5, "initWithSize:");
  captionImageView = self->_captionImageView;
  self->_captionImageView = v6;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  captionPreviewViewController = self->_captionPreviewViewController;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionBaseViewController captionImageView](self, "captionImageView"));
  -[TSKPreviewViewController setContentView:animated:]( captionPreviewViewController,  "setContentView:animated:",  v6,  0LL);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v5));
  -[TSKPreviewViewController setDescriptionText:](self->_captionPreviewViewController, "setDescriptionText:", v7);
  objc_super v8 = self->_captionPreviewViewController;

  return v8;
}

- (AXTVCaptionCloudView)captionImageView
{
  return self->_captionImageView;
}

- (void)setCaptionImageView:(id)a3
{
}

- (TSKPreviewViewController)captionPreviewViewController
{
  return self->_captionPreviewViewController;
}

- (void)setCaptionPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end