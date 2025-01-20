@interface NSMutableDictionary
- (id)extractObjectForKey:(id)a3;
@end

@implementation NSMutableDictionary

- (id)extractObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v4));
  -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", v4);

  return v5;
}

@end