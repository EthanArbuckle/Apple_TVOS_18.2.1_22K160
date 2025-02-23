@interface NSSQLPrimaryKey
- (NSSQLPrimaryKey)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)name;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLPrimaryKey

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSQLPrimaryKey;
  -[NSSQLColumn copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
}

- (id)name
{
  return self->_name;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLPrimaryKey;
  -[NSSQLColumn dealloc](&v3, sel_dealloc);
}

- (NSSQLPrimaryKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSQLPrimaryKey;
  v4 = -[NSSQLColumn initWithEntity:propertyDescription:](&v9, sel_initWithEntity_propertyDescription_, a3, 0LL);
  objc_super v5 = v4;
  if (v4)
  {
    v4->super.super._propertyType = 2;
    columnName = (__CFString *)v4->super._columnName;
    if (columnName != @"Z_PK")
    {

      v5->super._columnName = (NSString *)[@"Z_PK" copy];
    }

    name = (__CFString *)v5->_name;
    if (name != @"_pk")
    {

      v5->_name = (NSString *)[@"_pk" copy];
    }

    v5->super.super._sqlType = 2;
  }

  return v5;
}

@end