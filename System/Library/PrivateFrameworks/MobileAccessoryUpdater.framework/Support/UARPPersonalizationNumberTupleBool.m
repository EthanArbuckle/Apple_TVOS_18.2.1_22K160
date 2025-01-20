@interface UARPPersonalizationNumberTupleBool
- (BOOL)value;
- (NSString)key;
- (UARPPersonalizationNumberTupleBool)initWithKey:(id)a3 value:(BOOL)a4;
- (id)description;
- (void)dealloc;
@end

@implementation UARPPersonalizationNumberTupleBool

- (UARPPersonalizationNumberTupleBool)initWithKey:(id)a3 value:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPPersonalizationNumberTupleBool;
  v6 = -[UARPPersonalizationNumberTupleBool init](&v8, "init");
  if (v6)
  {
    v6->_key = (NSString *)[a3 copy];
    v6->_value = a4;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPPersonalizationNumberTupleBool;
  -[UARPPersonalizationNumberTupleBool dealloc](&v3, "dealloc");
}

- (id)description
{
  if (self->_value) {
    v2 = "YES";
  }
  else {
    v2 = "NO";
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@ : %s>", self->_key, v2);
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)value
{
  return self->_value;
}

@end