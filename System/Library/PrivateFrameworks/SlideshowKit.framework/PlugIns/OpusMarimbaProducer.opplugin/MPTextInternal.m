@interface MPTextInternal
- (NSAttributedString)attributedString;
- (void)dealloc;
- (void)setAttributedString:(id)a3;
@end

@implementation MPTextInternal

- (void)dealloc
{
  self->attributedString = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPTextInternal;
  -[MPTextInternal dealloc](&v3, "dealloc");
}

- (NSAttributedString)attributedString
{
  return self->attributedString;
}

- (void)setAttributedString:(id)a3
{
}

@end