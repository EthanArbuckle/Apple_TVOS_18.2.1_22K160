@interface PBTVMainWorkspaceGeometry
- (CGRect)bounds;
- (CGRect)fullDisplayBounds;
- (NSString)debugDescription;
- (NSString)description;
- (PBTVMainWorkspaceGeometry)init;
- (UIEdgeInsets)safeAreaInsets;
- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation PBTVMainWorkspaceGeometry

- (PBTVMainWorkspaceGeometry)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBTVMainWorkspaceGeometry;
  v2 = -[PBTVMainWorkspaceGeometry init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v3 overscanCompensationInsets];
    v2->_safeAreaInsets.top = v4;
    v2->_safeAreaInsets.left = v5;
    v2->_safeAreaInsets.bottom = v6;
    v2->_safeAreaInsets.right = v7;
  }

  return v2;
}

- (CGRect)bounds
{
  if (sub_1001C9E00())
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayBoundsManager sharedInstance](&OBJC_CLASS___PBDisplayBoundsManager, "sharedInstance"));
    v3 = v2;
    if (v2)
    {
      [v2 currentDisplayBounds];
      double v4 = v13;
      double v5 = v12;
      uint64_t v6 = v15;
      uint64_t v7 = v14;
    }

    else
    {
      *(double *)&uint64_t v6 = 0.0;
      *(double *)&uint64_t v7 = 0.0;
      double v4 = 0.0;
      double v5 = 0.0;
    }
  }

  else
  {
    double v5 = 0.0;
    double v4 = 0.0;
    *(double *)&uint64_t v7 = 1920.0;
    *(double *)&uint64_t v6 = 1080.0;
  }

  double v8 = v5;
  double v9 = v4;
  double v10 = *(double *)&v7;
  double v11 = *(double *)&v6;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)fullDisplayBounds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayBoundsManager sharedInstance](&OBJC_CLASS___PBDisplayBoundsManager, "sharedInstance"));
  v3 = v2;
  if (v2)
  {
    [v2 currentDisplayBounds];
    double v4 = v13;
    double v5 = v12;
    double v6 = v15;
    double v7 = v14;
  }

  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
    double v4 = 0.0;
    double v5 = 0.0;
  }

  double v8 = v5;
  double v9 = v4;
  double v10 = v7;
  double v11 = v6;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsForApplication:(id)a3
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBTVMainWorkspaceGeometry succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBTVMainWorkspaceGeometry descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBTVMainWorkspaceGeometry succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  -[PBTVMainWorkspaceGeometry bounds](self, "bounds");
  id v4 = objc_msgSend(v3, "appendRect:withName:", @"bounds");
  if (sub_1001C9E00())
  {
    -[PBTVMainWorkspaceGeometry fullDisplayBounds](self, "fullDisplayBounds");
    id v5 = objc_msgSend(v3, "appendRect:withName:", @"fullDisplayBounds");
  }

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBTVMainWorkspaceGeometry descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBTVMainWorkspaceGeometry succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];

  return v5;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end