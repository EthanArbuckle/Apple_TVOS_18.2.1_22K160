@interface TVSSShareAudioHeadphoneMovieRenderer
+ (id)rendererWithIdentifier:(id)a3;
- (BOOL)isFocusable;
- (BOOL)wantsFloatingContentView;
- (BOOL)wantsGradientMask;
- (BTMediaPlayerView)mediaPlayerView;
- (NSString)moviePath;
- (TVSSShareAudioHeadphoneMovieRenderer)initWithIdentifier:(id)a3;
- (UIImage)fallbackImage;
- (UIImageView)fallbackImageView;
- (void)_disableGradientMask;
- (void)_enableGradientMask;
- (void)configureContentView:(id)a3;
- (void)setFallbackImage:(id)a3;
- (void)setFallbackImageView:(id)a3;
- (void)setMediaPlayerView:(id)a3;
- (void)setMoviePath:(id)a3;
- (void)setWantsGradientMask:(BOOL)a3;
@end

@implementation TVSSShareAudioHeadphoneMovieRenderer

+ (id)rendererWithIdentifier:(id)a3
{
  Class v7 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc(v7);
  id v5 = [v3 initWithIdentifier:location[0]];
  objc_storeStrong(location, 0LL);
  return v5;
}

- (TVSSShareAudioHeadphoneMovieRenderer)initWithIdentifier:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSShareAudioHeadphoneMovieRenderer;
  v8 = -[TVSSShareAudioHeadphoneMovieRenderer initWithIdentifier:format:content:overrideStylings:]( &v6,  "initWithIdentifier:format:content:overrideStylings:",  location[0],  1LL,  0LL,  &__NSArray0__struct);
  objc_storeStrong((id *)&v8, v8);
  id v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)configureContentView:(id)a3
{
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v35.receiver = v37;
  v35.super_class = (Class)&OBJC_CLASS___TVSSShareAudioHeadphoneMovieRenderer;
  -[TVSSShareAudioHeadphoneMovieRenderer configureContentView:](&v35, "configureContentView:", location[0]);
  id v7 = objc_alloc((Class)off_1002205F8());
  [location[0] bounds];
  v33[1] = v3;
  v33[2] = v4;
  v33[3] = v5;
  v33[4] = v6;
  id v34 = objc_msgSend(v7, "initWithFrame:", *(double *)&v3, *(double *)&v4, *(double *)&v5, *(double *)&v6);
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  -[TVSSShareAudioHeadphoneMovieRenderer setMediaPlayerView:](v37, "setMediaPlayerView:", v34);
  [location[0] addSubview:v34];
  v33[0] = objc_alloc_init(&OBJC_CLASS___UIImageView);
  [v33[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v33[0] setContentMode:1];
  [v33[0] setHidden:1];
  -[TVSSShareAudioHeadphoneMovieRenderer setFallbackImageView:](v37, "setFallbackImageView:", v33[0]);
  [location[0] addSubview:v33[0]];
  id v32 = [v34 leadingAnchor];
  id v31 = [location[0] leadingAnchor];
  id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
  v38[0] = v30;
  id v29 = [v34 trailingAnchor];
  id v28 = [location[0] trailingAnchor];
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
  v38[1] = v27;
  id v26 = [v34 topAnchor];
  id v25 = [location[0] topAnchor];
  id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
  v38[2] = v24;
  id v23 = [v34 bottomAnchor];
  id v22 = [location[0] bottomAnchor];
  id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
  v38[3] = v21;
  id v20 = [v33[0] leadingAnchor];
  id v19 = [location[0] leadingAnchor];
  id v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
  v38[4] = v18;
  id v17 = [v33[0] trailingAnchor];
  id v16 = [location[0] trailingAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v38[5] = v15;
  id v14 = [v33[0] topAnchor];
  id v13 = [location[0] topAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v38[6] = v12;
  id v11 = [v33[0] bottomAnchor];
  id v10 = [location[0] bottomAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v38[7] = v9;
  v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 8LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setMoviePath:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v8->_moviePath != location[0])
  {
    objc_storeStrong((id *)&v8->_moviePath, location[0]);
    id v3 = -[TVSSShareAudioHeadphoneMovieRenderer mediaPlayerView](v8, "mediaPlayerView");
    -[BTMediaPlayerView stop](v3, "stop");

    v4 = -[TVSSShareAudioHeadphoneMovieRenderer mediaPlayerView](v8, "mediaPlayerView");
    -[BTMediaPlayerView startMovieLoopWithPath:](v4, "startMovieLoopWithPath:", location[0]);

    id v5 = -[TVSSShareAudioHeadphoneMovieRenderer fallbackImageView](v8, "fallbackImageView");
    -[UIImageView setHidden:](v5, "setHidden:", 1LL);

    objc_super v6 = -[TVSSShareAudioHeadphoneMovieRenderer mediaPlayerView](v8, "mediaPlayerView");
    -[BTMediaPlayerView setHidden:](v6, "setHidden:", 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setFallbackImage:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v8->_fallbackImage != location[0])
  {
    objc_storeStrong((id *)&v8->_fallbackImage, location[0]);
    id v3 = location[0];
    v4 = -[TVSSShareAudioHeadphoneMovieRenderer fallbackImageView](v8, "fallbackImageView");
    -[UIImageView setImage:](v4, "setImage:", v3);

    id v5 = -[TVSSShareAudioHeadphoneMovieRenderer mediaPlayerView](v8, "mediaPlayerView");
    -[BTMediaPlayerView setHidden:](v5, "setHidden:", 1LL);

    objc_super v6 = -[TVSSShareAudioHeadphoneMovieRenderer fallbackImageView](v8, "fallbackImageView");
    -[UIImageView setHidden:](v6, "setHidden:", 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setWantsGradientMask:(BOOL)a3
{
  if (self->_wantsGradientMask != a3)
  {
    self->_wantsGradientMask = a3;
    if (a3) {
      -[TVSSShareAudioHeadphoneMovieRenderer _enableGradientMask](self, "_enableGradientMask");
    }
    else {
      -[TVSSShareAudioHeadphoneMovieRenderer _disableGradientMask](self, "_disableGradientMask");
    }
  }

- (BOOL)isFocusable
{
  return 0;
}

- (BOOL)wantsFloatingContentView
{
  return 0;
}

- (void)_enableGradientMask
{
  id v20 = self;
  v19[1] = (id)a2;
  v19[0] = +[CAGradientLayer layer](&OBJC_CLASS___CAGradientLayer, "layer");
  id v10 = -[TVSSShareAudioHeadphoneMovieRenderer mediaPlayerView](v20, "mediaPlayerView");
  -[BTMediaPlayerView bounds](v10, "bounds");
  objc_msgSend(v19[0], "setFrame:", v2, v3, v4, v5);

  id v15 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v21[0] = -[UIColor CGColor](v15, "CGColor");
  id v14 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v21[1] = -[UIColor CGColor](v14, "CGColor");
  id v13 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
  v21[2] = -[UIColor CGColor](v13, "CGColor");
  id v12 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v21[3] = -[UIColor CGColor](v12, "CGColor");
  id v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL);
  objc_msgSend(v19[0], "setColors:");

  [v19[0] setLocations:&off_1001C8768];
  sub_1000E4178();
  objc_msgSend(v19[0], "setStartPoint:", v6, v7);
  sub_1000E4178();
  objc_msgSend(v19[0], "setEndPoint:", v8, v9);
  id v16 = v19[0];
  id v18 = -[TVSSShareAudioHeadphoneMovieRenderer mediaPlayerView](v20, "mediaPlayerView");
  id v17 = -[BTMediaPlayerView layer](v18, "layer");
  [v17 setMask:v16];

  objc_storeStrong(v19, 0LL);
}

  ;
}

- (void)_disableGradientMask
{
  double v3 = -[TVSSShareAudioHeadphoneMovieRenderer mediaPlayerView](self, "mediaPlayerView");
  id v2 = -[BTMediaPlayerView layer](v3, "layer");
  [v2 setMask:0];
}

- (NSString)moviePath
{
  return self->_moviePath;
}

- (UIImage)fallbackImage
{
  return self->_fallbackImage;
}

- (BOOL)wantsGradientMask
{
  return self->_wantsGradientMask;
}

- (BTMediaPlayerView)mediaPlayerView
{
  return self->_mediaPlayerView;
}

- (void)setMediaPlayerView:(id)a3
{
}

- (UIImageView)fallbackImageView
{
  return self->_fallbackImageView;
}

- (void)setFallbackImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end