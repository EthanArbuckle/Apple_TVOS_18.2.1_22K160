@interface PBOverlayLayoutSuggestion
+ (PBOverlayLayoutSuggestion)suggestionWithOffset:(CGVector)a3;
+ (PBOverlayLayoutSuggestion)suggestionWithZeroOffset;
- (BOOL)isEqual:(id)a3;
- (CGRect)rectByOffsettingRect:(CGRect)a3;
- (CGVector)offset;
- (NSString)description;
- (PBOverlayLayoutSuggestion)initWithOffset:(CGVector)a3;
- (double)magnitude;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation PBOverlayLayoutSuggestion

+ (PBOverlayLayoutSuggestion)suggestionWithZeroOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009BCE8;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470858 != -1) {
    dispatch_once(&qword_100470858, block);
  }
  return (PBOverlayLayoutSuggestion *)(id)qword_100470850;
}

+ (PBOverlayLayoutSuggestion)suggestionWithOffset:(CGVector)a3
{
  double dy = a3.dy;
  double dx = a3.dx;
  else {
    id v6 = objc_msgSend(objc_alloc((Class)a1), "initWithOffset:", dx, dy);
  }
  return (PBOverlayLayoutSuggestion *)v6;
}

- (PBOverlayLayoutSuggestion)initWithOffset:(CGVector)a3
{
  double dy = a3.dy;
  double dx = a3.dx;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutSuggestion;
  result = -[PBOverlayLayoutSuggestion init](&v6, "init");
  if (result)
  {
    result->_offset.double dx = dx;
    result->_offset.double dy = dy;
    result->_magnitude = sqrt(dy * dy + dx * dx);
  }

  return result;
}

- (CGRect)rectByOffsettingRect:(CGRect)a3
{
  return CGRectOffset(a3, self->_offset.dx, self->_offset.dy);
}

- (int64_t)compare:(id)a3
{
  double magnitude = self->_magnitude;
  double v4 = *((double *)a3 + 1);
  if (magnitude >= v4) {
    int64_t v5 = 0LL;
  }
  else {
    int64_t v5 = -1LL;
  }
  if (magnitude > v4) {
    return 1LL;
  }
  else {
    return v5;
  }
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutSuggestion descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendCGFloat:self->_offset.dx];
  id v5 = [v3 appendCGFloat:self->_offset.dy];
  id v6 = [v3 hash];

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  self,  objc_opt_class(&OBJC_CLASS___PBOverlayLayoutSuggestion));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  double dx = self->_offset.dx;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10009BFC0;
  v19[3] = &unk_1003D2260;
  id v8 = v4;
  id v20 = v8;
  id v9 = [v6 appendCGFloat:v19 counterpart:dx];
  double dy = self->_offset.dy;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_10009BFD8;
  v17 = &unk_1003D2260;
  id v18 = v8;
  id v11 = v8;
  id v12 = [v6 appendCGFloat:&v14 counterpart:dy];
  LOBYTE(v8) = objc_msgSend(v6, "isEqual", v14, v15, v16, v17);

  return (char)v8;
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutSuggestion succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = NSStringFromCGVector(self->_offset);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutSuggestion descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutSuggestion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3));
  id v5 = [v4 appendFloat:0 withName:self->_magnitude];
  return v4;
}

- (CGVector)offset
{
  double dx = self->_offset.dx;
  double dy = self->_offset.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (double)magnitude
{
  return self->_magnitude;
}

@end