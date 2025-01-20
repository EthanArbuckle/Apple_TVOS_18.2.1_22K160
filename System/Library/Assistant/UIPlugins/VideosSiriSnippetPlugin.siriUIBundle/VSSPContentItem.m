@interface VSSPContentItem
- (BOOL)isEVOD;
- (NSString)contentType;
- (NSString)identifier;
- (NSString)imageURLTemplateString;
- (NSString)seasonIdentifier;
- (NSString)showIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)searchTerm;
- (NSURL)tvAppURL;
- (VSSPContentItem)init;
- (VSSPContentItem)initWithIdentifier:(id)a3 contentType:(id)a4 tvAppURL:(id)a5 imageResource:(id)a6;
- (double)imageAspectRatio;
- (id)description;
- (void)setContentType:(id)a3;
- (void)setEVOD:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageAspectRatio:(double)a3;
- (void)setImageURLTemplateString:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setSeasonIdentifier:(id)a3;
- (void)setShowIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTvAppURL:(id)a3;
@end

@implementation VSSPContentItem

- (VSSPContentItem)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (VSSPContentItem)initWithIdentifier:(id)a3 contentType:(id)a4 tvAppURL:(id)a5 imageResource:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v10 length])
  {
    id v24 = sub_6210();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_B444(v16, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_14;
  }

  if (([v11 isEqualToString:SAVCSContentTypeMovieValue] & 1) == 0
    && ([v11 isEqualToString:SAVCSContentTypeShowValue] & 1) == 0
    && ([v11 isEqualToString:SAVCSContentTypeSeasonValue] & 1) == 0
    && ([v11 isEqualToString:SAVCSContentTypeEpisodeValue] & 1) == 0
    && ([v11 isEqualToString:SAVCSContentTypePersonValue] & 1) == 0
    && ([v11 isEqualToString:SAVCSContentTypeAppValue] & 1) == 0)
  {
    id v47 = sub_6210();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_B4A4(v16, v48, v49, v50, v51, v52, v53, v54);
    }
    goto LABEL_14;
  }

  unsigned __int8 v14 = [v11 isEqualToString:SAVCSContentTypeAppValue];
  if (!v12 && (v14 & 1) == 0)
  {
    id v15 = sub_6210();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_B474(v16, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_14:

    v32 = 0LL;
    goto LABEL_19;
  }

  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___VSSPContentItem;
  v33 = -[VSSPContentItem init](&v55, "init");
  if (v33)
  {
    v34 = (NSString *)[v10 copy];
    identifier = v33->_identifier;
    v33->_identifier = v34;

    v36 = (NSString *)[v11 copy];
    contentType = v33->_contentType;
    v33->_contentType = v36;

    v38 = (NSURL *)[v12 copy];
    tvAppURL = v33->_tvAppURL;
    v33->_tvAppURL = v38;

    if (v13)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v13 urlFormatString]);
      v41 = (NSString *)[v40 copy];
      imageURLTemplateString = v33->_imageURLTemplateString;
      v33->_imageURLTemplateString = v41;

      [v13 pixelHeight];
      double v44 = v43;
      [v13 pixelWidth];
      v33->_imageAspectRatio = v45 / v44;
    }
  }

  self = v33;
  v32 = self;
LABEL_19:

  return v32;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___VSSPContentItem;
  id v4 = -[VSSPContentItem description](&v31, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"identifier",  v6));
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem contentType](self, "contentType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"contentType",  v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem seasonIdentifier](self, "seasonIdentifier"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"seasonIdentifier",  v10));
  -[NSMutableArray addObject:](v3, "addObject:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem showIdentifier](self, "showIdentifier"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"showIdentifier",  v12));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem title](self, "title"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"title",  v14));
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem subtitle](self, "subtitle"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"subtitle",  v16));
  -[NSMutableArray addObject:](v3, "addObject:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem imageURLTemplateString](self, "imageURLTemplateString"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"imageURLTemplateString",  v18));
  -[NSMutableArray addObject:](v3, "addObject:", v19);

  -[VSSPContentItem imageAspectRatio](self, "imageAspectRatio");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"imageAspectRatio",  v20));
  -[NSMutableArray addObject:](v3, "addObject:", v21);

  uint64_t v22 = VUIBoolLogString(-[VSSPContentItem isEVOD](self, "isEVOD"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"isEVOD",  v23));
  -[NSMutableArray addObject:](v3, "addObject:", v24);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPContentItem tvAppURL](self, "tvAppURL"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 absoluteString]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"tvAppURL",  v26));
  -[NSMutableArray addObject:](v3, "addObject:", v27);

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @", "));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@>", v28));

  return v29;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)seasonIdentifier
{
  return self->_seasonIdentifier;
}

- (void)setSeasonIdentifier:(id)a3
{
}

- (NSString)showIdentifier
{
  return self->_showIdentifier;
}

- (void)setShowIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)imageURLTemplateString
{
  return self->_imageURLTemplateString;
}

- (void)setImageURLTemplateString:(id)a3
{
}

- (double)imageAspectRatio
{
  return self->_imageAspectRatio;
}

- (void)setImageAspectRatio:(double)a3
{
  self->_imageAspectRatio = a3;
}

- (BOOL)isEVOD
{
  return self->_EVOD;
}

- (void)setEVOD:(BOOL)a3
{
  self->_EVOD = a3;
}

- (NSURL)tvAppURL
{
  return self->_tvAppURL;
}

- (void)setTvAppURL:(id)a3
{
}

- (NSURL)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (void).cxx_destruct
{
}

@end