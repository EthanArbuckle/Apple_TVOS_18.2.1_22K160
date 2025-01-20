@interface MRCAMLAnimation
- (NSArray)keyframes;
- (NSString)keyPath;
- (void)dealloc;
- (void)setKeyPath:(id)a3;
- (void)setKeyframes:(id)a3;
@end

@implementation MRCAMLAnimation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRCAMLAnimation;
  -[MRCAMLAnimation dealloc](&v3, "dealloc");
}

- (NSString)keyPath
{
  return self->keyPath;
}

- (void)setKeyPath:(id)a3
{
}

- (NSArray)keyframes
{
  return self->keyframes;
}

- (void)setKeyframes:(id)a3
{
}

@end