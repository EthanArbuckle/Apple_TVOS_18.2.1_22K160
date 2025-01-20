@interface NSListFormatter
+ (NSString)localizedStringByJoiningStrings:(NSArray *)strings;
- (NSFormatter)itemFormatter;
- (NSListFormatter)init;
- (NSListFormatter)initWithLocale:(id)a3;
- (NSLocale)locale;
- (NSString)stringForObjectValue:(id)obj;
- (__CFListFormatter)_listFormatter;
- (id)_stringFromStringArray:(id)a3;
- (void)dealloc;
- (void)setItemFormatter:(NSFormatter *)itemFormatter;
- (void)setLocale:(NSLocale *)locale;
@end

@implementation NSListFormatter

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  listFormatter = self->_listFormatter;
  if (listFormatter) {
    CFRelease(listFormatter);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSListFormatter;
  -[NSListFormatter dealloc](&v4, sel_dealloc);
}

- (NSListFormatter)init
{
  return -[NSListFormatter initWithLocale:]( self,  "initWithLocale:",  [MEMORY[0x189603F90] autoupdatingCurrentLocale]);
}

- (NSListFormatter)initWithLocale:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSListFormatter;
  objc_super v4 = -[NSListFormatter init](&v6, sel_init);
  if (v4) {
    v4->_locale = (NSLocale *)[a3 copy];
  }
  return v4;
}

- (void)setLocale:(NSLocale *)locale
{
  v3 = self->_locale;
  if (v3 != locale)
  {
    self->_locale = (NSLocale *)-[NSLocale copy](locale, "copy");

    listFormatter = self->_listFormatter;
    if (listFormatter)
    {
      CFRelease(listFormatter);
      self->_listFormatter = 0LL;
    }
  }

- (NSLocale)locale
{
  result = self->_locale;
  if (!result)
  {
    result = (NSLocale *)objc_msgSend((id)objc_msgSend(MEMORY[0x189603F90], "autoupdatingCurrentLocale"), "copy");
    self->_locale = result;
  }

  return result;
}

- (__CFListFormatter)_listFormatter
{
  result = self->_listFormatter;
  if (!result)
  {
    -[NSListFormatter locale](self, "locale");
    result = (__CFListFormatter *)_CFListFormatterCreate();
    self->_listFormatter = result;
  }

  return result;
}

- (NSString)stringForObjectValue:(id)obj
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!obj) {
    return 0LL;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0LL;
  }
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  v14 = -[NSListFormatter locale](self, "locale");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = -[NSFormatter stringForObjectValue:](self->_itemFormatter, "stringForObjectValue:", v10);
        if (!v11
          && ((objc_opt_respondsToSelector() & 1) == 0
           || (v11 = (NSString *)[v10 descriptionWithLocale:v14]) == 0)
          && ((objc_opt_respondsToSelector() & 1) == 0
           || (v11 = (NSString *)[v10 localizedDescription]) == 0))
        {
          v11 = (NSString *)objc_msgSend(v10, "description", v11);
          if (!v11)
          {
            v12 = 0LL;
            goto LABEL_19;
          }
        }

        [v5 addObject:v11];
      }

      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v12 = -[NSListFormatter _stringFromStringArray:](self, "_stringFromStringArray:", v5);
LABEL_19:

  return v12;
}

- (id)_stringFromStringArray:(id)a3
{
  return (id)_CFListFormatterCreateStringByJoiningStrings();
}

+ (NSString)localizedStringByJoiningStrings:(NSArray *)strings
{
  objc_super v4 = -[NSListFormatter initWithLocale:]( [NSListFormatter alloc],  "initWithLocale:",  [MEMORY[0x189603F90] currentLocale]);
  id v5 = -[NSListFormatter _stringFromStringArray:](v4, "_stringFromStringArray:", strings);

  return v5;
}

- (NSFormatter)itemFormatter
{
  return (NSFormatter *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setItemFormatter:(NSFormatter *)itemFormatter
{
}

@end