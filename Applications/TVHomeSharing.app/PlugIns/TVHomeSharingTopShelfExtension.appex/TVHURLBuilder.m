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
  if (v7) {
    [(id)objc_opt_class(self) _appendFieldName:@"displayType" fieldValue:v7 toURLQueryString:v8];
  }
  v36 = v7;
  id v9 = (void *)objc_opt_class(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHURLBuilder mediaServerIdentifierString](self, "mediaServerIdentifierString"));
  [v9 _appendFieldName:@"mediaServerIdentifier" fieldValue:v10 toURLQueryString:v8];

  id v11 = [(id)objc_opt_class(self) _mediaCategoryTypeStringForMediaItem:v6];
  uint64_t v34 = objc_claimAutoreleasedReturnValue(v11);
  [(id)objc_opt_class(self) _appendFieldName:@"mediaCategoryType" fieldValue:v34 toURLQueryString:v8];
  id v12 = [(id)objc_opt_class(self) _mediaItemTypeStringForMediaItem:v6];
  uint64_t v37 = objc_claimAutoreleasedReturnValue(v12);
  [(id)objc_opt_class(self) _appendFieldName:@"mediaItemType" fieldValue:v37 toURLQueryString:v8];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 stringRepresentation]);

  v35 = (void *)v14;
  [(id)objc_opt_class(self) _appendFieldName:@"mediaItemIdentifier" fieldValue:v14 toURLQueryString:v8];
  v33 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  [(id)objc_opt_class(self) _appendFieldName:@"mediaItemName" fieldValue:v33 toURLQueryString:v8];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 albumTitle]);
  [(id)objc_opt_class(self) _appendFieldName:@"albumTitle" fieldValue:v15 toURLQueryString:v8];
  v16 = (void *)objc_opt_class(self);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 albumIdentifier]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 _mediaEntityIdentifierStringForIdentifier:v17]);

  [(id)objc_opt_class(self) _appendFieldName:@"albumIdentifier" fieldValue:v18 toURLQueryString:v8];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 albumArtistTitle]);
  [(id)objc_opt_class(self) _appendFieldName:@"albumArtistTitle" fieldValue:v19 toURLQueryString:v8];
  v20 = (void *)objc_opt_class(self);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 albumArtistIdentifier]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 _mediaEntityIdentifierStringForIdentifier:v21]);

  [(id)objc_opt_class(self) _appendFieldName:@"albumArtistIdentifier" fieldValue:v22 toURLQueryString:v8];
  v23 = (void *)objc_claimAutoreleasedReturnValue([v6 showTitle]);
  [(id)objc_opt_class(self) _appendFieldName:@"showTitle" fieldValue:v23 toURLQueryString:v8];
  v24 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);
  id v25 = [v24 mediaCategoryType];

  v26 = (void *)v34;
  BOOL v27 = v25 == (id)4;
  v28 = (void *)v37;
  if (v27)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityIdentifier seasonIdentifierWithEpisode:]( &OBJC_CLASS___TVHKMediaEntityIdentifier,  "seasonIdentifierWithEpisode:",  v6));
    v30 = v29;
    if (v29)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v29 stringRepresentation]);
      [(id)objc_opt_class(self) _appendFieldName:@"seasonIdentifier" fieldValue:v31 toURLQueryString:v8];
    }

    v26 = (void *)v34;
    v28 = (void *)v37;
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
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet alphanumericCharacterSet](&OBJC_CLASS___NSCharacterSet, "alphanumericCharacterSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAddingPercentEncodingWithAllowedCharacters:v9]);

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