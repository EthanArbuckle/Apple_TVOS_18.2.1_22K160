@interface NSMutableDictionary
- (void)setArrayObject:(id)a3 forKey:(id)a4;
@end

@implementation NSMutableDictionary

- (void)setArrayObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v6));
  if (!v7)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, v6);
  }

  [v7 addObject:v8];
}

@end