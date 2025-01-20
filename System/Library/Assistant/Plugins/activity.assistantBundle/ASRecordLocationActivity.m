@interface ASRecordLocationActivity
- (ASRecordActivity)recordActivityCommand;
- (ASRecordLocationActivity)recordLocationActivityWithCompletion:(id)a3;
- (id)_activityFromLocation:(id)a3 sourceType:(id)a4;
- (id)_locationMetadataFromLocation:(id)a3;
- (id)_recordActivityCommandFromLocation:(id)a3 sourceType:(id)a4;
- (void)performWithCompletion:(id)a3;
- (void)setRecordActivityCommand:(id)a3;
@end

@implementation ASRecordLocationActivity

- (void)performWithCompletion:(id)a3
{
}

- (ASRecordLocationActivity)recordLocationActivityWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG)) {
    sub_7DEC(v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordLocationActivity location](self, "location"));

  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid ace command %@",  self));
    v12 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      sub_7D64((uint64_t)v11, v12);
      if (!v4) {
        goto LABEL_8;
      }
    }

    else if (!v4)
    {
LABEL_8:

      goto LABEL_9;
    }

    id v13 = [[SACommandFailed alloc] initWithReason:v11];
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
    v4[2](v4, v14);

    goto LABEL_8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordLocationActivity location](self, "location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordLocationActivity sourceType](self, "sourceType"));
  v9 = (ASRecordActivity *)objc_claimAutoreleasedReturnValue( -[ASRecordLocationActivity _recordActivityCommandFromLocation:sourceType:]( self,  "_recordActivityCommandFromLocation:sourceType:",  v7,  v8));
  recordActivityCommand = self->_recordActivityCommand;
  self->_recordActivityCommand = v9;

  -[ASRecordActivity performWithCompletion:](self->_recordActivityCommand, "performWithCompletion:", v4);
LABEL_9:

  return result;
}

- (id)_recordActivityCommandFromLocation:(id)a3 sourceType:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[ASRecordLocationActivity _activityFromLocation:sourceType:]( self,  "_activityFromLocation:sourceType:",  a3,  a4));
  v5 = objc_opt_new(&OBJC_CLASS___ASRecordActivity);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  -[ASRecordActivity setAceId:](v5, "setAceId:", v7);

  -[ASRecordActivity setActivity:](v5, "setActivity:", v4);
  return v5;
}

- (id)_activityFromLocation:(id)a3 sourceType:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASRecordLocationActivity _locationMetadataFromLocation:](self, "_locationMetadataFromLocation:", a3));
  v8 = (void *)objc_opt_new(&OBJC_CLASS___SAActivityObject);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  [v8 setAceId:v10];

  v11 = @"com.apple.siri";
  if (([v6 isEqualToString:@"Default"] & 1) == 0
    && [v6 isEqualToString:@"HomePod"])
  {
    v11 = @"com.apple.siri.homepod";
  }

  [v8 setType:v11];
  [v8 setStreamType:@"/app/locationActivity"];
  [v8 setVisibility:@"Public"];
  [v8 setMetadata:v7];

  return v8;
}

- (id)_locationMetadataFromLocation:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 city]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCode]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stateCode]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 thoroughfare]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v3 subThoroughfare]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v3 postalCode]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 latitude]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 longitude]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 label]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 street]);

  v30 = v11;
  if (![v10 length] && objc_msgSend(v11, "length", v11))
  {
    id v12 = v11;

    v10 = v12;
  }

  if (objc_msgSend(v10, "length", v30))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[_DKLocationApplicationActivityMetadataKey locationName]( &OBJC_CLASS____DKLocationApplicationActivityMetadataKey,  "locationName"));
    [v4 setObject:v10 forKeyedSubscript:v13];
  }

  if ([v5 length])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DKLocationApplicationActivityMetadataKey city]( &OBJC_CLASS____DKLocationApplicationActivityMetadataKey,  "city"));
    [v4 setObject:v5 forKeyedSubscript:v14];
  }

  if ([v6 length])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[_DKLocationApplicationActivityMetadataKey country]( &OBJC_CLASS____DKLocationApplicationActivityMetadataKey,  "country"));
    [v4 setObject:v6 forKeyedSubscript:v15];
  }

  if ([v7 length])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[_DKLocationApplicationActivityMetadataKey stateOrProvince]( &OBJC_CLASS____DKLocationApplicationActivityMetadataKey,  "stateOrProvince"));
    [v4 setObject:v7 forKeyedSubscript:v16];
  }

  if ([v8 length])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[_DKLocationApplicationActivityMetadataKey thoroughfare]( &OBJC_CLASS____DKLocationApplicationActivityMetadataKey,  "thoroughfare"));
    [v4 setObject:v8 forKeyedSubscript:v17];
  }

  if ([v33 length])
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[_DKLocationApplicationActivityMetadataKey subThoroughfare]( &OBJC_CLASS____DKLocationApplicationActivityMetadataKey,  "subThoroughfare"));
    [v4 setObject:v33 forKeyedSubscript:v18];
  }

  v19 = v7;
  v20 = v32;
  if ([v32 length])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[_DKLocationApplicationActivityMetadataKey postalCode]( &OBJC_CLASS____DKLocationApplicationActivityMetadataKey,  "postalCode"));
    [v4 setObject:v32 forKeyedSubscript:v21];
  }

  if (v34)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v34 stringValue]);
    v23 = v6;
    v24 = v5;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[_DKLocationApplicationActivityMetadataKey latitude]( &OBJC_CLASS____DKLocationApplicationActivityMetadataKey,  "latitude"));
    [v4 setObject:v22 forKeyedSubscript:v25];

    v5 = v24;
    id v6 = v23;
    v20 = v32;
  }

  if (v9)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);
    v27 = v5;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[_DKLocationApplicationActivityMetadataKey longitude]( &OBJC_CLASS____DKLocationApplicationActivityMetadataKey,  "longitude"));
    [v4 setObject:v26 forKeyedSubscript:v28];

    v5 = v27;
  }

  return v4;
}

- (ASRecordActivity)recordActivityCommand
{
  return self->_recordActivityCommand;
}

- (void)setRecordActivityCommand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end