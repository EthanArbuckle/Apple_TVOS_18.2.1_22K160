@interface CFNProcessIsApplication
@end

@implementation CFNProcessIsApplication

uint64_t ____CFNProcessIsApplication_block_invoke(double a1)
{
  uint64_t result = objc_opt_class();
  if (result) {
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 728), "currentProcess"), "isApplication");
  }
  __CFNProcessIsApplication::uint64_t result = result;
  return result;
}

@end