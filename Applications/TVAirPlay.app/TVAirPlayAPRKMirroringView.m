@interface TVAirPlayAPRKMirroringView
- (BOOL)canBecomeFocused;
- (CALayer)HUDLayer;
- (CALayer)mirroringLayer;
- (TVAirPlayAPRKMirroringView)init;
- (TVAirPlayAPRKMirroringView)initWithCoder:(id)a3;
- (TVAirPlayAPRKMirroringView)initWithFrame:(CGRect)a3;
- (TVAirPlayAPRKMirroringView)initWithMirroringLayer:(id)a3 HUDLayer:(id)a4;
- (void)layoutSubviews;
- (void)setHUDLayer:(id)a3;
- (void)setMirroringLayer:(id)a3;
@end

@implementation TVAirPlayAPRKMirroringView

- (TVAirPlayAPRKMirroringView)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVAirPlayAPRKMirroringView)initWithFrame:(CGRect)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVAirPlayAPRKMirroringView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVAirPlayAPRKMirroringView)initWithMirroringLayer:(id)a3 HUDLayer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKMirroringView;
  v9 = -[TVAirPlayAPRKMirroringView initWithFrame:]( &v13,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[TVAirPlayAPRKMirroringView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKMirroringView layer](v9, "layer"));
    objc_storeStrong((id *)&v9->_mirroringLayer, a3);
    [v11 addSublayer:v7];
    if (v8)
    {
      objc_storeStrong((id *)&v9->_HUDLayer, a4);
      -[CALayer setZPosition:](v9->_HUDLayer, "setZPosition:", 999.0);
      [v11 addSublayer:v9->_HUDLayer];
    }
  }

  return v9;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKMirroringView;
  -[TVAirPlayAPRKMirroringView layoutSubviews](&v11, "layoutSubviews");
  -[TVAirPlayAPRKMirroringView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CALayer setFrame:](self->_mirroringLayer, "setFrame:");
  -[CALayer setFrame:](self->_HUDLayer, "setFrame:", v4, v6, v8, v10);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (CALayer)mirroringLayer
{
  return self->_mirroringLayer;
}

- (void)setMirroringLayer:(id)a3
{
}

- (CALayer)HUDLayer
{
  return self->_HUDLayer;
}

- (void)setHUDLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end