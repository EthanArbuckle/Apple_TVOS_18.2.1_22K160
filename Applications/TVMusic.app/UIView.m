@interface UIView
+ (UIView)tvm_focusedView;
- (BOOL)isPreviewPaused;
- (BOOL)tvm_isAncestorFocused;
- (BOOL)tvm_isDescendentFocused;
- (UIView)tvm_focusedView;
- (void)tvm_resetLayerTimingsIfNeeded;
@end

@implementation UIView

- (BOOL)tvm_isDescendentFocused
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusedItem]);

  if (v4) {
    BOOL v5 = +[UIFocusSystem environment:containsEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "environment:containsEnvironment:",  self,  v4);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)tvm_isAncestorFocused
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusedItem]);

  if (v4) {
    BOOL v5 = +[UIFocusSystem environment:containsEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "environment:containsEnvironment:",  v4,  self);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (UIView)tvm_focusedView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusedItem]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UIView, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFocusSystem focusSystemForEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "focusSystemForEnvironment:",  self));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 focusedItem]);
  }

  else
  {
    v8 = 0LL;
  }

  return (UIView *)v8;
}

+ (UIView)tvm_focusedView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 windowScene]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 focusSystem]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 focusedItem]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIView, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v19 delegate]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v18 window]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 windowScene]);
    v12 = v4;
    v13 = v3;
    v14 = v2;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v11 focusSystem]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 focusedItem]);

    v2 = v14;
    v3 = v13;
    v4 = v12;
  }

  else
  {
    v16 = 0LL;
  }

  return (UIView *)v16;
}

- (void)tvm_resetLayerTimingsIfNeeded
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS____UIHostedWindow, v3);
  if ((objc_opt_isKindOfClass(v10, v4) & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    id v6 = [v5 applicationState];

    if (!v6) {
      return;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
    [v7 setTimeOffset:0.0];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
    LODWORD(v9) = 1.0;
    id v10 = v8;
    [v8 setSpeed:v9];
  }
}

- (BOOL)isPreviewPaused
{
  return 1;
}

@end