@interface TIDynamicLanguageLikelihoodModel
- (NSLinguisticTagger)linguisticTagger;
- (TIDynamicLanguageLikelihoodModel)init;
- (double)lastOfflineAdaptationTimeForApp:(id)a3;
- (float)_priorProbabilityForLanguage:(const void *)a3;
- (id).cxx_construct;
- (id)rankedLanguagesForRecipient:(id)a3;
- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4;
- (void)addEvidence:(id)a3 forRecipient:(id)a4 language:(id)a5;
- (void)addEvidence:(id)a3 timestamp:(double)a4 adaptationType:(int)a5 forRecipient:(id)a6 app:(id)a7 language:(id)a8;
- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5;
@end

@implementation TIDynamicLanguageLikelihoodModel

- (TIDynamicLanguageLikelihoodModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TIDynamicLanguageLikelihoodModel;
  v2 = -[TIDynamicLanguageLikelihoodModel init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSLinguisticTagger);
    NSLinguisticTagScheme v9 = NSLinguisticTagSchemeLanguage;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    v5 = -[NSLinguisticTagger initWithTagSchemes:options:](v3, "initWithTagSchemes:options:", v4, 0LL);
    linguisticTagger = v2->_linguisticTagger;
    v2->_linguisticTagger = v5;
  }

  return v2;
}

- (void)addEvidence:(id)a3 timestamp:(double)a4 adaptationType:(int)a5 forRecipient:(id)a6 app:(id)a7 language:(id)a8
{
  id v11 = a3;
  NSLinguisticTagScheme v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIDynamicLanguageLikelihoodModel linguisticTagger](self, "linguisticTagger"));
  [v9 setString:v11];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIDynamicLanguageLikelihoodModel linguisticTagger](self, "linguisticTagger"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_38184;
  v12[3] = &unk_89720;
  v12[4] = self;
  objc_msgSend( v10,  "enumerateTagsInRange:scheme:options:usingBlock:",  0,  objc_msgSend(v11, "length"),  NSLinguisticTagSchemeLanguage,  14,  v12);
}

- (void)addEvidence:(id)a3 forRecipient:(id)a4 language:(id)a5
{
  id v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIDynamicLanguageLikelihoodModel linguisticTagger](self, "linguisticTagger"));
  [v6 setString:v8];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIDynamicLanguageLikelihoodModel linguisticTagger](self, "linguisticTagger"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_38350;
  v9[3] = &unk_89720;
  v9[4] = self;
  objc_msgSend( v7,  "enumerateTagsInRange:scheme:options:usingBlock:",  0,  objc_msgSend(v8, "length"),  NSLinguisticTagSchemeLanguage,  14,  v9);
}

- (id)rankedLanguagesForRecipient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v24 = 0LL;
  v25 = 0LL;
  unint64_t v26 = 0LL;
  p_m_counts_for_language = (uint64_t **)&self->m_counts_for_language;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)self->m_counts_for_language.__tree_.__begin_node_;
  if (begin_node == &self->m_counts_for_language.__tree_.__pair1_)
  {
    id v8 = 0LL;
    v14 = 0LL;
  }

  else
  {
    id v8 = 0LL;
    do
    {
      NSLinguisticTagScheme v9 = (__int128 *)&begin_node[4];
      if ((unint64_t)v8 >= v26)
      {
        id v8 = sub_39008(&v24, v9);
      }

      else
      {
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        {
          sub_2ECD4(v8, begin_node[4].__value_.__left_, (unint64_t)begin_node[5].__value_.__left_);
        }

        else
        {
          __int128 v10 = *v9;
          *((__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)v8
          + 2) = begin_node[6];
          *(_OWORD *)id v8 = v10;
        }

        v8 += 24;
      }

      v25 = v8;
      left = (TIDynamicLanguageLikelihoodModel *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v12 = left;
          left = (TIDynamicLanguageLikelihoodModel *)left->super.isa;
        }

        while (left);
      }

      else
      {
        do
        {
          v12 = (TIDynamicLanguageLikelihoodModel *)begin_node[2].__value_.__left_;
          BOOL v13 = v12->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)v12;
        }

        while (!v13);
      }

      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)v12;
    }

    while (v12 != (TIDynamicLanguageLikelihoodModel *)&self->m_counts_for_language.__tree_.__pair1_);
    v14 = v24;
  }

  unint64_t v15 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v8 - v14) >> 3));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_386BC;
  v23[3] = &unk_89748;
  v23[4] = self;
  if (v8 == v14) {
    uint64_t v16 = 0LL;
  }
  else {
    uint64_t v16 = v15;
  }
  v27 = v23;
  sub_3923C((uint64_t)v14, (__int128 *)v8, (uint64_t)&v27, v16, 1, v17);

  v18 = v24;
  for (i = v25; v18 != i; v18 += 24)
  {
    v27 = v18;
    if (sub_3A7E0(p_m_counts_for_language, (void **)v18, (uint64_t)&unk_82284, (__int128 **)&v27)[7] >= 5)
    {
      v20 = v18;
      if (v18[23] < 0) {
        v20 = *(char **)v18;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
      [v5 addObject:v21];
    }
  }

  v28 = &v24;
  sub_2ED5C((void ***)&v28);

  return v5;
}

- (float)_priorProbabilityForLanguage:(const void *)a3
{
  id v4 = sub_3AC74((uint64_t)&self->m_counts_for_language, (void **)a3);
  int64_t m_total_counts = self->m_total_counts;
  float result = 0.0;
  if (m_total_counts >= 1
    && &self->m_counts_for_language.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long>, void *>>> *)v4)
  {
    return (float)(uint64_t)v4[7] / (float)m_total_counts;
  }

  return result;
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id, _BYTE *, float))a5;
  char v22 = 0;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v9);
      }
      id v13 = *(id *)(*((void *)&v18 + 1) + 8 * v12);
      sub_2EBB8(__p, (char *)[v13 UTF8String]);
      -[TIDynamicLanguageLikelihoodModel _priorProbabilityForLanguage:](self, "_priorProbabilityForLanguage:", __p);
      float v15 = v14;
      if (v17 < 0) {
        operator delete(__p[0]);
      }
      v8[2](v8, v13, &v22, v15);
      if (v22) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  return 0.0;
}

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  return 0LL;
}

- (NSLinguisticTagger)linguisticTagger
{
  return self->_linguisticTagger;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end