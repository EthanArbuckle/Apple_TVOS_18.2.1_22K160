@interface WFIsolatedShortcutRunner
- (WFIsolatedShortcutRunner)init;
- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4;
- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4;
- (void)injectResolvedContent:(id)a3 asVariableWithName:(id)a4 completionHandler:(id)a5;
- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6;
- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4;
- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)runToolWithInvocation:(id)a3;
@end

@implementation WFIsolatedShortcutRunner

- (WFIsolatedShortcutRunner)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WFIsolatedShortcutRunner;
  return -[WFIsolatedShortcutRunner initWithProcessPolicy:](&v3, "initWithProcessPolicy:", 0LL);
}

- (void)runToolWithInvocation:(id)a3
{
  id v8 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[WFToolKitHelper createActionFromEncodedToolInvocation:error:]( &OBJC_CLASS___WFToolKitHelper,  "createActionFromEncodedToolInvocation:error:",  a3,  &v8));
  id v6 = v8;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"WFIsolatedShortcutRunner.m", 30, @"Faulty encoded tool invocation: %@", v6 object file lineNumber description];
  }

  -[WFIsolatedShortcutRunner stepWithAction:](self, "stepWithAction:", v5);
}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFIsolatedShortcutRunner accessSpecifier](self, "accessSpecifier"));
  unsigned __int8 v10 = [v9 allowVariableInjection];

  if ((v10 & 1) != 0)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v7 variableContent]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___WFToolKitTypedValueContent);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WFIsolatedShortcutRunner workflowController](self, "workflowController"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100056714;
      v16[3] = &unk_100066FA0;
      id v18 = v8;
      v16[4] = self;
      id v11 = v11;
      id v17 = v11;
      [v11 resolveWithVariableSource:v13 completionHandler:v16];
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v15 handleFailureInMethod:a2, self, @"WFIsolatedShortcutRunner.m", 50, @"Got contents that Shortcuts doesn't recognize: %@", v11 object file lineNumber description];
    }
  }

  else
  {
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    v20 = @"You're not entitled to inject variables into a workflow execution";
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  v11));
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v14);
  }
}

- (void)injectResolvedContent:(id)a3 asVariableWithName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void *, void))a5;
  if (v9)
  {
    id v11 = v9;
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
  }

  id v13 = [[WFUserDefinedVariable alloc] initWithName:v11 variableProvider:0 aggrandizements:0];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WFIsolatedShortcutRunner workflowController](self, "workflowController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  unsigned __int8 v16 = [v14 setContent:v8 forVariableWithName:v15];

  if ((v16 & 1) != 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 serializedRepresentation]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[WFAnyPropertyListObject objectWithPropertyListObject:]( &OBJC_CLASS___WFAnyPropertyListObject,  "objectWithPropertyListObject:",  v17));
    v10[2](v10, v18, 0LL);
  }

  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    v22 = @"Couldn't inject content to variable table";
    NSErrorUserInfoKey v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  88LL,  v19));
    ((void (**)(id, void *, void *))v10)[2](v10, 0LL, v20);
  }
}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFIsolatedShortcutRunner accessSpecifier](self, "accessSpecifier"));
  unsigned __int8 v12 = [v11 allowVariableInjection];

  if ((v12 & 1) != 0)
  {
    id v19 = 0LL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[WFToolKitHelper produceVariableFromEncodedReference:error:]( &OBJC_CLASS___WFToolKitHelper,  "produceVariableFromEncodedReference:error:",  v8,  &v19));
    id v14 = v19;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[WFIsolatedShortcutRunner workflowController](self, "workflowController"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000566EC;
      v16[3] = &unk_100066FC8;
      id v18 = v10;
      id v17 = v9;
      [v13 retrieveContentCollectionWithVariableSource:v15 completionHandler:v16];
    }

    else
    {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v14);
    }
  }

  else
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v21 = @"You're not entitled to extract variables out of a workflow execution";
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  1LL,  v14));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v13);
  }
}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, id))a6;
  switch(+[WFToolKitHelper valueSetTypeForDefinition:]( &OBJC_CLASS___WFToolKitHelper,  "valueSetTypeForDefinition:",  v12))
  {
    case 0LL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v15 handleFailureInMethod:a2 object:self file:@"WFIsolatedShortcutRunner.m" lineNumber:96 description:@"Can't parse value set definition"];

      goto LABEL_3;
    case 1LL:
LABEL_3:
      id v78 = 0LL;
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[WFToolKitHelper decodeDynamicEnumerationDefinition:error:]( &OBJC_CLASS___WFToolKitHelper,  "decodeDynamicEnumerationDefinition:error:",  v12,  &v78));
      id v17 = v78;
      if (!v16)
      {
        v14[2](v14, 0LL, v17);
        goto LABEL_37;
      }

      id v77 = v17;
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[WFToolKitHelper createActionFromEncodedToolInvocation:error:]( &OBJC_CLASS___WFToolKitHelper,  "createActionFromEncodedToolInvocation:error:",  v13,  &v77));
      id v19 = v77;

      if (!v18)
      {
        NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
        v90 = @"Action backing this tool not found.";
        v33 = v19;
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
        id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  v34));

        v14[2](v14, 0LL, v17);
        goto LABEL_36;
      }

      v62 = v19;
      NSErrorUserInfoKey v20 = (void *)objc_claimAutoreleasedReturnValue([v16 parameterKey]);
      NSErrorUserInfoKey v21 = (void *)objc_claimAutoreleasedReturnValue([v18 parameterForKey:v20]);

      v64 = v21;
      if (!v21)
      {
        NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
        v35 = (void *)objc_claimAutoreleasedReturnValue([v16 parameterKey]);
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Parameter %@ not found.",  v35));
        v88 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
        id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  v37));

        v14[2](v14, 0LL, v17);
        goto LABEL_35;
      }

      id v22 = v21;
      unsigned int v23 = [v22 conformsToProtocol:&OBJC_PROTOCOL___WFParameterValuePickable];
      char v24 = v23;
      if (v23) {
        v25 = v22;
      }
      else {
        v25 = 0LL;
      }
      id v60 = v25;

      if ((v24 & 1) == 0)
      {
        NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
        v38 = (void *)objc_claimAutoreleasedReturnValue([v16 parameterKey]);
        v39 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Parameter %@ is not enumerable: %@.",  v38,  objc_opt_class(v22));
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v86 = v40;
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
        id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  v41));

LABEL_23:
        v14[2](v14, 0LL, v17);
        goto LABEL_34;
      }

      if (v11)
      {
        id v76 = v62;
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[WFToolKitHelper decodeSearchStringInEncodedQuery:error:]( &OBJC_CLASS___WFToolKitHelper,  "decodeSearchStringInEncodedQuery:error:",  v11,  &v76));
        id v17 = v76;

        if (!v26) {
          goto LABEL_23;
        }
      }

      else
      {
        v26 = 0LL;
        id v17 = v62;
      }

      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472LL;
      v72[2] = sub_10005644C;
      v72[3] = &unk_100067018;
      v75 = v14;
      id v73 = v22;
      id v74 = v18;
      objc_msgSend(v73, "wf_loadStatesWithSearchTerm:completionHandler:", v26, v72);

LABEL_34:
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_42:
      return;
    case 2LL:
      id v71 = 0LL;
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[WFToolKitHelper decodeContentPropertyPossibleValuesDefinition:error:]( &OBJC_CLASS___WFToolKitHelper,  "decodeContentPropertyPossibleValuesDefinition:error:",  v12,  &v71));
      id v28 = v71;
      if (v27)
      {
        v29 = (objc_class *)[v27 contentItemClass];
        if (v29)
        {
          v30 = v29;
          char v31 = objc_opt_respondsToSelector(v29, "allProperties");
          if ((v31 & 1) != 0) {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class allProperties](v30, "allProperties"));
          }
          else {
            v32 = 0LL;
          }
          uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSArray);
          id v45 = sub_100056524(v32, v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          if ((v31 & 1) != 0) {

          }
          v65 = v46;
          if (v46)
          {
            v69[0] = _NSConcreteStackBlock;
            v69[1] = 3221225472LL;
            v69[2] = sub_100056638;
            v69[3] = &unk_100067040;
            id v47 = v27;
            id v70 = v47;
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "if_firstObjectPassingTest:", v69));
            v49 = v48;
            if (v48)
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue([v48 possibleValues]);
              v66[0] = _NSConcreteStackBlock;
              v66[1] = 3221225472LL;
              v66[2] = sub_1000566CC;
              v66[3] = &unk_100067068;
              id v67 = v49;
              v68 = v14;
              [v50 getValuesWithCompletionBlock:v66];
            }

            else
            {
              NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
              v63 = (void *)objc_claimAutoreleasedReturnValue([v47 propertyName]);
              v56 = NSStringFromClass(v30);
              v61 = (void *)objc_claimAutoreleasedReturnValue(v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a content property on %@",  v63,  v61));
              v80 = v57;
              v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
              uint64_t v59 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  v58));

              v14[2](v14, 0LL, (id)v59);
              id v28 = (id)v59;
            }
          }

          else
          {
            NSErrorUserInfoKey v81 = NSLocalizedDescriptionKey;
            v51 = NSStringFromClass(v30);
            v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a subclass of WFContentItem",  v52));
            v82 = v53;
            v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v82,  &v81,  1LL));
            uint64_t v55 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  v54));

            v14[2](v14, 0LL, (id)v55);
            id v28 = (id)v55;
          }
        }

        else
        {
          NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
          v84 = @"Content item class not found.";
          v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
          uint64_t v43 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  v42));

          v14[2](v14, 0LL, (id)v43);
          id v28 = (id)v43;
        }
      }

      else
      {
        v14[2](v14, 0LL, v28);
      }

      goto LABEL_42;
    case 3LL:
      +[WFToolKitHelper runLinkQuery:valueSet:completionBlock:]( &OBJC_CLASS___WFToolKitHelper,  "runLinkQuery:valueSet:completionBlock:",  v11,  v12,  v14);
      goto LABEL_42;
    default:
      goto LABEL_42;
  }

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000563C8;
  v6[3] = &unk_100066FF0;
  id v7 = a4;
  id v5 = v7;
  +[WFToolKitHelper produceEncodedDisplayRepresentationForRequest:completionBlock:]( &OBJC_CLASS___WFToolKitHelper,  "produceEncodedDisplayRepresentationForRequest:completionBlock:",  a3,  v6);
}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100056344;
  v8[3] = &unk_100066FF0;
  id v9 = a5;
  id v7 = v9;
  +[WFToolKitHelper resolveDeferredValueForEncodedStorage:encodedExpectedType:completionBlock:]( &OBJC_CLASS___WFToolKitHelper,  "resolveDeferredValueForEncodedStorage:encodedExpectedType:completionBlock:",  a3,  a4,  v8);
}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[WFIsolatedShortcutRunner workflowController](self, "workflowController"));
  +[WFToolKitHelper fetchToolInvocationSummaryForInvocation:variableSource:completionBlock:]( &OBJC_CLASS___WFToolKitHelper,  "fetchToolInvocationSummaryForInvocation:variableSource:completionBlock:",  v7,  v8,  v6);
}

- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFIsolatedShortcutRunner stateMachine](self, "stateMachine"));
  [v8 handlingRequestStateWithReason:@"incoming ToolKit indexing request"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[WFShortcutRunnerSandboxExtensionManager sharedManager]( &OBJC_CLASS___WFShortcutRunnerSandboxExtensionManager,  "sharedManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100056038;
  v12[3] = &unk_1000670E0;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v9 requestSandboxExtensionForToolKitIndexingWithCompletionHandler:v12];
}

@end