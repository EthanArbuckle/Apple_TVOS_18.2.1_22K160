@interface _PBAppSwitcherCollectionView
- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4;
- (BOOL)_isFocusDirectionFlippedHorizontally;
- (CGPoint)lastContentOffset;
- (void)_updateForReducedMotionPeek:(double)a3;
- (void)_updateLastContentOffset;
@end

@implementation _PBAppSwitcherCollectionView

- (BOOL)_isFocusDirectionFlippedHorizontally
{
  return 1;
}

- (void)_updateLastContentOffset
{
  p_lastContentOffset = &self->_lastContentOffset;
  -[_PBAppSwitcherCollectionView contentOffset](self, "contentOffset");
  p_lastContentOffset->x = v3;
  p_lastContentOffset->y = v4;
}

- (void)_updateForReducedMotionPeek:(double)a3
{
  double v4 = a3 * -0.2;
  -[_PBAppSwitcherCollectionView lastContentOffset](self, "lastContentOffset");
  -[_PBAppSwitcherCollectionView setContentOffset:](self, "setContentOffset:", v5 + v4);
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", @"focusDirectionX", a4));
  [v5 doubleValue];
  double v7 = v6;

  if (v7 <= 0.2)
  {
    if (v7 + 0.2 <= 0.0) {
      double v8 = (v7 + 0.2) * 105.0;
    }
    else {
      double v8 = 0.0;
    }
  }

  else if (v7 + -0.2 <= 0.0)
  {
    double v8 = 0.0;
  }

  else
  {
    double v8 = (v7 + -0.2) * 145.0;
  }

  -[_PBAppSwitcherCollectionView lastContentOffset](self, "lastContentOffset");
  -[_PBAppSwitcherCollectionView setContentOffset:](self, "setContentOffset:", v8 + v9);
  return 1;
}

- (CGPoint)lastContentOffset
{
  double x = self->_lastContentOffset.x;
  double y = self->_lastContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end