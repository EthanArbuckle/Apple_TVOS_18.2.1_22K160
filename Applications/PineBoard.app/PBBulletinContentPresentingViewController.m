@interface PBBulletinContentPresentingViewController
- (BOOL)acceptsEventFocus;
- (id)preferredFocusEnvironments;
- (void)setAcceptsEventFocus:(BOOL)a3;
@end

@implementation PBBulletinContentPresentingViewController

- (id)preferredFocusEnvironments
{
  if (self->_acceptsEventFocus)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBContentPresentingContainmentViewController childViewController](self, "childViewController"));
    v5 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  }

  else
  {
    v3 = &__NSArray0__struct;
  }

  return v3;
}

- (BOOL)acceptsEventFocus
{
  return self->_acceptsEventFocus;
}

- (void)setAcceptsEventFocus:(BOOL)a3
{
  self->_acceptsEventFocus = a3;
}

@end