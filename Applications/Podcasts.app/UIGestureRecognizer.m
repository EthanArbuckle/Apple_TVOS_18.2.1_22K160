@interface UIGestureRecognizer
+ (UIGestureRecognizer)recognizerWithTarget:(id)a3 action:(SEL)a4 pressType:(int64_t)a5;
- (UIGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 pressType:(int64_t)a5;
- (UIGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 pressTypes:(id)a5;
@end

@implementation UIGestureRecognizer

+ (UIGestureRecognizer)recognizerWithTarget:(id)a3 action:(SEL)a4 pressType:(int64_t)a5
{
  id v8 = a3;
  id v9 = [objc_alloc((Class)objc_opt_class(a1)) initWithTarget:v8 action:a4 pressType:a5];

  return (UIGestureRecognizer *)v9;
}

- (UIGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 pressType:(int64_t)a5
{
  v6 = -[UIGestureRecognizer initWithTarget:action:](self, "initWithTarget:action:", a3, a4);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
    v10 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    -[UIGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", v8);
  }

  return v6;
}

- (UIGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 pressTypes:(id)a5
{
  id v8 = a5;
  id v9 = -[UIGestureRecognizer initWithTarget:action:](self, "initWithTarget:action:", a3, a4);
  v10 = v9;
  if (v9) {
    -[UIGestureRecognizer setAllowedPressTypes:](v9, "setAllowedPressTypes:", v8);
  }

  return v10;
}

@end