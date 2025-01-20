@interface IOHIDLogCategory
@end

@implementation IOHIDLogCategory

os_log_t ___IOHIDLogCategory_block_invoke()
{
  _IOHIDLogCategory_log[0] = (uint64_t)os_log_create("com.apple.iohid", "default");
  qword_18C448200 = (uint64_t)os_log_create("com.apple.iohid", "trace");
  qword_18C448208 = (uint64_t)os_log_create("com.apple.iohid", "property");
  qword_18C448210 = (uint64_t)os_log_create("com.apple.iohid", "activity");
  qword_18C448218 = (uint64_t)os_log_create("com.apple.iohid", "fastpath");
  qword_18C448220 = (uint64_t)os_log_create("com.apple.iohid", "userdevice");
  qword_18C448228 = (uint64_t)os_log_create("com.apple.iohid", "service");
  qword_18C448230 = (uint64_t)os_log_create("com.apple.iohid", "serviceplugin");
  qword_18C448238 = (uint64_t)os_log_create("com.apple.iohid", "service.carplay");
  qword_18C448240 = (uint64_t)os_log_create("com.apple.iohid", "connection");
  qword_18C448248 = (uint64_t)os_log_create("com.apple.iohid", "cursor");
  qword_18C448250 = (uint64_t)os_log_create("com.apple.iohid", "hidsignpost");
  qword_18C448258 = (uint64_t)os_log_create("com.apple.iohid", "ups");
  qword_18C448260 = (uint64_t)os_log_create("com.apple.iohid", "client");
  os_log_t result = os_log_create("com.apple.iohid", "oversized");
  qword_18C448268 = (uint64_t)result;
  return result;
}

@end