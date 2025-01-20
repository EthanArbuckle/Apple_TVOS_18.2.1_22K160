@interface ESVocabularyLabel
- (BOOL)isEqual:(id)a3;
- (ESVocabularyLabel)initWithSpeechCategoryName:(id)a3 tagName:(id)a4;
- (NSString)speechCategoryName;
- (NSString)tagName;
- (unint64_t)hash;
@end

@implementation ESVocabularyLabel

- (ESVocabularyLabel)initWithSpeechCategoryName:(id)a3 tagName:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ESVocabularyLabel;
  v8 = -[ESVocabularyLabel init](&v13, "init");
  speechCategoryName = v8->_speechCategoryName;
  v8->_speechCategoryName = v6;
  v10 = v6;

  tagName = v8->_tagName;
  v8->_tagName = v7;

  return v8;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ESVocabularyLabel speechCategoryName](self, "speechCategoryName"));
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ESVocabularyLabel tagName](self, "tagName"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ESVocabularyLabel *)a3;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ESVocabularyLabel);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ESVocabularyLabel speechCategoryName](self, "speechCategoryName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ESVocabularyLabel speechCategoryName](v6, "speechCategoryName"));
      if ([v7 isEqualToString:v8])
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ESVocabularyLabel tagName](self, "tagName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ESVocabularyLabel tagName](v6, "tagName"));
        unsigned __int8 v11 = [v9 isEqualToString:v10];
      }

      else
      {
        unsigned __int8 v11 = 0;
      }
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (NSString)speechCategoryName
{
  return self->_speechCategoryName;
}

- (NSString)tagName
{
  return self->_tagName;
}

- (void).cxx_destruct
{
}

@end