@interface TransparencyGPBBoolDoubleDictionary
- (BOOL)getDouble:(double *)a3 forKey:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBBoolDoubleDictionary)init;
- (TransparencyGPBBoolDoubleDictionary)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBBoolDoubleDictionary)initWithDictionary:(id)a3;
- (TransparencyGPBBoolDoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computeSerializedSizeAsField:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addEntriesFromDictionary:(id)a3;
- (void)enumerateForTextFormat:(id)a3;
- (void)enumerateKeysAndDoublesUsingBlock:(id)a3;
- (void)removeAll;
- (void)removeDoubleForKey:(BOOL)a3;
- (void)setDouble:(double)a3 forKey:(BOOL)a4;
- (void)setTransparencyGPBGenericValue:(id *)a3 forTransparencyGPBGenericValueKey:(id *)a4;
- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4;
@end

@implementation TransparencyGPBBoolDoubleDictionary

- (TransparencyGPBBoolDoubleDictionary)init
{
  return -[TransparencyGPBBoolDoubleDictionary initWithDoubles:forKeys:count:]( self,  "initWithDoubles:forKeys:count:",  0LL,  0LL,  0LL);
}

- (TransparencyGPBBoolDoubleDictionary)initWithDoubles:(const double *)a3 forKeys:(const BOOL *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TransparencyGPBBoolDoubleDictionary;
  result = -[TransparencyGPBBoolDoubleDictionary init](&v13, "init");
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
      double v12 = *a3++;
      result->_values[v10] = v12;
      result->_valueSet[v10] = 1;
      --a5;
    }

    while (a5);
  }

  return result;
}

- (TransparencyGPBBoolDoubleDictionary)initWithDictionary:(id)a3
{
  result = -[TransparencyGPBBoolDoubleDictionary initWithDoubles:forKeys:count:]( self,  "initWithDoubles:forKeys:count:",  0LL,  0LL,  0LL);
  if (a3 && result)
  {
    uint64_t v5 = 0LL;
    char v6 = 1;
    do
    {
      char v7 = v6;
      if (*((_BYTE *)a3 + v5 + 32))
      {
        result->_values[v5] = *((double *)a3 + v5 + 2);
        result->_valueSet[v5] = 1;
      }

      char v6 = 0;
      uint64_t v5 = 1LL;
    }

    while ((v7 & 1) != 0);
  }

  return result;
}

- (TransparencyGPBBoolDoubleDictionary)initWithCapacity:(unint64_t)a3
{
  return -[TransparencyGPBBoolDoubleDictionary initWithDoubles:forKeys:count:]( self,  "initWithDoubles:forKeys:count:",  0LL,  0LL,  0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBBoolDoubleDictionary initWithDictionary:]( +[TransparencyGPBBoolDoubleDictionary allocWithZone:]( &OBJC_CLASS___TransparencyGPBBoolDoubleDictionary,  "allocWithZone:",  a3),  "initWithDictionary:",  self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBBoolDoubleDictionary, a2);
  return (objc_opt_isKindOfClass(a3, v5) & 1) != 0
      && self->_valueSet[0] == *((unsigned __int8 *)a3 + 32)
      && self->_valueSet[1] == *((unsigned __int8 *)a3 + 33)
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
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"NO: %lf", *(void *)&self->_values[0]);
  }
  if (self->_valueSet[1]) {
    -[NSMutableString appendFormat:](v4, "appendFormat:", @"YES: %lf", *(void *)&self->_values[1]);
  }
  -[NSMutableString appendString:](v4, "appendString:", @" }");
  return v4;
}

- (unint64_t)count
{
  return self->_valueSet[1] + (unint64_t)self->_valueSet[0];
}

- (BOOL)getDouble:(double *)a3 forKey:(BOOL)a4
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
  self->_values[var0] = a3->var6;
  self->_valueSet[var0] = 1;
}

- (void)enumerateForTextFormat:(id)a3
{
  if (self->_valueSet[0]) {
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))( a3,  @"false",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.*lg",  15LL,  *(void *)&self->_values[0]));
  }
  if (self->_valueSet[1]) {
    (*((void (**)(id, const __CFString *, NSString *))a3 + 2))( a3,  @"true",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.*lg",  15LL,  *(void *)&self->_values[1]));
  }
}

- (void)enumerateKeysAndDoublesUsingBlock:(id)a3
{
  char v5 = 0;
  if (!self->_valueSet[0]
    || ((*((void (**)(id, void, char *, double))a3 + 2))(a3, 0LL, &v5, self->_values[0]), !v5))
  {
    if (self->_valueSet[1]) {
      (*((void (**)(id, uint64_t, char *, double))a3 + 2))(a3, 1LL, &v5, self->_values[1]);
    }
  }

- (unint64_t)computeSerializedSizeAsField:(id)a3
{
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  uint64_t v6 = *((void *)a3 + 1);
  valueSet = self->_valueSet;
  char v8 = 1;
  do
  {
    char v9 = v8;
    if (valueSet[v3])
    {
      ++v4;
      uint64_t v10 = sub_10010FAAC(1);
      uint64_t v11 = sub_10010F8C8(2) + v10;
      v5 += v11 + sub_10010E104(v11);
    }

    char v8 = 0;
    uint64_t v3 = 1LL;
  }

  while ((v9 & 1) != 0);
  return v5 + sub_10010FFE0(*(_DWORD *)(v6 + 16), 15) * v4;
}

- (void)writeToCodedOutputStream:(id)a3 asField:(id)a4
{
  uint64_t v6 = sub_10013B0C8(*(_DWORD *)(*((void *)a4 + 1) + 16LL), 2);
  char v7 = 0;
  uint64_t v8 = 0LL;
  valueSet = self->_valueSet;
  values = self->_values;
  char v11 = 1;
  do
  {
    char v12 = v11;
    if (valueSet[v8])
    {
      [a3 writeInt32NoTag:v6];
      uint64_t v13 = v7 & 1;
      int v14 = sub_10010FAAC(1);
      [a3 writeInt32NoTag:sub_10010F8C8(2) + v14];
      [a3 writeBool:1 value:v13];
      [a3 writeDouble:2 value:values[v8]];
    }

    char v11 = 0;
    char v7 = 1;
    uint64_t v8 = 1LL;
  }

  while ((v12 & 1) != 0);
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
        self->_values[v4] = *((double *)a3 + v4 + 2);
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

- (void)setDouble:(double)a3 forKey:(BOOL)a4
{
  self->_values[a4] = a3;
  self->_valueSet[a4] = 1;
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DFA8(autocreator, (uint64_t)self);
  }
}

- (void)removeDoubleForKey:(BOOL)a3
{
  self->_valueSet[a3] = 0;
}

- (void)removeAll
{
  *(_WORD *)self->_valueSet = 0;
}

@end