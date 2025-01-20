@interface _PBWallpaperSceneView
+ (BOOL)isWallpaperRequired;
- (BOOL)isWallpaperEnabled;
- (NSString)bundleIdentifier;
- (UIView)contentView;
- (UIView)contentViewToAnimateToOnInterfaceChange;
- (UIView)wallpaperView;
- (_PBWallpaperSceneView)initWithBundleIdentifier:(id)a3 allowsGroupOpacity:(BOOL)a4;
- (id)_newWallpaperView;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_userInterfaceStyleDidChange;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setContentViewToAnimateToOnInterfaceChange:(id)a3;
- (void)setWallpaperEnabled:(BOOL)a3;
- (void)setWallpaperView:(id)a3;
@end

@implementation _PBWallpaperSceneView

+ (BOOL)isWallpaperRequired
{
  return 0;
}

- (_PBWallpaperSceneView)initWithBundleIdentifier:(id)a3 allowsGroupOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____PBWallpaperSceneView;
  v7 = -[_PBWallpaperSceneView initWithFrame:]( &v14,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_PBWallpaperSceneView layer](v7, "layer"));
    [v10 setAllowsGroupOpacity:v4];

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    id v12 =  -[_PBWallpaperSceneView registerForTraitChanges:withAction:]( v7,  "registerForTraitChanges:withAction:",  v11,  "_userInterfaceStyleDidChange");
  }

  return v7;
}

- (void)setWallpaperEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(id)objc_opt_class(self) isWallpaperRequired] ^ 1 | a3;
  if (self->_wallpaperEnabled != v3 && v5 != 0)
  {
    self->_wallpaperEnabled = v3;
    wallpaperView = self->_wallpaperView;
    if (v3)
    {
      if (!wallpaperView)
      {
        v8 = -[_PBWallpaperSceneView _newWallpaperView](self, "_newWallpaperView");
        v9 = self->_wallpaperView;
        self->_wallpaperView = v8;

        -[_PBWallpaperSceneView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_wallpaperView, 0LL);
      }
    }

    else if (wallpaperView)
    {
      -[UIView removeFromSuperview](wallpaperView, "removeFromSuperview");
      v10 = self->_wallpaperView;
      self->_wallpaperView = 0LL;
    }
  }

- (void)_setContinuousCornerRadius:(double)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____PBWallpaperSceneView;
  -[_PBWallpaperSceneView _setContinuousCornerRadius:](&v14, "_setContinuousCornerRadius:");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_PBWallpaperSceneView subviews](self, "subviews", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) _setContinuousCornerRadius:a3];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PBWallpaperSceneView;
  -[_PBWallpaperSceneView layoutSubviews](&v4, "layoutSubviews");
  wallpaperView = self->_wallpaperView;
  -[_PBWallpaperSceneView bounds](self, "bounds");
  -[UIView setFrame:](wallpaperView, "setFrame:");
}

- (void)_userInterfaceStyleDidChange
{
  if (self->_wallpaperEnabled)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneTransitionContext transitionContext]( &OBJC_CLASS___FBSSceneTransitionContext,  "transitionContext"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSAnimationSettings settingsWithDuration:]( &OBJC_CLASS___BSAnimationSettings,  "settingsWithDuration:",  0.5));
    [v4 setAnimationSettings:v5];

    [v4 setAnimationFence:v3];
    id v6 = self->_wallpaperView;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_PBWallpaperSceneView contentViewToAnimateToOnInterfaceChange]( self,  "contentViewToAnimateToOnInterfaceChange"));
    if (v7)
    {
      uint64_t v8 = self->_contentView;
      objc_storeStrong((id *)&self->_contentView, v7);
      -[_PBWallpaperSceneView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_contentView, 0LL);
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    v9 = -[_PBWallpaperSceneView _newWallpaperView](self, "_newWallpaperView");
    wallpaperView = self->_wallpaperView;
    self->_wallpaperView = v9;
    __int128 v11 = v9;

    -[_PBWallpaperSceneView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_wallpaperView, 0LL);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 animationSettings]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1001DB3E4;
    v18[3] = &unk_1003CFEB8;
    v19 = v6;
    v20 = v8;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001DB418;
    v15[3] = &unk_1003D63D8;
    v16 = v19;
    v17 = v20;
    __int128 v13 = v20;
    objc_super v14 = v19;
    +[BSUIAnimationFactory animateWithSettings:actions:completion:]( &OBJC_CLASS___BSUIAnimationFactory,  "animateWithSettings:actions:completion:",  v12,  v18,  v15);
  }

- (id)_newWallpaperView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper pb_wallpaperViewForVariant:bundleIdentifier:]( &OBJC_CLASS___TVSUIWallpaper,  "pb_wallpaperViewForVariant:bundleIdentifier:",  1LL,  self->_bundleIdentifier));
  [v3 setClipsToBounds:1];
  -[_PBWallpaperSceneView _continuousCornerRadius](self, "_continuousCornerRadius");
  objc_msgSend(v3, "_setContinuousCornerRadius:");
  [v3 setAutoresizingMask:18];
  return v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setWallpaperView:(id)a3
{
}

- (UIView)contentViewToAnimateToOnInterfaceChange
{
  return self->_contentViewToAnimateToOnInterfaceChange;
}

- (void)setContentViewToAnimateToOnInterfaceChange:(id)a3
{
}

- (BOOL)isWallpaperEnabled
{
  return self->_wallpaperEnabled;
}

- (void).cxx_destruct
{
}

@end