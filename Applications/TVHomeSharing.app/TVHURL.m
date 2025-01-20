@interface TVHURL
+ (TVHURL)new;
+ (id)URLFromURL:(id)a3;
+ (id)_actionStringFromAction:(unint64_t)a3;
+ (id)_displayTypeStringFromDisplayType:(unint64_t)a3;
+ (id)_mediaEntityIdentifierFromString:(id)a3;
+ (id)_mediaServerIdentifierFromString:(id)a3;
+ (unint64_t)_actionFromString:(id)a3;
+ (unint64_t)_displayTypeFromString:(id)a3;
+ (unint64_t)_mediaCategoryTypeFromString:(id)a3;
+ (unint64_t)_mediaItemTypeFromString:(id)a3;
- (BOOL)browsesMediaLibrary;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresMediaLibrary;
- (NSString)albumArtistTitle;
- (NSString)albumTitle;
- (NSString)mediaItemTitle;
- (NSString)showTitle;
- (NSURL)URL;
- (TVHKMediaEntityIdentifier)albumArtistIdentifier;
- (TVHKMediaEntityIdentifier)albumIdentifier;
- (TVHKMediaEntityIdentifier)mediaItemIdentifier;
- (TVHKMediaEntityIdentifier)seasonIdentifier;
- (TVHKMediaServerIdentifier)mediaServerIdentifier;
- (TVHURL)init;
- (id)_initWithURL:(id)a3 action:(unint64_t)a4;
- (id)description;
- (unint64_t)action;
- (unint64_t)displayType;
- (unint64_t)hash;
- (unint64_t)mediaCategoryType;
- (unint64_t)mediaItemType;
- (void)setAction:(unint64_t)a3;
- (void)setAlbumArtistIdentifier:(id)a3;
- (void)setAlbumArtistTitle:(id)a3;
- (void)setAlbumIdentifier:(id)a3;
- (void)setAlbumTitle:(id)a3;
- (void)setDisplayType:(unint64_t)a3;
- (void)setMediaCategoryType:(unint64_t)a3;
- (void)setMediaItemIdentifier:(id)a3;
- (void)setMediaItemTitle:(id)a3;
- (void)setMediaItemType:(unint64_t)a3;
- (void)setMediaServerIdentifier:(id)a3;
- (void)setSeasonIdentifier:(id)a3;
- (void)setShowTitle:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation TVHURL

+ (TVHURL)new
{
  return 0LL;
}

+ (id)URLFromURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scheme]);
  if ([v5 isEqualToString:@"com.apple.TVHomeSharing"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);
    id v7 = [a1 _actionFromString:v6];
    if (!v7)
    {
      id v9 = 0LL;
LABEL_22:

      goto LABEL_23;
    }

    unint64_t v8 = (unint64_t)v7;
    id v9 = -[TVHURL _initWithURL:action:](objc_alloc(&OBJC_CLASS___TVHURL), "_initWithURL:action:", v4, v7);

    if (v8 <= 2 && v9)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvhk_queryParameters"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"displayType"));
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 stringByRemovingPercentEncoding]);

      *(void *)&double v12 = objc_opt_class(a1).n128_u64[0];
      v62 = (void *)v11;
      objc_msgSend(v9, "setDisplayType:", objc_msgSend(v13, "_displayTypeFromString:", v11, v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"mediaServerIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByRemovingPercentEncoding]);

      if ([v15 length])
      {
        *(void *)&double v16 = objc_opt_class(a1).n128_u64[0];
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_mediaServerIdentifierFromString:", v15, v16));
        [v9 setMediaServerIdentifier:v18];
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"mediaCategoryType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByRemovingPercentEncoding]);

      if ([v20 length])
      {
        *(void *)&double v21 = objc_opt_class(a1).n128_u64[0];
        objc_msgSend(v9, "setMediaCategoryType:", objc_msgSend(v22, "_mediaCategoryTypeFromString:", v20, v21));
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"mediaItemIdentifier"));
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 stringByRemovingPercentEncoding]);

      if ([v15 length])
      {
        *(void *)&double v25 = objc_opt_class(a1).n128_u64[0];
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_mediaEntityIdentifierFromString:", v24, v25));
        [v9 setMediaItemIdentifier:v27];
      }

      v60 = v20;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"mediaItemType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 stringByRemovingPercentEncoding]);

      if ([v29 length])
      {
        *(void *)&double v30 = objc_opt_class(a1).n128_u64[0];
        objc_msgSend(v9, "setMediaItemType:", objc_msgSend(v31, "_mediaItemTypeFromString:", v29, v30));
      }

      v58 = v29;
      v61 = v15;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"mediaItemName"));
      uint64_t v33 = objc_claimAutoreleasedReturnValue([v32 stringByRemovingPercentEncoding]);

      v57 = (void *)v33;
      [v9 setMediaItemTitle:v33];
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"albumTitle"));
      uint64_t v35 = objc_claimAutoreleasedReturnValue([v34 stringByRemovingPercentEncoding]);

      v56 = (void *)v35;
      [v9 setAlbumTitle:v35];
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"albumIdentifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 stringByRemovingPercentEncoding]);

      if ([v37 length])
      {
        *(void *)&double v38 = objc_opt_class(a1).n128_u64[0];
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "_mediaEntityIdentifierFromString:", v37, v38));
        [v9 setAlbumIdentifier:v40];
      }

      v59 = (void *)v24;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"albumArtistTitle"));
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 stringByRemovingPercentEncoding]);

      [v9 setAlbumArtistTitle:v42];
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"albumArtistIdentifier"));
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 stringByRemovingPercentEncoding]);

      if ([v44 length])
      {
        *(void *)&double v45 = objc_opt_class(a1).n128_u64[0];
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "_mediaEntityIdentifierFromString:", v44, v45));
        [v9 setAlbumArtistIdentifier:v47];
      }

      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"seasonIdentifier"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 stringByRemovingPercentEncoding]);

      if ([v49 length])
      {
        *(void *)&double v50 = objc_opt_class(a1).n128_u64[0];
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "_mediaEntityIdentifierFromString:", v49, v50));
        [v9 setSeasonIdentifier:v52];
      }

      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_stringForKey:", @"showTitle"));
      v54 = (void *)objc_claimAutoreleasedReturnValue([v53 stringByRemovingPercentEncoding]);

      [v9 setShowTitle:v54];
      goto LABEL_22;
    }
  }

  else
  {
    id v9 = 0LL;
  }

- (TVHURL)init
{
  v3 = NSStringFromSelector(a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (id)_initWithURL:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHURL;
  id v7 = -[TVHURL init](&v11, "init");
  if (v7)
  {
    unint64_t v8 = (NSURL *)[v6 copy];
    URL = v7->_URL;
    v7->_URL = v8;

    v7->_action = a4;
  }

  return v7;
}

- (BOOL)requiresMediaLibrary
{
  return (char *)-[TVHURL action](self, "action") - 1 < (char *)2;
}

- (BOOL)browsesMediaLibrary
{
  unint64_t v2 = -[TVHURL action](self, "action");
  return v2 == 2 || (v2 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (unint64_t)hash
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL URL](self, "URL"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TVHURL *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v13 = 1;
  }

  else if (v4 && (objc_opt_class(&OBJC_CLASS___TVHURL), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    id v7 = v5;
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL URL](v7, "URL"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL URL](v7, "URL"));
    id v10 = v8;
    id v11 = v9;
    double v12 = v11;
    if (v10 == v11)
    {
      unsigned __int8 v13 = 1;
    }

    else
    {
      unsigned __int8 v13 = 0;
      if (v10 && v11) {
        unsigned __int8 v13 = [v10 isEqual:v11];
      }
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)description
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___TVHURL;
  id v4 = -[TVHURL description](&v41, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  *(void *)&double v6 = objc_opt_class(self).n128_u64[0];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_actionStringFromAction:", -[TVHURL action](self, "action", v6)));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"action",  v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  *(void *)&double v10 = objc_opt_class(self).n128_u64[0];
  double v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v11,  "_displayTypeStringFromDisplayType:",  -[TVHURL displayType](self, "displayType", v10)));
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"displayType",  v12));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL mediaServerIdentifier](self, "mediaServerIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"mediaServerIdentifier",  v14));
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  uint64_t v16 = TVHKMediaCategoryTypeLogString(-[TVHURL mediaCategoryType](self, "mediaCategoryType"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"mediaCategoryType",  v17));
  -[NSMutableArray addObject:](v3, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL albumIdentifier](self, "albumIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"albumIdentifier",  v19));
  -[NSMutableArray addObject:](v3, "addObject:", v20);

  double v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL albumTitle](self, "albumTitle"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"albumTitle",  v21));
  -[NSMutableArray addObject:](v3, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL albumArtistIdentifier](self, "albumArtistIdentifier"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"albumArtistIdentifier",  v23));
  -[NSMutableArray addObject:](v3, "addObject:", v24);

  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL albumArtistTitle](self, "albumArtistTitle"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"albumArtistTitle",  v25));
  -[NSMutableArray addObject:](v3, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL mediaItemIdentifier](self, "mediaItemIdentifier"));
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"mediaItemIdentifier",  v27));
  -[NSMutableArray addObject:](v3, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL mediaItemTitle](self, "mediaItemTitle"));
  double v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"mediaItemTitle",  v29));
  -[NSMutableArray addObject:](v3, "addObject:", v30);

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL seasonIdentifier](self, "seasonIdentifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"seasonIdentifier",  v31));
  -[NSMutableArray addObject:](v3, "addObject:", v32);

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURL showTitle](self, "showTitle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"showTitle",  v33));
  -[NSMutableArray addObject:](v3, "addObject:", v34);

  uint64_t v35 = TVHKMediaItemTypeLogString(-[TVHURL mediaItemType](self, "mediaItemType"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"mediaItemType",  v36));
  -[NSMutableArray addObject:](v3, "addObject:", v37);

  double v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @", "));
  id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@>", v38));

  return v39;
}

+ (id)_actionStringFromAction:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0LL;
  }
  else {
    return *off_1000FF830[a3 - 1];
  }
}

+ (unint64_t)_actionFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"play"])
  {
    unint64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"display"])
  {
    unint64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"selectScreenSaver"])
  {
    unint64_t v4 = 3LL;
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

+ (id)_displayTypeStringFromDisplayType:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = off_1000FF730;
  }

  else
  {
    if (a3 != 2) {
      return 0LL;
    }
    id v3 = &off_1000FF738;
  }

  return *v3;
}

+ (unint64_t)_displayTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"album"])
  {
    unint64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"albumArtist"])
  {
    unint64_t v4 = 2LL;
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

+ (unint64_t)_mediaCategoryTypeFromString:(id)a3
{
  uint64_t v3 = TVHKMediaCategoryTypeValueTransformerName;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  v3));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 reverseTransformedValue:v4]);

  id v7 = [v6 unsignedIntegerValue];
  return (unint64_t)v7;
}

+ (unint64_t)_mediaItemTypeFromString:(id)a3
{
  uint64_t v3 = TVHKMediaItemTypeValueTransformerName;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  v3));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 reverseTransformedValue:v4]);

  id v7 = [v6 unsignedIntegerValue];
  return (unint64_t)v7;
}

+ (id)_mediaServerIdentifierFromString:(id)a3
{
  uint64_t v3 = TVHKMediaServerIdentifierValueTransformerName;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  v3));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 reverseTransformedValue:v4]);

  return v6;
}

+ (id)_mediaEntityIdentifierFromString:(id)a3
{
  return +[TVHKMediaEntityIdentifier mediaEntityIdentifierWithStringRepresentation:]( &OBJC_CLASS___TVHKMediaEntityIdentifier,  "mediaEntityIdentifierWithStringRepresentation:",  a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (TVHKMediaServerIdentifier)mediaServerIdentifier
{
  return self->_mediaServerIdentifier;
}

- (void)setMediaServerIdentifier:(id)a3
{
}

- (TVHKMediaEntityIdentifier)mediaItemIdentifier
{
  return self->_mediaItemIdentifier;
}

- (void)setMediaItemIdentifier:(id)a3
{
}

- (unint64_t)mediaItemType
{
  return self->_mediaItemType;
}

- (void)setMediaItemType:(unint64_t)a3
{
  self->_mediaItemType = a3;
}

- (unint64_t)mediaCategoryType
{
  return self->_mediaCategoryType;
}

- (void)setMediaCategoryType:(unint64_t)a3
{
  self->_mediaCategoryType = a3;
}

- (NSString)mediaItemTitle
{
  return self->_mediaItemTitle;
}

- (void)setMediaItemTitle:(id)a3
{
}

- (TVHKMediaEntityIdentifier)albumIdentifier
{
  return self->_albumIdentifier;
}

- (void)setAlbumIdentifier:(id)a3
{
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
}

- (TVHKMediaEntityIdentifier)albumArtistIdentifier
{
  return self->_albumArtistIdentifier;
}

- (void)setAlbumArtistIdentifier:(id)a3
{
}

- (NSString)albumArtistTitle
{
  return self->_albumArtistTitle;
}

- (void)setAlbumArtistTitle:(id)a3
{
}

- (TVHKMediaEntityIdentifier)seasonIdentifier
{
  return self->_seasonIdentifier;
}

- (void)setSeasonIdentifier:(id)a3
{
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (void)setShowTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end