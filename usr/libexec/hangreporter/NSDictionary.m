@interface NSDictionary
- (id)objectForKey:(id)a3 checkingKindOfClass:(Class)a4;
@end

@implementation NSDictionary

- (id)objectForKey:(id)a3 checkingKindOfClass:(Class)a4
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, a4) & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

@end