@interface BKDisplayRenderOverlayAppleLogo
+ (id)overlayWithLevel:(float)a3 display:(id)a4;
- (BKDisplayRenderOverlayAppleLogo)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (id)_prepareContentLayerForPresentation:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_cleanUpContentLayer;
@end

@implementation BKDisplayRenderOverlayAppleLogo

- (BKDisplayRenderOverlayAppleLogo)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  v7.receiver = self;
  v7.super_class = [BKDisplayRenderOverlayAppleLogo class];
  v4 = [BKDisplayBootUIRenderOverlay initWithOverlayDescriptor:a3 level:v7];
  v5 = v4;
  if (v4) {
    [v4 _setType:3];
  }
  return v5;
}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  PUIProgressWindow *v4 = [[PUIProgressWindow alloc] init];
  [self level];
  PUIProgressWindow *v5 = [[PUIProgressWindow alloc] initWithProgressBarVisibility:0LL createContext:0LL contextLevel:0LL appearance:0LL];
  puiProgressWindow = self->_puiProgressWindow;
  self->_puiProgressWindow = v5;

  [self->_puiProgressWindow setVisible:YES];
  CALayer *v7 = [self->_puiProgressWindow layer];
  [v7 setDisableUpdateMask:[v7 disableUpdateMask] | 0x10];
  BKDisplayRenderOverlay *v8 = [v9 display];
  v9 = [v8 uniqueId];

  sub_10001A604(v9);
  return v7;
}

- (void)_cleanUpContentLayer
{
  puiProgressWindow = self->_puiProgressWindow;
  self->_puiProgressWindow = 0LL;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = [BKDisplayRenderOverlayAppleLogo class];
  NSString *v4 = [v10 descriptionBuilderWithMultilinePrefix:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  puiProgressWindow = self->_puiProgressWindow;
  if (puiProgressWindow) {
    id v8 = [v5 appendObject:puiProgressWindow withName:@"puiProgressWindow"];
  }
  return v6;
}

- (void).cxx_destruct
{
}

+ (id)overlayWithLevel:(float)a3 display:(id)a4
{
  id v6 = a4;
  BKSDisplayRenderOverlayDescriptor *v7 = [[BKSDisplayRenderOverlayDescriptor alloc] init];
  v9 = [a1 class];
  objc_super v10 = NSStringFromClass(v9);
  v11 = [v10 autorelease];
  BKSDisplayRenderOverlayDescriptor *v12 = [[BKSDisplayRenderOverlayDescriptor alloc] initWithName:v11 display:v6];

  [v12 setLockBacklight:0LL];
  BKDisplayRenderOverlayAppleLogo *v13 = [[BKDisplayRenderOverlayAppleLogo alloc] init];
  float v14 = a3;
  BKDisplayRenderOverlayAppleLogo *v15 = [[BKDisplayRenderOverlayAppleLogo alloc] initWithOverlayDescriptor:v12 level:v14];

  return v15;
}

@end