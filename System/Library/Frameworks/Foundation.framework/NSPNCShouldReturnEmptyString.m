@interface NSPNCShouldReturnEmptyString
@end

@implementation NSPNCShouldReturnEmptyString

uint64_t ____NSPNCShouldReturnEmptyString_block_invoke()
{
  byte_18C496421 = 1;
  uint64_t result = dyld_program_sdk_at_least();
  byte_18C496421 = result;
  return result;
}

@end