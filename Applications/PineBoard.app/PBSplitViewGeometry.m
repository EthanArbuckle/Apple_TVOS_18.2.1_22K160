@interface PBSplitViewGeometry
+ (BOOL)automaticallyNotifiesObserversOfCoordinateSpace;
+ (BOOL)automaticallyNotifiesObserversOfFrame;
+ (BOOL)automaticallyNotifiesObserversOfSafeAreaInsets;
+ (id)keyPathsForValuesAffectingFrame;
- (CGRect)bounds;
- (CGRect)frame;
- (CGRect)insetBoundsForEdges:(unint64_t)a3;
- (CGRect)insetFrameForEdges:(unint64_t)a3;
- (NSString)debugDescription;
- (NSString)description;
- (UICoordinateSpace)coordinateSpace;
- (UIEdgeInsets)safeAreaInsets;
- (UIEdgeInsets)safeAreaInsetsForEdges:(unint64_t)a3;
- (id)_init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addObserverForFrame:(id)a3;
- (void)addObserverForInsetFrame:(id)a3;
- (void)addObserverForSafeAreaInsets:(id)a3;
- (void)removeObserverForFrame:(id)a3;
- (void)removeObserverForInsetFrame:(id)a3;
- (void)removeObserverForSafeAreaInsets:(id)a3;
- (void)resetSafeAreaInsetsBottom;
- (void)resetSafeAreaInsetsTop;
- (void)setCoordinateSpace:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInsetFrame:(CGRect)a3 forEdges:(unint64_t)a4;
- (void)setSafeAreaInsetBottom:(double)a3;
- (void)setSafeAreaInsetTop:(double)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
@end

@implementation PBSplitViewGeometry

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSplitViewGeometry;
  id result = -[PBSplitViewGeometry init](&v3, "init");
  if (result)
  {
    *((_OWORD *)result + 3) = xmmword_1002EC260;
    *((_OWORD *)result + 4) = unk_1002EC270;
  }

  return result;
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_frame, a3))
  {
    -[PBSplitViewGeometry willChangeValueForKey:](self, "willChangeValueForKey:", @"frame");
    self->_frame.origin.CGFloat x = x;
    self->_frame.origin.CGFloat y = y;
    self->_frame.size.CGFloat width = width;
    self->_frame.size.CGFloat height = height;
    -[PBSplitViewGeometry didChangeValueForKey:](self, "didChangeValueForKey:", @"frame");
  }

- (void)setCoordinateSpace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);

  if (WeakRetained != v4)
  {
    -[PBSplitViewGeometry willChangeValueForKey:](self, "willChangeValueForKey:", @"coordinateSpace");
    objc_storeWeak((id *)&self->_coordinateSpace, v4);
    -[PBSplitViewGeometry didChangeValueForKey:](self, "didChangeValueForKey:", @"coordinateSpace");
  }
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  double v7 = self->_safeAreaInsets.top;
  if (self->_safeAreaInsets.left != a3.left
    || v7 != top
    || self->_safeAreaInsets.right != a3.right
    || self->_safeAreaInsets.bottom != a3.bottom)
  {
    -[PBSplitViewGeometry willChangeValueForKey:](self, "willChangeValueForKey:", @"safeAreaInsets", v7);
    self->_safeAreaInsets.double top = top;
    self->_safeAreaInsets.CGFloat left = left;
    self->_safeAreaInsets.CGFloat bottom = bottom;
    self->_safeAreaInsets.CGFloat right = right;
    -[PBSplitViewGeometry didChangeValueForKey:](self, "didChangeValueForKey:", @"safeAreaInsets");
  }

- (void)resetSafeAreaInsetsTop
{
}

- (void)resetSafeAreaInsetsBottom
{
}

- (CGRect)bounds
{
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInsetFrame:(CGRect)a3 forEdges:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = UIEdgeInsetsSubtract( a4,  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right,  self->_safeAreaInsets.top,  self->_safeAreaInsets.left,  self->_safeAreaInsets.bottom,  self->_safeAreaInsets.right);
  -[PBSplitViewGeometry setFrame:](self, "setFrame:", x + v12, y + v9, width - (v12 + v10), height - (v9 + v11));
}

- (void)setSafeAreaInsetTop:(double)a3
{
}

- (void)setSafeAreaInsetBottom:(double)a3
{
}

+ (id)keyPathsForValuesAffectingFrame
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"coordinateSpace"));
}

+ (BOOL)automaticallyNotifiesObserversOfFrame
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfCoordinateSpace
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfSafeAreaInsets
{
  return 0;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBSplitViewGeometry succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBSplitViewGeometry descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewGeometry succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  objc_msgSend( v3,  "appendRect:withName:",  @"frame",  self->_frame.origin.x,  self->_frame.origin.y,  self->_frame.size.width,  self->_frame.size.height);
  v5 = NSStringFromUIEdgeInsets(self->_safeAreaInsets);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v3 appendObject:v6 withName:@"safeAreaInsets"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBSplitViewGeometry descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewGeometry succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeMultilinePrefix]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10007BBD4;
  v10[3] = &unk_1003CFEB8;
  id v7 = v5;
  id v11 = v7;
  double v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v6 block:v10];

  id v8 = v7;
  return v8;
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

- (UICoordinateSpace)coordinateSpace
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_coordinateSpace);
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

- (void).cxx_destruct
{
}

- (CGRect)insetFrameForEdges:(unint64_t)a3
{
  double v5 = v4 + self->_frame.origin.y;
  CGFloat v8 = self->_frame.size.width - (v6 + v7);
  double v10 = self->_frame.size.height - (v4 + v9);
  double v11 = self->_frame.origin.x + v6;
  double v12 = v5;
  double v13 = v8;
  result.size.double height = v10;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)insetBoundsForEdges:(unint64_t)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsForEdges:(unint64_t)a3
{
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (void)addObserverForFrame:(id)a3
{
}

- (void)removeObserverForFrame:(id)a3
{
}

- (void)addObserverForSafeAreaInsets:(id)a3
{
}

- (void)removeObserverForSafeAreaInsets:(id)a3
{
}

- (void)addObserverForInsetFrame:(id)a3
{
  id v4 = a3;
  -[PBSplitViewGeometry addObserver:forKeyPath:options:context:]( self,  "addObserver:forKeyPath:options:context:",  v4,  @"frame",  0LL,  &off_1003D3188);
  -[PBSplitViewGeometry addObserver:forKeyPath:options:context:]( self,  "addObserver:forKeyPath:options:context:",  v4,  @"safeAreaInsets",  0LL,  &off_1003D3188);
}

- (void)removeObserverForInsetFrame:(id)a3
{
  id v4 = a3;
  -[PBSplitViewGeometry removeObserver:forKeyPath:context:]( self,  "removeObserver:forKeyPath:context:",  v4,  @"frame",  &off_1003D3188);
  -[PBSplitViewGeometry removeObserver:forKeyPath:context:]( self,  "removeObserver:forKeyPath:context:",  v4,  @"safeAreaInsets",  &off_1003D3188);
}

@end