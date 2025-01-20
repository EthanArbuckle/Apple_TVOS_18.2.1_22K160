@interface RPBroadcastActivityExtensionFocusContainerView
- (BOOL)canBecomeFocused;
- (UIView)focusView;
- (id)preferredFocusEnvironments;
- (void)setFocusView:(id)a3;
@end

@implementation RPBroadcastActivityExtensionFocusContainerView

- (BOOL)canBecomeFocused
{
  return -[UIView canBecomeFocused](self->_focusView, "canBecomeFocused");
}

- (id)preferredFocusEnvironments
{
  if (self->_focusView)
  {
    focusView = self->_focusView;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &focusView, 1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (UIView)focusView
{
  return self->_focusView;
}

- (void)setFocusView:(id)a3
{
  self->_focusView = (UIView *)a3;
}

@end