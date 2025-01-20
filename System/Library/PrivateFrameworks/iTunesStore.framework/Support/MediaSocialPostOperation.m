@interface MediaSocialPostOperation
- (MediaSocialPostOperation)initWithPostDescription:(id)a3;
- (MediaSocialPostOperation)initWithPostEntity:(id)a3;
- (NSString)userAgent;
- (id)_attachmentDictionaryWithAttachment:(id)a3;
- (id)_externalServiceDictionaryWithDestination:(id)a3;
- (id)_requestBodyDictionary;
- (id)_targetDictionaryWithContentItem:(id)a3;
- (id)resultBlock;
- (int64_t)postID;
- (void)run;
- (void)setPostID:(int64_t)a3;
- (void)setResultBlock:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation MediaSocialPostOperation

- (MediaSocialPostOperation)initWithPostDescription:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MediaSocialPostOperation;
  v5 = -[MediaSocialPostOperation init](&v20, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 authorIdentifier]);
    authorID = v5->_authorID;
    v5->_authorID = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 authorType]);
    authorType = v5->_authorType;
    v5->_authorType = (NSString *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 contentItems]);
    contentItems = v5->_contentItems;
    v5->_contentItems = (NSArray *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 externalServiceDestinations]);
    externalServiceDestinations = v5->_externalServiceDestinations;
    v5->_externalServiceDestinations = (NSArray *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 text]);
    text = v5->_text;
    v5->_text = (NSString *)v16;

    v18 = CFUUIDCreate(0LL);
    v5->_postIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v18);
    CFRelease(v18);
  }

  return v5;
}

- (MediaSocialPostOperation)initWithPostEntity:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MediaSocialPostOperation;
  v5 = -[MediaSocialPostOperation init](&v18, "init");
  if (v5)
  {
    v23[0] = @"account_id";
    v23[1] = @"author_id";
    v23[2] = @"author_type";
    v23[3] = @"is_attributed";
    v23[4] = @"message";
    v23[5] = @"source_app";
    v23[6] = @"creation_time";
    id v22 = 0LL;
    *(_OWORD *)objc_super v20 = 0u;
    *(_OWORD *)v21 = 0u;
    *(_OWORD *)obj = 0u;
    [v4 getValues:obj forProperties:v23 count:7];
    objc_storeStrong((id *)&v5->_accountID, obj[0]);
    objc_storeStrong((id *)&v5->_authorID, obj[1]);
    objc_storeStrong((id *)&v5->_authorType, v20[0]);
    [v22 doubleValue];
    v5->_createTime = v6;
    v5->_isAttributed = [v20[1] BOOLValue];
    v5->_postIdentifier = (int64_t)[v4 persistentID];
    objc_storeStrong((id *)&v5->_text, v21[0]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 uploadedAttachments]);
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 contentItems]);
    contentItems = v5->_contentItems;
    v5->_contentItems = (NSArray *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 externalServiceDestinations]);
    externalServiceDestinations = v5->_externalServiceDestinations;
    v5->_externalServiceDestinations = (NSArray *)v11;

    if (v21[1])
    {
      id v13 = sub_100147FA8(v21[1]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      userAgent = v5->_userAgent;
      v5->_userAgent = (NSString *)v14;
    }

    for (uint64_t i = 6LL; i != -1; --i)
  }

  return v5;
}

- (id)resultBlock
{
  id v3 = [self->_resultBlock copy];
  -[MediaSocialPostOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setResultBlock:(id)a3
{
  id v6 = a3;
  -[MediaSocialPostOperation lock](self, "lock");
  if (self->_resultBlock != v6)
  {
    id v4 = [v6 copy];
    id resultBlock = self->_resultBlock;
    self->_id resultBlock = v4;
  }

  -[MediaSocialPostOperation unlock](self, "unlock");
}

- (void)setUserAgent:(id)a3
{
  id v6 = (NSString *)a3;
  -[MediaSocialPostOperation lock](self, "lock");
  if (self->_userAgent != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    userAgent = self->_userAgent;
    self->_userAgent = v4;
  }

  -[MediaSocialPostOperation unlock](self, "unlock");
}

- (NSString)userAgent
{
  id v3 = -[NSString copy](self->_userAgent, "copy");
  -[MediaSocialPostOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (void)run
{
  v71 = objc_alloc_init(&OBJC_CLASS___MediaSocialPostResponse);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostOperation _requestBodyDictionary](self, "_requestBodyDictionary"));
  id v73 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v3,  0LL,  &v73));
  v5 = (NSURL *)v73;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostOperation userAgent](self, "userAgent"));
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
    uint64_t v8 = SSHTTPHeaderUserAgent;
    -[os_log_s setValue:forHTTPHeaderField:](v7, "setValue:forHTTPHeaderField:", v6, SSHTTPHeaderUserAgent);
    -[os_log_s setIgnoresCaches:](v7, "setIgnoresCaches:", 1LL);
    v70 = (void *)objc_claimAutoreleasedReturnValue( -[MediaSocialPostOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  v7,  0LL));
    if (!v70) {
      goto LABEL_49;
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v70 valueForKey:SSVURLBagKeyMusicConnect]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"createSocialPost"]);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        v68 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v11);

        if (v68)
        {
          id v69 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 409LL));
          v74[0] = v66;
          id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 500LL));
          v74[1] = v13;
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 502LL));
          v74[2] = v14;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v74, 3LL));
          [v69 setPassThroughErrors:v15];

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
          [v69 setDataProvider:v16];

          v17 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
          -[SSMutableURLRequestProperties setHTTPBody:](v17, "setHTTPBody:", v4);
          -[SSMutableURLRequestProperties setHTTPMethod:](v17, "setHTTPMethod:", @"POST");
          -[SSMutableURLRequestProperties setURL:](v17, "setURL:", v68);
          -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v17,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
          -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](v17, "setValue:forHTTPHeaderField:", v6, v8);
          SSVAddMediaSocialHeadersToURLRequestProperties(v17);
          [v69 setRequestProperties:v17];
          v67 = v17;
          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v18) {
            objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          LODWORD(v19) = [v18 shouldLog];
          unsigned int v20 = [v18 shouldLogToDisk];
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
          id v22 = v21;
          if (v20) {
            LODWORD(v19) = v19 | 2;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
            uint64_t v19 = v19;
          }
          else {
            v19 &= 2u;
          }
          if ((_DWORD)v19)
          {
            v23 = (void *)objc_opt_class(self);
            int64_t postIdentifier = self->_postIdentifier;
            int v75 = 138412546;
            v76 = v23;
            __int16 v77 = 2048;
            v78 = (NSURL *)postIdentifier;
            id v25 = v23;
            v26 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  1LL,  "%@: Sending post with identifier: %lld",  &v75,  22);

            if (!v26) {
              goto LABEL_17;
            }
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
            free(v26);
            v59 = v22;
            SSFileLog(v18, @"%@");
          }

LABEL_17:
          v72 = v5;
          unsigned int v27 = -[MediaSocialPostOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v69,  &v72);
          v28 = v72;

          if (!v27)
          {
LABEL_35:

            v5 = v68;
LABEL_61:

            v5 = v28;
            goto LABEL_62;
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue([v69 dataProvider]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v29 output]);

          uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v30, v31) & 1) == 0)
          {
LABEL_34:

            goto LABEL_35;
          }

          v65 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"status"]);
          uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v65, v32) & 1) == 0
            || ![v65 isEqualToString:@"error"])
          {
LABEL_33:
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "response", v59));
            -[MediaSocialPostResponse setStatusCode:](v71, "setStatusCode:", objc_msgSend(v41, "itunes_statusCode"));

            -[MediaSocialPostResponse setValuesWithResponseDictionary:](v71, "setValuesWithResponseDictionary:", v30);
            goto LABEL_34;
          }

          v64 = (NSURL *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"error"]);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v33) {
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          LODWORD(v34) = objc_msgSend(v33, "shouldLog", v59);
          unsigned int v61 = [v33 shouldLogToDisk];
          v63 = v33;
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 OSLogObject]);
          v36 = v35;
          if (v61) {
            LODWORD(v34) = v34 | 2;
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v34 = v34;
          }
          else {
            v34 &= 2u;
          }
          if ((_DWORD)v34)
          {
            v37 = (void *)objc_opt_class(self);
            int v75 = 138412546;
            v76 = v37;
            __int16 v77 = 2112;
            v78 = v64;
            id v62 = v37;
            LODWORD(v60) = 22;
            v38 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "%@: Post failed with error: %@",  &v75,  v60);

            if (!v38)
            {
LABEL_32:

              uint64_t v39 = SSError(SSErrorDomain, 100LL, 0LL, 0LL);
              uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);

              v28 = (NSURL *)v40;
              goto LABEL_33;
            }

            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
            free(v38);
            v59 = v36;
            SSFileLog(v63, @"%@");
          }

          goto LABEL_32;
        }

- (id)_attachmentDictionaryWithAttachment:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 albumIdentifier]);
  if (v6) {
    [v5 setObject:v6 forKey:@"albumId"];
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 assetToken]);

  if (v7) {
    [v5 setObject:v7 forKey:@"contentToken"];
  }
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 assetTokenType]);

  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = @"AssetToken";
  }
  [v5 setObject:v9 forKey:@"contentTokenType"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 categoryName]);

  if (v10) {
    [v5 setObject:v10 forKey:@"category"];
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 attachmentDescription]);

  if (v11) {
    [v5 setObject:v11 forKey:@"description"];
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);

  if (v12) {
    [v5 setObject:v12 forKey:@"title"];
  }
  authorID = self->_authorID;
  if (authorID)
  {
    [v5 setObject:authorID forKey:@"artistAdamId"];
  }

  else
  {
    accountID = self->_accountID;
    if (accountID)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](accountID, "stringValue"));
      [v5 setObject:v15 forKey:@"artistAdamId"];
    }
  }

  uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 artists]);
  uint64_t v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472LL;
  v33 = sub_1001490E8;
  uint64_t v34 = &unk_10034FAF0;
  objc_super v18 = v16;
  v35 = v18;
  [v17 enumerateObjectsUsingBlock:&v31];

  if (-[NSMutableArray count](v18, "count")) {
    [v5 setObject:v18 forKey:@"allArtistAdamIds"];
  }
  switch((unint64_t)[v4 attachmentType])
  {
    case 1uLL:
      uint64_t v19 = @"Song";
      goto LABEL_26;
    case 2uLL:
      unsigned int v20 = @"Image";
      goto LABEL_27;
    case 3uLL:
      uint64_t v19 = @"SoundBite";
LABEL_26:
      [v5 setObject:v19 forKey:@"audioType"];
      unsigned int v20 = @"Audio";
LABEL_27:
      [v5 setObject:v20 forKey:@"requestType"];
      break;
    case 4uLL:
      v21 = objc_alloc(&OBJC_CLASS___NSString);
      [v4 previewFrameTimestamp];
      v23 = -[NSString initWithFormat:](v21, "initWithFormat:", @"%.0f", v22, v31, v32, v33, v34);
      [v5 setObject:v23 forKey:@"previewFrameTimeCode"];
      [v5 setObject:@"Video" forKey:@"requestType"];
      [v5 setObject:@"VideoClip" forKey:@"videoType"];

      break;
    default:
      break;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue( [v4 childAttachmentForRelationship:SSVMediaSocialPostAttachmentRelationshipCoverImage]);
  id v25 = v24;
  if (v24)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 assetToken]);
    if (v26) {
      [v5 setObject:v26 forKey:@"coverArtToken"];
    }
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v25 assetTokenType]);

    if (v27) {
      [v5 setObject:v27 forKey:@"coverArtTokenType"];
    }
  }

  [v4 uploadTime];
  v29 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", 1000 * (uint64_t)v28);
  [v5 setObject:v29 forKey:@"uploadTimestamp"];

  return v5;
}

- (id)_externalServiceDictionaryWithDestination:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accessToken]);
  if (v5) {
    [v4 setObject:v5 forKey:@"accessToken"];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceIdentifier]);
  if ([v6 isEqualToString:SSVMediaSocialPostExternalServiceTwitter])
  {
    [v4 setObject:@"twitter" forKey:@"type"];
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 pageIdentifier]);
    if (v7) {
      [v4 setObject:v7 forKey:@"pageId"];
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 pageAccessToken]);
    if (v8)
    {
      [v4 setObject:v8 forKey:@"pageToken"];
      uint64_t v9 = @"facebook_page";
    }

    else if (v7)
    {
      uint64_t v9 = @"facebook_page";
    }

    else
    {
      uint64_t v9 = @"facebook_wall";
    }

    [v4 setObject:v9 forKey:@"type"];
  }

  return v4;
}

- (id)_requestBodyDictionary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lld",  self->_postIdentifier);
  [v3 setObject:v4 forKey:@"client_post_id"];
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"shareText"];
  }
  p_authorID = &self->_authorID;
  if (!self->_authorID || (p_authorType = &self->_authorType, !self->_authorType))
  {
    p_authorID = &self->_accountID;
    if (!self->_accountID) {
      goto LABEL_8;
    }
    p_authorType = (NSString **)&SSVMediaSocialPostAuthorTypeUser;
  }

  uint64_t v8 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  *p_authorID,  @"id",  *p_authorType,  @"type",  0LL);
  [v3 setObject:v8 forKey:@"owner"];

LABEL_8:
  if (-[NSArray count](self->_attachments, "count"))
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    uint64_t v10 = self->_attachments;
    id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v44,  v50,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v45;
      do
      {
        for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue( -[MediaSocialPostOperation _attachmentDictionaryWithAttachment:]( self,  "_attachmentDictionaryWithAttachment:",  *(void *)(*((void *)&v44 + 1) + 8LL * (void)i)));
          -[NSMutableArray addObject:](v9, "addObject:", v15);
        }

        id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v44,  v50,  16LL);
      }

      while (v12);
    }

    [v3 setObject:v9 forKey:@"content"];
  }

  double createTime = self->_createTime;
  if (createTime > 0.0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  floor(createTime * 1000.0)));
    [v3 setObject:v17 forKey:@"createTime"];
  }

  if (self->_isAttributed) {
    [v3 setObject:&__kCFBooleanTrue forKey:@"isAttributed"];
  }
  NSUInteger v18 = -[NSArray count](self->_contentItems, "count");
  contentItems = self->_contentItems;
  if (v18 == 1)
  {
    unsigned int v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](contentItems, "firstObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[MediaSocialPostOperation _targetDictionaryWithContentItem:]( self,  "_targetDictionaryWithContentItem:",  v20));
    [v3 setObject:v21 forKey:@"target"];
  }

  else
  {
    if (-[NSArray count](contentItems, "count") < 2) {
      goto LABEL_33;
    }
    unsigned int v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    uint64_t v22 = self->_contentItems;
    id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v40,  v49,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( -[MediaSocialPostOperation _targetDictionaryWithContentItem:]( self,  "_targetDictionaryWithContentItem:",  *(void *)(*((void *)&v40 + 1) + 8LL * (void)j)));
          -[NSMutableArray addObject:](v20, "addObject:", v27);
        }

        id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v40,  v49,  16LL);
      }

      while (v24);
    }

    [v3 setObject:v20 forKey:@"target"];
  }

LABEL_33:
  if (-[NSArray count](self->_externalServiceDestinations, "count"))
  {
    double v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    v29 = self->_externalServiceDestinations;
    id v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (k = 0LL; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[MediaSocialPostOperation _externalServiceDictionaryWithDestination:]( self,  "_externalServiceDictionaryWithDestination:",  *(void *)(*((void *)&v36 + 1) + 8LL * (void)k)));
          -[NSMutableArray addObject:](v28, "addObject:", v34);
        }

        id v31 = -[NSArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
      }

      while (v31);
    }

    [v3 setObject:v28 forKey:@"shareTo"];
  }

  return v3;
}

- (id)_targetDictionaryWithContentItem:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  if (v5) {
    [v4 setObject:v5 forKey:@"id"];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);

  if (v6) {
    [v4 setObject:v6 forKey:@"type"];
  }

  return v4;
}

- (int64_t)postID
{
  return self->_postID;
}

- (void)setPostID:(int64_t)a3
{
  self->_postID = a3;
}

- (void).cxx_destruct
{
}

@end