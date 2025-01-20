@interface GEOWiFiQualityIndex(Serialization)
- (id)typeDescription;
- (int64_t)score;
@end

@implementation GEOWiFiQualityIndex(Serialization)

- (id)typeDescription
{
  return (id)objc_msgSend(a1, "typeAsString:", objc_msgSend(a1, "type"));
}

- (int64_t)score
{
  return [a1 value];
}

@end