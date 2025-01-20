@interface NSDocumentDeserializer
- (id)deserializeNewData;
- (id)deserializeNewPList;
- (void)fixupDirInfo:(id)a3;
@end

@implementation NSDocumentDeserializer

- (id)deserializeNewData
{
  return -[NSAKDeserializer deserializeData:]( self,  "deserializeData:",  +[NSData allocWithZone:]( &OBJC_CLASS___NSPageData,  "allocWithZone:",  -[NSDocumentDeserializer zone](self, "zone")));
}

- (void)fixupDirInfo:(id)a3
{
  uint64_t v4 = -[NSDocumentDeserializer zone](self, "zone");
  v5 = (void *)[a3 objectForKey:@"."];
  if (v5)
  {
    id v8 = (id)[v5 deserializer];
    id v6 = -[NSAKDeserializer initForDeserializerStream:]( +[NSDirInfoDeserializer allocWithZone:](&OBJC_CLASS___NSDirInfoDeserializer, "allocWithZone:", v4),  "initForDeserializerStream:",  v8);
    v7 = (void *)objc_msgSend( v6,  "deserializePList:",  +[NSDirInfo allocWithZone:](NSDirInfo, "allocWithZone:", v4));
    [a3 setObject:v7 forKey:@"."];
  }

- (id)deserializeNewPList
{
  id v3 = -[NSAKDeserializer deserializePList:]( self,  "deserializePList:",  +[NSRTFD allocWithZone:](&OBJC_CLASS___NSRTFD, "allocWithZone:", -[NSDocumentDeserializer zone](self, "zone")));
  -[NSDocumentDeserializer fixupDirInfo:](self, "fixupDirInfo:", v3);
  return v3;
}

@end