@interface MTPlayerItemList
- (MTPlayerItemList)initWithPlayerItems:(id)a3;
- (NSArray)playerItems;
- (id)metricsContentIdentifier;
- (void)setPlayerItems:(id)a3;
@end

@implementation MTPlayerItemList

- (MTPlayerItemList)initWithPlayerItems:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTPlayerItemList;
  v5 = -[MTPlayerItemList init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTPlayerItemList setPlayerItems:](v5, "setPlayerItems:", v4);
  }

  return v6;
}

- (id)metricsContentIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItemList playerItems](self, "playerItems"));
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0LL;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItemList playerItems](self, "playerItems"));
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v6]);

      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 metricsContentIdentifier]);
      v10 = (void *)v9;
      if (v9) {
        v11 = (void *)v9;
      }
      else {
        v11 = &__NSDictionary0__struct;
      }
      id v12 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v6));
      [v3 setObject:v12 forKey:v13];

      ++v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerItemList playerItems](self, "playerItems"));
      id v15 = [v14 count];
    }

    while ((unint64_t)v15 > v6);
  }

  return v3;
}

- (NSArray)playerItems
{
  return self->_playerItems;
}

- (void)setPlayerItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end