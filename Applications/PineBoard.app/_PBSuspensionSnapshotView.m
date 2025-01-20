@interface _PBSuspensionSnapshotView
+ (BOOL)isWallpaperRequired;
- (id)_newSnapshotView;
- (id)contentViewToAnimateToOnInterfaceChange;
- (id)snapshotLoadRequestBuilder;
- (void)didMoveToWindow;
- (void)setSnapshotLoadRequestBuilder:(id)a3;
@end

@implementation _PBSuspensionSnapshotView

+ (BOOL)isWallpaperRequired
{
  return 1;
}

- (id)contentViewToAnimateToOnInterfaceChange
{
  return -[_PBSuspensionSnapshotView _newSnapshotView](self, "_newSnapshotView");
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PBSuspensionSnapshotView;
  -[_PBSuspensionSnapshotView didMoveToWindow](&v6, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PBWallpaperSceneView contentView](self, "contentView"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_PBSuspensionSnapshotView window](self, "window"));

    if (!v4) {
      return;
    }
    id v5 = -[_PBSuspensionSnapshotView _newSnapshotView](self, "_newSnapshotView");
    -[_PBWallpaperSceneView setContentView:](self, "setContentView:", v5);

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PBWallpaperSceneView contentView](self, "contentView"));
    -[_PBSuspensionSnapshotView addSubview:](self, "addSubview:", v3);
  }
}

- (id)_newSnapshotView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PBWallpaperSceneView bundleIdentifier](self, "bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSnapshotLoadRequest requestWithBundleIdentifier:]( &OBJC_CLASS___PBSnapshotLoadRequest,  "requestWithBundleIdentifier:",  v3));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_PBSuspensionSnapshotView traitCollection](self, "traitCollection"));
  [v5 displayScale];
  objc_msgSend(v4, "setPreferredScaleFactor:");

  snapshotLoadRequestBuilder = (void (**)(id, void *))self->_snapshotLoadRequestBuilder;
  if (snapshotLoadRequestBuilder) {
    snapshotLoadRequestBuilder[2](snapshotLoadRequestBuilder, v4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSnapshotService sharedInstance](&OBJC_CLASS___PBSnapshotService, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 loadSnapshotImageWithRequest:v4]);

  v9 = objc_alloc(&OBJC_CLASS___UIImageView);
  -[_PBSuspensionSnapshotView bounds](self, "bounds");
  v10 = -[UIImageView initWithFrame:](v9, "initWithFrame:");
  -[UIImageView setAutoresizingMask:](v10, "setAutoresizingMask:", 18LL);
  -[UIImageView setContentMode:](v10, "setContentMode:", 1LL);
  -[UIImageView setImage:](v10, "setImage:", v8);
  -[UIImageView setClipsToBounds:](v10, "setClipsToBounds:", 1LL);
  -[_PBSuspensionSnapshotView _continuousCornerRadius](self, "_continuousCornerRadius");
  -[UIImageView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:");
  v11 = v10;
  v12 = v11;
  if ([v8 renderingMode] == (id)2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5000LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect effectForBlurEffect:]( &OBJC_CLASS___UIVibrancyEffect,  "effectForBlurEffect:",  v13));

    v12 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v14);
    -[UIVisualEffectView setAutoresizingMask:](v12, "setAutoresizingMask:", 18LL);
    -[_PBSuspensionSnapshotView bounds](self, "bounds");
    -[UIVisualEffectView setFrame:](v12, "setFrame:");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v12, "contentView"));
    [v15 addSubview:v11];
  }

  return v12;
}

- (id)snapshotLoadRequestBuilder
{
  return self->_snapshotLoadRequestBuilder;
}

- (void)setSnapshotLoadRequestBuilder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end