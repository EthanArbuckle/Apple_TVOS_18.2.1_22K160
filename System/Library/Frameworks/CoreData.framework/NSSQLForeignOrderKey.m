@interface NSSQLForeignOrderKey
- (NSSQLForeignOrderKey)initWithEntity:(id)a3 foreignKey:(id)a4;
- (NSSQLForeignOrderKey)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)foreignKey;
- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4;
- (id)name;
- (id)toOneRelationship;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLForeignOrderKey

- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSQLForeignOrderKey;
  v5 = -[NSSQLColumn initWithEntity:propertyDescription:](&v9, sel_initWithEntity_propertyDescription_, a3, 0LL);
  v6 = v5;
  if (v5)
  {
    v5->super.super._propertyType = 10;
    v5->_foreignKey = (NSSQLForeignKey *)[a4 foreignKey];
    columnName = (__CFString *)v6->super._columnName;
    if (columnName != @"Z_ENT")
    {

      v6->super._columnName = (NSString *)[@"Z_ENT" copy];
    }

    v6->super.super._sqlType = 1;
  }

  return v6;
}

- (void)dealloc
{
  self->_foreignKey = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLForeignOrderKey;
  -[NSSQLColumn dealloc](&v3, sel_dealloc);
}

- (NSSQLForeignOrderKey)initWithEntity:(id)a3 foreignKey:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSSQLForeignOrderKey;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v17, sel_initWithEntity_propertyDescription_, a3, 0LL);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 10;
    v6->_foreignKey = (NSSQLForeignKey *)a4;
    id v8 = -[NSSQLForeignOrderKey toOneRelationship](v6, "toOneRelationship");
    objc_super v9 = (void *)[objc_alloc(NSString) initWithFormat:@"%@_%@", @"Z_FOK", objc_msgSend((id)objc_msgSend(v8, "name"), "uppercaseString")];
    if (a3) {
      uint64_t v10 = *((void *)a3 + 22);
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v11 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v10, v9);
    columnName = v7->super._columnName;
    if (columnName != (NSString *)v11)
    {
      v13 = (void *)v11;

      v7->super._columnName = (NSString *)[v13 copy];
    }

    v14 = (NSString *)[objc_alloc(NSString) initWithFormat:@"_%@", v7->super._columnName];
    name = v7->_name;
    if (name != v14)
    {

      v7->_name = (NSString *)-[NSString copy](v14, "copy");
    }

    v7->super.super._sqlType = 1;
  }

  return v7;
}

- (NSSQLForeignOrderKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  uint64_t v6 = [a4 name];
  if (a3) {
    v7 = (void *)[*((id *)a3 + 5) objectForKey:v6];
  }
  else {
    v7 = 0LL;
  }
  return -[NSSQLForeignOrderKey initWithEntity:foreignKey:]( self,  "initWithEntity:foreignKey:",  a3,  [v7 foreignKey]);
}

- (id)toOneRelationship
{
  return (id)objc_msgSend(-[NSSQLForeignOrderKey foreignKey](self, "foreignKey"), "toOneRelationship");
}

- (id)foreignKey
{
  return self->_foreignKey;
}

- (id)name
{
  return self->_name;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSQLForeignOrderKey;
  -[NSSQLColumn copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
}

@end