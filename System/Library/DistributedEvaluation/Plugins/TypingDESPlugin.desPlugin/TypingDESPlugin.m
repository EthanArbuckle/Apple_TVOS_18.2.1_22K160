uint64_t sub_3468(uint64_t a1)
{
  return a1;
}

unsigned int **TI::CP::ContinuousPathTestCase::ContinuousPathTestCase( unsigned int **a1, unsigned int **a2, uint64_t a3, const KB::String *a4, uint64_t a5, const KB::String *a6)
{
  v11 = *a2;
  *a1 = *a2;
  if (v11)
  {
    do
      unsigned int v12 = __ldaxr(v11);
    while (__stlxr(v12 + 1, v11));
  }

  sub_609C(a1 + 1, a3);
  sub_61A8(a1 + 4, a3 + 24);
  KB::String::String((KB::String *)(a1 + 7), a4);
  sub_627C((uint64_t)(a1 + 11), a5);
  KB::String::String((KB::String *)(a1 + 24), a6);
  return a1;
}

TI::CP::ContinuousPathTestResult *TI::CP::ContinuousPathTestResult::ContinuousPathTestResult( TI::CP::ContinuousPathTestResult *this, int a2, const KB::String *a3, const KB::CandidateCollection *a4, int a5, char a6)
{
  *(_DWORD *)this = a2;
  KB::String::String((TI::CP::ContinuousPathTestResult *)((char *)this + 8), a3);
  sub_6540((void *)this + 5, (uint64_t *)a4);
  *((_DWORD *)this + 36) = a5;
  *((void *)this + 24) = 0LL;
  *((void *)this + 23) = 0LL;
  *((void *)this + 22) = (char *)this + 184;
  *(int64x2_t *)((char *)this + 200) = vdupq_n_s64(0xFFF0000000000000LL);
  *((_BYTE *)this + 216) = a6;
  *(_DWORD *)((char *)this + 217) = 0;
  return this;
}

{
  *(_DWORD *)this = a2;
  KB::String::String((TI::CP::ContinuousPathTestResult *)((char *)this + 8), a3);
  sub_6540((void *)this + 5, (uint64_t *)a4);
  *((_DWORD *)this + 36) = a5;
  *((void *)this + 24) = 0LL;
  *((void *)this + 23) = 0LL;
  *((void *)this + 22) = (char *)this + 184;
  *(int64x2_t *)((char *)this + 200) = vdupq_n_s64(0xFFF0000000000000LL);
  *((_BYTE *)this + 216) = a6;
  *(_DWORD *)((char *)this + 217) = 0;
  return this;
}

void TI::CP::TestCaseConverter::create_testcase_converter( TI::CP::TestCaseConverter *this@<X0>, NSString *a2@<X1>, char **a3@<X8>)
{
  int v3 = (int)a2;
  v5 = this;
  KB::String::String((KB::String *)v24);
  KB::String::String((KB::String *)v25);
  KB::String::String((KB::String *)v26);
  KB::String::String((KB::String *)v27);
  KB::String::String((KB::String *)v28);
  uint64_t v6 = UIKeyboardStaticUnigramsFile(v5);
  v7 = (KB *)objc_claimAutoreleasedReturnValue(v6);
  KB::utf8_string(__p, v7, v8);
  KB::String::operator=(v25, __p);
  KB::String::~String((KB::String *)__p);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TIInputMode inputModeWithIdentifier:](&OBJC_CLASS___TIInputMode, "inputModeWithIdentifier:", v5));
  uint64_t v10 = UIKeyboardDeltaLexiconPathForInputMode();
  v11 = (KB *)objc_claimAutoreleasedReturnValue(v10);
  KB::utf8_string(__p, v11, v12);
  KB::String::operator=(v26, __p);
  KB::String::~String((KB::String *)__p);

  v13 = v5;
  v28[8] = TILexiconIDForLocaleIdentifier(-[TI::CP::TestCaseConverter UTF8String](v13, "UTF8String"));
  v28[10] = 1065353216;
  __createAndLoadLanguageModel(&v20, (NSString *)v13, 0LL, 0);
  v14 = (char *)operator new(0x58uLL);
  v15 = v13;
  v16 = (char *)-[TI::CP::TestCaseConverter UTF8String](v15, "UTF8String");

  sub_6D78(__p, v16);
  TI::CP::TestCaseConverter::TestCaseConverter(v14, (__int128 *)__p, &v20, v3);
  *a3 = v14;
  if (v23 < 0) {
    operator delete(__p[0]);
  }
  v17 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  KB::String::~String((KB::String *)v28);
  KB::String::~String((KB::String *)v27);
  KB::String::~String((KB::String *)v26);
  KB::String::~String((KB::String *)v25);
  KB::String::~String((KB::String *)v24);
}

char *TI::CP::TestCaseConverter::TestCaseConverter(char *__dst, __int128 *a2, void *a3, int a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_6E24(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v8 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v8;
  }

  *((void *)__dst + 3) = *a3;
  uint64_t v9 = a3[1];
  *((void *)__dst + 4) = v9;
  if (v9)
  {
    uint64_t v10 = (unint64_t *)(v9 + 8);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  *(_OWORD *)(__dst + 40) = 0u;
  unsigned int v12 = (unsigned int **)(__dst + 40);
  *((void *)__dst + 9) = 0LL;
  *(_OWORD *)(__dst + 56) = 0u;
  *((_DWORD *)__dst + 20) = 1065353216;
  if (a4)
  {
    else {
      v13 = *(void **)a2;
    }
    v14 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
    __createAndLoadDictionaryContainer(&v20, v14, 0LL);
    v15 = v20;
    uint64_t v20 = 0LL;
    v16 = *v12;
    *unsigned int v12 = v15;
    if (v16)
    {
      sub_84F0(v16);
      v17 = v20;
      if (v20) {
LABEL_13:
      }
        sub_84F0(v17);
    }
  }

  else
  {
    else {
      unint64_t v19 = *(void **)a2;
    }
    v14 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    TI::CP::createAndLoadStaticDictionaryContainer((TI::CP *)v14, &v20);
    v17 = *v12;
    *unsigned int v12 = v20;
    if (v17) {
      goto LABEL_13;
    }
  }

  return __dst;
}

void TI::CP::createAndLoadStaticDictionaryContainer(TI::CP *this@<X0>, void *a2@<X8>)
{
  v4 = this;
  KB::String::String((KB::String *)v22);
  KB::String::String((KB::String *)v23);
  KB::String::String((KB::String *)v24);
  KB::String::String((KB::String *)v25);
  KB::String::String((KB::String *)v26);
  uint64_t v5 = UIKeyboardStaticUnigramsFile(v4);
  uint64_t v6 = (KB *)objc_claimAutoreleasedReturnValue(v5);
  KB::utf8_string(v16, v6, v7);
  KB::String::operator=(v23, v16);
  KB::String::~String((KB::String *)v16);

  __int128 v8 = v4;
  id v9 = -[TI::CP UTF8String](v8, "UTF8String");

  LODWORD(v27) = TILexiconIDForLocaleIdentifier(v9);
  KB::String::String((KB::String *)v16, (const KB::String *)v22);
  KB::String::String((KB::String *)v17, (const KB::String *)v23);
  KB::String::String((KB::String *)v18, (const KB::String *)v24);
  KB::String::String((KB::String *)v19, (const KB::String *)v25);
  KB::String::String((KB::String *)v20, (const KB::String *)v26);
  v20[4] = v27;
  int v21 = v28;
  uint64_t v10 = (char *)operator new(0xB0uLL);
  unint64_t v11 = v10 + 176;
  v13[0] = v10;
  v13[2] = v10 + 176;
  sub_7BF0((uint64_t)v10, (uint64_t)v16);
  v13[1] = v11;
  KB::DictionaryContainer::create_multilexicon(&v14, v13, 1LL, 0LL);
  uint64_t v12 = v14;
  uint64_t v14 = 0LL;
  v15 = (void **)v13;
  *a2 = v12;
  sub_7C58(&v15);
  KB::String::~String((KB::String *)v20);
  KB::String::~String((KB::String *)v19);
  KB::String::~String((KB::String *)v18);
  KB::String::~String((KB::String *)v17);
  KB::String::~String((KB::String *)v16);
  KB::String::~String((KB::String *)v26);
  KB::String::~String((KB::String *)v25);
  KB::String::~String((KB::String *)v24);
  KB::String::~String((KB::String *)v23);
  KB::String::~String((KB::String *)v22);
}

void *TI::CP::TestCaseConverter::TestCaseConverter( void *__dst, __int128 *a2, void *a3, unsigned int **a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_6E24(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v7 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)__dst = v7;
  }

  uint64_t v8 = a3[1];
  __dst[3] = *a3;
  __dst[4] = v8;
  if (v8)
  {
    id v9 = (unint64_t *)(v8 + 8);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  unint64_t v11 = *a4;
  __dst[5] = *a4;
  if (v11)
  {
    do
      unsigned int v12 = __ldaxr(v11);
    while (__stlxr(v12 + 1, v11));
  }

  *((_OWORD *)__dst + 3) = 0u;
  *((_OWORD *)__dst + 4) = 0u;
  *((_DWORD *)__dst + 20) = 1065353216;
  return __dst;
}

id TI::CP::TestCaseConverter::set_layouts(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_3C80;
  v3[3] = &unk_10510;
  v3[4] = a1;
  return [a2 enumerateObjectsUsingBlock:v3];
}

void sub_3C80(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int **)(v4 + 40);
  unint64_t v11 = v5;
  if (v5)
  {
    do
      unsigned int v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
  }

  id v7 = a2;
  TI::CP::create_layout(v7, &v11);
  KB::String::String((KB::String *)v14, a3);
  v13 = v14;
  uint64_t v8 = sub_8528(v4 + 48, v14, &std::piecewise_construct, &v13);
  uint64_t v9 = v8[6];
  uint64_t v10 = v12;
  uint64_t v12 = 0LL;
  v8[6] = v10;

  if (v9) {
    sub_8204(v9);
  }
  KB::String::~String((KB::String *)v14);
  if (v12) {
    sub_8204(v12);
  }
  if (v11) {
    sub_84F0(v11);
  }
}

void *TI::CP::create_layout(void *a1, unsigned int **a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x4812000000LL;
  uint64_t v10 = sub_5328;
  unint64_t v11 = sub_5350;
  uint64_t v12 = "";
  memset(v13, 0, sizeof(v13));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768LL;
  v5[2] = sub_5358;
  v5[3] = &unk_10560;
  v2 = *a2;
  unsigned int v6 = v2;
  if (v2)
  {
    do
      unsigned int v3 = __ldaxr(v2);
    while (__stlxr(v3 + 1, v2));
  }

  v5[4] = &v7;
  [a1 enumerateKeysUsingBlock:v5];
  TI::Favonius::KeyboardLayout::create(v8 + 6);
  if (v6) {
    sub_84F0(v6);
  }
  _Block_object_dispose(&v7, 8);
  return sub_9230(v13);
}

void TI::CP::TestCaseConverter::compute_linguistic_context_and_stem( TI::CP::TestCaseConverter *this@<X0>, NSString *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x4012000000LL;
  v44 = sub_6EAC;
  v45 = (uint64_t (*)(uint64_t))nullsub_1;
  v46 = "";
  __int128 v47 = xmmword_ECA0;
  uint64_t v5 = a2;
  id v6 = -[NSString length](v5, "length");
  v54[0] = _NSConcreteStackBlock;
  v54[1] = (void **)3221225472LL;
  v54[2] = (void **)sub_6EBC;
  v54[3] = (void **)&unk_10598;
  v54[4] = (void **)&v41;
  -[NSString enumerateSubstringsInRange:options:usingBlock:]( v5,  "enumerateSubstringsInRange:options:usingBlock:",  0LL,  v6,  771LL,  v54);

  uint64_t v7 = v42[6];
  uint64_t v8 = v42[7];
  _Block_object_dispose(&v41, 8);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 + v7 != -[NSString length](v5, "length"))
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](v5, "substringWithRange:", v7, v8));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lowercaseString]);
    unsigned __int8 v11 = [&off_10BA0 containsObject:v10];

    if ((v11 & 1) != 0)
    {
      uint64_t v12 = 0LL;
    }

    else
    {
      uint64_t v12 = v9;
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v5, "substringToIndex:", v7));

      uint64_t v5 = (NSString *)v13;
    }
  }

  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x9812000000LL;
  v44 = sub_42DC;
  v45 = sub_42E8;
  v46 = "";
  __int128 v47 = 0u;
  __int128 __p = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v51);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v52);
  memset(v53, 0, sizeof(v53));
  if (*((void *)this + 3))
  {
    uint64_t v34 = a3;
    v15 = v5;
    v16 = -[NSString UTF8String](v15, "UTF8String");
    v17 = this;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v18));

    uint64_t v20 = this;
    unsigned int v21 = TILexiconIDForLocaleIdentifier(v20);
    if (-[NSString length](v15, "length"))
    {
      uint64_t v22 = LMStreamTokenizerCreate(v19, 134217984LL);
      char v23 = v12;
      size_t v24 = strlen(v16);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_4344;
      v35[3] = &unk_10538;
      v38 = &v41;
      v39 = this;
      id v36 = v19;
      unsigned int v40 = v21;
      v37 = v15;
      size_t v25 = v24;
      uint64_t v12 = v23;
      LMStreamTokenizerPushBytes(v22, v16, v25, v35);
      LMStreamTokenizerRelease(v22);
    }

    else
    {
      int v28 = v42 + 6;
      KB::String::String((KB::String *)v54, (const char *)&unk_EE22);
      KB::LanguageModelContext::append(v28, v21 | 0x100000000LL, v54, 0LL);
      KB::String::~String((KB::String *)v54);
    }

    uint64_t v29 = (uint64_t)(v42 + 6);
    KB::utf8_string(v54, v12, v26);
    uint64_t v30 = sub_627C(v34, v29);
    KB::String::String(v30 + 104, v54);
    KB::String::~String((KB::String *)v54);
  }

  else
  {
    uint64_t v27 = (uint64_t)(v42 + 6);
    KB::utf8_string(v54, v12, v14);
    sub_627C(a3, v27);
    KB::String::String(a3 + 104, v54);
    KB::String::~String((KB::String *)v54);
  }

  _Block_object_dispose(&v41, 8);
  v54[0] = (void **)v53;
  sub_6F6C(v54);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v52);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v51);
  if ((void)__p)
  {
    *((void *)&__p + 1) = __p;
    operator delete((void *)__p);
  }

  v31 = (std::__shared_weak_count *)*((void *)&v47 + 1);
  if (*((void *)&v47 + 1))
  {
    v32 = (unint64_t *)(*((void *)&v47 + 1) + 8LL);
    do
      unint64_t v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
}

uint64_t sub_42DC(uint64_t a1, uint64_t a2)
{
  return sub_6ED4(a1 + 48, a2 + 48);
}

uint64_t sub_42E8(uint64_t a1)
{
  uint64_t v4 = (void **)(a1 + 128);
  sub_6F6C(&v4);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 120));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 112));
  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(void *)(a1 + 72) = v2;
    operator delete(v2);
  }

  return sub_6FF8(a1 + 48);
}

void sub_4344(uint64_t a1, NSString *a2, uint64_t a3, unint64_t a4)
{
  if ((_DWORD)a4)
  {
    unint64_t v5 = a4;
    unsigned int v6 = *(_DWORD *)(a1 + 64);
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a2,  a3,  4LL);
    KB::String::String((KB::String *)v13);
    unint64_t token_id_for_word = KB::LanguageModel::find_token_id_for_word( *(void *)(v7 + 24),  v8,  v7 + 40,  *(void *)(*(void *)(a1 + 48) + 8LL) + 48LL,  1LL,  *(void *)(a1 + 32),  v13,  &v12);
    unsigned int v6 = token_id_for_word;
    unint64_t v5 = HIDWORD(token_id_for_word);
    KB::String::~String((KB::String *)v13);
  }

  if ((_DWORD)v5 != 2)
  {
    uint64_t v10 = *(KB **)(a1 + 40);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL) + 48LL;
    KB::utf8_string(v13, v10, a2);
    KB::LanguageModelContext::append(v11, v6 | (v5 << 32), v13, 0LL);
    KB::String::~String((KB::String *)v13);
  }
}

void TI::CP::TestCaseConverter::convert(TI::CP::TestCaseConverter *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a2;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 originalWord]);
  KB::String::String((KB::String *)v68, [v6 layoutID]);

  uint64_t v8 = (unsigned int *)sub_8804((void *)a1 + 6, v68, v7)[6];
  if (v8)
  {
    do
      unsigned int v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 alignedTouches]);
  id v11 = [v10 countByEnumeratingWithState:&v49 objects:v67 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        [v15 location];
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        [v15 timestamp];
        double v21 = v20;
        v69.x = v17;
        v69.y = v19;
        TI::CP::Path::append((TI::CP::Path *)&v53, v69, v21, 0.0, -1.0, 0.0);
      }

      id v12 = [v10 countByEnumeratingWithState:&v49 objects:v67 count:16];
    }

    while (v12);
  }

  uint64_t v22 = (KB *)objc_claimAutoreleasedReturnValue([v5 expectedString]);
  KB::utf8_string(v66, v22, v23);

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  *(_OWORD *)uint64_t v43 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v46);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v47);
  memset(v48, 0, 24);
  KB::String::String((KB::String *)v65);
  size_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 originalWord]);
  size_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 inputStem]);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v5 originalWord]);
    uint64_t v27 = (NSString *)objc_claimAutoreleasedReturnValue([v26 inputStem]);
    TI::CP::TestCaseConverter::compute_linguistic_context_and_stem(a1, v27, (uint64_t)&v57);
    sub_7050((uint64_t)&v42, (uint64_t)&v57);
    KB::String::operator=(v65, v64);
    KB::String::~String((KB::String *)v64);
    v56 = (void **)&v63;
    sub_6F6C(&v56);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v62);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v61);
    if (__p)
    {
      v60 = __p;
      operator delete(__p);
    }

    int v28 = v58;
    if (v58)
    {
      p_shared_owners = (unint64_t *)&v58->__shared_owners_;
      do
        unint64_t v30 = __ldaxr(p_shared_owners);
      while (__stlxr(v30 - 1, p_shared_owners));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
  }

  uint64_t v41 = v8;
  if (v8)
  {
    do
      unsigned int v31 = __ldaxr(v8);
    while (__stlxr(v31 + 1, v8));
    v32 = v41;
    TI::CP::ContinuousPathTestCase::ContinuousPathTestCase( (unsigned int **)a3,  &v41,  (uint64_t)&v53,  (const KB::String *)v66,  (uint64_t)&v42,  (const KB::String *)v65);
    if (v32) {
      sub_8204((uint64_t)v32);
    }
  }

  else
  {
    TI::CP::ContinuousPathTestCase::ContinuousPathTestCase( (unsigned int **)a3,  &v41,  (uint64_t)&v53,  (const KB::String *)v66,  (uint64_t)&v42,  (const KB::String *)v65);
  }

  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v5 alignedTouches]);
  id v34 = [v33 count];

  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue([v5 alignedTouches]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:0]);
    [v36 timestamp];
    *(void *)(a3 + 224) = v37;
  }

  KB::String::~String((KB::String *)v65);
  v57 = (void **)v48;
  sub_6F6C(&v57);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v47);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v46);
  if (v43[0])
  {
    v43[1] = v43[0];
    operator delete(v43[0]);
  }

  v38 = (std::__shared_weak_count *)*((void *)&v42 + 1);
  if (*((void *)&v42 + 1))
  {
    v39 = (unint64_t *)(*((void *)&v42 + 1) + 8LL);
    do
      unint64_t v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }

  KB::String::~String((KB::String *)v66);
  if (*((void *)&v54 + 1))
  {
    *(void *)&__int128 v55 = *((void *)&v54 + 1);
    operator delete(*((void **)&v54 + 1));
  }

  if ((void)v53)
  {
    *((void *)&v53 + 1) = v53;
    operator delete((void *)v53);
  }

  if (v8) {
    sub_8204((uint64_t)v8);
  }
  KB::String::~String((KB::String *)v68);
}

double TI::CP::TestResultsSummarizer::TestResultsSummarizer( TI::CP::TestResultsSummarizer *this, char a2, char a3, char a4)
{
  double result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 14) = 0LL;
  *((void *)this + 15) = 0LL;
  *((void *)this + 13) = 0LL;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((void *)this + 23) = 0LL;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((void *)this + 33) = 0LL;
  *((void *)this + 35) = 0xC010000000000000LL;
  *((void *)this + 36) = 0x4008000000000000LL;
  *((void *)this + 37) = 0LL;
  *((_DWORD *)this + 76) = 0;
  *((_BYTE *)this + 96) = a2;
  *((_BYTE *)this + 128) = a3;
  *((_BYTE *)this + 97) = a4;
  return result;
}

{
  double result;
  double result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 14) = 0LL;
  *((void *)this + 15) = 0LL;
  *((void *)this + 13) = 0LL;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((void *)this + 23) = 0LL;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((void *)this + 33) = 0LL;
  *((void *)this + 35) = 0xC010000000000000LL;
  *((void *)this + 36) = 0x4008000000000000LL;
  *((void *)this + 37) = 0LL;
  *((_DWORD *)this + 76) = 0;
  *((_BYTE *)this + 96) = a2;
  *((_BYTE *)this + 128) = a3;
  *((_BYTE *)this + 97) = a4;
  return result;
}

void TI::CP::TestResultsSummarizer::add_result( TI::CP::TestResultsSummarizer *this, const TI::CP::ContinuousPathTestResult *a2)
{
  int v4 = *((_DWORD *)a2 + 36);
  if (v4 == -1)
  {
    ++*((_DWORD *)this + 21);
  }

  else if (v4)
  {
    if (v4 > 3)
    {
      else {
        ++*((_DWORD *)this + 20);
      }
    }

    else
    {
      ++*((_DWORD *)this + 19);
    }
  }

  else
  {
    ++*((_DWORD *)this + 18);
  }

  double v5 = *((double *)a2 + 19);
  *((double *)this + 15) = v5 + *((double *)this + 15);
  if ((*((void *)a2 + 20) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
    *((double *)this + 13) = v5 - *((double *)a2 + 20) + *((double *)this + 13);
  }
  if ((*((void *)a2 + 21) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
    *((double *)this + 14) = v5 - *((double *)a2 + 21) + *((double *)this + 14);
  }
  if (*((_BYTE *)this + 128) && *((_DWORD *)a2 + 36)) {
    sub_4C80((uint64_t *)this + 17, (uint64_t)a2);
  }
  if (*((_BYTE *)a2 + 217)) {
    ++*((_DWORD *)this + 76);
  }
  if (*((_BYTE *)a2 + 219)) {
    ++*((_DWORD *)this + 75);
  }
  if (*((_BYTE *)a2 + 218)) {
    ++*((_DWORD *)this + 74);
  }
  if (v4 == -1) {
    double v6 = *((double *)this + 35);
  }
  else {
    double v6 = *((double *)this + 35) * ((double)v4 / (*((double *)this + 36) + (double)v4));
  }
  *((double *)this + 34) = v6 + *((double *)this + 34);
  int v7 = *((_DWORD *)a2 + 36);
  unsigned int v9 = (char *)*((void *)this + 32);
  unint64_t v8 = *((void *)this + 33);
  if ((unint64_t)v9 >= v8)
  {
    id v11 = (char *)*((void *)this + 31);
    uint64_t v12 = (v9 - v11) >> 2;
    unint64_t v13 = v12 + 1;
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 1 > v13) {
      unint64_t v13 = v14 >> 1;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      double v16 = (char *)sub_6248((uint64_t)this + 264, v15);
      id v11 = (char *)*((void *)this + 31);
      unsigned int v9 = (char *)*((void *)this + 32);
    }

    else
    {
      double v16 = 0LL;
    }

    CGFloat v17 = &v16[4 * v12];
    double v18 = &v16[4 * v15];
    *(_DWORD *)CGFloat v17 = v7;
    uint64_t v10 = v17 + 4;
    while (v9 != v11)
    {
      int v19 = *((_DWORD *)v9 - 1);
      v9 -= 4;
      *((_DWORD *)v17 - 1) = v19;
      v17 -= 4;
    }

    *((void *)this + 31) = v17;
    *((void *)this + 32) = v10;
    *((void *)this + 33) = v18;
    if (v11) {
      operator delete(v11);
    }
  }

  else
  {
    *(_DWORD *)unsigned int v9 = v7;
    uint64_t v10 = v9 + 4;
  }

  *((void *)this + 32) = v10;
  if (*((_BYTE *)this + 97))
  {
    unsigned int v20 = *((_DWORD *)a2 + 36);
    if (v20 <= 3)
    {
      id v21 = *(id *)(*((void *)a2 + 5) + 1000LL * v20 + 984);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allKeys]);
      if ([v22 count] == (char *)&dword_0 + 1)
      {
        if (!*((_DWORD *)a2 + 36))
        {
          sub_4C80((uint64_t *)this + 25, (uint64_t)a2);
          id v23 = objc_claimAutoreleasedReturnValue([v22 firstObject]);
          sub_6D78(__p, (char *)[v23 UTF8String]);
          uint64_t v27 = __p;
          size_t v24 = sub_8918((uint64_t)this + 160, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v27);
          sub_4C80((uint64_t *)v24 + 5, (uint64_t)a2);
          if (v26 < 0) {
            operator delete(__p[0]);
          }
        }

        sub_4C80((uint64_t *)this + 28, (uint64_t)a2);
      }
    }
  }

uint64_t sub_4C80(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = 0x34F72C234F72C235LL * ((uint64_t)(v7 - *a1) >> 3);
    unint64_t v11 = 0x34F72C234F72C235LL * ((uint64_t)(v5 - *a1) >> 3);
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= v10 + 1) {
      uint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x8D3DCB08D3DCB0LL) {
      unint64_t v13 = 0x11A7B9611A7B961LL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      uint64_t v14 = (char *)sub_7914(v4, v13);
    }
    else {
      uint64_t v14 = 0LL;
    }
    unint64_t v15 = v14;
    double v16 = &v14[232 * v10];
    double v18 = &v14[232 * v13];
    sub_71B8((uint64_t)v16, a2);
    CGFloat v17 = v16 + 232;
    sub_7884(a1, &v15);
    uint64_t v9 = a1[1];
    uint64_t result = sub_7A74((uint64_t)&v15);
  }

  else
  {
    uint64_t result = sub_71B8(*(void *)(v4 - 8), a2);
    uint64_t v9 = v7 + 232;
  }

  a1[1] = v9;
  return result;
}

uint64_t TI::CP::TestResultsSummarizer::summarize_results(uint64_t a1, const char *a2, const char *a3)
{
  unsigned int v3 = a3;
  uint64_t v4 = a2;
  unsigned int v6 = *(_DWORD *)(a1 + 72);
  unsigned int v7 = *(_DWORD *)(a1 + 92);
  double v8 = (double)v7;
  unsigned int v9 = *(_DWORD *)(a1 + 76) + v6;
  unsigned int v10 = *(_DWORD *)(a1 + 80) + v9;
  *(_DWORD *)(a1 + 76) = v9;
  *(_DWORD *)(a1 + 80) = v10;
  unint64_t v11 = a3;
  if (a3[23] < 0) {
    unint64_t v11 = *(const char **)a3;
  }
  double v12 = (double)v9;
  unint64_t v13 = a2;
  if (a2[23] < 0) {
    unint64_t v13 = *(const char **)a2;
  }
  double v14 = v12 * 100.0;
  printf( "%s %s top candidate hit rate: %f%%, %g%% (%d/%d)\n",  v11,  v13,  (double)v6 * 100.0 / v8,  100.0 - (double)v6 * 100.0 / v8,  v6,  v7);
  unint64_t v15 = v3;
  if (v3[23] < 0) {
    unint64_t v15 = *(const char **)v3;
  }
  double v16 = v4;
  if (v4[23] < 0) {
    double v16 = *(const char **)v4;
  }
  printf( "%s %s top-4 candidate hit rate: %f%%, %g%% (%d/%d)\n",  v15,  v16,  v14 / v8,  100.0 - v14 / v8,  *(_DWORD *)(a1 + 76),  *(_DWORD *)(a1 + 92));
  CGFloat v17 = v3;
  if (v3[23] < 0) {
    CGFloat v17 = *(const char **)v3;
  }
  double v18 = v4;
  if (v4[23] < 0) {
    double v18 = *(const char **)v4;
  }
  printf( "%s %s top-40 candidate hit rate: %f%%, %g%% (%d/%d)\n",  v17,  v18,  (double)v10 * 100.0 / v8,  100.0 - (double)v10 * 100.0 / v8,  *(_DWORD *)(a1 + 80),  *(_DWORD *)(a1 + 92));
  if (*(_BYTE *)(a1 + 96))
  {
    printf( "top1 path saved: %g/%g (%g%% of total)\n",  *(double *)(a1 + 104),  *(double *)(a1 + 120),  *(double *)(a1 + 104) * 100.0 / *(double *)(a1 + 120));
    printf( "top3 path saved: %g/%g (%g%% of total)\n",  *(double *)(a1 + 112),  *(double *)(a1 + 120),  *(double *)(a1 + 112) * 100.0 / *(double *)(a1 + 120));
  }

  if (*(_BYTE *)(a1 + 128))
  {
    puts("Failing cases:");
    uint64_t v20 = *(void *)(a1 + 136);
    for (uint64_t i = *(void *)(a1 + 144); v20 != i; v20 += 232LL)
    {
      uint64_t v22 = *(KB::Candidate **)(v20 + 40);
      if (v22 == *(KB::Candidate **)(v20 + 48)) {
        KB::String::String((KB::String *)&v35, "(null)");
      }
      else {
        KB::Candidate::capitalized_string(v22);
      }
      if (*(_WORD *)(v20 + 8))
      {
        id v23 = *(const char **)(v20 + 16);
        if (!v23) {
          id v23 = (const char *)(v20 + 24);
        }
      }

      else
      {
        id v23 = (const char *)&unk_EE22;
      }

      size_t v24 = v36;
      if (!v36) {
        size_t v24 = (const char *)&v37;
      }
      if (v35) {
        size_t v25 = v24;
      }
      else {
        size_t v25 = (const char *)&unk_EE22;
      }
      printf("[%d] expected='%s' observed='%s'\n", *(_DWORD *)v20, v23, v25);
      KB::String::~String((KB::String *)&v35);
    }

    putchar(10);
  }

  unsigned int v26 = *(_DWORD *)(a1 + 304);
  LODWORD(v19) = *(_DWORD *)(a1 + 92);
  double v27 = (double)v19;
  unsigned int v28 = *(_DWORD *)(a1 + 296);
  if (v3[23] < 0) {
    unsigned int v3 = *(const char **)v3;
  }
  double v29 = (double)v26 * 100.0 / v27;
  double v30 = (double)v28 * 100.0 / v27;
  double v31 = (double)*(unsigned int *)(a1 + 300) * 100.0 / v27;
  if (v4[23] < 0) {
    uint64_t v4 = *(const char **)v4;
  }
  uint64_t result = printf( "%s %s Confidence hit rate: %f%% (%d), false-low-conf: %f%% (%d), false-high-conf: %f%% (%d))\n",  v3,  v4,  v29,  v26,  v30,  v28,  v31,  *(_DWORD *)(a1 + 300));
  if (*(_BYTE *)(a1 + 97))
  {
    for (j = *(uint64_t **)(a1 + 176); j; j = (uint64_t *)*j)
    {
      id v34 = (const char *)(j + 2);
      printf("algo: %s, helped: %lu\n", v34, 0x34F72C234F72C235LL * ((j[6] - j[5]) >> 3));
    }

    printf( "base recognizer index matches top1: %lu\n",  0x34F72C234F72C235LL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3));
    printf( "base recognizer index is higher than top1: %lu\n",  0x34F72C234F72C235LL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3));
    return printf( "top1 not in base recognizer: %lu\n",  0x34F72C234F72C235LL * ((uint64_t)(*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 3));
  }

  return result;
}

uint64_t TI::CP::TestResultsSummarizer::dump_match_indices(TI::CP::TestResultsSummarizer *this)
{
  v1 = (unsigned int *)*((void *)this + 31);
  v2 = (unsigned int *)*((void *)this + 32);
  while (v1 != v2)
  {
    unsigned int v4 = *v1++;
    unsigned int v3 = v4;
    int v5 = v4 + 48;
    if (v4 >= 0xA) {
      int v5 = 62;
    }
    if (v3 == -1) {
      int v6 = 109;
    }
    else {
      int v6 = v5;
    }
    putchar(v6);
  }

  return putchar(10);
}

double TI::CP::TestResultsSummarizer::calculate_total_rank_score( TI::CP::TestResultsSummarizer *this, double a2, double a3)
{
  LODWORD(a3) = *((_DWORD *)this + 23);
  return *((double *)this + 34) / (double)*(unint64_t *)&a3;
}

uint64_t TI::CP::get_touch_stage(uint64_t a1, void *a2)
{
  if ((TI::CP::operator==(a1, *a2) & 1) != 0) {
    return 0LL;
  }
  return 1LL;
}

void TI::CP::make_candidate_refinery(unsigned int **a1, uint64_t *a2)
{
  v2 = *a1;
  double v12 = v2;
  if (v2)
  {
    do
      unsigned int v3 = __ldaxr(v2);
    while (__stlxr(v3 + 1, v2));
  }

  unsigned int v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v10 = *a2;
  unint64_t v11 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }

  KB::NgramCandidateRefinery::create(&v12, &v10, 1LL, 1LL);
  unsigned int v7 = v11;
  if (v11)
  {
    double v8 = (unint64_t *)&v11->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  if (v12) {
    sub_84F0(v12);
  }
}

void *sub_5328(void *result, void *a2)
{
  result[6] = 0LL;
  result[7] = 0LL;
  result[8] = 0LL;
  uint64_t v2 = a2[7];
  result[6] = a2[6];
  result[7] = v2;
  a2[6] = 0LL;
  a2[7] = 0LL;
  uint64_t v3 = result[8];
  result[8] = a2[8];
  a2[8] = v3;
  return result;
}

void *sub_5350(uint64_t a1)
{
  return sub_9230((void *)(a1 + 48));
}

void sub_5358(uint64_t a1, const char *a2, __int16 a3, double a4, double a5, double a6, double a7)
{
  unint64_t v13 = *(uint64_t **)(*(void *)(a1 + 32) + 8LL);
  TI::Favonius::LayoutKey::create(&v19, v22, &v20, a3, a4, a5, a6, a7);
  unint64_t v15 = (unint64_t *)(v13 + 6);
  unint64_t v14 = v13[6];
  if (v14 != v13[8])
  {
    uint64_t v18 = v13[7];
    goto LABEL_10;
  }

  unint64_t v16 = v14 + (v14 >> 1);
  if (v14 < 0x100) {
    unint64_t v16 = 2 * v14;
  }
  if (v16 <= v14 + 1) {
    unint64_t v17 = v14 + 1;
  }
  else {
    unint64_t v17 = v16;
  }
  sub_9290(v13 + 6, v17);
  uint64_t v18 = v13[7];
  if (v18)
  {
    unint64_t v14 = *v15;
LABEL_10:
    *(void *)(v18 + 8 * v14) = v19;
    unint64_t *v15 = v14 + 1;
    goto LABEL_11;
  }

  if (v19) {
    sub_838C(v19);
  }
LABEL_11:
  KB::String::~String((KB::String *)v22);
}

uint64_t sub_54A4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int **)(a2 + 40);
  *(void *)(result + 40) = v2;
  if (v2)
  {
    do
      unsigned int v3 = __ldaxr(v2);
    while (__stlxr(v3 + 1, v2));
  }

  return result;
}

void sub_54C4(uint64_t a1)
{
  v1 = *(unsigned int **)(a1 + 40);
  if (v1) {
    sub_84F0(v1);
  }
}

void TI::CP::createAndLoadDictionaryContainerMultiLexicon( TI::CP *this@<X0>, NSString *a2@<X1>, NSString *a3@<X2>, float a4@<S0>, void ***a5@<X8>)
{
  unint64_t v9 = this;
  uint64_t v10 = a2;
  unint64_t v11 = a3;
  id v21 = v11;
  if (v11)
  {
    double v12 = v11;
    uint64_t v13 = UIKeyboardDynamicDictionaryFile(v9, v11);
    unint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = UIKeyboardDynamicDictionaryFile(v10, v12);
    unint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue(v15);
  }

  else
  {
    unint64_t v16 = 0LL;
    unint64_t v14 = 0LL;
  }

  TI::CP::getLexiconInfo(v9, v14, 1.0 - a4, (uint64_t)v41);
  TI::CP::getLexiconInfo((TI::CP *)v10, v16, a4, (uint64_t)v35);
  KB::String::String((KB::String *)v23, (const KB::String *)v41);
  KB::String::String((KB::String *)&v24, (const KB::String *)v42);
  KB::String::String((KB::String *)&v25, (const KB::String *)v43);
  KB::String::String((KB::String *)&v26, (const KB::String *)v44);
  KB::String::String((KB::String *)v27, (const KB::String *)v45);
  v27[4] = v45[4];
  int v28 = v46;
  KB::String::String((KB::String *)&v29, (const KB::String *)v35);
  KB::String::String((KB::String *)&v30, (const KB::String *)v36);
  KB::String::String((KB::String *)&v31, (const KB::String *)v37);
  KB::String::String((KB::String *)&v32, (const KB::String *)v38);
  KB::String::String((KB::String *)v33, (const KB::String *)v39);
  v33[4] = v39[4];
  int v34 = v40;
  unint64_t v17 = (char *)operator new(0x160uLL);
  uint64_t v18 = 0LL;
  v22[0] = v17;
  v22[2] = v17 + 352;
  do
  {
    sub_7BF0((uint64_t)&v17[v18 * 8], (uint64_t)&v23[v18]);
    v18 += 22LL;
  }

  while (v18 != 44);
  v22[1] = v17 + 352;
  uint64_t v19 = 44LL;
  do
  {
    KB::String::~String((KB::String *)&v23[v19 - 6]);
    KB::String::~String((KB::String *)&v23[v19 - 10]);
    KB::String::~String((KB::String *)&v23[v19 - 14]);
    KB::String::~String((KB::String *)&v23[v19 - 18]);
    KB::String::~String((KB::String *)&v23[v19 - 22]);
    v19 -= 22LL;
  }

  while (v19 * 8);
  KB::DictionaryContainer::create_multilexicon(v23, v22, 1LL, 1LL);
  *a5 = v23[0];
  v23[0] = (void **)v22;
  sub_7C58(v23);
  KB::String::~String((KB::String *)v39);
  KB::String::~String((KB::String *)v38);
  KB::String::~String((KB::String *)v37);
  KB::String::~String((KB::String *)v36);
  KB::String::~String((KB::String *)v35);
  KB::String::~String((KB::String *)v45);
  KB::String::~String((KB::String *)v44);
  KB::String::~String((KB::String *)v43);
  KB::String::~String((KB::String *)v42);
  KB::String::~String((KB::String *)v41);
}

void TI::CP::getLexiconInfo(TI::CP *this@<X0>, NSString *a2@<X1>, float a3@<S0>, uint64_t a4@<X8>)
{
  double v8 = a2;
  unint64_t v9 = this;
  uint64_t v10 = unigramsFilePathForInputMode();
  id v23 = (KB *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v11 = deltaUnigramsFilePathForInputMode(v9);
  double v12 = (KB *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = phrasesFilePathForInputMode(v9);
  unint64_t v14 = (KB *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = dynamicFilePathForInputMode(v9, v8);
  unint64_t v16 = (KB *)objc_claimAutoreleasedReturnValue(v15);

  unint64_t v17 = v9;
  LODWORD(v9) = TILexiconIDForLocaleIdentifier(-[TI::CP UTF8String](v17, "UTF8String"));
  KB::utf8_string(v17, v18);

  KB::utf8_string(v23, v19);
  KB::utf8_string(v12, v20);
  KB::utf8_string(v14, v21);
  KB::utf8_string(v16, v22);
  *(_DWORD *)(a4 + 160) = (_DWORD)v9;
  *(_BYTE *)(a4 + 164) = 0;
  *(float *)(a4 + 168) = a3;
}

void TI::CP::createAndLoadLanguageModelContainer( TI::CP *this@<X0>, NSString *a2@<X1>, NSString *a3@<X2>, float a4@<S0>, _OWORD *a5@<X8>)
{
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  TI::CP::createAndLoadLanguageModel(this, v11, (NSString *)((char *)&dword_0 + 1), &v53);
  TI::CP::createAndLoadLanguageModel((TI::CP *)v10, v11, (NSString *)((char *)&dword_0 + 1), &v51);
  uint64_t v46 = v53;
  uint64_t v47 = v54;
  if (v54)
  {
    p_shared_owners = (unint64_t *)&v54->__shared_owners_;
    do
      unint64_t v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }

  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup(&v48, &v46);
  unint64_t v14 = v47;
  if (v47)
  {
    uint64_t v15 = (unint64_t *)&v47->__shared_owners_;
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  uint64_t v41 = v51;
  __int128 v42 = v52;
  if (v52)
  {
    unint64_t v17 = (unint64_t *)&v52->__shared_owners_;
    do
      unint64_t v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }

  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup(&v43, &v41);
  uint64_t v19 = v42;
  if (v42)
  {
    uint64_t v20 = (unint64_t *)&v42->__shared_owners_;
    do
      unint64_t v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  (*(void (**)(void **__return_ptr))(*(void *)v53 + 48LL))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v48, *(_DWORD *)__p[0], 1.0 - a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  (*(void (**)(void **__return_ptr))(*(void *)v51 + 48LL))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v43, *(_DWORD *)__p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  __p[0] = v48;
  __p[1] = v49;
  if (v49)
  {
    uint64_t v22 = (unint64_t *)&v49->__shared_owners_;
    do
      unint64_t v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }

  sub_7D08((uint64_t)v56, (uint64_t)v50);
  v56[5] = v43;
  v56[6] = v44;
  if (v44)
  {
    uint64_t v24 = (unint64_t *)&v44->__shared_owners_;
    do
      unint64_t v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }

  sub_7D08((uint64_t)&v57, (uint64_t)v45);
  uint64_t v26 = 112LL;
  v39[0] = operator new(0x70uLL);
  int v40 = v39[0] + 14;
  v39[1] = sub_7F6C((uint64_t)&v40, __p, &v58, v39[0]);
  do
  {
    sub_7FE0((uint64_t)&v50[v26 + 32]);
    sub_6FF8((uint64_t)&v50[v26 + 16]);
    v26 -= 56LL;
  }

  while (v26);
  sub_5E84((uint64_t)v39, (uint64_t *)__p);
  *a5 = *(_OWORD *)__p;
  __p[0] = v39;
  sub_816C((void ***)__p);
  sub_7FE0((uint64_t)v45);
  double v27 = v44;
  if (v44)
  {
    int v28 = (unint64_t *)&v44->__shared_owners_;
    do
      unint64_t v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

  sub_7FE0((uint64_t)v50);
  uint64_t v30 = v49;
  if (v49)
  {
    uint64_t v31 = (unint64_t *)&v49->__shared_owners_;
    do
      unint64_t v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }

  unint64_t v33 = v52;
  if (v52)
  {
    int v34 = (unint64_t *)&v52->__shared_owners_;
    do
      unint64_t v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

  id v36 = v54;
  if (v54)
  {
    uint64_t v37 = (unint64_t *)&v54->__shared_owners_;
    do
      unint64_t v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
}

void TI::CP::createAndLoadLanguageModel( TI::CP *this@<X0>, NSString *a2@<X1>, NSString *a3@<X2>, uint64_t *a4@<X8>)
{
  int v4 = (int)a3;
  unsigned int v7 = a2;
  double v8 = this;
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TIInputMode inputModeWithIdentifier:](&OBJC_CLASS___TIInputMode, "inputModeWithIdentifier:", v8));

  uint64_t v22 = v9;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  BYTE4(v14) = [v10 doesSupportInlineCompletion];
  LODWORD(v14) = 90;
  BYTE4(v13) = 0;
  LODWORD(v13) = v4 ^ 1;
  KB::LanguageModelConfig::LanguageModelConfig(&v15, v9, 0LL, v11, 0LL, v7, 0LL, 0LL, 0LL, v13, 0x100000000LL, v14);

  double v12 = operator new(0x160uLL);
  KB::LanguageModelStr::LanguageModelStr(v12, &v15);
  sub_9310(a4, (uint64_t)v12);
  (*(void (**)(uint64_t, uint64_t))(*(void *)*a4 + 72LL))(*a4, 1LL);
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;
  if (v20) {
    CFRelease(v20);
  }
  CFTypeRef v20 = 0LL;
  if (v19) {
    CFRelease(v19);
  }
  CFTypeRef v19 = 0LL;
  if (v18) {
    CFRelease(v18);
  }
  CFTypeRef v18 = 0LL;
  if (v17) {
    CFRelease(v17);
  }
  CFTypeRef v17 = 0LL;
  if (v16) {
    CFRelease(v16);
  }
  CFTypeRef v16 = 0LL;
  if (v15) {
    CFRelease(v15);
  }
}

uint64_t *sub_5E84@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  int v4 = operator new(0x58uLL);
  KB::LanguageModelContainer::LanguageModelContainer(v4, a1);
  return sub_8028(a2, (uint64_t)v4);
}

void TI::CP::createAndLoadDictionaryContainer(TI::CP *this@<X0>, NSString *a2@<X1>, void *a3@<X8>)
{
  int v5 = this;
  unint64_t v6 = v5;
  if (a2)
  {
    uint64_t v7 = UIKeyboardDynamicDictionaryFile(v5, a2);
    double v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    double v8 = 0LL;
  }

  uint64_t v13 = v8;
  TI::CP::getLexiconInfo(v6, v8, 1.0, (uint64_t)v23);
  KB::String::String((KB::String *)v17, (const KB::String *)v23);
  KB::String::String((KB::String *)v18, (const KB::String *)v24);
  KB::String::String((KB::String *)v19, (const KB::String *)v25);
  KB::String::String((KB::String *)v20, (const KB::String *)v26);
  KB::String::String((KB::String *)v21, (const KB::String *)v27);
  v21[4] = v27[4];
  int v22 = v28;
  unint64_t v9 = (char *)operator new(0xB0uLL);
  uint64_t v10 = v9 + 176;
  v14[0] = v9;
  v14[2] = v9 + 176;
  sub_7BF0((uint64_t)v9, (uint64_t)v17);
  v14[1] = v10;
  KB::DictionaryContainer::create_multilexicon(&v15, v14, 1LL, 1LL);
  uint64_t v11 = v15;
  uint64_t v15 = 0LL;
  CFTypeRef v16 = (void **)v14;
  *a3 = v11;
  sub_7C58(&v16);
  KB::String::~String((KB::String *)v21);
  KB::String::~String((KB::String *)v20);
  KB::String::~String((KB::String *)v19);
  KB::String::~String((KB::String *)v18);
  KB::String::~String((KB::String *)v17);
  KB::String::~String((KB::String *)v27);
  KB::String::~String((KB::String *)v26);
  KB::String::~String((KB::String *)v25);
  KB::String::~String((KB::String *)v24);
  KB::String::~String((KB::String *)v23);
}

void *sub_609C(void *a1, uint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  int v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    sub_610C(a1, 0xAAAAAAAAAAAAAAABLL * (v5 >> 4));
    unint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }

  return a1;
}

char *sub_610C(void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    abort();
  }
  uint64_t result = (char *)sub_6158((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

void *sub_6158(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_619C();
  }
  return operator new(48 * a2);
}

void sub_619C()
{
}

void *sub_61A8(void *a1, uint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    sub_620C(a1, v5 >> 2);
    unint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }

  return a1;
}

char *sub_620C(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    abort();
  }
  uint64_t result = (char *)sub_6248((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_6248(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_619C();
  }
  return operator new(4 * a2);
}

uint64_t sub_627C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  if (v4)
  {
    int64_t v5 = (unint64_t *)(v4 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  sub_631C((void *)(a1 + 16), a2 + 16);
  __int128 v7 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v7;
  language_modeling::v1::LinguisticContext::LinguisticContext( (language_modeling::v1::LinguisticContext *)(a1 + 64),  (const language_modeling::v1::LinguisticContext *)(a2 + 64));
  language_modeling::v1::LinguisticContext::LinguisticContext( (language_modeling::v1::LinguisticContext *)(a1 + 72),  (const language_modeling::v1::LinguisticContext *)(a2 + 72));
  *(void *)(a1 + 88) = 0LL;
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  sub_63F0( (char *)(a1 + 80),  *(__int128 **)(a2 + 80),  *(__int128 **)(a2 + 88),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 88) - *(void *)(a2 + 80)) >> 3));
  return a1;
}

void *sub_631C(void *a1, uint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    sub_6380(a1, v5 >> 3);
    unint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }

  return a1;
}

char *sub_6380(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    abort();
  }
  uint64_t result = (char *)sub_63BC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_63BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_619C();
  }
  return operator new(8 * a2);
}

char *sub_63F0(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    sub_6440(result, a4);
    uint64_t result = sub_64D0((int)v6 + 16, a2, a3, *((char **)v6 + 1));
    *((void *)v6 + 1) = result;
  }

  return result;
}

char *sub_6440(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    abort();
  }
  uint64_t result = (char *)sub_648C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_648C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_619C();
  }
  return operator new(24 * a2);
}

char *sub_64D0(int a1, __int128 *a2, __int128 *a3, char *__dst)
{
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_6E24(__dst, *(void **)v6, *((void *)v6 + 1));
      }

      else
      {
        __int128 v7 = *v6;
        *((void *)__dst + 2) = *((void *)v6 + 2);
        *(_OWORD *)__dst = v7;
      }

      unint64_t v6 = (__int128 *)((char *)v6 + 24);
      __dst += 24;
    }

    while (v6 != a3);
  }

  return __dst;
}

void *sub_6540(void *a1, uint64_t *a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  sub_6604(a1, *a2, a2[1], 0x1CAC083126E978D5LL * ((a2[1] - *a2) >> 3));
  a1[3] = 0LL;
  a1[4] = 0LL;
  a1[5] = 0LL;
  sub_6604(a1 + 3, a2[3], a2[4], 0x1CAC083126E978D5LL * ((a2[4] - a2[3]) >> 3));
  a1[6] = 0LL;
  a1[7] = 0LL;
  a1[8] = 0LL;
  sub_6604(a1 + 6, a2[6], a2[7], 0x1CAC083126E978D5LL * ((a2[7] - a2[6]) >> 3));
  a1[9] = 0LL;
  a1[10] = 0LL;
  a1[11] = 0LL;
  sub_6604(a1 + 9, a2[9], a2[10], 0x1CAC083126E978D5LL * ((a2[10] - a2[9]) >> 3));
  a1[12] = a2[12];
  return a1;
}

void *sub_6604(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    sub_6660(result, a4);
    uint64_t result = (void *)v6[1];
    while (a2 != a3)
    {
      uint64_t v7 = sub_66F8((uint64_t)result, a2);
      a2 += 1000LL;
      uint64_t result = (void *)(v7 + 1000);
    }

    v6[1] = result;
  }

  return result;
}

char *sub_6660(void *a1, unint64_t a2)
{
  if (a2 >= 0x4189374BC6A7F0LL) {
    abort();
  }
  uint64_t result = (char *)sub_66B0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[1000 * v4];
  return result;
}

void *sub_66B0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x4189374BC6A7F0LL) {
    sub_619C();
  }
  return operator new(1000 * a2);
}

uint64_t sub_66F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_67D4((void *)a1, (void *)a2);
  __int128 v5 = *(_OWORD *)(a2 + 744);
  __int128 v6 = *(_OWORD *)(a2 + 760);
  v4[97] = *(void *)(a2 + 776);
  *(_OWORD *)(v4 + 93) = v5;
  *(_OWORD *)(v4 + 95) = v6;
  sub_627C((uint64_t)(v4 + 98), a2 + 784);
  KB::String::String((KB::String *)(a1 + 888), (const KB::String *)(a2 + 888));
  uint64_t v7 = (_BYTE *)(a1 + 920);
  if (*(char *)(a2 + 943) < 0)
  {
    sub_6E24(v7, *(void **)(a2 + 920), *(void *)(a2 + 928));
  }

  else
  {
    __int128 v8 = *(_OWORD *)(a2 + 920);
    *(void *)(a1 + 936) = *(void *)(a2 + 936);
    *(_OWORD *)uint64_t v7 = v8;
  }

  KB::ByteString::copy(a1 + 944, a2 + 944);
  *(_OWORD *)(a1 + 960) = *(_OWORD *)(a2 + 960);
  unint64_t v9 = *(const void **)(a2 + 976);
  *(void *)(a1 + 976) = v9;
  if (v9)
  {
    CFRetain(v9);
    *(void *)(a1 + 976) = v9;
  }

  uint64_t v10 = *(const void **)(a2 + 984);
  *(void *)(a1 + 984) = v10;
  if (v10)
  {
    CFRetain(v10);
    *(void *)(a1 + 984) = v10;
  }

  *(_DWORD *)(a1 + 992) = *(_DWORD *)(a2 + 992);
  return a1;
}

void *sub_67D4(void *a1, void *a2)
{
  unint64_t v4 = a2[2];
  __int128 v5 = a1 + 3;
  *a1 = *a2;
  a1[1] = v5;
  a1[2] = 3LL;
  if (v4 < 4 || (a1[2] = v4, __int128 v5 = malloc(240 * v4), (a1[1] = v5) != 0LL))
  {
    uint64_t v6 = *a2;
    if (*a2)
    {
      uint64_t v7 = a2[1];
      uint64_t v8 = 240 * v6;
      do
      {
        __int128 v5 = (void *)(sub_6864((uint64_t)v5, v7) + 240);
        v7 += 240LL;
        v8 -= 240LL;
      }

      while (v8);
    }
  }

  return a1;
}

uint64_t sub_6864(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = KB::String::String((KB::String *)a1, (const KB::String *)a2);
  KB::ByteString::copy(v4 + 32, a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(void *)(a1 + 48) = v5;
  KB::String::String((KB::String *)(a1 + 64), (const KB::String *)(a2 + 64));
  __int128 v6 = *(_OWORD *)(a2 + 96);
  __int128 v7 = *(_OWORD *)(a2 + 112);
  __int128 v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  KB::String::String((KB::String *)(a1 + 160), (const KB::String *)(a2 + 160));
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  sub_68E4(a1 + 200, a2 + 200);
  return a1;
}

uint64_t sub_68E4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_6940(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
    sub_6B74(a1, i + 2, i + 2);
  return a1;
}

void sub_6940(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_6A1C(a1, prime);
  }

void sub_6A1C(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_619C();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

void *sub_6B74(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }

          else
          {
            v11 &= v7 - 1;
          }

          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x18uLL);
  void *i = 0LL;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_6940(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  CFTypeRef v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *CFTypeRef v19 = i;
    goto LABEL_39;
  }

  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    CFTypeRef v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return v10;
}

void *sub_6D78(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + ++*((_DWORD *)this + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void *sub_6E24(_BYTE *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      abort();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    void *v5 = v8;
    size_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

__n128 sub_6EAC(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t sub_6EBC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7 = *(void *)(*(void *)(result + 32) + 8LL);
  *(void *)(v7 + 48) = a3;
  *(void *)(v7 + 56) = a4;
  *a7 = 1;
  return result;
}

uint64_t sub_6ED4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 32) = 0LL;
  __int128 v4 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  language_modeling::v1::LinguisticContext::LinguisticContext(a1 + 64, a2 + 64);
  language_modeling::v1::LinguisticContext::LinguisticContext(a1 + 72, a2 + 72);
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 88) = 0LL;
  *(void *)(a1 + 96) = 0LL;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a2 + 80) = 0LL;
  *(void *)(a2 + 88) = 0LL;
  *(void *)(a2 + 96) = 0LL;
  return a1;
}

void sub_6F6C(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_6FAC((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_6FAC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

uint64_t sub_6FF8(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  return a1;
}

uint64_t sub_7050(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  language_modeling::v1::LinguisticContext::operator=(a1 + 64, a2 + 64);
  language_modeling::v1::LinguisticContext::operator=(a1 + 72, a2 + 72);
  sub_7180((uint64_t *)(a1 + 80));
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a2 + 80) = 0LL;
  *(void *)(a2 + 88) = 0LL;
  *(void *)(a2 + 96) = 0LL;
  return a1;
}

uint64_t sub_70CC(uint64_t a1, __int128 *a2)
{
  __int128 v3 = *a2;
  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  __int128 v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  return a1;
}

__n128 sub_7130(uint64_t a1, __n128 *a2)
{
  __int128 v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0LL;
  a2->n128_u64[1] = 0LL;
  a2[1].n128_u64[0] = 0LL;
  return result;
}

void sub_7180(uint64_t *a1)
{
  if (*a1)
  {
    sub_6FAC(a1);
    operator delete((void *)*a1);
    *a1 = 0LL;
    a1[1] = 0LL;
    a1[2] = 0LL;
  }

uint64_t sub_71B8(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  KB::String::String((KB::String *)(a1 + 8), (const KB::String *)(a2 + 8));
  sub_6540((void *)(a1 + 40), (uint64_t *)(a2 + 40));
  __int128 v4 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v4;
  *(void *)(a1 + 184) = 0LL;
  *(void *)(a1 + 192) = 0LL;
  *(void *)(a1 + 176) = a1 + 184;
  sub_722C((uint64_t *)(a1 + 176), *(void **)(a2 + 176), (void *)(a2 + 184));
  __int128 v5 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 212) = *(_OWORD *)(a2 + 212);
  *(_OWORD *)(a1 + 200) = v5;
  return a1;
}

uint64_t *sub_722C(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    __int128 v4 = a2;
    __int128 v5 = (uint64_t **)result;
    unint64_t v6 = result + 1;
    do
    {
      __n128 result = sub_72B0(v5, v6, (uint64_t)(v4 + 4), (const KB::String *)(v4 + 4));
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = (void *)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          __int128 v4 = v8;
        }

        while (!v9);
      }

      __int128 v4 = v8;
    }

    while (v8 != a3);
  }

  return result;
}

uint64_t *sub_72B0(uint64_t **a1, void *a2, uint64_t a3, const KB::String *a4)
{
  unint64_t v6 = (uint64_t **)sub_7360(a1, a2, &v13, &v12, a3);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = v6;
    uint64_t v7 = (uint64_t *)operator new(0x70uLL);
    v10[1] = (uint64_t)(a1 + 1);
    sub_7628((KB::String *)(v7 + 4), a4);
    char v11 = 1;
    sub_752C(a1, v13, v8, v7);
    v10[0] = 0LL;
    sub_7800(v10, 0LL);
  }

  return v7;
}

void *sub_7360(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  BOOL v9 = a1 + 1;
  if (a1 + 1 == a2
    || (*(void *)(a5 + 8) ? (char v11 = *(const char **)(a5 + 8)) : (char v11 = (const char *)(a5 + 16)),
        a2[5] ? (uint64_t v12 = (const char *)a2[5]) : (uint64_t v12 = (const char *)(a2 + 6)),
        strcmp(v11, v12) < 0))
  {
    uint64_t v13 = *a2;
    if ((void *)*a1 == a2)
    {
      unint64_t v15 = a2;
LABEL_29:
      if (v13)
      {
        *a3 = v15;
        return v15 + 1;
      }

      else
      {
        *a3 = a2;
        return a2;
      }
    }

    if (v13)
    {
      BOOL v14 = (void *)*a2;
      do
      {
        unint64_t v15 = v14;
        BOOL v14 = (void *)v14[1];
      }

      while (v14);
    }

    else
    {
      uint64_t v18 = a2;
      do
      {
        unint64_t v15 = (void *)v18[2];
        BOOL v19 = *v15 == (void)v18;
        uint64_t v18 = v15;
      }

      while (v19);
    }

    if (v15[5]) {
      unint64_t v20 = (const char *)v15[5];
    }
    else {
      unint64_t v20 = (const char *)(v15 + 6);
    }
    if (*(void *)(a5 + 8)) {
      unint64_t v21 = *(const char **)(a5 + 8);
    }
    else {
      unint64_t v21 = (const char *)(a5 + 16);
    }
    if (strcmp(v20, v21) < 0) {
      goto LABEL_29;
    }
    return sub_7580((uint64_t)a1, a3, a5);
  }

  if (strcmp(v12, v11) < 0)
  {
    uint64_t v16 = a2[1];
    if (v16)
    {
      size_t v17 = (void *)a2[1];
      do
      {
        a4 = v17;
        size_t v17 = (void *)*v17;
      }

      while (v17);
    }

    else
    {
      int v22 = a2;
      do
      {
        a4 = (void *)v22[2];
        BOOL v19 = *a4 == (void)v22;
        int v22 = a4;
      }

      while (!v19);
    }

    if (a4 == v9 || (a4[5] ? (unint64_t v23 = (const char *)a4[5]) : (unint64_t v23 = (const char *)(a4 + 6)), strcmp(v11, v23) < 0))
    {
      if (v16)
      {
        *a3 = a4;
      }

      else
      {
        *a3 = a2;
        return a2 + 1;
      }

      return a4;
    }

    return sub_7580((uint64_t)a1, a3, a5);
  }

  *a3 = a2;
  *a4 = a2;
  return a4;
}

uint64_t *sub_752C(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  __int128 v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  __n128 result = sub_7668(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void *sub_7580(uint64_t a1, void *a2, uint64_t a3)
{
  __int128 v5 = (void *)(a1 + 8);
  __int128 v4 = *(void **)(a1 + 8);
  if (v4)
  {
    if (*(void *)(a3 + 8)) {
      unint64_t v6 = *(const char **)(a3 + 8);
    }
    else {
      unint64_t v6 = (const char *)(a3 + 16);
    }
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v8 = (void *)v4[5];
        BOOL v9 = (const char *)(v8 ? v8 : v7 + 6);
        if ((strcmp(v6, v9) & 0x80000000) == 0) {
          break;
        }
        __int128 v4 = (void *)*v7;
        __int128 v5 = v7;
        if (!*v7) {
          goto LABEL_15;
        }
      }

      if ((strcmp(v9, v6) & 0x80000000) == 0) {
        break;
      }
      __int128 v5 = v7 + 1;
      __int128 v4 = (void *)v7[1];
    }

    while (v4);
  }

  else
  {
    uint64_t v7 = (void *)(a1 + 8);
  }

LABEL_15:
  *a2 = v7;
  return v5;
}

KB::String *sub_7628(KB::String *a1, const KB::String *a2)
{
  uint64_t v4 = KB::String::String(a1, a2);
  sub_609C((void *)(v4 + 32), (uint64_t)a2 + 32);
  sub_61A8((void *)a1 + 7, (uint64_t)a2 + 56);
  return a1;
}

uint64_t *sub_7668(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      __int128 v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            BOOL v9 = (uint64_t **)a2[2];
          }

          else
          {
            BOOL v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              uint64_t v10[2] = (uint64_t)v2;
              __int128 v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            const char *v9 = v2;
            v2[2] = (uint64_t)v9;
            __int128 v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *__int128 v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            __int128 v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          __int128 v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      _BYTE *v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_7800(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16)) {
      sub_7844((KB::String *)(v2 + 32));
    }
    operator delete((void *)v2);
  }

void sub_7844(KB::String *this)
{
  uint64_t v2 = (void *)*((void *)this + 7);
  if (v2)
  {
    *((void *)this + 8) = v2;
    operator delete(v2);
  }

  __int128 v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
  }

  KB::String::~String(this);
}

uint64_t *sub_7884(uint64_t *result, void *a2)
{
  __int128 v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 232LL;
    v4 -= 232LL;
    __n128 result = (uint64_t *)sub_795C(v6, v4);
  }

  a2[1] = v6;
  uint64_t v7 = *v3;
  *__int128 v3 = v6;
  a2[1] = v7;
  uint64_t v8 = v3[1];
  v3[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = v3[2];
  v3[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *sub_7914(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x11A7B9611A7B962LL) {
    sub_619C();
  }
  return operator new(232 * a2);
}

uint64_t sub_795C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  KB::String::String(a1 + 8, a2 + 8);
  sub_79E8((void *)(a1 + 40), a2 + 40);
  __int128 v4 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v4;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  uint64_t v5 = (void *)(a2 + 184);
  uint64_t v6 = *(void *)(a2 + 184);
  *(void *)(a1 + 184) = v6;
  uint64_t v7 = a1 + 184;
  uint64_t v8 = *(void *)(a2 + 192);
  *(void *)(a1 + 192) = v8;
  if (v8)
  {
    *(void *)(v6 + 16) = v7;
    *(void *)(a2 + 176) = v5;
    void *v5 = 0LL;
    *(void *)(a2 + 192) = 0LL;
  }

  else
  {
    *(void *)(a1 + 176) = v7;
  }

  __int128 v9 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 212) = *(_OWORD *)(a2 + 212);
  *(_OWORD *)(a1 + 200) = v9;
  return a1;
}

__n128 sub_79E8(void *a1, uint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = *(void *)(a2 + 16);
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  a1[3] = 0LL;
  a1[4] = 0LL;
  a1[5] = 0LL;
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  a1[5] = *(void *)(a2 + 40);
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  a1[6] = 0LL;
  a1[7] = 0LL;
  a1[8] = 0LL;
  *((_OWORD *)a1 + 3) = *(_OWORD *)(a2 + 48);
  a1[8] = *(void *)(a2 + 64);
  *(void *)(a2 + 48) = 0LL;
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  a1[9] = 0LL;
  a1[10] = 0LL;
  a1[11] = 0LL;
  __n128 result = *(__n128 *)(a2 + 72);
  *(__n128 *)(a1 + 9) = result;
  a1[11] = *(void *)(a2 + 88);
  *(void *)(a2 + 72) = 0LL;
  *(void *)(a2 + 80) = 0LL;
  *(void *)(a2 + 88) = 0LL;
  a1[12] = *(void *)(a2 + 96);
  return result;
}

uint64_t sub_7A74(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 232;
    sub_7AC0(i - 232);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_7AC0(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 112);
  sub_7B80(&v2);
  uint64_t v2 = (void **)(a1 + 88);
  sub_7B80(&v2);
  uint64_t v2 = (void **)(a1 + 64);
  sub_7B80(&v2);
  uint64_t v2 = (void **)(a1 + 40);
  sub_7B80(&v2);
  KB::String::~String((KB::String *)(a1 + 8));
}

void sub_7B38(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_7B38(a1, *a2);
    sub_7B38(a1, a2[1]);
    sub_7844((KB::String *)(a2 + 4));
    operator delete(a2);
  }

void sub_7B80(void ***a1)
{
  v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    __int128 v4 = (char *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        KB::Candidate::~Candidate((KB::Candidate *)(v4 - 1000));
      while (v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

uint64_t sub_7BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = KB::String::String((KB::String *)a1, (const KB::String *)a2);
  KB::String::String((KB::String *)(v4 + 32), (const KB::String *)(a2 + 32));
  KB::String::String((KB::String *)(a1 + 64), (const KB::String *)(a2 + 64));
  KB::String::String((KB::String *)(a1 + 96), (const KB::String *)(a2 + 96));
  KB::String::String((KB::String *)(a1 + 128), (const KB::String *)(a2 + 128));
  uint64_t v5 = *(void *)(a2 + 160);
  *(_DWORD *)(a1 + 168) = *(_DWORD *)(a2 + 168);
  *(void *)(a1 + 160) = v5;
  return a1;
}

void sub_7C58(void ***a1)
{
  v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 176LL;
        sub_7CC8(v4);
      }

      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_7CC8(uint64_t a1)
{
}

uint64_t sub_7D08(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_6940(a1, *(void *)(a2 + 8));
  return a1;
}

void *sub_7D64(uint64_t a1, unsigned int *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }

    __int128 v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          uint64_t v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  uint64_t v10 = operator new(0x18uLL);
  *uint64_t v10 = 0LL;
  v10[1] = v6;
  uint64_t v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_6940(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  BOOL v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    *BOOL v19 = v10;
    goto LABEL_39;
  }

  *uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    BOOL v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void *sub_7F6C(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      uint64_t v7 = v6[1];
      *a4 = *v6;
      a4[1] = v7;
      if (v7)
      {
        uint8x8_t v8 = (unint64_t *)(v7 + 8);
        do
          unint64_t v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }

      sub_7D08((uint64_t)(a4 + 2), (uint64_t)(v6 + 2));
      v6 += 7;
      a4 += 7;
    }

    while (v6 != a3);
  }

  return a4;
}

uint64_t sub_7FE0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t *sub_8028(uint64_t *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  void *v4 = &off_105C8;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = (uint64_t)v4;
  if (a2) {
    uint64_t v5 = (void *)(a2 + 8);
  }
  else {
    uint64_t v5 = 0LL;
  }
  sub_8088((uint64_t)a1, v5, a2);
  return a1;
}

void sub_8088(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          unint64_t v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
        do
          unint64_t v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
        uint64_t v4 = (std::__shared_weak_count *)a2[1];
      }

      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        uint64_t v10 = (unint64_t *)&v5->__shared_owners_;
        do
          unint64_t v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }

void sub_813C(std::__shared_weak_count *a1)
{
}

uint64_t sub_8150(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

void sub_816C(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_81AC((uint64_t)v2, (uint64_t)*v2);
    operator delete(**a1);
  }

uint64_t sub_81AC(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != a2)
  {
    do
    {
      uint64_t v5 = v4 - 56;
      sub_7FE0(v4 - 40);
      uint64_t result = sub_6FF8(v5);
      uint64_t v4 = v5;
    }

    while (v5 != a2);
  }

  *(void *)(v3 + 8) = a2;
  return result;
}

void sub_8204(uint64_t a1)
{
  unsigned int v2 = atomic_load((unsigned int *)a1);
  if (v2 == 1)
  {
    KB::String::~String((KB::String *)(a1 + 208));
    sub_8290(a1 + 176, *(void **)(a1 + 184));
    sub_8290(a1 + 152, *(void **)(a1 + 160));
    sub_82D0(a1 + 72);
    sub_83F4(a1 + 32);
    uint64_t v4 = (void **)(a1 + 8);
    sub_846C(&v4);
    operator delete((void *)a1);
  }

  else
  {
    do
      unsigned int v3 = __ldaxr((unsigned int *)a1);
    while (__stlxr(v3 - 1, (unsigned int *)a1));
  }

void sub_8290(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_8290(a1, *a2);
    sub_8290(a1, a2[1]);
    operator delete(a2);
  }

uint64_t sub_82D0(uint64_t a1)
{
  unsigned int v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_8308(uint64_t a1, unsigned __int16 *a2)
{
  if (a2)
  {
    unsigned int v2 = a2;
    do
    {
      unsigned int v3 = *(unsigned __int16 **)v2;
      sub_8344(v2 + 8);
      operator delete(v2);
      unsigned int v2 = v3;
    }

    while (v3);
  }

void sub_8344(unsigned __int16 *a1)
{
  uint64_t v2 = *((void *)a1 + 2);
  if (v2) {
    sub_838C(v2);
  }
  if (*a1 >= 0xFu)
  {
    unsigned int v3 = (void *)*((void *)a1 + 1);
    if (v3) {
      operator delete[](v3);
    }
  }

void sub_838C(uint64_t a1)
{
  unsigned int v2 = atomic_load((unsigned int *)a1);
  if (v2 == 1)
  {
    if (*(unsigned __int16 *)(a1 + 40) >= 0xFu)
    {
      unsigned int v3 = *(void **)(a1 + 48);
      if (v3) {
        operator delete[](v3);
      }
    }

    KB::String::~String((KB::String *)(a1 + 8));
    operator delete((void *)a1);
  }

  else
  {
    do
      unsigned int v4 = __ldaxr((unsigned int *)a1);
    while (__stlxr(v4 - 1, (unsigned int *)a1));
  }

uint64_t sub_83F4(uint64_t a1)
{
  unsigned int v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_842C(int a1, void *__p)
{
  if (__p)
  {
    unsigned int v2 = __p;
    do
    {
      unsigned int v3 = (void *)*v2;
      uint64_t v4 = v2[3];
      if (v4) {
        sub_838C(v4);
      }
      operator delete(v2);
      unsigned int v2 = v3;
    }

    while (v3);
  }

void sub_846C(void ***a1)
{
  unsigned int v2 = *a1;
  if (*v2)
  {
    sub_84AC((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_84AC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 8LL)
  {
    uint64_t v5 = *(void *)(i - 8);
    uint64_t v4 = v5;
    if (v5) {
      sub_838C(v4);
    }
  }

  a1[1] = v2;
}

void sub_84F0(unsigned int *a1)
{
  unsigned int v1 = atomic_load(a1);
  if (v1 == 1)
  {
    KB::DictionaryContainer::~DictionaryContainer((KB::DictionaryContainer *)a1);
    operator delete(v2);
  }

  else
  {
    do
      unsigned int v3 = __ldaxr(a1);
    while (__stlxr(v3 - 1, a1));
  }

void *sub_8528(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  if (a2[1]) {
    uint8x8_t v8 = (KB::String *)a2[1];
  }
  else {
    uint8x8_t v8 = (KB::String *)(a2 + 2);
  }
  unsigned int v9 = KB::String::hash(v8, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v11 <= v9) {
        unint64_t v4 = v9 % v11;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v11 - 1) & v9;
    }

    BOOL v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = (void *)*i)
      {
        unint64_t v16 = i[1];
        if (v16 == v10)
        {
          if (i + 2 == a2 || (KB::String::equal((KB::String *)(i + 2), (const KB::String *)a2, 1) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }

          else
          {
            v16 &= v11 - 1;
          }

          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }

  size_t v17 = (void *)(a1 + 16);
  uint64_t i = operator new(0x38uLL);
  v28[0] = (uint64_t)i;
  v28[1] = a1 + 16;
  void *i = 0LL;
  i[1] = v10;
  KB::String::String(i + 2, *a4);
  i[6] = 0LL;
  char v29 = 1;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v19 = *(float *)(a1 + 32);
  if (!v11 || (float)(v19 * (float)v11) < v18)
  {
    BOOL v20 = 1LL;
    if (v11 >= 3) {
      BOOL v20 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v11);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    sub_6940(a1, v23);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v11 <= v10) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v11 - 1) & v10;
    }
  }

  uint64_t v24 = *(void *)a1;
  unint64_t v25 = *(void **)(*(void *)a1 + 8 * v4);
  if (v25)
  {
    void *i = *v25;
LABEL_42:
    *unint64_t v25 = i;
    goto LABEL_43;
  }

  void *i = *v17;
  void *v17 = i;
  *(void *)(v24 + 8 * v4) = v17;
  if (*i)
  {
    unint64_t v26 = *(void *)(*i + 8LL);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v26 >= v11) {
        v26 %= v11;
      }
    }

    else
    {
      v26 &= v11 - 1;
    }

    unint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_42;
  }

LABEL_43:
  v28[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_8794(v28, 0LL);
  return i;
}

void sub_8794(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16)) {
      sub_87D8((KB::String *)(v2 + 16));
    }
    operator delete((void *)v2);
  }

void sub_87D8(KB::String *this)
{
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    sub_8204(v2);
  }
  KB::String::~String(this);
}

void *sub_8804(void *a1, void *a2, unsigned int a3)
{
  if (a2[1]) {
    uint64_t v5 = (KB::String *)a2[1];
  }
  else {
    uint64_t v5 = (KB::String *)(a2 + 2);
  }
  unsigned int v6 = KB::String::hash(v5, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v7 = a1[1];
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v6;
    if (v7 <= v6) {
      unint64_t v11 = v6 % v7;
    }
  }

  else
  {
    unint64_t v11 = ((_DWORD)v7 - 1) & v6;
  }

  uint8x8_t v12 = *(void **)(*a1 + 8 * v11);
  if (!v12) {
    return 0LL;
  }
  unint64_t v13 = (void *)*v12;
  if (*v12)
  {
    do
    {
      unint64_t v14 = v13[1];
      if (v14 == v8)
      {
        if (v13 + 2 == a2 || (KB::String::equal((KB::String *)(v13 + 2), (const KB::String *)a2, 1) & 1) != 0) {
          return v13;
        }
      }

      else
      {
        if (v10 > 1)
        {
          if (v14 >= v7) {
            v14 %= v7;
          }
        }

        else
        {
          v14 &= v7 - 1;
        }

        if (v14 != v11) {
          return 0LL;
        }
      }

      unint64_t v13 = (void *)*v13;
    }

    while (v13);
  }

  return v13;
}

unsigned __int8 *sub_8918(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unsigned int v6 = (unsigned __int8 *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }

  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }

  unint64_t v10 = sub_8C28((uint64_t)v27, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }

    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }

    unint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if ((sub_9094(a1 + 32, i + 16, v6) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }

          else
          {
            v17 &= v12 - 1;
          }

          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }

  sub_8BA4(a1, v11, a4, (uint64_t)v27);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    BOOL v20 = 1LL;
    if (v12 >= 3) {
      BOOL v20 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v12);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    sub_6940(a1, v23);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }

    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }

  uint64_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    *uint64_t v24 = v27[0];
  }

  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8LL);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12) {
          v25 %= v12;
        }
      }

      else
      {
        v25 &= v12 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }

  uint64_t i = (unsigned __int8 *)v27[0];
  v27[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_9138((uint64_t)v27, 0LL);
  return i;
}

_BYTE *sub_8BA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  void *v8 = 0LL;
  v8[1] = a2;
  uint64_t result = v8 + 2;
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    uint64_t result = sub_6E24(result, *(void **)v10, *((void *)v10 + 1));
  }

  else
  {
    __int128 v11 = *v10;
    v8[4] = *((void *)v10 + 2);
    *(_OWORD *)uint64_t result = v11;
  }

  v8[5] = 0LL;
  v8[6] = 0LL;
  v8[7] = 0LL;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

unint64_t sub_8C28(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69LL
          * (v6 ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69LL * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297LL * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      unint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0LL);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273LL * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273LL * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64LL;
      }

      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297LL
          * ((0x9DDFEA08EB382D69LL
            * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69LL * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69LL
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297LL
                  * ((0x9DDFEA08EB382D69LL
                    * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69LL * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }

    else
    {
      return sub_8FD4(a2, a3);
    }
  }

  else if (a3 > 0x10)
  {
    return sub_8F28(a2, a3);
  }

  else
  {
    return sub_8E30(a2, a3);
  }

unint64_t sub_8E30(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }

    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69LL * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }

  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL
            * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }

  return result;
}

unint64_t sub_8F28(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273LL * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (v5 ^ (v4 - 0x3C5A37A36834CED9LL * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69LL
       * ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_8FD4(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9LL * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127LL * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1LL
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_9094(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0LL;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1LL;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }

  while (v9 == v11 && v14);
  return result;
}

void sub_9138(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_917C((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }

void sub_917C(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 24);
  sub_91C0(&v2);
}

void sub_91C0(void ***a1)
{
  unsigned int v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 232LL;
        sub_7AC0(v4);
      }

      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void *sub_9230(void *a1)
{
  if (*a1)
  {
    uint64_t v2 = (uint64_t *)a1[1];
    uint64_t v3 = 8LL * *a1;
    do
    {
      if (*v2) {
        sub_838C(*v2);
      }
      ++v2;
      v3 -= 8LL;
    }

    while (v3);
    *a1 = 0LL;
  }

  uint64_t v4 = (void *)a1[1];
  a1[1] = 0LL;
  a1[2] = 0LL;
  free(v4);
  return a1;
}

void sub_9290(uint64_t *a1, unint64_t a2)
{
  if (a1[2] < a2)
  {
    uint64_t v3 = a1 + 1;
    uint64_t v2 = (void *)a1[1];
    uint64_t v4 = *a1;
    a1[2] = a2;
    uint64_t v5 = malloc(8 * a2);
    uint64_t v6 = v5;
    *uint64_t v3 = v5;
    if (v5) {
      memcpy(v5, v2, 8 * v4);
    }
    if (v6 == v2)
    {
      *uint64_t v3 = 0LL;
      v3[1] = 0LL;
    }

    free(v2);
  }

uint64_t *sub_9310(uint64_t *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  void *v4 = &off_10600;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = (uint64_t)v4;
  if (a2) {
    uint64_t v5 = (void *)(a2 + 152);
  }
  else {
    uint64_t v5 = 0LL;
  }
  sub_8088((uint64_t)a1, v5, a2);
  return a1;
}

void sub_9374(std::__shared_weak_count *a1)
{
}

uint64_t sub_9388(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

void sub_93A4()
{
  v0 = objc_autoreleasePoolPush();
  __cxa_atexit((void (*)(void *))sub_3468, &unk_14758, &dword_0);
  objc_autoreleasePoolPop(v0);
}

uint64_t sub_A030(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v7 - *a1) >> 4);
    if (v10 + 1 > 0x111111111111111LL) {
      abort();
    }
    unint64_t v11 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v5 - *a1) >> 4);
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= v10 + 1) {
      uint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x88888888888888LL) {
      unint64_t v13 = 0x111111111111111LL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      BOOL v14 = (char *)sub_A988(v4, v13);
    }
    else {
      BOOL v14 = 0LL;
    }
    uint64_t v15 = v14;
    unint64_t v16 = &v14[240 * v10];
    uint64_t v18 = &v14[240 * v13];
    sub_A86C((uint64_t)v16, a2);
    uint64_t v17 = v16 + 240;
    sub_A8F8(a1, &v15);
    uint64_t v9 = a1[1];
    uint64_t result = sub_AA6C((uint64_t)&v15);
  }

  else
  {
    uint64_t result = sub_A86C(*(void *)(v4 - 8), a2);
    uint64_t v9 = v7 + 240;
  }

  a1[1] = v9;
  return result;
}

LABEL_24:
  uint64_t v18 = v24;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingDESPlugin getTopStatisticsFromResults:](v24, "getTopStatisticsFromResults:", &v32, v24));
  [v25 setObject:v19 forKeyedSubscript:@"entireSession"];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingDESPlugin getTopStatisticsFromResults:](v18, "getTopStatisticsFromResults:", &v34));
  [v25 setObject:v20 forKeyedSubscript:@"highConfSession"];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingDESPlugin getTopStatisticsFromResults:](v18, "getTopStatisticsFromResults:", &v28));
  [v25 setObject:v21 forKeyedSubscript:@"inShapeDbEntireSession"];

  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingDESPlugin getTopStatisticsFromResults:](v18, "getTopStatisticsFromResults:", &v30));
  [v25 setObject:v22 forKeyedSubscript:@"inShapeDBHighConfSession"];

  return v25;
}

uint64_t sub_A568(uint64_t a1)
{
  *(void *)a1 = off_10650;
  *(_BYTE *)(a1 + 8) = 0;
  sub_A5F0((_DWORD *)(a1 + 16));
  *(_DWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = xmmword_ED60;
  *(_DWORD *)(a1 + 144) = 1028443341;
  *(void *)(a1 + 148) = 0x300000000LL;
  *(_BYTE *)(a1 + 160) = 1;
  *(void *)(a1 + 168) = 0LL;
  *(void *)(a1 + 176) = 0xF00000002LL;
  return a1;
}

const void **sub_A5F0@<X0>(_DWORD *a1@<X8>)
{
  unsigned int v1 = a1;
  *a1 = 1050253722;
  CFTypeRef v2 = CFRetain(@"shapestore.db");
  *((void *)v1 + 2) = @"shapestore.db";
  v1 += 4;
  uint64_t v3 = (const __CFString *)TI_KB_USER_DIRECTORY(v2);
  *((void *)v1 - 1) = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v3, kCFURLPOSIXPathStyle, 1u);
  return sub_A664((const void **)v1, @"shapestore.db");
}

const void **sub_A664(const void **a1, CFTypeRef cf)
{
  CFTypeRef v3 = *a1;
  if (v3 != cf)
  {
    if (cf)
    {
      CFRetain(cf);
      CFTypeRef v3 = *a1;
    }

    if (v3) {
      CFRelease(v3);
    }
    *a1 = cf;
  }

  return a1;
}

void sub_A6B0(void **a1)
{
  unsigned int v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    uint64_t v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 232LL;
        sub_7AC0(v3);
      }

      while ((void *)v3 != v1);
      uint64_t v4 = *a1;
    }

    a1[1] = v1;
    operator delete(v4);
    *a1 = 0LL;
    a1[1] = 0LL;
    a1[2] = 0LL;
  }

void sub_A714(void ***a1)
{
  unsigned int v1 = *a1;
  CFTypeRef v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_AAB8(v4 - 240);
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

uint64_t sub_A784(uint64_t a1)
{
  *(void *)a1 = off_10650;
  sub_6FF8(a1 + 112);
  CFTypeRef v2 = *(unsigned int **)(a1 + 104);
  if (v2)
  {
    uint64_t v3 = v2 + 2;
    unsigned int v4 = atomic_load(v2 + 2);
    if (v4 == 1)
    {
      (*(void (**)(unsigned int *))(*(void *)v2 + 8LL))(v2);
    }

    else
    {
      do
        unsigned int v5 = __ldaxr(v3);
      while (__stlxr(v5 - 1, v3));
    }
  }

  unint64_t v6 = *(unsigned int **)(a1 + 96);
  if (v6)
  {
    unint64_t v7 = v6 + 2;
    unsigned int v8 = atomic_load(v6 + 2);
    if (v8 == 1)
    {
      (*(void (**)(unsigned int *))(*(void *)v6 + 40LL))(v6);
    }

    else
    {
      do
        unsigned int v9 = __ldaxr(v7);
      while (__stlxr(v9 - 1, v7));
    }
  }

  sub_6FF8(a1 + 80);
  unint64_t v10 = *(unsigned int **)(a1 + 72);
  if (v10) {
    sub_84F0(v10);
  }
  unint64_t v11 = *(const void **)(a1 + 32);
  if (v11) {
    CFRelease(v11);
  }
  *(void *)(a1 + 32) = 0LL;
  uint64_t v12 = *(const void **)(a1 + 24);
  if (v12) {
    CFRelease(v12);
  }
  *(void *)(a1 + 24) = 0LL;
  return a1;
}

uint64_t sub_A86C(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned int **)a2;
  *(void *)a1 = *(void *)a2;
  if (v4)
  {
    do
      unsigned int v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
  }

  sub_609C((void *)(a1 + 8), a2 + 8);
  sub_61A8((void *)(a1 + 32), a2 + 32);
  KB::String::String((KB::String *)(a1 + 56), (const KB::String *)(a2 + 56));
  sub_627C(a1 + 88, a2 + 88);
  KB::String::String((KB::String *)(a1 + 192), (const KB::String *)(a2 + 192));
  uint64_t v6 = *(void *)(a2 + 224);
  *(_DWORD *)(a1 + 232) = *(_DWORD *)(a2 + 232);
  *(void *)(a1 + 224) = v6;
  return a1;
}

uint64_t *sub_A8F8(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  unsigned int v5 = (uint64_t *)*result;
  unsigned int v4 = (uint64_t *)result[1];
  uint64_t v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 240LL;
    v4 -= 30;
    uint64_t result = (uint64_t *)sub_A9CC(v6, v4);
  }

  a2[1] = v6;
  uint64_t v7 = *v3;
  *uint64_t v3 = v6;
  a2[1] = v7;
  uint64_t v8 = v3[1];
  v3[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = v3[2];
  v3[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *sub_A988(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x111111111111112LL) {
    sub_619C();
  }
  return operator new(240 * a2);
}

uint64_t sub_A9CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a2 = 0LL;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
  *(void *)(a1 + 24) = a2[3];
  a2[1] = 0LL;
  a2[2] = 0LL;
  a2[3] = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(void *)(a1 + 48) = a2[6];
  a2[4] = 0LL;
  a2[5] = 0LL;
  a2[6] = 0LL;
  KB::String::String(a1 + 56, a2 + 7);
  sub_6ED4(a1 + 88, (uint64_t)(a2 + 11));
  KB::String::String(a1 + 192, a2 + 24);
  uint64_t v5 = a2[28];
  *(_DWORD *)(a1 + 232) = *((_DWORD *)a2 + 58);
  *(void *)(a1 + 224) = v5;
  return a1;
}

uint64_t sub_AA6C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 240;
    sub_AAB8(i - 240);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_AAB8(uint64_t a1)
{
  uint64_t v6 = (void **)(a1 + 168);
  sub_6F6C(&v6);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 160));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 152));
  CFTypeRef v2 = *(void **)(a1 + 104);
  if (v2)
  {
    *(void *)(a1 + 112) = v2;
    operator delete(v2);
  }

  sub_6FF8(a1 + 88);
  KB::String::~String((KB::String *)(a1 + 56));
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    *(void *)(a1 + 40) = v3;
    operator delete(v3);
  }

  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    *(void *)(a1 + 16) = v4;
    operator delete(v4);
  }

  if (*(void *)a1) {
    sub_8204(*(void *)a1);
  }
  return a1;
}

void sub_AB58(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_ABAC(a2 + 48);
    uint64_t v3 = *(unsigned int **)(a2 + 40);
    if (v3) {
      sub_84F0(v3);
    }
    sub_6FF8(a2 + 24);
    operator delete((void *)a2);
  }

uint64_t sub_ABAC(uint64_t a1)
{
  CFTypeRef v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_ABE4(uint64_t a1, void *a2)
{
  if (a2)
  {
    CFTypeRef v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      sub_87D8((KB::String *)(v2 + 2));
      operator delete(v2);
      CFTypeRef v2 = v3;
    }

    while (v3);
  }

void sub_AC20()
{
  v0 = objc_autoreleasePoolPush();
  __cxa_atexit((void (*)(void *))sub_3468, &unk_14780, &dword_0);
  objc_autoreleasePoolPop(v0);
}

TI::CP::CPEval *TI::CP::CPEval::CPEval(TI::CP::CPEval *this, NSString *a2)
{
  *(void *)this = off_10650;
  *((_BYTE *)this + 8) = 0;
  uint64_t v3 = (_DWORD *)((char *)this + 16);
  uint64_t v4 = a2;
  sub_A5F0(v3);
  *((_DWORD *)this + 10) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = xmmword_ED60;
  *((_DWORD *)this + 36) = 1028443341;
  *(void *)((char *)this + 148) = 0x300000000LL;
  *((_BYTE *)this + 160) = 1;
  *((void *)this + 21) = 0LL;
  *((void *)this + 22) = 0xF00000002LL;
  (*(void (**)(TI::CP::CPEval *, NSString *, void, double))(*(void *)this + 16LL))(this, v4, 0LL, 0.0);

  return this;
}

TI::CP::CPEval *TI::CP::CPEval::CPEval(TI::CP::CPEval *this, NSString *a2, NSString *a3, double a4)
{
  *(void *)this = off_10650;
  *((_BYTE *)this + 8) = 0;
  uint64_t v7 = (_DWORD *)((char *)this + 16);
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  sub_A5F0(v7);
  *((_DWORD *)this + 10) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = xmmword_ED60;
  *((_DWORD *)this + 36) = 1028443341;
  *(void *)((char *)this + 148) = 0x300000000LL;
  *((_BYTE *)this + 160) = 1;
  *((void *)this + 21) = 0LL;
  *((void *)this + 22) = 0xF00000002LL;
  (*(void (**)(TI::CP::CPEval *, NSString *, NSString *, double))(*(void *)this + 16LL))(this, v9, v8, a4);

  return this;
}

void TI::CP::CPEval::load_language_resources(TI::CP::CPEval *this, NSString *a2, NSString *a3, double a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  uint64_t v9 = v7;
  sub_6D78(&v77, (char *)-[NSString UTF8String](v9, "UTF8String"));
  unint64_t v10 = (void **)((char *)this + 48);
  *(_OWORD *)unint64_t v10 = v77;
  *((void *)this + 8) = v78;
  __int128 v77 = 0uLL;
  if (v8)
  {
    float v11 = a4;
    TI::CP::createAndLoadDictionaryContainerMultiLexicon((TI::CP *)v9, v8, 0LL, v11, (void ***)&v76);
    uint64_t v12 = v76;
    *(void *)&__int128 v76 = 0LL;
    unint64_t v13 = (unsigned int *)*((void *)this + 9);
    *((void *)this + 9) = v12;
    if (v13)
    {
      sub_84F0(v13);
      if ((void)v76) {
        sub_84F0((unsigned int *)v76);
      }
    }

    if (*((_BYTE *)this + 160))
    {
      TI::CP::createAndLoadLanguageModelContainer((TI::CP *)v9, v8, 0LL, v11, &v76);
      BOOL v14 = (std::__shared_weak_count *)*((void *)&v76 + 1);
      uint64_t v15 = v76;
      __int128 v77 = v76;
      unint64_t v16 = (unsigned int *)*((void *)this + 9);
      v75 = v16;
      if (v16)
      {
        do
          unsigned int v17 = __ldaxr(v16);
        while (__stlxr(v17 + 1, v16));
        BOOL v14 = (std::__shared_weak_count *)*((void *)&v77 + 1);
        uint64_t v15 = v77;
      }

      uint64_t v73 = v15;
      v74 = v14;
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          unint64_t v19 = __ldxr(p_shared_owners);
        while (__stxr(v19 + 1, p_shared_owners));
      }

      KB::NgramCandidateRefinery::create(&v75, &v73, 1LL, 1LL);
      sub_70CC((uint64_t)this + 112, &v76);
      uint64_t v20 = (std::__shared_weak_count *)*((void *)&v76 + 1);
      if (*((void *)&v76 + 1))
      {
        uint64_t v21 = (unint64_t *)(*((void *)&v76 + 1) + 8LL);
        do
          unint64_t v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }

      uint64_t v23 = v74;
      if (v74)
      {
        unint64_t v24 = (unint64_t *)&v74->__shared_owners_;
        do
          unint64_t v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }

      uint64_t v26 = v75;
      if (!v75) {
        goto LABEL_48;
      }
LABEL_47:
      sub_84F0(v26);
      goto LABEL_48;
    }

    v60 = operator new(0x28uLL);
    v60[1] = 0LL;
    v60[2] = 0LL;
    void *v60 = off_10698;
    uint64_t v61 = (unsigned int *)*((void *)this + 9);
    v60[4] = v61;
    if (v61)
    {
      do
        unsigned int v62 = __ldaxr(v61);
      while (__stlxr(v62 + 1, v61));
    }

    *(void *)&__int128 v76 = v60 + 3;
    *((void *)&v76 + 1) = v60;
    sub_70CC((uint64_t)this + 112, &v76);
    uint64_t v63 = (std::__shared_weak_count *)*((void *)&v76 + 1);
    if (*((void *)&v76 + 1))
    {
      v64 = (unint64_t *)(*((void *)&v76 + 1) + 8LL);
      do
        unint64_t v65 = __ldaxr(v64);
      while (__stlxr(v65 - 1, v64));
      goto LABEL_81;
    }
  }

  else
  {
    __createAndLoadDictionaryContainer(&v76, v9, 0LL);
    uint64_t v27 = v76;
    *(void *)&__int128 v76 = 0LL;
    uint64_t v28 = (unsigned int *)*((void *)this + 9);
    *((void *)this + 9) = v27;
    if (v28)
    {
      sub_84F0(v28);
      if ((void)v76) {
        sub_84F0((unsigned int *)v76);
      }
    }

    if (*((_BYTE *)this + 160))
    {
      TI::CP::createAndLoadLanguageModel((TI::CP *)v9, 0LL, 0LL, (uint64_t *)&v76);
      uint64_t v29 = (std::__shared_weak_count *)*((void *)&v76 + 1);
      uint64_t v30 = v76;
      __int128 v77 = v76;
      uint64_t v31 = (unsigned int *)*((void *)this + 9);
      v72 = v31;
      if (v31)
      {
        do
          unsigned int v32 = __ldaxr(v31);
        while (__stlxr(v32 + 1, v31));
        uint64_t v29 = (std::__shared_weak_count *)*((void *)&v77 + 1);
        uint64_t v30 = v77;
      }

      uint64_t v70 = v30;
      v71 = v29;
      if (v29)
      {
        uint64_t v33 = (unint64_t *)&v29->__shared_owners_;
        do
          unint64_t v34 = __ldxr(v33);
        while (__stxr(v34 + 1, v33));
      }

      KB::NgramCandidateRefinery::create(&v72, &v70, 1LL, 1LL);
      sub_70CC((uint64_t)this + 112, &v76);
      uint64_t v35 = (std::__shared_weak_count *)*((void *)&v76 + 1);
      if (*((void *)&v76 + 1))
      {
        uint64_t v36 = (unint64_t *)(*((void *)&v76 + 1) + 8LL);
        do
          unint64_t v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }

      unint64_t v38 = v71;
      if (v71)
      {
        unint64_t v39 = (unint64_t *)&v71->__shared_owners_;
        do
          unint64_t v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }

      uint64_t v26 = v72;
      if (v72) {
        goto LABEL_47;
      }
    }

    else
    {
      v66 = operator new(0x28uLL);
      v66[1] = 0LL;
      v66[2] = 0LL;
      void *v66 = off_10698;
      v67 = (unsigned int *)*((void *)this + 9);
      void v66[4] = v67;
      if (v67)
      {
        do
          unsigned int v68 = __ldaxr(v67);
        while (__stlxr(v68 + 1, v67));
      }

      *(void *)&__int128 v76 = v66 + 3;
      *((void *)&v76 + 1) = v66;
      sub_70CC((uint64_t)this + 112, &v76);
      uint64_t v63 = (std::__shared_weak_count *)*((void *)&v76 + 1);
      if (*((void *)&v76 + 1))
      {
        CGPoint v69 = (unint64_t *)(*((void *)&v76 + 1) + 8LL);
        do
          unint64_t v65 = __ldaxr(v69);
        while (__stlxr(v65 - 1, v69));
LABEL_81:
        if (!v65)
        {
          ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
          std::__shared_weak_count::__release_weak(v63);
        }
      }
    }
  }

LABEL_48:
  TI::Favonius::UnigramTypingModel::create(&v76, (char *)this + 72);
  unint64_t v41 = (unsigned int *)*((void *)this + 12);
  uint64_t v42 = v76;
  *(void *)&__int128 v76 = 0LL;
  *((void *)this + 12) = v42;
  if (v41)
  {
    uint64_t v43 = v41 + 2;
    unsigned int v44 = atomic_load(v41 + 2);
    if (v44 == 1)
    {
      (*(void (**)(unsigned int *))(*(void *)v41 + 40LL))(v41);
    }

    else
    {
      do
        unsigned int v45 = __ldaxr(v43);
      while (__stlxr(v45 - 1, v43));
    }

    if ((void)v76)
    {
      uint64_t v46 = (unsigned int *)(v76 + 8);
      unsigned int v47 = atomic_load((unsigned int *)(v76 + 8));
      if (v47 == 1)
      {
        (*(void (**)(void))(*(void *)v76 + 40LL))();
      }

      else
      {
        do
          unsigned int v48 = __ldaxr(v46);
        while (__stlxr(v48 - 1, v46));
      }
    }
  }

  TI::Favonius::UnigramCandidateGenerator::create(&v76, (char *)this + 72);
  __int128 v49 = (unsigned int *)*((void *)this + 13);
  uint64_t v50 = v76;
  *(void *)&__int128 v76 = 0LL;
  *((void *)this + 13) = v50;
  if (v49)
  {
    uint64_t v51 = v49 + 2;
    unsigned int v52 = atomic_load(v49 + 2);
    if (v52 == 1)
    {
      (*(void (**)(unsigned int *))(*(void *)v49 + 8LL))(v49);
    }

    else
    {
      do
        unsigned int v53 = __ldaxr(v51);
      while (__stlxr(v53 - 1, v51));
    }

    if ((void)v76)
    {
      __int128 v54 = (unsigned int *)(v76 + 8);
      unsigned int v55 = atomic_load((unsigned int *)(v76 + 8));
      if (v55 == 1)
      {
        (*(void (**)(void))(*(void *)v76 + 8LL))();
      }

      else
      {
        do
          unsigned int v56 = __ldaxr(v54);
        while (__stlxr(v56 - 1, v54));
      }
    }
  }

  sub_B374((void *)this + 10, (uint64_t *)&v77);
  uint64_t v57 = (std::__shared_weak_count *)*((void *)&v77 + 1);
  if (*((void *)&v77 + 1))
  {
    uint64_t v58 = (unint64_t *)(*((void *)&v77 + 1) + 8LL);
    do
      unint64_t v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
}

void *sub_B374(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3)
  {
    uint64_t v5 = (unint64_t *)(v3 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  uint64_t v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return a1;
}

id TI::CP::CPEval::is_match(TI::CP::CPEval *this, const KB::Candidate *a2, const KB::String *a3)
{
  if (*((_DWORD *)this + 39))
  {
    sub_D610((uint64_t)&v19, *((void *)a2 + 1) + 240LL * *(void *)a2 - 240);
    sub_B5E0(v22, &v19);
    KB::Candidate::~Candidate((KB::Candidate *)&v19);
  }

  int v6 = *((_DWORD *)this + 44);
  if (!v6)
  {
    KB::Candidate::capitalized_string((KB::Candidate *)v22);
    if (&v19 == (uint64_t *)a3)
    {
      id v9 = &dword_0 + 1;
      goto LABEL_10;
    }

    uint64_t v8 = (void *)KB::String::equal(a3, (const KB::String *)&v19, 1);
LABEL_9:
    id v9 = v8;
LABEL_10:
    KB::String::~String((KB::String *)&v19);
    goto LABEL_23;
  }

  if (v6 != 1)
  {
    if (v6 != 2)
    {
      id v9 = 0LL;
      goto LABEL_23;
    }

    uint64_t v7 = (KB::CollatorWrapper *)(*(void *)(*((void *)this + 9) + 8LL) + 72LL);
    KB::Candidate::capitalized_string((KB::Candidate *)v22);
    uint64_t v8 = (void *)KB::CollatorWrapper::sortkey_equal_strings(v7, (const KB::String *)&v19, a3);
    goto LABEL_9;
  }

  unint64_t v10 = (char *)*((void *)a3 + 1);
  if (!v10) {
    unint64_t v10 = (char *)a3 + 16;
  }
  if (*(_WORD *)a3) {
    float v11 = v10;
  }
  else {
    float v11 = &unk_EE22;
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);

  KB::Candidate::capitalized_string((KB::Candidate *)v22);
  BOOL v14 = v20;
  if (!v20) {
    BOOL v14 = &v21;
  }
  if ((_WORD)v19) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = (uint64_t *)&unk_EE22;
  }
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lowercaseString]);

  KB::String::~String((KB::String *)&v19);
  id v9 = [v13 isEqualToString:v17];

LABEL_23:
  KB::Candidate::~Candidate((KB::Candidate *)v22);
  return v9;
}

uint64_t *sub_B5E0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  *a2 = v4;
  sub_D6C8(a1 + 1, a2 + 1);
  __int128 v5 = *(_OWORD *)(a2 + 93);
  __int128 v6 = *(_OWORD *)(a2 + 95);
  a1[97] = a2[97];
  *(_OWORD *)(a1 + 93) = v5;
  *(_OWORD *)(a1 + 95) = v6;
  sub_7050((uint64_t)(a1 + 98), (uint64_t)(a2 + 98));
  KB::String::operator=(a1 + 111, a2 + 111);
  uint64_t v7 = (void **)(a1 + 115);
  __int128 v8 = *(_OWORD *)(a2 + 115);
  a1[117] = a2[117];
  *(_OWORD *)uint64_t v7 = v8;
  *((_BYTE *)a2 + 943) = 0;
  *((_BYTE *)a2 + 920) = 0;
  KB::ByteString::operator=(a1 + 118, a2 + 118);
  *((_OWORD *)a1 + 60) = *((_OWORD *)a2 + 60);
  id v9 = (const void *)a1[122];
  if (v9) {
    CFRelease(v9);
  }
  a1[122] = 0LL;
  uint64_t v10 = a2[122];
  a2[122] = 0LL;
  a1[122] = v10;
  float v11 = (const void *)a1[123];
  if (v11) {
    CFRelease(v11);
  }
  a1[123] = 0LL;
  uint64_t v12 = a2[123];
  a2[123] = 0LL;
  a1[123] = v12;
  *((_DWORD *)a1 + 248) = *((_DWORD *)a2 + 248);
  return a1;
}

uint64_t TI::CP::CPEval::match_index(TI::CP::CPEval *this, const KB::String *a2, const KB::Candidate **a3)
{
  __int128 v5 = *a3;
  __int128 v6 = a3[1];
  KB::String::String((KB::String *)v8, a2);
  id v9 = this;
  if (v5 != v6)
  {
    while ((TI::CP::CPEval::is_match(v9, v5, (const KB::String *)v8) & 1) == 0)
    {
      __int128 v5 = (const KB::Candidate *)((char *)v5 + 1000);
      if (v5 == v6)
      {
        __int128 v5 = v6;
        break;
      }
    }
  }

  KB::String::~String((KB::String *)v8);
  if (v5 == a3[1]) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 652835029 * ((unint64_t)(v5 - *a3) >> 3);
  }
}

void TI::CP::CPEval::create_recognizer_for_config( const std::string *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = 0LL;
  switch(a2)
  {
    case 0:
      uint64_t v7 = operator new(0x250uLL);
      data = (unsigned int *)a1[4].__r_.__value_.__l.__data_;
      v83 = data;
      if (data)
      {
        id v9 = data + 2;
        do
          unsigned int v10 = __ldaxr(v9);
        while (__stlxr(v10 + 1, v9));
      }

      size = (unsigned int *)a1[4].__r_.__value_.__l.__size_;
      v82 = size;
      if (size)
      {
        uint64_t v12 = size + 2;
        do
          unsigned int v13 = __ldaxr(v12);
        while (__stlxr(v13 + 1, v12));
      }

      uint64_t v74 = 1LL;
      uint64_t v76 = 0LL;
      memset(&v81[24], 0, 24);
      v73[0] = (void *)0x402E000000000000LL;
      v73[1] = &dword_0 + 1;
      uint64_t v75 = 0x3FD3333333333333LL;
      *(_DWORD *)&v81[36] = 0;
      *(_OWORD *)__int128 v77 = 0u;
      __int128 v78 = 0u;
      *(_OWORD *)v79 = 0u;
      *(_OWORD *)v80 = 0u;
      memset(v81, 0, 33);
      uint64_t v14 = TI::CP::Search::Search(v7, &v83, &v82, v73);
      uint64_t v15 = (_OWORD *)*a4;
      *a4 = v14;
      if (v15) {
        (*(void (**)(_OWORD *))(*(void *)v15 + 8LL))(v15);
      }
      if (*(void *)&v81[8])
      {
        *(void *)&v81[16] = *(void *)&v81[8];
        operator delete(*(void **)&v81[8]);
      }

      if (v80[0])
      {
        v80[1] = v80[0];
        operator delete(v80[0]);
      }

      if (*((void *)&v78 + 1))
      {
        v79[0] = *((void **)&v78 + 1);
        operator delete(*((void **)&v78 + 1));
      }

      if (v77[0])
      {
        v77[1] = v77[0];
        operator delete(v77[0]);
      }

      if (v82)
      {
        unint64_t v16 = v82 + 2;
        unsigned int v17 = atomic_load(v82 + 2);
        if (v17 == 1)
        {
          (*(void (**)(void))(*(void *)v82 + 8LL))();
        }

        else
        {
          do
            unsigned int v18 = __ldaxr(v16);
          while (__stlxr(v18 - 1, v16));
        }
      }

      if (v83)
      {
        uint64_t v19 = v83 + 2;
        unsigned int v20 = atomic_load(v83 + 2);
        if (v20 == 1)
        {
          (*(void (**)(void))(*(void *)v83 + 40LL))();
        }

        else
        {
          do
            unsigned int v21 = __ldaxr(v19);
          while (__stlxr(v21 - 1, v19));
        }
      }

      unint64_t v22 = (_OWORD *)*a4;
      __int128 v23 = *(_OWORD *)(a3 + 216);
      v22[27] = *(_OWORD *)(a3 + 200);
      v22[28] = v23;
      __int128 v24 = *(_OWORD *)(a3 + 248);
      __int128 v25 = *(_OWORD *)(a3 + 280);
      __int128 v26 = *(_OWORD *)(a3 + 232);
      v22[31] = *(_OWORD *)(a3 + 264);
      _BYTE v22[32] = v25;
      v22[29] = v26;
      v22[30] = v24;
      __int128 v27 = *(_OWORD *)(a3 + 344);
      __int128 v29 = *(_OWORD *)(a3 + 296);
      __int128 v28 = *(_OWORD *)(a3 + 312);
      v22[35] = *(_OWORD *)(a3 + 328);
      v22[36] = v27;
      v22[33] = v29;
      v22[34] = v28;
      goto LABEL_68;
    case 1:
      uint64_t v30 = operator new(0x120uLL);
      std::string::pointer v31 = a1[4].__r_.__value_.__l.__data_;
      std::string::pointer v84 = v31;
      if (v31)
      {
        unsigned int v32 = (unsigned int *)(v31 + 8);
        do
          unsigned int v33 = __ldaxr(v32);
        while (__stlxr(v33 + 1, v32));
        uint64_t v34 = *a4;
      }

      else
      {
        uint64_t v34 = 0LL;
      }

      LOBYTE(v73[0]) = 0;
      LOBYTE(v75) = 0;
      *a4 = TI::TIInputRecognizer::TIInputRecognizer(v30, 0LL, &v84, &a1[2], v73);
      if (v34) {
        (*(void (**)(uint64_t))(*(void *)v34 + 8LL))(v34);
      }
      if ((_BYTE)v75 && SHIBYTE(v74) < 0) {
        operator delete(v73[0]);
      }
      std::string::pointer v35 = v84;
      if (!v84) {
        break;
      }
      uint64_t v36 = (unsigned int *)(v84 + 8);
      unsigned int v37 = atomic_load((unsigned int *)v84 + 2);
      if (v37 == 1) {
        goto LABEL_65;
      }
      do
        unsigned int v38 = __ldaxr(v36);
      while (__stlxr(v38 - 1, v36));
      break;
    case 2:
      unint64_t v39 = operator new(0x150uLL);
      unint64_t v22 = (_OWORD *)sub_D788((uint64_t)v39);
      *a4 = (uint64_t)v22;
      goto LABEL_68;
    case 3:
      unint64_t v40 = (__int128 *)(a3 + 104);
      std::string::operator=((std::string *)(a3 + 104), a1 + 2);
      unint64_t v41 = operator new(0x280uLL);
      std::string::pointer v42 = a1[4].__r_.__value_.__l.__data_;
      std::string::pointer v72 = v42;
      if (v42)
      {
        uint64_t v43 = (unsigned int *)(v42 + 8);
        do
          unsigned int v44 = __ldaxr(v43);
        while (__stlxr(v44 + 1, v43));
      }

      unsigned int v45 = (unsigned int *)a1[4].__r_.__value_.__l.__size_;
      v71 = v45;
      if (v45)
      {
        uint64_t v46 = v45 + 2;
        do
          unsigned int v47 = __ldaxr(v46);
        while (__stlxr(v47 + 1, v46));
      }

      __int128 v48 = *(_OWORD *)(a3 + 80);
      v85[4] = *(_OWORD *)(a3 + 64);
      v85[5] = v48;
      uint64_t v86 = *(void *)(a3 + 96);
      __int128 v49 = *(_OWORD *)(a3 + 16);
      v85[0] = *(_OWORD *)a3;
      v85[1] = v49;
      __int128 v50 = *(_OWORD *)(a3 + 48);
      v85[2] = *(_OWORD *)(a3 + 32);
      v85[3] = v50;
      if (*(char *)(a3 + 127) < 0)
      {
        sub_6E24(&v87, *(void **)(a3 + 104), *(void *)(a3 + 112));
      }

      else
      {
        __int128 v87 = *v40;
        uint64_t v88 = *(void *)(a3 + 120);
      }

      if (*(char *)(a3 + 151) < 0)
      {
        sub_6E24(&v89, *(void **)(a3 + 128), *(void *)(a3 + 136));
      }

      else
      {
        __int128 v89 = *(_OWORD *)(a3 + 128);
        uint64_t v90 = *(void *)(a3 + 144);
      }

      __int16 v91 = *(_WORD *)(a3 + 152);
      char v92 = *(_BYTE *)(a3 + 154);
      KB::String::String((KB::String *)v93, (const KB::String *)(a3 + 160));
      __int128 v51 = *(_OWORD *)(a3 + 336);
      v93[10] = *(_OWORD *)(a3 + 320);
      v93[11] = v51;
      uint64_t v94 = *(void *)(a3 + 352);
      __int128 v52 = *(_OWORD *)(a3 + 272);
      v93[6] = *(_OWORD *)(a3 + 256);
      v93[7] = v52;
      __int128 v53 = *(_OWORD *)(a3 + 304);
      v93[8] = *(_OWORD *)(a3 + 288);
      v93[9] = v53;
      __int128 v54 = *(_OWORD *)(a3 + 208);
      v93[2] = *(_OWORD *)(a3 + 192);
      v93[3] = v54;
      __int128 v55 = *(_OWORD *)(a3 + 240);
      v93[4] = *(_OWORD *)(a3 + 224);
      v93[5] = v55;
      TI::CP::TIPathRecognizerEnsemble::TIPathRecognizerEnsemble(v41, &v72, &v71, v85);
      uint64_t v56 = *a4;
      *a4 = (uint64_t)v41;
      if (v56) {
        (*(void (**)(uint64_t))(*(void *)v56 + 8LL))(v56);
      }
      KB::String::~String((KB::String *)v93);
      if (SHIBYTE(v90) < 0) {
        operator delete((void *)v89);
      }
      if (SHIBYTE(v88) < 0) {
        operator delete((void *)v87);
      }
      if (v71)
      {
        uint64_t v57 = v71 + 2;
        unsigned int v58 = atomic_load(v71 + 2);
        if (v58 == 1)
        {
          (*(void (**)(void))(*(void *)v71 + 8LL))();
        }

        else
        {
          do
            unsigned int v59 = __ldaxr(v57);
          while (__stlxr(v59 - 1, v57));
        }
      }

      std::string::pointer v35 = v72;
      if (!v72) {
        break;
      }
      v60 = (unsigned int *)(v72 + 8);
      unsigned int v61 = atomic_load((unsigned int *)v72 + 2);
      if (v61 == 1)
      {
LABEL_65:
        (*(void (**)(std::string::pointer))(*(void *)v35 + 40LL))(v35);
      }

      else
      {
        do
          unsigned int v62 = __ldaxr(v60);
        while (__stlxr(v62 - 1, v60));
      }

      break;
    default:
      return;
  }

  unint64_t v22 = (_OWORD *)*a4;
  if (*a4)
  {
LABEL_68:
    std::string::pointer v63 = a1[5].__r_.__value_.__l.__data_;
    std::string::size_type cap = a1[4].__r_.__value_.__l.__cap_;
    uint64_t v70 = (std::__shared_weak_count *)v63;
    if (v63)
    {
      v64 = (unint64_t *)(v63 + 8);
      do
        unint64_t v65 = __ldxr(v64);
      while (__stxr(v65 + 1, v64));
    }

    (*(void (**)(_OWORD *, std::string::size_type *))(*(void *)v22 + 112LL))(v22, &cap);
    v66 = v70;
    if (v70)
    {
      p_shared_owners = (unint64_t *)&v70->__shared_owners_;
      do
        unint64_t v68 = __ldaxr(p_shared_owners);
      while (__stlxr(v68 - 1, p_shared_owners));
      if (!v68)
      {
        ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
        std::__shared_weak_count::__release_weak(v66);
      }
    }
  }

void TI::CP::CPEval::evaluate_records( const std::string *a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = 0LL;
  *(void *)(a5 + 8) = 0LL;
  *(void *)(a5 + 16) = 0LL;
  *(_DWORD *)(a5 + 24) = -1;
  unsigned int v10 = objc_autoreleasePoolPush();
  __int128 v11 = *(_OWORD *)(a4 + 80);
  v32[4] = *(_OWORD *)(a4 + 64);
  v32[5] = v11;
  uint64_t v33 = *(void *)(a4 + 96);
  __int128 v12 = *(_OWORD *)(a4 + 16);
  v32[0] = *(_OWORD *)a4;
  v32[1] = v12;
  __int128 v13 = *(_OWORD *)(a4 + 48);
  v32[2] = *(_OWORD *)(a4 + 32);
  v32[3] = v13;
  if (*(char *)(a4 + 127) < 0)
  {
    sub_6E24(&v34, *(void **)(a4 + 104), *(void *)(a4 + 112));
  }

  else
  {
    __int128 v34 = *(_OWORD *)(a4 + 104);
    uint64_t v35 = *(void *)(a4 + 120);
  }

  if (*(char *)(a4 + 151) < 0)
  {
    sub_6E24(&__p, *(void **)(a4 + 128), *(void *)(a4 + 136));
  }

  else
  {
    __int128 __p = *(_OWORD *)(a4 + 128);
    uint64_t v37 = *(void *)(a4 + 144);
  }

  __int16 v38 = *(_WORD *)(a4 + 152);
  char v39 = *(_BYTE *)(a4 + 154);
  KB::String::String((KB::String *)v40, (const KB::String *)(a4 + 160));
  __int128 v14 = *(_OWORD *)(a4 + 336);
  v40[10] = *(_OWORD *)(a4 + 320);
  v40[11] = v14;
  uint64_t v41 = *(void *)(a4 + 352);
  __int128 v15 = *(_OWORD *)(a4 + 272);
  v40[6] = *(_OWORD *)(a4 + 256);
  v40[7] = v15;
  __int128 v16 = *(_OWORD *)(a4 + 304);
  v40[8] = *(_OWORD *)(a4 + 288);
  v40[9] = v16;
  __int128 v17 = *(_OWORD *)(a4 + 208);
  v40[2] = *(_OWORD *)(a4 + 192);
  v40[3] = v17;
  __int128 v18 = *(_OWORD *)(a4 + 240);
  v40[4] = *(_OWORD *)(a4 + 224);
  v40[5] = v18;
  TI::CP::CPEval::create_recognizer_for_config(a1, a3, (uint64_t)v32, (uint64_t *)&v23);
  KB::String::~String((KB::String *)v40);
  if (SHIBYTE(v37) < 0) {
    operator delete((void *)__p);
  }
  if (SHIBYTE(v35) < 0) {
    operator delete((void *)v34);
  }
  uint64_t v19 = v23;
  if (v23)
  {
    uint64_t v20 = *a2;
    if (a2[1] != *a2)
    {
      uint64_t v21 = 0LL;
      unint64_t v22 = 0LL;
      do
      {
        TI::CP::CPEval::evaluate_test_case((uint64_t)a1, v20 + v21, v19, v22, (uint64_t)v25);
        sub_4C80((uint64_t *)a5, (uint64_t)v25);
        sub_7B38((uint64_t)v31, v31[1]);
        __int128 v24 = (void **)&v30;
        sub_7B80(&v24);
        __int128 v24 = (void **)&v29;
        sub_7B80(&v24);
        __int128 v24 = (void **)&v28;
        sub_7B80(&v24);
        __int128 v24 = (void **)&v27;
        sub_7B80(&v24);
        KB::String::~String((KB::String *)&v26);
        ++v22;
        uint64_t v20 = *a2;
        v21 += 240LL;
      }

      while (0xEEEEEEEEEEEEEEEFLL * ((a2[1] - *a2) >> 4) > v22);
    }

    if (a3 == 2) {
      *(_DWORD *)(a5 + 24) = TI::CP::ShapeStore::num_records((TI::CP::ShapeStore *)(v19 + 26));
    }
    (*(void (**)(void *))(*v19 + 8LL))(v19);
  }

  objc_autoreleasePoolPop(v10);
}

void TI::CP::CPEval::evaluate_test_case( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  *(_DWORD *)(a1 + 156) = 0;
  if (*(_BYTE *)(a1 + 160))
  {
    (*(void (**)(void *, uint64_t))(*a3 + 120LL))(a3, a2 + 88);
  }

  else
  {
    uint64_t v43 = 0LL;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    *(_OWORD *)__int128 __p = 0u;
    __int128 v38 = 0u;
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v41);
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)((char *)&v41 + 8));
    __int128 v42 = 0uLL;
    uint64_t v43 = 0LL;
    (*(void (**)(void *, void **))(*a3 + 120LL))(a3, __p);
    unsigned int v44 = (void **)&v42;
    sub_6F6C(&v44);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)((char *)&v41 + 8));
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v41);
    if ((void)v38)
    {
      *((void *)&v38 + 1) = v38;
      operator delete((void *)v38);
    }

    __int128 v24 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      __int128 v25 = (unint64_t *)((char *)__p[1] + 8);
      do
        unint64_t v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
  }

  id v9 = *(unsigned int **)a2;
  uint64_t v36 = v9;
  if (v9)
  {
    do
      unsigned int v10 = __ldaxr(v9);
    while (__stlxr(v10 + 1, v9));
  }

  sub_C4C4(a3, &v36);
  if (v36) {
    sub_8204((uint64_t)v36);
  }
  if ((*(unsigned int (**)(void *))(*a3 + 16LL))(a3) == 2)
  {
    __int128 v11 = *(char **)(a2 + 64);
    if (!v11) {
      __int128 v11 = (char *)(a2 + 72);
    }
    if (*(_WORD *)(a2 + 56)) {
      __int128 v12 = v11;
    }
    else {
      __int128 v12 = (char *)&unk_EE22;
    }
    sub_6D78(__p, v12);
    int v13 = TI::CP::ShapeStore::shape_count_for_word(a3 + 26, __p);
    if (SBYTE7(v38) < 0) {
      operator delete(__p[0]);
    }
    BOOL v33 = v13 > 0;
  }

  else
  {
    BOOL v33 = 0;
  }

  uint64_t v35 = a5;
  uint64_t v14 = *(void *)(a2 + 8);
  uint64_t v15 = *(void *)(a2 + 16) - v14;
  if (v15)
  {
    unint64_t v16 = 0LL;
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * (v15 >> 4);
    double v18 = INFINITY;
    unsigned int v19 = 1;
    double v20 = INFINITY;
    while (1)
    {
      if (v17 == v19) {
        unsigned int v21 = 2;
      }
      else {
        unsigned int v21 = 1;
      }
      if (v19 == 1) {
        uint64_t v22 = 0LL;
      }
      else {
        uint64_t v22 = v21;
      }
      (*(void (**)(void *, uint64_t, void, double, double, double, double))(*a3 + 32LL))( a3,  v22,  0LL,  *(double *)(v14 + 48 * v16),  *(double *)(v14 + 48 * v16 + 8),  *(double *)(v14 + 48 * v16 + 16),  *(double *)(v14 + 48 * v16 + 24));
      if (!*(_BYTE *)(a1 + 8)) {
        goto LABEL_34;
      }
      HIDWORD(v43) = 0;
      *(_OWORD *)__int128 __p = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      (*(void (**)(void *, void **, void))(*a3 + 80LL))(a3, __p, *(unsigned int *)(a1 + 40));
      int matched = TI::CP::CPEval::match_index( (TI::CP::CPEval *)a1,  (const KB::String *)(a2 + 56),  (const KB::Candidate **)__p);
      if (matched != -1)
      {
        if (!matched)
        {
          if (fabs(v18) == INFINITY) {
            double v18 = *(double *)(v14 + 48 * v16 + 32);
          }
LABEL_31:
          if (fabs(v20) == INFINITY) {
            double v20 = *(double *)(v14 + 48 * v16 + 32);
          }
          goto LABEL_33;
        }

        if (matched <= 2) {
          goto LABEL_31;
        }
      }

LABEL_33:
      unsigned int v44 = (void **)&v41 + 1;
      sub_7B80(&v44);
      unsigned int v44 = (void **)&v40;
      sub_7B80(&v44);
      unsigned int v44 = (void **)&v38 + 1;
      sub_7B80(&v44);
      unsigned int v44 = __p;
      sub_7B80(&v44);
LABEL_34:
      unint64_t v16 = v19;
      uint64_t v14 = *(void *)(a2 + 8);
      unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 16) - v14) >> 4);
      ++v19;
      if (v17 <= v16) {
        goto LABEL_44;
      }
    }
  }

  double v20 = INFINITY;
  double v18 = INFINITY;
LABEL_44:
  HIDWORD(v43) = 0;
  *(_OWORD *)__int128 __p = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  (*(void (**)(void *, void **, void))(*a3 + 80LL))(a3, __p, *(unsigned int *)(a1 + 40));
  uint64_t v27 = *(void *)(a1 + 112);
  if (v27)
  {
    (*(void (**)(uint64_t, void **, void))(*(void *)v27 + 64LL))(v27, __p, 0LL);
    uint64_t v28 = *(void *)(a1 + 112);
    v45[0] = &off_106D0;
    uint64_t v46 = v45;
    (*(void (**)(uint64_t, void **, void *))(*(void *)v28 + 56LL))(v28, __p, v45);
    uint64_t v29 = v46;
    if (v46 == v45)
    {
      uint64_t v30 = 4LL;
      uint64_t v29 = v45;
    }

    else
    {
      if (!v46)
      {
LABEL_50:
        KB::CandidateCollection::normalize_scores((KB::CandidateCollection *)__p);
        goto LABEL_51;
      }

      uint64_t v30 = 5LL;
    }

    (*(void (**)(void))(*v29 + 8 * v30))();
    goto LABEL_50;
  }

LABEL_51:
  TI::ConfidenceModel::update_confidence_for_candidates( (TI::ConfidenceModel *)(a1 + 128),  (KB::CandidateCollection *)__p);
  TI::CP::CPEval::compose_result_from_candidates( (KB::DictionaryContainer **)a1,  (const KB::Candidate **)__p,  (const ContinuousPathTestCase *)a2,  a4,  v35);
  uint64_t v31 = *(void *)(a2 + 16);
  if (*(void *)(a2 + 8) == v31) {
    uint64_t v32 = 0LL;
  }
  else {
    uint64_t v32 = *(void *)(v31 - 16);
  }
  *(void *)(v35 + 152) = v32;
  *(double *)(v35 + 160) = v18;
  *(double *)(v35 + 168) = v20;
  *(_BYTE *)(v35 + 220) = v33;
  *(_DWORD *)(v35 + 224) = (*(uint64_t (**)(void *))(*a3 + 24LL))(a3);
  unsigned int v44 = (void **)&v41 + 1;
  sub_7B80(&v44);
  unsigned int v44 = (void **)&v40;
  sub_7B80(&v44);
  unsigned int v44 = (void **)&v38 + 1;
  sub_7B80(&v44);
  unsigned int v44 = __p;
  sub_7B80(&v44);
}

uint64_t sub_C4C4(void *a1, unsigned int **a2)
{
  uint64_t result = a1[1];
  uint64_t v4 = *a2;
  if ((unsigned int *)result != *a2)
  {
    if (v4)
    {
      do
        unsigned int v5 = __ldaxr(v4);
      while (__stlxr(v5 + 1, v4));
      uint64_t result = a1[1];
    }

    a1[1] = v4;
    if (result) {
      sub_8204(result);
    }
    return (*(uint64_t (**)(void *))(*a1 + 152LL))(a1);
  }

  return result;
}

void TI::CP::CPEval::compose_result_from_candidates( KB::DictionaryContainer **this@<X0>, const KB::Candidate **a2@<X1>, const ContinuousPathTestCase *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  unsigned int v10 = (const KB::String *)((char *)a3 + 56);
  unsigned int matched = TI::CP::CPEval::match_index((TI::CP::CPEval *)this, (const KB::String *)((char *)a3 + 56), a2);
  __int128 v12 = this[9];
  if (v12)
  {
    KB::DictionaryContainer::lookup(&v27, v12, v10, 1, 1);
    uint64_t v13 = v27;
    uint64_t v14 = v28;
    if (v27 == v28)
    {
      char v16 = 0;
    }

    else
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      __int128 v23 = sub_C738;
      __int128 v24 = &unk_10668;
      __int128 v25 = (TI::CP::CPEval *)this;
      unint64_t v26 = a3;
      uint64_t v15 = v22;
      do
      {
        char v16 = (uint64_t)v23((uint64_t)v15, v13);
        if ((v16 & 1) != 0) {
          break;
        }
        v13 += 240LL;
      }

      while (v13 != v14);
    }

    uint64_t v29 = (void **)&v27;
    sub_D81C(&v29);
  }

  else
  {
    char v16 = 1;
  }

  TI::CP::ContinuousPathTestResult::ContinuousPathTestResult( (TI::CP::ContinuousPathTestResult *)a5,  a4,  v10,  (const KB::CandidateCollection *)a2,  matched,  v16);
  if ((matched & 0x80000000) != 0)
  {
    if (*a2 != a2[1])
    {
      float v20 = expf(*((float *)*a2 + 186));
      *(double *)(a5 + 208) = logf(v20);
    }

    goto LABEL_16;
  }

  unint64_t v17 = *a2;
  float v18 = expf(*((float *)*a2 + 250 * matched + 186));
  *(double *)(a5 + 200) = logf(v18);
  if (matched)
  {
    float v19 = expf(*((float *)v17 + 186));
    *(double *)(a5 + 208) = logf(v19);
    if (matched <= 3) {
      goto LABEL_20;
    }
LABEL_16:
    if (*((_DWORD *)a2 + 24) != 2)
    {
      *(_BYTE *)(a5 + 219) = 1;
      return;
    }

    goto LABEL_22;
  }

  if ((unint64_t)(0x1CAC083126E978D5LL * ((a2[1] - v17) >> 3)) >= 2)
  {
    float v21 = expf(*((float *)v17 + 436));
    *(double *)(a5 + 208) = logf(v21);
  }

LABEL_20:
  if (*((_DWORD *)a2 + 24) == 2)
  {
    *(_BYTE *)(a5 + 218) = 1;
    return;
  }

LABEL_22:
  *(_BYTE *)(a5 + 217) = 1;
}

id sub_C738(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(TI::CP::CPEval **)(a1 + 32);
  sub_D610((uint64_t)v6, a2);
  id v4 = TI::CP::CPEval::is_match(v3, (const KB::Candidate *)v6, (const KB::String *)(*(void *)(a1 + 40) + 56LL));
  KB::Candidate::~Candidate((KB::Candidate *)v6);
  return v4;
}

void TI::CP::CPEval::evaluate_test_case_favonius( TI::CP::CPEval *this@<X0>, const ContinuousPathTestCase *a2@<X1>, TI::Favonius::FavoniusStrokeBuildManager *a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X8>)
{
  *((_DWORD *)this + 39) = 1;
  uint64_t v8 = *((void *)a2 + 1);
  uint64_t v9 = *((void *)a2 + 2) - v8;
  if (v9)
  {
    unint64_t v10 = 0LL;
    int v11 = 0;
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (v9 >> 4);
    do
    {
      uint64_t v13 = (double *)(v8 + 48 * v10);
      unint64_t v10 = (v11 + 1);
      if (v12 == v10) {
        unsigned int v14 = 5;
      }
      else {
        unsigned int v14 = 4;
      }
      if (v12 == v10) {
        unsigned int v15 = 2;
      }
      else {
        unsigned int v15 = 1;
      }
      if (v11) {
        uint64_t v16 = v14;
      }
      else {
        uint64_t v16 = 1LL;
      }
      if (v11) {
        uint64_t v17 = v15;
      }
      else {
        uint64_t v17 = 0LL;
      }
      float v18 = v13[5];
      TI::Favonius::Touch::create(v39, a4 % 0xA, 0LL, a2, v17, v16, *v13, v13[1], v18, v13[2]);
      float v19 = (unsigned int *)v39[0];
      if (v11 && v12 == v10)
      {
        __int128 v34 = v39[0];
        if (v39[0])
        {
          do
            unsigned int v20 = __ldaxr(v19);
          while (__stlxr(v20 + 1, v19));
        }

        (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *, void ***, uint64_t, void))(*(void *)a3 + 32LL))( a3,  &v34,  4294967294LL,  0LL);
        float v21 = (unsigned int *)v34;
        if (!v34) {
          goto LABEL_25;
        }
      }

      else
      {
        uint64_t v35 = v39[0];
        if (v39[0])
        {
          do
            unsigned int v22 = __ldaxr(v19);
          while (__stlxr(v22 + 1, v19));
        }

        (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *, void **, uint64_t, void))(*(void *)a3 + 24LL))( a3,  &v35,  4294967294LL,  0LL);
        float v21 = (unsigned int *)v35;
        if (!v35) {
          goto LABEL_25;
        }
      }

      sub_D984(v21);
LABEL_25:
      if (v19) {
        sub_D984(v19);
      }
      uint64_t v8 = *((void *)a2 + 1);
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)a2 + 2) - v8) >> 4);
      ++v11;
    }

    while (v12 > v10);
  }

  KB::String::String((KB::String *)v42);
  uint64_t v23 = *((unsigned int *)this + 45);
  v40[0] = &off_10718;
  __int128 v41 = v40;
  (*(void (**)(const KB::Candidate **__return_ptr, TI::Favonius::FavoniusStrokeBuildManager *, char *, char *, uint64_t, _BYTE *, uint64_t, void *, void))(*(void *)a3 + 72LL))( v30,  a3,  (char *)a2 + 192,  (char *)a2 + 88,  v23,  v42,  5LL,  v40,  0LL);
  __int128 v24 = v41;
  if (v41 == v40)
  {
    uint64_t v25 = 4LL;
    __int128 v24 = v40;
  }

  else
  {
    if (!v41) {
      goto LABEL_33;
    }
    uint64_t v25 = 5LL;
  }

  (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_33:
  if (v30[1] != v30[0])
  {
    sub_66F8((uint64_t)v39, (uint64_t)v30[0]);
    KB::Candidate::capitalized_string((KB::Candidate *)v39);
    KB::String::String((KB::String *)v37);
    KB::String::String((KB::String *)v36);
    uint64_t v26 = KB::Candidate::string((KB::Candidate *)v39);
    (*(void (**)(void **__return_ptr, TI::Favonius::FavoniusStrokeBuildManager *, _BYTE *, _BYTE *, _BYTE *, void, uint64_t, uint64_t))(*(void *)a3 + 104LL))( __p,  a3,  v38,  v37,  v36,  0LL,  v26,  1LL);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    KB::String::~String((KB::String *)v36);
    KB::String::~String((KB::String *)v37);
    KB::String::~String((KB::String *)v38);
    KB::Candidate::~Candidate((KB::Candidate *)v39);
  }

  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)this, v30, a2, a4, a5);
  v39[0] = (void **)&v33;
  sub_7B80(v39);
  v39[0] = (void **)&v32;
  sub_7B80(v39);
  v39[0] = (void **)&v31;
  sub_7B80(v39);
  v39[0] = (void **)v30;
  sub_7B80(v39);
  KB::String::~String((KB::String *)v42);
}

void TI::CP::CPEval::evaluate_test_case_input_manager( TI::CP::CPEval *this@<X0>, const ContinuousPathTestCase *a2@<X1>, TIInputManager *a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X8>)
{
  *((_DWORD *)this + 39) = 2;
  TIInputManager::clear_continuous_path(a3);
  uint64_t v7 = *(unsigned int **)a2;
  uint64_t v25 = v7;
  if (v7)
  {
    do
      unsigned int v8 = __ldaxr(v7);
    while (__stlxr(v8 + 1, v7));
  }

  TIInputManager::set_key_layout(a3, &v25);
  if (v25) {
    sub_8204((uint64_t)v25);
  }
  KB::String::String((KB::String *)v26);
  TIInputManager::set_input_context(a3, v26, (char *)a2 + 88);
  KB::String::~String((KB::String *)v26);
  KB::String::String((KB::String *)v26, (const KB::String *)((char *)a2 + 192));
  TIInputManager::set_input(a3, (const KB::String *)v26);
  KB::String::~String((KB::String *)v26);
  uint64_t v9 = *((void *)a2 + 1);
  uint64_t v10 = *((void *)a2 + 2) - v9;
  if (v10)
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (v10 >> 4);
    unsigned int v13 = 1;
    LODWORD(v14) = 5;
    do
    {
      unsigned int v15 = (double *)(v9 + 48 * v11);
      uint64_t v11 = v13;
      BOOL v16 = v12 == v13;
      if (v12 == v13) {
        unsigned int v17 = 5;
      }
      else {
        unsigned int v17 = v14;
      }
      if (v16) {
        unsigned int v18 = 2;
      }
      else {
        unsigned int v18 = 1;
      }
      if (v13 == 1) {
        uint64_t v14 = 1LL;
      }
      else {
        uint64_t v14 = v17;
      }
      if (v13 == 1) {
        uint64_t v19 = 0LL;
      }
      else {
        uint64_t v19 = v18;
      }
      float v20 = v15[5];
      TIInputManager::add_touch(a3, v19, a4 % 0xA, 0LL, 4294967294LL, v14, 1LL, *v15, v15[1], v15[2], v20);
      uint64_t v9 = *((void *)a2 + 1);
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)a2 + 2) - v9) >> 4);
    }

    while (v12 > v13++);
  }

  TIInputManager::lookup(v27, a3, 5LL, *((unsigned int *)this + 45), 0LL);
  sub_D8DC((uint64_t)v26);
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)this, v27, a2, a4, a5);
  KB::Candidate::~Candidate((KB::Candidate *)v26);
  KB::String::~String((KB::String *)&v31);
  v26[0] = (void **)&v30;
  sub_7B80(v26);
  v26[0] = (void **)&v29;
  sub_7B80(v26);
  v26[0] = (void **)&v28;
  sub_7B80(v26);
  v26[0] = (void **)v27;
  sub_7B80(v26);
}

void TI::CP::CPEval::create_favonius(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  id v5 = a2;
  __int128 v6 = (TI::Favonius::FavoniusStrokeBuildManager *)operator new(0x3E0uLL);
  uint64_t v7 = TI::Favonius::FavoniusStrokeBuildManager::FavoniusStrokeBuildManager(v6);
  *a3 = v7;
  unsigned int v8 = *(unsigned int **)(a1 + 96);
  uint64_t v37 = v8;
  if (v8)
  {
    uint64_t v9 = v8 + 2;
    do
      unsigned int v10 = __ldaxr(v9);
    while (__stlxr(v10 + 1, v9));
  }

  (*(void (**)(uint64_t, unsigned int **))(*(void *)v7 + 176LL))(v7, &v37);
  if (v37)
  {
    uint64_t v11 = v37 + 2;
    unsigned int v12 = atomic_load(v37 + 2);
    if (v12 == 1)
    {
      (*(void (**)(void))(*(void *)v37 + 40LL))();
    }

    else
    {
      do
        unsigned int v13 = __ldaxr(v11);
      while (__stlxr(v13 - 1, v11));
    }
  }

  uint64_t v14 = *a3;
  unsigned int v15 = *(unsigned int **)(a1 + 104);
  uint64_t v36 = v15;
  if (v15)
  {
    BOOL v16 = v15 + 2;
    do
      unsigned int v17 = __ldaxr(v16);
    while (__stlxr(v17 + 1, v16));
  }

  (*(void (**)(uint64_t, unsigned int **))(*(void *)v14 + 192LL))(v14, &v36);
  if (v36)
  {
    unsigned int v18 = v36 + 2;
    unsigned int v19 = atomic_load(v36 + 2);
    if (v19 == 1)
    {
      (*(void (**)(void))(*(void *)v36 + 8LL))();
    }

    else
    {
      do
        unsigned int v20 = __ldaxr(v18);
      while (__stlxr(v20 - 1, v18));
    }
  }

  uint64_t v21 = *a3;
  unsigned int v22 = *(std::__shared_weak_count **)(a1 + 120);
  uint64_t v34 = *(void *)(a1 + 112);
  uint64_t v35 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v24 = __ldxr(p_shared_owners);
    while (__stxr(v24 + 1, p_shared_owners));
  }

  (*(void (**)(uint64_t, uint64_t *))(*(void *)v21 + 208LL))(v21, &v34);
  uint64_t v25 = v35;
  if (v35)
  {
    uint64_t v26 = (unint64_t *)&v35->__shared_owners_;
    do
      unint64_t v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

  uint64_t v28 = *a3;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v28 + 296LL))(v28, 1LL);
  if (*(char *)(a1 + 71) < 0)
  {
    sub_6E24(__p, *(void **)(a1 + 48), *(void *)(a1 + 56));
  }

  else
  {
    *(_OWORD *)__int128 __p = *(_OWORD *)(a1 + 48);
    uint64_t v33 = *(void *)(a1 + 64);
  }

  (*(void (**)(uint64_t, void **))(*(void *)v28 + 448LL))(v28, __p);
  (*(void (**)(uint64_t, id))(*(void *)v28 + 328))( v28,  [v5 usesContinuousPathProgressiveCandidates]);
  (*(void (**)(uint64_t, id))(*(void *)v28 + 344))(v28, [v5 continuousPathDetectPause]);
  [v5 continuousPathLanguageWeight];
  (*(void (**)(uint64_t))(*(void *)v28 + 360LL))(v28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v28 + 376LL))(v28, 2LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v28 + 472LL))(v28, 4LL);
  (*(void (**)(uint64_t, id))(*(void *)v28 + 440))( v28,  [v5 usesStemSuffixCorrectionFactor]);
  uint64_t v29 = (KB *)objc_claimAutoreleasedReturnValue([v5 shapeStoreResourceDir]);
  KB::utf8_string(v38, v29, v30);
  (*(void (**)(uint64_t, void *))(*(void *)v28 + 464LL))(v28, v38);
  KB::String::~String((KB::String *)v38);

  id v31 = [v5 usesContinuousPathRetrocorrection];
  (*(void (**)(uint64_t, id))(*(void *)v28 + 392LL))(v28, v31);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v28 + 264LL))(v28, 1LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v28 + 272LL))(v28, 1LL);
  if (SHIBYTE(v33) < 0) {
    operator delete(__p[0]);
  }
}

void TI::CP::CPEval::create_input_manager(uint64_t a1@<X0>, void *a2@<X1>, TIInputManager **a3@<X8>)
{
  id v5 = a2;
  __int128 v6 = (TIInputManager *)operator new(0x2D0uLL);
  uint64_t v7 = (KB *)objc_claimAutoreleasedReturnValue([v5 dynamicResourcePath]);
  KB::std_string(__p, v7, v8);
  TIInputManager::TIInputManager(v6, __p);
  *a3 = v6;
  if (v63 < 0) {
    operator delete(__p[0]);
  }

  uint64_t v9 = (TI::Favonius::BeamSearchAlgorithm *)[v5 allowsSpaceCorrections];
  TI::Favonius::BeamSearchAlgorithm::create(__p, v9, 30, 0.01, 0.015, 0x5AuLL, v10);
  unsigned int v61 = (unsigned int *)__p[0];
  __p[0] = 0LL;
  TIInputManager::set_search_algorithm(v6, &v61);
  if (v61)
  {
    uint64_t v11 = v61 + 2;
    unsigned int v12 = atomic_load(v61 + 2);
    if (v12 == 1)
    {
      (*(void (**)(void))(*(void *)v61 + 16LL))();
    }

    else
    {
      do
        unsigned int v13 = __ldaxr(v11);
      while (__stlxr(v13 - 1, v11));
    }
  }

  if (__p[0])
  {
    uint64_t v14 = (unsigned int *)((char *)__p[0] + 8);
    unsigned int v15 = atomic_load((unsigned int *)__p[0] + 2);
    if (v15 == 1)
    {
      (*(void (**)(void))(*(void *)__p[0] + 16LL))();
    }

    else
    {
      do
        unsigned int v16 = __ldaxr(v14);
      while (__stlxr(v16 - 1, v14));
    }
  }

  unsigned int v17 = *a3;
  TIInputManager::set_uses_text_checker(*a3, (BOOL)[v5 usesTextChecker]);
  *((_BYTE *)v17 + 696) = 1;
  *((_BYTE *)v17 + 690) = 1;
  (*(void (**)(void, uint64_t))(**((void **)v17 + 23) + 296LL))(*((void *)v17 + 23), 1LL);
  uint64_t v18 = *((void *)v17 + 23);
  if (v18) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v18 + 392LL))(v18, 1LL);
  }
  (*(void (**)(void, id))(**((void **)v17 + 23) + 328))( *((void *)v17 + 23),  [v5 usesContinuousPathProgressiveCandidates]);
  (*(void (**)(void, id))(**((void **)v17 + 23) + 336))( *((void *)v17 + 23),  [v5 continuousPathCompletesWords]);
  (*(void (**)(void, id))(**((void **)v17 + 23) + 344))( *((void *)v17 + 23),  [v5 continuousPathDetectPause]);
  [v5 continuousPathLanguageWeight];
  (*(void (**)(void))(**((void **)v17 + 23) + 360LL))(*((void *)v17 + 23));
  (*(void (**)(void, uint64_t))(**((void **)v17 + 23) + 376LL))(*((void *)v17 + 23), 2LL);
  uint64_t v19 = *((void *)v17 + 23);
  if (v19) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v19 + 472LL))(v19, 4LL);
  }
  *((_BYTE *)v17 + 697) = [v5 completionsShouldSharePrefix];
  id v20 = [v5 usesStemSuffixCorrectionFactor];
  uint64_t v21 = *((void *)v17 + 23);
  if (v21) {
    (*(void (**)(uint64_t, id))(*(void *)v21 + 440LL))(v21, v20);
  }
  unsigned int v22 = (KB *)objc_claimAutoreleasedReturnValue([v5 shapeStoreResourceDir]);
  KB::utf8_string(__p, v22, v23);
  uint64_t v24 = *((void *)v17 + 23);
  if (v24) {
    (*(void (**)(uint64_t, void **))(*(void *)v24 + 464LL))(v24, __p);
  }
  KB::String::~String((KB::String *)__p);

  unsigned int v25 = [v5 cpConfidenceModelType];
  *((_OWORD *)v17 + 9) = xmmword_ED60;
  *((_DWORD *)v17 + 40) = 1028443341;
  *((_DWORD *)v17 + 41) = v25;
  *((_DWORD *)v17 + 42) = 3;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 continuousPathParams]);
  (*(void (**)(void, void *))(**((void **)v17 + 23) + 400LL))(*((void *)v17 + 23), v26);

  unint64_t v27 = (const char *)(a1 + 48);
  KB::String::String((KB::String *)__p, v27);
  TIInputManager::set_locale_identifier(v17, (const KB::String *)__p);
  KB::String::~String((KB::String *)__p);
  uint64_t v28 = *(unsigned int **)(a1 + 96);
  v60 = v28;
  if (v28)
  {
    uint64_t v29 = v28 + 2;
    do
      unsigned int v30 = __ldaxr(v29);
    while (__stlxr(v30 + 1, v29));
  }

  TIInputManager::set_typing_model(v17, &v60);
  if (v60)
  {
    id v31 = v60 + 2;
    unsigned int v32 = atomic_load(v60 + 2);
    if (v32 == 1)
    {
      (*(void (**)(void))(*(void *)v60 + 40LL))();
    }

    else
    {
      do
        unsigned int v33 = __ldaxr(v31);
      while (__stlxr(v33 - 1, v31));
    }
  }

  uint64_t v34 = *a3;
  uint64_t v35 = *(unsigned int **)(a1 + 104);
  unsigned int v59 = v35;
  if (v35)
  {
    uint64_t v36 = v35 + 2;
    do
      unsigned int v37 = __ldaxr(v36);
    while (__stlxr(v37 + 1, v36));
  }

  TIInputManager::set_candidate_generator(v34, &v59);
  if (v59)
  {
    __int128 v38 = v59 + 2;
    unsigned int v39 = atomic_load(v59 + 2);
    if (v39 == 1)
    {
      (*(void (**)(void))(*(void *)v59 + 8LL))();
    }

    else
    {
      do
        unsigned int v40 = __ldaxr(v38);
      while (__stlxr(v40 - 1, v38));
    }
  }

  __int128 v41 = *a3;
  __int128 v42 = *(std::__shared_weak_count **)(a1 + 120);
  uint64_t v57 = *(void *)(a1 + 112);
  unsigned int v58 = v42;
  if (v42)
  {
    p_shared_owners = (unint64_t *)&v42->__shared_owners_;
    do
      unint64_t v44 = __ldxr(p_shared_owners);
    while (__stxr(v44 + 1, p_shared_owners));
  }

  TIInputManager::set_candidate_refinery(v41, &v57);
  unsigned int v45 = v58;
  if (v58)
  {
    uint64_t v46 = (unint64_t *)&v58->__shared_owners_;
    do
      unint64_t v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }

  __int128 v48 = *a3;
  __int128 v49 = *(std::__shared_weak_count **)(a1 + 88);
  uint64_t v55 = *(void *)(a1 + 80);
  uint64_t v56 = v49;
  if (v49)
  {
    __int128 v50 = (unint64_t *)&v49->__shared_owners_;
    do
      unint64_t v51 = __ldxr(v50);
    while (__stxr(v51 + 1, v50));
  }

  sub_B374((void *)v48 + 29, &v55);
  __int128 v52 = v56;
  if (v56)
  {
    __int128 v53 = (unint64_t *)&v56->__shared_owners_;
    do
      unint64_t v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }

  (*(void (**)(void, uint64_t))(**((void **)*a3 + 23) + 272LL))(*((void *)*a3 + 23), 1LL);
}

char *TI::CP::CPEval::recognizer_description(uint64_t a1, unsigned int a2)
{
  if (a2 > 3) {
    return (char *)&unk_EE22;
  }
  else {
    return (&off_10750)[a2];
  }
}

void sub_D5B4(uint64_t a1)
{
  unsigned int v1 = (void *)sub_A784(a1);
  operator delete(v1);
}

void sub_D5C8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10698;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_D5DC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10698;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_D600(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t sub_D610(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = a1 + 24;
  *(void *)(a1 + 16) = 3LL;
  *(_OWORD *)(a1 + 744) = xmmword_EDC0;
  *(void *)(a1 + 760) = 0xFF8000003F800000LL;
  *(void *)(a1 + 840) = 0LL;
  *(_OWORD *)(a1 + 776) = 0u;
  *(_OWORD *)(a1 + 792) = 0u;
  *(_OWORD *)(a1 + 808) = 0u;
  *(_OWORD *)(a1 + 824) = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 848));
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 856));
  *(void *)(a1 + 880) = 0LL;
  *(_OWORD *)(a1 + 864) = 0u;
  KB::String::String((KB::String *)(a1 + 888));
  *(_WORD *)(a1 + 944) = 0;
  *(void *)(a1 + 936) = 0LL;
  *(_OWORD *)(a1 + 920) = 0u;
  *(_DWORD *)(a1 + 960) = 0;
  *(_BYTE *)(a1 + 964) = 0;
  *(_OWORD *)(a1 + 976) = 0u;
  *(_DWORD *)(a1 + 992) = 0;
  KB::Candidate::append(a1, a2);
  return a1;
}

void *sub_D6C8(void *result, void *a2)
{
  uint64_t v3 = result + 2;
  CFTypeRef v2 = (void *)*result;
  id v4 = a2 + 2;
  id v5 = (void *)*a2;
  if ((void *)*result == result + 2)
  {
    if (v5 == v4)
    {
      for (uint64_t i = 0LL; i != 720; ++i)
      {
        char v11 = *((_BYTE *)v2 + i);
        *((_BYTE *)v2 + i) = *((_BYTE *)v4 + i);
        *((_BYTE *)v4 + i) = v11;
      }
    }

    else
    {
      uint64_t v6 = 0LL;
      *uint64_t result = v5;
      *a2 = v4;
      do
      {
        char v7 = *((_BYTE *)v2 + v6);
        *((_BYTE *)v2 + v6) = *((_BYTE *)v4 + v6);
        *((_BYTE *)v4 + v6++) = v7;
      }

      while (v6 != 720);
    }
  }

  else if (v5 == v4)
  {
    uint64_t v8 = 0LL;
    *a2 = v2;
    *uint64_t result = v3;
    do
    {
      char v9 = *((_BYTE *)v3 + v8);
      *((_BYTE *)v3 + v8) = *((_BYTE *)v5 + v8);
      *((_BYTE *)v5 + v8++) = v9;
    }

    while (v8 != 720);
  }

  else
  {
    *uint64_t result = v5;
    *a2 = v2;
  }

  uint64_t v12 = result[1];
  result[1] = a2[1];
  a2[1] = v12;
  return result;
}

uint64_t sub_D788(uint64_t a1)
{
  *(void *)(a1 + 8) = 0LL;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 7;
  *(void *)(a1 + 120) = 0x4028000000000000LL;
  *(_DWORD *)(a1 + 128) = 8;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(void *)(a1 + 200) = 0LL;
  CFTypeRef v2 = (TI::CP::ShapeStore *)TI::CP::ShapeStore::ShapeStore(a1 + 208);
  *(_DWORD *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_DWORD *)(a1 + 320) = 1065353216;
  *(_BYTE *)(a1 + 328) = 0;
  *(_DWORD *)(a1 + 280) = TI::CP::ShapeStore::num_records(v2);
  return a1;
}

void sub_D81C(void ***a1)
{
  unsigned int v1 = *a1;
  CFTypeRef v2 = **a1;
  if (v2)
  {
    id v4 = v1[1];
    id v5 = v2;
    if (v4 != v2)
    {
      do
        sub_D88C((uint64_t)v4 - 240);
      while (v4 != v2);
      id v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_D88C(uint64_t a1)
{
  if (*(unsigned __int16 *)(a1 + 32) >= 0xFu)
  {
    CFTypeRef v2 = *(void **)(a1 + 40);
    if (v2) {
      operator delete[](v2);
    }
  }

  KB::String::~String((KB::String *)a1);
}

uint64_t sub_D8DC(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = a1 + 24;
  *(void *)(a1 + 16) = 3LL;
  *(_OWORD *)(a1 + 744) = xmmword_EDC0;
  *(void *)(a1 + 760) = 0xFF8000003F800000LL;
  *(void *)(a1 + 840) = 0LL;
  *(_OWORD *)(a1 + 776) = 0u;
  *(_OWORD *)(a1 + 792) = 0u;
  *(_OWORD *)(a1 + 808) = 0u;
  *(_OWORD *)(a1 + 824) = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 848));
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 856));
  *(void *)(a1 + 880) = 0LL;
  *(_OWORD *)(a1 + 864) = 0u;
  KB::String::String((KB::String *)(a1 + 888));
  *(_WORD *)(a1 + 944) = 0;
  *(void *)(a1 + 936) = 0LL;
  *(_OWORD *)(a1 + 920) = 0u;
  *(_DWORD *)(a1 + 960) = 0;
  *(_BYTE *)(a1 + 964) = 0;
  *(_OWORD *)(a1 + 976) = 0u;
  *(_DWORD *)(a1 + 992) = 0;
  return a1;
}

void sub_D984(unsigned int *__p)
{
  unsigned int v2 = atomic_load(__p);
  if (v2 == 1)
  {
    uint64_t v3 = *((void *)__p + 7);
    if (v3) {
      sub_8204(v3);
    }
    operator delete(__p);
  }

  else
  {
    do
      unsigned int v4 = __ldaxr(__p);
    while (__stlxr(v4 - 1, __p));
  }

void *sub_D9E0()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &off_106D0;
  return result;
}

void sub_DA04(uint64_t a1, void *a2)
{
  *a2 = &off_106D0;
}

void sub_DA1C(int a1, KB::Candidate *this, float *a3)
{
  float v4 = *a3;
  float v5 = *((float *)this + 187);
  float v6 = *((float *)this + 189);
  float v7 = *((float *)this + 190);
  uint64_t v8 = (char *)this + 764;
  uint64_t v16 = *(void *)((char *)this + 764);
  int v17 = *((_DWORD *)this + 193);
  if ((KB::Candidate::has_from_named_entities(this, 0) & 1) != 0
    || KB::Candidate::has_from_supplemental_lexicon(this, 0))
  {
    float v4 = v4 * 0.8;
  }

  float v9 = logf(v4);
  *((float *)this + 186) = v5 + (float)(v7 * (float)(v6 + v9));
  *((float *)this + 187) = v5;
  *((float *)this + 188) = v9;
  *((float *)this + 189) = v6;
  *((float *)this + 190) = v7;
  *(void *)uint64_t v8 = v16;
  *((_DWORD *)v8 + 2) = v17;
  KB::cf_mutable_dictionary(v10);
  char v11 = (__CFDictionary *)cf;
  float v12 = expf(*((float *)this + 186));
  KB::cf_number(&value, v13, v12);
  CFDictionarySetValue(v11, @"refinement_omega", value);
  if (value) {
    CFRelease(value);
  }
  KB::Candidate::add_sources_info(this, @"refinement", (const __CFDictionary *)cf);
  if (cf) {
    CFRelease(cf);
  }
}

void *sub_DB44()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &off_10718;
  return result;
}

void sub_DB68(uint64_t a1, void *a2)
{
  *a2 = &off_10718;
}

void sub_DB80(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)a3;
  *(void *)(a3 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  *(void *)a3 = 0LL;
  sub_6540(v4, a2);
  if (v3) {
    operator delete(v3);
  }
  uint64_t v8 = (void **)&v7;
  sub_7B80(&v8);
  uint64_t v8 = (void **)&v6;
  sub_7B80(&v8);
  uint64_t v8 = (void **)&v5;
  sub_7B80(&v8);
  uint64_t v8 = (void **)v4;
  sub_7B80(&v8);
}

void sub_DC00()
{
  v0 = objc_autoreleasePoolPush();
  __cxa_atexit((void (*)(void *))sub_3468, &unk_14868, &dword_0);
  objc_autoreleasePoolPop(v0);
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_usesTextChecker(void *a1, const char *a2, ...)
{
  return [a1 usesTextChecker];
}