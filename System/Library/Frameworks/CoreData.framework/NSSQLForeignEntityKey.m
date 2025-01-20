@interface NSSQLForeignEntityKey
- (NSSQLForeignEntityKey)initWithEntity:(id)a3 foreignKey:(id)a4;
- (NSSQLForeignEntityKey)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)foreignKey;
- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4;
- (id)name;
- (id)toOneRelationship;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLForeignEntityKey

- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSSQLForeignEntityKey;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v14, sel_initWithEntity_propertyDescription_, a3, 0LL);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 4;
    v6->_foreignKey = (NSSQLForeignKey *)[a4 foreignKey];
    columnName = (__CFString *)v7->super._columnName;
    if (columnName != @"Z_ENT")
    {

      v7->super._columnName = (NSString *)[@"Z_ENT" copy];
    }

    id v9 = objc_alloc(MEMORY[0x189607968]);
    if (a3) {
      uint64_t v10 = *((unsigned int *)a3 + 46);
    }
    else {
      uint64_t v10 = 0LL;
    }
    v11 = (NSNumber *)[v9 initWithUnsignedInt:v10];
    columnValue = v7->_columnValue;
    if (columnValue != v11)
    {

      v7->_columnValue = (NSNumber *)-[NSNumber copy](v11, "copy");
    }

    v7->super.super._sqlType = 1;
  }

  return v7;
}

- (void)dealloc
{
  self->_foreignKey = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLForeignEntityKey;
  -[NSSQLColumn dealloc](&v3, sel_dealloc);
}

- (NSSQLForeignEntityKey)initWithEntity:(id)a3 foreignKey:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSSQLForeignEntityKey;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v20, sel_initWithEntity_propertyDescription_, a3, 0LL);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 4;
    v6->_foreignKey = (NSSQLForeignKey *)a4;
    id v8 = -[NSSQLForeignEntityKey toOneRelationship](v6, "toOneRelationship");
    id v9 = objc_alloc(NSString);
    uint64_t v10 = [v8 destinationEntity];
    if (v10) {
      uint64_t v11 = *(unsigned int *)(v10 + 184);
    }
    else {
      uint64_t v11 = 0LL;
    }
    v12 = (void *)[v9 initWithFormat:@"%@%d_%@", @"Z", v11, objc_msgSend((id)objc_msgSend(v8, "name"), "uppercaseString")];
    if (a3) {
      uint64_t v13 = *((void *)a3 + 22);
    }
    else {
      uint64_t v13 = 0LL;
    }
    uint64_t v14 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v13, v12);
    columnName = v7->super._columnName;
    if (columnName != (NSString *)v14)
    {
      v16 = (void *)v14;

      v7->super._columnName = (NSString *)[v16 copy];
    }

    v17 = (NSString *)[objc_alloc(NSString) initWithFormat:@"_%@", v7->super._columnName];
    name = v7->_name;
    if (name != v17)
    {

      v7->_name = (NSString *)-[NSString copy](v17, "copy");
    }

    v7->super.super._sqlType = 1;
  }

  return v7;
}

- (NSSQLForeignEntityKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  uint64_t v6 = [a4 name];
  if (a3) {
    v7 = (void *)[*((id *)a3 + 5) objectForKey:v6];
  }
  else {
    v7 = 0LL;
  }
  return -[NSSQLForeignEntityKey initWithEntity:foreignKey:]( self,  "initWithEntity:foreignKey:",  a3,  [v7 foreignKey]);
}

- (id)toOneRelationship
{
  return (id)objc_msgSend(-[NSSQLForeignEntityKey foreignKey](self, "foreignKey"), "toOneRelationship");
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
  v5.super_class = (Class)&OBJC_CLASS___NSSQLForeignEntityKey;
  -[NSSQLColumn copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
}

@end