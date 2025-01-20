@interface TVHLockupShadow
- (BOOL)isEqual:(id)a3;
- (double)opacity;
- (double)radius;
- (double)verticalOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
- (void)setVerticalOffset:(double)a3;
@end

@implementation TVHLockupShadow

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendCGFloat:self->_opacity];
  id v5 = [v3 appendCGFloat:self->_radius];
  id v6 = [v3 appendCGFloat:self->_verticalOffset];
  id v7 = [v3 hash];

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___TVHLockupShadow));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  double opacity = self->_opacity;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100021908;
  v21[3] = &unk_1000FD7F0;
  id v8 = v4;
  id v22 = v8;
  id v9 = [v6 appendCGFloat:v21 counterpart:opacity];
  double radius = self->_radius;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100021910;
  v19[3] = &unk_1000FD7F0;
  id v11 = v8;
  id v20 = v11;
  id v12 = [v6 appendCGFloat:v19 counterpart:radius];
  double verticalOffset = self->_verticalOffset;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100021918;
  v17[3] = &unk_1000FD7F0;
  id v18 = v11;
  id v14 = v11;
  id v15 = [v6 appendCGFloat:v17 counterpart:verticalOffset];
  LOBYTE(v11) = [v6 isEqual];

  return (char)v11;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendFloat:@"opacity" withName:self->_opacity];
  id v5 = [v3 appendFloat:@"radius" withName:self->_radius];
  id v6 = [v3 appendFloat:@"verticalOffset" withName:self->_verticalOffset];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(&OBJC_CLASS___TVHLockupShadow);
  *((void *)result + 2) = *(void *)&self->_radius;
  *((void *)result + 1) = *(void *)&self->_opacity;
  *((void *)result + 3) = *(void *)&self->_verticalOffset;
  return result;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_double opacity = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_double radius = a3;
}

- (double)verticalOffset
{
  return self->_verticalOffset;
}

- (void)setVerticalOffset:(double)a3
{
  self->_double verticalOffset = a3;
}

@end