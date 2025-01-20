void sub_2980(id a1)
{
  uint64_t v1;
  void *v2;
  v1 = objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", 1LL));
  v2 = (void *)qword_8808;
  qword_8808 = v1;
}
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}