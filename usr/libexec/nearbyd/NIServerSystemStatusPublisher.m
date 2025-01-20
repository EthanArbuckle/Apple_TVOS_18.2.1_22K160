@interface NIServerSystemStatusPublisher
- (NIServerSystemStatusPublisher)initWithSystemStatus:(int)a3;
@end

@implementation NIServerSystemStatusPublisher

- (NIServerSystemStatusPublisher)initWithSystemStatus:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NIServerSystemStatusPublisher;
  return -[NIServerSystemStatusPublisher init](&v4, "init", *(void *)&a3);
}

@end