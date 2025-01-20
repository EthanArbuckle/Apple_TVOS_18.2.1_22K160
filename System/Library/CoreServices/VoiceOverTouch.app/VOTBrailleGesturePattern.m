@interface VOTBrailleGesturePattern
- (VOTBrailleGestureHalfPattern)leftDots;
- (VOTBrailleGestureHalfPattern)rightDots;
- (VOTBrailleGesturePattern)initWithLeftDots:(id)a3 rightDots:(id)a4;
- (id)description;
- (void)setLeftDots:(id)a3;
- (void)setRightDots:(id)a3;
@end

@implementation VOTBrailleGesturePattern

- (VOTBrailleGesturePattern)initWithLeftDots:(id)a3 rightDots:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTBrailleGesturePattern;
  v8 = -[VOTBrailleGesturePattern init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[VOTBrailleGesturePattern setLeftDots:](v8, "setLeftDots:", v6);
    -[VOTBrailleGesturePattern setRightDots:](v9, "setRightDots:", v7);
  }

  return v9;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VOTBrailleGesturePattern;
  id v3 = -[VOTBrailleGesturePattern description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGesturePattern leftDots](self, "leftDots"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGesturePattern rightDots](self, "rightDots"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@" - left: %@, right: %@", v5, v6]);

  return v7;
}

- (VOTBrailleGestureHalfPattern)leftDots
{
  return self->_leftDots;
}

- (void)setLeftDots:(id)a3
{
}

- (VOTBrailleGestureHalfPattern)rightDots
{
  return self->_rightDots;
}

- (void)setRightDots:(id)a3
{
}

- (void).cxx_destruct
{
}

@end