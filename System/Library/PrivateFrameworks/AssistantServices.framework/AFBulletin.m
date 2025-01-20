@interface AFBulletin
- (BOOL)contentTypeMatchesNotificationType:(id)a3;
- (id)_source;
- (id)saNotificationObject;
- (id)saOnDeviceNotificationObject;
- (void)_setStandardFieldsOnNotificationObject:(id)a3;
@end

@implementation AFBulletin

- (void)_setStandardFieldsOnNotificationObject:(id)a3
{
  id v4 = a3;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin sectionID](self, "sectionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin bulletinID](self, "bulletinID"));
  v6 = objc_alloc(&OBJC_CLASS___NSString);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLPathAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLPathAllowedCharacterSet"));
  v30 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAddingPercentEncodingWithAllowedCharacters:v7]);
  v9 = -[NSString initWithFormat:](v6, "initWithFormat:", @"x-apple-siri-notification://%@", v8);

  v29 = v9;
  v28 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin displayName](self, "displayName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin date](self, "date"));
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[AFBulletin isAllDay](self, "isAllDay")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin endDate](self, "endDate"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin recencyDate](self, "recencyDate"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[AFBulletin timeZone](self, "timeZone"));
  unsigned int v25 = -[AFBulletin previewRestricted](self, "previewRestricted");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin bbBulletin](self, "bbBulletin"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 publicationDate]);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin bbBulletin](self, "bbBulletin"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 publicationDate]);

    v11 = (void *)v17;
  }

  else
  {
    v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[AFBulletin(SANotificationObject) _setStandardFieldsOnNotificationObject:]";
      __int16 v34 = 2112;
      v19 = v31;
      v35 = v30;
      __int16 v36 = 2112;
      v37 = v31;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s BBBulletin with id %@ for applicationId %@ does not have a publicationDate field, falling back to date field instead.",  buf,  0x20u);
      goto LABEL_5;
    }
  }

  v19 = v31;
LABEL_5:
  [v4 setApplicationId:v19];
  [v4 setIdentifier:v28];
  [v4 setType:v10];
  [v4 setDate:v11];
  [v4 setDateIsAllDay:v27];
  [v4 setEndDate:v12];
  [v4 setRecencyDate:v26];
  v20 = (void *)v13;
  [v4 setTimeZoneId:v13];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin publisherBulletinID](self, "publisherBulletinID"));
  [v4 setNotificationId:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v25));
  [v4 setPreviewRestricted:v22];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin threadID](self, "threadID"));
  [v4 setThreadIdentifier:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin _source](self, "_source"));
  [v4 setSource:v24];
}

- (id)saNotificationObject
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin sectionID](self, "sectionID"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[AFBulletin bulletinID](self, "bulletinID"));
  v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SANotificationObject);
    -[AFBulletin _setStandardFieldsOnNotificationObject:](self, "_setStandardFieldsOnNotificationObject:", v6);
  }

  else
  {
    v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      v10 = "-[AFBulletin(SANotificationObject) saNotificationObject]";
      __int16 v11 = 2112;
      v12 = v3;
      __int16 v13 = 2112;
      v14 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Invalid notification. applicationID %@, bulletinID %@",  (uint8_t *)&v9,  0x20u);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (id)saOnDeviceNotificationObject
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin sectionID](self, "sectionID"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[AFBulletin bulletinID](self, "bulletinID"));
  v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SANotificationOnDeviceObject);
    -[AFBulletin _setStandardFieldsOnNotificationObject:](self, "_setStandardFieldsOnNotificationObject:", v6);
    v7 = (char *)-[AFBulletin announcementType](self, "announcementType") - 1;
    else {
      id v8 = *(id *)*(&off_1004F6A50 + (void)v7);
    }
    [v6 setAnnouncementType:v8];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin message](self, "message"));
    [v6 setBody:v10];

    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin subtitle](self, "subtitle"));
    [v6 setSubtitle:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin title](self, "title"));
    [v6 setTitle:v12];

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin summary](self, "summary"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin summary](self, "summary"));
      [v6 setSummary:v14];
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin bbBulletin](self, "bbBulletin"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 summary]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 string]);
      [v6 setSummary:v16];
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin bbBulletin](self, "bbBulletin"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 threadSummary]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 string]);
    [v6 setThreadSummary:v19];

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[AFBulletin isHighlight](self, "isHighlight")));
    [v6 setIsHighlight:v20];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin notificationRequest](self, "notificationRequest"));
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin notificationRequest](self, "notificationRequest"));
      uint64_t v30 = 0LL;
      v23 = (id *)&v30;
      v24 = &v30;
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin bbBulletin](self, "bbBulletin"));
      uint64_t v29 = 0LL;
      v23 = (id *)&v29;
      v24 = &v29;
    }

    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v22,  1LL,  v24,  v29,  v30));
    id v26 = *v23;

    if (v26)
    {
      v27 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "-[AFBulletin(SANotificationObject) saOnDeviceNotificationObject]";
        __int16 v33 = 2112;
        id v34 = v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Error archiving notification request data: %@",  buf,  0x16u);
      }
    }

    [v6 setRequest:v25];
  }

  else
  {
    int v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v32 = "-[AFBulletin(SANotificationObject) saOnDeviceNotificationObject]";
      __int16 v33 = 2112;
      id v34 = v3;
      __int16 v35 = 2112;
      __int16 v36 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Invalid notification. applicationID %@, bulletinID %@",  buf,  0x20u);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)contentTypeMatchesNotificationType:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFBulletin bbBulletin](self, "bbBulletin"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentType]);

  if (![v4 isEqualToString:SANotificationTypeIncomingCallNotificationValue])
  {
    unsigned __int8 v8 = 1;
    goto LABEL_7;
  }

  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  v7 = (void *)qword_100578168;
  uint64_t v16 = qword_100578168;
  if (!qword_100578168)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10020F314;
    v12[3] = &unk_1004FDB20;
    v12[4] = &v13;
    sub_10020F314(v12);
    v7 = (void *)v14[3];
  }

  _Block_object_dispose(&v13, 8);
  if (v7)
  {
    unsigned __int8 v8 = [v6 isEqualToString:*v7];
LABEL_7:

    return v8;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getBBBulletinContentTypeIncomingCall(void)"));
  objc_msgSend( v10,  "handleFailureInFunction:file:lineNumber:description:",  v11,  @"AFBulletin+SANotificationObject.m",  20,  @"%s",  dlerror());

  __break(1u);
  return result;
}

- (id)_source
{
  if ((-[AFBulletin feed](self, "feed") & 8) != 0)
  {
    v5 = (void **)&SANotificationSourceLOCK_SCREENValue;
LABEL_8:
    id v4 = *v5;
    return v4;
  }

  if ((-[AFBulletin feed](self, "feed") & 1) != 0)
  {
    v5 = (void **)&SANotificationSourceNOTIFICATION_CENTERValue;
    goto LABEL_8;
  }

  unsigned int v3 = -[AFBulletin availableOnLockScreen](self, "availableOnLockScreen");
  id v4 = (void *)SANotificationSourceLOCK_SCREENValue;
  if (!v3) {
    id v4 = 0LL;
  }
  return v4;
}

@end