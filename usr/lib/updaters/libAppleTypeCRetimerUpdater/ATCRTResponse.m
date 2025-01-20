@interface ATCRTResponse
- (ATCRTResponse)init;
- (ATCRTResponse)initWithFourCharacterCode:(unsigned int)a3 byte0:(unsigned __int8)a4 resultDescriptionFunction:(void *)a5;
- (BOOL)success;
- (id)description;
- (unsigned)code;
- (unsigned)result;
@end

@implementation ATCRTResponse

- (ATCRTResponse)init
{
  return 0LL;
}

- (ATCRTResponse)initWithFourCharacterCode:(unsigned int)a3 byte0:(unsigned __int8)a4 resultDescriptionFunction:(void *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ATCRTResponse;
  result = -[ATCRTResponse init](&v9, sel_init);
  if (result)
  {
    result->_code = a3;
    result->_result = a4 & 0xF;
    result->_resultDescFunc = a5;
  }

  return result;
}

- (BOOL)success
{
  return self->_result == 0;
}

- (id)description
{
  v3 = (void *)NSString;
  stringForFourCharCode(self->_code);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"ATCRT Response: %@\n\tResult: %s (%u)\n", v4, ((uint64_t (*)(void))self->_resultDescFunc)(self->_result), self->_result];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)code
{
  return self->_code;
}

- (unsigned)result
{
  return self->_result;
}

@end