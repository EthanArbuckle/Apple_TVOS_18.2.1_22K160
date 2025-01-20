@interface TVSettingsAudioQualityItemInfo
- (NSString)moreInfo;
- (NSString)subtitle;
- (NSString)title;
- (TVSettingsAudioQualityItemInfo)initWithAudioQuality:(int64_t)a3 title:(id)a4 subtitle:(id)a5 moreInfo:(id)a6;
- (int64_t)audioQuality;
@end

@implementation TVSettingsAudioQualityItemInfo

- (TVSettingsAudioQualityItemInfo)initWithAudioQuality:(int64_t)a3 title:(id)a4 subtitle:(id)a5 moreInfo:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVSettingsAudioQualityItemInfo;
  v14 = -[TVSettingsAudioQualityItemInfo init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_audioQuality = a3;
    objc_storeStrong((id *)&v14->_title, a4);
    objc_storeStrong((id *)&v15->_subtitle, a5);
    objc_storeStrong((id *)&v15->_moreInfo, a6);
  }

  return v15;
}

- (int64_t)audioQuality
{
  return self->_audioQuality;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)subtitle
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)moreInfo
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end