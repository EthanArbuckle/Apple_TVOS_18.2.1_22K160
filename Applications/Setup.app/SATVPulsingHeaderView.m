@interface SATVPulsingHeaderView
- (BOOL)opacityRunning;
- (BOOL)scaleRunning;
- (SATVPulsingAnimationDelegate)animationDelegate;
- (SATVPulsingHeaderView)initWithMode:(unint64_t)a3;
- (unint64_t)mode;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)pulseAtBeginTime:(double)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setOpacityRunning:(BOOL)a3;
- (void)setScaleRunning:(BOOL)a3;
@end

@implementation SATVPulsingHeaderView

- (SATVPulsingHeaderView)initWithMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVPulsingHeaderView;
  result = -[SATVHeaderView initWithFrame:]( &v5,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  if (result) {
    result->_mode = a3;
  }
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVPulsingHeaderView;
  -[SATVHeaderView layoutSubviews](&v7, "layoutSubviews");
  if (self->_mode == 1
    && !-[SATVPulsingHeaderView opacityRunning](self, "opacityRunning")
    && !-[SATVPulsingHeaderView scaleRunning](self, "scaleRunning"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPulsingHeaderView layer](self, "layer"));
    LODWORD(v4) = 0;
    [v3 setOpacity:v4];

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPulsingHeaderView layer](self, "layer"));
    CATransform3DMakeScale(&v6, 0.97, 0.97, 1.0);
    [v5 setTransform:&v6];
  }

- (void)pulseAtBeginTime:(double)a3
{
  if (!-[SATVPulsingHeaderView opacityRunning](self, "opacityRunning")
    && !-[SATVPulsingHeaderView scaleRunning](self, "scaleRunning"))
  {
    -[SATVPulsingHeaderView setOpacityRunning:](self, "setOpacityRunning:", 1LL);
    -[SATVPulsingHeaderView setScaleRunning:](self, "setScaleRunning:", 1LL);
    id v5 = sub_100035040(self, a3);
    CATransform3D v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = sub_1000351A4(self, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPulsingHeaderView layer](self, "layer"));
    [v9 addAnimation:v6 forKey:@"opacity"];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPulsingHeaderView layer](self, "layer"));
    [v10 addAnimation:v8 forKey:@"scale"];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPulsingHeaderView layer](self, "layer"));
    unint64_t v12 = -[SATVPulsingHeaderView mode](self, "mode");
    LODWORD(v13) = 0;
    if (v12 == 1) {
      *(float *)&double v13 = 1.0;
    }
    [v11 setOpacity:v13];

    if (-[SATVPulsingHeaderView mode](self, "mode")) {
      double v14 = 1.0;
    }
    else {
      double v14 = 0.97;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPulsingHeaderView layer](self, "layer"));
    CATransform3DMakeScale(&v16, v14, v14, v14);
    [v15 setTransform:&v16];
  }

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    v15 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"id"]);
    unsigned int v9 = [v8 isEqualToString:@"opacity"];

    if (v9)
    {
      -[SATVPulsingHeaderView setOpacityRunning:](self, "setOpacityRunning:", 0LL);
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForKey:@"id"]);
      unsigned int v11 = [v10 isEqualToString:@"scale"];

      if (v11) {
        -[SATVPulsingHeaderView setScaleRunning:](self, "setScaleRunning:", 0LL);
      }
    }

    unsigned __int8 v12 = -[SATVPulsingHeaderView scaleRunning](self, "scaleRunning");
    id v7 = v15;
    if ((v12 & 1) == 0)
    {
      unsigned __int8 v13 = -[SATVPulsingHeaderView opacityRunning](self, "opacityRunning");
      id v7 = v15;
      if ((v13 & 1) == 0)
      {
        double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPulsingHeaderView animationDelegate](self, "animationDelegate"));
        [v14 didFinishAnimationPulsingAnimation:self];

        id v7 = v15;
      }
    }
  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (SATVPulsingAnimationDelegate)animationDelegate
{
  return (SATVPulsingAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void)setAnimationDelegate:(id)a3
{
}

- (BOOL)opacityRunning
{
  return self->_opacityRunning;
}

- (void)setOpacityRunning:(BOOL)a3
{
  self->_opacityRunning = a3;
}

- (BOOL)scaleRunning
{
  return self->_scaleRunning;
}

- (void)setScaleRunning:(BOOL)a3
{
  self->_scaleRunning = a3;
}

- (void).cxx_destruct
{
}

@end