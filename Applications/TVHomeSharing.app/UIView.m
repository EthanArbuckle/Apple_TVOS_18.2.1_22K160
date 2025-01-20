@interface UIView
- (void)tvh_safeAddSubview:(id)a3;
@end

@implementation UIView

- (void)tvh_safeAddSubview:(id)a3
{
  if (a3) {
    -[UIView addSubview:](self, "addSubview:");
  }
}

@end