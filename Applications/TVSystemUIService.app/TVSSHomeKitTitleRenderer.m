@interface TVSSHomeKitTitleRenderer
- (CGSize)contentSizeForLayoutEnvironment:(id)a3;
@end

@implementation TVSSHomeKitTitleRenderer

- (CGSize)contentSizeForLayoutEnvironment:(id)a3
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  CGSize v25 = CGSizeZero;
  id v15 = -[TVSSHomeKitTitleRenderer content](v24, "content");
  id v16 = [v15 contentTitle];
  if (v16) {
    v3 = (__CFString *)v16;
  }
  else {
    v3 = @"Measure Me";
  }
  id v22 = v3;

  id v21 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 1LL);
  if (v22)
  {
    [location[0] layoutFrame];
    double v19 = v4;
    double v20 = v5;
    NSAttributedStringKey v26 = NSFontAttributeName;
    id v27 = v21;
    v14 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL);
    objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 3, v19, v20);
    rect.origin.x = v6;
    rect.origin.y = v7;
    rect.size.double width = v8;
    rect.size.double height = v9;

    [location[0] containerFrame];
    CGRectGetHeight(rect);
    sub_100138AAC();
    v17.double width = v10;
    v17.double height = v11;
    CGSize v25 = v17;
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
  double height = v25.height;
  double width = v25.width;
  result.double height = height;
  result.double width = width;
  return result;
}

  ;
}

@end