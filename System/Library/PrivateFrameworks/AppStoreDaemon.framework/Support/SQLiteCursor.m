@interface SQLiteCursor
- (void)dealloc;
@end

@implementation SQLiteCursor

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SQLiteCursor;
  -[SQLiteCursor dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end