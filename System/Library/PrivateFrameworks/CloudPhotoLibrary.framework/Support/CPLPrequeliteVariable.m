@interface CPLPrequeliteVariable
+ (CPLPrequeliteVariable)variableWithName:(id)a3 defaultValue:(id)a4 forTable:(id)a5 type:(id)a6;
+ (CPLPrequeliteVariable)variableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5;
+ (CPLPrequeliteVariable)variableWithName:(id)a3 forTable:(id)a4 type:(id)a5;
+ (CPLPrequeliteVariable)variableWithName:(id)a3 type:(id)a4;
+ (id)indexVariableForVariableWithName:(id)a3 forTable:(id)a4;
- (BOOL)allowsNull;
- (BOOL)hasCachedValueForIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnique;
- (BOOL)shouldNotCacheValue;
- (CPLPrequeliteTable)table;
- (CPLPrequeliteType)type;
- (CPLPrequeliteVariable)initWithName:(id)a3 defaultValue:(id)a4 table:(id)a5 type:(id)a6;
- (NSData)sql;
- (NSString)description;
- (NSString)variableName;
- (PQLBindable)bindableValueForDefaultValue;
- (PQLInjecting)columnDefinition;
- (id)bindableValueForValue:(id)a3;
- (id)cachedValueForIdentifier:(id)a3;
- (id)columnDefinitionWithDefaultValue:(id)a3;
- (id)defaultValue;
- (id)redactedDescription;
- (id)valueFromSet:(id)a3 atIndex:(int)a4;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
- (unint64_t)hash;
- (void)discardCachedValue;
- (void)setAllowsNull:(BOOL)a3;
- (void)setBindableValueForDefaultValue:(id)a3;
- (void)setCachedValue:(id)a3 forIdentifier:(id)a4;
- (void)setDefaultValue:(id)a3;
- (void)setShouldNotCacheValue:(BOOL)a3;
- (void)setUnique:(BOOL)a3;
@end

@implementation CPLPrequeliteVariable

+ (CPLPrequeliteVariable)variableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithName:v10 defaultValue:v9 table:0 type:v8];

  return (CPLPrequeliteVariable *)v11;
}

+ (CPLPrequeliteVariable)variableWithName:(id)a3 defaultValue:(id)a4 forTable:(id)a5 type:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithName:v13 defaultValue:v12 table:v11 type:v10];

  return (CPLPrequeliteVariable *)v14;
}

+ (id)indexVariableForVariableWithName:(id)a3 forTable:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingString:@".idx"]);
  id v8 = objc_alloc((Class)a1);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  id v10 = [v8 initWithName:v7 defaultValue:0 table:v6 type:v9];

  return v10;
}

- (CPLPrequeliteVariable)initWithName:(id)a3 defaultValue:(id)a4 table:(id)a5 type:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CPLPrequeliteVariable;
  id v14 = -[CPLPrequeliteVariable init](&v22, "init");
  if (v14)
  {
    if (v12)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v12 tableName]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v15, v10));

      id v10 = (id)v16;
    }

    objc_storeStrong((id *)&v14->_table, a5);
    v17 = (NSString *)[v10 copy];
    variableName = v14->_variableName;
    v14->_variableName = v17;

    objc_storeStrong((id *)&v14->_type, a6);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[PQLNameInjection nameWithString:](&OBJC_CLASS___PQLNameInjection, "nameWithString:", v10));
    injection = v14->_injection;
    v14->_injection = (PQLNameInjection *)v19;

    objc_storeStrong(&v14->_defaultValue, a4);
    v14->_allowsNull = v11 == 0LL;
  }

  return v14;
}

- (NSData)sql
{
  return (NSData *)-[PQLNameInjection sql](self->_injection, "sql");
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return -[PQLNameInjection bindWithStatement:startingAtIndex:]( self->_injection,  "bindWithStatement:startingAtIndex:",  a3,  *(void *)&a4);
}

- (NSString)description
{
  if (self->_cachedValueIdentifier) {
    v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<SQLVariable %@ = %@>",  self->_variableName,  self->_cachedValue);
  }
  else {
    v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<SQLVariable %@>",  self->_variableName,  v4);
  }
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)redactedDescription
{
  if (self->_cachedValueIdentifier) {
    v2 = @"<SQLVariable %@ = [cached]>";
  }
  else {
    v2 = @"<SQLVariable %@>";
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v2,  self->_variableName));
}

- (BOOL)hasCachedValueForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_shouldNotCacheValue || !self->_cachedValueIdentifier) {
    unsigned __int8 v6 = 0;
  }
  else {
    unsigned __int8 v6 = objc_msgSend(v4, "isEqual:");
  }

  return v6;
}

- (id)cachedValueForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setCachedValue:(id)a3 forIdentifier:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  if (!self->_shouldNotCacheValue)
  {
    objc_storeStrong(&self->_cachedValueIdentifier, a4);
    objc_storeStrong(&self->_cachedValue, a3);
  }
}

- (void)discardCachedValue
{
  id cachedValue = self->_cachedValue;
  self->_id cachedValue = 0LL;

  id cachedValueIdentifier = self->_cachedValueIdentifier;
  self->_id cachedValueIdentifier = 0LL;
}

- (id)bindableValueForValue:(id)a3
{
  id v4 = a3;
  if (v4 || self->_allowsNull)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteType _bindableValueForValue:](self->_type, "_bindableValueForValue:", v4));
  }

  else
  {
    id defaultValue = self->_defaultValue;
    if (defaultValue) {
      id v5 = defaultValue;
    }
    else {
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteType defaultValueForNull](self->_type, "defaultValueForNull"));
    }
  }

  id v6 = v5;

  return v6;
}

- (PQLBindable)bindableValueForDefaultValue
{
  return (PQLBindable *)-[CPLPrequeliteVariable bindableValueForValue:]( self,  "bindableValueForValue:",  self->_defaultValue);
}

- (id)valueFromSet:(id)a3 atIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  type = self->_type;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectOfClass:atIndex:", -[CPLPrequeliteType objcClass](type, "objcClass"), v4));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteType _valueForBindableValue:](type, "_valueForBindableValue:", v7));
  return v8;
}

+ (CPLPrequeliteVariable)variableWithName:(id)a3 type:(id)a4
{
  return (CPLPrequeliteVariable *)[a1 variableWithName:a3 defaultValue:0 type:a4];
}

+ (CPLPrequeliteVariable)variableWithName:(id)a3 forTable:(id)a4 type:(id)a5
{
  return (CPLPrequeliteVariable *)_[a1 variableWithName:a3 defaultValue:0 forTable:a4 type:a5];
}

- (PQLInjecting)columnDefinition
{
  return (PQLInjecting *)-[CPLPrequeliteVariable columnDefinitionWithDefaultValue:]( self,  "columnDefinitionWithDefaultValue:",  0LL);
}

- (id)columnDefinitionWithDefaultValue:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = self->_defaultValue;
  }
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable sql](self, "sql"));
  -[NSMutableData appendData:](v5, "appendData:", v6);

  -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", " ", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteType sql](self->_type, "sql"));
  -[NSMutableData appendData:](v5, "appendData:", v7);

  if (self->_unique) {
    -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", " UNIQUE", 7LL);
  }
  if (!self->_allowsNull)
  {
    -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", " NOT NULL", 9LL);
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (v4)
  {
LABEL_7:
    -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", " DEFAULT ", 9LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteType rawInjectionForValue:](self->_type, "rawInjectionForValue:", self->_defaultValue));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sql]);
    -[NSMutableData appendData:](v5, "appendData:", v9);
  }

- (unint64_t)hash
{
  return -[NSString hash](self->_variableName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CPLPrequeliteVariable *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteVariable);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0 && self->_type == v4->_type) {
      BOOL v6 = -[NSString isEqualToString:](self->_variableName, "isEqualToString:", v4->_variableName);
    }
    else {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)variableName
{
  return self->_variableName;
}

- (CPLPrequeliteTable)table
{
  return self->_table;
}

- (CPLPrequeliteType)type
{
  return self->_type;
}

- (BOOL)shouldNotCacheValue
{
  return self->_shouldNotCacheValue;
}

- (void)setShouldNotCacheValue:(BOOL)a3
{
  self->_shouldNotCacheValue = a3;
}

- (void)setBindableValueForDefaultValue:(id)a3
{
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (BOOL)allowsNull
{
  return self->_allowsNull;
}

- (void)setAllowsNull:(BOOL)a3
{
  self->_allowsNull = a3;
}

- (BOOL)isUnique
{
  return self->_unique;
}

- (void)setUnique:(BOOL)a3
{
  self->_unique = a3;
}

- (void).cxx_destruct
{
}

@end