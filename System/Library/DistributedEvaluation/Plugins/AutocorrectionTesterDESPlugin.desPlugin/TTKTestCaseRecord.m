@interface TTKTestCaseRecord
- (NSArray)additionalIntendedTexts;
- (NSArray)intendedText;
- (NSArray)touchDataCollection;
- (NSMutableDictionary)annotations;
- (NSString)context;
- (NSString)inputText;
- (NSString)layoutName;
- (NSString)primaryIntendedText;
- (NSString)recordID;
- (NSString)transliteration;
- (TIContinuousPath)touchData;
- (TTKTestCaseRecord)initWithDictionary:(id)a3;
- (TTKTestCaseRecord)initWithIntendedText:(id)a3 additionalIntendedTexts:(id)a4 touchDataCollection:(id)a5 recordID:(id)a6 layoutName:(id)a7 inputText:(id)a8 transliteration:(id)a9 context:(id)a10 annotations:(id)a11;
- (id)toJsonDictionary;
- (void)setAnnotation:(id)a3 forKey:(id)a4;
@end

@implementation TTKTestCaseRecord

- (TTKTestCaseRecord)initWithIntendedText:(id)a3 additionalIntendedTexts:(id)a4 touchDataCollection:(id)a5 recordID:(id)a6 layoutName:(id)a7 inputText:(id)a8 transliteration:(id)a9 context:(id)a10 annotations:(id)a11
{
  id v34 = a3;
  id v18 = a4;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v28 = a10;
  v19 = v18;
  id v20 = a11;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TTKTestCaseRecord;
  v21 = -[TTKTestCaseRecord init](&v35, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_primaryIntendedText, a3);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v19));
    additionalIntendedTexts = v22->_additionalIntendedTexts;
    v22->_additionalIntendedTexts = (NSArray *)v23;

    objc_storeStrong((id *)&v22->_inputText, a8);
    objc_storeStrong((id *)&v22->_transliteration, a9);
    objc_storeStrong((id *)&v22->_context, a10);
    objc_storeStrong((id *)&v22->_touchDataCollection, a5);
    objc_storeStrong((id *)&v22->_recordID, a6);
    objc_storeStrong((id *)&v22->_layoutName, a7);
    if (v20)
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v20));
      internalAnnotations = v22->_internalAnnotations;
      v22->_internalAnnotations = (NSMutableDictionary *)v25;
    }
  }

  return v22;
}

- (TTKTestCaseRecord)initWithDictionary:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___TTKTestCaseRecord;
  v5 = -[TTKTestCaseRecord init](&v39, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"layout_name"]);
    layoutName = v5->_layoutName;
    v5->_layoutName = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"intended_text"]);
    primaryIntendedText = v5->_primaryIntendedText;
    v5->_primaryIntendedText = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"alternate_intended_texts"]);
    if (v10)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v10));
      additionalIntendedTexts = v5->_additionalIntendedTexts;
      v5->_additionalIntendedTexts = (NSArray *)v11;
    }

    id v34 = (void *)v10;
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"input_text"]);
    inputText = v5->_inputText;
    v5->_inputText = (NSString *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"transliteration"]);
    transliteration = v5->_transliteration;
    v5->_transliteration = (NSString *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"record_id"]);
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"annotations"]);
    if (v19)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v19));
      internalAnnotations = v5->_internalAnnotations;
      v5->_internalAnnotations = (NSMutableDictionary *)v20;
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"context"]);
    context = v5->_context;
    v5->_context = (NSString *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"touch_events"]);
    uint64_t v25 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v26 = v24;
    id v27 = [v26 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        id v30 = 0LL;
        do
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = -[TIContinuousPath initWithJsonDictionary:]( objc_alloc(&OBJC_CLASS___TIContinuousPath),  "initWithJsonDictionary:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)v30));
          -[NSArray addObject:](v25, "addObject:", v31);

          id v30 = (char *)v30 + 1;
        }

        while (v28 != v30);
        id v28 = [v26 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v28);
    }

    touchDataCollection = v5->_touchDataCollection;
    v5->_touchDataCollection = v25;
  }

  return v5;
}

- (id)toJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v3 setObject:self->_layoutName forKeyedSubscript:@"layout_name"];
  [v3 setObject:self->_primaryIntendedText forKeyedSubscript:@"intended_text"];
  [v3 setObject:self->_recordID forKeyedSubscript:@"record_id"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v5 = self->_touchDataCollection;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v9), "toJsonDictionary", (void)v17));
        [v4 addObject:v10];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"touch_events"];
  additionalIntendedTexts = self->_additionalIntendedTexts;
  if (additionalIntendedTexts) {
    [v3 setObject:additionalIntendedTexts forKeyedSubscript:@"additional_intended_texts"];
  }
  inputText = self->_inputText;
  if (inputText) {
    [v3 setObject:inputText forKeyedSubscript:@"input_text"];
  }
  transliteration = self->_transliteration;
  if (transliteration) {
    [v3 setObject:transliteration forKeyedSubscript:@"transliteration"];
  }
  context = self->_context;
  if (context) {
    [v3 setObject:context forKeyedSubscript:@"context"];
  }
  internalAnnotations = self->_internalAnnotations;

  return v3;
}

- (void)setAnnotation:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  internalAnnotations = self->_internalAnnotations;
  if (!internalAnnotations)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v9 = self->_internalAnnotations;
    self->_internalAnnotations = v8;

    internalAnnotations = self->_internalAnnotations;
  }

  -[NSMutableDictionary setValue:forKey:](internalAnnotations, "setValue:forKey:", v10, v6);
}

- (NSMutableDictionary)annotations
{
  return self->_internalAnnotations;
}

- (TIContinuousPath)touchData
{
  v3 = -[NSArray count](self->_touchDataCollection, "count");
  if (v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_touchDataCollection, "objectAtIndex:", 0LL));
  }
  return (TIContinuousPath *)v3;
}

- (NSArray)intendedText
{
  return +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", self->_primaryIntendedText);
}

- (NSString)primaryIntendedText
{
  return self->_primaryIntendedText;
}

- (NSArray)additionalIntendedTexts
{
  return self->_additionalIntendedTexts;
}

- (NSString)inputText
{
  return self->_inputText;
}

- (NSString)transliteration
{
  return self->_transliteration;
}

- (NSArray)touchDataCollection
{
  return self->_touchDataCollection;
}

- (NSString)layoutName
{
  return self->_layoutName;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
}

@end