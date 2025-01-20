@interface MTTVTextCell
- (MTTVTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)hiddenTextField;
- (id)textChangedBlock;
- (void)setHiddenTextField:(id)a3;
- (void)setTextChangedBlock:(id)a3;
- (void)showEditTitleUI;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation MTTVTextCell

- (MTTVTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVTextCell;
  v4 = -[MTTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = -[UITextField initWithFrame:](objc_alloc(&OBJC_CLASS___UITextField), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
    hiddenTextField = v4->_hiddenTextField;
    v4->_hiddenTextField = v5;

    -[UITextField setHidden:](v4->_hiddenTextField, "setHidden:", 1LL);
    -[UITextField setDelegate:](v4->_hiddenTextField, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTextCell contentView](v4, "contentView"));
    [v7 addSubview:v4->_hiddenTextField];
  }

  return v4;
}

- (void)showEditTitleUI
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTextCell textLabel](self, "textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTextCell hiddenTextField](self, "hiddenTextField"));
  [v5 setPlaceholder:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTextCell detailTextLabel](self, "detailTextLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 text]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTextCell hiddenTextField](self, "hiddenTextField"));
  [v8 setText:v7];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MTTVTextCell hiddenTextField](self, "hiddenTextField"));
  [v9 becomeFirstResponder];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v9 text]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTextCell detailTextLabel](self, "detailTextLabel"));
  [v5 setText:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTextCell textChangedBlock](self, "textChangedBlock"));
  if (v6)
  {
    v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[MTTVTextCell textChangedBlock](self, "textChangedBlock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v9 text]);
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
}

- (id)textChangedBlock
{
  return self->_textChangedBlock;
}

- (void)setTextChangedBlock:(id)a3
{
}

- (UITextField)hiddenTextField
{
  return self->_hiddenTextField;
}

- (void)setHiddenTextField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end