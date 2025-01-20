@interface LiblouisEmojiPrintPreprocessor
- (LiblouisEmojiPrintPreprocessor)init;
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 typeformData:(id)a5;
- (void)_setupLocale;
- (void)dealloc;
@end

@implementation LiblouisEmojiPrintPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 typeformData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v25 = v9;
    v10 = (char *)[v8 length];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    if (a4) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 0LL));
    }
    else {
      v12 = 0LL;
    }
    uint64_t v32 = 0LL;
    v33 = &v32;
    uint64_t v34 = 0x2020000000LL;
    uint64_t v35 = 0LL;
    id v14 = [v8 length];
    locale = self->_locale;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_3564;
    v26[3] = &unk_202F8;
    v31 = &v32;
    id v16 = v8;
    id v27 = v16;
    id v17 = v11;
    id v28 = v17;
    id v18 = v12;
    id v29 = v18;
    id v30 = v25;
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock(v16, 0LL, v14, locale, v26);
    v19 = (char *)v33[3];
    if (v10 > v19)
    {
      id v20 = v17;
      id v21 = v18;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", v19, v10 - v19));
      [v20 appendString:v22];

      while (v10 != v19)
      {
        v36 = v19;
        [v21 appendBytes:&v36 length:8];
        ++v19;
      }
    }

    if (a4) {
      *a4 = v18;
    }
    v23 = v30;
    id v13 = v17;

    _Block_object_dispose(&v32, 8);
    id v9 = v25;
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (LiblouisEmojiPrintPreprocessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LiblouisEmojiPrintPreprocessor;
  v2 = -[LiblouisEmojiPrintPreprocessor init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[LiblouisEmojiPrintPreprocessor _setupLocale](v2, "_setupLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"_setupLocale" name:kCFLocaleCurrentLocaleDidChangeNotification object:0];
  }

  return v3;
}

- (void)_setupLocale
{
  v3 = CFLocaleCopyCurrent();
  locale = self->_locale;
  if (locale)
  {
    CFRelease(locale);
    self->_locale = 0LL;
  }

  CFTypeRef Value = CFLocaleGetValue(v3, kCFLocaleLanguageCode);
  self->_locale = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData(Value);
  if (v3) {
    CFRelease(v3);
  }
}

- (void)dealloc
{
  locale = self->_locale;
  if (locale) {
    CFRelease(locale);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LiblouisEmojiPrintPreprocessor;
  -[LiblouisEmojiPrintPreprocessor dealloc](&v4, "dealloc");
}

@end