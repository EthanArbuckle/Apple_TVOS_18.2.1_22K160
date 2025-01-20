@interface AbortWaitLock
- (AbortWaitLock)init;
- (BOOL)increment;
- (id).cxx_construct;
- (void)decrement;
- (void)wait;
@end

@implementation AbortWaitLock

- (AbortWaitLock)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AbortWaitLock;
  result = -[AbortWaitLock init](&v4, "init");
  *((_BYTE *)result + 128) = 0;
  int v3 = ++gNextDbgID;
  *((_DWORD *)result + 30) = 0;
  *((_DWORD *)result + 31) = v3;
  return result;
}

- (void)wait
{
  v3.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 8);
  v3.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)self + 8));
  *((_BYTE *)self + 128) = 1;
  if (!*((_DWORD *)self + 30)) {
    goto LABEL_4;
  }
  do
    std::condition_variable::wait((std::condition_variable *)((char *)self + 72), &v3);
  while (*((_DWORD *)self + 30));
  if (v3.__owns_) {
LABEL_4:
  }
    std::mutex::unlock(v3.__m_);
}

- (BOOL)increment
{
  std::unique_lock<std::mutex> v3 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  int v4 = *((unsigned __int8 *)self + 128);
  if (!*((_BYTE *)self + 128)) {
    ++*((_DWORD *)self + 30);
  }
  BOOL v5 = v4 == 0;
  std::mutex::unlock(v3);
  return v5;
}

- (void)decrement
{
  std::unique_lock<std::mutex> v3 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  int v4 = *((_DWORD *)self + 30) - 1;
  *((_DWORD *)self + 30) = v4;
  if (!v4) {
    std::condition_variable::notify_one((std::condition_variable *)((char *)self + 72));
  }
  std::mutex::unlock(v3);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 850045863LL;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0LL;
  *((void *)self + 9) = 1018212795LL;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((void *)self + 14) = 0LL;
  return self;
}

@end