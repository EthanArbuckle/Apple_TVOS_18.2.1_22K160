@interface _TVSSSleepTimerRenderer
- (id)_sleepTimerController;
- (void)applyContent:(id)a3 animator:(id)a4;
- (void)configureContentView:(id)a3;
- (void)updateContentView;
@end

@implementation _TVSSSleepTimerRenderer

- (void)configureContentView:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v21.receiver = v23;
  v21.super_class = (Class)&OBJC_CLASS____TVSSSleepTimerRenderer;
  -[_TVSSSleepTimerRenderer configureContentView:](&v21, "configureContentView:", location[0]);
  if (!v23->_liveGlyphView)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSSAutoUpdatingSleepTimerGlyphView);
    liveGlyphView = v23->_liveGlyphView;
    v23->_liveGlyphView = v3;

    v5 = v23->_liveGlyphView;
    id v6 = +[UIColor systemMintColor](&OBJC_CLASS___UIColor, "systemMintColor");
    -[TVSSAutoUpdatingSleepTimerGlyphView setTintColor:](v5, "setTintColor:");

    v7 = v23->_liveGlyphView;
    id v9 = -[_TVSSSleepTimerRenderer _sleepTimerController](v23, "_sleepTimerController");
    id v8 = [v9 currentScheduledSleep];
    -[TVSSAutoUpdatingSleepTimerGlyphView setHidden:](v7, "setHidden:", v8 == 0LL);

    -[TVSSAutoUpdatingSleepTimerGlyphView setTranslatesAutoresizingMaskIntoConstraints:]( v23->_liveGlyphView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v10 = v23->_liveGlyphView;
    id v11 = -[_TVSSSleepTimerRenderer _sleepTimerController](v23, "_sleepTimerController");
    -[TVSSAutoUpdatingSleepTimerGlyphView setSleepTimerController:](v10, "setSleepTimerController:");

    [location[0] addSubview:v23->_liveGlyphView];
    id v12 = -[_TVSSSleepTimerRenderer subviews](v23, "subviews");
    id v20 = [v12 imageView];

    id v19 = -[TVSSAutoUpdatingSleepTimerGlyphView centerXAnchor](v23->_liveGlyphView, "centerXAnchor");
    id v18 = [v20 centerXAnchor];
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v24[0] = v17;
    id v16 = -[TVSSAutoUpdatingSleepTimerGlyphView centerYAnchor](v23->_liveGlyphView, "centerYAnchor");
    id v15 = [v20 centerYAnchor];
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    v24[1] = v14;
    v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_storeStrong(&v20, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)applyContent:(id)a3 animator:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  v7.receiver = v10;
  v7.super_class = (Class)&OBJC_CLASS____TVSSSleepTimerRenderer;
  -[_TVSSSleepTimerRenderer applyContent:animator:](&v7, "applyContent:animator:", location[0], v8);
  liveGlyphView = v10->_liveGlyphView;
  id v6 = -[_TVSSSleepTimerRenderer _sleepTimerController](v10, "_sleepTimerController");
  -[TVSSAutoUpdatingSleepTimerGlyphView setSleepTimerController:](liveGlyphView, "setSleepTimerController:");

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)updateContentView
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = -[_TVSSSleepTimerRenderer _sleepTimerController](self, "_sleepTimerController");
  id v2 = [location[0] currentScheduledSleep];
  BOOL v7 = v2 == 0LL;

  if (v7)
  {
    -[TVSSAutoUpdatingSleepTimerGlyphView setHidden:](v9->_liveGlyphView, "setHidden:", 1LL);
    id v4 = -[_TVSSSleepTimerRenderer subviews](v9, "subviews");
    id v3 = [v4 imageView];
    [v3 setHidden:0];
  }

  else
  {
    -[TVSSAutoUpdatingSleepTimerGlyphView setHidden:](v9->_liveGlyphView, "setHidden:", 0LL);
    id v6 = -[_TVSSSleepTimerRenderer subviews](v9, "subviews");
    id v5 = [v6 imageView];
    [v5 setHidden:1];
  }

  objc_storeStrong(location, 0LL);
}

- (id)_sleepTimerController
{
  return -[_TVSSSleepTimerRenderer content](self, "content", a2, self);
}

- (void).cxx_destruct
{
}

@end