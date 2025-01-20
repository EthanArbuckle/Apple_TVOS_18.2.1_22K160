@interface TVMusicGradientView
+ (Class)layerClass;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (NSString)type;
- (void)setColors:(id)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setLocations:(id)a3;
- (void)setStartPoint:(CGPoint)a3;
- (void)setType:(id)a3;
@end

@implementation TVMusicGradientView

- (NSArray)colors
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 colors]);

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithCGColor:]( &OBJC_CLASS___UIColor,  "colorWithCGColor:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9)));
        -[NSMutableArray addObject:](v3, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return (NSArray *)v3;
}

- (void)setColors:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v13 + 1) + 8LL * (void)v10);
        -[NSMutableArray addObject:](v5, "addObject:", objc_msgSend(v11, "CGColor", (void)v13));
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer"));
  [v12 setColors:v5];
}

- (NSArray)locations
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 locations]);

  return (NSArray *)v3;
}

- (void)setLocations:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer"));
  [v5 setLocations:v4];
}

- (NSString)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 type]);

  return (NSString *)v3;
}

- (void)setType:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer"));
  [v5 setType:v4];
}

- (CGPoint)startPoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer"));
  [v2 startPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer"));
  objc_msgSend(v5, "setStartPoint:", x, y);
}

- (CGPoint)endPoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer"));
  [v2 endPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicGradientView _gradientLayer](self, "_gradientLayer"));
  objc_msgSend(v5, "setEndPoint:", x, y);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CAGradientLayer, a2);
}

@end