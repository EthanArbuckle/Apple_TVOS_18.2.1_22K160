@interface NSSQLOptLockKey
- (NSSQLOptLockKey)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)name;
@end

@implementation NSSQLOptLockKey

- (NSSQLOptLockKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSSQLOptLockKey;
  v4 = -[NSSQLColumn initWithEntity:propertyDescription:](&v8, sel_initWithEntity_propertyDescription_, a3, 0LL);
  v5 = v4;
  if (v4)
  {
    v4->super.super._propertyType = 6;
    columnName = (__CFString *)v4->super._columnName;
    if (columnName != @"Z_OPT")
    {

      v5->super._columnName = (NSString *)[@"Z_OPT" copy];
    }

    v5->super.super._sqlType = 2;
  }

  return v5;
}

- (id)name
{
  return @"_opt";
}

@end