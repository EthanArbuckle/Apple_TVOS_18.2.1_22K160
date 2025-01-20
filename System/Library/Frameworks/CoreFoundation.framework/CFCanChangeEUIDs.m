@interface CFCanChangeEUIDs
@end

@implementation CFCanChangeEUIDs

uint64_t ___CFCanChangeEUIDs_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uid_t v0 = geteuid();
  uid_t v1 = getuid();
  *(void *)v8 = 0xE00000001LL;
  int v9 = 1;
  pid_t v10 = getpid();
  size_t v7 = 648LL;
  uint64_t result = sysctl(v8, 4u, v11, &v7, 0LL, 0LL);
  int v3 = v12;
  if ((_DWORD)result) {
    int v3 = -1;
  }
  if (v1) {
    BOOL v4 = v1 == v0;
  }
  else {
    BOOL v4 = 0;
  }
  char v6 = !v4 || v3 != v0;
  if ((_DWORD)result) {
    char v6 = 1;
  }
  _CFCanChangeEUIDs_canChangeEUIDs = v6;
  return result;
}

@end