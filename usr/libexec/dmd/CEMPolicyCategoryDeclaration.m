@interface CEMPolicyCategoryDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMPolicyCategoryDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration payloadMode](self, "payloadMode"));
  if ((DMDDeclarationModeIsValid(v7) & 1) != 0)
  {
    v8 = objc_opt_new(&OBJC_CLASS___DMDSetEffectivePolicyRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);
    -[DMDSetEffectivePolicyRequest setOrganizationIdentifier:](v8, "setOrganizationIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration declarationIdentifier](self, "declarationIdentifier"));
    -[DMDSetEffectivePolicyRequest setDeclarationIdentifier:](v8, "setDeclarationIdentifier:", v10);

    -[DMDSetEffectivePolicyRequest setType:](v8, "setType:", DMFEffectivePolicyTypeCategory);
    -[DMDSetEffectivePolicyRequest setPolicy:](v8, "setPolicy:", DMDPolicyFromDeclarationMode(v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration payloadCategoriesVersion2](self, "payloadCategoriesVersion2"));
    if (v11)
    {
      -[DMDSetEffectivePolicyRequest setIdentifiers:](v8, "setIdentifiers:", v11);
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration payloadCategories](self, "payloadCategories"));
      -[DMDSetEffectivePolicyRequest setIdentifiers:](v8, "setIdentifiers:", v14);
    }

    if (v7)
    {
      if ([v7 caseInsensitiveCompare:DMFDeclarationPayloadModeOverride]) {
        uint64_t v15 = 100LL;
      }
      else {
        uint64_t v15 = 1LL;
      }
    }

    else
    {
      uint64_t v15 = 100LL;
    }

    -[DMDSetEffectivePolicyRequest setPriority:](v8, "setPriority:", v15);
    id v21 = 0LL;
    unsigned int v16 = +[DMDSetEffectivePolicyOperation validateRequest:error:]( &OBJC_CLASS___DMDSetEffectivePolicyOperation,  "validateRequest:error:",  v8,  &v21);
    id v17 = v21;
    if (v16)
    {
      v13 = v8;
    }

    else
    {
      uint64_t v18 = DMFConfigurationEngineLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000602D4(v17);
      }

      v13 = 0LL;
      if (a4) {
        *a4 = v17;
      }
    }

    goto LABEL_20;
  }

  if (a4)
  {
    uint64_t v22 = DMFInvalidParameterErrorKey;
    uint64_t v23 = DMFDeclarationPayloadModeKey;
    v8 = (DMDSetEffectivePolicyRequest *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    uint64_t v12 = DMFErrorWithCodeAndUserInfo(4000LL, v8);
    v13 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
LABEL_20:

    goto LABEL_21;
  }

  v13 = 0LL;
LABEL_21:

  return v13;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new(&OBJC_CLASS___DMDRemoveEffectivePolicyRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);

  -[DMDRemoveEffectivePolicyRequest setOrganizationIdentifier:](v7, "setOrganizationIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyCategoryDeclaration declarationIdentifier](self, "declarationIdentifier"));
  -[DMDRemoveEffectivePolicyRequest setDeclarationIdentifier:](v7, "setDeclarationIdentifier:", v9);

  id v15 = 0LL;
  LODWORD(v6) = +[DMDRemoveEffectivePolicyOperation validateRequest:error:]( &OBJC_CLASS___DMDRemoveEffectivePolicyOperation,  "validateRequest:error:",  v7,  &v15);
  id v10 = v15;
  if ((_DWORD)v6)
  {
    v11 = v7;
  }

  else
  {
    uint64_t v12 = DMFConfigurationEngineLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100060350(v10);
    }

    v11 = 0LL;
    if (a4) {
      *a4 = v10;
    }
  }

  return v11;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0LL;
}

@end