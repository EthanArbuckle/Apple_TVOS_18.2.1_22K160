@interface SHServerMatchResponseParser
+ (id)matcherResponseFromServerData:(id)a3 signature:(id)a4 location:(id)a5 context:(id)a6;
+ (id)mediaItemFromResourcesResponse:(id)a3 shazamID:(id)a4 signatureStartDate:(id)a5 campaignToken:(id)a6 location:(id)a7;
@end

@implementation SHServerMatchResponseParser

+ (id)matcherResponseFromServerData:(id)a3 signature:(id)a4 location:(id)a5 context:(id)a6
{
  id v10 = a4;
  id v100 = a5;
  id v101 = a6;
  id v106 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v106));
  v12 = (SHMatch *)v106;
  v13 = v12;
  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"errors"]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

    if (v15) {
      v16 = -[SHServerErrorResponse initWithErrorDictionary:]( objc_alloc(&OBJC_CLASS___SHServerErrorResponse),  "initWithErrorDictionary:",  v15);
    }
    else {
      v16 = 0LL;
    }
    v20 = (SHServerResultsResponse *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"results"]);
    v21 = v20;
    if (v20)
    {
      v20 = -[SHServerResultsResponse initWithResultsDictionary:]( objc_alloc(&OBJC_CLASS___SHServerResultsResponse),  "initWithResultsDictionary:",  v20);
      v22 = v20;
      if (v20) {
        goto LABEL_16;
      }
    }

    else
    {
      v22 = 0LL;
    }

    if (v16)
    {
      uint64_t v23 = sh_log_object(v20);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (SHMatch *)objc_claimAutoreleasedReturnValue(-[SHServerErrorResponse error](v16, "error"));
        *(_DWORD *)buf = 138412290;
        v109 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Server response parser: Error, %@",  buf,  0xCu);
      }

      id v26 = objc_alloc(&OBJC_CLASS___SHMatcherResponse);
      [v101 defaultRecordingIntermissionInSeconds];
      double v28 = v27;
      [v101 defaultRecordingSignatureOffsetInSeconds];
      double v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerErrorResponse error](v16, "error"));
      double v32 = 0.0;
      v33 = v26;
      double v34 = v28;
      double v35 = v30;
      goto LABEL_21;
    }

+ (id)mediaItemFromResourcesResponse:(id)a3 shazamID:(id)a4 signatureStartDate:(id)a5 campaignToken:(id)a6 location:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[SHServerGetResponseParser mediaDictionaryFromResourcesResponse:shazamID:campaignToken:]( &OBJC_CLASS___SHServerGetResponseParser,  "mediaDictionaryFromResourcesResponse:shazamID:campaignToken:",  v11,  v15,  v14));
  id v17 = [v16 mutableCopy];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 shazamResponse]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 itemForIdentifier:v15]);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 matchOffset]);
  [v17 setValue:v20 forKey:SHMediaItemMatchOffset];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v19 speedSkew]);
  [v17 setValue:v21 forKey:SHMediaItemSpeedSkew];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v19 frequencySkew]);
  [v17 setValue:v22 forKey:SHMediaItemFrequencySkew];

  [v17 setValue:v12 forKey:SHMediaItemAudioStartDate];
  [v17 setValue:v13 forKey:SHMediaItemMatchLocation];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v19 songRelationIDs]);
  id v24 = [v23 count];

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v11 songsResponse]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v19 songRelationIDs]);
    double v27 = (void *)objc_claimAutoreleasedReturnValue([v25 itemForIdentifiers:v26]);

    double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 lyricsRelationIDs]);
    id v29 = [v28 count];

    if (v29)
    {
      double v30 = (void *)objc_claimAutoreleasedReturnValue([v11 lyricsResponse]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v27 lyricsRelationIDs]);
      double v32 = (void *)objc_claimAutoreleasedReturnValue([v30 itemForIdentifiers:v31]);

      v33 = (void *)objc_claimAutoreleasedReturnValue([v19 matchOffset]);
      [v33 doubleValue];
      double v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "snippetFromOffset:"));
      [v17 setValue:v34 forKey:SHMediaItemSyncedLyricsSnippet];

      double v35 = (void *)objc_claimAutoreleasedReturnValue([v19 matchOffset]);
      [v35 doubleValue];
      v37 = (void *)objc_claimAutoreleasedReturnValue([v12 dateByAddingTimeInterval:-v36]);

      id v38 = objc_alloc(&OBJC_CLASS___SHSyncedLyrics);
      v49 = v32;
      id v39 = v11;
      id v40 = v14;
      id v41 = v12;
      double v42 = (void *)objc_claimAutoreleasedReturnValue([v32 lyricLines]);
      double v43 = (void *)objc_claimAutoreleasedReturnValue([v32 songwriters]);
      id v29 = [v38 initWithLyricsStartDate:v37 lines:v42 songwriters:v43];

      id v12 = v41;
      id v14 = v40;
      id v11 = v39;
    }
  }

  else
  {
    id v29 = 0LL;
    double v27 = 0LL;
  }

  double v44 = objc_alloc(&OBJC_CLASS___SHMatchedMediaItem);
  id v45 = [v17 copy];
  double v46 = -[SHMatchedMediaItem initWithMatchedMediaItemDictionary:syncedLyrics:]( v44,  "initWithMatchedMediaItemDictionary:syncedLyrics:",  v45,  v29);

  double v47 = (void *)objc_claimAutoreleasedReturnValue([v27 rawResponseWithCampaignToken:v14]);
  -[SHMatchedMediaItem set_rawResponseSongs:](v46, "set_rawResponseSongs:", v47);

  return v46;
}

@end