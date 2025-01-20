@interface PDContactlessPresentationEventPreArm
- (id)_init;
@end

@implementation PDContactlessPresentationEventPreArm

- (id)_init
{
  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS___PDContactlessPresentationEvent;
    self = -[PDContactlessPresentationEvent init](&v2, "init");
    if (self) {
      *((void *)self + 1) = 0LL;
    }
  }

  return self;
}

@end