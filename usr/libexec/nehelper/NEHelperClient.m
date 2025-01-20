@interface NEHelperClient
- (unint64_t)hash;
@end

@implementation NEHelperClient

- (unint64_t)hash
{
  return self->_hash;
}

- (void).cxx_destruct
{
}

@end