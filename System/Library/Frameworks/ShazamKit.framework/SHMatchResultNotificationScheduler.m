@interface SHMatchResultNotificationScheduler
+ (UNUserNotificationCenter)userNotificationCenter;
+ (void)setUserNotificationCenter:(id)a3;
- (BOOL)canSendNotificationForMatch:(id)a3;
- (BOOL)canSendNotificationForNoMatchSignatureID:(id)a3;
- (NSUUID)currentSignatureID;
- (SHAttribution)attribution;
- (SHMatchResultNotificationContentDeliverer)contentDeliverer;
- (SHMatchResultNotificationScheduler)initWithAttribution:(id)a3;
- (SHMatchedMediaItem)currentMediaItem;
- (void)sendAnalyticsEventForMatch:(id)a3;
- (void)sendMatchNotification:(id)a3 completionHandler:(id)a4;
- (void)sendNotificationForMatch:(id)a3 completionHandler:(id)a4;
- (void)sendNotificationForNoMatchWithCompletionHandler:(id)a3;
- (void)sendNotificationForResponse:(id)a3 completionHandler:(id)a4;
- (void)setCurrentMediaItem:(id)a3;
- (void)setCurrentSignatureID:(id)a3;
@end

@implementation SHMatchResultNotificationScheduler

+ (void)setUserNotificationCenter:(id)a3
{
}

+ (UNUserNotificationCenter)userNotificationCenter
{
  return (UNUserNotificationCenter *)(id)qword_100088968;
}

- (SHMatchResultNotificationScheduler)initWithAttribution:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHMatchResultNotificationScheduler;
  v6 = -[SHMatchResultNotificationScheduler init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attribution, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___SHMatchResultBulletinContentDeliverer);
    contentDeliverer = v7->_contentDeliverer;
    v7->_contentDeliverer = (SHMatchResultNotificationContentDeliverer *)v8;
  }

  return v7;
}

- (BOOL)canSendNotificationForMatch:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultNotificationScheduler currentMediaItem](self, "currentMediaItem"));
    if ([v4 containsMediaItemWithFuzzyTolerance:v5])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultNotificationScheduler currentSignatureID](self, "currentSignatureID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 querySignature]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _ID]);
      unsigned int v9 = [v6 isEqual:v8] ^ 1;
    }

    else
    {
      LOBYTE(v9) = 1;
    }
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)sendNotificationForMatch:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItems]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  -[SHMatchResultNotificationScheduler setCurrentMediaItem:](self, "setCurrentMediaItem:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 querySignature]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _ID]);
  -[SHMatchResultNotificationScheduler setCurrentSignatureID:](self, "setCurrentSignatureID:", v11);

  -[SHMatchResultNotificationScheduler sendAnalyticsEventForMatch:](self, "sendAnalyticsEventForMatch:", v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SHMatchResultNotificationScheduler currentMediaItem](self, "currentMediaItem"));
  -[SHMatchResultNotificationScheduler sendMatchNotification:completionHandler:]( self,  "sendMatchNotification:completionHandler:",  v12,  v6);
}

- (BOOL)canSendNotificationForNoMatchSignatureID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultNotificationScheduler currentSignatureID](self, "currentSignatureID"));
  unsigned __int8 v6 = [v5 isEqual:v4];

  return v6 ^ 1;
}

- (void)sendNotificationForNoMatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sh_log_object(v4);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Sending no match notification", v8, 2u);
  }

  -[SHMatchResultNotificationScheduler sendAnalyticsEventForMatch:](self, "sendAnalyticsEventForMatch:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultNotificationScheduler contentDeliverer](self, "contentDeliverer"));
  [v7 deliverContentForNoMatchWithCompletion:v4];
}

- (void)sendAnalyticsEventForMatch:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultNotificationScheduler attribution](self, "attribution"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  [v10 setValue:v6 forKey:SHAnalyticsPayloadSourceKey];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3 != 0LL));
  [v10 setObject:v7 forKey:SHAnalyticsPayloadMatchKey];

  uint64_t v8 = SHAnalyticsEventMusicRecognitionResult;
  id v9 = [v10 copy];
  +[SHAnalytics sendEvent:withPayload:](&OBJC_CLASS___SHAnalytics, "sendEvent:withPayload:", v8, v9);
}

- (void)sendNotificationForResponse:(id)a3 completionHandler:(id)a4
{
  id v14 = a3;
  unsigned __int8 v6 = (void (**)(void))a4;
  id v7 = [v14 result];
  if (v7 == (id)1)
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v14 match]);
    unsigned int v12 = -[SHMatchResultNotificationScheduler canSendNotificationForMatch:](self, "canSendNotificationForMatch:", v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v14 match]);
      -[SHMatchResultNotificationScheduler sendNotificationForMatch:completionHandler:]( self,  "sendNotificationForMatch:completionHandler:",  v13,  v6);

      goto LABEL_9;
    }

    goto LABEL_8;
  }

  if (v7 == (id)2 || v7 == (id)3)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v14 signature]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _ID]);
    unsigned int v10 = -[SHMatchResultNotificationScheduler canSendNotificationForNoMatchSignatureID:]( self,  "canSendNotificationForNoMatchSignatureID:",  v9);

    if (v10)
    {
      -[SHMatchResultNotificationScheduler sendNotificationForNoMatchWithCompletionHandler:]( self,  "sendNotificationForNoMatchWithCompletionHandler:",  v6);
      goto LABEL_9;
    }

- (void)sendMatchNotification:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = sh_log_object(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Sending match notification", v11, 2u);
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHMatchResultNotificationScheduler contentDeliverer](self, "contentDeliverer"));
  [v10 deliverContentForMatchedMediaItem:v7 completion:v6];
}

- (SHMatchedMediaItem)currentMediaItem
{
  return self->_currentMediaItem;
}

- (void)setCurrentMediaItem:(id)a3
{
}

- (NSUUID)currentSignatureID
{
  return self->_currentSignatureID;
}

- (void)setCurrentSignatureID:(id)a3
{
}

- (SHAttribution)attribution
{
  return self->_attribution;
}

- (SHMatchResultNotificationContentDeliverer)contentDeliverer
{
  return self->_contentDeliverer;
}

- (void).cxx_destruct
{
}

@end