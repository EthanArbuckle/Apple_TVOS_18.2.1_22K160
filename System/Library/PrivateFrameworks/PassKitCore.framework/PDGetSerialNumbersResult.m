@interface PDGetSerialNumbersResult
- (NSArray)serialNumbers;
- (NSString)lastUpdatedTag;
- (void)setLastUpdatedTag:(id)a3;
- (void)setSerialNumbers:(id)a3;
@end

@implementation PDGetSerialNumbersResult

- (NSArray)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end