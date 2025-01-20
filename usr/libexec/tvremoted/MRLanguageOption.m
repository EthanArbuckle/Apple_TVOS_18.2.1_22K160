@interface MRLanguageOption
- (BOOL)_hasMediaCharacteristic:(id)a3;
- (BOOL)containsOnlyForcedSubtitles;
- (BOOL)isAuxiliaryContent;
@end

@implementation MRLanguageOption

- (BOOL)containsOnlyForcedSubtitles
{
  return -[MRLanguageOption _hasMediaCharacteristic:]( self,  "_hasMediaCharacteristic:",  AVMediaCharacteristicContainsOnlyForcedSubtitles);
}

- (BOOL)isAuxiliaryContent
{
  return -[MRLanguageOption _hasMediaCharacteristic:]( self,  "_hasMediaCharacteristic:",  AVMediaCharacteristicIsAuxiliaryContent);
}

- (BOOL)_hasMediaCharacteristic:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRLanguageOption characteristics](self, "characteristics"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

@end