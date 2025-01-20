@interface ICDPlaybackPositionResponseDataPull
- (ICDPlaybackPositionResponseDataPull)initWithResponseDictionary:(id)a3 forDomain:(id)a4;
- (ICPlaybackPositionEntity)cloudEntity;
- (NSString)domainVersion;
- (NSString)itemKey;
- (NSString)itemVersion;
- (id)description;
@end

@implementation ICDPlaybackPositionResponseDataPull

- (ICDPlaybackPositionResponseDataPull)initWithResponseDictionary:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionResponseDataPull;
  v7 = -[ICDPlaybackPositionResponseDataBase initWithDomain:](&v20, "initWithDomain:", a4);
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_stringValueForKey:", @"key"));
    itemKey = v7->_itemKey;
    v7->_itemKey = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_stringValueForKey:", @"version"));
    itemVersion = v7->_itemVersion;
    v7->_itemVersion = (NSString *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_stringValueForKey:", @"domain-version"));
    domainVersion = v7->_domainVersion;
    v7->_domainVersion = (NSString *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_dataValueForKey:", @"value"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionResponseDataBase dataByInflatingWithNoZipHeader:]( v7,  "dataByInflatingWithNoZipHeader:",  v14));
    itemValueData = v7->_itemValueData;
    v7->_itemValueData = (NSData *)v15;

    if (v7->_itemKey && v7->_itemValueData)
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionResponseDataBase metadataWithItemIdentifier:keyValueStorePayload:failuresOkay:]( v7,  "metadataWithItemIdentifier:keyValueStorePayload:failuresOkay:"));
      cloudEntity = v7->_cloudEntity;
      v7->_cloudEntity = (ICPlaybackPositionEntity *)v17;
    }

    else
    {
      cloudEntity = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(cloudEntity, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v22 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  cloudEntity,  OS_LOG_TYPE_ERROR,  "<ICDPlaybackPositionResponseDataPull %p> initWithResponseDictionary - Could not create _cloudEntity from response",  buf,  0xCu);
      }
    }
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<ICDPlaybackPositionResponseDataPull %p itemKey=%@ itemVersion=%@ domainVersion=%@ cloudEntity=%@>",  self,  self->_itemKey,  self->_itemVersion,  self->_domainVersion,  self->_cloudEntity);
}

- (NSString)itemKey
{
  return self->_itemKey;
}

- (NSString)itemVersion
{
  return self->_itemVersion;
}

- (NSString)domainVersion
{
  return self->_domainVersion;
}

- (ICPlaybackPositionEntity)cloudEntity
{
  return self->_cloudEntity;
}

- (void).cxx_destruct
{
}

@end