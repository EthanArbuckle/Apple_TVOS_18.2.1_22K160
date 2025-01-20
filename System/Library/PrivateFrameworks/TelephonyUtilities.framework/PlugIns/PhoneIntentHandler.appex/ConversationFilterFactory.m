@interface ConversationFilterFactory
+ (id)makeFilterForINCallGroupConversationFilter:(id)a3 contactsDataSource:(id)a4;
@end

@implementation ConversationFilterFactory

+ (id)makeFilterForINCallGroupConversationFilter:(id)a3 contactsDataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callGroup]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 callGroup]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SimpleConversationFilter filterForCallGroup:]( &OBJC_CLASS___SimpleConversationFilter,  "filterForCallGroup:",  v9));

    -[NSMutableArray addObject:](v7, "addObject:", v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 caller]);
  if (v11)
  {
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 participants]);
    id v13 = [v12 count];

    if (!v13) {
      goto LABEL_7;
    }
  }

  v14 = objc_alloc(&OBJC_CLASS___ConversationPersonFilter);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 caller]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 participants]);
  v17 = -[ConversationPersonFilter initWithCaller:participants:dataSource:]( v14,  "initWithCaller:participants:dataSource:",  v15,  v16,  v6);

  -[NSMutableArray addObject:](v7, "addObject:", v17);
LABEL_7:
  v18 = (void *)objc_claimAutoreleasedReturnValue([v5 matchCallerAndParticipantsExactly]);
  unsigned int v19 = [v18 BOOLValue];

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v5 participants]);
    v21 = (char *)[v20 count];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v5 caller]);
    if (v22) {
      ++v21;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[SimpleConversationFilter filterForParticipantCount:]( &OBJC_CLASS___SimpleConversationFilter,  "filterForParticipantCount:",  v21));
    -[NSMutableArray addObject:](v7, "addObject:", v23);
  }

  v24 = -[AndConversationFilter initWithFilters:]( objc_alloc(&OBJC_CLASS___AndConversationFilter),  "initWithFilters:",  v7);

  return v24;
}

@end