@interface _UIStackedImageContainerView
- (_UIStackedImageContainerLayer)tvm_layeredImageContainerLayer;
@end

@implementation _UIStackedImageContainerView

- (_UIStackedImageContainerLayer)tvm_layeredImageContainerLayer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerView layer](self, "layer"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS____UIStackedImageContainerLayer, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerView layer](self, "layer"));
  }
  else {
    v7 = 0LL;
  }
  return (_UIStackedImageContainerLayer *)v7;
}

@end