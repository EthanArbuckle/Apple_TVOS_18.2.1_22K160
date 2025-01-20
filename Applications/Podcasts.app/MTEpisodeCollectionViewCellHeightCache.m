@interface MTEpisodeCollectionViewCellHeightCache
- (MTEpisodeCollectionViewCellHeightCache)init;
- (double)cachedHeightForWidth:(double)a3 style:(unint64_t)a4;
- (id)_keyForWidth:(double)a3 style:(unint64_t)a4;
- (void)addCachedHeight:(double)a3 forWidth:(double)a4 style:(unint64_t)a5;
- (void)dealloc;
- (void)sizeCategoryChanged:(id)a3;
@end

@implementation MTEpisodeCollectionViewCellHeightCache

- (MTEpisodeCollectionViewCellHeightCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCellHeightCache;
  v2 = -[MTEpisodeCollectionViewCellHeightCache init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"sizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v4 = objc_opt_new(&OBJC_CLASS___NSCache);
    cachedHeights = v2->_cachedHeights;
    v2->_cachedHeights = v4;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCellHeightCache;
  -[MTEpisodeCollectionViewCellHeightCache dealloc](&v4, "dealloc");
}

- (void)sizeCategoryChanged:(id)a3
{
}

- (double)cachedHeightForWidth:(double)a3 style:(unint64_t)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCellHeightCache _keyForWidth:style:](self, "_keyForWidth:style:", a4, a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_cachedHeights, "objectForKey:", v5));
  [v6 floatValue];
  double v8 = v7;

  return v8;
}

- (void)addCachedHeight:(double)a3 forWidth:(double)a4 style:(unint64_t)a5
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCellHeightCache _keyForWidth:style:](self, "_keyForWidth:style:", a5, a4));
  cachedHeights = self->_cachedHeights;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  -[NSCache setObject:forKey:](cachedHeights, "setObject:forKey:", v8, v9);
}

- (id)_keyForWidth:(double)a3 style:(unint64_t)a4
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu-%lf",  a4,  *(void *)&a3);
}

- (void).cxx_destruct
{
}

@end