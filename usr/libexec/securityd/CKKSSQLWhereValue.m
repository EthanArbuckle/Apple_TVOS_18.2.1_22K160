@interface CKKSSQLWhereValue
+ (id)op:(unint64_t)a3 value:(id)a4;
- (CKKSSQLWhereValue)initWithOperation:(unint64_t)a3 value:(id)a4;
- (NSString)value;
- (unint64_t)sqlOp;
- (void)setSqlOp:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation CKKSSQLWhereValue

- (CKKSSQLWhereValue)initWithOperation:(unint64_t)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CKKSSQLWhereValue;
  v8 = -[CKKSSQLWhereValue init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_sqlOp = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

- (unint64_t)sqlOp
{
  return self->_sqlOp;
}

- (void)setSqlOp:(unint64_t)a3
{
  self->_sqlOp = a3;
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)op:(unint64_t)a3 value:(id)a4
{
  id v5 = a4;
  v6 = -[CKKSSQLWhereValue initWithOperation:value:]( objc_alloc(&OBJC_CLASS___CKKSSQLWhereValue),  "initWithOperation:value:",  a3,  v5);

  return v6;
}

@end