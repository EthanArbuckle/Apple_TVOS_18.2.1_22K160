@interface SHMusicVideoResponseItem
- (NSDictionary)musicVideoItemDictionary;
- (NSURL)url;
- (SHMusicVideoResponseItem)initWithMusicVideoItemDictionary:(id)a3;
- (void)setMusicVideoItemDictionary:(id)a3;
@end

@implementation SHMusicVideoResponseItem

- (SHMusicVideoResponseItem)initWithMusicVideoItemDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHMusicVideoResponseItem;
  v6 = -[SHMusicVideoResponseItem init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_musicVideoItemDictionary, a3);
  }

  return v7;
}

- (NSURL)url
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHMusicVideoResponseItem musicVideoItemDictionary](self, "musicVideoItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"url"]);

  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
  }
  else {
    id v5 = 0LL;
  }

  return (NSURL *)v5;
}

- (NSDictionary)musicVideoItemDictionary
{
  return self->_musicVideoItemDictionary;
}

- (void)setMusicVideoItemDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end