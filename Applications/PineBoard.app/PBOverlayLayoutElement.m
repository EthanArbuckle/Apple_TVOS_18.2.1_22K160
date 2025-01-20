@interface PBOverlayLayoutElement
- (BOOL)isEqual:(id)a3;
- (BOOL)isFixed;
- (CGRect)frame;
- (CGRect)paddedFrame;
- (CGRect)repositionedPaddedFrame;
- (CGRect)unpaddedFrame;
- (CGSize)symmetricalMargin;
- (CGVector)offset;
- (CGVector)stickiness;
- (NSString)description;
- (PBOverlayLayoutController)controller;
- (PBOverlayLayoutElement)initWithElement:(id)a3;
- (PBOverlayLayoutElement)initWithElement:(id)a3 controller:(id)a4;
- (PBSOverlayLayoutElementHint)hint;
- (PBSOverlayLayoutElementIdentifier)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)layoutLevel;
- (unint64_t)hash;
- (void)setOffset:(CGVector)a3;
@end

@implementation PBOverlayLayoutElement

- (PBOverlayLayoutElement)initWithElement:(id)a3 controller:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutElement;
  v8 = -[PBOverlayLayoutElement init](&v22, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_controller, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v11 = (PBSOverlayLayoutElementIdentifier *)[v10 copy];
    identifier = v9->_identifier;
    v9->_identifier = v11;

    [v6 frame];
    v9->_frame.origin.x = v13;
    v9->_frame.origin.y = v14;
    v9->_frame.size.width = v15;
    v9->_frame.size.height = v16;
    [v6 symmetricalMargin];
    v9->_symmetricalMargin.width = v17;
    v9->_symmetricalMargin.height = v18;
    [v6 stickiness];
    v9->_stickiness.dx = v19;
    v9->_stickiness.dy = v20;
    v9->_layoutLevel = (int64_t)[v6 layoutLevel];
  }

  return v9;
}

- (PBOverlayLayoutElement)initWithElement:(id)a3
{
  v4 = (id *)a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutElement;
    v5 = -[PBOverlayLayoutElement init](&v12, "init");
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained(v4 + 2);
      objc_storeWeak((id *)&v5->_controller, WeakRetained);

      id v7 = (PBSOverlayLayoutElementIdentifier *)[v4[1] copy];
      identifier = v5->_identifier;
      v5->_identifier = v7;

      CGSize v9 = (CGSize)*((_OWORD *)v4 + 6);
      v5->_frame.origin = (CGPoint)*((_OWORD *)v4 + 5);
      v5->_frame.size = v9;
      v5->_symmetricalMargin = (CGSize)*((_OWORD *)v4 + 4);
      v5->_stickiness = (CGVector)*((_OWORD *)v4 + 2);
      v5->_layoutLevel = (int64_t)v4[3];
      v5->_offset = (CGVector)*((_OWORD *)v4 + 3);
    }

    self = v5;
    v10 = self;
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (CGRect)paddedFrame
{
  return CGRectInset(self->_frame, -self->_symmetricalMargin.width, -self->_symmetricalMargin.height);
}

- (CGRect)unpaddedFrame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)repositionedPaddedFrame
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  ddouble y = self->_stickiness.dy;
  if (!BSFloatGreaterThanOrEqualToFloat(self->_stickiness.dx, 1.0)
    || (BSFloatGreaterThanOrEqualToFloat(dy, 1.0) & 1) == 0)
  {
    double v4 = v4 + self->_offset.dx;
    double v6 = v6 + self->_offset.dy;
  }

  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)isFixed
{
  ddouble y = self->_stickiness.dy;
  int v3 = BSFloatGreaterThanOrEqualToFloat(self->_stickiness.dx, 1.0);
  if (v3) {
    LOBYTE(v3) = BSFloatGreaterThanOrEqualToFloat(dy, 1.0);
  }
  return v3;
}

- (PBSOverlayLayoutElementHint)hint
{
  return  -[PBSOverlayLayoutElementHint initWithIdentifier:offset:]( objc_alloc(&OBJC_CLASS___PBSOverlayLayoutElementHint),  "initWithIdentifier:offset:",  self->_identifier,  self->_offset.dx,  self->_offset.dy);
}

- (unint64_t)hash
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v5 = [v3 appendObject:WeakRetained];

  id v6 = [v3 appendObject:self->_identifier];
  id v7 =  objc_msgSend( v3,  "appendCGRect:",  self->_frame.origin.x,  self->_frame.origin.y,  self->_frame.size.width,  self->_frame.size.height);
  id v8 = objc_msgSend(v3, "appendCGSize:", self->_symmetricalMargin.width, self->_symmetricalMargin.height);
  id v9 = [v3 appendCGFloat:self->_stickiness.dx];
  id v10 = [v3 appendCGFloat:self->_stickiness.dy];
  id v11 = [v3 appendInteger:self->_layoutLevel];
  id v12 = [v3 appendCGFloat:self->_offset.dx];
  id v13 = [v3 appendCGFloat:self->_offset.dy];
  id v14 = [v3 hash];

  return (unint64_t)v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  self,  objc_opt_class(&OBJC_CLASS___PBOverlayLayoutElement));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100177194;
  v49[3] = &unk_1003D2130;
  id v8 = v4;
  id v50 = v8;
  id v9 = [v6 appendObject:WeakRetained counterpart:v49];

  identifier = self->_identifier;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1001771B4;
  v47[3] = &unk_1003D2130;
  id v11 = v8;
  id v48 = v11;
  id v12 = [v6 appendObject:identifier counterpart:v47];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1001771D4;
  v45[3] = &unk_1003D7958;
  id v13 = v11;
  id v46 = v13;
  id v14 =  objc_msgSend( v6,  "appendCGRect:counterpart:",  v45,  self->_frame.origin.x,  self->_frame.origin.y,  self->_frame.size.width,  self->_frame.size.height);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1001771EC;
  v43[3] = &unk_1003DA2E0;
  id v15 = v13;
  id v44 = v15;
  id v16 =  objc_msgSend( v6,  "appendCGSize:counterpart:",  v43,  self->_symmetricalMargin.width,  self->_symmetricalMargin.height);
  ddouble x = self->_stickiness.dx;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100177204;
  v41[3] = &unk_1003D2260;
  id v18 = v15;
  id v42 = v18;
  id v19 = [v6 appendCGFloat:v41 counterpart:dx];
  ddouble y = self->_stickiness.dy;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10017721C;
  v39[3] = &unk_1003D2260;
  id v21 = v18;
  id v40 = v21;
  id v22 = [v6 appendCGFloat:v39 counterpart:dy];
  int64_t layoutLevel = self->_layoutLevel;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100177238;
  v37[3] = &unk_1003D4148;
  id v24 = v21;
  id v38 = v24;
  id v25 = [v6 appendInteger:layoutLevel counterpart:v37];
  double v26 = self->_offset.dx;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100177250;
  v35[3] = &unk_1003D2260;
  id v27 = v24;
  id v36 = v27;
  id v28 = [v6 appendCGFloat:v35 counterpart:v26];
  double v29 = self->_offset.dy;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100177268;
  v33[3] = &unk_1003D2260;
  id v34 = v27;
  id v30 = v27;
  id v31 = [v6 appendCGFloat:v33 counterpart:v29];
  LOBYTE(v27) = [v6 isEqual];

  return (char)v27;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElement descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithElement:", self);
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElement succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  self->_identifier));
  [v3 appendString:v4 withName:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutElement descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100177464;
  v8[3] = &unk_1003CFEB8;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutElement succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  id v9 = v5;
  id v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  self->_identifier));
  id v5 = [v3 appendString:v4 withKey:@"identifier"];

  id v6 =  objc_msgSend( v3,  "appendRect:withKey:",  @"frame",  self->_frame.origin.x,  self->_frame.origin.y,  self->_frame.size.width,  self->_frame.size.height);
  id v7 =  objc_msgSend( v3,  "appendSize:withKey:",  @"symmetricalMargin",  self->_symmetricalMargin.width,  self->_symmetricalMargin.height);
  id v8 = objc_msgSend(v3, "appendVector:withKey:", @"stickiness", self->_stickiness.dx, self->_stickiness.dy);
  id v9 = objc_msgSend(v3, "appendVector:withKey:", @"offset", self->_offset.dx, self->_offset.dy);
  uint64_t v10 = sub_1001A3184(self->_layoutLevel);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v3 appendString:v11 withKey:@"layoutLevel"];

  return v3;
}

- (PBSOverlayLayoutElementIdentifier)identifier
{
  return self->_identifier;
}

- (PBOverlayLayoutController)controller
{
  return (PBOverlayLayoutController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (CGVector)stickiness
{
  ddouble x = self->_stickiness.dx;
  ddouble y = self->_stickiness.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (CGVector)offset
{
  ddouble x = self->_offset.dx;
  ddouble y = self->_offset.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (void)setOffset:(CGVector)a3
{
  self->_offset = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)symmetricalMargin
{
  double width = self->_symmetricalMargin.width;
  double height = self->_symmetricalMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end