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
  v7.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlayAppleLogo;
  v4 = -[BKDisplayBootUIRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  v5 = v4;
  if (v4) {
    -[BKDisplayRenderOverlay _setType:](v4, "_setType:", 3LL);
  }
  return v5;
}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  v4 = objc_alloc(&OBJC_CLASS___PUIProgressWindow);
  -[BKDisplayRenderOverlay level](self, "level");
  v5 = -[PUIProgressWindow initWithProgressBarVisibility:createContext:contextLevel:appearance:]( v4,  "initWithProgressBarVisibility:createContext:contextLevel:appearance:",  0LL,  0LL,  0LL);
  puiProgressWindow = self->_puiProgressWindow;
  self->_puiProgressWindow = v5;

  -[PUIProgressWindow setVisible:](self->_puiProgressWindow, "setVisible:", 1LL);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PUIProgressWindow layer](self->_puiProgressWindow, "layer"));
  objc_msgSend(v7, "setDisableUpdateMask:", objc_msgSend(v7, "disableUpdateMask") | 0x10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay display](self, "display"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueId]);

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
  v10.super_class = (Class)&OBJC_CLASS___BKDisplayRenderOverlayAppleLogo;
  id v4 = -[BKDisplayBootUIRenderOverlay descriptionBuilderWithMultilinePrefix:]( &v10,  "descriptionBuilderWithMultilinePrefix:",  a3);
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
  objc_super v7 = objc_alloc(&OBJC_CLASS___BKSDisplayRenderOverlayDescriptor);
  v9 = (objc_class *)objc_opt_class(a1, v8);
  objc_super v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[BKSDisplayRenderOverlayDescriptor initWithName:display:](v7, "initWithName:display:", v11, v6);

  -[BKSDisplayRenderOverlayDescriptor setLockBacklight:](v12, "setLockBacklight:", 0LL);
  v13 = objc_alloc(&OBJC_CLASS___BKDisplayRenderOverlayAppleLogo);
  *(float *)&double v14 = a3;
  v15 = -[BKDisplayRenderOverlayAppleLogo initWithOverlayDescriptor:level:]( v13,  "initWithOverlayDescriptor:level:",  v12,  v14);

  return v15;
}

@end