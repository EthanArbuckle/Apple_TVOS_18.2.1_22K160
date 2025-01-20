@interface TVHScreenSaverDescriptor
- (NSString)mediaServerName;
- (NSString)name;
- (TVHKMediaEntityIdentifier)mediaEntityCollectionIdentifier;
- (TVHKMediaServerIdentifier)mediaServerIdentifier;
- (TVHScreenSaverDescriptor)initWithSerializedDictionary:(id)a3;
- (id)serializedDictionary;
- (unint64_t)mediaCategoryType;
- (void)setMediaCategoryType:(unint64_t)a3;
- (void)setMediaEntityCollectionIdentifier:(id)a3;
- (void)setMediaServerIdentifier:(id)a3;
- (void)setMediaServerName:(id)a3;
- (void)setName:(id)a3;
@end

@implementation TVHScreenSaverDescriptor

- (TVHScreenSaverDescriptor)initWithSerializedDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVHScreenSaverDescriptor;
  v5 = -[TVHScreenSaverDescriptor init](&v21, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvhk_stringForKey:", @"Name"));
    v7 = (NSString *)[v6 copy];
    name = v5->_name;
    v5->_name = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvhk_numberForKey:", @"MediaCategory"));
    v5->_mediaCategoryType = (unint64_t)[v9 unsignedIntegerValue];

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvhk_stringForKey:", @"MediaServerName"));
    v11 = (NSString *)[v10 copy];
    mediaServerName = v5->_mediaServerName;
    v5->_mediaServerName = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"MediaServerIdentifier"]);
    if (v13)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[TVHKMediaServerIdentifier mediaServerIdentifierWithSerializedRepresentation:]( &OBJC_CLASS___TVHKMediaServerIdentifier,  "mediaServerIdentifierWithSerializedRepresentation:",  v13));
      mediaServerIdentifier = v5->_mediaServerIdentifier;
      v5->_mediaServerIdentifier = (TVHKMediaServerIdentifier *)v14;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvhk_stringForKey:", @"__MediaEntityCollectionIdentifier"));
    id v17 = [v16 copy];

    if (v17)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[TVHKMediaEntityIdentifier mediaEntityIdentifierWithStringRepresentation:]( &OBJC_CLASS___TVHKMediaEntityIdentifier,  "mediaEntityIdentifierWithStringRepresentation:",  v17));
      mediaEntityCollectionIdentifier = v5->_mediaEntityCollectionIdentifier;
      v5->_mediaEntityCollectionIdentifier = (TVHKMediaEntityIdentifier *)v18;
    }
  }

  return v5;
}

- (id)serializedDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v3,  "tvhk_setObjectIfNotNil:forKey:",  &off_100105EE0,  @"Version");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverDescriptor name](self, "name"));
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:](v3, "tvhk_setObjectIfNotNil:forKey:", v4, @"Name");

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[TVHScreenSaverDescriptor mediaCategoryType](self, "mediaCategoryType")));
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v3,  "tvhk_setObjectIfNotNil:forKey:",  v5,  @"MediaCategory");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverDescriptor mediaServerName](self, "mediaServerName"));
  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v3,  "tvhk_setObjectIfNotNil:forKey:",  v6,  @"MediaServerName");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverDescriptor mediaServerIdentifier](self, "mediaServerIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryRepresentation]);

  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v3,  "tvhk_setObjectIfNotNil:forKey:",  v8,  @"MediaServerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverDescriptor mediaEntityCollectionIdentifier](self, "mediaEntityCollectionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringRepresentation]);

  -[NSMutableDictionary tvhk_setObjectIfNotNil:forKey:]( v3,  "tvhk_setObjectIfNotNil:forKey:",  v10,  @"__MediaEntityCollectionIdentifier");
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)mediaCategoryType
{
  return self->_mediaCategoryType;
}

- (void)setMediaCategoryType:(unint64_t)a3
{
  self->_mediaCategoryType = a3;
}

- (NSString)mediaServerName
{
  return self->_mediaServerName;
}

- (void)setMediaServerName:(id)a3
{
}

- (TVHKMediaServerIdentifier)mediaServerIdentifier
{
  return self->_mediaServerIdentifier;
}

- (void)setMediaServerIdentifier:(id)a3
{
}

- (TVHKMediaEntityIdentifier)mediaEntityCollectionIdentifier
{
  return self->_mediaEntityCollectionIdentifier;
}

- (void)setMediaEntityCollectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end