@interface MTTVExpandingTextView
- (BOOL)canBecomeFocused;
- (BOOL)isAlwaysFocusable;
- (void)setAlwaysFocusable:(BOOL)a3;
@end

@implementation MTTVExpandingTextView

- (void)setAlwaysFocusable:(BOOL)a3
{
  if (self->_alwaysFocusable != a3)
  {
    self->_alwaysFocusable = a3;
    -[MTTVExpandingTextView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (BOOL)canBecomeFocused
{
  if (-[MTTVExpandingTextView isAlwaysFocusable](self, "isAlwaysFocusable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTExpandingTextView descriptionText](self, "descriptionText"));
    id v4 = [v3 length];

    if (v4) {
      return 1;
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVExpandingTextView;
  return -[TVMTExpandingTextView canBecomeFocused](&v6, "canBecomeFocused");
}

- (BOOL)isAlwaysFocusable
{
  return self->_alwaysFocusable;
}

@end