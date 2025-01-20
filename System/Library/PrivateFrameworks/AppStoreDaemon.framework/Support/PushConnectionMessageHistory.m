@interface PushConnectionMessageHistory
- (void)dealloc;
@end

@implementation PushConnectionMessageHistory

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PushConnectionMessageHistory;
  -[PushConnectionMessageHistory dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end