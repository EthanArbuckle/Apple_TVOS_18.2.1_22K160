@interface TITransientLexiconManagerMock
+ (id)getEntries:(_LXLexicon *)a3;
+ (id)tokenizeEntity:(id)a3;
- (BOOL)isSupplementalLexiconSearchEnabled;
- (BOOL)searchForWord:(id)a3;
- (BOOL)searchForWordCaseInsensitive:(id)a3;
- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5;
- (NSArray)observers;
- (TITransientLexiconManagerMock)init;
- (TITransientLexiconManagerMock)initWithTransientData:(id)a3 namedEntities:(id)a4;
- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3;
- (_LXLexicon)appNameLexiconForLocale:(const char *)a3;
- (_LXLexicon)namedEntityLexicon;
- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3;
- (_LXLexicon)namedEntityPhraseLexicon;
- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3;
- (id)addContactObserver:(id)a3;
- (id)ensureSupplementalLexicons;
- (id)supplementalLexicons;
- (int)acceptedCount;
- (int)offeredCount;
- (void)addEntry:(id)a3 toLexicon:(_LXLexicon *)a4;
- (void)dealloc;
- (void)debugLogEntities;
- (void)getOnce:(id)a3;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)removeContactObserver:(id)a3;
- (void)setAcceptedCount:(int)a3;
- (void)setNewContactCollection:(id)a3;
- (void)setOfferedCount:(int)a3;
- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3;
@end

@implementation TITransientLexiconManagerMock

- (TITransientLexiconManagerMock)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TITransientLexiconManagerMock;
  v2 = -[TITransientLexiconManagerMock init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_namedEntityLexiconRef = 0LL;
    v2->_namedEntityPhraseLexiconRef = 0LL;
    v4 = operator new(0x28uLL);
    _OWORD *v4 = 0u;
    v4[1] = 0u;
    *((_DWORD *)v4 + 8) = 1065353216;
    v3->_addressBookLexicons = v4;
    v5 = operator new(0x28uLL);
    _OWORD *v5 = 0u;
    v5[1] = 0u;
    *((_DWORD *)v5 + 8) = 1065353216;
    v3->_appNameLexicons = v5;
    v3->_supplementalLexiconSearchEnabled = 1;
    v6 = v3;
  }

  return v3;
}

- (void)addEntry:(id)a3 toLexicon:(_LXLexicon *)a4
{
  id v5 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  v6 = off_AA358;
  v14 = off_AA358;
  if (!off_AA358)
  {
    v7 = (void *)sub_28F2C();
    v6 = dlsym(v7, "LXLexiconAdd");
    v12[3] = (uint64_t)v6;
    off_AA358 = v6;
  }

  _Block_object_dispose(&v11, 8);
  if (!v6) {
    goto LABEL_8;
  }
  ((void (*)(_LXLexicon *, id, void))v6)(a4, v5, 0LL);
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  objc_super v8 = off_AA368;
  v14 = off_AA368;
  if (!off_AA368)
  {
    v9 = (void *)sub_28F2C();
    objc_super v8 = dlsym(v9, "LXLexiconIncrementUsageCount");
    v12[3] = (uint64_t)v8;
    off_AA368 = v8;
  }

  _Block_object_dispose(&v11, 8);
  if (v8)
  {
    ((void (*)(_LXLexicon *, id, uint64_t))v8)(a4, v5, 1LL);
  }

  else
  {
LABEL_8:
    v10 = dlerror();
    abort_report_np("%s", v10);
    __break(1u);
  }

+ (id)tokenizeEntity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@" "]);

  id v6 = [v5 length];
  id v7 = [v5 length];
  __chkstk_darwin();
  id v16 = [v5 length];
  objc_msgSend( v5,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  (char *)&v14[-1] - ((4 * (void)v6 + 15) & 0xFFFFFFFFFFFFFFF0),  4 * (void)v6,  &v16,  4,  0,  0,  v7,  0);
  CFLocaleRef v8 = CFLocaleCreate(0LL, @"en_US");
  uint64_t v9 = LMStreamTokenizerCreate(v8, 134217984LL);
  id v10 = v16;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_274E0;
  v14[3] = &unk_89220;
  id v11 = v4;
  id v15 = v11;
  LMStreamTokenizerPushBytes(v9, (char *)&v14[-1] - ((4LL * (void)v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), v10, v14);
  LMStreamTokenizerRelease(v9);
  CFRelease(v8);

  return v11;
}

- (TITransientLexiconManagerMock)initWithTransientData:(id)a3 namedEntities:(id)a4
{
  id v29 = a3;
  id v30 = a4;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___TITransientLexiconManagerMock;
  id v7 = -[TITransientLexiconManagerMock init](&v42, "init");
  CFLocaleRef v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contactCollection, a3);
    Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v10 = sub_27A70();
    CFDictionaryAddValue(Mutable, v10, @"InputContext-NamedEntityWords");
    id v11 = sub_27B04();
    CFDictionaryAddValue(Mutable, v11, @"en_US");
    CFTypeRef cf = 0LL;
    v8->_namedEntityLexiconRef = (_LXLexicon *)sub_27B98((uint64_t)Mutable, (uint64_t)&cf);
    CFRelease(Mutable);
    if (cf)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[TITransientLexiconManagerMock initWithTransientData:namedEntities:]";
        __int16 v47 = 2112;
        CFTypeRef v48 = cf;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Error: Unable to create transient mutable lexicon for named entities: %@",  buf,  0x16u);
      }

      CFRelease(cf);
    }

    v12 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v13 = sub_27A70();
    CFDictionaryAddValue(v12, v13, @"InputContext-NamedEntityPhrases");
    id v14 = sub_27B04();
    CFDictionaryAddValue(v12, v14, @"en_US");
    CFTypeRef v40 = 0LL;
    v8->_namedEntityPhraseLexiconRef = (_LXLexicon *)sub_27B98((uint64_t)v12, (uint64_t)&v40);
    CFRelease(v12);
    if (v40)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[TITransientLexiconManagerMock initWithTransientData:namedEntities:]";
        __int16 v47 = 2112;
        CFTypeRef v48 = v40;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Error: Unable to create transient mutable lexicon for named entity phrases: %@",  buf,  0x16u);
      }

      CFRelease(v40);
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id obj = v30;
    id v15 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[TITransientLexiconManagerMock tokenizeEntity:]( &OBJC_CLASS___TITransientLexiconManagerMock,  "tokenizeEntity:",  v18));
          if ((unint64_t)[v19 count] >= 2) {
            -[TITransientLexiconManagerMock addEntry:toLexicon:]( v8,  "addEntry:toLexicon:",  v18,  v8->_namedEntityPhraseLexiconRef);
          }
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          id v20 = v19;
          id v21 = [v20 countByEnumeratingWithState:&v32 objects:v43 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v33;
            do
            {
              for (j = 0LL; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v33 != v22) {
                  objc_enumerationMutation(v20);
                }
                -[TITransientLexiconManagerMock addEntry:toLexicon:]( v8,  "addEntry:toLexicon:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)j),  v8->_namedEntityLexiconRef);
              }

              id v21 = [v20 countByEnumeratingWithState:&v32 objects:v43 count:16];
            }

            while (v21);
          }
        }

        id v15 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v15);
    }

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    observers = v8->_observers;
    v8->_observers = v24;

    v26 = operator new(0x28uLL);
    _OWORD *v26 = 0u;
    v26[1] = 0u;
    *((_DWORD *)v26 + 8) = 1065353216;
    v8->_addressBookLexicons = v26;
    v27 = operator new(0x28uLL);
    _OWORD *v27 = 0u;
    v27[1] = 0u;
    *((_DWORD *)v27 + 8) = 1065353216;
    v8->_appNameLexicons = v27;
  }

  return v8;
}

- (void)dealloc
{
  namedEntityPhraseLexiconRef = self->_namedEntityPhraseLexiconRef;
  if (namedEntityPhraseLexiconRef) {
    CFRelease(namedEntityPhraseLexiconRef);
  }
  namedEntityLexiconRef = self->_namedEntityLexiconRef;
  if (namedEntityLexiconRef) {
    CFRelease(namedEntityLexiconRef);
  }
  addressBookLexicons = self->_addressBookLexicons;
  if (addressBookLexicons)
  {
    id v6 = (void *)sub_28FDC((uint64_t)addressBookLexicons);
    operator delete(v6);
  }

  appNameLexicons = self->_appNameLexicons;
  if (appNameLexicons)
  {
    CFLocaleRef v8 = (void *)sub_28FDC((uint64_t)appNameLexicons);
    operator delete(v8);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TITransientLexiconManagerMock;
  -[TITransientLexiconManagerMock dealloc](&v9, "dealloc");
}

- (id)addContactObserver:(id)a3
{
  id v4 = [a3 copy];
  id v5 = self;
  objc_sync_enter(v5);
  observers = v5->_observers;
  id v7 = objc_retainBlock(v4);
  -[NSMutableArray addObject:](observers, "addObject:", v7);

  objc_sync_exit(v5);
  (*((void (**)(id, NSDictionary *))v4 + 2))(v4, v5->_contactCollection);
  id v8 = objc_retainBlock(v4);

  return v8;
}

- (void)setNewContactCollection:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_contactCollection, a3);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = self->_observers;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9) + 16LL))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)removeContactObserver:(id)a3
{
  id obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  observers = obj->_observers;
  id v6 = objc_retainBlock(v4);

  -[NSMutableArray removeObjectIdenticalTo:](observers, "removeObjectIdenticalTo:", v6);
  objc_sync_exit(obj);
}

- (void)getOnce:(id)a3
{
}

- (NSArray)observers
{
  return (NSArray *)self->_observers;
}

- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_28108;
  v13[3] = &unk_89248;
  BOOL v14 = a5;
  v13[4] = &v15;
  v13[5] = a4;
  id v7 = v13;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v8 = off_AA388;
  uint64_t v22 = off_AA388;
  if (!off_AA388)
  {
    objc_super v9 = (void *)sub_28F2C();
    uint64_t v8 = dlsym(v9, "LXLexiconEnumerateEntriesForString");
    v20[3] = (uint64_t)v8;
    off_AA388 = v8;
  }

  _Block_object_dispose(&v19, 8);
  if (v8)
  {
    ((void (*)(_LXLexicon *, __CFString *, void *))v8)(a3, a4, v7);

    BOOL v10 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
    return v10;
  }

  __int128 v12 = dlerror();
  BOOL result = abort_report_np("%s", v12);
  __break(1u);
  return result;
}

- (BOOL)searchForWord:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = -[TITransientLexiconManagerMock searchHelper:forWord:caseSensitive:]( self,  "searchHelper:forWord:caseSensitive:",  -[TITransientLexiconManagerMock namedEntityLexicon](self, "namedEntityLexicon"),  v4,  1LL);

  return (char)self;
}

- (BOOL)searchForWordCaseInsensitive:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = -[TITransientLexiconManagerMock searchHelper:forWord:caseSensitive:]( self,  "searchHelper:forWord:caseSensitive:",  -[TITransientLexiconManagerMock namedEntityLexicon](self, "namedEntityLexicon"),  v4,  0LL);

  return (char)self;
}

- (_LXLexicon)namedEntityLexicon
{
  return self->_namedEntityLexiconRef;
}

- (_LXLexicon)namedEntityPhraseLexicon
{
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3
{
  return self->_namedEntityLexiconRef;
}

- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3
{
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3
{
  if (!sub_29064((void *)self->_addressBookLexicons, &v41, v4))
  {
    id v6 = v42;
    if (!v42) {
      id v6 = (const char *)&v43;
    }
    if ((_WORD)v41) {
      id v7 = v6;
    }
    else {
      id v7 = "";
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    uint64_t v9 = UIKeyboardStaticUnigramsFile();
    BOOL v10 = (KB *)objc_claimAutoreleasedReturnValue(v9);
    KB::utf8_string(v40, v10, v11);

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[TIInputMode inputModeWithIdentifier:](&OBJC_CLASS___TIInputMode, "inputModeWithIdentifier:", v8));
    uint64_t v13 = UIKeyboardDeltaLexiconPathForInputMode();
    BOOL v14 = (KB *)objc_claimAutoreleasedReturnValue(v13);
    KB::utf8_string(v39, v14, v15);

    KB::String::String((KB::String *)v38, (const KB::String *)&v41);
    KB::String::String((KB::String *)v37, (const KB::String *)v40);
    KB::String::String((KB::String *)v36, (const KB::String *)v39);
    KB::AddressBookTrieLoader::create(&v31, v38, v37, v36);
    KB::String::~String((KB::String *)v36);
    KB::String::~String((KB::String *)v37);
    KB::String::~String((KB::String *)v38);
    addressBookLexicons = self->_addressBookLexicons;
    KB::String::String((KB::String *)v33, (const KB::String *)&v41);
    uint64_t v34 = v31;
    __int128 v35 = v32;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        unint64_t v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }

    sub_291D0((uint64_t)addressBookLexicons, v33, v33);
    uint64_t v19 = v35;
    if (v35)
    {
      id v20 = (unint64_t *)&v35->__shared_owners_;
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    KB::String::~String((KB::String *)v33);
    uint64_t v22 = v32;
    if (v32)
    {
      v23 = (unint64_t *)&v32->__shared_owners_;
      do
        unint64_t v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }

    KB::String::~String((KB::String *)v39);
    KB::String::~String((KB::String *)v40);
  }

  v25 = sub_29064((void *)self->_addressBookLexicons, &v41, v5);
  if (!v25) {
    abort();
  }
  (*(void (**)(__n128 *__return_ptr))(*(void *)v25[6] + 16LL))(v33);
  v26 = (std::__shared_weak_count *)v33[0].n128_u64[1];
  v27 = *(_LXLexicon **)v33[0].n128_u64[0];
  if (v33[0].n128_u64[1])
  {
    v28 = (unint64_t *)(v33[0].n128_u64[1] + 8);
    do
      unint64_t v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }

  KB::String::~String((KB::String *)&v41);
  return v27;
}

- (_LXLexicon)appNameLexiconForLocale:(const char *)a3
{
  if (!sub_29064((void *)self->_appNameLexicons, &v41, v4))
  {
    id v6 = v42;
    if (!v42) {
      id v6 = (const char *)&v43;
    }
    if ((_WORD)v41) {
      id v7 = v6;
    }
    else {
      id v7 = "";
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    uint64_t v9 = UIKeyboardStaticUnigramsFile();
    BOOL v10 = (KB *)objc_claimAutoreleasedReturnValue(v9);
    KB::utf8_string(v40, v10, v11);

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[TIInputMode inputModeWithIdentifier:](&OBJC_CLASS___TIInputMode, "inputModeWithIdentifier:", v8));
    uint64_t v13 = UIKeyboardDeltaLexiconPathForInputMode();
    BOOL v14 = (KB *)objc_claimAutoreleasedReturnValue(v13);
    KB::utf8_string(v39, v14, v15);

    KB::String::String((KB::String *)v38, (const KB::String *)&v41);
    KB::String::String((KB::String *)v37, (const KB::String *)v40);
    KB::String::String((KB::String *)v36, (const KB::String *)v39);
    KB::AppTrieLoader::create(&v31, v38, v37, v36);
    KB::String::~String((KB::String *)v36);
    KB::String::~String((KB::String *)v37);
    KB::String::~String((KB::String *)v38);
    appNameLexicons = self->_appNameLexicons;
    KB::String::String((KB::String *)v33, (const KB::String *)&v41);
    uint64_t v34 = v31;
    __int128 v35 = v32;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        unint64_t v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }

    sub_29778((uint64_t)appNameLexicons, v33, v33);
    uint64_t v19 = v35;
    if (v35)
    {
      id v20 = (unint64_t *)&v35->__shared_owners_;
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    KB::String::~String((KB::String *)v33);
    uint64_t v22 = v32;
    if (v32)
    {
      v23 = (unint64_t *)&v32->__shared_owners_;
      do
        unint64_t v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }

    KB::String::~String((KB::String *)v39);
    KB::String::~String((KB::String *)v40);
  }

  v25 = sub_29064((void *)self->_appNameLexicons, &v41, v5);
  if (!v25) {
    abort();
  }
  (*(void (**)(__n128 *__return_ptr))(*(void *)v25[6] + 16LL))(v33);
  v26 = (std::__shared_weak_count *)v33[0].n128_u64[1];
  v27 = *(_LXLexicon **)v33[0].n128_u64[0];
  if (v33[0].n128_u64[1])
  {
    v28 = (unint64_t *)(v33[0].n128_u64[1] + 8);
    do
      unint64_t v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }

  KB::String::~String((KB::String *)&v41);
  return v27;
}

- (id)ensureSupplementalLexicons
{
  return 0LL;
}

- (id)supplementalLexicons
{
  return 0LL;
}

+ (id)getEntries:(_LXLexicon *)a3
{
  return +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3);
}

- (void)debugLogEntities
{
  if (self->_namedEntityLexiconRef)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[TITransientLexiconManagerMock getEntries:](&OBJC_CLASS___TITransientLexiconManagerMock, "getEntries:"));
    if ([v5 count])
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:@"|"]);
      NSLog(@"Named entities %@", v3);
    }

    else
    {
      NSLog(@"Named entities empty");
    }
  }

  if (self->_namedEntityPhraseLexiconRef)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[TITransientLexiconManagerMock getEntries:](&OBJC_CLASS___TITransientLexiconManagerMock, "getEntries:"));
    if ([v6 count])
    {
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@"|"]);
      NSLog(@"Named phrase entities %@", v4);
    }

    else
    {
      NSLog(@"Named phrase entities empty");
    }
  }

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  if (a4 == 3)
  {
    uint64_t v5 = 60LL;
  }

  else
  {
    if (a4 != 1) {
      return;
    }
    uint64_t v5 = 64LL;
  }

  ++*(_DWORD *)((char *)&self->super.isa + v5);
}

- (int)offeredCount
{
  return self->_offeredCount;
}

- (void)setOfferedCount:(int)a3
{
  self->_offeredCount = a3;
}

- (int)acceptedCount
{
  return self->_acceptedCount;
}

- (void)setAcceptedCount:(int)a3
{
  self->_acceptedCount = a3;
}

- (BOOL)isSupplementalLexiconSearchEnabled
{
  return self->_supplementalLexiconSearchEnabled;
}

- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3
{
  self->_supplementalLexiconSearchEnabled = a3;
}

- (void).cxx_destruct
{
}

@end