@interface HNDView
- (BOOL)isActive;
- (BOOL)requiresRealUpEvent;
- (HNDView)initWithFrame:(CGRect)a3;
- (HNDViewDelegateControl)controlDelegate;
- (double)inactiveAlpha;
- (id)description;
- (void)handleRealCancelEvent:(CGPoint)a3;
- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4;
- (void)setControlDelegate:(id)a3;
- (void)setInactiveAlpha:(double)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsActive:(BOOL)a3 withDuration:(double)a4;
- (void)setIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5;
- (void)setIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5 inactiveAlpha:(double)a6;
- (void)setRequiresRealUpEvent:(BOOL)a3;
@end

@implementation HNDView

- (HNDView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HNDView;
  v3 = -[HNDView initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[HNDView setInactiveAlpha:](v3, "setInactiveAlpha:", 0.2);
  return v3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setIsActive:(BOOL)a3
{
}

- (void)setIsActive:(BOOL)a3 withDuration:(double)a4
{
}

- (void)setIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5
{
  BOOL v7 = a3;
  -[HNDView inactiveAlpha](self, "inactiveAlpha");
  -[HNDView setIsActive:withDuration:options:inactiveAlpha:]( self,  "setIsActive:withDuration:options:inactiveAlpha:",  v7,  a5,  a4,  v9);
}

- (void)setIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5 inactiveAlpha:(double)a6
{
  self->_active = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000410D4;
  v6[3] = &unk_100121F80;
  v6[4] = self;
  BOOL v7 = a3;
  *(double *)&v6[5] = a6;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  a5,  v6,  0LL,  a4,  0.0);
}

- (void)handleRealCancelEvent:(CGPoint)a3
{
}

- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4
{
  p_controlDelegate = &self->_controlDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlDelegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_controlDelegate);
    [v7 viewPressedUp:self];
  }

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___HNDView;
  id v3 = -[HNDView description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDView accessibilityIdentifier](self, "accessibilityIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (HNDViewDelegateControl)controlDelegate
{
  return (HNDViewDelegateControl *)objc_loadWeakRetained((id *)&self->_controlDelegate);
}

- (void)setControlDelegate:(id)a3
{
}

- (BOOL)requiresRealUpEvent
{
  return self->_requiresRealUpEvent;
}

- (void)setRequiresRealUpEvent:(BOOL)a3
{
  self->_requiresRealUpEvent = a3;
}

- (double)inactiveAlpha
{
  return self->_inactiveAlpha;
}

- (void)setInactiveAlpha:(double)a3
{
  self->_inactiveAlpha = a3;
}

- (void).cxx_destruct
{
}

@end