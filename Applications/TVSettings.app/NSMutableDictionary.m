@interface NSMutableDictionary
- (TVFoundColorModes)tvs_foundColorModeForDisplayMode:(id)a3;
- (void)tvs_setFoundColorMode:(TVFoundColorModes)a3 forDisplayMode:(id)a4;
@end

@implementation NSMutableDictionary

- (void)tvs_setFoundColorMode:(TVFoundColorModes)a3 forDisplayMode:(id)a4
{
  TVFoundColorModes v9 = a3;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  &v9,  "{TVFoundColorModes=BBB}"));
  v7 = sub_100090DC4(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", v6, v8);
}

- (TVFoundColorModes)tvs_foundColorModeForDisplayMode:(id)a3
{
  v4 = sub_100090DC4(a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v5));

  if (v6)
  {
    [v6 getValue:&v8];
  }

  else
  {
    unsigned __int16 v8 = 0;
    unsigned __int8 v9 = 0;
  }

  return (TVFoundColorModes)(v8 | (v9 << 16));
}

@end