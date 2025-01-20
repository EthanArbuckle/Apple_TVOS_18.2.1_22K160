@interface MTPlayerManifest
- (BOOL)networkUPPEnabled;
- (BOOL)userActivityContainsPlayhead;
- (MTPlayerManifest)init;
- (NSString)manifestIdentifier;
- (id)activity;
- (id)activitySpotlightIdentifier;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)playReason;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)setManifestIdentifier:(id)a3;
- (void)setNetworkUPPEnabled:(BOOL)a3;
- (void)setPlayReason:(unint64_t)a3;
@end

@implementation MTPlayerManifest

- (MTPlayerManifest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTPlayerManifest;
  v2 = -[MTPlayerManifest init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
    -[MTPlayerManifest setManifestIdentifier:](v2, "setManifestIdentifier:", v4);
  }

  return v2;
}

- (id)activity
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTPlayerManifest;
  id v3 = -[MTPlayerManifest activity](&v8, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 setEligibleForHandoff:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest currentItem](self, "currentItem"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 episodeShareUrl]);
  [v4 setWebpageURL:v6];

  return v4;
}

- (id)activitySpotlightIdentifier
{
  return 0LL;
}

- (BOOL)userActivityContainsPlayhead
{
  return 0;
}

- (void)setNetworkUPPEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = _MTLogCategoryPlayback(self, a2);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"Disabled";
    if (v3) {
      v7 = @"Enabled";
    }
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Network UPP %@ for manifest %@",  (uint8_t *)&v8,  0x16u);
  }

  self->_networkUPPEnabled = v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTPlayerManifest;
  id v3 = -[MTPlayerManifest objectAtIndex:](&v5, "objectAtIndex:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, _BYTE *))a3;
  if (v4 && -[MTPlayerManifest count](self, "count"))
  {
    unint64_t v5 = 0LL;
    do
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest objectAtIndex:](self, "objectAtIndex:", v5));
      unsigned __int8 v8 = 0;
      v4[2](v4, v6, &v8);
      int v7 = v8;

      if (v7) {
        break;
      }
      ++v5;
    }

    while ((unint64_t)-[MTPlayerManifest count](self, "count") > v5);
  }
}

- (id)metricsContentIdentifier
{
  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (id)metricsAdditionalData
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MTPlayerManifest count](self, "count")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"count");

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest title](self, "title"));
  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest title](self, "title"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"title");
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest manifestIdentifier](self, "manifestIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"manifest_id");

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreReportingController reportingStringForPlayReason:]( &OBJC_CLASS___MTStoreReportingController,  "reportingStringForPlayReason:",  -[MTPlayerManifest playReason](self, "playReason")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"manifest_source");

  return v3;
}

- (unint64_t)playReason
{
  return self->_playReason;
}

- (void)setPlayReason:(unint64_t)a3
{
  self->_playReason = a3;
}

- (BOOL)networkUPPEnabled
{
  return self->_networkUPPEnabled;
}

- (NSString)manifestIdentifier
{
  return self->_manifestIdentifier;
}

- (void)setManifestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end