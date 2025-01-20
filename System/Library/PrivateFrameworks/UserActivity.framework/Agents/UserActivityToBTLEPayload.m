@interface UserActivityToBTLEPayload
- (NSData)streamsData;
- (NSData)userInfoPayload;
- (NSDate)when;
- (NSDictionary)additionalItems;
- (NSError)error;
- (NSString)activityType;
- (NSString)teamID;
- (NSString)title;
- (NSURL)webpageURL;
- (NSUUID)uniqueIdentifier;
- (UserActivityToBTLEPayload)initWithData:(id)a3;
- (UserActivityToBTLEPayload)initWithNSError:(id)a3;
- (id)description;
- (id)encodeAsData;
- (id)init:(id)a3 title:(id)a4 date:(id)a5 userInfoPayload:(id)a6 teamID:(id)a7 activityType:(id)a8;
- (void)addAdditionalItem:(id)a3 forKey:(id)a4;
- (void)setActivityType:(id)a3;
- (void)setError:(id)a3;
- (void)setStreamsData:(id)a3;
- (void)setTeamID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUserInfoPayload:(id)a3;
- (void)setWebpageURL:(id)a3;
- (void)setWhen:(id)a3;
@end

@implementation UserActivityToBTLEPayload

- (id)init:(id)a3 title:(id)a4 date:(id)a5 userInfoPayload:(id)a6 teamID:(id)a7 activityType:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (__CFString *)a7;
  id v19 = a8;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___UserActivityToBTLEPayload;
  v20 = -[UserActivityToBTLEPayload init](&v36, "init");
  if (v20)
  {
    v21 = (NSString *)[v15 copy];
    title = v20->_title;
    v20->_title = v21;

    v23 = (NSUUID *)[v14 copy];
    uniqueIdentifier = v20->_uniqueIdentifier;
    v20->_uniqueIdentifier = v23;

    v25 = (NSDate *)[v16 copy];
    when = v20->_when;
    v20->_when = v25;

    v27 = (NSData *)[v17 copy];
    userInfoPayload = v20->_userInfoPayload;
    v20->_userInfoPayload = v27;

    webpageURL = v20->_webpageURL;
    v20->_webpageURL = 0LL;

    streamsData = v20->_streamsData;
    v20->_streamsData = 0LL;

    if (v18 && -[__CFString isEqual:](v18, "isEqual:", @"0000000000"))
    {

      v18 = &stru_1000BE738;
    }

    v31 = (NSString *)-[__CFString copy](v18, "copy");
    teamID = v20->_teamID;
    v20->_teamID = v31;

    v33 = (NSString *)[v19 copy];
    activityType = v20->_activityType;
    v20->_activityType = v33;
  }

  return v20;
}

- (UserActivityToBTLEPayload)initWithNSError:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UserActivityToBTLEPayload;
  v5 = -[UserActivityToBTLEPayload init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[UserActivityToBTLEPayload setError:](v5, "setError:", v4);
  }

  return v6;
}

- (NSDictionary)additionalItems
{
  return (NSDictionary *)-[NSMutableDictionary copy](self->_additionalItems, "copy");
}

- (void)addAdditionalItem:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v15 = v6;
  id v7 = a4;
  id v14 = v7;
  if (v7)
  {
    id v8 = v7;
    v9 = self;
    objc_sync_enter(v9);
    additionalItems = v9->_additionalItems;
    if (additionalItems) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v6 == 0LL;
    }
    if (v11)
    {
      if (v6) {
        -[NSMutableDictionary setValue:forKey:](additionalItems, "setValue:forKey:", v6, v8, v14, v15);
      }
      else {
        -[NSMutableDictionary removeObjectForKey:](additionalItems, "removeObjectForKey:", v8, v14, v15);
      }
    }

    else
    {
      v12 = -[NSMutableDictionary initWithObjects:forKeys:count:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjects:forKeys:count:",  &v15,  &v14,  1LL);
      v13 = v9->_additionalItems;
      v9->_additionalItems = v12;
    }

    objc_sync_exit(v9);
  }
}

- (UserActivityToBTLEPayload)initWithData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (unint64_t)[v4 length] >= 4)
  {
    id v5 = v5;
    int v6 = *(_DWORD *)[v5 bytes];
    int v54 = 4;
    uint64_t v7 = v6 & 0xF;
    if ((v6 & 0xF) == 0xF)
    {
      id v15 = sub_100041DA4(v5, &v54);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v17 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v16,  0LL);
      id v18 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v17,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSError),  NSKeyedArchiveRootObjectKey);
      id v19 = (NSError *)objc_claimAutoreleasedReturnValue(v18);
      -[NSKeyedUnarchiver finishDecoding](v17, "finishDecoding");
      if (!v19)
      {
        os_log_t v28 = sub_100039584(0LL);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "*** ERROR: Received BTLEUserActivity error packet, but unable to de-archive it, so discarding it.",  buf,  2u);
        }

        id v5 = 0LL;
        id v14 = 0LL;
        v13 = self;
        goto LABEL_43;
      }

      v13 = 0LL;
      v50 = 0LL;
      id obj = 0LL;
      v20 = 0LL;
      v21 = 0LL;
      v22 = v17;
      v12 = v16;
      id v16 = 0LL;
      id v17 = 0LL;
    }

    else
    {
      if ((_DWORD)v7 != 1)
      {
        os_log_t v23 = sub_100039584(0LL);
        id v17 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v56 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "*** ERROR: Received BTLEUserActivity packet with unknown version, %ld, so discarding it.",  buf,  0xCu);
        }

        id v14 = 0LL;
        id v16 = v5;
        v13 = self;
        id v5 = 0LL;
        goto LABEL_43;
      }

      if ((v6 & 0x100) != 0)
      {
        id v8 = sub_100041BEC(v5);
        uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

        id v5 = (id)v9;
        if (!v9)
        {
          id v14 = 0LL;
          goto LABEL_44;
        }
      }

      id v10 = sub_100041DA4(v5, &v54);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = v11;
      if (v11 && [v11 length]) {
        v13 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v12, 4LL);
      }
      else {
        v13 = 0LL;
      }
      id v24 = sub_100041DA4(v5, &v54);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v24);
      id v25 = sub_100041DA4(v5, &v54);
      v22 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(v25);
      if (v22)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v22,  0LL,  0LL));
        if (v26 && (uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v26, v27) & 1) != 0))
        {
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"teamID"]);
          v50 = (NSString *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"type"]);
          v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v26));
        }

        else
        {
          v21 = 0LL;
          v50 = 0LL;
          v20 = 0LL;
        }
      }

      else
      {
        v21 = 0LL;
        v50 = 0LL;
        v20 = 0LL;
      }

      id v30 = sub_100041DA4(v5, &v54);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = v31;
      if (v31 && [v31 length])
      {
        obja = v21;
        v33 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v32, 4LL);
        v34 = v33;
        if (v33 && -[NSString length](v33, "length")) {
          id v17 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v34));
        }
        else {
          id v17 = 0LL;
        }

        v21 = obja;
      }

      else
      {
        id v17 = 0LL;
      }

      id v35 = sub_100041DA4(v5, &v54);
      id obj = (id)objc_claimAutoreleasedReturnValue(v35);

      id v19 = 0LL;
    }

    v53.receiver = self;
    v53.super_class = (Class)&OBJC_CLASS___UserActivityToBTLEPayload;
    objc_super v36 = -[UserActivityToBTLEPayload init](&v53, "init");
    id v14 = v36;
    if (v36)
    {
      objc_storeStrong((id *)&v36->_title, v13);
      uniqueIdentifier = v14->_uniqueIdentifier;
      v14->_uniqueIdentifier = 0LL;

      when = v14->_when;
      v14->_when = 0LL;

      objc_storeStrong((id *)&v14->_userInfoPayload, v16);
      objc_storeStrong((id *)&v14->_webpageURL, v17);
      objc_storeStrong((id *)&v14->_streamsData, obj);
      v49 = v16;
      if (v20 && -[__CFString isEqual:](v20, "isEqual:", @"0000000000"))
      {
        v39 = v13;

        v20 = &stru_1000BE738;
      }

      else
      {
        v39 = v13;
      }

      teamID = v14->_teamID;
      v14->_teamID = &v20->isa;
      v41 = v20;

      activityType = v14->_activityType;
      v14->_activityType = v50;
      v43 = v50;

      additionalItems = v14->_additionalItems;
      v14->_additionalItems = v21;
      v45 = v21;

      error = v14->_error;
      v14->_error = v19;
      v47 = v19;

      v13 = v39;
      id v16 = v49;
    }

    else
    {
    }

- (id)encodeAsData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload error](self, "error"));

  if (!v4)
  {
    int v24 = 1;
    [v3 appendBytes:&v24 length:4];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self->_title, "dataUsingEncoding:", 4LL));
    sub_100042140(v3, v7);

    sub_100042140(v3, self->_userInfoPayload);
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload additionalItems](self, "additionalItems"));
    if (v6) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));
    }
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    uint64_t v9 = (void *)v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](self, "teamID"));

    if (v10)
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](self, "teamID"));
      [v9 setObject:v11 forKey:@"teamID"];
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload activityType](self, "activityType"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload activityType](self, "activityType"));
      [v9 setObject:v13 forKey:@"type"];
    }

    if ([v9 count]) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v9,  0LL,  0LL));
    }
    else {
      id v14 = 0LL;
    }
    sub_100042140(v3, v14);
    webpageURL = self->_webpageURL;
    if (webpageURL)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](webpageURL, "absoluteString"));
      id v17 = v16;
      if (v16 && [v16 length]) {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataUsingEncoding:4]);
      }
      else {
        id v18 = 0LL;
      }
    }

    else
    {
      id v18 = 0LL;
    }

    sub_100042140(v3, v18);
    sub_100042140(v3, self->_streamsData);
    if ((unint64_t)[v3 length] >> 31)
    {
      id v19 = v3;
      v3 = 0LL;
    }

    else
    {
      if ((unint64_t)[v3 length] < 0x801)
      {
LABEL_26:

        goto LABEL_27;
      }

      id v20 = sub_1000421CC(v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      id v19 = v21;
      if (v21)
      {
        id v19 = v21;

        v3 = v19;
      }
    }

    goto LABEL_26;
  }

  int v25 = 15;
  [v3 appendBytes:&v25 length:4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload error](self, "error"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  0LL));

  sub_100042140(v3, v6);
LABEL_27:

  id v22 = [v3 copy];
  return v22;
}

- (id)description
{
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload userInfoPayload](self, "userInfoPayload"));
  id v5 = sub_10005BD28(v26, 32LL);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  int v24 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload streamsData](self, "streamsData"));
  int v25 = (void *)v6;
  if (v24)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload streamsData](self, "streamsData"));
    id v7 = sub_10005BD28(v22, 32LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"stream=%@",  v21));
  }

  else
  {
    uint64_t v27 = &stru_1000BE738;
  }

  os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload webpageURL](self, "webpageURL"));
  if (v23) {
    uint64_t v8 = @"webPageURL=<private>";
  }
  else {
    uint64_t v8 = &stru_1000BE738;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](self, "teamID"));
  if (v9
    || (id v20 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload activityType](self, "activityType"))) != 0LL)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload teamID](self, "teamID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload activityType](self, "activityType"));
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" {teamID=%@ activityType=%@}",  v2,  v3));
    int v11 = 1;
  }

  else
  {
    id v20 = 0LL;
    int v11 = 0;
    id v10 = &stru_1000BE738;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload additionalItems](self, "additionalItems"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityToBTLEPayload additionalItems](self, "additionalItems"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"additional=%@",  v13));
    id v18 = v8;
    id v15 = v25;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BTLEUserActivityDataEncoding: userInfo=%@ %@%@%@%@",  v25,  v27,  v18,  v10,  v14));
  }

  else
  {
    id v19 = v8;
    id v15 = v25;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BTLEUserActivityDataEncoding: userInfo=%@ %@%@%@%@",  v25,  v27,  v19,  v10,  &stru_1000BE738));
  }

  if (v11)
  {
  }

  if (!v9) {

  }
  if (v24)
  {
  }

  return v16;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSDate)when
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setWhen:(id)a3
{
}

- (NSData)userInfoPayload
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setUserInfoPayload:(id)a3
{
}

- (NSURL)webpageURL
{
  return (NSURL *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setWebpageURL:(id)a3
{
}

- (NSData)streamsData
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setStreamsData:(id)a3
{
}

- (NSString)teamID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTeamID:(id)a3
{
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setActivityType:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end