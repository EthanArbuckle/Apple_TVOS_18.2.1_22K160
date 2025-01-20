@interface TVMusicArtistTemplateController
- (BOOL)_isTopRowView:(id)a3;
- (BOOL)isInitialItemFocused;
- (BOOL)isMotionPaused;
- (CGRect)initialFocusedFrame;
- (TVMusicMotionView)motionView;
- (UIFocusItem)initialFocusedItem;
- (id)_firstScrollStop;
- (id)parsedMediaInfo;
- (id)scrollStopForEnteringSectionAtIndex:(int64_t)a3 fromEdge:(int64_t)a4;
- (id)scrollStopForShowcaseTransition;
- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setInitialFocusedFrame:(CGRect)a3;
- (void)setInitialFocusedItem:(id)a3;
- (void)setIsInitialItemFocused:(BOOL)a3;
- (void)setMotionPaused:(BOOL)a3;
- (void)setMotionView:(id)a3;
- (void)updateBackgroundAndBackdrop;
- (void)updateWithViewElement:(id)a3;
@end

@implementation TVMusicArtistTemplateController

- (void)updateBackgroundAndBackdrop
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController stackWrappingView](self, "stackWrappingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController bgImage](self, "bgImage"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMLUtilities imageWithRadialGradientOverlayFromImage:]( &OBJC_CLASS___TVMLUtilities,  "imageWithRadialGradientOverlayFromImage:",  v3));
    [v8 setBackgroundImage:v4];
    [v8 setBackdropImage:v3];
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController motionView](self, "motionView"));

    if (!v5) {
      goto LABEL_8;
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController viewElement](self, "viewElement"));
  if (+[TVMLUtilities interfaceStyleForTemplateElement:]( &OBJC_CLASS___TVMLUtilities,  "interfaceStyleForTemplateElement:",  v6) == (id)1) {
    uint64_t v7 = 4001LL;
  }
  else {
    uint64_t v7 = 4006LL;
  }

  [v8 setBackdropBlurEffectStyle:v7];
  [v8 setNeedsLayout];
LABEL_8:
}

- (id)parsedMediaInfo
{
  return 0LL;
}

- (void)updateWithViewElement:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___TVMusicArtistTemplateController;
  -[TVMusicArtistTemplateController updateWithViewElement:](&v49, "updateWithViewElement:", v4);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  v36 = v4;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 children]);
  id v5 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v46;
    uint64_t v8 = TVElementKeyBackground;
    uint64_t v37 = TVElementKeyBackground;
    uint64_t v38 = *(void *)v46;
    do
    {
      v9 = 0LL;
      id v39 = v6;
      do
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 elementName]);
        unsigned int v12 = [v11 isEqualToString:v8];

        if (!v12) {
          goto LABEL_22;
        }
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        v13 = (void *)objc_claimAutoreleasedReturnValue([v10 children]);
        id v14 = [v13 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (!v14) {
          goto LABEL_21;
        }
        id v15 = v14;
        uint64_t v16 = *(void *)v42;
        while (2)
        {
          v17 = self;
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v13);
            }
            v19 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 elementName]);
            unsigned int v21 = [v20 isEqualToString:@"motionView"];

            if (v21)
            {
              v22 = -[TVViewElement initWithViewElement:]( objc_alloc(&OBJC_CLASS___TVViewElement),  "initWithViewElement:",  v19);
              v23 = -[TVMusicMotionView initWithElement:alwaysActive:]( objc_alloc(&OBJC_CLASS___TVMusicMotionView),  "initWithElement:alwaysActive:",  v22,  1LL);
              self = v17;
              -[TVMusicArtistTemplateController setMotionView:](v17, "setMotionView:", v23);

              v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVMLKit"));
              v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:",  @"TVCKBackgroundShelfGradient",  v24));

              v26 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController motionView](v17, "motionView"));
              -[UIImageView frame](v26, "frame");
              double v28 = v27;
              [v25 size];
              if (v28 < v29) {
                goto LABEL_19;
              }
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController motionView](v17, "motionView"));
              [v30 frame];
              double v32 = v31;
              [v25 size];
              double v34 = v33;

              if (v32 >= v34)
              {
                v26 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v25);
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController motionView](v17, "motionView"));
                [v35 addSubview:v26];

LABEL_19:
              }

              goto LABEL_21;
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v41 objects:v50 count:16];
          self = v17;
          if (v15) {
            continue;
          }
          break;
        }

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVMusicArtistTemplateController;
  -[TVMusicArtistTemplateController _configureWithBgImage:backdropImage:]( &v12,  "_configureWithBgImage:backdropImage:",  a3,  a4);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController motionView](self, "motionView"));
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController motionView](self, "motionView"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 superview]);

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController stackWrappingView](self, "stackWrappingView"));
      [v9 layoutIfNeeded];

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController stackWrappingView](self, "stackWrappingView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController motionView](self, "motionView"));
      [v10 insertSubview:v11 atIndex:0];
    }
  }

- (id)scrollStopForShowcaseTransition
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController bgImgElement](self, "bgImgElement"));

  if (v3) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController _firstScrollStop](self, "_firstScrollStop"));
  }
  else {
    id v4 = 0LL;
  }
  return v4;
}

- (id)scrollStopForEnteringSectionAtIndex:(int64_t)a3 fromEdge:(int64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController bgImgElement](self, "bgImgElement"));

  if (a3 || !v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController viewControllers](self, "viewControllers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:a3]);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tv_associatedIKViewElement"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 attributes]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:TVAttributeKeyMarkBackgroundSegment]);

    if (v13)
    {
      unsigned int v14 = [v13 BOOLValue];
      id v8 = 0LL;
      if (!a4 && v14)
      {
        id v8 = objc_alloc_init(&OBJC_CLASS____TVStackScrollStop);
        [v8 setSectionIndex:a3];
        [v8 setEdge:0];
        [v8 setOffset:0.0];
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController _firstScrollStop](self, "_firstScrollStop"));
  }

  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___TVMusicArtistTemplateController;
  -[TVMusicArtistTemplateController didUpdateFocusInContext:withAnimationCoordinator:]( &v41,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController initialFocusedItem](self, "initialFocusedItem"));

  if (v7) {
    goto LABEL_11;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedView]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController view](self, "view"));
  unsigned int v10 = [v8 isDescendantOfView:v9];

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedItem]);
    -[TVMusicArtistTemplateController setInitialFocusedItem:](self, "setInitialFocusedItem:", v11);
LABEL_6:

    goto LABEL_7;
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController view](self, "view"));
  unsigned int v14 = [v12 isDescendantOfView:v13];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedItem]);
    -[TVMusicArtistTemplateController setInitialFocusedItem:](self, "setInitialFocusedItem:", v15);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 postNotificationName:@"TVMusicPerformanceTestArtistPageDisplayedNotification" object:self];
    goto LABEL_6;
  }

- (BOOL)_isTopRowView:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController initialFocusedItem](self, "initialFocusedItem"));

  if (v5 == v4)
  {
    BOOL v24 = 1;
  }

  else
  {
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicArtistTemplateController collectionView](self, "collectionView"));
    objc_msgSend(v4, "convertRect:toView:", v14, v7, v9, v11, v13);
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v26.origin.x = v16;
    v26.origin.y = v18;
    v26.size.width = v20;
    v26.size.height = v22;
    double MinY = CGRectGetMinY(v26);
    -[TVMusicArtistTemplateController initialFocusedFrame](self, "initialFocusedFrame");
    BOOL v24 = MinY < CGRectGetMaxY(v27);
  }

  return v24;
}

- (id)_firstScrollStop
{
  id v2 = objc_alloc_init(&OBJC_CLASS____TVStackScrollStop);
  [v2 setSectionIndex:0];
  [v2 setEdge:0];
  [v2 setOffset:-236.0];
  return v2;
}

- (TVMusicMotionView)motionView
{
  return self->_motionView;
}

- (void)setMotionView:(id)a3
{
}

- (BOOL)isMotionPaused
{
  return self->_motionPaused;
}

- (void)setMotionPaused:(BOOL)a3
{
  self->_motionPaused = a3;
}

- (UIFocusItem)initialFocusedItem
{
  return self->_initialFocusedItem;
}

- (void)setInitialFocusedItem:(id)a3
{
}

- (CGRect)initialFocusedFrame
{
  double x = self->_initialFocusedFrame.origin.x;
  double y = self->_initialFocusedFrame.origin.y;
  double width = self->_initialFocusedFrame.size.width;
  double height = self->_initialFocusedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialFocusedFrame:(CGRect)a3
{
  self->_initialFocusedFrame = a3;
}

- (BOOL)isInitialItemFocused
{
  return self->_isInitialItemFocused;
}

- (void)setIsInitialItemFocused:(BOOL)a3
{
  self->_isInitialItemFocused = a3;
}

- (void).cxx_destruct
{
}

@end