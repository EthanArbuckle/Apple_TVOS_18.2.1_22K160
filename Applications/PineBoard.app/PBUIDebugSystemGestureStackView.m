@interface PBUIDebugSystemGestureStackView
- (PBUIDebugSystemGestureStackView)initWithFrame:(CGRect)a3;
- (UILabel)lastActivatedLabel;
- (UILabel)lastInvokedLabel;
- (void)setLastActivatedSystemGesture:(unint64_t)a3;
- (void)setLastInvokedSystemGesture:(unint64_t)a3;
- (void)setLastInvokedSystemGesture:(unint64_t)a3 deferringFrom:(unint64_t)a4;
@end

@implementation PBUIDebugSystemGestureStackView

- (PBUIDebugSystemGestureStackView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBUIDebugSystemGestureStackView;
  v3 = -[PBUIDebugSystemGestureStackView initWithFrame:]( &v11,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBUIDebugSystemGestureStackView setAxis:](v3, "setAxis:", 1LL);
    -[PBUIDebugSystemGestureStackView setAlignment:](v4, "setAlignment:", 1LL);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UILabel pb_debugLabel](&OBJC_CLASS___UILabel, "pb_debugLabel"));
    lastInvokedLabel = v4->_lastInvokedLabel;
    v4->_lastInvokedLabel = (UILabel *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[UILabel pb_debugLabel](&OBJC_CLASS___UILabel, "pb_debugLabel"));
    lastActivatedLabel = v4->_lastActivatedLabel;
    v4->_lastActivatedLabel = (UILabel *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
    -[UILabel setTextColor:](v4->_lastInvokedLabel, "setTextColor:", v9);
    -[UILabel setTextColor:](v4->_lastActivatedLabel, "setTextColor:", v9);
    -[PBUIDebugSystemGestureStackView addArrangedSubview:](v4, "addArrangedSubview:", v4->_lastInvokedLabel);
    -[PBUIDebugSystemGestureStackView addArrangedSubview:](v4, "addArrangedSubview:", v4->_lastActivatedLabel);
    -[PBUIDebugSystemGestureStackView setLastInvokedSystemGesture:](v4, "setLastInvokedSystemGesture:", 0LL);
    -[PBUIDebugSystemGestureStackView setLastActivatedSystemGesture:](v4, "setLastActivatedSystemGesture:", 0LL);
  }

  return v4;
}

- (void)setLastInvokedSystemGesture:(unint64_t)a3
{
}

- (void)setLastInvokedSystemGesture:(unint64_t)a3 deferringFrom:(unint64_t)a4
{
  if (self->_lastInvokedSystemGesture == a3)
  {
    unint64_t v7 = self->_invocationCount + 1;
  }

  else
  {
    self->_lastInvokedSystemGesture = a3;
    unint64_t v7 = 1LL;
  }

  self->_invocationCount = v7;
  lastInvokedLabel = self->_lastInvokedLabel;
  v9 = sub_10006BC6C(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"Invoked: %@",  v10));

  if (v7 >= 2) {
    objc_msgSend(v11, "appendFormat:", @":%lu", v7);
  }
  if (a4)
  {
    v12 = sub_10006BC6C(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v11 appendFormat:@" (Deferred from %@)", v13];
  }

  -[UILabel setText:](lastInvokedLabel, "setText:", v11);

  -[UILabel setHidden:](self->_lastInvokedLabel, "setHidden:", a3 == 0);
}

- (void)setLastActivatedSystemGesture:(unint64_t)a3
{
  BOOL v4 = a3 == 0;
  lastActivatedLabel = self->_lastActivatedLabel;
  v6 = sub_10006BC6C(a3);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Acquired: %@", v7));

  -[UILabel setText:](lastActivatedLabel, "setText:", v8);
  -[UILabel setHidden:](self->_lastActivatedLabel, "setHidden:", v4);
}

- (UILabel)lastInvokedLabel
{
  return self->_lastInvokedLabel;
}

- (UILabel)lastActivatedLabel
{
  return self->_lastActivatedLabel;
}

- (void).cxx_destruct
{
}

@end