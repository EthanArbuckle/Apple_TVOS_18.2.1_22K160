@interface TVHButtonLockupLayout
- (BOOL)isEqual:(id)a3;
- (CGSize)buttonSize;
- (CGSize)contentViewSize;
- (NSString)description;
- (TVHButtonLockupLayout)init;
- (TVHButtonLockupLayoutDelegate)delegate;
- (double)buttonToTitleLabelSpacing;
- (double)contentViewToFooterViewSpacing;
- (double)footerViewHeight;
- (double)labelHeight;
- (id)_typeStringFromType:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setButtonSize:(CGSize)a3;
- (void)setButtonToTitleLabelSpacing:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TVHButtonLockupLayout

- (TVHButtonLockupLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHButtonLockupLayout;
  result = -[TVHButtonLockupLayout init](&v3, "init");
  if (result)
  {
    result->_buttonSize = (CGSize)xmmword_1000C3550;
    result->_type = 1LL;
    result->_buttonToTitleLabelSpacing = -2.0;
  }

  return result;
}

- (double)labelHeight
{
  unint64_t v3 = -[TVHButtonLockupLayout type](self, "type");
  double result = 0.0;
  if (v3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockupLayout delegate](self, "delegate", 0.0));
    [v5 heightForTitleLabelForButtonLockupLayout:self];
    double v7 = v6;

    int v8 = BSFloatLessThanOrEqualToFloat(v7, 42.0);
    double result = 72.0;
    if (v8) {
      return 42.0;
    }
  }

  return result;
}

- (double)footerViewHeight
{
  return 0.0;
}

- (double)contentViewToFooterViewSpacing
{
  return 0.0;
}

- (CGSize)contentViewSize
{
  double v4 = v3;
  double v6 = v5;
  if ((id)-[TVHButtonLockupLayout type](self, "type") == (id)1)
  {
    -[TVHButtonLockupLayout buttonToTitleLabelSpacing](self, "buttonToTitleLabelSpacing");
    double v8 = v6 + v7;
    -[TVHButtonLockupLayout labelHeight](self, "labelHeight");
    double v6 = v8 + v9;
  }

  double v10 = v4;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (unint64_t)hash
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = objc_msgSend(v3, "appendUnsignedInteger:", -[TVHButtonLockupLayout type](self, "type"));
  -[TVHButtonLockupLayout buttonSize](self, "buttonSize");
  id v5 = objc_msgSend(v3, "appendCGSize:");
  -[TVHButtonLockupLayout buttonToTitleLabelSpacing](self, "buttonToTitleLabelSpacing");
  id v6 = objc_msgSend(v3, "appendCGFloat:");
  id v7 = [v3 hash];

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___TVHButtonLockupLayout));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unint64_t v7 = -[TVHButtonLockupLayout type](self, "type");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100067108;
  v25[3] = &unk_1000FD6C0;
  id v8 = v4;
  id v26 = v8;
  id v9 = [v6 appendUnsignedInteger:v7 counterpart:v25];
  -[TVHButtonLockupLayout buttonSize](self, "buttonSize");
  double v11 = v10;
  double v13 = v12;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100067110;
  v23[3] = &unk_1000FDEF0;
  id v14 = v8;
  id v24 = v14;
  id v15 = objc_msgSend(v6, "appendCGSize:counterpart:", v23, v11, v13);
  -[TVHButtonLockupLayout buttonToTitleLabelSpacing](self, "buttonToTitleLabelSpacing");
  double v17 = v16;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100067118;
  v21[3] = &unk_1000FD7F0;
  id v22 = v14;
  id v18 = v14;
  id v19 = [v6 appendCGFloat:v21 counterpart:v17];
  LOBYTE(v14) = [v6 isEqual];

  return (char)v14;
}

- (NSString)description
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = objc_msgSend((id)objc_opt_class(self), "_typeStringFromType:", -[TVHButtonLockupLayout type](self, "type"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:@"type"];

  -[TVHButtonLockupLayout buttonSize](self, "buttonSize");
  id v6 = objc_msgSend(v3, "appendSize:withName:", @"buttonSize");
  -[TVHButtonLockupLayout buttonToTitleLabelSpacing](self, "buttonToTitleLabelSpacing");
  id v7 = objc_msgSend(v3, "appendFloat:withName:", @"buttonToTitleLabelSpacing");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v8;
}

- (id)_typeStringFromType:(unint64_t)a3
{
  double v3 = @"Titled";
  if (a3 != 1) {
    double v3 = 0LL;
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Default";
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGSize)buttonSize
{
  double width = self->_buttonSize.width;
  double height = self->_buttonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setButtonSize:(CGSize)a3
{
  self->_buttonSize = a3;
}

- (double)buttonToTitleLabelSpacing
{
  return self->_buttonToTitleLabelSpacing;
}

- (void)setButtonToTitleLabelSpacing:(double)a3
{
  self->_buttonToTitleLabelSpacing = a3;
}

- (TVHButtonLockupLayoutDelegate)delegate
{
  return (TVHButtonLockupLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end