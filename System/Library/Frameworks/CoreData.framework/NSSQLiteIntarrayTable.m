@interface NSSQLiteIntarrayTable
- (void)dealloc;
@end

@implementation NSSQLiteIntarrayTable

- (void)dealloc
{
  self->_intarrayTable = 0LL;

  self->_intarrayTableName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLiteIntarrayTable;
  -[NSSQLiteIntarrayTable dealloc](&v3, sel_dealloc);
}

@end