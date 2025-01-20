@interface PDApplicationMessageManager
- (PDApplicationMessageManager)init;
- (void)dealloc;
@end

@implementation PDApplicationMessageManager

- (PDApplicationMessageManager)init
{
  return 0LL;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PDApplicationMessageManager;
  -[PDApplicationMessageManager dealloc](&v2, "dealloc");
}

- (void).cxx_destruct
{
}

@end