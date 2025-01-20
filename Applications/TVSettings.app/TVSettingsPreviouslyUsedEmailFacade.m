@interface TVSettingsPreviouslyUsedEmailFacade
+ (TVSettingsPreviouslyUsedEmailFacade)sharedInstance;
- (NSArray)previouslyUsedEmails;
- (TVSettingsPreviouslyUsedEmailFacade)init;
- (void)clearAllEntriesWithCompletion:(id)a3;
- (void)deleteEntry:(id)a3 completion:(id)a4;
- (void)setPreviouslyUsedEmails:(id)a3;
- (void)update;
@end

@implementation TVSettingsPreviouslyUsedEmailFacade

+ (TVSettingsPreviouslyUsedEmailFacade)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B334C;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1AE8 != -1) {
    dispatch_once(&qword_1001E1AE8, block);
  }
  return (TVSettingsPreviouslyUsedEmailFacade *)(id)qword_1001E1AE0;
}

- (TVSettingsPreviouslyUsedEmailFacade)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsPreviouslyUsedEmailFacade;
  v2 = -[TVSettingsPreviouslyUsedEmailFacade init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[TIRecentInputs recentInputForIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "recentInputForIdentifier:",  TIEmailRecentInputIdentifier));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 entries]);
    v5 = (NSArray *)[v4 copy];
    previouslyUsedEmails = v2->_previouslyUsedEmails;
    v2->_previouslyUsedEmails = v5;
  }

  return v2;
}

- (void)update
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[TIRecentInputs recentInputForIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "recentInputForIdentifier:",  TIEmailRecentInputIdentifier));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 entries]);
  -[TVSettingsPreviouslyUsedEmailFacade setPreviouslyUsedEmails:](self, "setPreviouslyUsedEmails:", v3);
}

- (void)deleteEntry:(id)a3 completion:(id)a4
{
  v10 = (void (**)(void))a4;
  uint64_t v6 = TIEmailRecentInputIdentifier;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 userInput]);
  +[TIRecentInputs removeInput:forSystemIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "removeInput:forSystemIdentifier:",  v7,  v6);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TIRecentInputs recentInputForIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "recentInputForIdentifier:",  v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 entries]);
  -[TVSettingsPreviouslyUsedEmailFacade setPreviouslyUsedEmails:](self, "setPreviouslyUsedEmails:", v9);

  if (v10) {
    v10[2]();
  }
}

- (void)clearAllEntriesWithCompletion:(id)a3
{
  v7 = (void (**)(void))a3;
  uint64_t v4 = TIEmailRecentInputIdentifier;
  +[TIRecentInputs clearRecentInputForIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "clearRecentInputForIdentifier:",  TIEmailRecentInputIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TIRecentInputs recentInputForIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "recentInputForIdentifier:",  v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 entries]);
  -[TVSettingsPreviouslyUsedEmailFacade setPreviouslyUsedEmails:](self, "setPreviouslyUsedEmails:", v6);

  if (v7) {
    v7[2]();
  }
}

- (NSArray)previouslyUsedEmails
{
  return self->_previouslyUsedEmails;
}

- (void)setPreviouslyUsedEmails:(id)a3
{
}

- (void).cxx_destruct
{
}

@end