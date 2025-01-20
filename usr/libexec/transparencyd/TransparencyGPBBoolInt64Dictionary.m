@interface TransparencyGPBBoolInt64Dictionary
- (BOOL)getInt64:(int64_t *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBBoolInt64Dictionary)init;
- (TransparencyGPBBoolInt64Dictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBBoolInt64Dictionary)initWithDictionary:(id)a3;
- (TransparencyGPBBoolInt64Dictionary)initWithInt64s:(const int64_t *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndInt64sUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeInt64ForKey:(BOOL)a3;
- (void)setInt64:(int64_t)a3 forKey:(BOOL)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBBoolInt64Dictionary

- (TransparencyGPBBoolInt64Dictionary)init
{
  return -[TransparencyGPBBoolInt64Dictionary initWithInt64s:forKeys:count:]( self,  "initWithInt64s:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBBoolInt64Dictionary)initWithInt64s:(const int64_t *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TransparencyGPBBoolInt64Dictionary;
  result = -[TransparencyGPBBoolInt64Dictionary init](&v13, "init");
  if (result) {
    BOOL v9 = a5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    do
    {
      unsigned int v11 = *(unsigned __int8 *)a4++;
      uint64_t v10 = v11;
      int64_t v12 = *a3++;
      result->_values[v10] = v12;
      result->_valueSet[v10] = 1;
      --a5;
    }

    while (a5);
  }

  return result;
}

- (TransparencyGPBBoolInt64Dictionary)initWithDictionary:(id)a3
{
  result = -[TransparencyGPBBoolInt64Dictionary initWithInt64s:forKeys:count:]( self,  "initWithInt64s:forKeys:count:",  0LL,  0LL,  0LL);
  if (a3 && result)
  {
    uint64_t v5 = 0LL;
    char v6 = 1;
    do
    {
      char v7 = v6;
      if (*((_BYTE *)a3 + v5 + 32))
      {
        result->_values[v5] = *((void *)a3 + v5 + 2);
        result->_valueSet[v5] = 1;
      }

      char v6 = 0;
      uint64_t v5 = 1LL;
    }

    while ((v7 & 1) != 0);
  }

  return result;
}

- (TransparencyGPBBoolInt64Dictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBBoolInt64Dictionary initWithInt64s:forKeys:count:]( self,  "initWithInt64s:forKeys:count:",  0LL,  0LL,  0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBBoolInt64Dictionary initWithDictionary:]( +[TransparencyGPBBoolInt64Dictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBBoolInt64Dictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBBoolInt64Dictionary, a2);
  return (objc_opt_isKindOfClass(a3, v5) & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 32)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 33)
      && (!self->_valueSet[0] || self->_values[0] == *((void *)a3 + 2))
      && (!self->_valueSet[1] || self->_values[1] == *((void *)a3 + 3));
}

- (unint64_t)hash
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p> {",  objc_opt_class(self, a2),  self);
  v4 = v3;
  if (self->_valueSet[0]) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"NO: %lld", self->_values[0]);
  }
  if (self->_valueSet[1]) {
    -[NSMutableString appendFormat:](v4, "appendFormat:", @"YES: %lld", self->_values[1]);
  }
  -[NSMutableString appendString:](v4, "appendString:", @" }");
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getInt64:(int64_t *)a3 forKey:(BOOL)a4
{
  BOOL v4 = self->_valueSet[a4];
  if (a3 && self->_valueSet[a4]) {
    *a3 = self->_values[a4];
  }
  return v4;
}

- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4
{
  BOOL var0 = a4->var0;
  self->_values[var0] = a3->var2;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0]) {
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))( a3,  @"false",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", self->_values[0]));
  }
  if (self->_valueSet[1]) {
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))( a3,  @"true",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", self->_values[1]));
  }
}

- (void)enumerateKeysAndInt64sUsingBlock:(id)a3
{
  char v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, void, int64_t, char *))a3 + 2))(a3, 0LL, self->_values[0], &v5), !v5))
  {
    if (self->_valueSet[1]) {
      (*((void (**)(id, uint64_t, int64_t, char *))a3 + 2))(a3, 1LL, self->_values[1], &v5);
    }
  }

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  uint64_t v6 = *((void *)a3 + 1);
  int v7 = *(unsigned __int8 *)(v6 + 30);
  valueSet = self->_valueSet;
  values = self->_values;
  char v10 = 1;
  do
  {
    char v11 = v10;
    if (valueSet[v3])
    {
      ++v4;
      uint64_t v12 = sub_10010FAAC(1);
      uint64_t v13 = sub_1001147A4(values[v3], 2, v7) + v12;
      v5 += v13 + sub_10010E104(v13);
    }

    char v10 = 0;
    uint64_t v3 = 1LL;
  }

  while ((v11 & 1) != 0);
  return v5 + sub_10010FFE0(*(_DWORD *)(v6 + 16), 15) * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6 = *((void *)a4 + 1);
  int v7 = *(unsigned __int8 *)(v6 + 30);
  uint64_t v8 = sub_10013B0C8(*(_DWORD *)(v6 + 16), 2);
  char v9 = 0;
  uint64_t v10 = 0LL;
  valueSet = self->_valueSet;
  values = self->_values;
  char v13 = 1;
  do
  {
    char v14 = v13;
    if (valueSet[v10])
    {
      [a3 writeInt32NoTag:v8];
      uint64_t v15 = v9 & 1;
      int v16 = sub_10010FAAC(1);
      objc_msgSend(a3, "writeInt32NoTag:", sub_1001147A4(values[v10], 2, v7) + v16);
      [a3 writeBool:1 value:v15];
      sub_100114940(a3, values[v10], 2LL, v7);
    }

    char v13 = 0;
    char v9 = 1;
    uint64_t v10 = 1LL;
  }

  while ((v14 & 1) != 0);
}

- (void)addEntriesFromDictionary:(id)a3
{
  if (a3)
  {
    uint64_t v4 = 0LL;
    char v5 = 1;
    do
    {
      char v6 = v5;
      if (*((_BYTE *)a3 + v4 + 32))
      {
        self->_valueSet[v4] = 1;
        self->_values[v4] = *((void *)a3 + v4 + 2);
      }

      char v5 = 0;
      uint64_t v4 = 1LL;
    }

    while ((v6 & 1) != 0);
    autocreator = self->_autocreator;
    if (autocreator) {
      sub_10012DFA8(autocreator, (uint64_t)self);
    }
  }

- (void)setInt64:(int64_t)a3 forKey:(BOOL)a4
{
  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeInt64ForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end