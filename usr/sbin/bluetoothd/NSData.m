@interface NSData
- (id)sha256;
@end

@implementation NSData

- (id)sha256
{
  v2 = self;
  v3 = CC_SHA256( -[NSData bytes](v2, "bytes", 0LL, 0LL, 0LL, 0LL),  (CC_LONG)-[NSData length](v2, "length"),  (unsigned __int8 *)v5);
  if (v3) {
    v3 = [NSData dataWithBytes:v5 length:32LL];
  }
  return v3;
}

@end