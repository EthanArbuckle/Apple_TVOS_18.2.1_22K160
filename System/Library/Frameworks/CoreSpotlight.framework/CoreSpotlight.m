}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  v1 = objc_alloc_init(&OBJC_CLASS___MDSIndexer);
  v2 = (void *)qword_100008B78;
  qword_100008B78 = (uint64_t)v1;

  uint64_t v3 = qword_100008B78;
  objc_autoreleasePoolPop(v0);
  if (v3) {
    dispatch_main();
  }
  return 1LL;
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}