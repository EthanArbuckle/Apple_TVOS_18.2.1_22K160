@interface HIDEventService(HIDContinuousRecording)
- (void)deviceUsagePairs;
@end

@implementation HIDEventService(HIDContinuousRecording)

- (void)deviceUsagePairs
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "No device usage pairs", v1, 2u);
}

- (void)enableContinuousRecordingHIDElement:()HIDContinuousRecording .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)enableContinuousRecordingHIDElement:()HIDContinuousRecording .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end