@interface MTEpisodeDescriptionCache
- (MTEpisodeDescriptionCache)init;
- (NSCache)descriptionCache;
- (NSCache)episodeCache;
- (id)createVideoGlyphAttributedString;
- (id)dependantPropertyKeys;
- (id)descriptionBodyTextForEpisode:(id)a3 html:(BOOL)a4 withAttributes:(id)a5;
- (id)descriptionCacheForEpisodeUuid:(id)a3;
- (id)descriptionFooterTextForEpisode:(id)a3 includesSeasonEpisodeType:(BOOL)a4 includesDuration:(BOOL)a5 includesPlayedIfPlayed:(BOOL)a6 hasBodyText:(BOOL)a7 unavailableReason:(int64_t)a8;
- (id)descriptionForEpisode:(id)a3;
- (id)descriptionForEpisode:(id)a3 options:(unint64_t)a4;
- (id)descriptionKeyForOptions:(unint64_t)a3 unavailableReason:(int64_t)a4;
- (id)descriptionPrefixTextForEpisode:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5;
- (id)descriptionPrefixTextForPlayerItem:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5;
- (id)descriptionTextForEpisode:(id)a3 options:(unint64_t)a4;
- (id)episodeDescription:(id)a3;
- (id)metadataFooterForEpisode:(id)a3;
- (id)metadataFooterForEpisode:(id)a3 includingDuration:(BOOL)a4;
- (id)metadataFooterForEpisode:(id)a3 includingSeasonEpisodeType:(BOOL)a4 includingDuration:(BOOL)a5 includingPlayedIfPlayed:(BOOL)a6;
- (id)metadataHeaderForEpisode:(id)a3;
- (id)metadataHeaderForPlayerItem:(id)a3;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setDescriptionCache:(id)a3;
- (void)setEpisodeCache:(id)a3;
- (void)updateCacheForEpisode:(id)a3;
@end

@implementation MTEpisodeDescriptionCache

- (MTEpisodeDescriptionCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTEpisodeDescriptionCache;
  v2 = -[MTEpisodeDescriptionCache init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"invalidate" name:UIContentSizeCategoryDidChangeNotification object:0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTEpisodeDescriptionCache;
  -[MTEpisodeDescriptionCache dealloc](&v4, "dealloc");
}

- (id)descriptionForEpisode:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
  NSAttributedStringKey v9 = NSFontAttributeName;
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeDescriptionCache descriptionBodyTextForEpisode:html:withAttributes:]( self,  "descriptionBodyTextForEpisode:html:withAttributes:",  v4,  1LL,  v6));

  return v7;
}

- (id)episodeDescription:(id)a3
{
  return -[MTEpisodeDescriptionCache descriptionForEpisode:](self, "descriptionForEpisode:", a3);
}

- (id)descriptionForEpisode:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
  id v8 = [v7 length];

  if (v8)
  {
    NSAttributedStringKey v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    -[MTEpisodeDescriptionCache updateCacheForEpisode:](self, "updateCacheForEpisode:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeDescriptionCache descriptionCacheForEpisodeUuid:]( self,  "descriptionCacheForEpisodeUuid:",  v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeDescriptionCache descriptionKeyForOptions:unavailableReason:]( self,  "descriptionKeyForOptions:unavailableReason:",  a4,  [v6 reasonForNotPlayable]));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
    if (!v12)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeDescriptionCache descriptionTextForEpisode:options:]( self,  "descriptionTextForEpisode:options:",  v6,  a4));
      [v10 setObject:v12 forKey:v11];
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)metadataHeaderForEpisode:(id)a3
{
  return -[MTEpisodeDescriptionCache descriptionForEpisode:options:](self, "descriptionForEpisode:options:", a3, 3LL);
}

- (id)metadataFooterForEpisode:(id)a3
{
  return -[MTEpisodeDescriptionCache metadataFooterForEpisode:includingDuration:]( self,  "metadataFooterForEpisode:includingDuration:",  a3,  0LL);
}

- (id)metadataFooterForEpisode:(id)a3 includingDuration:(BOOL)a4
{
  return -[MTEpisodeDescriptionCache metadataFooterForEpisode:includingSeasonEpisodeType:includingDuration:includingPlayedIfPlayed:]( self,  "metadataFooterForEpisode:includingSeasonEpisodeType:includingDuration:includingPlayedIfPlayed:",  a3,  0LL,  a4,  0LL);
}

- (id)metadataFooterForEpisode:(id)a3 includingSeasonEpisodeType:(BOOL)a4 includingDuration:(BOOL)a5 includingPlayedIfPlayed:(BOOL)a6
{
  uint64_t v6 = 64LL;
  if (a4) {
    uint64_t v6 = 320LL;
  }
  if (a5) {
    v6 |= 0x200uLL;
  }
  if (a6) {
    uint64_t v7 = v6 | 0x400;
  }
  else {
    uint64_t v7 = v6;
  }
  return -[MTEpisodeDescriptionCache descriptionForEpisode:options:](self, "descriptionForEpisode:options:", a3, v7);
}

- (void)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));
  [v3 removeAllObjects];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache episodeCache](self, "episodeCache"));
  [v4 removeAllObjects];
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:kEpisodeUuid]);
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache episodeCache](self, "episodeCache"));

  if (v8 == v6)
  {
    v13 = _NSConcreteStackBlock;
    v10 = sub_10010445C;
    v11 = &v13;
    goto LABEL_5;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));

  if (v9 == v6)
  {
    v12 = _NSConcreteStackBlock;
    v10 = sub_10010449C;
    v11 = &v12;
LABEL_5:
    v11[1] = (void **)3221225472LL;
    v11[2] = (void **)v10;
    v11[3] = (void **)&unk_100240240;
    v11[4] = (void **)self;
    v11[5] = (void **)v7;
    dispatch_async(&_dispatch_main_q, v11);
  }
}

- (NSCache)descriptionCache
{
  descriptionCache = self->_descriptionCache;
  if (!descriptionCache)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSCache);
    objc_super v5 = self->_descriptionCache;
    self->_descriptionCache = v4;

    -[NSCache setDelegate:](self->_descriptionCache, "setDelegate:", self);
    descriptionCache = self->_descriptionCache;
  }

  return descriptionCache;
}

- (NSCache)episodeCache
{
  episodeCache = self->_episodeCache;
  if (!episodeCache)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSCache);
    objc_super v5 = self->_episodeCache;
    self->_episodeCache = v4;

    -[NSCache setDelegate:](self->_episodeCache, "setDelegate:", self);
    episodeCache = self->_episodeCache;
  }

  return episodeCache;
}

- (id)dependantPropertyKeys
{
  if (qword_1002B6BD8 != -1) {
    dispatch_once(&qword_1002B6BD8, &stru_100245050);
  }
  return (id)qword_1002B6BD0;
}

- (id)descriptionCacheForEpisodeUuid:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));
  id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (!v6)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v4, kEpisodeUuid);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));
    [v7 setObject:v6 forKey:v4];
  }

  return v6;
}

- (id)descriptionKeyForOptions:(unint64_t)a3 unavailableReason:(int64_t)a4
{
  if ((a3 & 0x80) != 0) {
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"opt%lu-f-%lu", a4, a3, a4);
  }
  else {
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"opt%lu-c", a4, a3, v6);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)updateCacheForEpisode:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache episodeCache](self, "episodeCache"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache dependantPropertyKeys](self, "dependantPropertyKeys"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionaryWithValuesForKeys:v7]);

  if (([v6 isEqualToDictionary:v8] & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache episodeCache](self, "episodeCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
    [v9 setObject:v8 forKey:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeDescriptionCache descriptionCache](self, "descriptionCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
    [v11 removeObjectForKey:v12];
  }
}

- (id)descriptionTextForEpisode:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
  id v8 = (void *)v7;
  if ((a4 & 0x10) == 0)
  {
    id v9 = 0LL;
    if ((a4 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
    goto LABEL_7;
  }

  NSAttributedStringKey v18 = NSFontAttributeName;
  uint64_t v19 = v7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeDescriptionCache descriptionBodyTextForEpisode:html:withAttributes:]( self,  "descriptionBodyTextForEpisode:html:withAttributes:",  v6,  (a4 >> 5) & 1,  v13));

  if ((a4 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeDescriptionCache descriptionPrefixTextForEpisode:options:trailingNewline:]( self,  "descriptionPrefixTextForEpisode:options:trailingNewline:",  v6,  a4,  [v9 length] != 0));
  v11 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
  v12 = v11;
  if (v10)
  {
    -[NSMutableAttributedString appendAttributedString:](v11, "appendAttributedString:", v10);
  }

- (id)descriptionPrefixTextForEpisode:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5
{
  BOOL v41 = a5;
  char v5 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ((v5 & 2) != 0 && ([v7 pubDate], v9 > 0.0))
  {
    [v7 pubDate];
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    v10 = 0LL;
  }

  if (+[MTEpisodeLockup useLayoutForSkinnyPhones](&OBJC_CLASS___MTEpisodeLockup, "useLayoutForSkinnyPhones")) {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 nanoFriendlyDisplayString]);
  }
  else {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 abbreviatedFriendlyDisplayString]);
  }
  v12 = (void *)v11;
  if (v11)
  {
    id v13 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v11);
    [v8 addObject:v13];
  }

  if ((v5 & 4) != 0 && [v7 isPartiallyPlayed]) {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode timeRemainingStringForEpisode:abbreviated:]( &OBJC_CLASS___MTEpisode,  "timeRemainingStringForEpisode:abbreviated:",  v7,  +[MTEpisodeLockup useLayoutForSkinnyPhones]( &OBJC_CLASS___MTEpisodeLockup,  "useLayoutForSkinnyPhones")));
  }
  else {
    id v14 = 0LL;
  }
  if (![v14 length])
  {
    [v7 duration];
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSString prettyShortStringWithDuration:abbreviated:]( &OBJC_CLASS___NSString,  "prettyShortStringWithDuration:abbreviated:",  +[MTEpisodeLockup useLayoutForSkinnyPhones](&OBJC_CLASS___MTEpisodeLockup, "useLayoutForSkinnyPhones"),  v15));

    id v14 = (void *)v16;
  }

  unsigned __int8 v17 = [v7 isVideo];
  if ((v5 & 8) != 0 && (v17 & 1) != 0)
  {
    NSAttributedStringKey v18 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeDescriptionCache createVideoGlyphAttributedString]( self,  "createVideoGlyphAttributedString"));
    uint64_t v19 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
    v20 = v19;
    if (v18)
    {
      -[NSMutableAttributedString appendAttributedString:](v19, "appendAttributedString:", v18);
    }
  }

  else
  {
    v20 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
  }

  if ([v14 length])
  {
    v21 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v14);
    -[NSMutableAttributedString appendAttributedString:](v20, "appendAttributedString:", v21);
  }

  v40 = v14;
  v42 = v12;
  v43 = v10;
  v44 = v7;
  if (-[NSMutableAttributedString length](v20, "length"))
  {
    id v22 = -[NSMutableAttributedString copy](v20, "copy");
    [v8 addObject:v22];
  }

  v39 = v20;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](&OBJC_CLASS___MTEpisodeLockup, "metadataHeaderFont"));
  NSAttributedStringKey v54 = NSFontAttributeName;
  v55 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
  v26 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  @" ",  v25);
  v27 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  NSAttributedStringKey v52 = NSFontAttributeName;
  v53 = v23;
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
  v29 = -[NSAttributedString initWithString:attributes:](v27, "initWithString:attributes:", @"•", v28);

  v30 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  @"\n",  v25);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100104FBC;
  v45[3] = &unk_100245078;
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
  v46 = v31;
  id v32 = v8;
  id v47 = v32;
  v33 = v26;
  v48 = v33;
  v34 = v29;
  v49 = v34;
  BOOL v51 = v41;
  v35 = v30;
  v50 = v35;
  [v32 enumerateObjectsUsingBlock:v45];
  -[NSMutableAttributedString im_addAttribute:value:](v31, "im_addAttribute:value:", NSFontAttributeName, v24);
  if (v41 && -[NSMutableAttributedString length](v31, "length"))
  {
    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
    [v24 _leading];
    -[NSMutableParagraphStyle setParagraphSpacing:](v36, "setParagraphSpacing:");
    -[NSMutableAttributedString im_addAttribute:value:]( v31,  "im_addAttribute:value:",  NSParagraphStyleAttributeName,  v36);
  }

  if (-[NSMutableAttributedString length](v31, "length")) {
    v37 = -[NSAttributedString initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithAttributedString:",  v31);
  }
  else {
    v37 = 0LL;
  }

  return v37;
}

- (id)descriptionFooterTextForEpisode:(id)a3 includesSeasonEpisodeType:(BOOL)a4 includesDuration:(BOOL)a5 includesPlayedIfPlayed:(BOOL)a6 hasBodyText:(BOOL)a7 unavailableReason:(int64_t)a8
{
  LODWORD(v9) = a7;
  BOOL v73 = a6;
  BOOL v70 = a5;
  BOOL v10 = a4;
  id v11 = a3;
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataFooterFont](&OBJC_CLASS___MTEpisodeLockup, "metadataFooterFont"));
  id v14 = objc_opt_new(&OBJC_CLASS___NSMutableParagraphStyle);
  v77 = v13;
  [v13 lineHeight];
  -[NSMutableParagraphStyle setParagraphSpacingBefore:](v14, "setParagraphSpacingBefore:", v15 * 0.5);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 podcast]);
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 title]);
  NSAttributedStringKey v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisodeUnavailableUtil longStringForUnavailableReason:podcastTitle:]( &OBJC_CLASS___MTEpisodeUnavailableUtil,  "longStringForUnavailableReason:podcastTitle:",  a8,  v17));

  id v74 = [v18 length];
  if (v74)
  {
    if ((_DWORD)v9)
    {
      NSAttributedStringKey v84 = NSParagraphStyleAttributeName;
      v85 = v14;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v85,  &v84,  1LL));
      uint64_t v20 = objc_claimAutoreleasedReturnValue([@"\n" stringByAppendingString:v18]);

      NSAttributedStringKey v18 = (void *)v20;
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    v21 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v18,  v19);
    -[NSMutableAttributedString appendAttributedString:](v12, "appendAttributedString:", v21);
  }

  v75 = v14;
  v76 = v12;
  id v22 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (v10)
  {
    uint64_t v23 = (uint64_t)[v11 seasonNumber];
    uint64_t v24 = (uint64_t)[v11 episodeNumber];
    id v25 = [v11 episodeTypeResolvedValue];
    if (v25 == (id)2)
    {
      if (v23 >= 1 && v24 >= 1)
      {
        id v26 = v11;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v28 = v27;
        v29 = @"EPISODE_AND_SEASON_NUMBER_BONUS";
        goto LABEL_19;
      }

      if (v23 >= 1)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v28 = v32;
        v33 = @"SEASON_NUMBER_BONUS";
        goto LABEL_26;
      }

      if (v24 >= 1)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v28 = v34;
        v35 = @"EPISODE_NUMBER_BONUS";
        goto LABEL_34;
      }

      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v28 = v66;
      v67 = @"BONUS_EPISODE";
    }

    else
    {
      if (v25 != (id)1)
      {
        if (v25) {
          goto LABEL_29;
        }
        if (v23 >= 1 && v24 >= 1)
        {
          id v26 = v11;
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v28 = v27;
          v29 = @"EPISODE_AND_SEASON_NUMBER_FORMAT";
LABEL_19:
          v30 = (void *)objc_claimAutoreleasedReturnValue([v27 localizedStringForKey:v29 value:&stru_100248948 table:0]);
          id v11 = v26;
          v31 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v30,  v23,  v24);
LABEL_35:
          v36 = (void *)objc_claimAutoreleasedReturnValue(v31);

LABEL_36:
          goto LABEL_37;
        }

        if (v23 >= 1)
        {
          id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
          v28 = v32;
          v33 = @"SEASON_NUMBER_FORMAT";
LABEL_26:
          v30 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedStringForKey:v33 value:&stru_100248948 table:0]);
          v31 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v30,  v23,  v68);
          goto LABEL_35;
        }

        if (v24 < 1)
        {
LABEL_29:
          v36 = 0LL;
LABEL_37:
          if ([v36 length]) {
            -[NSMutableArray addObject:](v22, "addObject:", v36);
          }

          goto LABEL_40;
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v28 = v34;
        v35 = @"EPISODE_NUMBER_FORMAT";
LABEL_34:
        v30 = (void *)objc_claimAutoreleasedReturnValue([v34 localizedStringForKey:v35 value:&stru_100248948 table:0]);
        v31 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v30,  v24,  v68);
        goto LABEL_35;
      }

      if (v23 >= 1 && v24 >= 1)
      {
        id v26 = v11;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v28 = v27;
        v29 = @"EPISODE_AND_SEASON_NUMBER_TRAILER";
        goto LABEL_19;
      }

      if (v23 >= 1)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v28 = v32;
        v33 = @"SEASON_NUMBER_TRAILER";
        goto LABEL_26;
      }

      if (v24 >= 1)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v28 = v34;
        v35 = @"EPISODE_NUMBER_TRAILER";
        goto LABEL_34;
      }

      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v28 = v66;
      v67 = @"TRAILER_EPISODE";
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue([v66 localizedStringForKey:v67 value:&stru_100248948 table:0]);
    goto LABEL_36;
  }

- (id)createVideoGlyphAttributedString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeStateView videoIcon](&OBJC_CLASS___MTEpisodeStateView, "videoIcon"));
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
  -[NSMutableAttributedString im_appendImage:](v3, "im_appendImage:", v2);
  -[NSMutableAttributedString im_appendString:](v3, "im_appendString:", @" ");
  id v4 = -[NSMutableAttributedString copy](v3, "copy");

  return v4;
}

- (id)descriptionBodyTextForEpisode:(id)a3 html:(BOOL)a4 withAttributes:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (v6 && [v7 itemDescriptionHasHTML])
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 lazyAttributedDescription]);
    id v10 = [v9 mutableCopy];

    objc_msgSend(v10, "addAttributes:range:", v8, 0, objc_msgSend(v10, "length"));
    if ([v10 length])
    {
      id v11 = (NSAttributedString *)[v10 copy];
      goto LABEL_9;
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 itemDescriptionWithoutHTML]);
  id v13 = [v12 length];

  if (v13)
  {
    id v14 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 itemDescriptionWithoutHTML]);
  }

  else
  {
    if ([v7 itemDescriptionHasHTML])
    {
      uint64_t v16 = 0LL;
      goto LABEL_10;
    }

    NSAttributedStringKey v18 = (void *)objc_claimAutoreleasedReturnValue([v7 itemDescription]);
    uint64_t v16 = (NSAttributedString *)[v18 length];

    if (!v16) {
      goto LABEL_10;
    }
    id v14 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 itemDescription]);
  }

  id v10 = (id)v15;
  id v11 = -[NSAttributedString initWithString:attributes:](v14, "initWithString:attributes:", v15, v8);
LABEL_9:
  uint64_t v16 = v11;

LABEL_10:
  return v16;
}

- (id)metadataHeaderForPlayerItem:(id)a3
{
  return -[MTEpisodeDescriptionCache descriptionPrefixTextForPlayerItem:options:trailingNewline:]( self,  "descriptionPrefixTextForPlayerItem:options:trailingNewline:",  a3,  3LL,  0LL);
}

- (id)descriptionPrefixTextForPlayerItem:(id)a3 options:(unint64_t)a4 trailingNewline:(BOOL)a5
{
  BOOL v47 = a5;
  char v5 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ((v5 & 2) != 0) {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 pubDate]);
  }
  else {
    double v9 = 0LL;
  }
  if (+[MTEpisodeLockup useLayoutForSkinnyPhones](&OBJC_CLASS___MTEpisodeLockup, "useLayoutForSkinnyPhones")) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 nanoFriendlyDisplayString]);
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 abbreviatedFriendlyDisplayString]);
  }
  id v11 = (void *)v10;
  if (v10)
  {
    v12 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v10);
    [v8 addObject:v12];
  }

  if ((v5 & 4) != 0
    && ([v7 playhead],
        double v14 = v13,
        [v7 duration],
        +[MTEpisode isPlayhead:resumableForDuration:]( &OBJC_CLASS___MTEpisode,  "isPlayhead:resumableForDuration:",  v14,  v15))
    && ([v7 duration], v17 = v16, objc_msgSend(v7, "duration"), double v19 = v17 - v18, v19 > 0.0))
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:]( &OBJC_CLASS___NSString,  "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:",  1LL,  +[MTEpisodeLockup useLayoutForSkinnyPhones]( &OBJC_CLASS___MTEpisodeLockup,  "useLayoutForSkinnyPhones"),  v19));
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  if (![v20 length])
  {
    [v7 duration];
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSString prettyShortStringWithDuration:abbreviated:]( &OBJC_CLASS___NSString,  "prettyShortStringWithDuration:abbreviated:",  +[MTEpisodeLockup useLayoutForSkinnyPhones](&OBJC_CLASS___MTEpisodeLockup, "useLayoutForSkinnyPhones"),  v21));

    uint64_t v20 = (void *)v22;
  }

  unsigned __int8 v23 = [v7 isVideo];
  if ((v5 & 8) != 0 && (v23 & 1) != 0)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeDescriptionCache createVideoGlyphAttributedString]( self,  "createVideoGlyphAttributedString"));
    id v25 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
    id v26 = v25;
    if (v24)
    {
      -[NSMutableAttributedString appendAttributedString:](v25, "appendAttributedString:", v24);
    }
  }

  else
  {
    id v26 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
  }

  if ([v20 length])
  {
    v27 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v20);
    -[NSMutableAttributedString appendAttributedString:](v26, "appendAttributedString:", v27);
  }

  char v46 = v20;
  double v48 = v11;
  v49 = v9;
  char v50 = v7;
  if (-[NSMutableAttributedString length](v26, "length"))
  {
    id v28 = -[NSMutableAttributedString copy](v26, "copy");
    [v8 addObject:v28];
  }

  v45 = v26;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup descriptionFont](&OBJC_CLASS___MTEpisodeLockup, "descriptionFont"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLockup metadataHeaderFont](&OBJC_CLASS___MTEpisodeLockup, "metadataHeaderFont"));
  NSAttributedStringKey v60 = NSFontAttributeName;
  v61 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
  id v32 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  @" ",  v31);
  v33 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  NSAttributedStringKey v58 = NSFontAttributeName;
  v59 = v29;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
  v35 = -[NSAttributedString initWithString:attributes:](v33, "initWithString:attributes:", @"•", v34);

  v36 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  @"\n",  v31);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100106154;
  v51[3] = &unk_100245078;
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
  NSAttributedStringKey v52 = v37;
  id v38 = v8;
  id v53 = v38;
  v39 = v32;
  NSAttributedStringKey v54 = v39;
  v40 = v35;
  v55 = v40;
  BOOL v57 = v47;
  BOOL v41 = v36;
  unsigned int v56 = v41;
  [v38 enumerateObjectsUsingBlock:v51];
  -[NSMutableAttributedString im_addAttribute:value:](v37, "im_addAttribute:value:", NSFontAttributeName, v30);
  if (v47 && -[NSMutableAttributedString length](v37, "length"))
  {
    v42 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
    [v30 _leading];
    -[NSMutableParagraphStyle setParagraphSpacing:](v42, "setParagraphSpacing:");
    -[NSMutableAttributedString im_addAttribute:value:]( v37,  "im_addAttribute:value:",  NSParagraphStyleAttributeName,  v42);
  }

  if (-[NSMutableAttributedString length](v37, "length")) {
    v43 = -[NSAttributedString initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithAttributedString:",  v37);
  }
  else {
    v43 = 0LL;
  }

  return v43;
}

- (void)setDescriptionCache:(id)a3
{
}

- (void)setEpisodeCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end