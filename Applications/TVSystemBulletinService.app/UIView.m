@interface UIView
+ (id)_tvsb_colorForDebugLayoutColorType:(unint64_t)a3;
- (void)tvsb_setDebugLayoutColorType:(unint64_t)a3;
@end

@implementation UIView

- (void)tvsb_setDebugLayoutColorType:(unint64_t)a3
{
  v8 = self;
  SEL v7 = a2;
  unint64_t v6 = a3;
  if ((sub_10000ECFC() & 1) != 0)
  {
    v5 = -[UIView layer](v8, "layer");
    v3 = (void *)objc_opt_class(v8);
    id v4 = objc_msgSend(v3, "_tvsb_colorForDebugLayoutColorType:", v6);
    -[CALayer setBorderColor:](v5, "setBorderColor:", [v4 CGColor]);
    -[CALayer setBorderWidth:](v5, "setBorderWidth:", 1.0);
    objc_storeStrong(&v4, 0LL);
    objc_storeStrong((id *)&v5, 0LL);
  }

+ (id)_tvsb_colorForDebugLayoutColorType:(unint64_t)a3
{
  v9 = (dispatch_once_t *)&unk_100036828;
  id location = 0LL;
  objc_storeStrong(&location, &stru_10002C878);
  if (*v9 != -1) {
    dispatch_once(v9, location);
  }
  objc_storeStrong(&location, 0LL);
  id v4 = (void *)qword_100036820;
  v5 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3);
  id v6 = objc_msgSend(v4, "objectForKey:");

  return v6;
}

@end