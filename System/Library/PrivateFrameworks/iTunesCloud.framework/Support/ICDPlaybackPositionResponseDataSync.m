@interface ICDPlaybackPositionResponseDataSync
- (ICDPlaybackPositionResponseDataSync)initWithResponseDictionary:(id)a3 forDomain:(id)a4;
- (NSArray)conflictedKeys;
- (NSArray)deletedKeys;
- (NSArray)successfullyDeletedKeys;
- (NSArray)successfullyUpdatedKeys;
- (NSArray)updatedKeys;
- (NSString)syncAnchor;
- (id)metadataWithPlaybackPositionKey:(id)a3 failuresOkay:(BOOL)a4;
- (id)payloadDataForUpdateResponseKey:(id)a3;
- (void)_deserializeResponseDictionary:(id)a3;
@end

@implementation ICDPlaybackPositionResponseDataSync

- (ICDPlaybackPositionResponseDataSync)initWithResponseDictionary:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionResponseDataSync;
  v7 = -[ICDPlaybackPositionResponseDataBase initWithDomain:](&v21, "initWithDomain:", a4);
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    responseOpEntiesByKey = v7->_responseOpEntiesByKey;
    v7->_responseOpEntiesByKey = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    updatedKeys = v7->_updatedKeys;
    v7->_updatedKeys = (NSArray *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    deletedKeys = v7->_deletedKeys;
    v7->_deletedKeys = (NSArray *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    conflictedKeys = v7->_conflictedKeys;
    v7->_conflictedKeys = (NSArray *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    successfullyUpdatedKeys = v7->_successfullyUpdatedKeys;
    v7->_successfullyUpdatedKeys = (NSArray *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    successfullyDeletedKeys = v7->_successfullyDeletedKeys;
    v7->_successfullyDeletedKeys = (NSArray *)v18;

    -[ICDPlaybackPositionResponseDataSync _deserializeResponseDictionary:](v7, "_deserializeResponseDictionary:", v6);
  }

  return v7;
}

- (id)payloadDataForUpdateResponseKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_responseOpEntiesByKey, "objectForKey:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"value"]);

  uint64_t v7 = objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionResponseDataBase dataByInflatingWithNoZipHeader:]( self,  "dataByInflatingWithNoZipHeader:",  v6));
  if (v7)
  {
    id v8 = (id)v7;
    v9 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}@ successfully unzipped data for key %{public}@",  (uint8_t *)&v11,  0x16u);
    }
  }

  else
  {
    id v8 = v6;
  }

  return v8;
}

- (id)metadataWithPlaybackPositionKey:(id)a3 failuresOkay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionResponseDataSync payloadDataForUpdateResponseKey:]( self,  "payloadDataForUpdateResponseKey:",  v6));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionResponseDataBase metadataWithItemIdentifier:keyValueStorePayload:failuresOkay:]( self,  "metadataWithItemIdentifier:keyValueStorePayload:failuresOkay:",  v6,  v7,  v4));
  }

  else
  {
    v9 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "metadataWithItemIdentifier - keyValueStorePayload=nil",  v11,  2u);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (void)_deserializeResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100044FC4;
    v19[3] = &unk_1001A2D50;
    id v6 = v4;
    id v20 = v6;
    uint64_t v7 = objc_retainBlock(v19);
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, Block_layout *))v7[2])( v7,  self->_deletedKeys,  @"peer-ops",  @"deletes",  &stru_1001A2D90);
    updatedKeys = self->_updatedKeys;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10004528C;
    v18[3] = &unk_1001A2DB8;
    v18[4] = self;
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, void *))v7[2])( v7,  updatedKeys,  @"peer-ops",  @"puts",  v18);
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, Block_layout *))v7[2])( v7,  self->_conflictedKeys,  @"ops",  @"rejected",  &stru_1001A2DD8);
    successfullyUpdatedKeys = self->_successfullyUpdatedKeys;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000452BC;
    v17[3] = &unk_1001A2DB8;
    v17[4] = self;
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, void *))v7[2])( v7,  successfullyUpdatedKeys,  @"ops",  @"put-ok",  v17);
    successfullyDeletedKeys = self->_successfullyDeletedKeys;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000452E4;
    v16[3] = &unk_1001A2DB8;
    v16[4] = self;
    ((void (*)(void *, NSArray *, const __CFString *, const __CFString *, void *))v7[2])( v7,  successfullyDeletedKeys,  @"ops",  @"deleted-ok",  v16);
    int v11 = (NSString *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"version"]);
    syncAnchor = self->_syncAnchor;
    self->_syncAnchor = v11;

    if ((_NSIsNSString(self->_syncAnchor) & 1) == 0)
    {
      char v13 = objc_opt_respondsToSelector(self->_syncAnchor, "stringValue");
      id v14 = self->_syncAnchor;
      if ((v13 & 1) != 0)
      {
        v15 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringValue](v14, "stringValue"));
        id v14 = self->_syncAnchor;
      }

      else
      {
        v15 = 0LL;
      }

      self->_syncAnchor = v15;
    }
  }
}

- (NSString)syncAnchor
{
  return self->_syncAnchor;
}

- (NSArray)updatedKeys
{
  return self->_updatedKeys;
}

- (NSArray)conflictedKeys
{
  return self->_conflictedKeys;
}

- (NSArray)deletedKeys
{
  return self->_deletedKeys;
}

- (NSArray)successfullyUpdatedKeys
{
  return self->_successfullyUpdatedKeys;
}

- (NSArray)successfullyDeletedKeys
{
  return self->_successfullyDeletedKeys;
}

- (void).cxx_destruct
{
}

@end