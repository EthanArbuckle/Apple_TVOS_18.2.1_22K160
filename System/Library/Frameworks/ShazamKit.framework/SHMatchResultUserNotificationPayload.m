@interface SHMatchResultUserNotificationPayload
+ (id)notificationFromLegacyUserInfoFormat:(id)a3;
+ (id)payloadFromNotificationContentUserInfo:(id)a3;
+ (id)userInfoPayloadForMediaItem:(id)a3 bundleIdentifier:(id)a4;
- (NSString)bundleIdentifier;
- (SHMediaItem)mediaItem;
- (void)setBundleIdentifier:(id)a3;
- (void)setMediaItem:(id)a3;
@end

@implementation SHMatchResultUserNotificationPayload

+ (id)payloadFromNotificationContentUserInfo:(id)a3
{
  id v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"com.apple.ShazamNotifications.user-info.payload"]);
  if (v6)
  {
    id v20 = 0LL;
    v7 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v6,  &v20);
    id v8 = v20;
    v10 = v8;
    if (v7)
    {
      id v11 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v7,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___SHMediaItem, v9),  @"com.apple.ShazamNotifications.user-info.media-item");
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      id v14 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v7,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NSString, v13),  @"com.apple.ShazamNotifications.user-info.attribution");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_alloc_init(&OBJC_CLASS___SHMatchResultUserNotificationPayload);
      -[SHMatchResultUserNotificationPayload setMediaItem:](v16, "setMediaItem:", v12);
      -[SHMatchResultUserNotificationPayload setBundleIdentifier:](v16, "setBundleIdentifier:", v15);
    }

    else
    {
      uint64_t v18 = sh_log_object(v8);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v6;
        __int16 v23 = 2112;
        v24 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unable to unarchive notification payload data %@ with error %@",  buf,  0x16u);
      }

      v16 = 0LL;
    }
  }

  else
  {
    id v17 = objc_msgSend((id)objc_opt_class(a1, v5), "notificationFromLegacyUserInfoFormat:", v4);
    v16 = (SHMatchResultUserNotificationPayload *)objc_claimAutoreleasedReturnValue(v17);
  }

  return v16;
}

+ (id)userInfoPayloadForMediaItem:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:]( v7,  "encodeObject:forKey:",  v6,  @"com.apple.ShazamNotifications.user-info.media-item");

  -[NSKeyedArchiver encodeObject:forKey:]( v7,  "encodeObject:forKey:",  v5,  @"com.apple.ShazamNotifications.user-info.attribution");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v7, "encodedData"));
  id v11 = @"com.apple.ShazamNotifications.user-info.payload";
  v12 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

  return v9;
}

+ (id)notificationFromLegacyUserInfoFormat:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 objectForKeyedSubscript:@"com.apple.ShazamNotifications.user-info.apple-music"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  v7 = 0LL;
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0 && v4)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      v7 = objc_alloc_init(&OBJC_CLASS___SHMatchResultUserNotificationPayload);
      v10 = (void *)objc_claimAutoreleasedReturnValue( [v3 objectForKeyedSubscript:@"com.apple.ShazamNotifications.user-info.attribution"]);
      -[SHMatchResultUserNotificationPayload setBundleIdentifier:](v7, "setBundleIdentifier:", v10);

      SHMediaItemProperty v14 = SHMediaItemAppleMusicURL;
      v15 = v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaItem mediaItemWithProperties:]( &OBJC_CLASS___SHMediaItem,  "mediaItemWithProperties:",  v11));
      -[SHMatchResultUserNotificationPayload setMediaItem:](v7, "setMediaItem:", v12);
    }

    else
    {
      v7 = 0LL;
    }
  }

  return v7;
}

- (SHMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end