@interface SHServerGetResponseParser
+ (id)hapticSongItemFromResourcesResponse:(id)a3 hapticItemIDs:(id)a4 songDuration:(double)a5;
+ (id)hapticSongItemFromServerData:(id)a3 songDuration:(double)a4 error:(id *)a5;
+ (id)mediaDictionaryFromResourcesResponse:(id)a3 shazamID:(id)a4 campaignToken:(id)a5;
+ (id)mediaItemFromResourcesResponse:(id)a3 shazamID:(id)a4 campaignToken:(id)a5;
+ (id)mediaItemsFromServerData:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation SHServerGetResponseParser

+ (id)mediaItemsFromServerData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v46 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v46));
  id v10 = v46;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"errors"]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

    if (v13)
    {
      v14 = -[SHServerErrorResponse initWithErrorDictionary:]( objc_alloc(&OBJC_CLASS___SHServerErrorResponse),  "initWithErrorDictionary:",  v13);
      v15 = (SHServerDataResponse *)objc_claimAutoreleasedReturnValue(-[SHServerErrorResponse error](v14, "error"));
      +[SHCoreError annotateError:withError:](&OBJC_CLASS___SHCoreError, "annotateError:withError:", a5, v15);
      id v16 = 0LL;
    }

    else
    {
      v14 = (SHServerErrorResponse *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"data"]);
      if (v14) {
        v15 = -[SHServerDataResponse initWithDataArray:]( objc_alloc(&OBJC_CLASS___SHServerDataResponse),  "initWithDataArray:",  v14);
      }
      else {
        v15 = 0LL;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"resources"]);
      if (v19)
      {
        v39 = v14;
        v36 = a5;
        v40 = v11;
        v41 = v9;
        v37 = v19;
        v20 = -[SHServerResourcesResponse initWithResourcesDictionary:]( objc_alloc(&OBJC_CLASS___SHServerResourcesResponse),  "initWithResourcesDictionary:",  v19);
        v38 = v15;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerDataResponse shazamIDs](v15, "shazamIDs"));
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v21 count]));
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        id v23 = v21;
        id v24 = [v23 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v43;
          do
          {
            for (i = 0LL; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v43 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
              v29 = (void *)objc_claimAutoreleasedReturnValue([v8 campaignToken]);
              v30 = (void *)objc_claimAutoreleasedReturnValue([a1 mediaItemFromResourcesResponse:v20 shazamID:v28 campaignToken:v29]);

              [v22 addObject:v30];
            }

            id v25 = [v23 countByEnumeratingWithState:&v42 objects:v47 count:16];
          }

          while (v25);
        }

        if ([v22 count])
        {
          id v16 = v22;
          v13 = 0LL;
          v11 = v40;
        }

        else
        {
          uint64_t v33 = sh_log_object(0LL);
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          v13 = 0LL;
          v11 = v40;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "Server response parser: has no media items",  buf,  2u);
          }

          +[SHError annotateClientError:code:underlyingError:]( &OBJC_CLASS___SHError,  "annotateClientError:code:underlyingError:",  v36,  202LL,  0LL);
          id v16 = 0LL;
        }

        v9 = v41;
        v15 = v38;
        v14 = v39;
        v19 = v37;
      }

      else
      {
        uint64_t v31 = sh_log_object(0LL);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Server response parser: has no match",  buf,  2u);
        }

        +[SHError annotateClientError:code:underlyingError:]( &OBJC_CLASS___SHError,  "annotateClientError:code:underlyingError:",  a5,  202LL,  0LL);
        id v16 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v17 = sh_log_object(v10);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Server response parser: No response %@",  buf,  0xCu);
    }

    +[SHError annotateClientError:code:underlyingError:]( &OBJC_CLASS___SHError,  "annotateClientError:code:underlyingError:",  a5,  202LL,  v11);
    id v16 = 0LL;
  }

  return v16;
}

+ (id)hapticSongItemFromServerData:(id)a3 songDuration:(double)a4 error:(id *)a5
{
  id v30 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v30));
  id v9 = v30;
  id v10 = v9;
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"errors"]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

    if (v12)
    {
      v13 = -[SHServerErrorResponse initWithErrorDictionary:]( objc_alloc(&OBJC_CLASS___SHServerErrorResponse),  "initWithErrorDictionary:",  v12);
      v14 = (SHServerDataResponse *)objc_claimAutoreleasedReturnValue(-[SHServerErrorResponse error](v13, "error"));
      +[SHCoreError annotateError:withError:](&OBJC_CLASS___SHCoreError, "annotateError:withError:", a5, v14);
      v15 = 0LL;
    }

    else
    {
      v13 = (SHServerErrorResponse *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"data"]);
      if (v13) {
        v14 = -[SHServerDataResponse initWithDataArray:]( objc_alloc(&OBJC_CLASS___SHServerDataResponse),  "initWithDataArray:",  v13);
      }
      else {
        v14 = 0LL;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"resources"]);
      if (v18)
      {
        v19 = -[SHServerResourcesResponse initWithResourcesDictionary:]( objc_alloc(&OBJC_CLASS___SHServerResourcesResponse),  "initWithResourcesDictionary:",  v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerDataResponse hapticItemIDs](v14, "hapticItemIDs"));
        id v22 = objc_msgSend( (id)objc_opt_class(a1, v21),  "hapticSongItemFromResourcesResponse:hapticItemIDs:songDuration:",  v19,  v20,  a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v22);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 hapticsURL]);

        if (!v23)
        {
          uint64_t v25 = sh_log_object(v24);
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Server response parser: has no song haptic items",  buf,  2u);
          }
        }
      }

      else
      {
        uint64_t v27 = sh_log_object(0LL);
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "Server response parser: has no song haptic resources",  buf,  2u);
        }

        +[SHError annotateClientError:code:underlyingError:]( &OBJC_CLASS___SHError,  "annotateClientError:code:underlyingError:",  a5,  600LL,  0LL);
        v15 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v16 = sh_log_object(v9);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Server response parser: No response %@",  buf,  0xCu);
    }

    +[SHError annotateClientError:code:underlyingError:]( &OBJC_CLASS___SHError,  "annotateClientError:code:underlyingError:",  a5,  600LL,  v10);
    v15 = 0LL;
  }

  return v15;
}

+ (id)mediaItemFromResourcesResponse:(id)a3 shazamID:(id)a4 campaignToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SHServerGetResponseParser mediaDictionaryFromResourcesResponse:shazamID:campaignToken:]( &OBJC_CLASS___SHServerGetResponseParser,  "mediaDictionaryFromResourcesResponse:shazamID:campaignToken:",  v9,  v8,  v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SHMediaItem mediaItemWithProperties:](&OBJC_CLASS___SHMediaItem, "mediaItemWithProperties:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 shazamResponse]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 itemForIdentifier:v8]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 songsResponse]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 songRelationIDs]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 itemForIdentifiers:v15]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 rawResponseWithCampaignToken:v7]);
  objc_msgSend(v11, "set_rawResponseSongs:", v17);

  return v11;
}

+ (id)hapticSongItemFromResourcesResponse:(id)a3 hapticItemIDs:(id)a4 songDuration:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sh_log_object(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v50 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Converting duration of %f from seconds to milliseconds",  buf,  0xCu);
  }

  double v11 = fmax(a5 * 1000.0, 0.0);
  uint64_t v13 = sh_log_object(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Parsing song using new duration %fms", buf, 0xCu);
  }

  if ([v8 count] == (id)1)
  {
    uint64_t v15 = sh_log_object(1LL);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Only one song item in response, returning its haptics url.",  buf,  2u);
    }

    id v17 = (id)objc_claimAutoreleasedReturnValue([v7 songsResponse]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    v55 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v17 itemForIdentifiers:v19]);
  }

  else
  {
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v17 = v8;
    id v21 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v21)
    {
      id v22 = v21;
      id v44 = v8;
      v20 = 0LL;
      uint64_t v23 = *(void *)v46;
      double v24 = 1.79769313e308;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v17);
          }
          uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)i);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v7 songsResponse]);
          uint64_t v53 = v26;
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v53,  1LL));
          v29 = (void *)objc_claimAutoreleasedReturnValue([v27 itemForIdentifiers:v28]);

          id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 durationInMilliseconds]);
          [v30 doubleValue];
          double v32 = vabdd_f64(v11, v31);

          if (v32 < v24)
          {
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v29 hapticsURL]);

            if (v33)
            {
              uint64_t v35 = sh_log_object(v34);
              v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                v37 = (void *)objc_claimAutoreleasedReturnValue([v29 hapticsURL]);
                *(_DWORD *)buf = 134218242;
                double v50 = v32;
                __int16 v51 = 2112;
                v52 = v37;
                _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "New difference %f is smaller than existing difference, setting hapticsURL to: %@",  buf,  0x16u);
              }

              id v38 = v29;
              v20 = v38;
            }
          }

          v39 = (void *)objc_claimAutoreleasedReturnValue([v29 hapticsURL]);

          if (v39)
          {
            uint64_t v41 = sh_log_object(v40);
            __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "Song item has haptics url, setting new minimum difference",  buf,  2u);
            }

            double v24 = fmin(v24, v32);
          }
        }

        id v22 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }

      while (v22);
      id v8 = v44;
    }

    else
    {
      v20 = 0LL;
    }
  }

  return v20;
}

+ (id)mediaDictionaryFromResourcesResponse:(id)a3 shazamID:(id)a4 campaignToken:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 shazamResponse]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 itemForIdentifier:v9]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 shazamID]);
  [v10 setValue:v13 forKey:SHMediaItemShazamID];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 shazamURL]);
  [v10 setValue:v14 forKey:SHMediaItemWebURL];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
  [v10 setValue:v15 forKey:SHMediaItemTitle];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 artistName]);
  [v10 setValue:v16 forKey:SHMediaItemSubtitle];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 artistName]);
  [v10 setValue:v17 forKey:SHMediaItemArtist];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v12 shazamCount]);
  [v10 setValue:v18 forKey:SHMediaItemShazamCount];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v12 songRelationIDs]);
  id v20 = [v19 count];

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 songsResponse]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 songRelationIDs]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 itemForIdentifiers:v22]);

    double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 appleMusicID]);
    [v10 setValue:v24 forKey:SHMediaItemAppleMusicID];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 artworkURL]);
    SHMediaItemProperty v26 = SHMediaItemArtworkURL;
    [v10 setValue:v25 forKey:SHMediaItemArtworkURL];

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v23 genreNames]);
    [v10 setValue:v27 forKey:SHMediaItemGenres];

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v23 releaseDate]);
    [v10 setValue:v28 forKey:SHMediaItemReleaseDate];

    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v23 isExplicitContent]));
    [v10 setValue:v29 forKey:SHMediaItemExplicitContent];

    id v30 = (void *)objc_claimAutoreleasedReturnValue([v23 albumName]);
    [v10 setValue:v30 forKey:SHMediaItemAlbumName];

    double v31 = (void *)objc_claimAutoreleasedReturnValue([v23 isrc]);
    [v10 setValue:v31 forKey:SHMediaItemISRC];

    double v32 = (void *)objc_claimAutoreleasedReturnValue([v23 appleMusicURLString]);
    if (v32)
    {
      uint64_t v33 = objc_alloc(&OBJC_CLASS___SHTokenizedURL);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v23 appleMusicURLString]);
      uint64_t v35 = -[SHTokenizedURL initWithString:](v33, "initWithString:", v34);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SHTokenizedURL URLRepresentation](v35, "URLRepresentation"));
      [v10 setValue:v36 forKey:SHMediaItemAppleMusicURL];
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v23 lyricsRelationIDs]);
    id v38 = [v37 count];

    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue([v7 lyricsResponse]);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v23 lyricsRelationIDs]);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v39 itemForIdentifiers:v40]);

      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 lyricsSnippet]);
      [v10 setValue:v42 forKey:SHMediaItemLyricsSnippet];

      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v41 staticLyrics]);
      [v10 setValue:v43 forKey:SHMediaItemStaticLyricLines];
    }

    id v44 = (void *)objc_claimAutoreleasedReturnValue([v23 musicVideoRelationIDs]);
    id v45 = [v44 count];

    if (v45)
    {
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v7 musicVideoResponse]);
      __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v23 musicVideoRelationIDs]);
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v46 itemForIdentifiers:v47]);

      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 url]);
      [v10 setValue:v49 forKey:SHMediaItemVideoURL];
    }
  }

  else
  {
    SHMediaItemProperty v26 = SHMediaItemArtworkURL;
  }

  double v50 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v26]);

  if (!v50)
  {
    __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v12 artworkURL]);
    [v10 setValue:v51 forKey:v26];
  }

  id v52 = [v10 copy];

  return v52;
}

@end