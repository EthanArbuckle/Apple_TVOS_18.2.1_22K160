uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  v4 = objc_autoreleasePoolPush();
  if (a1 < 2) {
    v5 = 0LL;
  }
  else {
    v5 = *(void *)(a2 + 8);
  }
  v6 = isatty(2) != 0;
  v7 = isatty(1) == 0;
  _LSDisplayData(__stdoutp, v5, 0LL, 0LL, 0LL, 0LL, v7 | (4 * v6), 0LL);
  objc_autoreleasePoolPop(v4);
  return 0LL;
}