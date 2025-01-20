@interface TVHSimpleLockupFooterViewLayout
- (BOOL)isEqual:(id)a3;
- (TVHSimpleLockupFooterViewLayout)init;
- (double)footerViewHeight;
- (double)labelHeight;
- (double)labelSpacing;
- (id)_typeStringFromType:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setLabelHeight:(double)a3;
- (void)setLabelSpacing:(double)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TVHSimpleLockupFooterViewLayout

- (TVHSimpleLockupFooterViewLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHSimpleLockupFooterViewLayout;
  result = -[TVHSimpleLockupFooterViewLayout init](&v3, "init");
  if (result)
  {
    result->_type = 0LL;
    *(_OWORD *)&result->_labelHeight = xmmword_1000C3780;
  }

  return result;
}

- (double)footerViewHeight
{
  double v4 = v3;
  double v5 = v3 + 0.0;
  if ((id)-[TVHSimpleLockupFooterViewLayout type](self, "type") == (id)1)
  {
    -[TVHSimpleLockupFooterViewLayout labelSpacing](self, "labelSpacing");
    return v4 + v5 + v6;
  }

  return v5;
}

- (unint64_t)hash
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = objc_msgSend(v3, "appendUnsignedInteger:", -[TVHSimpleLockupFooterViewLayout type](self, "type"));
  -[TVHSimpleLockupFooterViewLayout labelHeight](self, "labelHeight");
  id v5 = objc_msgSend(v3, "appendCGFloat:");
  -[TVHSimpleLockupFooterViewLayout labelSpacing](self, "labelSpacing");
  id v6 = objc_msgSend(v3, "appendCGFloat:");
  id v7 = [v3 hash];

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  *(void *)&double v5 = objc_opt_class(&OBJC_CLASS___TVHSimpleLockupFooterViewLayout).n128_u64[0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  v6,  v5));
  unint64_t v8 = -[TVHSimpleLockupFooterViewLayout type](self, "type");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100097128;
  v24[3] = &unk_1000FD6C0;
  id v9 = v4;
  id v25 = v9;
  id v10 = [v7 appendUnsignedInteger:v8 counterpart:v24];
  -[TVHSimpleLockupFooterViewLayout labelHeight](self, "labelHeight");
  double v12 = v11;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100097130;
  v22[3] = &unk_1000FD7F0;
  id v13 = v9;
  id v23 = v13;
  id v14 = [v7 appendCGFloat:v22 counterpart:v12];
  -[TVHSimpleLockupFooterViewLayout labelSpacing](self, "labelSpacing");
  double v16 = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100097138;
  v20[3] = &unk_1000FD7F0;
  id v21 = v13;
  id v17 = v13;
  id v18 = [v7 appendCGFloat:v20 counterpart:v16];
  LOBYTE(v13) = [v7 isEqual];

  return (char)v13;
}

- (id)description
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  *(void *)&double v4 = objc_opt_class(self).n128_u64[0];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_typeStringFromType:", -[TVHSimpleLockupFooterViewLayout type](self, "type", v4)));
  [v3 appendString:v6 withName:@"type"];

  -[TVHSimpleLockupFooterViewLayout labelHeight](self, "labelHeight");
  id v7 = objc_msgSend(v3, "appendFloat:withName:", @"labelHeight");
  -[TVHSimpleLockupFooterViewLayout labelSpacing](self, "labelSpacing");
  id v8 = objc_msgSend(v3, "appendFloat:withName:", @"labelSpacing");
  -[TVHSimpleLockupFooterViewLayout footerViewHeight](self, "footerViewHeight");
  id v9 = objc_msgSend(v3, "appendFloat:withName:", @"footerViewHeight");
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v10;
}

- (id)_typeStringFromType:(unint64_t)a3
{
  double v3 = @"TitleAndSubtitle";
  if (a3 != 1) {
    double v3 = 0LL;
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Title";
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

- (double)labelHeight
{
  return self->_labelHeight;
}

- (void)setLabelHeight:(double)a3
{
  self->_labelHeight = a3;
}

- (double)labelSpacing
{
  return self->_labelSpacing;
}

- (void)setLabelSpacing:(double)a3
{
  self->_labelSpacing = a3;
}

@end