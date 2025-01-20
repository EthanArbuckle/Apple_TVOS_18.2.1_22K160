@interface ContactSlotResolutionHelper
- (ContactPool)availableContacts;
- (ContactSlotResolutionHelper)initWithUnresolvedPerson:(id)a3 availableContacts:(id)a4;
- (INPerson)unresolvedPerson;
- (id)_lookup:(id)a3;
- (id)buildConfirmationResultForContact:(id)a3 withReason:(int64_t)a4;
- (id)buildDisambiguationResultForContacts:(id)a3;
@end

@implementation ContactSlotResolutionHelper

- (ContactSlotResolutionHelper)initWithUnresolvedPerson:(id)a3 availableContacts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ContactSlotResolutionHelper;
  v9 = -[ContactSlotResolutionHelper init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unresolvedPerson, a3);
    objc_storeStrong((id *)&v10->_availableContacts, a4);
  }

  return v10;
}

- (id)buildConfirmationResultForContact:(id)a3 withReason:(int64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSlotResolutionHelper _lookup:](self, "_lookup:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSlotResolutionHelper unresolvedPerson](self, "unresolvedPerson"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 personHandle]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
  id v10 = [v8 type];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 label]);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[StartCallIntentHandlerUtilities inPersonFromContact:handleValue:handleType:handleLabel:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "inPersonFromContact:handleValue:handleType:handleLabel:",  v6,  v9,  v10,  v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:forReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "confirmationRequiredWithPersonToConfirm:forReason:",  v12,  a4));
  return v13;
}

- (id)buildDisambiguationResultForContacts:(id)a3
{
  id v4 = a3;
  v20 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSlotResolutionHelper unresolvedPerson](self, "unresolvedPerson"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 personHandle]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( -[ContactSlotResolutionHelper _lookup:]( v5,  "_lookup:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v11)));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
        id v14 = [v7 type];
        v15 = (void *)objc_claimAutoreleasedReturnValue([v7 label]);
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[StartCallIntentHandlerUtilities inPersonFromContact:handleValue:handleType:handleLabel:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "inPersonFromContact:handleValue:handleType:handleLabel:",  v12,  v13,  v14,  v15));

        -[NSMutableArray addObject:](v20, "addObject:", v16);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v9);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "disambiguationWithPeopleToDisambiguate:",  v20));
  return v17;
}

- (id)_lookup:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactSlotResolutionHelper availableContacts](self, "availableContacts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contactWithId:v4]);

  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Contacts map did not contain UUID of recommended contact.",  0LL));
    [v7 raise];
  }

  return v6;
}

- (INPerson)unresolvedPerson
{
  return self->_unresolvedPerson;
}

- (ContactPool)availableContacts
{
  return self->_availableContacts;
}

- (void).cxx_destruct
{
}

@end