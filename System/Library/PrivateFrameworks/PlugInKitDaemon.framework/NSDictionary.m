@interface NSDictionary
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
@end

@implementation NSDictionary

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", a3));
  if ((objc_opt_isKindOfClass(v5, a4) & 1) != 0) {
    v6 = v5;
  }
  else {
    v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

@end