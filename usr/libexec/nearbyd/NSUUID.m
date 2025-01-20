@interface NSUUID
- (vector<unsigned)_niServerBytesVector;
@end

@implementation NSUUID

- (vector<unsigned)_niServerBytesVector
{
  retstr->__begin_ = 0LL;
  retstr->__end_ = 0LL;
  retstr->__end_cap_.__value_ = 0LL;
  sub_1000353EC((unint64_t *)retstr, 0x10uLL);
  return (vector<unsigned char, std::allocator<unsigned char>> *)-[NSUUID getUUIDBytes:]( self,  "getUUIDBytes:",  retstr->__begin_);
}

@end