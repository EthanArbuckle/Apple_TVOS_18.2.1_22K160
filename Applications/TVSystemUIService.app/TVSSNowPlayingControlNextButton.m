@interface TVSSNowPlayingControlNextButton
- (TVSSNowPlayingControlNextButton)initWithFrame:(CGRect)a3;
- (id)accessibilityIdentifier;
- (id)tintableLayers;
- (void)_advanceAnimationState;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation TVSSNowPlayingControlNextButton

- (TVSSNowPlayingControlNextButton)initWithFrame:(CGRect)a3
{
  CGRect v19 = a3;
  v18 = self;
  v17[1] = (id)a2;
  v7 = objc_alloc(&OBJC_CLASS___BSUICAPackageView);
  v8 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v17[0] = -[BSUICAPackageView initWithPackageName:inBundle:]( v7,  "initWithPackageName:inBundle:",  @"ForwardBackward");

  v9 = sub_1000582C4(0LL);
  objc_msgSend(v17[0], "setState:");

  [v17[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  unsigned __int8 v3 = +[TVSSConstants isScaledUI](&OBJC_CLASS___TVSSConstants, "isScaledUI");
  double v4 = 54.0;
  if ((v3 & 1) == 0) {
    double v4 = 44.0;
  }
  double v16 = v4;
  id v14 = [v17[0] widthAnchor];
  id v13 = [v14 constraintEqualToConstant:v16];
  v20[0] = v13;
  id v12 = [v17[0] heightAnchor];
  id v11 = [v12 constraintEqualToConstant:v16];
  v20[1] = v11;
  v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  v5 = v18;
  v18 = 0LL;
  v18 = -[TVSSNowPlayingControlButton initWithCAPackageView:frame:]( v5,  "initWithCAPackageView:frame:",  v17[0],  v19.origin.x,  v19.origin.y,  v19.size.width,  v19.size.height);
  v15 = v18;
  objc_storeStrong(v17, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v15;
}

- (id)tintableLayers
{
  v28 = self;
  v27[1] = (id)a2;
  if (!self->_loadedTintableLayers)
  {
    v27[0] = &off_1001C8570;
    id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    memset(__b, 0, sizeof(__b));
    id obj = v27[0];
    id v20 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
    if (v20)
    {
      uint64_t v16 = *(void *)__b[2];
      uint64_t v17 = 0LL;
      id v18 = v20;
      while (1)
      {
        uint64_t v15 = v17;
        if (*(void *)__b[2] != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(__b[1] + 8 * v17);
        id v13 = -[TVSSNowPlayingControlButton caPackageView](v28, "caPackageView");
        id location = -[BSUICAPackageView publishedObjectWithName:](v13, "publishedObjectWithName:", v25);

        id v14 = location;
        uint64_t v2 = objc_opt_class(&OBJC_CLASS___CALayer);
        if ((objc_opt_isKindOfClass(v14, v2) & 1) != 0) {
          [v26 addObject:location];
        }
        objc_storeStrong(&location, 0LL);
        ++v17;
        if (v15 + 1 >= (unint64_t)v18)
        {
          uint64_t v17 = 0LL;
          id v18 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
          if (!v18) {
            break;
          }
        }
      }
    }

    memset(v21, 0, sizeof(v21));
    id v11 = v26;
    id v12 = [v11 countByEnumeratingWithState:v21 objects:v29 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)v21[2];
      uint64_t v9 = 0LL;
      id v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)v21[2] != v8) {
          objc_enumerationMutation(v11);
        }
        id v22 = *(id *)(v21[1] + 8 * v9);
        id v6 = [v22 superlayer];
        [v6 setAllowsGroupBlending:0];

        ++v9;
        if (v7 + 1 >= (unint64_t)v10)
        {
          uint64_t v9 = 0LL;
          id v10 = [v11 countByEnumeratingWithState:v21 objects:v29 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    unsigned __int8 v3 = (NSArray *)[v26 copy];
    loadedTintableLayers = v28->_loadedTintableLayers;
    v28->_loadedTintableLayers = v3;

    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(v27, 0LL);
  }

  return v28->_loadedTintableLayers;
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  char v13 = -[TVSSNowPlayingControlNextButton isHighlighted](self, "isHighlighted") & 1;
  v12.receiver = v16;
  v12.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlNextButton;
  -[TVSSNowPlayingControlButton setHighlighted:](&v12, "setHighlighted:", v14);
  if (v14 != (v13 & 1))
  {
    if (v14)
    {
      -[TVSSNowPlayingControlNextButton _advanceAnimationState](v16, "_advanceAnimationState");
      objc_initWeak(&location, v16);
      -[NSTimer invalidate](v16->_repeatTimer, "invalidate");
      v5 = _NSConcreteStackBlock;
      int v6 = -1073741824;
      int v7 = 0;
      uint64_t v8 = sub_100058904;
      uint64_t v9 = &unk_1001B5AB0;
      objc_copyWeak(&v10, &location);
      unsigned __int8 v3 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v5,  0.5);
      repeatTimer = v16->_repeatTimer;
      v16->_repeatTimer = v3;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }

    else
    {
      -[NSTimer invalidate](v16->_repeatTimer, "invalidate");
      objc_storeStrong((id *)&v16->_repeatTimer, 0LL);
    }
  }

- (void)_advanceAnimationState
{
  self->_packageState = sub_100058A14(self->_packageState);
  unsigned __int8 v3 = -[TVSSNowPlayingControlButton caPackageView](self, "caPackageView");
  uint64_t v2 = sub_1000582C4(self->_packageState);
  -[BSUICAPackageView setState:animated:](v3, "setState:animated:");
}

- (id)accessibilityIdentifier
{
  return @"com.apple.TVSystemUIService.nowPlaying.nextButton";
}

- (void).cxx_destruct
{
}

@end