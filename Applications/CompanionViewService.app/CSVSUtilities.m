@interface CSVSUtilities
+ (id)qrCodeImageForURL:(id)a3 size:(CGSize)a4;
@end

@implementation CSVSUtilities

+ (id)qrCodeImageForURL:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 absoluteString]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](&OBJC_CLASS___CIFilter, "filterWithName:", @"CIQRCodeGenerator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](&OBJC_CLASS___CIFilter, "filterWithName:", @"CIFalseColor"));
  [v8 setValue:v7 forKey:@"inputMessage"];
  [v8 setValue:@"L" forKey:@"inputCorrectionLevel"];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 outputImage]);
  [v10 extent];
  CGRect v25 = CGRectIntegral(v24);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat v13 = v25.size.width;
  CGFloat v14 = v25.size.height;
  CGFloat v15 = width / CGRectGetWidth(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.double width = v13;
  v26.size.double height = v14;
  CGFloat v16 = CGRectGetHeight(v26);
  CGAffineTransformMakeScale(&v23, v15, height / v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 imageByApplyingTransform:&v23]);
  [v9 setValue:v17 forKey:@"inputImage"];
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[CIColor colorWithRed:green:blue:]( &OBJC_CLASS___CIColor,  "colorWithRed:green:blue:",  153.0,  153.0,  153.0));
  [v9 setValue:v18 forKey:@"inputColor0"];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CIColor clearColor](&OBJC_CLASS___CIColor, "clearColor"));
  [v9 setValue:v19 forKey:@"inputColor1"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v9 outputImage]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCIImage:](&OBJC_CLASS___UIImage, "imageWithCIImage:", v20));

  return v21;
}

@end