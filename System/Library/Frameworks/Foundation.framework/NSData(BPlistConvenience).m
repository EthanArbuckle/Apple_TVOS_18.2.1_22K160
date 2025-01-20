@interface NSData(BPlistConvenience)
- (uint64_t)_getBPlistMarker:()BPlistConvenience offset:trailer:;
@end

@implementation NSData(BPlistConvenience)

- (uint64_t)_getBPlistMarker:()BPlistConvenience offset:trailer:
{
  return __CFBinaryPlistGetTopLevelInfo();
}

@end