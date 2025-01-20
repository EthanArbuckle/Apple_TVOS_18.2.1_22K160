@interface AUAOutputStream
- (void)startStream;
- (void)stopStream;
@end

@implementation AUAOutputStream

- (void)startStream
{
}

- (void)stopStream
{
  v2 = self;
  sub_10008CA8C( (uint64_t)&OBJC_IVAR___AUAStream_signpostID,  "AUAOuputStream_stop",  (uint64_t (*)(uint64_t))sub_10008CC30);
}

- (void).cxx_destruct
{
}

@end