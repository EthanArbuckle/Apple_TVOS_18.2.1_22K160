@interface PBSiriScreenActionItem
- (AXElement)accessibilityElement;
- (BOOL)_isEqualToSiriScreenItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)performDeferredAction;
- (NSDictionary)parameters;
- (NSDictionary)semanticContext;
- (NSString)actionName;
- (NSString)identifier;
- (PBSiriScreenActionItem)initWithAccessibilityElement:(id)a3;
- (id)_defaultIdentifier;
- (id)_defaultSemanticContext;
- (id)_firstAvailableChooseActionName;
- (id)description;
- (unint64_t)hash;
- (void)setAccessibilityElement:(id)a3;
- (void)setActionName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
- (void)setSemanticContext:(id)a3;
- (void)storeDeferredActionWithName:(id)a3 parameters:(id)a4;
@end

@implementation PBSiriScreenActionItem

- (PBSiriScreenActionItem)initWithAccessibilityElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBSiriScreenActionItem;
  v6 = -[PBSiriScreenActionItem init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessibilityElement, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionItem identifier](self, "identifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionItem identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement semanticContext](self->_accessibilityElement, "semanticContext"));
  if (v4) {
    id v5 = @"NO";
  }
  else {
    id v5 = @"YES";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement description](self->_accessibilityElement, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Identifier: %@, Generated Semantic Context: %@, AX Info: %@",  v3,  v5,  v6));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PBSiriScreenActionItem *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___PBSiriScreenActionItem);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
      BOOL v6 = -[PBSiriScreenActionItem _isEqualToSiriScreenItem:](self, "_isEqualToSiriScreenItem:", v4);
    }
    else {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSDictionary)semanticContext
{
  semanticContext = self->_semanticContext;
  if (!semanticContext)
  {
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[AXElement semanticContext](self->_accessibilityElement, "semanticContext"));
    if (!v4)
    {
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionItem _defaultSemanticContext](self, "_defaultSemanticContext"));
      if (!v4) {
        v4 = (NSDictionary *)&__NSDictionary0__struct;
      }
    }

    uint64_t v5 = self->_semanticContext;
    self->_semanticContext = v4;

    semanticContext = self->_semanticContext;
  }

  return semanticContext;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionItem _defaultIdentifier](self, "_defaultIdentifier"));
    uint64_t v5 = self->_identifier;
    self->_identifier = v4;

    identifier = self->_identifier;
  }

  return identifier;
}

- (BOOL)performDeferredAction
{
  id v3 = self->_actionName;
  v4 = self->_parameters;
  if (-[NSString isEqual:](v3, "isEqual:", PBSActivateScreenItemActionName))
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionItem _firstAvailableChooseActionName](self, "_firstAvailableChooseActionName"));

    id v3 = (NSString *)v5;
  }

  unsigned __int8 v6 = -[NSString isEqual:](v3, "isEqual:", TVSCDefaultChooseSemanticActionName);
  uint64_t v7 = TVSCDefaultConsumeSemanticActionName;
  if ((v6 & 1) != 0 || -[NSString isEqual:](v3, "isEqual:", TVSCDefaultConsumeSemanticActionName))
  {
    else {
      uint64_t v8 = 4000LL;
    }
    -[AXElement scrollToVisible](self->_accessibilityElement, "scrollToVisible");
    if ((-[AXElement isNativeFocused](self->_accessibilityElement, "isNativeFocused") & 1) != 0
      || -[AXElement setNativeFocus](self->_accessibilityElement, "setNativeFocus"))
    {
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement elementForAttribute:](self->_accessibilityElement, "elementForAttribute:", 2142LL));
      unsigned __int8 v10 = [v9 performAction:v8];

      goto LABEL_20;
    }

- (void)storeDeferredActionWithName:(id)a3 parameters:(id)a4
{
  unsigned __int8 v6 = (NSString *)a3;
  uint64_t v7 = (NSDictionary *)a4;
  actionName = self->_actionName;
  self->_actionName = v6;
  objc_super v9 = v6;

  parameters = self->_parameters;
  self->_parameters = v7;
}

- (id)_defaultSemanticContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement label](self->_accessibilityElement, "label"));
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCSemanticContextFactory buttonSemanticContextWithName:]( &OBJC_CLASS___TVSCSemanticContextFactory,  "buttonSemanticContextWithName:",  v2));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 linkedDataDictionary]);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (id)_defaultIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionItem semanticContext](self, "semanticContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", TVSCSchemaDotOrgNameKey));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"|" withString:&stru_1003E2910]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement identifier](self->_accessibilityElement, "identifier"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v8,  v5,  v6));
  return v9;
}

- (BOOL)_isEqualToSiriScreenItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionItem identifier](self, "identifier"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (id)_firstAvailableChooseActionName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionItem semanticContext](self, "semanticContext"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tvs_arrayForKey:", TVSCSchemaDotOrgPotentialActionKey));

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = TVSCJSONLinkedDataTypeKey;
    uint64_t v9 = TVSCSchemaDotOrgTypeChooseAction;
    uint64_t v10 = TVSCSchemaDotOrgNameKey;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvs_stringForKey:", v8, (void)v17));
        if ([v13 isEqual:v9])
        {
          uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvs_stringForKey:", v10));
          if (v14)
          {
            v15 = (void *)v14;

            goto LABEL_12;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v15 = 0LL;
LABEL_12:

  return v15;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setSemanticContext:(id)a3
{
}

- (AXElement)accessibilityElement
{
  return self->_accessibilityElement;
}

- (void)setAccessibilityElement:(id)a3
{
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end