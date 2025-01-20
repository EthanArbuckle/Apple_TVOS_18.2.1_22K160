@interface TVHSimpleLockupShelfViewLayout
+ (id)shelfViewLayoutWithContentViewSize:(CGSize)a3;
+ (id)shelfViewLayoutWithContentViewSize:(CGSize)a3 footerLayoutType:(unint64_t)a4;
- (TVHSimpleLockupLayout)lockupLayout;
- (void)setLockupLayout:(id)a3;
@end

@implementation TVHSimpleLockupShelfViewLayout

+ (id)shelfViewLayoutWithContentViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupLayout);
  -[TVHSimpleLockupLayout setContentViewSize:](v6, "setContentViewSize:", width, height);
  id v7 = objc_alloc_init((Class)objc_opt_class(a1));
  [v7 setLockupLayout:v6];

  return v7;
}

+ (id)shelfViewLayoutWithContentViewSize:(CGSize)a3 footerLayoutType:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupFooterViewLayout);
  -[TVHSimpleLockupFooterViewLayout setType:](v8, "setType:", a4);
  v9 = objc_alloc_init(&OBJC_CLASS___TVHSimpleLockupLayout);
  -[TVHSimpleLockupLayout setContentViewSize:](v9, "setContentViewSize:", width, height);
  -[TVHSimpleLockupLayout setFooterViewLayout:](v9, "setFooterViewLayout:", v8);
  id v10 = objc_alloc_init((Class)objc_opt_class(a1));
  [v10 setLockupLayout:v9];

  return v10;
}

- (void)setLockupLayout:(id)a3
{
  id v5 = a3;
  if (!-[TVHSimpleLockupLayout isEqual:](self->_lockupLayout, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_lockupLayout, a3);
    [v5 lockupSize];
    -[TVHShelfViewLayout setItemSize:](self, "setItemSize:");
  }
}

- (TVHSimpleLockupLayout)lockupLayout
{
  return self->_lockupLayout;
}

- (void).cxx_destruct
{
}

@end