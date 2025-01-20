@interface TIEmojiAlternativesServer
+ (id)sharedInstance;
- (void)alternativesForText:(id)a3 completionHandler:(id)a4;
- (void)updateForActiveLocaleIdentifiers:(id)a3;
- (void)updateKeyboardType:(unint64_t)a3 appIdentifier:(id)a4;
@end

@implementation TIEmojiAlternativesServer

+ (id)sharedInstance
{
  if (qword_10001E210 != -1) {
    dispatch_once(&qword_10001E210, &stru_100014798);
  }
  return (id)qword_10001E208;
}

- (void)updateForActiveLocaleIdentifiers:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_localeIdentifiers, "isEqualToArray:", v5))
  {
    objc_storeStrong((id *)&self->_localeIdentifiers, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue( +[TIInputMode inputModeWithIdentifier:]( &OBJC_CLASS___TIInputMode,  "inputModeWithIdentifier:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11),  (void)v15));
          if (v12) {
            [v6 addObject:v12];
          }

          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }

    v13 = -[TIEmojiCandidateGenerator initWithActiveInputModes:]( objc_alloc(&OBJC_CLASS___TIEmojiCandidateGenerator),  "initWithActiveInputModes:",  v6);
    generator = self->_generator;
    self->_generator = v13;
  }
}

- (void)updateKeyboardType:(unint64_t)a3 appIdentifier:(id)a4
{
}

- (void)alternativesForText:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  generator = self->_generator;
  id v8 = v6;
  if (generator)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100004468;
    v9[3] = &unk_1000147C0;
    id v10 = v6;
    -[TIEmojiCandidateGenerator emojiAlternativesForText:completionHandler:]( generator,  "emojiAlternativesForText:completionHandler:",  a3,  v9,  v8);
  }

  else
  {
    (*((void (**)(id, const __CFString *, void *))v6 + 2))(v6, &stru_100014CC0, &__NSArray0__struct);
  }
}

- (void).cxx_destruct
{
}

@end