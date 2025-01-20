@interface SRVisualResponseTransformer
+ (id)_splitVisualResponse:(id)a3 forVisualResponseSnippet:(id)a4;
+ (id)transformVisualResponse:(id)a3 forMode:(unint64_t)a4 idiom:(int64_t)a5 shouldHideSnippet:(BOOL)a6;
+ (int64_t)_dialogModeToVisualModeConverter:(unint64_t)a3;
+ (int64_t)currentIdiom;
+ (int64_t)visualMode;
+ (void)setVisualMode:(int64_t)a3;
@end

@implementation SRVisualResponseTransformer

+ (int64_t)visualMode
{
  return qword_1000D7AC8;
}

+ (void)setVisualMode:(int64_t)a3
{
  qword_1000D7AC8 = a3;
}

+ (id)transformVisualResponse:(id)a3 forMode:(unint64_t)a4 idiom:(int64_t)a5 shouldHideSnippet:(BOOL)a6
{
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  v29 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 views]);
  id v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v35;
    v31 = v11;
    unint64_t v32 = a4;
    BOOL v30 = a6;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v16);
        objc_opt_class(&OBJC_CLASS___SAUIPluginSnippet, v13);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
        {
          if (a6) {
            goto LABEL_13;
          }
          objc_msgSend(a1, "setVisualMode:", objc_msgSend(a1, "_dialogModeToVisualModeConverter:", a4));
LABEL_12:
          -[NSMutableArray addObject:](v10, "addObject:", v17);
          goto LABEL_13;
        }

        objc_opt_class(&OBJC_CLASS___SAUIVisualResponseSnippet, v13);
        if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0) {
          goto LABEL_12;
        }
        if (!a6)
        {
          id v20 = v17;
          v21 = v10;
          id v22 = [a1 _dialogModeToVisualModeConverter:a4];
          [a1 setVisualMode:v22];
          v23 = (void *)objc_claimAutoreleasedReturnValue([v20 modelData]);
          id v24 = v22;
          v10 = v21;
          a6 = v30;
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[VRXVisualResponseProvider transformModel:mode:currentIdiom:]( &OBJC_CLASS___VRXVisualResponseProvider,  "transformModel:mode:currentIdiom:",  v23,  v24,  a5));

          v26 = (void *)objc_claimAutoreleasedReturnValue([a1 _splitVisualResponse:v25 forVisualResponseSnippet:v20]);
          -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v26);

          a4 = v32;
          v11 = v31;
        }

+ (int64_t)currentIdiom
{
  return 5LL;
}

+ (id)_splitVisualResponse:(id)a3 forVisualResponseSnippet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v27;
    uint64_t v24 = SAAceViewUIItemTypeItemTypeConversationValue;
    uint64_t v12 = SAAceViewUIItemTypeItemTypeResultValue;
    do
    {
      uint64_t v13 = 0LL;
      int v14 = v10;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v13);
        id v16 = objc_msgSend(v6, "copy", v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 model]);
        [v16 setModelData:v17];

        id v18 = [v15 responseType];
        uint64_t v19 = v12;
        if (v18 == (id)1 || (v20 = objc_msgSend(v15, "responseType", v12), uint64_t v19 = v24, v20 == (id)2)) {
          [v16 setItemType:v19];
        }
        if (v14 + (int)v13 >= 1)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID", v19));
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
          [v16 setAceId:v22];
        }

        -[NSMutableArray addObject:](v7, "addObject:", v16);

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v9 != v13);
      int v10 = v14 + (_DWORD)v9;
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v9);
  }

  return v7;
}

+ (int64_t)_dialogModeToVisualModeConverter:(unint64_t)a3
{
  return a3 - 1 < 2;
}

@end