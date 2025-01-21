@interface BKHIDHapticFeedbackInterface
- (void)playHapticFeedbackRequest:(id)a3;
@end

@implementation BKHIDHapticFeedbackInterface

- (void)playHapticFeedbackRequest:(id)a3
{
  id v3 = a3;
  id v4 = sub_10003F3DC();
  v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "playHapticFeedbackRequest: pretending to play %{public}@ in the simulator",  (uint8_t *)&v6,  0xCu);
  }
}

@end