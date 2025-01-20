@interface TVSettingsAmbientMultiValuePreviewViewController
- (UIViewController)previewViewController;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)setPreviewViewController:(id)a3;
@end

@implementation TVSettingsAmbientMultiValuePreviewViewController

- (id)previewForItemAtIndexPath:(id)a3
{
  return -[TVSettingsAmbientMultiValuePreviewViewController previewViewController](self, "previewViewController", a3);
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end