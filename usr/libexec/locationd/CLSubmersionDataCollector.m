@interface CLSubmersionDataCollector
- (CLSubmersionDataCollector)initWithUniverse:(id)a3 andStateMachine:(id)a4;
- (void)dealloc;
@end

@implementation CLSubmersionDataCollector

- (CLSubmersionDataCollector)initWithUniverse:(id)a3 andStateMachine:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLSubmersionDataCollector;
  return -[CLSubmersionDataCollector init](&v5, "init", a3, a4);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLSubmersionDataCollector;
  -[CLSubmersionDataCollector dealloc](&v2, "dealloc");
}

@end