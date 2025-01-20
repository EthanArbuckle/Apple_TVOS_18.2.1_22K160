@interface AttachmentDownloadRestriction
+ (id)noSpaceForHighQualityLimit:(unint64_t)a3 qualityType:(unint64_t)a4 isSticker:(BOOL)a5 lqmEnabled:(BOOL)a6;
+ (id)noSpaceForLowQualityLimit:(unint64_t)a3 qualityType:(unint64_t)a4 isSticker:(BOOL)a5 lqmEnabled:(BOOL)a6;
+ (id)restrictionAllowedBySettingWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5;
+ (id)restrictionDisallowedBySettingWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5;
+ (id)restrictionForceAllowedWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5;
+ (id)restrictionWithLimitType:(unint64_t)a3 limitSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 allowDownload:(BOOL)a7 lqmEnabled:(BOOL)a8;
- (AttachmentDownloadRestriction)initWithLimitType:(unint64_t)a3 limitSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 allowDownload:(BOOL)a7 lqmEnabled:(BOOL)a8;
- (BOOL)allowDownload;
- (BOOL)isSticker;
- (BOOL)lqmEnabled;
- (unint64_t)limitSize;
- (unint64_t)limitType;
- (unint64_t)qualityType;
- (void)collectMetricsForDownloadedFile:(id)a3;
- (void)collectMetricsForLimitExceededWithReportedSize:(id)a3;
@end

@implementation AttachmentDownloadRestriction

+ (id)restrictionAllowedBySettingWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5
{
  return  -[AttachmentDownloadRestriction initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:]( objc_alloc(&OBJC_CLASS___AttachmentDownloadRestriction),  "initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:",  6LL,  0LL,  a3,  a4,  1LL,  a5);
}

+ (id)restrictionDisallowedBySettingWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5
{
  return  -[AttachmentDownloadRestriction initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:]( objc_alloc(&OBJC_CLASS___AttachmentDownloadRestriction),  "initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:",  6LL,  0LL,  a3,  a4,  0LL,  a5);
}

+ (id)restrictionForceAllowedWithQualityType:(unint64_t)a3 isSticker:(BOOL)a4 lqmEnabled:(BOOL)a5
{
  return  -[AttachmentDownloadRestriction initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:]( objc_alloc(&OBJC_CLASS___AttachmentDownloadRestriction),  "initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:",  5LL,  0LL,  a3,  a4,  1LL,  a5);
}

+ (id)noSpaceForLowQualityLimit:(unint64_t)a3 qualityType:(unint64_t)a4 isSticker:(BOOL)a5 lqmEnabled:(BOOL)a6
{
  return  -[AttachmentDownloadRestriction initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:]( objc_alloc(&OBJC_CLASS___AttachmentDownloadRestriction),  "initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:",  4LL,  a3,  a4,  a5,  0LL,  a6);
}

+ (id)noSpaceForHighQualityLimit:(unint64_t)a3 qualityType:(unint64_t)a4 isSticker:(BOOL)a5 lqmEnabled:(BOOL)a6
{
  return  -[AttachmentDownloadRestriction initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:]( objc_alloc(&OBJC_CLASS___AttachmentDownloadRestriction),  "initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:",  3LL,  a3,  a4,  a5,  0LL,  a6);
}

+ (id)restrictionWithLimitType:(unint64_t)a3 limitSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 allowDownload:(BOOL)a7 lqmEnabled:(BOOL)a8
{
  return  -[AttachmentDownloadRestriction initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:]( objc_alloc(&OBJC_CLASS___AttachmentDownloadRestriction),  "initWithLimitType:limitSize:qualityType:isSticker:allowDownload:lqmEnabled:",  a3,  a4,  a5,  a6,  a7,  a8);
}

- (void)collectMetricsForDownloadedFile:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"));
  unint64_t v5 = -[AttachmentDownloadRestriction limitType](self, "limitType");
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[AttachmentDownloadRestriction limitSize](self, "limitSize")));
  objc_msgSend( v7,  "trackAttachmentDownloadSuccess:limitType:limitSize:qualityType:isSticker:lowQualityModeEnabled:",  v4,  v5,  v6,  -[AttachmentDownloadRestriction qualityType](self, "qualityType"),  -[AttachmentDownloadRestriction isSticker](self, "isSticker"),  -[AttachmentDownloadRestriction lqmEnabled](self, "lqmEnabled"));
}

- (void)collectMetricsForLimitExceededWithReportedSize:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"));
  unint64_t v5 = -[AttachmentDownloadRestriction limitType](self, "limitType");
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[AttachmentDownloadRestriction limitSize](self, "limitSize")));
  objc_msgSend( v7,  "trackAttachmentDownloadLimitExceeded:limitSize:fileSize:qualityType:isSticker:lowQualityModeEnabled:",  v5,  v6,  v4,  -[AttachmentDownloadRestriction qualityType](self, "qualityType"),  -[AttachmentDownloadRestriction isSticker](self, "isSticker"),  -[AttachmentDownloadRestriction lqmEnabled](self, "lqmEnabled"));
}

- (AttachmentDownloadRestriction)initWithLimitType:(unint64_t)a3 limitSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 allowDownload:(BOOL)a7 lqmEnabled:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AttachmentDownloadRestriction;
  result = -[AttachmentDownloadRestriction init](&v15, "init");
  if (result)
  {
    result->_qualityType = a5;
    result->_limitSize = a4;
    result->_limitType = a3;
    result->_isSticker = a6;
    result->_allowDownload = a7;
    result->_lqmEnabled = a8;
  }

  return result;
}

- (unint64_t)limitType
{
  return self->_limitType;
}

- (unint64_t)qualityType
{
  return self->_qualityType;
}

- (unint64_t)limitSize
{
  return self->_limitSize;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (BOOL)allowDownload
{
  return self->_allowDownload;
}

- (BOOL)lqmEnabled
{
  return self->_lqmEnabled;
}

@end