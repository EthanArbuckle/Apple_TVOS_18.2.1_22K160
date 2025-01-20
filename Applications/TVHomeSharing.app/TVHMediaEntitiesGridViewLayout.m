@interface TVHMediaEntitiesGridViewLayout
+ (id)mediaEntitiesGridViewLayoutWithImageSize:(CGSize)a3;
+ (id)mediaEntitiesGridViewLayoutWithImageSize:(CGSize)a3 footerLayoutType:(unint64_t)a4;
+ (id)mediaEntitiesGridViewLayoutWithImageSizes:(id)a3 footerLayoutType:(unint64_t)a4;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (NSDictionary)lockupLayoutByMediaEntityType;
- (NSDictionary)minimumInteritemSpacingByFetchRequestIdentifier;
- (NSDictionary)minimumLineSpacingByFetchRequestIdentifier;
- (TVHMediaEntitiesGridViewLayout)init;
- (TVHSimpleLockupLayout)lockupLayout;
- (int64_t)developmentLayoutDirection;
- (void)setLockupLayout:(id)a3;
- (void)setLockupLayoutByMediaEntityType:(id)a3;
- (void)setMinimumInteritemSpacingByFetchRequestIdentifier:(id)a3;
- (void)setMinimumLineSpacingByFetchRequestIdentifier:(id)a3;
- (void)setScrollDirection:(int64_t)a3;
@end

@implementation TVHMediaEntitiesGridViewLayout

+ (id)mediaEntitiesGridViewLayoutWithImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupLayout);
  -[TVHSimpleLockupLayout setContentViewSize:](v5, "setContentViewSize:", width, height);
  v6 = objc_alloc_init(&OBJC_CLASS___TVHMediaEntitiesGridViewLayout);
  -[TVHMediaEntitiesGridViewLayout setLockupLayout:](v6, "setLockupLayout:", v5);

  return v6;
}

+ (id)mediaEntitiesGridViewLayoutWithImageSize:(CGSize)a3 footerLayoutType:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupFooterViewLayout);
  -[TVHSimpleLockupFooterViewLayout setType:](v7, "setType:", a4);
  v8 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupLayout);
  -[TVHSimpleLockupLayout setContentViewSize:](v8, "setContentViewSize:", width, height);
  -[TVHSimpleLockupLayout setFooterViewLayout:](v8, "setFooterViewLayout:", v7);
  v9 = objc_alloc_init(&OBJC_CLASS___TVHMediaEntitiesGridViewLayout);
  -[TVHMediaEntitiesGridViewLayout setLockupLayout:](v9, "setLockupLayout:", v8);

  return v9;
}

+ (id)mediaEntitiesGridViewLayoutWithImageSizes:(id)a3 footerLayoutType:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupFooterViewLayout);
  -[TVHSimpleLockupFooterViewLayout setType:](v6, "setType:", a4);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_10008420C;
  v14 = &unk_1000FF790;
  v15 = v6;
  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v7 = v16;
  v8 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v11];

  v9 = objc_alloc_init(&OBJC_CLASS___TVHMediaEntitiesGridViewLayout);
  -[TVHMediaEntitiesGridViewLayout setLockupLayoutByMediaEntityType:]( v9,  "setLockupLayoutByMediaEntityType:",  v7,  v11,  v12,  v13,  v14);

  return v9;
}

- (TVHMediaEntitiesGridViewLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesGridViewLayout;
  v2 = -[TVHMediaEntitiesGridViewLayout init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[TVHMediaEntitiesGridViewLayout setScrollDirection:](v2, "setScrollDirection:", 0LL);
    -[TVHMediaEntitiesGridViewLayout setItemSize:](v3, "setItemSize:", 308.0, 308.0);
    -[TVHMediaEntitiesGridViewLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 63.0);
    -[TVHMediaEntitiesGridViewLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 50.0);
  }

  return v3;
}

- (void)setLockupLayout:(id)a3
{
  id v5 = a3;
  if (!-[TVHSimpleLockupLayout isEqual:](self->_lockupLayout, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_lockupLayout, a3);
    [v5 lockupSize];
    -[TVHMediaEntitiesGridViewLayout setItemSize:](self, "setItemSize:");
  }
}

- (void)setScrollDirection:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesGridViewLayout;
  -[TVHMediaEntitiesGridViewLayout setScrollDirection:](&v3, "setScrollDirection:", a3);
}

- (int64_t)developmentLayoutDirection
{
  return 0LL;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (TVHSimpleLockupLayout)lockupLayout
{
  return self->_lockupLayout;
}

- (NSDictionary)lockupLayoutByMediaEntityType
{
  return self->_lockupLayoutByMediaEntityType;
}

- (void)setLockupLayoutByMediaEntityType:(id)a3
{
}

- (NSDictionary)minimumLineSpacingByFetchRequestIdentifier
{
  return self->_minimumLineSpacingByFetchRequestIdentifier;
}

- (void)setMinimumLineSpacingByFetchRequestIdentifier:(id)a3
{
}

- (NSDictionary)minimumInteritemSpacingByFetchRequestIdentifier
{
  return self->_minimumInteritemSpacingByFetchRequestIdentifier;
}

- (void)setMinimumInteritemSpacingByFetchRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end