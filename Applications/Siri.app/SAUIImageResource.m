@interface SAUIImageResource
- (id)_convertedImageOfSize:(CGSize)a3;
@end

@implementation SAUIImageResource

- (id)_convertedImageOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIImageResource resourceUrl](self, "resourceUrl"));
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___SFURLImage);
    [v7 setUrlValue:v6];
  }

  else
  {
    id v7 = 0LL;
  }

  objc_msgSend(v7, "setSize:", width, height);
  [v7 setCornerRoundingStyle:2];
  -[SAUIImageResource scaleFactor](self, "scaleFactor");
  objc_msgSend(v7, "setScale:");

  return v7;
}

@end