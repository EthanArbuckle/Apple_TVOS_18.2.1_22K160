@interface TVHSimpleLockupLayout
- (BOOL)isEqual:(id)a3;
- (CGSize)contentViewSize;
- (CGSize)lockupSize;
- (NSString)description;
- (TVHSimpleLockupFooterViewLayout)footerViewLayout;
- (TVHSimpleLockupLayout)init;
- (double)contentViewToFooterViewSpacing;
- (double)footerViewHeight;
- (unint64_t)hash;
- (void)setContentViewSize:(CGSize)a3;
- (void)setContentViewToFooterViewSpacing:(double)a3;
- (void)setFooterViewLayout:(id)a3;
@end

@implementation TVHSimpleLockupLayout

- (TVHSimpleLockupLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHSimpleLockupLayout;
  result = -[TVHSimpleLockupLayout init](&v3, "init");
  if (result) {
    result->_contentViewToFooterViewSpacing = 4.0;
  }
  return result;
}

- (double)footerViewHeight
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupLayout footerViewLayout](self, "footerViewLayout"));
  [v2 footerViewHeight];
  double v4 = v3;

  return v4;
}

- (CGSize)lockupSize
{
  double v4 = v3;
  double v6 = v5;
  -[TVHSimpleLockupLayout footerViewHeight](self, "footerViewHeight");
  double v8 = v7;
  if (BSFloatGreaterThanFloat(v7, 0.0))
  {
    -[TVHSimpleLockupLayout contentViewToFooterViewSpacing](self, "contentViewToFooterViewSpacing");
    double v6 = v8 + v6 + v9;
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
  -[TVHSimpleLockupLayout contentViewSize](self, "contentViewSize");
  id v4 = objc_msgSend(v3, "appendCGSize:");
  -[TVHSimpleLockupLayout contentViewToFooterViewSpacing](self, "contentViewToFooterViewSpacing");
  id v5 = objc_msgSend(v3, "appendCGFloat:");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupLayout footerViewLayout](self, "footerViewLayout"));
  id v7 = [v3 appendObject:v6];

  id v8 = [v3 hash];
  return (unint64_t)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___TVHSimpleLockupLayout));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[TVHSimpleLockupLayout contentViewSize](self, "contentViewSize");
  double v8 = v7;
  double v10 = v9;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10003F638;
  v25[3] = &unk_1000FDEF0;
  id v11 = v4;
  id v26 = v11;
  id v12 = objc_msgSend(v6, "appendCGSize:counterpart:", v25, v8, v10);
  -[TVHSimpleLockupLayout contentViewToFooterViewSpacing](self, "contentViewToFooterViewSpacing");
  double v14 = v13;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10003F640;
  v23[3] = &unk_1000FD7F0;
  id v15 = v11;
  id v24 = v15;
  id v16 = [v6 appendCGFloat:v23 counterpart:v14];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupLayout footerViewLayout](self, "footerViewLayout"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10003F648;
  v21[3] = &unk_1000FD6E8;
  id v22 = v15;
  id v18 = v15;
  id v19 = [v6 appendObject:v17 counterpart:v21];

  LOBYTE(v17) = [v6 isEqual];
  return (char)v17;
}

- (NSString)description
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  -[TVHSimpleLockupLayout contentViewSize](self, "contentViewSize");
  id v4 = objc_msgSend(v3, "appendSize:withName:", @"contentViewSize");
  -[TVHSimpleLockupLayout contentViewToFooterViewSpacing](self, "contentViewToFooterViewSpacing");
  id v5 = objc_msgSend(v3, "appendFloat:withName:", @"contentViewToFooterViewSpacing");
  -[TVHSimpleLockupLayout footerViewHeight](self, "footerViewHeight");
  id v6 = objc_msgSend(v3, "appendFloat:withName:", @"footerViewHeight");
  -[TVHSimpleLockupLayout lockupSize](self, "lockupSize");
  id v7 = objc_msgSend(v3, "appendSize:withName:", @"lockupSize");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupLayout footerViewLayout](self, "footerViewLayout"));
  id v9 = [v3 appendObject:v8 withName:@"footerViewLayout"];

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v10;
}

- (CGSize)contentViewSize
{
  double width = self->_contentViewSize.width;
  double height = self->_contentViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentViewSize:(CGSize)a3
{
  self->_contentViewSize = a3;
}

- (double)contentViewToFooterViewSpacing
{
  return self->_contentViewToFooterViewSpacing;
}

- (void)setContentViewToFooterViewSpacing:(double)a3
{
  self->_contentViewToFooterViewSpacing = a3;
}

- (TVHSimpleLockupFooterViewLayout)footerViewLayout
{
  return self->_footerViewLayout;
}

- (void)setFooterViewLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end