@interface THCredentialsServerLogHandleForCategory
@end

@implementation THCredentialsServerLogHandleForCategory

void __THCredentialsServerLogHandleForCategory_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.thread", "unspecified");
  v2 = (void *)THCredentialsServerLogHandleForCategory_logHandles[0];
  THCredentialsServerLogHandleForCategory_logHandles[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.thread", "store");
  v4 = (void *)qword_100464DA0;
  qword_100464DA0 = (uint64_t)v3;
}

@end