@interface _XBWrapperWindow
+ (BOOL)_isSecure;
- (BOOL)_alwaysGetsContexts;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_shouldResizeWithScene;
- (BOOL)_shouldUseRemoteContext;
- (UIEdgeInsets)safeAreaInsets;
- (XBDisplayEdgeInsetsWrapper)_customSafeAreaInsets;
- (int64_t)_orientationForRootTransform;
- (int64_t)_orientationForViewTransform;
- (void)_setCustomSafeAreaInsets:(id)a3;
@end

@implementation _XBWrapperWindow

- (BOOL)_shouldUseRemoteContext
{
  return 1;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 1;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (BOOL)_shouldResizeWithScene
{
  return 0;
}

- (int64_t)_orientationForViewTransform
{
  return 1LL;
}

- (int64_t)_orientationForRootTransform
{
  return 1LL;
}

- (UIEdgeInsets)safeAreaInsets
{
  if (self->_customSafeAreaInsets)
  {
    -[XBDisplayEdgeInsetsWrapper edgeInsets](self->_customSafeAreaInsets, "edgeInsets");
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS____XBWrapperWindow;
    -[_XBWrapperWindow safeAreaInsets](&v6, "safeAreaInsets");
  }

  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (XBDisplayEdgeInsetsWrapper)_customSafeAreaInsets
{
  return self->_customSafeAreaInsets;
}

- (void)_setCustomSafeAreaInsets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end