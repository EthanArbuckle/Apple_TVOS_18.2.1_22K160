@interface TVHGradientMaskConfiguration
+ (id)new;
- (TVHGradientMaskConfiguration)init;
- (TVHGradientMaskConfiguration)initWithCollectionView:(id)a3 direction:(int64_t)a4;
- (TVHGradientMaskConfiguration)initWithCollectionView:(id)a3 direction:(int64_t)a4 properties:(id)a5;
- (UIEdgeInsets)gradientBoundsInset;
- (UIEdgeInsets)gradientInset;
- (UIEdgeInsets)gradientLengths;
@end

@implementation TVHGradientMaskConfiguration

+ (id)new
{
  return 0LL;
}

- (TVHGradientMaskConfiguration)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHGradientMaskConfiguration)initWithCollectionView:(id)a3 direction:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHGradientMaskProperties defaultGradientMaskProperties]( &OBJC_CLASS___TVHGradientMaskProperties,  "defaultGradientMaskProperties"));
  v8 = -[TVHGradientMaskConfiguration initWithCollectionView:direction:properties:]( self,  "initWithCollectionView:direction:properties:",  v6,  a4,  v7);

  return v8;
}

- (TVHGradientMaskConfiguration)initWithCollectionView:(id)a3 direction:(int64_t)a4 properties:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___TVHGradientMaskConfiguration;
  v10 = -[TVHGradientMaskConfiguration init](&v46, "init");
  if (v10)
  {
    [v8 contentInset];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [v9 minPadding];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    [v9 minLengths];
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    double v33 = -(v20 - v12);
    if (v12 >= v20) {
      double v33 = UIEdgeInsetsZero.top;
    }
    double v34 = UIEdgeInsetsZero.top + v20 - v12;
    if (v12 >= v20) {
      double v34 = UIEdgeInsetsZero.top;
    }
    if ((v6 & 1) != 0) {
      double v35 = v28;
    }
    else {
      double v35 = v33;
    }
    if ((v6 & 1) != 0) {
      double top = v33;
    }
    else {
      double v34 = UIEdgeInsetsZero.top;
    }
    double v36 = -(v24 - v16);
    if (v16 >= v24) {
      double v36 = UIEdgeInsetsZero.bottom;
    }
    double v37 = v24 - v16 + bottom;
    if (v16 >= v24) {
      double v37 = UIEdgeInsetsZero.bottom;
    }
    if ((v6 & 2) != 0)
    {
      double bottom = v36;
    }

    else
    {
      double v28 = v36;
      double v37 = UIEdgeInsetsZero.bottom;
    }

    double v38 = -(v22 - v14);
    if (v14 >= v22) {
      double v38 = UIEdgeInsetsZero.left;
    }
    double v39 = v22 - v14 + left;
    if (v14 >= v22) {
      double v39 = UIEdgeInsetsZero.left;
    }
    if ((v6 & 8) != 0) {
      double v40 = v27;
    }
    else {
      double v40 = v38;
    }
    if ((v6 & 8) != 0) {
      double left = v38;
    }
    else {
      double v39 = UIEdgeInsetsZero.left;
    }
    double v41 = -(v26 - v18);
    if (v18 >= v26) {
      double v41 = UIEdgeInsetsZero.right;
    }
    v10->_gradientLengths.double top = v35;
    v10->_gradientLengths.double left = v40;
    double v42 = v26 - v18 + right;
    if (v18 >= v26) {
      double v42 = right;
    }
    if ((v6 & 0x10) == 0) {
      double v27 = v41;
    }
    v10->_gradientLengths.double bottom = v28;
    v10->_gradientLengths.double right = v27;
    v10->_gradientInset.double top = v34;
    v10->_gradientInset.double left = v39;
    if ((v6 & 0x10) != 0) {
      double v43 = v42;
    }
    else {
      double v43 = right;
    }
    v10->_gradientInset.double bottom = v37;
    v10->_gradientInset.double right = v43;
    v10->_gradientBoundsInset.double top = top;
    v10->_gradientBoundsInset.double left = left;
    if ((v6 & 0x10) != 0) {
      double v44 = v41;
    }
    else {
      double v44 = right;
    }
    v10->_gradientBoundsInset.double bottom = bottom;
    v10->_gradientBoundsInset.double right = v44;
  }

  return v10;
}

- (UIEdgeInsets)gradientLengths
{
  double top = self->_gradientLengths.top;
  double left = self->_gradientLengths.left;
  double bottom = self->_gradientLengths.bottom;
  double right = self->_gradientLengths.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)gradientInset
{
  double top = self->_gradientInset.top;
  double left = self->_gradientInset.left;
  double bottom = self->_gradientInset.bottom;
  double right = self->_gradientInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)gradientBoundsInset
{
  double top = self->_gradientBoundsInset.top;
  double left = self->_gradientBoundsInset.left;
  double bottom = self->_gradientBoundsInset.bottom;
  double right = self->_gradientBoundsInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end