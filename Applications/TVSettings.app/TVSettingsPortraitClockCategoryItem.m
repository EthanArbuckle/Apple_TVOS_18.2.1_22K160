@interface TVSettingsPortraitClockCategoryItem
+ (id)cityscapesCategoryID;
+ (id)natureCategoryID;
+ (id)peopleCategoryID;
+ (id)petsCategoryID;
- (BOOL)isCategoryFilterEnabled;
- (BOOL)isPeopleCategory;
- (NSString)categoryFilter;
- (TVSettingsPortraitClockCategoryItem)initWithCategoryModel:(id)a3;
- (void)setCategoryFilter:(id)a3;
@end

@implementation TVSettingsPortraitClockCategoryItem

- (TVSettingsPortraitClockCategoryItem)initWithCategoryModel:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsPortraitClockCategoryItem;
  v5 = -[TVSettingsAmbientItem initWithModel:](&v11, "initWithModel:", v4);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 categoryFilter]);
    categoryFilter = v5->_categoryFilter;
    v5->_categoryFilter = (NSString *)v6;

    identifier = v5->super._identifier;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPortraitClockCategoryItem peopleCategoryID]( &OBJC_CLASS___TVSettingsPortraitClockCategoryItem,  "peopleCategoryID"));
    v5->_isPeopleCategory = -[NSString isEqualToString:](identifier, "isEqualToString:", v9);
  }

  return v5;
}

+ (id)peopleCategoryID
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", 804LL);
}

+ (id)petsCategoryID
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", 803LL);
}

+ (id)natureCategoryID
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", 801LL);
}

+ (id)cityscapesCategoryID
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", 802LL);
}

- (BOOL)isCategoryFilterEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPortraitClockCategoryItem categoryFilter](self, "categoryFilter"));
  if (v3 == (void *)TVISPortraitClockCategoryFilterAll)
  {
    BOOL v5 = 1;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPortraitClockCategoryItem categoryFilter](self, "categoryFilter"));
    BOOL v5 = v4 == (void *)TVISPortraitClockCategoryFilterFavorites;
  }

  return v5;
}

- (NSString)categoryFilter
{
  return self->_categoryFilter;
}

- (void)setCategoryFilter:(id)a3
{
}

- (BOOL)isPeopleCategory
{
  return self->_isPeopleCategory;
}

- (void).cxx_destruct
{
}

@end