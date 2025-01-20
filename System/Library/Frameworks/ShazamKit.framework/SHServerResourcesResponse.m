@interface SHServerResourcesResponse
- (NSDictionary)resourcesDictionary;
- (SHServerLyricsResponse)lyricsResponse;
- (SHServerMusicVideoResponse)musicVideoResponse;
- (SHServerResourcesResponse)initWithResourcesDictionary:(id)a3;
- (SHServerShazamResponse)shazamResponse;
- (SHServerSongsResponse)songsResponse;
- (void)setResourcesDictionary:(id)a3;
@end

@implementation SHServerResourcesResponse

- (SHServerResourcesResponse)initWithResourcesDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHServerResourcesResponse;
  v6 = -[SHServerResourcesResponse init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resourcesDictionary, a3);
  }

  return v7;
}

- (SHServerSongsResponse)songsResponse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerResourcesResponse resourcesDictionary](self, "resourcesDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"songs"]);

  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___SHServerSongsResponse);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerResourcesResponse resourcesDictionary](self, "resourcesDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"songs"]);
    v8 = -[SHServerSongsResponse initWithSongsDictionary:](v5, "initWithSongsDictionary:", v7);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (SHServerShazamResponse)shazamResponse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerResourcesResponse resourcesDictionary](self, "resourcesDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"shazam-songs"]);

  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___SHServerShazamResponse);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerResourcesResponse resourcesDictionary](self, "resourcesDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"shazam-songs"]);
    v8 = -[SHServerShazamResponse initWithShazamDictionary:](v5, "initWithShazamDictionary:", v7);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (SHServerLyricsResponse)lyricsResponse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerResourcesResponse resourcesDictionary](self, "resourcesDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"lyrics"]);

  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___SHServerLyricsResponse);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerResourcesResponse resourcesDictionary](self, "resourcesDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"lyrics"]);
    v8 = -[SHServerLyricsResponse initWithLyricsDictionary:](v5, "initWithLyricsDictionary:", v7);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (SHServerMusicVideoResponse)musicVideoResponse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerResourcesResponse resourcesDictionary](self, "resourcesDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"music-videos"]);

  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___SHServerMusicVideoResponse);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerResourcesResponse resourcesDictionary](self, "resourcesDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"music-videos"]);
    v8 = -[SHServerMusicVideoResponse initWithMusicVideoDictionary:](v5, "initWithMusicVideoDictionary:", v7);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (NSDictionary)resourcesDictionary
{
  return self->_resourcesDictionary;
}

- (void)setResourcesDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end