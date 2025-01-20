@interface GCTVSettingsProfileSelectionController
- (GCTVSettingsProfileSelectionController)initWithGame:(id)a3 controller:(id)a4;
- (id)previewForItemAtIndexPath:(id)a3;
@end

@implementation GCTVSettingsProfileSelectionController

- (GCTVSettingsProfileSelectionController)initWithGame:(id)a3 controller:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = &OBJC_CLASS___GCTVSettingsProfileSelectionController;
  v9 = -[GCTVSettingsProfileSelectionController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a4);
    objc_storeStrong((id *)&v10->_wrapper, a3);
  }

  return v10;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  previewViewController = self->_previewViewController;
  if (!previewViewController)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsGameWrapper game](self->_wrapper, "game", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GCSGame defaultIdentifier](&OBJC_CLASS___GCSGame, "defaultIdentifier"));
    unsigned int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      v9 = self->_previewViewController;
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___GCTVSettingsPreviewViewController);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
LABEL_7:
        previewViewController = self->_previewViewController;
        return previewViewController;
      }

      v11 = -[GCTVSettingsPreviewViewController initWithControllerType:]( objc_alloc(&OBJC_CLASS___GCTVSettingsPreviewViewController),  "initWithControllerType:",  -[GCSController tvset_controllerType](self->_controller, "tvset_controllerType"));
      objc_super v12 = self->_previewViewController;
      self->_previewViewController = (UIViewController *)v11;
    }

    else
    {
      id v13 = objc_alloc(&OBJC_CLASS___TSKAppIconPreviewViewController);
      objc_super v12 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsGameWrapper game](self->_wrapper, "game"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController bundleIdentifier](v12, "bundleIdentifier"));
      v15 = (UIViewController *)[v13 initWithApplicationBundleIdentifier:v14];
      v16 = self->_previewViewController;
      self->_previewViewController = v15;
    }

    goto LABEL_7;
  }

  return previewViewController;
}

- (void).cxx_destruct
{
}

@end