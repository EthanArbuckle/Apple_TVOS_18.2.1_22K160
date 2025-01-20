@interface NSURLKeyValuePair
+ (id)pair;
+ (id)pairWithKey:(id)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSURLKeyValuePair)initWithKey:(id)a3 value:(id)a4;
- (id)description;
- (id)key;
- (id)value;
- (unint64_t)hash;
- (void)dealloc;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NSURLKeyValuePair

+ (id)pair
{
  return  -[NSURLKeyValuePair initWithKey:value:]( objc_alloc(&OBJC_CLASS___NSURLKeyValuePair),  "initWithKey:value:",  0LL,  0LL);
}

+ (id)pairWithKey:(id)a3 value:(id)a4
{
  return  -[NSURLKeyValuePair initWithKey:value:]( objc_alloc(&OBJC_CLASS___NSURLKeyValuePair),  "initWithKey:value:",  a3,  a4);
}

- (NSURLKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSURLKeyValuePair;
  v6 = -[NSURLKeyValuePair init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[NSURLKeyValuePair setKey:](v6, "setKey:", a3);
    -[NSURLKeyValuePair setValue:](v7, "setValue:", a4);
    v7->hash = [a3 hash];
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLKeyValuePair;
  -[NSURLKeyValuePair dealloc](&v3, sel_dealloc);
}

- (void)setKey:(id)a3
{
  id key = self->key;
  if (key != a3)
  {

    self->id key = a3;
  }

- (void)setValue:(id)a3
{
  id value = self->value;
  if (value != a3)
  {

    self->id value = a3;
  }

- (id)key
{
  return self->key;
}

- (id)value
{
  return self->value;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<NSURLKeyValuePair %@=%@>",  self->key,  self->value);
}

- (unint64_t)hash
{
  return self->hash;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      int v5 = objc_msgSend(self->key, "isEqual:", objc_msgSend(a3, "key"));
      if (v5) {
        LOBYTE(v5) = objc_msgSend(self->value, "isEqual:", objc_msgSend(a3, "value"));
      }
    }
  }

  return v5;
}

@end