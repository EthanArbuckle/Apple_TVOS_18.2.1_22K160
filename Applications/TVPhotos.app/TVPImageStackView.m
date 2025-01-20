@interface TVPImageStackView
+ (CGSize)_scaledSizeForSize:(CGSize)a3 focusSizeIncrease:(double)a4 selectionStyle:(int64_t)a5;
+ (CGSize)_scaledSizeForSize:(CGSize)a3 selectionStyle:(int64_t)a4;
+ (TVPImageStackView)imageStackViewWithImageStack:(id)a3 size:(CGSize)a4;
+ (TVPImageStackView)imageStackViewWithSize:(CGSize)a3;
- (BOOL)isBrightnessBoostEnabled;
- (BOOL)isHueShiftEnabled;
- (BOOL)isImageLoaded;
- (BOOL)isPressed;
- (BOOL)isSelected;
- (CGPoint)focusDirection;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)parallaxImageDepths;
- (TVPImageStack)imageStack;
- (TVPImageStackView)initWithFrame:(CGRect)a3;
- (TVPImageStackView)initWithImageStack:(id)a3 size:(CGSize)a4;
- (TVPImageStackView)initWithSize:(CGSize)a3;
- (UIColor)specularHighlightColor;
- (UIView)overlayView;
- (UIView)unmaskedOverlayView;
- (double)_idleModeFocusSizeOffset;
- (double)_pressedDuration;
- (double)_pressedScaleAdjustment;
- (double)_unpressedDuration;
- (double)cornerRadius;
- (double)focusSizeIncrease;
- (double)layerSelectionDuration;
- (double)layerUnselectionDuration;
- (double)maxParallaxImageDepth;
- (double)perspectiveZDepth;
- (double)radiosityAmount;
- (double)rotationAmount;
- (double)specularHighlightHorizontalPositionSensitivity;
- (double)specularHighlightVerticalPosition;
- (double)specularHighlightVerticalPositionSensitivity;
- (id)_flatLayer;
- (id)_imageConfiguration;
- (id)_imageStackContentsGravity;
- (id)_layerBelowTitles;
- (id)_layeredImageContainerLayer;
- (id)_newImageConfiguration;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)_shadowLayer;
- (int64_t)_selectionStyle;
- (unint64_t)controlState;
- (unint64_t)primaryControlState;
- (void)_loadImage;
- (void)_resetShadowSettings;
- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4;
- (void)_setIdleModeFocusSizeOffset:(double)a3;
- (void)_setImageStackContentsGravity:(id)a3;
- (void)_setPressedDuration:(double)a3;
- (void)_setPressedScaleAdjustment:(double)a3;
- (void)_setSelectionStyle:(int64_t)a3;
- (void)_setShadowOpacity:(double)a3;
- (void)_setShadowRadius:(double)a3;
- (void)_setShadowVerticalOffset:(double)a3;
- (void)_setUnpressedDuration:(double)a3;
- (void)_updateStackedImageConfiguration;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBrightnessBoostEnabled:(BOOL)a3;
- (void)setControlState:(unint64_t)a3;
- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5;
- (void)setCornerRadius:(double)a3;
- (void)setFocusDirection:(CGPoint)a3;
- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setHueShiftEnabled:(BOOL)a3;
- (void)setImageLoaded:(BOOL)a3;
- (void)setImageStack:(id)a3;
- (void)setImageStack:(id)a3 withSize:(CGSize)a4;
- (void)setLayerSelectionDuration:(double)a3;
- (void)setLayerUnselectionDuration:(double)a3;
- (void)setMaxParallaxImageDepth:(double)a3;
- (void)setOverlayView:(id)a3;
- (void)setParallaxImageDepths:(id)a3;
- (void)setPerspectiveZDepth:(double)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setPressed:(BOOL)a3 duration:(double)a4 completion:(id)a5;
- (void)setRadiosityAmount:(double)a3;
- (void)setRotationAmount:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setSpecularHighlightHorizontalPositionSensitivity:(double)a3;
- (void)setSpecularHighlightVerticalPosition:(double)a3;
- (void)setSpecularHighlightVerticalPositionSensitivity:(double)a3;
- (void)setUnmaskedOverlayView:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVPImageStackView

+ (TVPImageStackView)imageStackViewWithImageStack:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v9 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v8)), "initWithImageStack:size:", v7, width, height);

  return (TVPImageStackView *)v9;
}

+ (TVPImageStackView)imageStackViewWithSize:(CGSize)a3
{
  return (TVPImageStackView *) objc_msgSend( objc_alloc((Class)objc_opt_class(a1, a2)),  "initWithSize:",  a3.width,  a3.height);
}

- (TVPImageStackView)initWithFrame:(CGRect)a3
{
  return 0LL;
}

- (TVPImageStackView)initWithImageStack:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  double y = CGPointZero.y;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVPImageStackView;
  id v9 = -[TVPImageStackView initWithFrame:](&v18, "initWithFrame:", CGPointZero.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    v9->_imageStackSize.double width = width;
    v9->_imageStackSize.double height = height;
    v11 = objc_alloc_init(&OBJC_CLASS____UIStackedImageContainerLayer);
    imageStackLayer = v10->_imageStackLayer;
    v10->_imageStackLayer = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageStackView layer](v10, "layer"));
    [v13 addSublayer:v10->_imageStackLayer];

    -[TVPImageStackView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageStackView layer](v10, "layer"));
    [v14 setAllowsGroupOpacity:0];

    -[TVPImageStackView setImageStack:](v10, "setImageStack:", v7);
    -[TVPImageStackView _updateStackedImageConfiguration](v10, "_updateStackedImageConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:v10 selector:"_updateStackedImageConfiguration" name:UIAccessibilityReduceMotionStatusDidChangeNotification object:0];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 addObserver:v10 selector:"_updateStackedImageConfiguration" name:kAXSHighContrastFocusIndicatorsEnabledNotification object:0];
  }

  return v10;
}

- (TVPImageStackView)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double y = CGPointZero.y;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPImageStackView;
  v5 = -[TVPImageStackView initWithFrame:](&v9, "initWithFrame:", CGPointZero.x, y, a3.width, height);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.1, 1.0));
    -[TVPImageStackView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[TVPImageStackView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageStackView layer](v5, "layer"));
    [v7 setAllowsGroupOpacity:0];
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPImageStackView;
  -[TVPImageStackView dealloc](&v4, "dealloc");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_imageStackSize.width;
  if (width <= 0.0 || (double height = self->_imageStackSize.height, height <= 0.0))
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVPImageStackView;
    -[TVPImageStackView sizeThatFits:](&v9, "sizeThatFits:", a3.width, a3.height);
    double width = v5;
    double height = v6;
  }

  double v7 = width;
  double v8 = height;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPImageStackView;
  -[TVPImageStackView layoutSubviews](&v4, "layoutSubviews");
  imageStackLayer = self->_imageStackLayer;
  -[TVPImageStackView bounds](self, "bounds");
  -[_UIStackedImageContainerLayer setFrame:](imageStackLayer, "setFrame:");
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPImageStackView;
  -[TVPImageStackView willMoveToWindow:](&v5, "willMoveToWindow:");
  if (a3)
  {
    if (!-[TVPImageStackView isImageLoaded](self, "isImageLoaded")) {
      -[TVPImageStackView _loadImage](self, "_loadImage");
    }
  }

  else
  {
    -[TVPImageStack cancel](self->_imageStack, "cancel");
  }

- (TVPImageStack)imageStack
{
  return self->_imageStack;
}

- (void)setImageStack:(id)a3 withSize:(CGSize)a4
{
  self->_imageStackSize = a4;
  -[TVPImageStackView setImageStack:](self, "setImageStack:", a3);
}

- (void)setImageStack:(id)a3
{
  id v17 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageStackView imageStack](self, "imageStack"));
  unsigned __int8 v5 = [v17 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    -[TVPImageStack cancel](self->_imageStack, "cancel");
    double v6 = (TVPImageStack *)[v17 copy];
    imageStack = self->_imageStack;
    self->_imageStack = v6;

    -[TVPImageStackView setImageLoaded:](self, "setImageLoaded:", 0LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue([v17 placeholderImage]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVPImageStack, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
      id v11 = (id)objc_claimAutoreleasedReturnValue([v8 placeholderImage]);
    }
    else {
      id v11 = v8;
    }
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](&OBJC_CLASS___UIImage, "imageWithCGImage:", v12));
    if (!v13)
    {
      id v14 = sub_10000DAA4(0LL);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }

    imageStackConfig = self->_imageStackConfig;
    if (!imageStackConfig)
    {
      -[TVPImageStackView _updateStackedImageConfiguration](self, "_updateStackedImageConfiguration");
      imageStackConfig = self->_imageStackConfig;
    }

    -[_UIStackedImageConfiguration setPlaceholderImage:](imageStackConfig, "setPlaceholderImage:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageStackView window](self, "window"));

    if (v16) {
      -[TVPImageStackView _loadImage](self, "_loadImage");
    }
  }
}

- (void)_loadImage
{
  v3 = (TVUINamedLayerStack *)objc_opt_new(&OBJC_CLASS___TVUINamedLayerStack, a2);
  uiLayerStack = self->_uiLayerStack;
  self->_uiLayerStack = v3;

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  -[TVUINamedLayerStack setName:](self->_uiLayerStack, "setName:", v6);

  p_imageStackSize = &self->_imageStackSize;
  -[TVUINamedLayerStack setSize:]( self->_uiLayerStack,  "setSize:",  self->_imageStackSize.width,  self->_imageStackSize.height);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v8 scale];
  -[TVUINamedLayerStack setScale:](self->_uiLayerStack, "setScale:");

  -[TVUINamedLayerStack setFlattenedImage:](self->_uiLayerStack, "setFlattenedImage:", 0LL);
  -[TVUINamedLayerStack setLayers:](self->_uiLayerStack, "setLayers:", &__NSArray0__struct);
  -[TVUINamedLayerStack setRadiosityImage:](self->_uiLayerStack, "setRadiosityImage:", 0LL);
  -[TVUINamedLayerStack setRadiosityImageScale:]( self->_uiLayerStack,  "setRadiosityImageScale:",  CGSizeZero.width,  CGSizeZero.height);
  -[TVPImageStack flatImageCornerRadius](self->_imageStack, "flatImageCornerRadius");
  -[TVUINamedLayerStack setFlatImageContainsCornerRadius:]( self->_uiLayerStack,  "setFlatImageContainsCornerRadius:",  v9 > 0.00000011920929);
  -[_UIStackedImageContainerLayer setLayerStack:](self->_imageStackLayer, "setLayerStack:", self->_uiLayerStack);
  id v10 = -[TVUINamedLayerStack copy](self->_uiLayerStack, "copy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageStackView imageStack](self, "imageStack"));
  objc_initWeak(&location, v11);

  id v12 = objc_loadWeakRetained(&location);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006CFFC;
  v14[3] = &unk_1000CC428;
  objc_copyWeak(&v16, &location);
  v14[4] = self;
  id v13 = v10;
  id v15 = v13;
  objc_msgSend( v12,  "_loadImagesAtSize:scaledSize:completion:",  v14,  p_imageStackSize->width,  p_imageStackSize->height,  p_imageStackSize->width,  p_imageStackSize->height);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (double)maxParallaxImageDepth
{
  return result;
}

- (void)setMaxParallaxImageDepth:(double)a3
{
}

- (NSArray)parallaxImageDepths
{
  return (NSArray *)-[_UIStackedImageContainerLayer _parallaxLayerDepths]( self->_imageStackLayer,  "_parallaxLayerDepths");
}

- (void)setParallaxImageDepths:(id)a3
{
}

- (double)perspectiveZDepth
{
  return result;
}

- (void)setPerspectiveZDepth:(double)a3
{
}

- (double)cornerRadius
{
  return result;
}

- (void)setCornerRadius:(double)a3
{
}

- (void)setRotationAmount:(double)a3
{
}

- (double)rotationAmount
{
  return result;
}

- (UIColor)specularHighlightColor
{
  return 0LL;
}

- (double)specularHighlightHorizontalPositionSensitivity
{
  return result;
}

- (void)setSpecularHighlightHorizontalPositionSensitivity:(double)a3
{
}

- (double)specularHighlightVerticalPosition
{
  return result;
}

- (void)setSpecularHighlightVerticalPosition:(double)a3
{
}

- (double)specularHighlightVerticalPositionSensitivity
{
  return result;
}

- (void)setSpecularHighlightVerticalPositionSensitivity:(double)a3
{
}

- (double)radiosityAmount
{
  return result;
}

- (void)setRadiosityAmount:(double)a3
{
}

- (BOOL)isBrightnessBoostEnabled
{
  return -[_UIStackedImageConfiguration boostBrightness](self->_imageStackConfig, "boostBrightness");
}

- (void)setBrightnessBoostEnabled:(BOOL)a3
{
}

- (BOOL)isHueShiftEnabled
{
  return -[_UIStackedImageConfiguration hueShift](self->_imageStackConfig, "hueShift");
}

- (void)setHueShiftEnabled:(BOOL)a3
{
}

- (double)layerSelectionDuration
{
  return result;
}

- (void)setLayerSelectionDuration:(double)a3
{
  self->_layerSelectionDuration = a3;
  -[_UIStackedImageConfiguration setLayerSelectionDuration:](self->_imageStackConfig, "setLayerSelectionDuration:");
}

- (double)layerUnselectionDuration
{
  return result;
}

- (void)setLayerUnselectionDuration:(double)a3
{
  self->_layerUnselectionDuration = a3;
  -[_UIStackedImageConfiguration setLayerUnselectionDuration:](self->_imageStackConfig, "setLayerUnselectionDuration:");
}

- (BOOL)isSelected
{
  return -[_UIStackedImageContainerLayer isSelected](self->_imageStackLayer, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[_UIStackedImageContainerLayer setSelected:animated:](self->_imageStackLayer, "setSelected:animated:");
  -[UIView setSelected:animated:](self->_overlayView, "setSelected:animated:", v5, v4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  imageStackLayer = self->_imageStackLayer;
  id v9 = a5;
  -[_UIStackedImageContainerLayer setSelected:animated:focusAnimationCoordinator:]( imageStackLayer,  "setSelected:animated:focusAnimationCoordinator:",  v6,  v5,  v9);
  -[UIView setSelected:animated:withAnimationCoordinator:]( self->_overlayView,  "setSelected:animated:withAnimationCoordinator:",  v6,  v5,  v9);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  imageStackLayer = self->_imageStackLayer;
  id v9 = a5;
  -[_UIStackedImageContainerLayer setSelected:animated:focusAnimationCoordinator:]( imageStackLayer,  "setSelected:animated:focusAnimationCoordinator:",  v6,  v5,  v9);
  -[UIView setSelected:animated:withAnimationCoordinator:]( self->_overlayView,  "setSelected:animated:withAnimationCoordinator:",  v6,  v5,  v9);
}

- (BOOL)isPressed
{
  return -[_UIStackedImageContainerLayer isPressed](self->_imageStackLayer, "isPressed");
}

- (void)setPressed:(BOOL)a3
{
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)setPressed:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  BOOL v6 = a3;
  imageStackLayer = self->_imageStackLayer;
  id v9 = a5;
  id v19 = v9;
  if (a4 >= 0.0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerLayer configuration](imageStackLayer, "configuration"));
    [v10 pressedDuration];
    double v12 = v11;

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration"));
    [v13 setPressedDuration:a4];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration"));
    [v14 unpressedDuration];
    double v16 = v15;

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration"));
    [v17 setUnpressedDuration:a4];

    -[_UIStackedImageContainerLayer setPressed:animated:completion:]( self->_imageStackLayer,  "setPressed:animated:completion:",  v6,  1LL,  v19);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration"));
    [v18 setPressedDuration:v12];

    id v19 = (id)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration"));
    [v19 setUnpressedDuration:v16];
  }

  else
  {
    -[_UIStackedImageContainerLayer setPressed:animated:completion:]( imageStackLayer,  "setPressed:animated:completion:",  v6,  1LL,  v9);
  }
}

- (CGPoint)focusDirection
{
  result.double y = v3;
  result.x = v2;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
}

- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4
{
}

- (void)setOverlayView:(id)a3
{
  double v7 = (UIView *)a3;
  if (self->_overlayView != v7)
  {
    objc_storeStrong((id *)&self->_overlayView, a3);
    imageStackLayer = self->_imageStackLayer;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v7, "layer"));
    -[_UIStackedImageContainerLayer _setOverlayLayer:](imageStackLayer, "_setOverlayLayer:", v6);
  }
}

- (void)setUnmaskedOverlayView:(id)a3
{
  double v7 = (UIView *)a3;
  if (self->_unmaskedOverlayView != v7)
  {
    objc_storeStrong((id *)&self->_unmaskedOverlayView, a3);
    imageStackLayer = self->_imageStackLayer;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v7, "layer"));
    -[_UIStackedImageContainerLayer _setUnmaskedOverlayLayer:](imageStackLayer, "_setUnmaskedOverlayLayer:", v6);
  }
}

- (unint64_t)controlState
{
  return (unint64_t)-[_UIStackedImageContainerLayer controlState](self->_imageStackLayer, "controlState");
}

- (void)setControlState:(unint64_t)a3
{
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
}

- (unint64_t)primaryControlState
{
  return (unint64_t)-[_UIStackedImageContainerLayer _primaryControlStateForState:]( self->_imageStackLayer,  "_primaryControlStateForState:",  -[TVPImageStackView controlState](self, "controlState"));
}

- (double)focusSizeIncrease
{
  return result;
}

- (void)setFocusSizeIncrease:(double)a3
{
}

- (double)_idleModeFocusSizeOffset
{
  return result;
}

- (id)_imageConfiguration
{
  return -[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration");
}

- (id)_imageStackContentsGravity
{
  return -[_UIStackedImageContainerLayer _imageStackContentsGravity]( self->_imageStackLayer,  "_imageStackContentsGravity");
}

- (id)_layerBelowTitles
{
  return -[_UIStackedImageContainerLayer _layerBelowTitles](self->_imageStackLayer, "_layerBelowTitles");
}

- (id)_flatLayer
{
  return -[_UIStackedImageContainerLayer _flatLayer](self->_imageStackLayer, "_flatLayer");
}

- (id)_newImageConfiguration
{
  id v2 = +[_UIStackedImageConfiguration newStandardConfiguration]( &OBJC_CLASS____UIStackedImageConfiguration,  "newStandardConfiguration");
  [v2 setMaximumParallaxImages:6];
  return v2;
}

- (void)_setShadowOpacity:(double)a3
{
}

- (void)_setShadowRadius:(double)a3
{
}

- (void)_setShadowVerticalOffset:(double)a3
{
}

- (void)_resetShadowSettings
{
  id v12 = -[TVPImageStackView _newImageConfiguration](self, "_newImageConfiguration");
  imageStackConfig = self->_imageStackConfig;
  [v12 defaultFocusedShadowOpacity];
  -[_UIStackedImageConfiguration setDefaultFocusedShadowOpacity:](imageStackConfig, "setDefaultFocusedShadowOpacity:");
  BOOL v4 = self->_imageStackConfig;
  [v12 defaultHighlightedShadowOpacity];
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowOpacity:](v4, "setDefaultHighlightedShadowOpacity:");
  BOOL v5 = self->_imageStackConfig;
  [v12 defaultUnfocusedShadowOpacity];
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowOpacity:](v5, "setDefaultUnfocusedShadowOpacity:");
  BOOL v6 = self->_imageStackConfig;
  [v12 defaultFocusedShadowRadius];
  -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](v6, "setDefaultFocusedShadowRadius:");
  double v7 = self->_imageStackConfig;
  [v12 defaultHighlightedShadowRadius];
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowRadius:](v7, "setDefaultHighlightedShadowRadius:");
  id v8 = self->_imageStackConfig;
  [v12 defaultUnfocusedShadowRadius];
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowRadius:](v8, "setDefaultUnfocusedShadowRadius:");
  id v9 = self->_imageStackConfig;
  [v12 defaultFocusedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultFocusedShadowVerticalOffset:](v9, "setDefaultFocusedShadowVerticalOffset:");
  id v10 = self->_imageStackConfig;
  [v12 defaultHighlightedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowVerticalOffset:]( v10,  "setDefaultHighlightedShadowVerticalOffset:");
  double v11 = self->_imageStackConfig;
  [v12 defaultUnfocusedShadowVerticalOffset];
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowVerticalOffset:]( v11,  "setDefaultUnfocusedShadowVerticalOffset:");
}

- (double)_pressedDuration
{
  return result;
}

- (double)_pressedScaleAdjustment
{
  return result;
}

- (id)_shadowLayer
{
  return -[_UIStackedImageContainerLayer _shadowLayer](self->_imageStackLayer, "_shadowLayer");
}

- (id)_layeredImageContainerLayer
{
  return self->_imageStackLayer;
}

- (int64_t)_selectionStyle
{
  return (int64_t)-[_UIStackedImageContainerLayer _selectionStyle](self->_imageStackLayer, "_selectionStyle");
}

- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4
{
}

- (void)_setIdleModeFocusSizeOffset:(double)a3
{
}

- (void)_setImageStackContentsGravity:(id)a3
{
}

- (void)_setPressedDuration:(double)a3
{
}

- (void)_setPressedScaleAdjustment:(double)a3
{
}

- (void)_setSelectionStyle:(int64_t)a3
{
}

- (void)_setUnpressedDuration:(double)a3
{
}

- (double)_unpressedDuration
{
  return result;
}

- (void)_updateStackedImageConfiguration
{
  if (!self->_imageStackConfig)
  {
    double v3 = -[TVPImageStackView _newImageConfiguration](self, "_newImageConfiguration");
    imageStackConfig = self->_imageStackConfig;
    self->_imageStackConfig = v3;

    -[_UIStackedImageConfiguration layerSelectionDuration](self->_imageStackConfig, "layerSelectionDuration");
    self->_layerSelectionDuration = v5;
    -[_UIStackedImageConfiguration layerUnselectionDuration](self->_imageStackConfig, "layerUnselectionDuration");
    self->_layerUnselectionDuration = v6;
    -[_UIStackedImageConfiguration shadowSelectionDuration](self->_imageStackConfig, "shadowSelectionDuration");
    self->_shadowSelectionDuration = v7;
    -[_UIStackedImageConfiguration shadowUnselectionDuration](self->_imageStackConfig, "shadowUnselectionDuration");
    self->_shadowUnselectionDuration = v8;
    -[_UIStackedImageConfiguration repositionUnselectionDuration]( self->_imageStackConfig,  "repositionUnselectionDuration");
    self->_double repositionUnselectionDuration = v9;
  }

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    double repositionUnselectionDuration = 0.0;
    -[_UIStackedImageConfiguration setLayerSelectionDuration:]( self->_imageStackConfig,  "setLayerSelectionDuration:",  0.0);
    -[_UIStackedImageConfiguration setLayerUnselectionDuration:]( self->_imageStackConfig,  "setLayerUnselectionDuration:",  0.0);
    -[_UIStackedImageConfiguration setShadowSelectionDuration:]( self->_imageStackConfig,  "setShadowSelectionDuration:",  0.0);
    -[_UIStackedImageConfiguration setShadowUnselectionDuration:]( self->_imageStackConfig,  "setShadowUnselectionDuration:",  0.0);
  }

  else
  {
    -[_UIStackedImageConfiguration setLayerSelectionDuration:]( self->_imageStackConfig,  "setLayerSelectionDuration:",  self->_layerSelectionDuration);
    -[_UIStackedImageConfiguration setLayerUnselectionDuration:]( self->_imageStackConfig,  "setLayerUnselectionDuration:",  self->_layerUnselectionDuration);
    -[_UIStackedImageConfiguration setShadowSelectionDuration:]( self->_imageStackConfig,  "setShadowSelectionDuration:",  self->_shadowSelectionDuration);
    -[_UIStackedImageConfiguration setShadowUnselectionDuration:]( self->_imageStackConfig,  "setShadowUnselectionDuration:",  self->_shadowUnselectionDuration);
    double repositionUnselectionDuration = self->_repositionUnselectionDuration;
  }

  id v11 = -[_UIStackedImageConfiguration setRepositionUnselectionDuration:]( self->_imageStackConfig,  "setRepositionUnselectionDuration:",  repositionUnselectionDuration);
  -[_UIStackedImageContainerLayer setConfiguration:]( self->_imageStackLayer,  "setConfiguration:",  self->_imageStackConfig);
}

+ (CGSize)_scaledSizeForSize:(CGSize)a3 selectionStyle:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = +[_UIStackedImageConfiguration newStandardConfiguration]( &OBJC_CLASS____UIStackedImageConfiguration,  "newStandardConfiguration");
  [v8 scaleSizeIncrease];
  objc_msgSend(a1, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", a4, width, height, v9);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

+ (CGSize)_scaledSizeForSize:(CGSize)a3 focusSizeIncrease:(double)a4 selectionStyle:(int64_t)a5
{
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  return -[_UIStackedImageConfiguration focusAnimationConfiguration]( self->_imageStackConfig,  "focusAnimationConfiguration",  a3,  a4);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIView)unmaskedOverlayView
{
  return self->_unmaskedOverlayView;
}

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (void)setImageLoaded:(BOOL)a3
{
  self->_imageLoaded = a3;
}

- (void).cxx_destruct
{
}

@end