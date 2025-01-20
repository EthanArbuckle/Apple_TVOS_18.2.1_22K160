@interface TPCategoryRule
+ (BOOL)supportsSecureCoding;
+ (id)ruleWithPrefix:(id)a3 category:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCategoryRule:(id)a3;
- (NSString)category;
- (NSString)prefix;
- (TPCategoryRule)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setPrefix:(id)a3;
@end

@implementation TPCategoryRule

- (BOOL)isEqualToCategoryRule:(id)a3
{
  v4 = (TPCategoryRule *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }

  else
  {
    v5 = -[TPCategoryRule prefix](self, "prefix");
    v6 = -[TPCategoryRule prefix](v4, "prefix");
    if ([v5 isEqualToString:v6])
    {
      v7 = -[TPCategoryRule category](self, "category");
      v8 = -[TPCategoryRule category](v4, "category");
      char v9 = [v7 isEqualToString:v8];
    }

    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TPCategoryRule *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPCategoryRule isEqualToCategoryRule:](self, "isEqualToCategoryRule:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  -[TPCategoryRule category](self, "category");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = (void *)NSString;
  -[TPCategoryRule prefix](self, "prefix");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPCategoryRule category](self, "category");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<TPCategoryRule: %@:%@>", v4, v5];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[TPCategoryRule prefix](self, "prefix");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"prefix"];

  -[TPCategoryRule category](self, "category");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"category"];
}

- (TPCategoryRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TPCategoryRule;
  BOOL v5 = -[TPCategoryRule init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prefix"];
    prefix = v5->_prefix;
    v5->_prefix = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v8;
  }

  return v5;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)ruleWithPrefix:(id)a3 category:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___TPCategoryRule);
  -[TPCategoryRule setPrefix:](v7, "setPrefix:", v6);

  -[TPCategoryRule setCategory:](v7, "setCategory:", v5);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end