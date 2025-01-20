@interface LSDatabaseDisplayHeader
@end

@implementation LSDatabaseDisplayHeader

uint64_t ___LSDatabaseDisplayHeader_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 12))
  {
    uint64_t result = CSStoreGetUnit();
    if (!result) {
      return CSStore2::AttributedStringWriter::withWarningColors();
    }
  }

  return result;
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_2(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"ERROR",  @"*** Container V%08lu has invalid alias reference A%08lu",  *(unsigned int *)(a1 + 48),  *(unsigned int *)(*(void *)(a1 + 40) + 12LL));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_3()
{
  if (!CSStoreGetUnit()) {
    CSStore2::AttributedStringWriter::withWarningColors();
  }
  uint64_t result = CSStoreGetUnit();
  if (!result) {
    return CSStore2::AttributedStringWriter::withWarningColors();
  }
  return result;
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_4(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"ERROR",  @"*** Bundle B%08lu has invalid alias reference A%08lu",  *(unsigned int *)(a1 + 48),  **(unsigned int **)(a1 + 40));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_5(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"ERROR",  @"*** Bundle B%08lu has invalid container reference V%08lu",  *(unsigned int *)(a1 + 48),  *(unsigned int *)(*(void *)(a1 + 40) + 4LL));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_6()
{
  uint64_t result = CSStoreGetUnit();
  if (!result) {
    return CSStore2::AttributedStringWriter::withWarningColors();
  }
  return result;
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_7(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"ERROR",  @"*** Claim C%08lu has invalid bundle reference B%08lu",  *(unsigned int *)(a1 + 48),  *(unsigned int *)(*(void *)(a1 + 40) + 16LL));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_8(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"Seeding is in progress.");
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_9(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"Database is seeded.");
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_10(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"Database seeding is incomplete.");
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_11(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"CacheGUID",  @"NOT FOUND!");
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_12(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"CacheSequenceNum",  @"NOT FOUND!");
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_13(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string( *(CSStore2::AttributedStringWriter **)(a1 + 32),  @"Path",  @"NOT FOUND!");
}

@end