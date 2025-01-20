@interface NSMutableDictionary
- (void)addLines:(id)a3 fromOwner:(id)a4;
@end

@implementation NSMutableDictionary

- (void)addLines:(id)a3 fromOwner:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v6));
  if (!v8) {
    v8 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v7);
  }
  [v8 addLines:v9];
  -[NSMutableDictionary setValue:forKey:](self, "setValue:forKey:", v8, v6);
}

@end