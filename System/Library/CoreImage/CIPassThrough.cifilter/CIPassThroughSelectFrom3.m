@interface CIPassThroughSelectFrom3
- (CIImage)inputImage;
- (CIImage)inputImage1;
- (CIImage)inputImage2;
- (NSNumber)inputSelected;
- (id)outputImage;
- (void)setInputImage1:(id)a3;
- (void)setInputImage2:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSelected:(id)a3;
@end

@implementation CIPassThroughSelectFrom3

- (id)outputImage
{
  if (-[NSNumber intValue](self->inputSelected, "intValue") < 0
    || -[NSNumber intValue](self->inputSelected, "intValue") <= 2)
  {
    else {
      uint64_t v3 = -[NSNumber intValue](self->inputSelected, "intValue");
    }
  }

  else
  {
    uint64_t v3 = 2LL;
  }

  inputImage = self->inputImage;
  if (inputImage) {
    v5 = inputImage;
  }
  else {
    v5 = (CIImage *)objc_claimAutoreleasedReturnValue(+[CIImage emptyImage](&OBJC_CLASS___CIImage, "emptyImage"));
  }
  v6 = v5;
  inputImage1 = self->inputImage1;
  if (inputImage1) {
    v8 = inputImage1;
  }
  else {
    v8 = (CIImage *)objc_claimAutoreleasedReturnValue(+[CIImage emptyImage](&OBJC_CLASS___CIImage, "emptyImage"));
  }
  v9 = v8;
  inputImage2 = self->inputImage2;
  if (inputImage2) {
    v11 = inputImage2;
  }
  else {
    v11 = (CIImage *)objc_claimAutoreleasedReturnValue(+[CIImage emptyImage](&OBJC_CLASS___CIImage, "emptyImage"));
  }
  v12 = v11;
  -[CIImage extent](v6, "extent");
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  -[CIImage extent](v9, "extent");
  v47.origin.CGFloat x = v21;
  v47.origin.CGFloat y = v22;
  v47.size.CGFloat width = v23;
  v47.size.CGFloat height = v24;
  v43.origin.CGFloat x = v14;
  v43.origin.CGFloat y = v16;
  v43.size.CGFloat width = v18;
  v43.size.CGFloat height = v20;
  CGRect v44 = CGRectUnion(v43, v47);
  CGFloat x = v44.origin.x;
  CGFloat y = v44.origin.y;
  CGFloat width = v44.size.width;
  CGFloat height = v44.size.height;
  -[CIImage extent](v12, "extent");
  v48.origin.CGFloat x = v29;
  v48.origin.CGFloat y = v30;
  v48.size.CGFloat width = v31;
  v48.size.CGFloat height = v32;
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  CGRect v46 = CGRectUnion(v45, v48);
  double v33 = v46.origin.x;
  double v34 = v46.origin.y;
  double v35 = v46.size.width;
  double v36 = v46.size.height;
  if (CGRectIsEmpty(v46))
  {
    v37 = 0LL;
  }

  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[CIColorKernel cachedKernelWithString:]( &OBJC_CLASS___CIColorKernel,  "cachedKernelWithString:",  @"kernel vec4 CIPT_Select3(__sample c0, __sample c1, __sample c2, float sel) { return sel < 1.0 ? c0 : sel < 2.0 ? c1 : c2; } \n"));
    v42[0] = v6;
    v42[1] = v9;
    v42[2] = v12;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    v42[3] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 4LL));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "applyWithExtent:arguments:", v40, v33, v34, v35, v36));
  }

  return v37;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage1
{
  return (CIImage *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setInputImage1:(id)a3
{
}

- (CIImage)inputImage2
{
  return (CIImage *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setInputImage2:(id)a3
{
}

- (NSNumber)inputSelected
{
  return self->inputSelected;
}

- (void)setInputSelected:(id)a3
{
}

- (void).cxx_destruct
{
}

@end