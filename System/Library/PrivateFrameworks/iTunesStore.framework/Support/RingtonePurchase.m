@interface RingtonePurchase
+ (id)entityFromContext:(id)a3;
- (void)_assignToContact:(id)a3 inContactStore:(id)a4 withSoundIdentifier:(id)a5;
- (void)_assignToContactWithID:(id)a3 withIdentifier:(id)a4;
- (void)_assignToPersonWithID:(int)a3 withIdentifier:(id)a4;
- (void)applyUserActionWithToneIdentifier:(id)a3;
- (void)loadFromPurchase:(id)a3;
@end

@implementation RingtonePurchase

+ (id)entityFromContext:(id)a3
{
  return objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"),  "entitiesByName"),  "objectForKey:",  @"RingtonePurchase");
}

- (void)applyUserActionWithToneIdentifier:(id)a3
{
  id v5 = -[RingtonePurchase assignToPersonID](self, "assignToPersonID");
  if (v5)
  {
    v6 = v5;
    if ((uint64_t)[v5 integerValue] >= 1) {
      -[RingtonePurchase _assignToPersonWithID:withIdentifier:]( self,  "_assignToPersonWithID:withIdentifier:",  [v6 intValue],  a3);
    }
  }

  id v7 = -[RingtonePurchase assignToContactID](self, "assignToContactID");
  if (v7) {
    -[RingtonePurchase _assignToContactWithID:withIdentifier:](self, "_assignToContactWithID:withIdentifier:", v7, a3);
  }
  uint64_t v8 = objc_msgSend(-[RingtonePurchase shouldMakeDefault](self, "shouldMakeDefault"), "BOOLValue");
  if (objc_msgSend( -[RingtonePurchase shouldMakeDefaultTextTone](self, "shouldMakeDefaultTextTone"),  "BOOLValue")) {
    uint64_t v9 = 2LL;
  }
  else {
    uint64_t v9 = v8;
  }
  if (v9)
  {
    id v10 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"TLToneManager", 7LL));
    [v10 setCurrentToneIdentifier:a3 forAlertType:v9];
  }

- (void)loadFromPurchase:(id)a3
{
}

- (void)_assignToContactWithID:(id)a3 withIdentifier:(id)a4
{
  id v7 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"CNContactStore", 1LL));
  v9[0] = ISWeakLinkedStringConstantForString("CNContactCallAlertKey", 1LL);
  v9[1] = ISWeakLinkedStringConstantForString("CNContactTextAlertKey", 1LL);
  id v8 = objc_msgSend( v7,  "unifiedContactWithIdentifier:keysToFetch:error:",  a3,  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2),  0);
  if (v8) {
    -[RingtonePurchase _assignToContact:inContactStore:withSoundIdentifier:]( self,  "_assignToContact:inContactStore:withSoundIdentifier:",  v8,  v7,  a4);
  }
}

- (void)_assignToPersonWithID:(int)a3 withIdentifier:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"CNContactStore", 1LL));
  -[RingtonePurchase _assignToContactWithID:withIdentifier:]( self,  "_assignToContactWithID:withIdentifier:",  [v7 contactIdentifierFromPersonID:v5],  a4);
}

- (void)_assignToContact:(id)a3 inContactStore:(id)a4 withSoundIdentifier:(id)a5
{
  id v9 = [a3 mutableCopy];
  id v10 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"CNActivityAlert", 1)),  "initWithSound:vibration:ignoreMute:",  a5,  0,  0);
  id v11 = -[RingtonePurchase assigneeToneStyle](self, "assigneeToneStyle");
  else {
    [v9 setCallAlert:v10];
  }

  id v12 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"CNSaveRequest", 1LL));
  [v12 updateContact:v9];
  id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v13) {
    id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v14 = [v13 shouldLog];
  else {
    LODWORD(v15) = v14;
  }
  v16 = (os_log_s *)[v13 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    uint64_t v15 = v15;
  }
  else {
    v15 &= 2u;
  }
  if ((_DWORD)v15)
  {
    int v30 = 138412802;
    uint64_t v31 = objc_opt_class(self);
    __int16 v32 = 2112;
    id v33 = a5;
    __int16 v34 = 2112;
    id v35 = [a3 identifier];
    uint64_t v17 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Assigning tone (%@) to contact (%@).",  &v30,  32);
    if (v17)
    {
      v18 = (void *)v17;
      v19 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
      free(v18);
      v27 = v19;
      SSFileLog(v13, @"%@");
    }
  }

  v29 = 0LL;
  if ((objc_msgSend(a4, "executeSaveRequest:error:", v12, &v29, v27) & 1) == 0)
  {
    id v20 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v20) {
      id v20 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v21 = [v20 shouldLog];
    else {
      LODWORD(v22) = v21;
    }
    v23 = (os_log_s *)[v20 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      uint64_t v24 = objc_opt_class(self);
      int v30 = 138412546;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      id v33 = v29;
      LODWORD(v28) = 22;
      uint64_t v25 = _os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  1LL,  "%@: Failed to assign tone to contact. %@",  &v30,  v28);
      if (v25)
      {
        v26 = (void *)v25;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v25, 4LL);
        free(v26);
        SSFileLog(v20, @"%@");
      }
    }
  }
}

@end