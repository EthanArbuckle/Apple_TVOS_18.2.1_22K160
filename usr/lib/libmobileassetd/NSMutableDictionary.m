@interface NSMutableDictionary
- (void)setSafeObject:(id)a3 forKey:(id)a4;
@end

@implementation NSMutableDictionary

- (void)setSafeObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:");
    }
  }

@end