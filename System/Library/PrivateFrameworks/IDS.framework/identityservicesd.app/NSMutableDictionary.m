@interface NSMutableDictionary
- (void)setPreflightStack:(id)a3 forIdentifier:(id)a4;
@end

@implementation NSMutableDictionary

- (void)setPreflightStack:(id)a3 forIdentifier:(id)a4
{
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", a4);
  }
}

@end