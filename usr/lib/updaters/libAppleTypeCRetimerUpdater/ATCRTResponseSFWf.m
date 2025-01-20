@interface ATCRTResponseSFWf
- (ATCRTResponseSFWf)initWithOutput:(ATCRTTaskSFWfOutput *)a3;
- (id)description;
- (unsigned)bytesWritten;
@end

@implementation ATCRTResponseSFWf

- (ATCRTResponseSFWf)initWithOutput:(ATCRTTaskSFWfOutput *)a3
{
  uint64_t var0_low = LOBYTE(a3->var0);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ATCRTResponseSFWf;
  result = -[ATCRTResponse initWithFourCharacterCode:byte0:resultDescriptionFunction:]( &v6,  sel_initWithFourCharacterCode_byte0_resultDescriptionFunction_,  1397118822LL,  var0_low,  stringForATCRTTaskSFWfResult);
  if (result) {
    result->_bytesWritten = a3->var0 >> 8;
  }
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ATCRTResponseSFWf;
  v4 = -[ATCRTResponse description](&v8, sel_description);
  [v3 stringWithString:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", @"Bytes Written: %u", self->_bytesWritten);
  [NSString stringWithDescString:v5];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)bytesWritten
{
  return self->_bytesWritten;
}

@end