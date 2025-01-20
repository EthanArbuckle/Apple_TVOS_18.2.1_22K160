@interface FKACommandsViewController
- (AXSSKeyChord)textEditingModeExitKeyChord;
- (BOOL)_canShowWhileLocked;
- (BOOL)requiresNativeFocus;
- (void)loadView;
- (void)setTextEditingModeExitKeyChord:(id)a3;
@end

@implementation FKACommandsViewController

- (BOOL)requiresNativeFocus
{
  return 1;
}

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKACommandsViewController textEditingModeExitKeyChord](self, "textEditingModeExitKeyChord"));

  v38 = self;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"TEXT_EDITING_MODE_INSTRUCTIONS_TITLE" value:&stru_100020B80 table:0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"TEXT_EDITING_MODE_INSTRUCTIONS_HELP" value:&stru_100020B80 table:0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FKACommandsViewController textEditingModeExitKeyChord](self, "textEditingModeExitKeyChord"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fkaSpeakableDisplayValue]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandListItem itemWithName:keyDescription:]( &OBJC_CLASS___FKACommandListItem,  "itemWithName:keyDescription:",  v8,  v10));
    v52 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandList listWithTitle:items:footerText:]( &OBJC_CLASS___FKACommandList,  "listWithTitle:items:footerText:",  v6,  v12,  0LL));

    self = v38;
    [v3 addObject:v13];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FKAAvailableCommands sharedInstance](&OBJC_CLASS___FKAAvailableCommands, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 categories]);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FKAAvailableCommands sharedInstance](&OBJC_CLASS___FKAAvailableCommands, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 commandMap]);

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = v15;
  id v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v39)
  {
    uint64_t v36 = *(void *)v47;
    v37 = v3;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v18;
        v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        v40 = v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 commands]);
        id v22 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v43;
          do
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v17 keyChordForCommand:v26]);
              v28 = v27;
              if (v27)
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue([v27 fkaSpeakableDisplayValue]);
                v30 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedName]);
                v31 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandListItem itemWithName:keyDescription:]( &OBJC_CLASS___FKACommandListItem,  "itemWithName:keyDescription:",  v30,  v29));

                [v20 addObject:v31];
              }
            }

            id v23 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }

          while (v23);
        }

        v3 = v37;
        self = v38;
        if ([v20 count])
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue([v40 localizedName]);
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[FKACommandList listWithTitle:items:footerText:]( &OBJC_CLASS___FKACommandList,  "listWithTitle:items:footerText:",  v32,  v20,  0LL));

          [v37 addObject:v33];
        }

        uint64_t v18 = v41 + 1;
      }

      while ((id)(v41 + 1) != v39);
      id v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v39);
  }

  v34 = -[FKACommandsView initWithCommandLists:]( objc_alloc(&OBJC_CLASS___FKAScrollableCommandsView),  "initWithCommandLists:",  v3);
  -[FKACommandsViewController setView:](self, "setView:", v34);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXSSKeyChord)textEditingModeExitKeyChord
{
  return self->_textEditingModeExitKeyChord;
}

- (void)setTextEditingModeExitKeyChord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end