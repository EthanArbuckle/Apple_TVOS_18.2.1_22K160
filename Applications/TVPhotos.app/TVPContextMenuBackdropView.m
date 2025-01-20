@interface TVPContextMenuBackdropView
+ (Class)layerClass;
- (CABackdropLayer)backdropLayer;
@end

@implementation TVPContextMenuBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CABackdropLayer, a2);
}

- (CABackdropLayer)backdropLayer
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuBackdropView layer](self, "layer"));
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___CABackdropLayer, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v8 handleFailureInMethod:a2, self, @"TVPContextMenuBackgroundView.m", 30, @"%@ should be an instance inheriting from %@, but it is nil", @"self.layer", v12 object file lineNumber description];
LABEL_6:

    return (CABackdropLayer *)v5;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CABackdropLayer, v4);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v14 = (objc_class *)objc_opt_class(&OBJC_CLASS___CABackdropLayer, v13);
    v15 = NSStringFromClass(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "px_descriptionForAssertionMessage"));
    [v8 handleFailureInMethod:a2, self, @"TVPContextMenuBackgroundView.m", 30, @"%@ should be an instance inheriting from %@, but it is %@", @"self.layer", v12, v16 object file lineNumber description];

    goto LABEL_6;
  }

  return (CABackdropLayer *)v5;
}

@end