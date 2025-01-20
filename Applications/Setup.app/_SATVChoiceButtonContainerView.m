@interface _SATVChoiceButtonContainerView
- (UIButton)preferredButton;
- (id)preferredFocusEnvironments;
- (void)setPreferredButton:(id)a3;
@end

@implementation _SATVChoiceButtonContainerView

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[_SATVChoiceButtonContainerView preferredButton](self, "preferredButton"));
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (UIButton)preferredButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_preferredButton);
}

- (void)setPreferredButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end