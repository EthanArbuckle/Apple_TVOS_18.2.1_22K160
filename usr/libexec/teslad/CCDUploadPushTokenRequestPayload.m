@interface CCDUploadPushTokenRequestPayload
- (NSData)pushToken;
- (NSString)pushTopic;
- (id)action;
- (id)dictionary;
- (void)setPushToken:(id)a3;
- (void)setPushTopic:(id)a3;
@end

@implementation CCDUploadPushTokenRequestPayload

- (id)dictionary
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CCDUploadPushTokenRequestPayload;
  v3 = -[CCDRequestPayload dictionary](&v17, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"device"]);
  id v7 = [v6 mutableCopy];
  v9 = v7;
  if (v7) {
    id v10 = v7;
  }
  else {
    id v10 = (id)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v8);
  }
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CCDUploadPushTokenRequestPayload pushToken](self, "pushToken"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 base64EncodedStringWithOptions:0]);
  [v11 setObject:v13 forKeyedSubscript:@"app_push_token"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CCDUploadPushTokenRequestPayload pushTopic](self, "pushTopic"));
  [v11 setObject:v14 forKeyedSubscript:@"push_topic"];

  [v5 setObject:v11 forKeyedSubscript:@"device"];
  id v15 = [v5 copy];

  return v15;
}

- (id)action
{
  return @"DeviceRegistration";
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end