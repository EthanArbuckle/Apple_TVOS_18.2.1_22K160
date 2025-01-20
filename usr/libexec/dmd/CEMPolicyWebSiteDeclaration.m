@interface CEMPolicyWebSiteDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMPolicyWebSiteDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyWebSiteDeclaration payloadMode](self, "payloadMode"));
  if ((DMDDeclarationModeIsValid(v7) & 1) != 0)
  {
    v8 = objc_opt_new(&OBJC_CLASS___DMDSetEffectivePolicyRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);
    -[DMDSetEffectivePolicyRequest setOrganizationIdentifier:](v8, "setOrganizationIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyWebSiteDeclaration declarationIdentifier](self, "declarationIdentifier"));
    -[DMDSetEffectivePolicyRequest setDeclarationIdentifier:](v8, "setDeclarationIdentifier:", v10);

    -[DMDSetEffectivePolicyRequest setType:](v8, "setType:", DMFEffectivePolicyTypeWeb);
    -[DMDSetEffectivePolicyRequest setPolicy:](v8, "setPolicy:", DMDPolicyFromDeclarationMode(v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyWebSiteDeclaration payloadHostnames](self, "payloadHostnames"));
    -[DMDSetEffectivePolicyRequest setIdentifiers:](v8, "setIdentifiers:", v11);

    if (v7)
    {
      if ([v7 caseInsensitiveCompare:DMFDeclarationPayloadModeOverride]) {
        uint64_t v12 = 100LL;
      }
      else {
        uint64_t v12 = 1LL;
      }
    }

    else
    {
      uint64_t v12 = 100LL;
    }

    -[DMDSetEffectivePolicyRequest setPriority:](v8, "setPriority:", v12);
    id v20 = 0LL;
    unsigned int v15 = +[DMDSetEffectivePolicyOperation validateRequest:error:]( &OBJC_CLASS___DMDSetEffectivePolicyOperation,  "validateRequest:error:",  v8,  &v20);
    id v16 = v20;
    if (v15)
    {
      v14 = v8;
    }

    else
    {
      uint64_t v17 = DMFConfigurationEngineLog();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000602D4(v16);
      }

      v14 = 0LL;
      if (a4) {
        *a4 = v16;
      }
    }

    goto LABEL_17;
  }

  if (a4)
  {
    uint64_t v21 = DMFInvalidParameterErrorKey;
    uint64_t v22 = DMFDeclarationPayloadModeKey;
    v8 = (DMDSetEffectivePolicyRequest *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    uint64_t v13 = DMFErrorWithCodeAndUserInfo(4000LL, v8);
    v14 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
LABEL_17:

    goto LABEL_18;
  }

  v14 = 0LL;
LABEL_18:

  return v14;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new(&OBJC_CLASS___DMDRemoveEffectivePolicyRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);

  -[DMDRemoveEffectivePolicyRequest setOrganizationIdentifier:](v7, "setOrganizationIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CEMPolicyWebSiteDeclaration declarationIdentifier](self, "declarationIdentifier"));
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
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
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