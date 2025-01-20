@interface VOTCustomActionCategory
- (NSMutableArray)actions;
- (NSString)categoryName;
- (VOTCustomActionCategory)init;
- (void)setCategoryName:(id)a3;
@end

@implementation VOTCustomActionCategory

- (VOTCustomActionCategory)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VOTCustomActionCategory;
  v2 = -[VOTCustomActionCategory init](&v6, "init");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  actions = v2->_actions;
  v2->_actions = (NSMutableArray *)v3;

  return v2;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
}

@end