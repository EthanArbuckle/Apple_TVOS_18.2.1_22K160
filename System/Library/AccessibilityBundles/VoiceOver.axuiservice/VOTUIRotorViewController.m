@interface VOTUIRotorViewController
- (BOOL)_canShowWhileLocked;
- (void)loadView;
- (void)setRotorHidden:(BOOL)a3;
- (void)setupConstraintsIfNecessary;
- (void)updateVisualRotor:(id)a3;
@end

@implementation VOTUIRotorViewController

- (void)loadView
{
  v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[VOTUIRotorViewController setView:](self, "setView:", v3);
}

- (void)setupConstraintsIfNecessary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIRotorViewController view](self, "view"));
  id v15 = (id)objc_claimAutoreleasedReturnValue([v3 window]);

  v4 = v15;
  if (v15 && !self->_constraintsSetUp)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v6 = self->_rotorDisplay;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIRotorViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  9LL,  0LL,  v7,  9LL,  1.0,  0.0));
    [v5 addObject:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIRotorViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  10LL,  0LL,  v9,  10LL,  1.0,  0.0));

    [v5 addObject:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIRotorViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  9LL,  0LL,  v15,  9LL,  1.0,  0.0));
    [v5 addObject:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIRotorViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v13,  10LL,  0LL,  v15,  10LL,  1.0,  0.0));
    [v5 addObject:v14];

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v5);
    self->_constraintsSetUp = 1;

    v4 = v15;
  }
}

- (void)updateVisualRotor:(id)a3
{
  id v16 = a3;
  if (!self->_rotorDisplay)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___VOTUIRotorDisplay);
    rotorDisplay = self->_rotorDisplay;
    self->_rotorDisplay = v4;

    -[VOTUIRotorDisplay setTranslatesAutoresizingMaskIntoConstraints:]( self->_rotorDisplay,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIRotorViewController view](self, "view"));
    [v6 addSubview:self->_rotorDisplay];
  }

  -[VOTUIRotorViewController setupConstraintsIfNecessary](self, "setupConstraintsIfNecessary");
  v7 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"count"]);
  v8 = v7;
  if (v7) {
    -[VOTUIRotorDisplay setRotorItemCount:](self->_rotorDisplay, "setRotorItemCount:", [v7 integerValue]);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"increment"]);
  v10 = v9;
  if (v9) {
    -[VOTUIRotorDisplay updateRotorPosition:]( self->_rotorDisplay,  "updateRotorPosition:",  [v9 BOOLValue]);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"title"]);
  if (v11) {
    -[VOTUIRotorDisplay setTitle:](self->_rotorDisplay, "setTitle:", v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"show"]);
  v13 = v12;
  if (v12)
  {
    unsigned int v14 = [v12 BOOLValue];
    id v15 = self->_rotorDisplay;
    if (v14) {
      -[VOTUIRotorDisplay show](v15, "show");
    }
    else {
      -[VOTUIRotorDisplay hide](v15, "hide");
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setRotorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIRotorViewController view](self, "view"));
  [v4 setHidden:v3];
}

- (void).cxx_destruct
{
}

@end