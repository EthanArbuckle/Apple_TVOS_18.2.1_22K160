@interface LSDefaultsHasServer
@end

@implementation LSDefaultsHasServer

const char *___LSDefaultsHasServer_block_invoke()
{
  result = getenv("LS_NO_SERVER");
  return result;
}

@end