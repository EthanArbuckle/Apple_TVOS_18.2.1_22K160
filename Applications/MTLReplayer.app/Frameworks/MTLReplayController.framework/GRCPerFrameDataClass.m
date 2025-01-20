@interface GRCPerFrameDataClass
- (GRCPerFrameDataClass)init;
- (id).cxx_construct;
@end

@implementation GRCPerFrameDataClass

- (GRCPerFrameDataClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GRCPerFrameDataClass;
  return -[GRCPerFrameDataClass init](&v3, "init");
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end