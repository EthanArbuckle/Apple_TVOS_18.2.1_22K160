@interface SHServerLyricsResponse
- (NSDictionary)lyricsDictionary;
- (SHServerLyricsResponse)initWithLyricsDictionary:(id)a3;
- (id)itemForIdentifiers:(id)a3;
- (void)setLyricsDictionary:(id)a3;
@end

@implementation SHServerLyricsResponse

- (SHServerLyricsResponse)initWithLyricsDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHServerLyricsResponse;
  v6 = -[SHServerLyricsResponse init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lyricsDictionary, a3);
  }

  return v7;
}

- (id)itemForIdentifiers:(id)a3
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerLyricsResponse lyricsDictionary](self, "lyricsDictionary", (void)v17));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

        if (v11)
        {
          v13 = objc_alloc(&OBJC_CLASS___SHLyricsResponseItem);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerLyricsResponse lyricsDictionary](self, "lyricsDictionary"));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v9]);
          v12 = -[SHLyricsResponseItem initWithLyricsItemDictionary:](v13, "initWithLyricsItemDictionary:", v15);

          goto LABEL_11;
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v12 = 0LL;
LABEL_11:

  return v12;
}

- (NSDictionary)lyricsDictionary
{
  return self->_lyricsDictionary;
}

- (void)setLyricsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end