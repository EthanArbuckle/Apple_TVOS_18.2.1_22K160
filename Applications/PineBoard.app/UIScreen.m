@interface UIScreen
+ (BOOL)pb_screenOverridesReferenceBoundsForDisplayConfiguration:(id)a3;
+ (id)pb_screenForDisplayConfiguration:(id)a3;
- (BOOL)pb_overridesReferenceBounds;
@end

@implementation UIScreen

+ (id)pb_screenForDisplayConfiguration:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identity]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _screenWithFBSDisplayIdentity:v4]);

  return v5;
}

+ (BOOL)pb_screenOverridesReferenceBoundsForDisplayConfiguration:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pb_screenForDisplayConfiguration:", a3));
  unsigned __int8 v4 = objc_msgSend(v3, "pb_overridesReferenceBounds");

  return v4;
}

- (BOOL)pb_overridesReferenceBounds
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen displayConfiguration](self, "displayConfiguration"));
  -[UIScreen _referenceBounds](v2, "_referenceBounds");
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 bounds];
  v18.origin.x = v12;
  v18.origin.y = v13;
  v18.size.width = v14;
  v18.size.height = v15;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  LOBYTE(v2) = !CGRectEqualToRect(v17, v18);

  return (char)v2;
}

@end