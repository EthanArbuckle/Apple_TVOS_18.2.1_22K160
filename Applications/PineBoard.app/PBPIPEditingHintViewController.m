@interface PBPIPEditingHintViewController
- (NSTimer)fadeTimer;
- (PBPIPCapsuleView)editingHintView;
- (PBPIPEditingHintViewController)initWithStyle:(int64_t)a3;
- (PBPIPEditingHintViewControllerDelegate)delegate;
- (UIView)gradientView;
- (int64_t)style;
- (void)_fade:(int64_t)a3 animated:(BOOL)a4;
- (void)appearAnimated;
- (void)dismissAnimated;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setFadeTimer:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PBPIPEditingHintViewController

- (PBPIPEditingHintViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBPIPEditingHintViewController;
  result = -[PBPIPEditingHintViewController init](&v5, "init");
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (void)loadView
{
  v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPCapsuleView pressForOptionsView](&OBJC_CLASS___PBPIPCapsuleView, "pressForOptionsView"));
  LODWORD(v6) = 1132068864;
  [v5 setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1144750080;
  [v5 setContentHuggingPriority:0 forAxis:v7];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_storeWeak((id *)&self->_editingHintView, v5);
  v21 = self;
  if (self->_style == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBPIPViewBuilder makePipGradientViewWithCornerRadius:]( &OBJC_CLASS___PBPIPViewBuilder,  "makePipGradientViewWithCornerRadius:",  1LL));
    -[UIView addSubview:](v3, "addSubview:", v8);
    objc_storeWeak((id *)&self->_gradientView, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pb_constraintsForPinningToBottomOfView:", v3));
    [v4 addObjectsFromArray:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 bottomAnchor]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v11 constant:-14.0]);
    [v4 addObject:v12];
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 centerYAnchor]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3, "centerYAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v10]);
    [v4 addObject:v11];
  }

  -[UIView addSubview:](v3, "addSubview:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 centerXAnchor]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v14]);
  v22[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 widthAnchor]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3, "widthAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintLessThanOrEqualToAnchor:v17 constant:-28.0]);
  v22[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  [v4 addObjectsFromArray:v19];

  id v20 = [v4 copy];
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v20);

  -[PBPIPEditingHintViewController setView:](v21, "setView:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBPIPEditingHintViewController;
  -[PBPIPEditingHintViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingHintView);
  [WeakRetained setAlpha:0.0];

  id v5 = objc_loadWeakRetained((id *)&self->_gradientView);
  [v5 setAlpha:0.0];
}

- (void)appearAnimated
{
}

- (void)dismissAnimated
{
}

- (void)_fade:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[NSTimer invalidate](self->_fadeTimer, "invalidate");
  fadeTimer = self->_fadeTimer;
  self->_fadeTimer = 0LL;

  if (a3 == 1) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingHintView);
  id v10 = objc_loadWeakRetained((id *)&self->_gradientView);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000E6A6C;
  v16[3] = &unk_1003D1718;
  id v11 = WeakRetained;
  id v17 = v11;
  double v19 = v8;
  id v12 = v10;
  id v18 = v12;
  v13 = objc_retainBlock(v16);
  v14 = v13;
  if (v4)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000E6AA0;
    v15[3] = &unk_1003D6630;
    v15[4] = self;
    v15[5] = a3;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v13,  v15,  0.33,  0.0);
  }

  else
  {
    ((void (*)(void *))v13[2])(v13);
  }
}

- (PBPIPEditingHintViewControllerDelegate)delegate
{
  return (PBPIPEditingHintViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBPIPCapsuleView)editingHintView
{
  return (PBPIPCapsuleView *)objc_loadWeakRetained((id *)&self->_editingHintView);
}

- (NSTimer)fadeTimer
{
  return self->_fadeTimer;
}

- (void)setFadeTimer:(id)a3
{
}

- (UIView)gradientView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_gradientView);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
}

@end