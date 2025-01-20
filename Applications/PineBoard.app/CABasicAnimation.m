@interface CABasicAnimation
+ (id)pb_animationForKeyPath:(id)a3 withSettings:(id)a4;
@end

@implementation CABasicAnimation

+ (id)pb_animationForKeyPath:(id)a3 withSettings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = [v5 isSpringAnimation];
  v8 = &OBJC_CLASS___CASpringAnimation_ptr;
  if (!v7) {
    v8 = &OBJC_CLASS___CABasicAnimation_ptr;
  }
  id v9 = [(id)objc_opt_class(*v8) animationWithKeyPath:v6];
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  [v5 applyToCAAnimation:v10];
  return v10;
}

@end