@interface SHLyricsResponseItem
- (MSVLyricsSongInfo)songInfo;
- (NSArray)lyricLines;
- (NSArray)songwriters;
- (NSArray)staticLyrics;
- (NSString)lyricsSnippet;
- (SHLyricsResponseItem)initWithLyricsItemDictionary:(id)a3;
- (id)snippetFromOffset:(double)a3;
- (void)parseTTMLFromLyricsItemDictionary:(id)a3;
- (void)setSongInfo:(id)a3;
@end

@implementation SHLyricsResponseItem

- (SHLyricsResponseItem)initWithLyricsItemDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SHLyricsResponseItem;
  v5 = -[SHLyricsResponseItem init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[SHLyricsResponseItem parseTTMLFromLyricsItemDictionary:](v5, "parseTTMLFromLyricsItemDictionary:", v4);
  }

  return v6;
}

- (NSArray)lyricLines
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLyricsResponseItem songInfo](self, "songInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lyricsLines]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLyricsResponseItem songInfo](self, "songInfo", 0LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lyricsLines]);

  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lyricsText]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
        [v12 startTime];
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[SHLyricLine lyricLineWithText:offset:]( &OBJC_CLASS___SHLyricLine,  "lyricLineWithText:offset:",  v14));
        [v5 addObject:v15];
      }

      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  id v16 = [v5 copy];
  return (NSArray *)v16;
}

- (NSString)lyricsSnippet
{
  return (NSString *)-[SHLyricsResponseItem snippetFromOffset:](self, "snippetFromOffset:", 0.0);
}

- (NSArray)staticLyrics
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLyricsResponseItem songInfo](self, "songInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lyricsLines]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLyricsResponseItem songInfo](self, "songInfo", 0LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lyricsLines]);

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v11) lyricsText]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 string]);
        [v5 addObject:v13];

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  id v14 = [v5 copy];
  return (NSArray *)v14;
}

- (NSArray)songwriters
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLyricsResponseItem songInfo](self, "songInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 songwriters]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLyricsResponseItem songInfo](self, "songInfo", 0LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 songwriters]);

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v11) name]);
        [v5 addObject:v12];

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  id v13 = [v5 copy];
  return (NSArray *)v13;
}

- (void)parseTTMLFromLyricsItemDictionary:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"attributes"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ttml"]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ttml"]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);

    id v8 = [[MSVLyricsTTMLParser alloc] initWithTTMLData:v7];
    id v15 = 0LL;
    id v9 = (MSVLyricsSongInfo *)objc_claimAutoreleasedReturnValue([v8 parseWithError:&v15]);
    id v10 = v15;
    songInfo = self->_songInfo;
    self->_songInfo = v9;

    if (v10)
    {
      uint64_t v13 = sh_log_object(v12);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to parse lyrics song info %@",  buf,  0xCu);
      }
    }
  }
}

- (id)snippetFromOffset:(double)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLyricsResponseItem songInfo](self, "songInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lyricsLineStartingBeforeTimeOffset:a3]);

  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLyricsResponseItem songInfo](self, "songInfo"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lyricsLines]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    if (!v6) {
      goto LABEL_7;
    }
  }

  do
  {
    id v10 = (char *)-[NSMutableString length](v7, "length");
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 lyricsText]);
    uint64_t v12 = &v10[(void)[v11 length]];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 lyricsText]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n", v14));
    -[NSMutableString appendString:](v7, "appendString:", v15);

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 nextLine]);
    v6 = (void *)v16;
  }

  while (v16);

LABEL_7:
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString stringByTrimmingCharactersInSet:](v7, "stringByTrimmingCharactersInSet:", v17));
  id v19 = [v18 copy];

  return v19;
}

- (MSVLyricsSongInfo)songInfo
{
  return self->_songInfo;
}

- (void)setSongInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end