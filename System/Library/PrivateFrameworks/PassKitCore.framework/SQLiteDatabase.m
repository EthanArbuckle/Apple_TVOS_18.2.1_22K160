@interface SQLiteDatabase
- (SQLiteDatabase)init;
- (void)dealloc;
@end

@implementation SQLiteDatabase

- (SQLiteDatabase)init
{
  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SQLiteDatabase;
  -[SQLiteDatabase dealloc](&v3, "dealloc");
}

@end