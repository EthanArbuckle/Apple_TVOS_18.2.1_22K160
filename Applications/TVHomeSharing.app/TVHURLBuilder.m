@interface TVHURLBuilder
+ (id)_mediaCategoryTypeStringForMediaItem:(id)a3;
+ (id)_mediaEntityIdentifierStringForIdentifier:(id)a3;
+ (id)_mediaItemTypeStringForMediaItem:(id)a3;
+ (void)_appendFieldName:(id)a3 fieldValue:(id)a4 toURLQueryString:(id)a5;
- (NSString)mediaServerIdentifierString;
- (TVHKMediaServerIdentifier)mediaServerIdentifier;
- (TVHURLBuilder)init;
- (TVHURLBuilder)initWithMediaServerIdentifier:(id)a3;
- (id)_URLForMediaItem:(id)a3 action:(id)a4 displayType:(id)a5;
- (id)_URLQueryStringForMediaItem:(id)a3 displayType:(id)a4;
- (id)_displayMusicURLForMediaItem:(id)a3 displayType:(id)a4;
- (id)displayAlbumArtistURLForMediaItem:(id)a3;
- (id)displayAlbumURLForMediaItem:(id)a3;
- (id)displayURLForMediaItem:(id)a3;
- (id)playURLForMediaItem:(id)a3;
- (void)setMediaServerIdentifierString:(id)a3;
@end

@implementation TVHURLBuilder

- (TVHURLBuilder)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHURLBuilder)initWithMediaServerIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHURLBuilder;
  v6 = -[TVHURLBuilder init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaServerIdentifier, a3);
  }

  return v7;
}

- (id)displayAlbumArtistURLForMediaItem:(id)a3
{
  return -[TVHURLBuilder _displayMusicURLForMediaItem:displayType:]( self,  "_displayMusicURLForMediaItem:displayType:",  a3,  @"albumArtist");
}

- (id)displayAlbumURLForMediaItem:(id)a3
{
  return -[TVHURLBuilder _displayMusicURLForMediaItem:displayType:]( self,  "_displayMusicURLForMediaItem:displayType:",  a3,  @"album");
}

- (id)displayURLForMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  id v6 = [v5 mediaCategoryType];
  if (v6 == (id)1 || v6 == (id)8)
  {
    v8 = @"album";
LABEL_10:
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHURLBuilder _URLForMediaItem:action:displayType:]( self,  "_URLForMediaItem:action:displayType:",  v4,  @"display",  v8));

    goto LABEL_11;
  }

  if (v6 != (id)5)
  {
    v8 = 0LL;
    goto LABEL_10;
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURLBuilder playURLForMediaItem:](self, "playURLForMediaItem:", v4));
LABEL_11:

  return v9;
}

- (id)playURLForMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  id v6 = [v5 mediaCategoryType];

  if (v6 == (id)1) {
    v7 = @"album";
  }
  else {
    v7 = 0LL;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHURLBuilder _URLForMediaItem:action:displayType:]( self,  "_URLForMediaItem:action:displayType:",  v4,  @"play",  v7));

  return v8;
}

- (NSString)mediaServerIdentifierString
{
  mediaServerIdentifierString = self->_mediaServerIdentifierString;
  if (!mediaServerIdentifierString)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURLBuilder mediaServerIdentifier](self, "mediaServerIdentifier"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  TVHKMediaServerIdentifierValueTransformerName));
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 transformedValue:v4]);
    v7 = self->_mediaServerIdentifierString;
    self->_mediaServerIdentifierString = v6;

    mediaServerIdentifierString = self->_mediaServerIdentifierString;
  }

  return mediaServerIdentifierString;
}

+ (id)_mediaCategoryTypeStringForMediaItem:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 type]);
  id v4 = [v3 mediaCategoryType];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  TVHKMediaCategoryTypeValueTransformerName));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 transformedValue:v6]);

  return v7;
}

+ (id)_mediaItemTypeStringForMediaItem:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 type]);
  id v4 = [v3 mediaItemType];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  TVHKMediaItemTypeValueTransformerName));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 transformedValue:v6]);

  return v7;
}

+ (id)_mediaEntityIdentifierStringForIdentifier:(id)a3
{
  return [a3 stringRepresentation];
}

- (id)_displayMusicURLForMediaItem:(id)a3 displayType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  id v9 = [v8 mediaCategoryType];

  if (v9 == (id)1) {
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVHURLBuilder _URLForMediaItem:action:displayType:]( self,  "_URLForMediaItem:action:displayType:",  v6,  @"display",  v7));
  }
  else {
    v10 = 0LL;
  }

  return v10;
}

- (id)_URLForMediaItem:(id)a3 action:(id)a4 displayType:(id)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHURLBuilder _URLQueryStringForMediaItem:displayType:]( self,  "_URLQueryStringForMediaItem:displayType:",  a3,  a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://%@?%@",  @"com.apple.TVHomeSharing",  v8,  v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
  return v11;
}

- (id)_URLQueryStringForMediaItem:(id)a3 displayType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (v7)
  {
    *(void *)&double v9 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v10, "_appendFieldName:fieldValue:toURLQueryString:", @"displayType", v7, v8, v9);
  }

  v67 = v7;
  *(void *)&double v11 = objc_opt_class(self).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURLBuilder mediaServerIdentifierString](self, "mediaServerIdentifierString", v11));
  [v13 _appendFieldName:@"mediaServerIdentifier" fieldValue:v14 toURLQueryString:v8];

  *(void *)&double v15 = objc_opt_class(self).n128_u64[0];
  uint64_t v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_mediaCategoryTypeStringForMediaItem:", v6, v15));
  *(void *)&double v17 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v18, "_appendFieldName:fieldValue:toURLQueryString:", @"mediaCategoryType", v65, v8, v17);
  *(void *)&double v19 = objc_opt_class(self).n128_u64[0];
  uint64_t v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_mediaItemTypeStringForMediaItem:", v6, v19));
  *(void *)&double v21 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v22, "_appendFieldName:fieldValue:toURLQueryString:", @"mediaItemType", v68, v8, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 stringRepresentation]);

  *(void *)&double v25 = objc_opt_class(self).n128_u64[0];
  v66 = (void *)v24;
  objc_msgSend(v26, "_appendFieldName:fieldValue:toURLQueryString:", @"mediaItemIdentifier", v24, v8, v25);
  uint64_t v27 = objc_claimAutoreleasedReturnValue([v6 title]);
  *(void *)&double v28 = objc_opt_class(self).n128_u64[0];
  v64 = (void *)v27;
  objc_msgSend(v29, "_appendFieldName:fieldValue:toURLQueryString:", @"mediaItemName", v27, v8, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v6 albumTitle]);
  *(void *)&double v31 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v32, "_appendFieldName:fieldValue:toURLQueryString:", @"albumTitle", v30, v8, v31);
  *(void *)&double v33 = objc_opt_class(self).n128_u64[0];
  v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "albumIdentifier", v33));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v35 _mediaEntityIdentifierStringForIdentifier:v36]);

  *(void *)&double v38 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v39, "_appendFieldName:fieldValue:toURLQueryString:", @"albumIdentifier", v37, v8, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v6 albumArtistTitle]);
  *(void *)&double v41 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v42, "_appendFieldName:fieldValue:toURLQueryString:", @"albumArtistTitle", v40, v8, v41);
  *(void *)&double v43 = objc_opt_class(self).n128_u64[0];
  v45 = v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "albumArtistIdentifier", v43));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v45 _mediaEntityIdentifierStringForIdentifier:v46]);

  *(void *)&double v48 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v49, "_appendFieldName:fieldValue:toURLQueryString:", @"albumArtistIdentifier", v47, v8, v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v6 showTitle]);
  *(void *)&double v51 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v52, "_appendFieldName:fieldValue:toURLQueryString:", @"showTitle", v50, v8, v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  id v54 = [v53 mediaCategoryType];

  v55 = (void *)v65;
  BOOL v56 = v54 == (id)4;
  v57 = (void *)v68;
  if (v56)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityIdentifier seasonIdentifierWithEpisode:]( &OBJC_CLASS___TVHKMediaEntityIdentifier,  "seasonIdentifierWithEpisode:",  v6));
    v59 = v58;
    if (v58)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue([v58 stringRepresentation]);
      *(void *)&double v61 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(v62, "_appendFieldName:fieldValue:toURLQueryString:", @"seasonIdentifier", v60, v8, v61);
    }

    v55 = (void *)v65;
    v57 = (void *)v68;
  }

  return v8;
}

+ (void)_appendFieldName:(id)a3 fieldValue:(id)a4 toURLQueryString:(id)a5
{
  id v11 = a5;
  if (a4)
  {
    id v7 = a4;
    id v8 = a3;
    if ([v11 length]) {
      [v11 appendString:@"&"];
    }
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet alphanumericCharacterSet](&OBJC_CLASS___NSCharacterSet, "alphanumericCharacterSet"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAddingPercentEncodingWithAllowedCharacters:v9]);

    [v11 appendFormat:@"%@=%@", v8, v10];
  }
}

- (TVHKMediaServerIdentifier)mediaServerIdentifier
{
  return self->_mediaServerIdentifier;
}

- (void)setMediaServerIdentifierString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end