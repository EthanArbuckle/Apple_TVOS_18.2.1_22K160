@interface UIResponder
- (BOOL)_containsInertiaSelectionChanges;
- (BOOL)_shouldChangeToResponder:(id)a3;
- (double)firstResponderPotential;
- (double)highlightProgress;
- (double)selectionTrackerAnimationDuration;
- (void)setFirstResponderPotential:(double)a3;
- (void)setHighlightProgress:(double)a3;
- (void)setSelectionTrackerAnimationDuration:(double)a3;
@end

@implementation UIResponder

- (double)highlightProgress
{
  return COERCE_DOUBLE(objc_getAssociatedObject(self, "TVHighlightProgress"));
}

- (void)setHighlightProgress:(double)a3
{
}

- (double)firstResponderPotential
{
  return COERCE_DOUBLE(objc_getAssociatedObject(self, "TVFirstResponderPotential"));
}

- (void)setFirstResponderPotential:(double)a3
{
}

- (BOOL)_shouldChangeToResponder:(id)a3
{
  return 1;
}

- (double)selectionTrackerAnimationDuration
{
  id AssociatedObject = objc_getAssociatedObject(self, "TVFirstResponderSelectionAnimationDuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }

  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)setSelectionTrackerAnimationDuration:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  objc_setAssociatedObject(self, "TVFirstResponderSelectionAnimationDuration", v4, (void *)0x301);
}

- (BOOL)_containsInertiaSelectionChanges
{
  return 0;
}

@end