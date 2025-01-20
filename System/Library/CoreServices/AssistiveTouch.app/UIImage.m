@interface UIImage
+ (id)scat_cachedMenuImageForImageName:(id)a3;
+ (id)scat_imageForTitle:(id)a3 imageSize:(CGSize)a4;
+ (id)scat_singleCharacterImageForTitle:(id)a3 charactersInUse:(id)a4;
+ (void)scat_setCachedMenuImage:(id)a3 forImageName:(id)a4;
@end

@implementation UIImage

+ (void)scat_setCachedMenuImage:(id)a3 forImageName:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (!qword_100157660)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSCache);
    v7 = (void *)qword_100157660;
    qword_100157660 = (uint64_t)v6;
  }

  if (v8 && v5) {
    [(id)qword_100157660 setObject:v8 forKey:v5];
  }
}

+ (id)scat_cachedMenuImageForImageName:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100157660, "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

+ (id)scat_singleCharacterImageForTitle:(id)a3 charactersInUse:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = 0LL;
    unint64_t v8 = 0LL;
    while (1)
    {
      id v9 = [v5 rangeOfComposedCharacterSequenceAtIndex:v8];
      if (!v10) {
        break;
      }
      id v11 = v9;
      if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v9, v10));

      if (v6 && ([v6 containsObject:v13] & 1) != 0
        || (v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( NSCharacterSet,  "whitespaceAndNewlineCharacterSet")),  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByTrimmingCharactersInSet:v14]),  id v16 = objc_msgSend(v15, "length"),  v15,  v14,  !v16))
      {
        unint64_t v8 = (unint64_t)v11 + v12;
        v7 = v13;
      }

      goto LABEL_12;
    }

    v13 = v7;
  }

  else
  {
    v13 = 0LL;
  }

+ (id)scat_imageForTitle:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  if ([v6 length])
  {
    v20[0] = NSFontAttributeName;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 24.0));
    v21[0] = v7;
    v20[1] = NSForegroundColorAttributeName;
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v21[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

    [v6 sizeWithAttributes:v9];
    double v11 = v10;
    double v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v14 scale];
    CGFloat v16 = v15;
    v22.double width = width;
    v22.double height = height;
    UIGraphicsBeginImageContextWithOptions(v22, 0, v16);

    objc_msgSend(v6, "drawInRect:withAttributes:", v9, (width - v11) * 0.5, (height - v13) * 0.5, v11, v13);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    double v18 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
  }

  else
  {
    double v18 = 0LL;
  }

  return v18;
}

@end