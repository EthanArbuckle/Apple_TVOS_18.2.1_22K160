@interface VMUReverseGraphEnumerator
- (VMUReverseGraphEnumerator)initWithGraph:(id)a3;
- (id)statusDisplayDescription;
@end

@implementation VMUReverseGraphEnumerator

- (VMUReverseGraphEnumerator)initWithGraph:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VMUReverseGraphEnumerator;
  v5 = -[VMUGraphEnumerator initWithGraph:](&v7, sel_initWithGraph_, v4);

  return v5;
}

- (id)statusDisplayDescription
{
  return @"reverse";
}

@end