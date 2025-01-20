@interface LSDisplayData
@end

@implementation LSDisplayData

uint64_t ___LSDisplayData_block_invoke(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format( (CSStore2::AttributedStringWriter *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL),  0LL,  @"Failed to display Launch Services data: %@",  *(void *)(a1 + 32));
}

@end