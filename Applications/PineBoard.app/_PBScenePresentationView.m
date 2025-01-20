@interface _PBScenePresentationView
- (_PBScenePresentationView)initWithBundleIdentifier:(id)a3 scenePresentationViewProvider:(id)a4;
- (id)scenePresentationViewProviderBlock;
- (void)didMoveToWindow;
- (void)setScenePresentationViewProviderBlock:(id)a3;
@end

@implementation _PBScenePresentationView

- (_PBScenePresentationView)initWithBundleIdentifier:(id)a3 scenePresentationViewProvider:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____PBScenePresentationView;
  v7 = -[_PBWallpaperSceneView initWithBundleIdentifier:allowsGroupOpacity:]( &v11,  "initWithBundleIdentifier:allowsGroupOpacity:",  a3,  0LL);
  if (v7)
  {
    id v8 = objc_retainBlock(v6);
    id scenePresentationViewProviderBlock = v7->_scenePresentationViewProviderBlock;
    v7->_id scenePresentationViewProviderBlock = v8;
  }

  return v7;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PBScenePresentationView;
  -[_PBScenePresentationView didMoveToWindow](&v6, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PBWallpaperSceneView contentView](self, "contentView"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentationView window](self, "window"));

    if (!v4) {
      return;
    }
    uint64_t v5 = (*((uint64_t (**)(void))self->_scenePresentationViewProviderBlock + 2))();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v3 setClipsToBounds:1];
    -[_PBWallpaperSceneView setContentView:](self, "setContentView:", v3);
    -[_PBScenePresentationView addSubview:](self, "addSubview:", v3);
  }
}

- (id)scenePresentationViewProviderBlock
{
  return self->_scenePresentationViewProviderBlock;
}

- (void)setScenePresentationViewProviderBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end