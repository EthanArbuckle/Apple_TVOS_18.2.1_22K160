@interface SMTKaldiVocab
+ (void)initialize;
- (SMTKaldiVocab)init;
- (SMTKaldiVocab)initWithContentsOfUrl:(id)a3 outError:(id *)a4;
- (id).cxx_construct;
- (id)endOfSentenceToken;
- (unint64_t)beginOfSentenceIndex;
- (unint64_t)endOfSentenceIndex;
- (unint64_t)indexForWord:(id)a3;
- (unint64_t)unknownWordIndex;
- (unint64_t)vocabSize;
@end

@implementation SMTKaldiVocab

- (SMTKaldiVocab)init
{
  return 0LL;
}

- (SMTKaldiVocab)initWithContentsOfUrl:(id)a3 outError:(id *)a4
{
  id v24 = a3;
  v62.receiver = self;
  v62.super_class = (Class)&OBJC_CLASS___SMTKaldiVocab;
  v6 = -[SMTKaldiVocab init](&v62, "init");
  if (!v6) {
    goto LABEL_21;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v24,  4LL,  a4));
  if (!v7) {
    goto LABEL_20;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByCharactersInSet:v8]);

  uint64_t v56 = 0LL;
  v57 = &v56;
  uint64_t v58 = 0x3032000000LL;
  v59 = sub_100007824;
  v60 = sub_100007834;
  id v61 = 0LL;
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  v53 = sub_100007824;
  v54 = sub_100007834;
  id v55 = 0LL;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  v47 = sub_100007824;
  v48 = sub_100007834;
  id v49 = 0LL;
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = sub_100007824;
  v42 = sub_100007834;
  id v43 = 0LL;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  uint64_t v37 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10000783C;
  v27[3] = &unk_100010718;
  v29 = &v38;
  v30 = &v34;
  v31 = &v44;
  v32 = &v56;
  v33 = &v50;
  v9 = v6;
  v28 = v9;
  [v23 enumerateObjectsUsingBlock:v27];
  uint64_t v10 = v35[3];
  unint64_t value = v9->_w2i.__table_.__p2_.__value_;
  if (v10 != value)
  {
    NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"VocabSize in the file %lu does not match total vocabulary in file %lu",  v10,  value));
    v67 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  151LL,  v13));
    v15 = (void *)v39[5];
    v39[5] = v14;
  }

  if (!v45[5] || !v57[5] || !v51[5])
  {
    NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"One of <UnknownWord>, <BeginOfSentenceWord> or <EndOfSentenceWord> symbols are missing from file:%@",  v24));
    v65 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  151LL,  v17));
    v19 = (void *)v39[5];
    v39[5] = v18;
  }

  v20 = (void *)v39[5];
  if (v20)
  {
    if (a4) {
      *a4 = v20;
    }
  }

  else
  {
    sub_1000041E0(__p, (char *)[(id) v45[5] UTF8String]);
    v63 = __p;
    v9->_unkIndex = *((void *)sub_100007B68((uint64_t)&v9->_w2i, (unsigned __int8 *)__p, (__int128 **)&v63) + 5);
    if (v26 < 0) {
      operator delete(__p[0]);
    }
    sub_1000041E0(__p, (char *)[(id) v51[5] UTF8String]);
    v63 = __p;
    v9->_eosIndex = *((void *)sub_100007B68((uint64_t)&v9->_w2i, (unsigned __int8 *)__p, (__int128 **)&v63) + 5);
    if (v26 < 0) {
      operator delete(__p[0]);
    }
    sub_1000041E0(__p, (char *)[(id) v57[5] UTF8String]);
    v63 = __p;
    v9->_bosIndex = *((void *)sub_100007B68((uint64_t)&v9->_w2i, (unsigned __int8 *)__p, (__int128 **)&v63) + 5);
    if (v26 < 0) {
      operator delete(__p[0]);
    }
    objc_storeStrong((id *)&v9->_eosToken, (id)v51[5]);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  if (v20) {
LABEL_20:
  }
    v21 = 0LL;
  else {
LABEL_21:
  }
    v21 = v6;

  return v21;
}

- (unint64_t)indexForWord:(id)a3
{
  id v4 = a3;
  sub_1000041E0(__p, (char *)[v4 UTF8String]);
  unint64_t v5 = sub_100007068((uint64_t)__p);
  unint64_t value = self->_w2i.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    unint64_t v7 = v5;
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v8.i16[0] = vaddlv_u8(v8);
    unint64_t v9 = v8.u32[0];
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v10 = v5;
      if (v5 >= value) {
        unint64_t v10 = v5 % value;
      }
    }

    else
    {
      unint64_t v10 = (value - 1) & v5;
    }

    v11 = (unsigned __int8 **)self->_w2i.__table_.__bucket_list_.__ptr_.__value_[v10];
    if (v11)
    {
      for (i = *v11; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v13 = *((void *)i + 1);
        if (v13 == v7)
        {
          if (sub_1000074B8(i + 16, (unsigned __int8 *)__p))
          {
            v19 = __p;
            p_unkIndex = (unint64_t *)(sub_100006E08( (uint64_t)&self->_w2i,  (unsigned __int8 *)__p,  (__int128 **)&v19)
                                            + 40);
            goto LABEL_18;
          }
        }

        else
        {
          if (v9 > 1)
          {
            if (v13 >= value) {
              v13 %= value;
            }
          }

          else
          {
            v13 &= value - 1;
          }

          if (v13 != v10) {
            break;
          }
        }
      }
    }
  }

  p_unkIndex = &self->_unkIndex;
LABEL_18:
  unint64_t v14 = *p_unkIndex;
  if (v18 < 0) {
    operator delete(__p[0]);
  }

  return v14;
}

- (unint64_t)vocabSize
{
  return self->_w2i.__table_.__p2_.__value_;
}

- (unint64_t)endOfSentenceIndex
{
  return self->_eosIndex;
}

- (unint64_t)beginOfSentenceIndex
{
  return self->_bosIndex;
}

- (unint64_t)unknownWordIndex
{
  return self->_unkIndex;
}

- (id)endOfSentenceToken
{
  return self->_eosToken;
}

- (void).cxx_destruct
{
  next = (void **)self->_w2i.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      id v4 = (void **)*next;
      operator delete(next);
      next = v4;
    }

    while (v4);
  }

  unint64_t value = self->_w2i.__table_.__bucket_list_.__ptr_.__value_;
  self->_w2i.__table_.__bucket_list_.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
  objc_storeStrong((id *)&self->_eosToken, 0LL);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SMTKaldiVocab, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "SMTKaldiVocab");
    v3 = (void *)qword_100016030;
    qword_100016030 = (uint64_t)v2;
  }

@end