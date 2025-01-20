@interface NSSQLForeignKey
- (NSSQLForeignKey)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (NSSQLForeignKey)initWithEntity:(id)a3 toOneRelationship:(id)a4;
- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4;
- (id)name;
- (id)toOneRelationship;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLForeignKey

- (id)initForReadOnlyFetchingOfEntity:(id)a3 toOneRelationship:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSSQLForeignKey;
  v5 = -[NSSQLColumn initWithEntity:propertyDescription:](&v10, sel_initWithEntity_propertyDescription_, a3, 0LL);
  v6 = v5;
  if (v5)
  {
    v5->super.super._propertyType = 3;
    v5->_toOne = (NSSQLToOne *)a4;
    columnName = (__CFString *)v5->super._columnName;
    if (columnName != @"Z_PK")
    {

      v6->super._columnName = (NSString *)[@"Z_PK" copy];
    }

    name = (__CFString *)v6->_name;
    if (name != @"_pk")
    {

      v6->_name = (NSString *)[@"_pk" copy];
    }

    v6->super.super._sqlType = 2;
  }

  return v6;
}

- (void)dealloc
{
  self->_toOne = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLForeignKey;
  -[NSSQLColumn dealloc](&v3, sel_dealloc);
}

- (id)toOneRelationship
{
  return self->_toOne;
}

- (NSSQLForeignKey)initWithEntity:(id)a3 toOneRelationship:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NSSQLForeignKey;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v16, sel_initWithEntity_propertyDescription_, a3, 0LL);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 3;
    v6->_toOne = (NSSQLToOne *)a4;
    v8 = (void *)[objc_alloc(NSString) initWithFormat:@"%@%@", @"Z", objc_msgSend((id)objc_msgSend(a4, "name"), "uppercaseString")];
    if (a3) {
      uint64_t v9 = *((void *)a3 + 22);
    }
    else {
      uint64_t v9 = 0LL;
    }
    uint64_t v10 = -[NSSQLStoreMappingGenerator uniqueNameWithBase:](v9, v8);
    columnName = v7->super._columnName;
    if (columnName != (NSString *)v10)
    {
      v12 = (void *)v10;

      v7->super._columnName = (NSString *)[v12 copy];
    }

    v13 = (NSString *)[objc_alloc(NSString) initWithFormat:@"_%@", v7->super._columnName];
    name = v7->_name;
    if (name != v13)
    {

      v7->_name = (NSString *)-[NSString copy](v13, "copy");
    }

    v7->super.super._sqlType = 2;
  }

  return v7;
}

- (NSSQLForeignKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  uint64_t v6 = [a4 name];
  if (a3) {
    uint64_t v7 = [*((id *)a3 + 5) objectForKey:v6];
  }
  else {
    uint64_t v7 = 0LL;
  }
  return -[NSSQLForeignKey initWithEntity:toOneRelationship:](self, "initWithEntity:toOneRelationship:", a3, v7);
}

- (id)name
{
  return self->_name;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSQLForeignKey;
  -[NSSQLColumn copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_toOne = (NSSQLToOne *)[a3 toOneRelationship];
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
}

@end