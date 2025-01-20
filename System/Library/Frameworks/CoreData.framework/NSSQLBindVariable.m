@interface NSSQLBindVariable
- (BOOL)allowsCoercion;
- (BOOL)hasObjectValue;
- (NSSQLBindVariable)initWithInt64:(int64_t)a3 sqlType:(unsigned __int8)a4;
- (NSSQLBindVariable)initWithUnsignedInt:(unsigned int)a3 sqlType:(unsigned __int8)a4;
- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5;
- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5 allowCoercion:(BOOL)a6;
- (id)propertyDescription;
- (id)tombstonedPropertyDescription;
- (id)value;
- (int64_t)int64;
- (unsigned)index;
- (unsigned)sqlType;
- (unsigned)unsignedInt;
- (void)dealloc;
- (void)setIndex:(unsigned int)a3;
- (void)setInt64:(int64_t)a3;
- (void)setSQLType:(unsigned __int8)a3;
- (void)setTombstonedPropertyDescription:(id)a3;
- (void)setUnsignedInt:(unsigned int)a3;
- (void)setValue:(id)a3;
@end

@implementation NSSQLBindVariable

- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5 allowCoercion:(BOOL)a6
{
  BOOL v6 = a6;
  int v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSSQLBindVariable;
  v10 = -[NSSQLBindVariable init](&v14, sel_init);
  if (v10)
  {
    if ((id)[MEMORY[0x189603FE8] null] == a3) {
      id v11 = 0LL;
    }
    else {
      id v11 = a3;
    }
    if (v8 == 6 && v11)
    {
      if (([v11 isNSString] & 1) == 0) {
        a3 = (id)[v11 description];
      }
    }

    else
    {
      a3 = v11;
    }

    id v12 = a3;
    v10->_sqlType = v8;
    v10->_value = v12;
    v10->_propertyDescription = (NSPropertyDescription *)a5;
    v10->_flags = v6;
  }

  return v10;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (unsigned)sqlType
{
  return self->_sqlType;
}

- (BOOL)hasObjectValue
{
  return self->_int64 == 0;
}

- (id)value
{
  id result = self->_value;
  if (!result)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

- (BOOL)allowsCoercion
{
  return self->_flags != 0;
}

- (void)dealloc
{
  self->_value = 0LL;
  self->_propertyDescription = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLBindVariable;
  -[NSSQLBindVariable dealloc](&v3, sel_dealloc);
}

- (void)setInt64:(int64_t)a3
{
  self->_int64 = a3;
}

- (int64_t)int64
{
  id value = self->_value;
  if (value) {
    return [value longLongValue];
  }
  else {
    return self->_int64;
  }
}

- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5
{
  return -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:allowCoercion:]( self,  "initWithValue:sqlType:propertyDescription:allowCoercion:",  a3,  a4,  a5,  0LL);
}

- (NSSQLBindVariable)initWithInt64:(int64_t)a3 sqlType:(unsigned __int8)a4
{
  v5 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( self,  "initWithValue:sqlType:propertyDescription:",  0LL,  a4,  0LL);
  BOOL v6 = v5;
  if (a3 && v5) {
    -[NSSQLBindVariable setInt64:](v5, "setInt64:", a3);
  }
  return v6;
}

- (NSSQLBindVariable)initWithUnsignedInt:(unsigned int)a3 sqlType:(unsigned __int8)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( self,  "initWithValue:sqlType:propertyDescription:",  0LL,  a4,  0LL);
  BOOL v6 = v5;
  if ((_DWORD)v4 && v5) {
    -[NSSQLBindVariable setUnsignedInt:](v5, "setUnsignedInt:", v4);
  }
  return v6;
}

- (unsigned)unsignedInt
{
  id value = self->_value;
  if (value) {
    return [value unsignedIntValue];
  }
  else {
    return self->_int64;
  }
}

- (void)setUnsignedInt:(unsigned int)a3
{
  self->_int64 = a3;
}

- (void)setValue:(id)a3
{
  id value = self->_value;
  if (value != a3)
  {

    self->_id value = a3;
  }

- (void)setSQLType:(unsigned __int8)a3
{
  self->_sqlType = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (id)propertyDescription
{
  return self->_propertyDescription;
}

- (void)setTombstonedPropertyDescription:(id)a3
{
  self->_tombstonedPropertyDescription = (NSPropertyDescription *)a3;
}

- (id)tombstonedPropertyDescription
{
  return self->_tombstonedPropertyDescription;
}

@end