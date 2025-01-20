@interface ICDPlaybackPositionRequestOperationPut
- (ICDPlaybackPositionRequestOperationPut)initWithRequestContext:(id)a3 completionBlock:(id)a4;
- (id)_baseRequestWithURL:(id)a3;
- (id)_resolveConflictBetweenClientPayloadPair:(id)a3 andServerPayloadPair:(id)a4;
- (void)_finishWithError:(id)a3;
- (void)_finishWithResponse:(id)a3 error:(id)a4;
- (void)execute;
@end

@implementation ICDPlaybackPositionRequestOperationPut

- (ICDPlaybackPositionRequestOperationPut)initWithRequestContext:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionRequestOperationPut;
  v9 = -[ICDPlaybackPositionRequestOperationPut init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_urlBagKey, ICURLBagKeyKVSRequestURLPut);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;

    v10->_isReschedulable = 1;
  }

  return v10;
}

- (void)execute
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext storeRequestContext](self->_context, "storeRequestContext"));
  if (!v3)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      id v8 = "%{public}@ context.requestContext=nil";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
    }

- (id)_baseRequestWithURL:(id)a3
{
  id v4 = a3;
  v5 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v4);

  -[NSMutableURLRequest setHTTPMethod:](v5, "setHTTPMethod:", @"POST");
  -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v5,  "setValue:forHTTPHeaderField:",  ICHTTPHeaderContentTypeXApplePlist,  ICHTTPHeaderKeyContentType);
  v18[0] = @"domain";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext entity](self->_context, "entity"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackPositionDomain]);
  v19[0] = v7;
  v18[1] = @"key";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext entity](self->_context, "entity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playbackPositionKey]);
  v19[1] = v9;
  v18[2] = @"value";
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext entity](self->_context, "entity"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionRequestOperationBase keyValueStorePayloadWithEntity:]( self,  "keyValueStorePayloadWithEntity:",  v10));
  v19[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
  id v13 = [v12 mutableCopy];

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceGUID]);

  if (v15) {
    [v13 setObject:v15 forKey:@"guid"];
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v13,  -[ICDPlaybackPositionRequestOperationBase bodyContentFormat](self, "bodyContentFormat"),  0LL,  0LL));
  if (v16) {
    -[NSMutableURLRequest setHTTPBody:](v5, "setHTTPBody:", v16);
  }

  return v5;
}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v26 = a4;
  self->_isReschedulable = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 parsedBodyDictionary]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_dictionaryValueForKey:", @"value"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext entity](self->_context, "entity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playbackPositionKey]);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_stringValueForKey:", @"version"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_stringValueForKey:", @"domain-version"));
    v12 = objc_alloc(&OBJC_CLASS___ICPlaybackPositionEntity);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionRequestContext playbackPositionDomain]( self->_context,  "playbackPositionDomain"));
    objc_super v14 = -[ICPlaybackPositionEntity initWithDomain:](v12, "initWithDomain:", v13);

    -[ICPlaybackPositionEntity setPlaybackPositionKey:](v14, "setPlaybackPositionKey:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_numberValueForKey:", @"bktm"));
    -[ICPlaybackPositionEntity setBookmarkTime:](v14, "setBookmarkTime:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_numberValueForKey:", @"hbpl"));
    -[ICPlaybackPositionEntity setHasBeenPlayed:](v14, "setHasBeenPlayed:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_numberValueForKey:", @"plct"));
    -[ICPlaybackPositionEntity setUserPlayCount:](v14, "setUserPlayCount:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_numberValueForKey:", @"tstm"));
    -[ICPlaybackPositionEntity setBookmarkTimestamp:](v14, "setBookmarkTimestamp:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionRequestContext entity](self->_context, "entity"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[ICDPlaybackPositionRequestOperationPut _resolveConflictBetweenClientPayloadPair:andServerPayloadPair:]( self,  "_resolveConflictBetweenClientPayloadPair:andServerPayloadPair:",  v19,  v14));

    id v21 = v10;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_stringValueForKey:", @"domain-version"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"status"]);
    if (v22) {
      BOOL v23 = objc_msgSend(v6, "ic_integerValueForKey:", @"status") == 0;
    }
    else {
      BOOL v23 = 0;
    }
    self->_success = v23;

    resultItemEntity = self->_resultItemEntity;
    self->_resultItemEntity = 0LL;

    resultItemVersionAnchor = self->_resultItemVersionAnchor;
    self->_resultItemVersionAnchor = 0LL;

    objc_storeStrong((id *)&self->_resultDomainVersion, v11);
    -[ICDPlaybackPositionRequestOperationPut _finishWithError:](self, "_finishWithError:", v26);
  }
}

- (id)_resolveConflictBetweenClientPayloadPair:(id)a3 andServerPayloadPair:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bookmarkTimestamp]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 bookmarkTimestamp]);

  if (v7 >= v8) {
    v9 = v6;
  }
  else {
    v9 = v5;
  }
  id v10 = v9;

  return v10;
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  id completionHandler = (void (**)(id, BOOL, id, ICPlaybackPositionEntity *))self->_completionHandler;
  id v6 = v4;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, self->_success, v4, self->_resultItemEntity);
    id v4 = v6;
  }

  -[ICDPlaybackPositionRequestOperationPut finishWithError:](self, "finishWithError:", v4);
}

- (void).cxx_destruct
{
}

@end