@interface NSSQLToOne
- (NSSQLToOne)initWithEntity:(id)a3 inverseToMany:(id)a4;
- (NSSQLToOne)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)columnName;
- (id)description;
- (id)foreignKey;
- (id)initForReadOnlyFetchWithEntity:(id)a3 propertyDescription:(id)a4;
- (unsigned)slot;
- (void)_setForeignOrderKey:(id)a3;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
- (void)initWithEntity:(uint64_t)a3 propertyDescription:(void *)a4 virtualForToMany:;
@end

@implementation NSSQLToOne

- (id)initForReadOnlyFetchWithEntity:(id)a3 propertyDescription:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSSQLToOne;
  v6 = -[NSSQLRelationship initForReadOnlyFetchWithEntity:propertyDescription:]( &v10,  sel_initForReadOnlyFetchWithEntity_propertyDescription_);
  v7 = v6;
  if (v6)
  {
    v6[24] = 7;
    v8 = -[NSSQLForeignKey initForReadOnlyFetchingOfEntity:toOneRelationship:]( objc_alloc(&OBJC_CLASS___NSSQLForeignKey),  "initForReadOnlyFetchingOfEntity:toOneRelationship:",  a3,  v6);
    if ([a4 _propertyType] == 4 && v8) {
      v8[1] = a4;
    }
    v7[8] = v8;
    v7[9] = -[NSSQLForeignEntityKey initForReadOnlyFetchingOfEntity:toOneRelationship:]( objc_alloc(&OBJC_CLASS___NSSQLForeignEntityKey),  "initForReadOnlyFetchingOfEntity:toOneRelationship:",  a3,  v7);
    v7[10] = -[NSSQLForeignOrderKey initForReadOnlyFetchingOfEntity:toOneRelationship:]( objc_alloc(&OBJC_CLASS___NSSQLForeignOrderKey),  "initForReadOnlyFetchingOfEntity:toOneRelationship:",  a3,  v7);
  }

  return v7;
}

- (id)foreignKey
{
  return self->_foreignKey;
}

- (id)columnName
{
  return (id)objc_msgSend(-[NSSQLToOne foreignKey](self, "foreignKey"), "columnName");
}

- (void)dealloc
{
  self->_foreignKey = 0LL;
  self->_foreignEntityKey = 0LL;

  self->_foreignOrderKey = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLToOne;
  -[NSSQLRelationship dealloc](&v3, sel_dealloc);
}

- (unsigned)slot
{
  return self->super.super._slot;
}

- (void)initWithEntity:(uint64_t)a3 propertyDescription:(void *)a4 virtualForToMany:
{
  if (!a1) {
    return 0LL;
  }
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_CLASS___NSSQLToOne;
  v6 = objc_msgSendSuper2(&v21, sel_initWithEntity_propertyDescription_, a2, a3);
  if (v6)
  {
    if (a4)
    {
      id v7 = objc_alloc(NSString);
      uint64_t v8 = [a4 sourceEntity];
      if (v8) {
        uint64_t v9 = *(unsigned int *)(v8 + 184);
      }
      else {
        uint64_t v9 = 0LL;
      }
      objc_super v10 = (void *)[v7 initWithFormat:@"%d%@", v9, objc_msgSend(a4, "name")];
      v11 = (void *)v6[5];
      if (v11 != v10)
      {

        v6[5] = [v10 copy];
      }

      *((_BYTE *)v6 + 88) = 1;
    }

    if (*((_BYTE *)v6 + 88))
    {
      __int16 v12 = -1;
    }

    else
    {
      if (a2 && (uint64_t v13 = *(void *)(a2 + 24)) != 0) {
        v14 = *(void **)(v13 + 104);
      }
      else {
        v14 = 0LL;
      }
      __int16 v15 = objc_msgSend(v14, "fastIndexForKnownKey:", objc_msgSend(v6, "name"));
      if (a2) {
        __int16 v16 = *(_WORD *)(a2 + 192);
      }
      else {
        __int16 v16 = 0;
      }
      __int16 v12 = v15 - v16;
    }

    *((_WORD *)v6 + 14) = v12;
    *((_BYTE *)v6 + 24) = 7;
    v17 = -[NSSQLForeignKey initWithEntity:toOneRelationship:]( objc_alloc(&OBJC_CLASS___NSSQLForeignKey),  "initWithEntity:toOneRelationship:",  a2,  v6);
    v6[8] = v17;
    uint64_t v18 = [v6 destinationEntity];
    if (v18)
    {
      v19 = *(void **)(v18 + 152);
      if (v19)
      {
        if ([v19 count]) {
          v6[9] = -[NSSQLForeignEntityKey initWithEntity:foreignKey:]( objc_alloc(&OBJC_CLASS___NSSQLForeignEntityKey),  "initWithEntity:foreignKey:",  a2,  v17);
        }
      }
    }
  }

  return v6;
}

- (NSSQLToOne)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  return (NSSQLToOne *)-[NSSQLToOne initWithEntity:propertyDescription:virtualForToMany:]( self,  (uint64_t)a3,  (uint64_t)a4,  0LL);
}

- (NSSQLToOne)initWithEntity:(id)a3 inverseToMany:(id)a4
{
  return (NSSQLToOne *)-[NSSQLToOne initWithEntity:propertyDescription:virtualForToMany:](self, (uint64_t)a3, 0LL, a4);
}

- (void)_setForeignOrderKey:(id)a3
{
  foreignOrderKey = self->_foreignOrderKey;
  if (foreignOrderKey != a3)
  {

    self->_foreignOrderKey = (NSSQLForeignOrderKey *)a3;
  }

- (id)description
{
  objc_super v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %@ (%@)>", NSStringFromClass(v4), -[NSSQLRelationship name](self, "name"), objc_msgSend(-[NSSQLRelationship destinationEntity](self, "destinationEntity"), "name")];
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSSQLToOne;
  -[NSSQLRelationship copyValuesForReadOnlyFetch:](&v10, sel_copyValuesForReadOnlyFetch_);
  v5 = objc_alloc_init(&OBJC_CLASS___NSSQLForeignKey);
  self->_foreignKey = v5;
  -[NSSQLForeignKey copyValuesForReadOnlyFetch:](v5, "copyValuesForReadOnlyFetch:", [a3 foreignKey]);
  foreignKey = self->_foreignKey;
  id v7 = -[NSSQLProperty propertyDescription](self, "propertyDescription");
  if (foreignKey) {
    foreignKey->super.super._propertyDescription = v7;
  }
  if (a3)
  {
    if (*((void *)a3 + 9))
    {
      uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSSQLForeignEntityKey);
      self->_foreignEntityKey = v8;
      -[NSSQLForeignEntityKey copyValuesForReadOnlyFetch:](v8, "copyValuesForReadOnlyFetch:", *((void *)a3 + 9));
    }

    if (*((void *)a3 + 10))
    {
      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSSQLForeignOrderKey);
      self->_foreignOrderKey = v9;
      -[NSSQLForeignOrderKey copyValuesForReadOnlyFetch:](v9, "copyValuesForReadOnlyFetch:", *((void *)a3 + 10));
    }
  }

@end