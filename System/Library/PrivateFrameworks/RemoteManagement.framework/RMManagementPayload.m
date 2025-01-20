@interface RMManagementPayload
- (BOOL)_loadAnyDeclaration:(id)a3 error:(id *)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)reloadReturningError:(id *)a3;
- (void)failedLoadingWithError:(id)a3;
@end

@implementation RMManagementPayload

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___RMModelAnyDeclaration);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    unsigned __int8 v8 = -[RMManagementPayload _loadAnyDeclaration:error:](self, "_loadAnyDeclaration:error:", v6, a4);
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___RMModelManagementBase);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      id v10 = v6;
      id v22 = 0LL;
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serializeAsDataWithType:0 error:&v22]);
      id v12 = v22;
      v13 = v12;
      unsigned __int8 v8 = v11 != 0LL;
      if (v11)
      {
        -[RMManagementPayload setPayload:](self, "setPayload:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v10 declarationType]);
        -[RMManagementPayload setDeclarationType:](self, "setDeclarationType:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementPayload serverToken](self, "serverToken"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v10 declarationServerToken]);
        -[RMManagementPayload setLoadState:](self, "setLoadState:", 1LL);
      }

      else
      {
        if (a4 && v12) {
          *a4 = v12;
        }
        -[RMManagementPayload failedLoadingWithError:](self, "failedLoadingWithError:", v13);
      }
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelManagementBase rm_payloadTypeName]( &OBJC_CLASS___RMModelManagementBase,  "rm_payloadTypeName"));
      id v18 = objc_msgSend((id)objc_opt_class(v6), "rm_payloadTypeName");
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createIncorrectPayloadTypeErrorWithExpectedType:actualType:]( &OBJC_CLASS___RMErrorUtilities,  "createIncorrectPayloadTypeErrorWithExpectedType:actualType:",  v17,  v19));

      if (a4 && v20) {
        *a4 = v20;
      }
      -[RMManagementPayload failedLoadingWithError:](self, "failedLoadingWithError:", v20);

      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (BOOL)reloadReturningError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementPayload payload](self, "payload"));
  id v16 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelDeclarationBase loadData:serializationType:error:]( &OBJC_CLASS___RMModelDeclarationBase,  "loadData:serializationType:error:",  v5,  0LL,  &v16));
  id v7 = v16;

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___RMModelAnyDeclaration);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    BOOL v9 = 1;
  }

  else
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___RMModelManagementBase);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      BOOL v9 = 1;
      -[RMManagementPayload setLoadState:](self, "setLoadState:", 1LL);
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelManagementBase rm_payloadTypeName]( &OBJC_CLASS___RMModelManagementBase,  "rm_payloadTypeName"));
      id v12 = objc_msgSend((id)objc_opt_class(v6), "rm_payloadTypeName");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createIncorrectPayloadTypeErrorWithExpectedType:actualType:]( &OBJC_CLASS___RMErrorUtilities,  "createIncorrectPayloadTypeErrorWithExpectedType:actualType:",  v11,  v13));

      if (a3 && v14) {
        *a3 = v14;
      }
      -[RMManagementPayload failedLoadingWithError:](self, "failedLoadingWithError:", v14);

      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_loadAnyDeclaration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v14 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serializeAsDataWithType:0 error:&v14]);
  id v8 = v14;
  BOOL v9 = v8;
  if (v7)
  {
    -[RMManagementPayload setPayload:](self, "setPayload:", v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 declarationType]);
    -[RMManagementPayload setDeclarationType:](self, "setDeclarationType:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementPayload serverToken](self, "serverToken"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 declarationServerToken]);
    -[RMManagementPayload setLoadState:](self, "setLoadState:", 4LL);
  }

  else
  {
    if (a4 && v8) {
      *a4 = v8;
    }
    -[RMManagementPayload failedLoadingWithError:](self, "failedLoadingWithError:", v9);
  }

  return v7 != 0LL;
}

- (void)failedLoadingWithError:(id)a3
{
}

@end