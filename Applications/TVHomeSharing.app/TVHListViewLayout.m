@interface TVHListViewLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (TVHListViewLayout)init;
- (int64_t)developmentLayoutDirection;
- (void)setScrollDirection:(int64_t)a3;
@end

@implementation TVHListViewLayout

- (TVHListViewLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHListViewLayout;
  v2 = -[TVHListViewLayout init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[TVHListViewLayout setScrollDirection:](v2, "setScrollDirection:", 0LL);
    -[TVHListViewLayout setItemSize:](v3, "setItemSize:", 894.0, 70.0);
    -[TVHListViewLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 16.0);
  }

  return v3;
}

- (void)setScrollDirection:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHListViewLayout;
  -[TVHListViewLayout setScrollDirection:](&v3, "setScrollDirection:", a3);
}

- (int64_t)developmentLayoutDirection
{
  return 0LL;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

@end