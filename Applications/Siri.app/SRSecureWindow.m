@interface SRSecureWindow
+ (BOOL)_isSecure;
- (BOOL)contextMenuIsPresented;
- (void)didAddSubview:(id)a3;
- (void)setContextMenuIsPresented:(BOOL)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation SRSecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (void)didAddSubview:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SRSecureWindow;
  id v4 = a3;
  -[SRSecureWindow didAddSubview:](&v7, "didAddSubview:", v4);
  Class v5 = NSClassFromString(@"_UIContextMenuContainerView");
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0) {
    -[SRSecureWindow setContextMenuIsPresented:](self, "setContextMenuIsPresented:", 1LL, v7.receiver, v7.super_class);
  }
}

- (void)willRemoveSubview:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SRSecureWindow;
  id v4 = a3;
  -[SRSecureWindow willRemoveSubview:](&v7, "willRemoveSubview:", v4);
  Class v5 = NSClassFromString(@"_UIContextMenuContainerView");
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0) {
    -[SRSecureWindow setContextMenuIsPresented:](self, "setContextMenuIsPresented:", 0LL, v7.receiver, v7.super_class);
  }
}

- (BOOL)contextMenuIsPresented
{
  return self->_contextMenuIsPresented;
}

- (void)setContextMenuIsPresented:(BOOL)a3
{
  self->_contextMenuIsPresented = a3;
}

@end