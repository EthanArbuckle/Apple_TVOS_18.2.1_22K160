@interface UAActivityNotifier
- (BOOL)requiresBoosted;
- (NSSet)items;
- (NSSet)notifiedItems;
- (UAActivityNotifier)initWithManager:(id)a3 name:(id)a4;
@end

@implementation UAActivityNotifier

- (NSSet)notifiedItems
{
  return 0LL;
}

- (NSSet)items
{
  return 0LL;
}

- (BOOL)requiresBoosted
{
  return 0;
}

- (UAActivityNotifier)initWithManager:(id)a3 name:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UAActivityNotifier;
  return -[UACornerActionManagerHandler initWithManager:name:](&v5, "initWithManager:name:", a3, a4);
}

@end