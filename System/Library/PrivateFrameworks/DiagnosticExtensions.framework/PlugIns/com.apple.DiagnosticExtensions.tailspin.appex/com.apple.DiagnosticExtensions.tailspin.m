id sub_10000384C()
{
  if (qword_100008198 != -1) {
    dispatch_once(&qword_100008198, &stru_1000041B0);
  }
  return (id)qword_100008190;
}

void sub_10000388C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tailspin", "library");
  v2 = (void *)qword_100008190;
  qword_100008190 = (uint64_t)v1;

  id v3 = (id)qword_100008190;
  if (!v3) {
    sub_100003954();
  }
}

uint64_t sub_1000038D8( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = snprintf(byte_1000081A0, 0x400uLL, "%d ", a1);
  qword_100008158 = (uint64_t)byte_1000081A0;
  return result;
}

void sub_100003954()
{
  uint64_t v0 = _os_assert_log(0LL);
  uint64_t v1 = _os_crash(v0);
  __break(1u);
  NSExtensionMain(v1);
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}