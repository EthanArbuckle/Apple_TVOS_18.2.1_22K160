id VSBaseLocalizedString(uint64_t a1, uint64_t a2)
{
  NSBundle *v4;
  uint64_t v5;
  void *v6;
  NSDictionary *v7;
  id v8;
  v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___VSBaseCancelResultHandler));
  v5 = VSRecognitionModelCopyResourceURL(v4, a1, @"strings");
  if (v5
    && (v6 = (void *)v5,
        v7 = -[NSDictionary initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfURL:",  v5),  v8 = -[NSDictionary objectForKey:](v7, "objectForKey:", a2),  v7,  v6,  v8))
  {
    return v8;
  }

  else
  {
    return -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", a2, &stru_41D8, a1);
  }
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}