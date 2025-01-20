@interface MediaSocialErrorCoordinator
- (BOOL)addDialogForPost:(id)a3;
- (BOOL)addDialogForPost:(id)a3 errorMessage:(id)a4 canRetry:(BOOL)a5;
- (BOOL)addDialogForUpload:(id)a3;
- (BOOL)addDialogForUploadIdentifiers:(id)a3;
- (MediaSocialErrorCoordinator)initWithDispatchQueue:(id)a3;
- (MediaSocialErrorDelegate)delegate;
- (NSArray)postIdentifiers;
- (NSArray)uploadIdentifiers;
- (id)_newErrorDialogWithServerMessageWithPost:(id)a3 erroMessage:(id)a4 canRetry:(BOOL)a5;
- (id)_newPluralErrorDialogWithCount:(int64_t)a3 formatString:(id)a4;
- (id)_newPluralErrorDialogWithPostCount:(int64_t)a3;
- (id)_newPluralErrorDialogWithPostCount:(int64_t)a3 uploadCount:(int64_t)a4;
- (id)_newPluralErrorDialogWithUploadCount:(int64_t)a3;
- (id)_newSingleErrorDialogWithPost:(id)a3;
- (id)_newSingleErrorDialogWithUpload:(id)a3;
- (void)_sendDidFinishWithResponseFlags:(unint64_t)a3;
- (void)_showDialog:(id)a3;
- (void)dismissAllDialogs;
- (void)setDelegate:(id)a3;
@end

@implementation MediaSocialErrorCoordinator

- (MediaSocialErrorCoordinator)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MediaSocialErrorCoordinator;
  v6 = -[MediaSocialErrorCoordinator init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }

  return v7;
}

- (BOOL)addDialogForPost:(id)a3
{
  id v4 = a3;
  id v5 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v4 persistentID]);
  postIDs = self->_postIDs;
  if (!postIDs)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    v8 = self->_postIDs;
    self->_postIDs = v7;

    postIDs = self->_postIDs;
  }

  -[NSMutableOrderedSet addObject:](postIDs, "addObject:", v5);
  id v9 = -[NSMutableOrderedSet count](self->_uploadIDs, "count");
  id v10 = -[NSMutableOrderedSet count](self->_postIDs, "count");
  if (v9)
  {
    id v11 = -[MediaSocialErrorCoordinator _newPluralErrorDialogWithPostCount:uploadCount:]( self,  "_newPluralErrorDialogWithPostCount:uploadCount:",  v10,  -[NSMutableOrderedSet count](self->_uploadIDs, "count"));
  }

  else if ((unint64_t)v10 < 2)
  {
    id v11 = -[MediaSocialErrorCoordinator _newSingleErrorDialogWithPost:](self, "_newSingleErrorDialogWithPost:", v4);
  }

  else
  {
    id v11 = -[MediaSocialErrorCoordinator _newPluralErrorDialogWithPostCount:]( self,  "_newPluralErrorDialogWithPostCount:",  -[NSMutableOrderedSet count](self->_postIDs, "count"));
  }

  v12 = v11;
  if (v11) {
    -[MediaSocialErrorCoordinator _showDialog:](self, "_showDialog:", v11);
  }

  return v12 != 0LL;
}

- (BOOL)addDialogForPost:(id)a3 errorMessage:(id)a4 canRetry:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v8 persistentID]);
  postIDs = self->_postIDs;
  if (!postIDs)
  {
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    v13 = self->_postIDs;
    self->_postIDs = v12;

    postIDs = self->_postIDs;
  }

  -[NSMutableOrderedSet addObject:](postIDs, "addObject:", v10);
  id v14 = -[MediaSocialErrorCoordinator _newErrorDialogWithServerMessageWithPost:erroMessage:canRetry:]( self,  "_newErrorDialogWithServerMessageWithPost:erroMessage:canRetry:",  v8,  v9,  v5);

  if (v14) {
    -[MediaSocialErrorCoordinator _showDialog:](self, "_showDialog:", v14);
  }

  return v14 != 0LL;
}

- (BOOL)addDialogForUpload:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v4 persistentID]);
  uploadIDs = self->_uploadIDs;
  if (!uploadIDs)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    id v8 = self->_uploadIDs;
    self->_uploadIDs = v7;

    uploadIDs = self->_uploadIDs;
  }

  -[NSMutableOrderedSet addObject:](uploadIDs, "addObject:", v5);
  if (-[NSMutableOrderedSet count](self->_postIDs, "count"))
  {
    id v9 = -[MediaSocialErrorCoordinator _newPluralErrorDialogWithPostCount:uploadCount:]( self,  "_newPluralErrorDialogWithPostCount:uploadCount:",  -[NSMutableOrderedSet count](self->_postIDs, "count"),  -[NSMutableOrderedSet count](self->_uploadIDs, "count"));
  }

  else if ((unint64_t)-[NSMutableOrderedSet count](self->_uploadIDs, "count") < 2)
  {
    id v9 = -[MediaSocialErrorCoordinator _newSingleErrorDialogWithUpload:](self, "_newSingleErrorDialogWithUpload:", v4);
  }

  else
  {
    id v9 = -[MediaSocialErrorCoordinator _newPluralErrorDialogWithUploadCount:]( self,  "_newPluralErrorDialogWithUploadCount:",  -[NSMutableOrderedSet count](self->_uploadIDs, "count"));
  }

  id v10 = v9;
  if (v9) {
    -[MediaSocialErrorCoordinator _showDialog:](self, "_showDialog:", v9);
  }

  return v10 != 0LL;
}

- (BOOL)addDialogForUploadIdentifiers:(id)a3
{
  id v4 = a3;
  BOOL v5 = (char *)-[NSMutableOrderedSet count](self->_postIDs, "count");
  v6 = &v5[(void)-[NSMutableOrderedSet count](self->_uploadIDs, "count")];
  if ((char *)[v4 count] + (unint64_t)v6 < (char *)2)
  {
    BOOL v11 = 0;
  }

  else
  {
    uploadIDs = self->_uploadIDs;
    if (!uploadIDs)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
      id v9 = self->_uploadIDs;
      self->_uploadIDs = v8;

      uploadIDs = self->_uploadIDs;
    }

    -[NSMutableOrderedSet addObjectsFromArray:](uploadIDs, "addObjectsFromArray:", v4);
    if (-[NSMutableOrderedSet count](self->_postIDs, "count")) {
      id v10 = -[MediaSocialErrorCoordinator _newPluralErrorDialogWithPostCount:uploadCount:]( self,  "_newPluralErrorDialogWithPostCount:uploadCount:",  -[NSMutableOrderedSet count](self->_postIDs, "count"),  -[NSMutableOrderedSet count](self->_uploadIDs, "count"));
    }
    else {
      id v10 = -[MediaSocialErrorCoordinator _newPluralErrorDialogWithUploadCount:]( self,  "_newPluralErrorDialogWithUploadCount:",  -[NSMutableOrderedSet count](self->_uploadIDs, "count"));
    }
    v12 = v10;
    BOOL v11 = v10 != 0LL;
    if (v10) {
      -[MediaSocialErrorCoordinator _showDialog:](self, "_showDialog:", v10);
    }
  }

  return v11;
}

- (void)dismissAllDialogs
{
  if (self->_notification)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UserNotificationCenter defaultCenter](&OBJC_CLASS___UserNotificationCenter, "defaultCenter"));
    [v3 cancelUserNotification:self->_notification];

    id notification = self->_notification;
    self->_id notification = 0LL;
  }

  postIDs = self->_postIDs;
  self->_postIDs = 0LL;

  temporaryPostIDs = self->_temporaryPostIDs;
  self->_temporaryPostIDs = 0LL;

  temporaryUploadIDs = self->_temporaryUploadIDs;
  self->_temporaryUploadIDs = 0LL;

  uploadIDs = self->_uploadIDs;
  self->_uploadIDs = 0LL;
}

- (NSArray)postIdentifiers
{
  temporaryPostIDs = self->_temporaryPostIDs;
  if (temporaryPostIDs) {
    return (NSArray *)-[NSArray copy](temporaryPostIDs, "copy");
  }
  else {
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_postIDs, "array"));
  }
}

- (NSArray)uploadIdentifiers
{
  temporaryUploadIDs = self->_temporaryUploadIDs;
  if (temporaryUploadIDs) {
    return (NSArray *)-[NSArray copy](temporaryUploadIDs, "copy");
  }
  else {
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_uploadIDs, "array"));
  }
}

- (id)_newPluralErrorDialogWithCount:(int64_t)a3 formatString:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  @"com.apple.Music"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.storeservices"));
    if (v7)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___ISDialog);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_10035EB18 table:@"MediaSocial"]);
      v18[0] = v9;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_10035EB18 table:@"MediaSocial"]);
      v18[1] = v10;
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
      -[ISDialog setButtonsWithTitles:](v8, "setButtonsWithTitles:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedShortName]);
      -[ISDialog setTitle:](v8, "setTitle:", v12);

      v13 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setNumberStyle:](v13, "setNumberStyle:", 1LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v13, "stringFromNumber:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v5,  @"%@",  0LL,  v15));
      -[ISDialog setMessage:](v8, "setMessage:", v16);
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_newPluralErrorDialogWithPostCount:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.storeservices"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_MESSAGE_FORMAT_PLURAL_%@" value:&stru_10035EB18 table:@"MediaSocial"]);
    id v8 = -[MediaSocialErrorCoordinator _newPluralErrorDialogWithCount:formatString:]( self,  "_newPluralErrorDialogWithCount:formatString:",  a3,  v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_newPluralErrorDialogWithPostCount:(int64_t)a3 uploadCount:(int64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  @"com.apple.Music"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.storeservices"));
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = 0LL;
  }

  else
  {
    BOOL v11 = @"MEDIA_SOCIAL_COMBINED_ERROR_%@_POST_%@_UPLOADS";
    if (a4 == 1) {
      BOOL v11 = @"MEDIA_SOCIAL_COMBINED_ERROR_%@_POST_%@_UPLOAD";
    }
    v12 = @"MEDIA_SOCIAL_COMBINED_ERROR_%@_POSTS_%@_UPLOAD";
    if (a4 != 1) {
      v12 = @"MEDIA_SOCIAL_COMBINED_ERROR_%@_POSTS_%@_UPLOADS";
    }
    if (a3 == 1) {
      v13 = v11;
    }
    else {
      v13 = v12;
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v13 value:&stru_10035EB18 table:@"MediaSocial"]);
    v15 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    -[NSNumberFormatter setNumberStyle:](v15, "setNumberStyle:", 1LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v15, "stringFromNumber:", v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v15, "stringFromNumber:", v18));

    id v10 = objc_alloc_init(&OBJC_CLASS___ISDialog);
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_10035EB18 table:@"MediaSocial"]);
    v26[0] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_10035EB18 table:@"MediaSocial"]);
    v26[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
    -[ISDialog setButtonsWithTitles:](v10, "setButtonsWithTitles:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v14,  @"%@%@",  0LL,  v17,  v19));
    -[ISDialog setMessage:](v10, "setMessage:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedShortName]);
    -[ISDialog setTitle:](v10, "setTitle:", v24);
  }

  return v10;
}

- (id)_newPluralErrorDialogWithUploadCount:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.storeservices"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"UPLOAD_ERROR_MESSAGE_FORMAT_PLURAL_%@" value:&stru_10035EB18 table:@"MediaSocial"]);
    id v8 = -[MediaSocialErrorCoordinator _newPluralErrorDialogWithCount:formatString:]( self,  "_newPluralErrorDialogWithCount:formatString:",  a3,  v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_newSingleErrorDialogWithPost:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  @"com.apple.Music"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForProperty:@"message"]);

  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7 = 0LL;
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.storeservices"));
    BOOL v9 = (void *)v8;
    if (v8)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___ISDialog);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_10035EB18 table:@"MediaSocial"]);
      v24[0] = v10;
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_10035EB18 table:@"MediaSocial"]);
      v24[1] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
      -[ISDialog setButtonsWithTitles:](v7, "setButtonsWithTitles:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedShortName]);
      -[ISDialog setTitle:](v7, "setTitle:", v13);

      id v14 = [v5 length];
      if ((unint64_t)v14 >= 0x29)
      {
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v5 substringToIndex:40]);

        id v5 = (void *)v15;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByCharactersInSet:v16]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 componentsJoinedByString:@" "]);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByTrimmingCharactersInSet:v19]);

      if ((unint64_t)v14 >= 0x29)
      {
        uint64_t v20 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"…"]);

        id v5 = (void *)v20;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_MESSAGE_FORMAT_%@" value:&stru_10035EB18 table:@"MediaSocial"]);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v21, v5));
      -[ISDialog setMessage:](v7, "setMessage:", v22);
    }

    else
    {
      v7 = 0LL;
    }
  }

  return v7;
}

- (id)_newSingleErrorDialogWithUpload:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.storeservices"));
  if (!v4)
  {
    id v5 = 0LL;
    goto LABEL_20;
  }

  v18[0] = @"title";
  v18[1] = @"uti";
  __int128 v17 = 0uLL;
  [v3 getValues:&v17 forProperties:v18 count:2];
  id v5 = 0LL;
  if (v17 != 0)
  {
    if ((void)v17)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"UPLOAD_ERROR_MESSAGE_FORMAT_%@" value:&stru_10035EB18 table:@"MediaSocial"]);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, (void)v17));

      if (!v7)
      {
LABEL_15:
        id v5 = 0LL;
        goto LABEL_18;
      }
    }

    else
    {
      switch(SSVMediaSocialAttachmentTypeForTypeIdentifier())
      {
        case 1LL:
          uint64_t v8 = @"UPLOAD_ERROR_MESSAGE_AUDIO";
          break;
        case 2LL:
          uint64_t v8 = @"UPLOAD_ERROR_MESSAGE_IMAGE";
          break;
        case 3LL:
          uint64_t v8 = @"UPLOAD_ERROR_MESSAGE_SOUND_BITE";
          break;
        case 4LL:
          uint64_t v8 = @"UPLOAD_ERROR_MESSAGE_VIDEO";
          break;
        default:
          goto LABEL_15;
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v8 value:&stru_10035EB18 table:@"MediaSocial"]);
      if (!v7) {
        goto LABEL_15;
      }
    }

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  @"com.apple.Music"));
    if (v9)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___ISDialog);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_10035EB18 table:@"MediaSocial"]);
      v16[0] = v10;
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_10035EB18 table:@"MediaSocial"]);
      v16[1] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
      -[ISDialog setButtonsWithTitles:](v5, "setButtonsWithTitles:", v12);

      -[ISDialog setMessage:](v5, "setMessage:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedShortName]);
      -[ISDialog setTitle:](v5, "setTitle:", v13);
    }

    else
    {
      id v5 = 0LL;
    }
  }

- (id)_newErrorDialogWithServerMessageWithPost:(id)a3 erroMessage:(id)a4 canRetry:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  @"com.apple.Music"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:@"message"]);

  if (v9) {
    BOOL v11 = v10 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    v12 = 0LL;
  }

  else
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.storeservices"));
    id v14 = (void *)v13;
    if (v13)
    {
      v12 = objc_alloc_init(&OBJC_CLASS___ISDialog);
      if (v5)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_TRY_LATER" value:&stru_10035EB18 table:@"MediaSocial"]);
        v30[0] = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_DELETE" value:&stru_10035EB18 table:@"MediaSocial"]);
        v30[1] = v16;
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
        -[ISDialog setButtonsWithTitles:](v12, "setButtonsWithTitles:", v17);
      }

      else
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_BUTTON_OK" value:&stru_10035EB18 table:@"MediaSocial"]);
        v29 = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
        -[ISDialog setButtonsWithTitles:](v12, "setButtonsWithTitles:", v16);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedShortName]);
      -[ISDialog setTitle:](v12, "setTitle:", v18);

      id v19 = [v10 length];
      if ((unint64_t)v19 >= 0x29)
      {
        uint64_t v20 = objc_claimAutoreleasedReturnValue([v10 substringToIndex:40]);

        id v10 = (void *)v20;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByCharactersInSet:v21]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 componentsJoinedByString:@" "]);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v23 stringByTrimmingCharactersInSet:v24]);

      if ((unint64_t)v19 >= 0x29)
      {
        uint64_t v25 = objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:@"…"]);

        id v10 = (void *)v25;
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"MEDIA_SOCIAL_ERROR_MESSAGE_FORMAT_%@_DUE_TO_ERROR_%@" value:&stru_10035EB18 table:@"MediaSocial"]);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v26, v10, v7));
      -[ISDialog setMessage:](v12, "setMessage:", v27);
    }

    else
    {
      v12 = 0LL;
    }
  }

  return v12;
}

- (void)_sendDidFinishWithResponseFlags:(unint64_t)a3
{
  BOOL v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_postIDs, "array"));
  temporaryPostIDs = self->_temporaryPostIDs;
  self->_temporaryPostIDs = v5;

  id v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_uploadIDs, "array"));
  temporaryUploadIDs = self->_temporaryUploadIDs;
  self->_temporaryUploadIDs = v7;

  postIDs = self->_postIDs;
  self->_postIDs = 0LL;

  uploadIDs = self->_uploadIDs;
  self->_uploadIDs = 0LL;

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[MediaSocialErrorCoordinator delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v13, "mediaSocialErrorCoordinator:didFinishWithResult:") & 1) != 0) {
    [v13 mediaSocialErrorCoordinator:self didFinishWithResult:a3 != 0];
  }
  BOOL v11 = self->_temporaryPostIDs;
  self->_temporaryPostIDs = 0LL;

  v12 = self->_temporaryUploadIDs;
  self->_temporaryUploadIDs = 0LL;
}

- (void)_showDialog:(id)a3
{
  id notification = self->_notification;
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[UserNotificationCenter defaultCenter](&OBJC_CLASS___UserNotificationCenter, "defaultCenter"));
  id v9 = v6;
  if (notification)
  {
    [v6 updateUserNotification:self->_notification withDialog:v5];
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000D91A0;
    v10[3] = &unk_10034C948;
    v10[4] = self;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 showDialog:v5 withCompletionBlock:v10]);

    id v8 = self->_notification;
    self->_id notification = v7;
  }

- (MediaSocialErrorDelegate)delegate
{
  return (MediaSocialErrorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end