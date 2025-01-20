@interface TVTextEntryFooterView
- (CGRect)_buttonFrameWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)submitButton;
- (void)layoutSubviews;
- (void)setSubmitButton:(id)a3;
@end

@implementation TVTextEntryFooterView

- (void)setSubmitButton:(id)a3
{
  id v5 = a3;
  -[UIButton removeFromSuperview](self->_submitButton, "removeFromSuperview");
  objc_storeStrong((id *)&self->_submitButton, a3);
  if (self->_submitButton) {
    -[TVTextEntryFooterView addSubview:](self, "addSubview:");
  }
}

- (void)layoutSubviews
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGRect)_buttonFrameWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  -[UIButton sizeThatFits:](self->_submitButton, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v6 = v5;
  double v8 = v7;
  double v9 = floor((width - v5) * 0.5);
  double v10 = height - v7;
  result.size.double height = v8;
  result.size.double width = v6;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (UIButton)submitButton
{
  return self->_submitButton;
}

- (void).cxx_destruct
{
}

@end