@interface NSSQLAttribute
- (BOOL)isFileBackedFuture;
- (NSSQLAttribute)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)initForReadOnlyFetchWithExpression:(id)a3;
- (uint64_t)_sqlTypeForAttributeType:(uint64_t)a1 flags:(uint64_t)a2;
- (void)addKeyForTriggerOnRelationship:(id)object;
- (void)dealloc;
@end

@implementation NSSQLAttribute

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSSQLAttribute;
  -[NSSQLColumn dealloc](&v2, sel_dealloc);
}

- (uint64_t)_sqlTypeForAttributeType:(uint64_t)a1 flags:(uint64_t)a2
{
  uint64_t result = 1LL;
  if (a1 <= 599)
  {
    if (a1 > 299)
    {
      switch(a1)
      {
        case 300LL:
          return 2LL;
        case 400LL:
          return 4LL;
        case 500LL:
          return 7LL;
      }
    }

    else if (a1 && (a1 == 100 || a1 == 200))
    {
      return result;
    }

    return 6LL;
  }

  if (a1 <= 999)
  {
    if (a1 != 600)
    {
      if (a1 != 800)
      {
        if (a1 == 900) {
          return 8LL;
        }
        return 6LL;
      }

      return result;
    }

    return 7LL;
  }

  if (a1 > 1199)
  {
    if (a1 != 1200)
    {
      if (a1 == 1800) {
        return 15LL;
      }
      return 6LL;
    }

    return 12LL;
  }

  else
  {
    if (a1 != 1000)
    {
      if (a1 == 1100) {
        return 11LL;
      }
      return 6LL;
    }

    if (a2) {
      return 16LL;
    }
    else {
      return 10LL;
    }
  }

- (NSSQLAttribute)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSSQLAttribute;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v12, sel_initWithEntity_propertyDescription_);
  v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 1;
    v6->super.super._sqlType = -[NSSQLAttribute _sqlTypeForAttributeType:flags:]( [a4 attributeType],  objc_msgSend(a4, "storesBinaryDataExternally"));
    if (a4 && [a4 superCompositeAttribute])
    {
      *(_WORD *)&v7->super.super._flags |= 0x20u;
      if (a3)
      {
        uint64_t v8 = *((void *)a3 + 3);
        if (v8) {
          a3 = *(id *)(v8 + 104);
        }
        else {
          a3 = 0LL;
        }
      }

      v10 = -[NSPropertyDescription _rootName]((__CFString *)a4);
    }

    else
    {
      if (a3)
      {
        uint64_t v9 = *((void *)a3 + 3);
        if (v9) {
          a3 = *(id *)(v9 + 104);
        }
        else {
          a3 = 0LL;
        }
      }

      v10 = -[NSSQLProperty name](v7, "name");
    }

    v7->super.super._slot = [a3 fastIndexForKnownKey:v10];
    *(_WORD *)&v7->super.super._flags = *(_WORD *)&v7->super.super._flags & 0xFFE7 | (16
                                                                                    * ([a4 _propertyType] == 6));
  }

  return v7;
}

- (id)initForReadOnlyFetchWithExpression:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSQLAttribute;
  v4 = -[NSSQLColumn initForReadOnlyFetching](&v7, sel_initForReadOnlyFetching);
  v5 = v4;
  if (v4)
  {
    v4[24] = 1;
    v4[25] = -[NSSQLAttribute _sqlTypeForAttributeType:flags:]([a3 expressionResultType], 0);
    *((void *)v5 + 1) = a3;
    *((_WORD *)v5 + 16) &= 0xFFF6u;
  }

  return v5;
}

- (void)addKeyForTriggerOnRelationship:(id)object
{
  if (object)
  {
    if ((*((_WORD *)object + 16) & 8) != 0)
    {
      id AssociatedObject = objc_getAssociatedObject(object, &NSSQLAttributeTriggerAssociationKey);
      if (AssociatedObject) {
        v4 = AssociatedObject;
      }
      else {
        v4 = (void *)NSSet_EmptySet;
      }
    }

    else
    {
      v4 = (void *)NSSet_EmptySet;
    }

    objc_setAssociatedObject( object,  &NSSQLAttributeTriggerAssociationKey,  (id)objc_msgSend(v4, "setByAddingObject:", objc_msgSend(a2, "name")),  (void *)0x301);
  }

- (BOOL)isFileBackedFuture
{
  return objc_msgSend(-[NSSQLProperty propertyDescription](self, "propertyDescription"), "isFileBackedFuture");
}

@end