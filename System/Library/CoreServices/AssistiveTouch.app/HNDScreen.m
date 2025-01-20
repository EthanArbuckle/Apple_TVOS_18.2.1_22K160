@interface HNDScreen
+ (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4;
+ (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4;
+ (CGRect)convertRect:(CGRect)a3 fromView:(id)a4;
+ (CGRect)convertRect:(CGRect)a3 toView:(id)a4;
@end

@implementation HNDScreen

+ (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  objc_opt_class(&OBJC_CLASS___UIWindow, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    id v9 = v6;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 window]);
  }
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_convertPointFromSceneReferenceSpace:", x, y);
    double x = v11;
    double y = v12;
  }

  else
  {
    v21.double x = x;
    v21.double y = y;
    v13 = NSStringFromCGPoint(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v13);
    _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Tried to convert HNDScreen point %@ to view %@, but it had no window.");
  }

  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

+ (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  double v8 = v7;
  double v10 = v9;
  objc_opt_class(&OBJC_CLASS___UIWindow, v11);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0) {
    id v13 = v6;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue([v6 window]);
  }
  double v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "_convertPointToSceneReferenceSpace:", v8, v10);
    double v8 = v15;
    double v10 = v16;
  }

  else
  {
    v21.double x = v8;
    v21.double y = v10;
    double v17 = NSStringFromCGPoint(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v17);
    _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Tried to convert HNDScreen point %@ from view %@, but it had no window.");
  }

  double v18 = v8;
  double v19 = v10;
  result.double y = v19;
  result.double x = v18;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 toView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_opt_class(&OBJC_CLASS___UIWindow, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
    id v11 = v8;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v8 window]);
  }
  uint64_t v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_convertRectFromSceneReferenceSpace:", x, y, width, height);
    double x = v13;
    double y = v14;
    double width = v15;
    double height = v16;
  }

  else
  {
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    double v17 = NSStringFromCGRect(v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v17);
    _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Tried to convert HNDScreen rect %@ to view %@, but it had no window.");
  }

  objc_msgSend(v8, "convertRect:fromView:", 0, x, y, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 fromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  objc_msgSend(v8, "convertRect:toView:", 0, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  objc_opt_class(&OBJC_CLASS___UIWindow, v17);
  if ((objc_opt_isKindOfClass(v8, v18) & 1) != 0) {
    id v19 = v8;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue([v8 window]);
  }
  double v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "_convertRectToSceneReferenceSpace:", v10, v12, v14, v16);
    double v10 = v21;
    double v12 = v22;
    double v14 = v23;
    double v16 = v24;
  }

  else
  {
    v31.origin.double x = v10;
    v31.origin.double y = v12;
    v31.size.double width = v14;
    v31.size.double height = v16;
    double v25 = NSStringFromCGRect(v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v25);
    _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Tried to convert HNDScreen rect %@ from view %@, but it had no window.");
  }

  double v26 = v10;
  double v27 = v12;
  double v28 = v14;
  double v29 = v16;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

@end