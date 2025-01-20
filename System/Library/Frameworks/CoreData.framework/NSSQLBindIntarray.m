@interface NSSQLBindIntarray
- (NSSQLBindIntarray)initWithValue:(id)a3;
- (NSString)tableName;
- (id)value;
- (unsigned)index;
- (void)dealloc;
- (void)setIndex:(unsigned int)a3;
- (void)setTableName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NSSQLBindIntarray

- (NSSQLBindIntarray)initWithValue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSQLBindIntarray;
  v4 = -[NSSQLBindIntarray init](&v6, sel_init);
  if (v4) {
    v4->_value = a3;
  }
  return v4;
}

- (void)setTableName:(id)a3
{
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (unsigned)index
{
  return self->_index;
}

- (id)value
{
  return self->_value;
}

- (void)dealloc
{
  self->_value = 0LL;
  self->_tableName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLBindIntarray;
  -[NSSQLBindIntarray dealloc](&v3, sel_dealloc);
}

- (void)setValue:(id)a3
{
}

@end