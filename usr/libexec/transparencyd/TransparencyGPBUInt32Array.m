@interface TransparencyGPBUInt32Array
+ (id)array;
+ (id)arrayWithCapacity:(unint64_t)a3;
+ (id)arrayWithValue:(unsigned int)a3;
+ (id)arrayWithValueArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (TransparencyGPBUInt32Array)init;
- (TransparencyGPBUInt32Array)initWithCapacity:(unint64_t)a3;
- (TransparencyGPBUInt32Array)initWithValueArray:(id)a3;
- (TransparencyGPBUInt32Array)initWithValues:(const unsigned int *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)hash;
- (unsigned)valueAtIndex:(unint64_t)a3;
- (void)addValue:(unsigned int)a3;
- (void)addValues:(const unsigned int *)a3 count:(unint64_t)a4;
- (void)addValuesFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateValuesWithBlock:(id)a3;
- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4;
- (void)insertValue:(unsigned int)a3 atIndex:(unint64_t)a4;
- (void)internalResizeToCapacity:(unint64_t)a3;
- (void)removeAll;
- (void)removeValueAtIndex:(unint64_t)a3;
- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(unsigned int)a4;
@end

@implementation TransparencyGPBUInt32Array

+ (id)array
{
  return objc_alloc_init((Class)a1);
}

+ (id)arrayWithValue:(unsigned int)a3
{
  unsigned int v4 = a3;
  return [objc_alloc((Class)a1) initWithValues:&v4 count:1];
}

+ (id)arrayWithValueArray:(id)a3
{
  return [objc_alloc((Class)a1) initWithValueArray:a3];
}

+ (id)arrayWithCapacity:(unint64_t)a3
{
  return [objc_alloc((Class)a1) initWithCapacity:a3];
}

- (TransparencyGPBUInt32Array)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt32Array;
  return -[TransparencyGPBUInt32Array init](&v3, "init");
}

- (TransparencyGPBUInt32Array)initWithValueArray:(id)a3
{
  return -[TransparencyGPBUInt32Array initWithValues:count:]( self,  "initWithValues:count:",  *((void *)a3 + 2),  *((void *)a3 + 3));
}

- (TransparencyGPBUInt32Array)initWithValues:(const unsigned int *)a3 count:(unint64_t)a4
{
  v6 = -[TransparencyGPBUInt32Array init](self, "init");
  v7 = v6;
  if (v6 && a3 && a4)
  {
    v8 = (unsigned int *)reallocf(v6->_values, 4 * a4);
    v7->_values = v8;
    if (v8)
    {
      v7->_capacity = a4;
      memcpy(v8, a3, 4 * a4);
      v7->_count = a4;
    }

    else
    {

      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSMallocException,  @"Failed to allocate %lu bytes",  4 * a4);
    }
  }

  return v7;
}

- (TransparencyGPBUInt32Array)initWithCapacity:(unint64_t)a3
{
  unsigned int v4 = -[TransparencyGPBUInt32Array initWithValues:count:](self, "initWithValues:count:", 0LL, 0LL);
  v5 = v4;
  if (a3 && v4) {
    -[TransparencyGPBUInt32Array internalResizeToCapacity:](v4, "internalResizeToCapacity:", a3);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TransparencyGPBUInt32Array initWithValues:count:]( +[TransparencyGPBUInt32Array allocWithZone:](&OBJC_CLASS___TransparencyGPBUInt32Array, "allocWithZone:", a3),  "initWithValues:count:",  self->_values,  self->_count);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBUInt32Array;
  -[TransparencyGPBUInt32Array dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBUInt32Array, a2);
  BOOL result = (objc_opt_isKindOfClass(a3, v5) & 1) != 0
        && (unint64_t count = self->_count, count == *((void *)a3 + 3))
        && memcmp(self->_values, *((const void **)a3 + 2), 4 * count) == 0;
  return result;
}

- (unint64_t)hash
{
  return self->_count;
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p> { ",  objc_opt_class(self, a2),  self);
  unint64_t count = self->_count;
  if (count)
  {
    for (uint64_t i = 0LL; i != count; ++i)
    {
      if (i) {
        v6 = @", %u";
      }
      else {
        v6 = @"%u";
      }
      -[NSMutableString appendFormat:](v3, "appendFormat:", v6, self->_values[i]);
    }
  }

  -[NSMutableString appendFormat:](v3, "appendFormat:", @" }");
  return v3;
}

- (void)enumerateValuesWithBlock:(id)a3
{
}

- (void)enumerateValuesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v11 = 0;
  unint64_t count = self->_count;
  if ((a3 & 2) != 0)
  {
    if (count)
    {
      unint64_t v10 = count - 1;
      do
      {
        if (v10 == -1LL) {
          break;
        }
        (*((void (**)(id, void, unint64_t, char *))a4 + 2))(a4, self->_values[v10], v10, &v11);
        --v10;
      }

      while (!v11);
    }
  }

  else if (count)
  {
    uint64_t v7 = 0LL;
    unint64_t v8 = count - 1;
    do
    {
      (*((void (**)(id, void, uint64_t, char *))a4 + 2))(a4, self->_values[v7], v7, &v11);
      if (v11) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v8 == v7;
      }
      ++v7;
    }

    while (!v9);
  }

- (unsigned)valueAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSRangeException,  @"Index (%lu) beyond bounds (%lu)",  a3,  count);
  }
  return self->_values[a3];
}

- (void)internalResizeToCapacity:(unint64_t)a3
{
  unint64_t v5 = 4 * a3;
  v6 = (unsigned int *)reallocf(self->_values, 4 * a3);
  self->_values = v6;
  if (!v6)
  {
    self->_unint64_t count = 0LL;
    self->_capacity = 0LL;
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSMallocException,  @"Failed to allocate %lu bytes",  v5);
  }

  self->_capacity = a3;
}

- (void)addValue:(unsigned int)a3
{
  unsigned int v3 = a3;
  -[TransparencyGPBUInt32Array addValues:count:](self, "addValues:count:", &v3, 1LL);
}

- (void)addValues:(const unsigned int *)a3 count:(unint64_t)a4
{
  if (a3 && a4)
  {
    unint64_t count = self->_count;
    unint64_t v8 = count + a4;
    if (count + a4 > self->_capacity) {
      -[TransparencyGPBUInt32Array internalResizeToCapacity:]( self,  "internalResizeToCapacity:",  (v8 & 0xFFFFFFFFFFFFFFF0LL) + 16);
    }
    self->_unint64_t count = v8;
    memcpy(&self->_values[count], a3, 4 * a4);
    autocreator = self->_autocreator;
    if (autocreator) {
      sub_10012DE40(autocreator, (uint64_t)self);
    }
  }

- (void)insertValue:(unsigned int)a3 atIndex:(unint64_t)a4
{
  unint64_t count = self->_count;
  unint64_t v8 = count + 1;
  if (count + 1 <= a4)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSRangeException,  @"Index (%lu) beyond bounds (%lu)",  a4,  count + 1);
    unint64_t count = self->_count;
    unint64_t v8 = count + 1;
  }

  if (v8 > self->_capacity) {
    -[TransparencyGPBUInt32Array internalResizeToCapacity:]( self,  "internalResizeToCapacity:",  (v8 & 0xFFFFFFFFFFFFFFF0LL) + 16);
  }
  self->_unint64_t count = v8;
  if (count != a4) {
    memmove(&self->_values[a4 + 1], &self->_values[a4], 4 * (count - a4));
  }
  self->_values[a4] = a3;
  autocreator = self->_autocreator;
  if (autocreator) {
    sub_10012DE40(autocreator, (uint64_t)self);
  }
}

- (void)replaceValueAtIndex:(unint64_t)a3 withValue:(unsigned int)a4
{
  unint64_t count = self->_count;
  if (count <= a3) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSRangeException,  @"Index (%lu) beyond bounds (%lu)",  a3,  count);
  }
  self->_values[a3] = a4;
}

- (void)addValuesFromArray:(id)a3
{
}

- (void)removeValueAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSRangeException,  @"Index (%lu) beyond bounds (%lu)",  a3,  count);
    unint64_t count = self->_count;
  }

  unint64_t v6 = count - 1;
  if (count - 1 != a3) {
    memmove(&self->_values[a3], &self->_values[a3 + 1], 4 * (count - 1 - a3));
  }
  self->_unint64_t count = v6;
  if (count + 31 < self->_capacity) {
    -[TransparencyGPBUInt32Array internalResizeToCapacity:]( self,  "internalResizeToCapacity:",  (v6 & 0xFFFFFFFFFFFFFFF0LL) + 16);
  }
}

- (void)removeAll
{
  self->_unint64_t count = 0LL;
  if (self->_capacity >= 0x21) {
    -[TransparencyGPBUInt32Array internalResizeToCapacity:](self, "internalResizeToCapacity:", 16LL);
  }
}

- (void)exchangeValueAtIndex:(unint64_t)a3 withValueAtIndex:(unint64_t)a4
{
  unint64_t count = self->_count;
  if (count <= a3)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSRangeException,  @"Index (%lu) beyond bounds (%lu)",  a3,  count);
    unint64_t count = self->_count;
  }

  if (count <= a4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSRangeException,  @"Index (%lu) beyond bounds (%lu)",  a4,  count);
  }
  values = self->_values;
  unsigned int v9 = values[a3];
  values[a3] = values[a4];
  values[a4] = v9;
}

- (unint64_t)count
{
  return self->_count;
}

@end