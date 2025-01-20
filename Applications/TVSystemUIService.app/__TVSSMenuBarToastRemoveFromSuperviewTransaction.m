@interface __TVSSMenuBarToastRemoveFromSuperviewTransaction
- (UIView)toastView;
- (void)_begin;
- (void)setToastView:(id)a3;
@end

@implementation __TVSSMenuBarToastRemoveFromSuperviewTransaction

- (void)_begin
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS_____TVSSMenuBarToastRemoveFromSuperviewTransaction;
  -[__TVSSMenuBarToastRemoveFromSuperviewTransaction _begin](&v2, "_begin");
  -[UIView removeFromSuperview](v4->_toastView, "removeFromSuperview");
}

- (UIView)toastView
{
  return self->_toastView;
}

- (void)setToastView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end