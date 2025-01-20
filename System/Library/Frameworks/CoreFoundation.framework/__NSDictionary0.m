@interface __NSDictionary0
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)keyEnumerator;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)retainCount;
@end

@implementation __NSDictionary0

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (unint64_t)count
{
  return 0LL;
}

- (id)objectForKey:(id)a3
{
  return 0LL;
}

- (id)keyEnumerator
{
  return &__NSEnumerator0__struct;
}

- (id)objectEnumerator
{
  return &__NSEnumerator0__struct;
}

@end