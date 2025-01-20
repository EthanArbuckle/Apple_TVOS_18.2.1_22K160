@interface CKKSSQLWhereColumn
+ (id)op:(unint64_t)a3 column:(unint64_t)a4;
- (CKKSSQLWhereColumn)initWithOperation:(unint64_t)a3 columnName:(unint64_t)a4;
- (unint64_t)columnName;
- (unint64_t)sqlOp;
- (void)setColumnName:(unint64_t)a3;
- (void)setSqlOp:(unint64_t)a3;
@end

@implementation CKKSSQLWhereColumn

- (CKKSSQLWhereColumn)initWithOperation:(unint64_t)a3 columnName:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CKKSSQLWhereColumn;
  result = -[CKKSSQLWhereColumn init](&v7, "init");
  if (result)
  {
    result->_sqlOp = a3;
    result->_columnName = a4;
  }

  return result;
}

- (unint64_t)sqlOp
{
  return self->_sqlOp;
}

- (void)setSqlOp:(unint64_t)a3
{
  self->_sqlOp = a3;
}

- (unint64_t)columnName
{
  return self->_columnName;
}

- (void)setColumnName:(unint64_t)a3
{
  self->_columnName = a3;
}

+ (id)op:(unint64_t)a3 column:(unint64_t)a4
{
  return  -[CKKSSQLWhereColumn initWithOperation:columnName:]( objc_alloc(&OBJC_CLASS___CKKSSQLWhereColumn),  "initWithOperation:columnName:",  a3,  a4);
}

@end