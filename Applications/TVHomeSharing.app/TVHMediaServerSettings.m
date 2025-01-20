@interface TVHMediaServerSettings
- (BOOL)isEqual:(id)a3;
- (NSDate)modifiedDate;
- (TVHKMediaServerIdentifier)mediaServerIdentifier;
- (TVHMediaServerSettings)init;
- (TVHMediaServerSettings)initWithDictionaryRepresentation:(id)a3;
- (TVHMediaServerSettings)initWithMediaServerIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)mediaCategoryType;
- (void)setMediaCategoryType:(unint64_t)a3;
- (void)setModifiedDate:(id)a3;
@end

@implementation TVHMediaServerSettings

- (TVHMediaServerSettings)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaServerSettings)initWithMediaServerIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaServerIdentifier");
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHMediaServerSettings;
  v5 = -[TVHMediaServerSettings init](&v9, "init");
  if (v5)
  {
    v6 = (TVHKMediaServerIdentifier *)[v4 copy];
    mediaServerIdentifier = v5->_mediaServerIdentifier;
    v5->_mediaServerIdentifier = v6;

    v5->_mediaCategoryType = 1LL;
  }

  return v5;
}

- (TVHMediaServerSettings)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"MediaServerIdentifier"]);
  if (!v5)
  {
    id v14 = sub_10007A0E8();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009C1D0((uint64_t)v4, v7);
    }
    goto LABEL_12;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[TVHKMediaServerIdentifier mediaServerIdentifierWithSerializedRepresentation:]( &OBJC_CLASS___TVHKMediaServerIdentifier,  "mediaServerIdentifierWithSerializedRepresentation:",  v5));
  if (!v6)
  {
    id v15 = sub_10007A0E8();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009C244(v7);
    }
LABEL_12:
    v13 = 0LL;
    goto LABEL_13;
  }

  v7 = (os_log_s *)v6;
  v8 = -[TVHMediaServerSettings initWithMediaServerIdentifier:](self, "initWithMediaServerIdentifier:", v6);
  if (v8)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvhk_numberForKey:", @"MediaCategoryType"));
    v10 = (char *)[v9 unsignedIntegerValue];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvhk_dateForKey:", @"ModifiedDate"));
    modifiedDate = v8->_modifiedDate;
    v8->_modifiedDate = (NSDate *)v11;
  }

  self = v8;
  v13 = self;
LABEL_13:

  return v13;
}

- (void)setMediaCategoryType:(unint64_t)a3
{
  if (a3)
  {
    if (self->_mediaCategoryType != a3) {
      self->_mediaCategoryType = a3;
    }
  }

- (id)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings mediaServerIdentifier](self, "mediaServerIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v3,  "tvhk_setObjectIfNotNil:forKey:",  v5,  @"MediaServerIdentifier");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings modifiedDate](self, "modifiedDate"));
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:](v3, "tvhk_setObjectIfNotNil:forKey:", v6, @"ModifiedDate");

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[TVHMediaServerSettings mediaCategoryType](self, "mediaCategoryType")));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"MediaCategoryType");

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = -[TVHMediaServerSettings mediaCategoryType](self, "mediaCategoryType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings mediaServerIdentifier](self, "mediaServerIdentifier"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings modifiedDate](self, "modifiedDate"));
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TVHMediaServerSettings *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v14 = 1;
  }

  else
  {
    if (v4)
    {
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVHMediaServerSettings);
      if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      {
        unint64_t v7 = v5;
        id v8 = -[TVHMediaServerSettings mediaCategoryType](self, "mediaCategoryType");
        if (v8 != (id)-[TVHMediaServerSettings mediaCategoryType](v7, "mediaCategoryType"))
        {
LABEL_9:
          unsigned __int8 v14 = 0;
LABEL_19:

          goto LABEL_20;
        }

        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings mediaServerIdentifier](self, "mediaServerIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings mediaServerIdentifier](v7, "mediaServerIdentifier"));
        id v11 = v9;
        id v12 = v10;
        if (v11 == v12)
        {
        }

        else
        {
          v13 = v12;
          unsigned __int8 v14 = 0;
          if (!v11 || !v12)
          {
LABEL_18:

            goto LABEL_19;
          }

          unsigned __int8 v15 = [v11 isEqual:v12];

          if ((v15 & 1) == 0) {
            goto LABEL_9;
          }
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings modifiedDate](self, "modifiedDate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings modifiedDate](v7, "modifiedDate"));
        id v11 = v16;
        id v18 = v17;
        v13 = v18;
        if (v11 == v18)
        {
          unsigned __int8 v14 = 1;
        }

        else
        {
          unsigned __int8 v14 = 0;
          if (v11 && v18) {
            unsigned __int8 v14 = [v11 isEqual:v18];
          }
        }

        goto LABEL_18;
      }
    }

    unsigned __int8 v14 = 0;
  }

- (id)description
{
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHMediaServerSettings;
  id v4 = -[TVHMediaServerSettings description](&v16, "description");
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  uint64_t v6 = TVHKMediaCategoryTypeLogString(-[TVHMediaServerSettings mediaCategoryType](self, "mediaCategoryType"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"mediaCategoryType",  v7));
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings mediaServerIdentifier](self, "mediaServerIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"mediaServerIdentifier",  v9));
  -[NSMutableArray addObject:](v3, "addObject:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaServerSettings modifiedDate](self, "modifiedDate"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  @"modifiedDate",  v11));
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @", "));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@>", v13));

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[TVHMediaServerSettings initWithMediaServerIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaServerSettings),  "initWithMediaServerIdentifier:",  self->_mediaServerIdentifier);
  v4->_mediaCategoryType = self->_mediaCategoryType;
  unint64_t v5 = (NSDate *)-[NSDate copy](self->_modifiedDate, "copy");
  modifiedDate = v4->_modifiedDate;
  v4->_modifiedDate = v5;

  return v4;
}

- (TVHKMediaServerIdentifier)mediaServerIdentifier
{
  return self->_mediaServerIdentifier;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void)setModifiedDate:(id)a3
{
}

- (unint64_t)mediaCategoryType
{
  return self->_mediaCategoryType;
}

- (void).cxx_destruct
{
}

@end