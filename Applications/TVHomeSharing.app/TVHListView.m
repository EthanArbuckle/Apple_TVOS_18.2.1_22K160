@interface TVHListView
+ (TVHListView)new;
- (TVHListView)init;
- (TVHListView)initWithCoder:(id)a3;
- (TVHListView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (TVHListView)initWithFrame:(CGRect)a3 itemSize:(CGSize)a4;
- (TVHListView)initWithFrame:(CGRect)a3 listViewLayout:(id)a4;
@end

@implementation TVHListView

+ (TVHListView)new
{
  return 0LL;
}

- (TVHListView)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHListView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHListView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHListView)initWithFrame:(CGRect)a3 listViewLayout:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHListView;
  return -[TVHCollectionView initWithFrame:collectionViewLayout:]( &v5,  "initWithFrame:collectionViewLayout:",  a4,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (TVHListView)initWithFrame:(CGRect)a3 itemSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.size.height;
  double v7 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11 = objc_alloc_init(&OBJC_CLASS___TVHListViewLayout);
  v12 = v11;
  if (width != CGSizeZero.width || height != CGSizeZero.height) {
    -[TVHListViewLayout setItemSize:](v11, "setItemSize:", width, height);
  }
  v14 = -[TVHListView initWithFrame:listViewLayout:](self, "initWithFrame:listViewLayout:", v12, x, y, v7, v6);

  return v14;
}

@end