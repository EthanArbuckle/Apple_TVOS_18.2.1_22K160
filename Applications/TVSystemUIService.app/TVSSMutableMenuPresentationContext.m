@interface TVSSMutableMenuPresentationContext
- (TVSSMutableMenuPresentationContext)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation TVSSMutableMenuPresentationContext

- (TVSSMutableMenuPresentationContext)init
{
  SEL v5 = a2;
  v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSMutableMenuPresentationContext;
  v6 = -[TVSSMenuPresentationContext initWithPresentationContext:](&v4, "initWithPresentationContext:");
  v3 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TVSSMenuPresentationContext initWithPresentationContext:]( objc_alloc(&OBJC_CLASS___TVSSMenuPresentationContext),  "initWithPresentationContext:",  self);
}

- (void)setReason:(unint64_t)a3
{
  self->super._reason = a3;
}

@end