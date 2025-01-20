@interface TVMusicPlayItemsOptions
+ (id)optionsFromDictionary:(id)a3;
- (BOOL)isFreeContent;
- (BOOL)isVoicePlayableContent;
- (BOOL)shuffle;
- (TVMusicPlayItemsPAFData)pafData;
- (int64_t)playIndex;
- (unint64_t)actionType;
- (void)setActionType:(unint64_t)a3;
- (void)setIsFreeContent:(BOOL)a3;
- (void)setIsVoicePlayableContent:(BOOL)a3;
- (void)setPafData:(id)a3;
- (void)setPlayIndex:(int64_t)a3;
- (void)setShuffle:(BOOL)a3;
@end

@implementation TVMusicPlayItemsOptions

+ (id)optionsFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TVMusicPlayItemsOptions);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"action"]);
  -[TVMusicPlayItemsOptions setActionType:]( v4,  "setActionType:",  +[TVMusicPlaybackIntent playbackActionTypeFromString:]( &OBJC_CLASS___TVMusicPlaybackIntent,  "playbackActionTypeFromString:",  v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"shuffle"]);
  -[TVMusicPlayItemsOptions setShuffle:](v4, "setShuffle:", [v6 BOOLValue]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"playIndex"]);
  v8 = v7;
  if (v7) {
    uint64_t v9 = (uint64_t)[v7 longLongValue];
  }
  else {
    uint64_t v9 = -1LL;
  }
  -[TVMusicPlayItemsOptions setPlayIndex:](v4, "setPlayIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"isFreeContent"]);
  -[TVMusicPlayItemsOptions setIsFreeContent:](v4, "setIsFreeContent:", [v10 BOOLValue]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"isVoicePlayableContent"]);
  -[TVMusicPlayItemsOptions setIsVoicePlayableContent:]( v4,  "setIsVoicePlayableContent:",  [v11 BOOLValue]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"playbackReporting"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"playbackReporting"]);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicPlayItemsPAFData PAFDataFromDictionary:]( &OBJC_CLASS___TVMusicPlayItemsPAFData,  "PAFDataFromDictionary:",  v15));
    -[TVMusicPlayItemsOptions setPafData:](v4, "setPafData:", v16);

    v12 = (void *)v15;
LABEL_7:
  }

  return v4;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (BOOL)shuffle
{
  return self->_shuffle;
}

- (void)setShuffle:(BOOL)a3
{
  self->_shuffle = a3;
}

- (int64_t)playIndex
{
  return self->_playIndex;
}

- (void)setPlayIndex:(int64_t)a3
{
  self->_playIndex = a3;
}

- (BOOL)isFreeContent
{
  return self->_isFreeContent;
}

- (void)setIsFreeContent:(BOOL)a3
{
  self->_isFreeContent = a3;
}

- (BOOL)isVoicePlayableContent
{
  return self->_isVoicePlayableContent;
}

- (void)setIsVoicePlayableContent:(BOOL)a3
{
  self->_isVoicePlayableContent = a3;
}

- (TVMusicPlayItemsPAFData)pafData
{
  return self->_pafData;
}

- (void)setPafData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end