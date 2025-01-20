@interface CLPropertyValue
- (BOOL)dirty;
- (CLPropertyValue)initWithValue:(id)a3 dirty:(BOOL)a4;
- (id)value;
- (void)dealloc;
- (void)setDirty:(BOOL)a3;
@end

@implementation CLPropertyValue

- (CLPropertyValue)initWithValue:(id)a3 dirty:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLPropertyValue;
  v6 = -[CLPropertyValue init](&v8, "init");
  if (v6)
  {
    v6->_value = a3;
    v6->_dirty = a4;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPropertyValue;
  -[CLPropertyValue dealloc](&v3, "dealloc");
}

- (id)value
{
  return self->_value;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

@end