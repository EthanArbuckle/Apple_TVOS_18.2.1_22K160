@interface SASSpeechPacket
- (id)description;
@end

@implementation SASSpeechPacket

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechPacket packets](self, "packets"));
  id v5 = [v4 count];
  id v6 = -[SASSpeechPacket packetNumber](self, "packetNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechPacket aceId](self, "aceId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechPacket refId](self, "refId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@ count:%tu total:%ld\n  aceId: %@\n  refId: %@]",  v3,  v5,  v6,  v7,  v8));

  return v9;
}

@end