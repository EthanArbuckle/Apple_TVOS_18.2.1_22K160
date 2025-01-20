@interface SQLiteMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)externalPropertyValues;
- (NSDictionary)propertyValues;
- (SQLiteMemoryEntity)init;
- (SQLiteMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4;
- (SQLiteMemoryEntity)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5;
- (SQLiteMemoryEntity)initWithPropertyValues:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)valueForExternalProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)databaseID;
- (unint64_t)hash;
- (void)reloadFromDatabaseEntity:(id)a3 properties:(id)a4;
- (void)setDatabaseID:(int64_t)a3;
- (void)setExternalValuesWithDictionary:(id)a3;
- (void)setValue:(id)a3 forExternalProperty:(id)a4;
- (void)setValue:(id)a3 forProperty:(id)a4;
- (void)setValues:(id *)a3 forExternalProperties:(const void *)a4 count:(int64_t)a5;
- (void)setValues:(id *)a3 forProperties:(const void *)a4 count:(int64_t)a5;
- (void)setValuesWithDictionary:(id)a3;
@end

@implementation SQLiteMemoryEntity

- (SQLiteMemoryEntity)init
{
  return -[SQLiteMemoryEntity initWithDatabaseID:propertyValues:externalPropertyValues:]( self,  "initWithDatabaseID:propertyValues:externalPropertyValues:",  0LL,  &__NSDictionary0__struct,  &__NSDictionary0__struct);
}

- (SQLiteMemoryEntity)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SQLiteMemoryEntity;
  v10 = -[SQLiteMemoryEntity init](&v19, "init");
  v11 = v10;
  if (v10)
  {
    v10->_databaseID = a3;
    if (v8) {
      v12 = v8;
    }
    else {
      v12 = &__NSDictionary0__struct;
    }
    v13 = (NSMutableDictionary *)[v12 mutableCopy];
    propertyValues = v11->_propertyValues;
    v11->_propertyValues = v13;

    if (v9) {
      v15 = v9;
    }
    else {
      v15 = &__NSDictionary0__struct;
    }
    v16 = (NSMutableDictionary *)[v15 mutableCopy];
    externalPropertyValues = v11->_externalPropertyValues;
    v11->_externalPropertyValues = v16;
  }

  return v11;
}

- (SQLiteMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[SQLiteMemoryEntity initWithDatabaseID:propertyValues:externalPropertyValues:]( self,  "initWithDatabaseID:propertyValues:externalPropertyValues:",  [v6 persistentID],  &__NSDictionary0__struct,  &__NSDictionary0__struct);
  if (v8 && [v7 count]) {
    -[SQLiteMemoryEntity reloadFromDatabaseEntity:properties:](v8, "reloadFromDatabaseEntity:properties:", v6, v7);
  }

  return v8;
}

- (SQLiteMemoryEntity)initWithPropertyValues:(id)a3
{
  return -[SQLiteMemoryEntity initWithDatabaseID:propertyValues:externalPropertyValues:]( self,  "initWithDatabaseID:propertyValues:externalPropertyValues:",  0LL,  a3,  &__NSDictionary0__struct);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___SQLiteEntity, a2);
}

+ (id)defaultProperties
{
  return &__NSArray0__struct;
}

- (void)reloadFromDatabaseEntity:(id)a3 properties:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 getValuesForProperties:a4]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001E21BC;
  v6[3] = &unk_1003EB070;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)setExternalValuesWithDictionary:(id)a3
{
}

- (void)setValue:(id)a3 forProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  -[SQLiteMemoryEntity setValues:forProperties:count:](self, "setValues:forProperties:count:", &v7, &v8, 1LL);
  id v6 = v7;
}

- (void)setValues:(id *)a3 forProperties:(const void *)a4 count:(int64_t)a5
{
  if (a5 >= 1)
  {
    int64_t v5 = a5;
    do
    {
      propertyValues = self->_propertyValues;
      if (*a3) {
        -[NSMutableDictionary setObject:forKey:](propertyValues, "setObject:forKey:", *a3, *a4);
      }
      else {
        -[NSMutableDictionary removeObjectForKey:](propertyValues, "removeObjectForKey:", *a4);
      }
      ++a4;
      ++a3;
      --v5;
    }

    while (v5);
  }

- (void)setValuesWithDictionary:(id)a3
{
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  -[SQLiteMemoryEntity setValues:forExternalProperties:count:]( self,  "setValues:forExternalProperties:count:",  &v7,  &v8,  1LL);
  id v6 = v7;
}

- (void)setValues:(id *)a3 forExternalProperties:(const void *)a4 count:(int64_t)a5
{
  if (a5 >= 1)
  {
    int64_t v5 = a5;
    do
    {
      externalPropertyValues = self->_externalPropertyValues;
      if (*a3) {
        -[NSMutableDictionary setObject:forKey:](externalPropertyValues, "setObject:forKey:", *a3, *a4);
      }
      else {
        -[NSMutableDictionary removeObjectForKey:](externalPropertyValues, "removeObjectForKey:", *a4);
      }
      ++a4;
      ++a3;
      --v5;
    }

    while (v5);
  }

- (id)valueForProperty:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyValues, "objectForKeyedSubscript:", a3);
}

- (id)valueForExternalProperty:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_externalPropertyValues, "objectForKeyedSubscript:", a3);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SQLiteMemoryEntity;
  id v3 = -[SQLiteMemoryEntity description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %lld",  v4,  self->_databaseID));

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableDictionary hash](self->_propertyValues, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if (v6 == objc_opt_class(v4, v7)
    && (id v8 = -[SQLiteMemoryEntity databaseID](self, "databaseID"), v8 == [v4 databaseID]))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteMemoryEntity propertyValues](self, "propertyValues"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 propertyValues]);
    if ([v9 isEqualToDictionary:v10])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SQLiteMemoryEntity externalPropertyValues](self, "externalPropertyValues"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 externalPropertyValues]);
      unsigned __int8 v13 = [v11 isEqualToDictionary:v12];
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend( objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3),  "initWithDatabaseID:propertyValues:externalPropertyValues:",  self->_databaseID,  self->_propertyValues,  self->_externalPropertyValues);
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (NSDictionary)propertyValues
{
  return &self->_propertyValues->super;
}

- (NSDictionary)externalPropertyValues
{
  return &self->_externalPropertyValues->super;
}

- (void).cxx_destruct
{
}

@end