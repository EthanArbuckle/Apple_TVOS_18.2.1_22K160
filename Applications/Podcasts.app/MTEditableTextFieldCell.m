@interface MTEditableTextFieldCell
+ (id)textFont;
- (BOOL)canBecomeFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UITextField)textField;
- (UITextFieldDelegate)delegate;
- (id)textChanged;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setTextChanged:(id)a3;
- (void)setTextField:(id)a3;
- (void)setupCell;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateFonts;
@end

@implementation MTEditableTextFieldCell

+ (id)textFont
{
  return +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody);
}

- (void)updateFonts
{
  id v3 = [(id)objc_opt_class(self) textFont];
  id v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEditableTextFieldCell textField](self, "textField"));
  [v4 setFont:v5];
}

- (void)setupCell
{
  id v3 = objc_alloc(&OBJC_CLASS___UITextField);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[UITextField initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  textField = self->_textField;
  self->_textField = v7;

  -[UITextField setContentVerticalAlignment:](self->_textField, "setContentVerticalAlignment:", 0LL);
  -[UITextField setClearButtonMode:](self->_textField, "setClearButtonMode:", 3LL);
  v9 = self->_textField;
  v10 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[UITextField setLeftView:](v9, "setLeftView:", v10);

  -[UITextField setLeftViewMode:](self->_textField, "setLeftViewMode:", 3LL);
  v11 = self->_textField;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.556862745,  0.556862745,  0.576470588,  1.0));
  -[UITextField setTextColor:](v11, "setTextColor:", v12);

  -[UITextField setDelegate:](self->_textField, "setDelegate:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEditableTextFieldCell contentView](self, "contentView"));
  [v13 addSubview:self->_textField];

  -[MTEditableTextFieldCell updateFonts](self, "updateFonts");
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MTEditableTextFieldCell;
  -[MTTableViewCell layoutSubviews](&v15, "layoutSubviews");
  -[MTEditableTextFieldCell updateFonts](self, "updateFonts");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEditableTextFieldCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  -[MTEditableTextFieldCell layoutMargins](self, "layoutMargins");
  double v11 = v10;
  -[MTEditableTextFieldCell layoutMargins](self, "layoutMargins");
  double v13 = v12;
  -[MTEditableTextFieldCell layoutMargins](self, "layoutMargins");
  -[UITextField setFrame:](self->_textField, "setFrame:", v11, v5, v7 - (v13 + v14), v9);
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v5 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v9 = [v8 textFieldShouldBeginEditing:v5];
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 textFieldDidBeginEditing:v8];
  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v5 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v9 = [v8 textFieldShouldEndEditing:v5];
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v10 = a3;
  id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[MTEditableTextFieldCell textChanged](self, "textChanged"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v10 text]);
  ((void (**)(void, void *))v5)[2](v5, v6);

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 textFieldDidEndEditing:v10];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    id v14 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v15 = objc_msgSend( v14,  "textField:shouldChangeCharactersInRange:replacementString:",  v10,  location,  length,  v11);
  }

  else
  {
    unsigned __int8 v15 = 1;
  }

  return v15;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v5 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v9 = [v8 textFieldShouldClear:v5];
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v5 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v9 = [v8 textFieldShouldReturn:v5];
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (id)textChanged
{
  return self->_textChanged;
}

- (void)setTextChanged:(id)a3
{
}

- (UITextFieldDelegate)delegate
{
  return (UITextFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end