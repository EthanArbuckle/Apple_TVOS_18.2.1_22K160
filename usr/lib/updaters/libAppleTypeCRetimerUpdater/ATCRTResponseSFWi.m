@interface ATCRTResponseSFWi
- (ATCRTResponseSFWi)initWithByte0:(unsigned __int8)a3;
@end

@implementation ATCRTResponseSFWi

- (ATCRTResponseSFWi)initWithByte0:(unsigned __int8)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ATCRTResponseSFWi;
  return -[ATCRTResponse initWithFourCharacterCode:byte0:resultDescriptionFunction:]( &v4,  sel_initWithFourCharacterCode_byte0_resultDescriptionFunction_,  1397118825LL,  a3,  stringForATCRTTaskSFWiResult);
}

@end