@interface VOTVisionOptions
- (BOOL)includeFullImageDescriptionsForAllElements;
- (BOOL)includeFullImageDescriptionsForValidElements;
- (BOOL)includeSceneDetection;
- (BOOL)userCommandInitiated;
- (VOTVisionOptions)init;
- (void)setIncludeFullImageDescriptionsForAllElements:(BOOL)a3;
- (void)setIncludeFullImageDescriptionsForValidElements:(BOOL)a3;
- (void)setIncludeSceneDetection:(BOOL)a3;
- (void)setUserCommandInitiated:(BOOL)a3;
@end

@implementation VOTVisionOptions

- (VOTVisionOptions)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTVisionOptions;
  v2 = -[VOTVisionOptions init](&v4, "init");
  -[VOTVisionOptions setIncludeSceneDetection:](v2, "setIncludeSceneDetection:", 1LL);
  return v2;
}

- (BOOL)includeFullImageDescriptionsForValidElements
{
  return self->_includeFullImageDescriptionsForValidElements;
}

- (void)setIncludeFullImageDescriptionsForValidElements:(BOOL)a3
{
  self->_includeFullImageDescriptionsForValidElements = a3;
}

- (BOOL)includeFullImageDescriptionsForAllElements
{
  return self->_includeFullImageDescriptionsForAllElements;
}

- (void)setIncludeFullImageDescriptionsForAllElements:(BOOL)a3
{
  self->_includeFullImageDescriptionsForAllElements = a3;
}

- (BOOL)includeSceneDetection
{
  return self->_includeSceneDetection;
}

- (void)setIncludeSceneDetection:(BOOL)a3
{
  self->_includeSceneDetection = a3;
}

- (BOOL)userCommandInitiated
{
  return self->_userCommandInitiated;
}

- (void)setUserCommandInitiated:(BOOL)a3
{
  self->_userCommandInitiated = a3;
}

@end