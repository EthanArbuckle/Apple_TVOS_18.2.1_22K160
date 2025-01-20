@interface _NSAttributedStringGrammar
+ (_NSAttributedStringGrammar)identityGrammar;
- (BOOL)isEqual:(id)a3;
- (_NSAttributedStringGrammar)init;
- (_NSAttributedStringGrammar)initWithMorphology:(id)a3;
- (id)_initWithMarkdownDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)aspect;
- (int64_t)deictic;
- (int64_t)determinationType;
- (int64_t)gender;
- (int64_t)grammaticalCase;
- (int64_t)mood;
- (int64_t)number;
- (int64_t)person;
- (int64_t)position;
- (int64_t)tense;
- (int64_t)verbForm;
- (unint64_t)hash;
- (void)setAspect:(int64_t)a3;
- (void)setDeictic:(int64_t)a3;
- (void)setDeterminationType:(int64_t)a3;
- (void)setGender:(int64_t)a3;
- (void)setGrammaticalCase:(int64_t)a3;
- (void)setMood:(int64_t)a3;
- (void)setNumber:(int64_t)a3;
- (void)setPerson:(int64_t)a3;
- (void)setPosition:(int64_t)a3;
- (void)setTense:(int64_t)a3;
- (void)setVerbForm:(int64_t)a3;
@end

@implementation _NSAttributedStringGrammar

- (_NSAttributedStringGrammar)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSAttributedStringGrammar;
  return -[_NSAttributedStringGrammar init](&v3, sel_init);
}

+ (_NSAttributedStringGrammar)identityGrammar
{
  return (_NSAttributedStringGrammar *)objc_alloc_init((Class)a1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS____NSAttributedStringGrammar);
  v4->_aspect = -[_NSAttributedStringGrammar aspect](self, "aspect");
  v4->_deictic = -[_NSAttributedStringGrammar deictic](self, "deictic");
  v4->_determinationType = -[_NSAttributedStringGrammar determinationType](self, "determinationType");
  v4->_gender = -[_NSAttributedStringGrammar gender](self, "gender");
  v4->_grammaticalCase = -[_NSAttributedStringGrammar grammaticalCase](self, "grammaticalCase");
  v4->_mood = -[_NSAttributedStringGrammar mood](self, "mood");
  v4->_number = -[_NSAttributedStringGrammar number](self, "number");
  v4->_person = -[_NSAttributedStringGrammar person](self, "person");
  v4->_position = -[_NSAttributedStringGrammar position](self, "position");
  v4->_tense = -[_NSAttributedStringGrammar tense](self, "tense");
  v4->_verbForm = -[_NSAttributedStringGrammar verbForm](self, "verbForm");
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  int64_t v4 = -[_NSAttributedStringGrammar aspect](self, "aspect");
  int64_t v5 = v4 ^ -[_NSAttributedStringGrammar deictic](self, "deictic") ^ v3;
  int64_t v6 = -[_NSAttributedStringGrammar determinationType](self, "determinationType");
  int64_t v7 = v6 ^ -[_NSAttributedStringGrammar gender](self, "gender");
  int64_t v8 = v5 ^ v7 ^ -[_NSAttributedStringGrammar grammaticalCase](self, "grammaticalCase");
  int64_t v9 = -[_NSAttributedStringGrammar mood](self, "mood");
  int64_t v10 = v9 ^ -[_NSAttributedStringGrammar number](self, "number");
  int64_t v11 = v10 ^ -[_NSAttributedStringGrammar person](self, "person");
  int64_t v12 = v8 ^ v11 ^ -[_NSAttributedStringGrammar position](self, "position");
  int64_t v13 = -[_NSAttributedStringGrammar tense](self, "tense");
  return v12 ^ v13 ^ -[_NSAttributedStringGrammar verbForm](self, "verbForm");
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int64_t v5 = -[_NSAttributedStringGrammar aspect](self, "aspect");
  if (v5 != [a3 aspect]) {
    return 0;
  }
  int64_t v6 = -[_NSAttributedStringGrammar deictic](self, "deictic");
  if (v6 != [a3 deictic]) {
    return 0;
  }
  int64_t v7 = -[_NSAttributedStringGrammar determinationType](self, "determinationType");
  if (v7 != [a3 determinationType]) {
    return 0;
  }
  int64_t v8 = -[_NSAttributedStringGrammar gender](self, "gender");
  if (v8 != [a3 gender]) {
    return 0;
  }
  int64_t v9 = -[_NSAttributedStringGrammar grammaticalCase](self, "grammaticalCase");
  if (v9 != [a3 grammaticalCase]) {
    return 0;
  }
  int64_t v10 = -[_NSAttributedStringGrammar mood](self, "mood");
  if (v10 != [a3 mood]) {
    return 0;
  }
  int64_t v11 = -[_NSAttributedStringGrammar number](self, "number");
  if (v11 != [a3 number]) {
    return 0;
  }
  int64_t v12 = -[_NSAttributedStringGrammar person](self, "person");
  if (v12 != [a3 person]) {
    return 0;
  }
  int64_t v13 = -[_NSAttributedStringGrammar position](self, "position");
  if (v13 != [a3 position]) {
    return 0;
  }
  int64_t v14 = -[_NSAttributedStringGrammar tense](self, "tense");
  if (v14 != [a3 tense]) {
    return 0;
  }
  int64_t v15 = -[_NSAttributedStringGrammar verbForm](self, "verbForm");
  return v15 == [a3 verbForm];
}

- (_NSAttributedStringGrammar)initWithMorphology:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____NSAttributedStringGrammar;
  int64_t v4 = -[_NSAttributedStringGrammar init](&v14, sel_init);
  if (v4)
  {
    unint64_t v5 = [a3 grammaticalGender];
    if (v5 <= 3) {
      -[_NSAttributedStringGrammar setGender:](v4, "setGender:", qword_183991460[v5]);
    }
    unint64_t v6 = [a3 number];
    if (v6 <= 6) {
      -[_NSAttributedStringGrammar setNumber:](v4, "setNumber:", qword_183991480[v6]);
    }
    unint64_t v7 = [a3 partOfSpeech];
    if (v7 <= 0xE) {
      -[_NSAttributedStringGrammar setPosition:](v4, "setPosition:", v7);
    }
    unint64_t v8 = [a3 grammaticalCase] - 1;
    if (v8 > 0xC) {
      uint64_t v9 = 0LL;
    }
    else {
      uint64_t v9 = qword_1839914B8[v8];
    }
    -[_NSAttributedStringGrammar setGrammaticalCase:](v4, "setGrammaticalCase:", v9);
    uint64_t v10 = [a3 definiteness];
    uint64_t v11 = 3LL;
    if (v10 != 1) {
      uint64_t v11 = 0LL;
    }
    if (v10 == 2) {
      uint64_t v12 = 2LL;
    }
    else {
      uint64_t v12 = v11;
    }
    -[_NSAttributedStringGrammar setDeterminationType:](v4, "setDeterminationType:", v12);
  }

  return v4;
}

- (int64_t)aspect
{
  return self->_aspect;
}

- (void)setAspect:(int64_t)a3
{
  self->_aspect = a3;
}

- (int64_t)deictic
{
  return self->_deictic;
}

- (void)setDeictic:(int64_t)a3
{
  self->_deictic = a3;
}

- (int64_t)determinationType
{
  return self->_determinationType;
}

- (void)setDeterminationType:(int64_t)a3
{
  self->_determinationType = a3;
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (int64_t)grammaticalCase
{
  return self->_grammaticalCase;
}

- (void)setGrammaticalCase:(int64_t)a3
{
  self->_grammaticalCase = a3;
}

- (int64_t)mood
{
  return self->_mood;
}

- (void)setMood:(int64_t)a3
{
  self->_mood = a3;
}

- (int64_t)number
{
  return self->_number;
}

- (void)setNumber:(int64_t)a3
{
  self->_number = a3;
}

- (int64_t)person
{
  return self->_person;
}

- (void)setPerson:(int64_t)a3
{
  self->_person = a3;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (int64_t)tense
{
  return self->_tense;
}

- (void)setTense:(int64_t)a3
{
  self->_tense = a3;
}

- (int64_t)verbForm
{
  return self->_verbForm;
}

- (void)setVerbForm:(int64_t)a3
{
  self->_verbForm = a3;
}

- (id)_initWithMarkdownDictionary:(id)a3
{
  int64_t v4 = -[_NSAttributedStringGrammar init](self, "init");
  if (v4)
  {
    unint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"aspect"];
    if (v5 && (unint64_t v6 = v5, ([v5 isEqual:@"none"] & 1) == 0))
    {
      if ([v6 isEqual:@"perfect"])
      {
        uint64_t v7 = 1LL;
      }

      else
      {
        if (([v6 isEqual:@"imperfect"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v7 = 2LL;
      }
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    -[_NSAttributedStringGrammar setAspect:](v4, "setAspect:", v7);
    unint64_t v8 = (void *)[a3 objectForKeyedSubscript:@"deictic"];
    if (v8 && (uint64_t v9 = v8, ([v8 isEqual:@"none"] & 1) == 0))
    {
      if ([v9 isEqual:@"distal"])
      {
        uint64_t v10 = 1LL;
      }

      else
      {
        if (([v9 isEqual:@"proximal"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v10 = 2LL;
      }
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    -[_NSAttributedStringGrammar setDeictic:](v4, "setDeictic:", v10);
    uint64_t v11 = (void *)[a3 objectForKeyedSubscript:@"determinationType"];
    if (v11 && (uint64_t v12 = v11, ([v11 isEqual:@"none"] & 1) == 0))
    {
      if ([v12 isEqual:@"demonstrative"])
      {
        uint64_t v13 = 1LL;
      }

      else if ([v12 isEqual:@"definite"])
      {
        uint64_t v13 = 2LL;
      }

      else
      {
        if (([v12 isEqual:@"indefinite"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v13 = 3LL;
      }
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    -[_NSAttributedStringGrammar setDeterminationType:](v4, "setDeterminationType:", v13);
    objc_super v14 = (void *)[a3 objectForKeyedSubscript:@"grammaticalGender"];
    if (v14 && (uint64_t v15 = v14, ([v14 isEqual:@"none"] & 1) == 0))
    {
      if ([v15 isEqual:@"masculine"])
      {
        uint64_t v16 = 1LL;
      }

      else if ([v15 isEqual:@"feminine"])
      {
        uint64_t v16 = 2LL;
      }

      else if ([v15 isEqual:@"neuter"])
      {
        uint64_t v16 = 3LL;
      }

      else
      {
        if (([v15 isEqual:@"common"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v16 = 4LL;
      }
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    -[_NSAttributedStringGrammar setGender:](v4, "setGender:", v16);
    v17 = (void *)[a3 objectForKeyedSubscript:@"grammaticalCase"];
    if (v17 && (v18 = v17, ([v17 isEqual:@"none"] & 1) == 0))
    {
      if ([v18 isEqual:@"accusative"])
      {
        uint64_t v19 = 1LL;
      }

      else if ([v18 isEqual:@"dative"])
      {
        uint64_t v19 = 2LL;
      }

      else if ([v18 isEqual:@"genitive"])
      {
        uint64_t v19 = 3LL;
      }

      else if ([v18 isEqual:@"locative"])
      {
        uint64_t v19 = 4LL;
      }

      else if ([v18 isEqual:@"nominative"])
      {
        uint64_t v19 = 5LL;
      }

      else if ([v18 isEqual:@"partitive"])
      {
        uint64_t v19 = 6LL;
      }

      else if ([v18 isEqual:@"instrumental"])
      {
        uint64_t v19 = 7LL;
      }

      else if ([v18 isEqual:@"prepositional"])
      {
        uint64_t v19 = 8LL;
      }

      else if ([v18 isEqual:@"object"])
      {
        uint64_t v19 = 9LL;
      }

      else if ([v18 isEqual:@"directObject"])
      {
        uint64_t v19 = 10LL;
      }

      else
      {
        if (([v18 isEqual:@"indirectObject"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v19 = 11LL;
      }
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    -[_NSAttributedStringGrammar setGrammaticalCase:](v4, "setGrammaticalCase:", v19);
    v20 = (void *)[a3 objectForKeyedSubscript:@"mood"];
    if (v20 && (v21 = v20, ([v20 isEqual:@"none"] & 1) == 0))
    {
      if ([v21 isEqual:@"conditional"])
      {
        uint64_t v22 = 1LL;
      }

      else if ([v21 isEqual:@"subjunctive"])
      {
        uint64_t v22 = 2LL;
      }

      else if ([v21 isEqual:@"imperative"])
      {
        uint64_t v22 = 3LL;
      }

      else
      {
        if (([v21 isEqual:@"indicative"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v22 = 4LL;
      }
    }

    else
    {
      uint64_t v22 = 0LL;
    }

    -[_NSAttributedStringGrammar setMood:](v4, "setMood:", v22);
    v23 = (void *)[a3 objectForKeyedSubscript:@"number"];
    if (v23 && (v24 = v23, ([v23 isEqual:@"none"] & 1) == 0))
    {
      if ([v24 isEqual:@"one"])
      {
        uint64_t v25 = 1LL;
      }

      else if ([v24 isEqual:@"two"])
      {
        uint64_t v25 = 2LL;
      }

      else if ([v24 isEqual:@"few"])
      {
        uint64_t v25 = 3LL;
      }

      else if ([v24 isEqual:@"many"])
      {
        uint64_t v25 = 4LL;
      }

      else if ([v24 isEqual:@"zero"])
      {
        uint64_t v25 = 5LL;
      }

      else
      {
        if (([v24 isEqual:@"other"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v25 = 6LL;
      }
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    -[_NSAttributedStringGrammar setNumber:](v4, "setNumber:", v25);
    v26 = (void *)[a3 objectForKeyedSubscript:@"person"];
    if (v26 && (v27 = v26, ([v26 isEqual:@"none"] & 1) == 0))
    {
      if ([v27 isEqual:@"first"])
      {
        uint64_t v28 = 1LL;
      }

      else if ([v27 isEqual:@"second"])
      {
        uint64_t v28 = 2LL;
      }

      else
      {
        if (([v27 isEqual:@"third"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v28 = 3LL;
      }
    }

    else
    {
      uint64_t v28 = 0LL;
    }

    -[_NSAttributedStringGrammar setPerson:](v4, "setPerson:", v28);
    v29 = (void *)[a3 objectForKeyedSubscript:@"partOfSpeech"];
    if (v29 && (v30 = v29, ([v29 isEqual:@"none"] & 1) == 0))
    {
      if ([v30 isEqual:@"determiner"])
      {
        uint64_t v31 = 1LL;
      }

      else if ([v30 isEqual:@"pronoun"])
      {
        uint64_t v31 = 2LL;
      }

      else if ([v30 isEqual:@"letter"])
      {
        uint64_t v31 = 3LL;
      }

      else if ([v30 isEqual:@"adverb"])
      {
        uint64_t v31 = 4LL;
      }

      else if ([v30 isEqual:@"particle"])
      {
        uint64_t v31 = 5LL;
      }

      else if ([v30 isEqual:@"adjective"])
      {
        uint64_t v31 = 6LL;
      }

      else if ([v30 isEqual:@"adposition"])
      {
        uint64_t v31 = 7LL;
      }

      else if ([v30 isEqual:@"verb"])
      {
        uint64_t v31 = 8LL;
      }

      else if ([v30 isEqual:@"noun"])
      {
        uint64_t v31 = 9LL;
      }

      else if ([v30 isEqual:@"conjunction"])
      {
        uint64_t v31 = 10LL;
      }

      else if ([v30 isEqual:@"numeral"])
      {
        uint64_t v31 = 11LL;
      }

      else if ([v30 isEqual:@"interjection"])
      {
        uint64_t v31 = 12LL;
      }

      else if ([v30 isEqual:@"preposition"])
      {
        uint64_t v31 = 13LL;
      }

      else
      {
        if (([v30 isEqual:@"abbreviation"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v31 = 14LL;
      }
    }

    else
    {
      uint64_t v31 = 0LL;
    }

    -[_NSAttributedStringGrammar setPosition:](v4, "setPosition:", v31);
    v32 = (void *)[a3 objectForKeyedSubscript:@"tense"];
    if (v32 && (v33 = v32, ([v32 isEqual:@"none"] & 1) == 0))
    {
      if ([v33 isEqual:@"past"])
      {
        uint64_t v34 = 1LL;
      }

      else if ([v33 isEqual:@"present"])
      {
        uint64_t v34 = 2LL;
      }

      else
      {
        if (([v33 isEqual:@"future"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v34 = 3LL;
      }
    }

    else
    {
      uint64_t v34 = 0LL;
    }

    -[_NSAttributedStringGrammar setTense:](v4, "setTense:", v34);
    v35 = (void *)[a3 objectForKeyedSubscript:@"verbForm"];
    if (!v35)
    {
      v38 = v4;
      uint64_t v37 = 0LL;
LABEL_119:
      -[_NSAttributedStringGrammar setVerbForm:](v38, "setVerbForm:", v37);
      return v4;
    }

    v36 = v35;
    if ([v35 isEqual:@"none"])
    {
      uint64_t v37 = 0LL;
LABEL_118:
      v38 = v4;
      goto LABEL_119;
    }

    if ([v36 isEqual:@"gerund"])
    {
      uint64_t v37 = 1LL;
      goto LABEL_118;
    }

    if ([v36 isEqual:@"participative"])
    {
      uint64_t v37 = 2LL;
      goto LABEL_118;
    }

    if ([v36 isEqual:@"infinitive"])
    {
      uint64_t v37 = 3LL;
      goto LABEL_118;
    }

    if ([v36 isEqual:@"participle"])
    {
      uint64_t v37 = 4LL;
      goto LABEL_118;
    }

    if ([v36 isEqual:@"supine"])
    {
      uint64_t v37 = 5LL;
      goto LABEL_118;
    }

@end