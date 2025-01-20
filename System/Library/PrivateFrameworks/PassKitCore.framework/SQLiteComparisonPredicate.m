@interface SQLiteComparisonPredicate
+ (id)predicateWithProperty:(id)a3 bitwiseAndValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 bitwiseNotAndValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 collatingStrategy:(int64_t)a6;
- (BOOL)_isCollatingStrategyNoCase;
- (BOOL)forceFalse;
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)_comparisonTypeFormat;
- (id)description;
- (id)value;
- (int64_t)collatingStrategy;
- (int64_t)comparisonType;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation SQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:1];
}

+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:2];
}

+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:6];
}

+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:4];
}

+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:5];
}

+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:3];
}

+ (id)predicateWithProperty:(id)a3 bitwiseAndValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:7];
}

+ (id)predicateWithProperty:(id)a3 bitwiseNotAndValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:8];
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSData, v11);
  BOOL v14 = (objc_opt_isKindOfClass(v9, v12) & 1) != 0 && (unint64_t)[v9 length] > 0x20;
  id v15 = objc_alloc_init((Class)objc_opt_class(a1, v13));
  *((void *)v15 + 3) = a5;
  id v16 = [v10 copy];

  v17 = (void *)*((void *)v15 + 1);
  *((void *)v15 + 1) = v16;

  if (v14)
  {
    *((_BYTE *)v15 + 16) = 1;
  }

  else if ([v9 conformsToProtocol:&OBJC_PROTOCOL___NSCopying])
  {
    id v18 = [v9 copy];
    v19 = (void *)*((void *)v15 + 4);
    *((void *)v15 + 4) = v18;
  }

  else
  {
    objc_storeStrong((id *)v15 + 4, a4);
  }

  return v15;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 collatingStrategy:(int64_t)a6
{
  id result = [a1 predicateWithProperty:a3 value:a4 comparisonType:a5];
  *((void *)result + 5) = a6;
  return result;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 appendFormat:@"property: %@; ", self->super._property];
  unint64_t comparisonType = self->_comparisonType;
  v6 = @"unknown";
  if (comparisonType <= 8) {
    v6 = off_10063E3C8[comparisonType];
  }
  [v4 appendFormat:@"comparisonType: %@; ", v6];
  [v4 appendFormat:@"value: %@; ", self->_value];
  id value = self->_value;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  if ((objc_opt_isKindOfClass(value, v9) & 1) != 0)
  {
    int64_t collatingStrategy = self->_collatingStrategy;
    uint64_t v11 = @"nocase";
    if (collatingStrategy != 1) {
      uint64_t v11 = @"unknown";
    }
    if (collatingStrategy) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = @"none";
    }
    [v4 appendFormat:@"collatingStrategy: %@; ", v12];
  }

  [v4 appendFormat:@">"];
  return v4;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  if (!self->_forceFalse)
  {
    id value = self->_value;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, a2);
    if ((objc_opt_isKindOfClass(value, v8) & 1) != 0)
    {
      sqlite3_bind_text( a3,  *a4,  (const char *)[self->_value UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      id v10 = self->_value;
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
      char isKindOfClass = objc_opt_isKindOfClass(v10, v11);
      id v14 = self->_value;
      if ((isKindOfClass & 1) != 0)
      {
        id v15 = (const char *)[self->_value objCType];
        if (!strcmp(v15, "d") || !strcmp(v15, "f"))
        {
          int v17 = *a4;
          [self->_value doubleValue];
          sqlite3_bind_double(a3, v17, v18);
        }

        else
        {
          sqlite3_bind_int64(a3, *a4, (sqlite3_int64)[self->_value longLongValue]);
        }
      }

      else
      {
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData, v13);
        if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0
          && (unint64_t)[self->_value length] <= 0x20)
        {
          sqlite3_bind_blob( a3, *a4, [self->_value bytes], (int)objc_msgSend(self->_value, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }

        else if (!self->_value)
        {
          sqlite3_bind_null(a3, *a4);
        }
      }
    }

    ++*a4;
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->super._property, "hash");
  return (unint64_t)[self->_value hash] + v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SQLiteComparisonPredicate;
  if (-[SQLitePropertyPredicate isEqual:](&v9, "isEqual:", v4))
  {
    v5 = v4;
    BOOL v7 = self->_comparisonType == v5[3]
      && ((id value = self->_value, value == (id)v5[4]) || objc_msgSend(value, "isEqual:"))
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  if (self->_forceFalse)
  {
    NSUInteger v3 = @"(0)";
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", self->super._property));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteComparisonPredicate _comparisonTypeFormat](self, "_comparisonTypeFormat"));
    uint64_t v7 = PKStringWithValidatedFormat(v6, @"%@");
    NSUInteger v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v3;
}

- (BOOL)_isCollatingStrategyNoCase
{
  if (self->_collatingStrategy == 1)
  {
    id value = self->_value;
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString, a2);
    char isKindOfClass = objc_opt_isKindOfClass(value, v3);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)_comparisonTypeFormat
{
  switch(self->_comparisonType)
  {
    case 1LL:
      unsigned int v2 = -[SQLiteComparisonPredicate _isCollatingStrategyNoCase](self, "_isCollatingStrategyNoCase");
      uint64_t v3 = @"(%@ = ?)";
      id v4 = @"(%@ = ? COLLATE NOCASE)";
      goto LABEL_9;
    case 2LL:
      unsigned int v2 = -[SQLiteComparisonPredicate _isCollatingStrategyNoCase](self, "_isCollatingStrategyNoCase");
      uint64_t v3 = @"(%@ != ?)";
      id v4 = @"(%@ != ? COLLATE NOCASE)";
      goto LABEL_9;
    case 3LL:
      unsigned int v2 = -[SQLiteComparisonPredicate _isCollatingStrategyNoCase](self, "_isCollatingStrategyNoCase");
      uint64_t v3 = @"(%@ < ?)";
      id v4 = @"(%@ < ? COLLATE NOCASE)";
      goto LABEL_9;
    case 4LL:
      unsigned int v2 = -[SQLiteComparisonPredicate _isCollatingStrategyNoCase](self, "_isCollatingStrategyNoCase");
      uint64_t v3 = @"(%@ <= ?)";
      id v4 = @"(%@ <= ? COLLATE NOCASE)";
      goto LABEL_9;
    case 5LL:
      unsigned int v2 = -[SQLiteComparisonPredicate _isCollatingStrategyNoCase](self, "_isCollatingStrategyNoCase");
      uint64_t v3 = @"(%@ > ?)";
      id v4 = @"(%@ > ? COLLATE NOCASE)";
      goto LABEL_9;
    case 6LL:
      unsigned int v2 = -[SQLiteComparisonPredicate _isCollatingStrategyNoCase](self, "_isCollatingStrategyNoCase");
      uint64_t v3 = @"(%@ >= ?)";
      id v4 = @"(%@ >= ? COLLATE NOCASE)";
LABEL_9:
      if (v2) {
        id result = v4;
      }
      else {
        id result = v3;
      }
      break;
    case 7LL:
      id result = @"(%@ & ?)";
      break;
    case 8LL:
      id result = @"(NOT %@ & ?)";
      break;
    default:
      id result = 0LL;
      break;
  }

  return result;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)value
{
  return self->_value;
}

- (int64_t)collatingStrategy
{
  return self->_collatingStrategy;
}

- (BOOL)forceFalse
{
  return self->_forceFalse;
}

- (void).cxx_destruct
{
}

@end