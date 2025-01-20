@interface RBAttributeContext
- (BOOL)isActiveDueToInheritedEndowment;
- (BOOL)targetIsSystem;
- (NSDictionary)savedEndowments;
- (RBAssertion)assertion;
- (RBBundleProperties)originatorProperties;
- (RBBundleProperties)targetProperties;
- (RBBundlePropertiesManaging)bundlePropertiesManager;
- (RBConcreteTargeting)target;
- (RBDomainAttributeManaging)domainAttributeManager;
- (RBEntitlementManaging)entitlementManager;
- (RBEntitlementPossessing)originatorEntitlements;
- (RBEntitlementPossessing)targetEntitlements;
- (RBInheritanceCollection)availableInheritances;
- (RBProcess)originatorProcess;
- (RBProcess)targetProcess;
- (RBProcessState)initialProcessState;
- (RBSAssertionIdentifier)assertionID;
- (RBSProcessIdentity)targetIdentity;
- (RBSystemState)systemState;
- (void)popActiveDueToInheritedEndowment;
- (void)pushActiveDueToInheritedEndowment;
- (void)setAssertion:(id)a3;
- (void)setAvailableInheritances:(id)a3;
- (void)setBundlePropertiesManager:(id)a3;
- (void)setDomainAttributeManager:(id)a3;
- (void)setEntitlementManager:(id)a3;
- (void)setInitialProcessState:(id)a3;
- (void)setSavedEndowments:(id)a3;
- (void)setSystemState:(id)a3;
@end

@implementation RBAttributeContext

- (void)setAssertion:(id)a3
{
  id v25 = a3;
  objc_storeStrong((id *)&self->_assertion, a3);
  [v25 identifier];
  v5 = (RBSAssertionIdentifier *)objc_claimAutoreleasedReturnValue();
  assertionID = self->_assertionID;
  self->_assertionID = v5;

  target = self->_target;
  [v25 target];
  v8 = (RBConcreteTargeting *)objc_claimAutoreleasedReturnValue();
  if (target == v8) {
    goto LABEL_8;
  }
  v9 = v8;
  if (!target || !v8)
  {

    goto LABEL_7;
  }

  char v10 = -[RBConcreteTargeting isEqual:](target, "isEqual:", v8);

  if ((v10 & 1) == 0)
  {
LABEL_7:
    [v25 target];
    v11 = (RBConcreteTargeting *)objc_claimAutoreleasedReturnValue();
    v12 = self->_target;
    self->_target = v11;

    -[RBConcreteTargeting process](self->_target, "process");
    v13 = (RBProcess *)objc_claimAutoreleasedReturnValue();
    targetProcess = self->_targetProcess;
    self->_targetProcess = v13;

    -[RBConcreteTargeting identity](self->_target, "identity");
    v15 = (RBSProcessIdentity *)objc_claimAutoreleasedReturnValue();
    targetIdentity = self->_targetIdentity;
    self->_targetIdentity = v15;

    self->_targetIsSystem = -[RBConcreteTargeting isSystem](self->_target, "isSystem");
    targetProperties = self->_targetProperties;
    self->_targetProperties = 0LL;

    target = self->_targetEntitlements;
    self->_targetEntitlements = 0LL;
LABEL_8:
  }

  originatorProcess = self->_originatorProcess;
  [v25 originator];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (originatorProcess != v19)
  {
    v20 = v19;
    if (originatorProcess && v19)
    {
      char v21 = [originatorProcess isEqual:v19];

      if ((v21 & 1) != 0) {
        goto LABEL_17;
      }
    }

    else
    {
    }

    [v25 originator];
    v22 = (RBProcess *)objc_claimAutoreleasedReturnValue();
    v23 = self->_originatorProcess;
    self->_originatorProcess = v22;

    originatorProperties = self->_originatorProperties;
    self->_originatorProperties = 0LL;

    originatorProcess = self->_originatorEntitlements;
    self->_originatorEntitlements = 0LL;
  }

LABEL_17:
}

- (void)setSystemState:(id)a3
{
}

- (RBBundleProperties)targetProperties
{
  if (!self->_targetProperties)
  {
    targetIdentity = self->_targetIdentity;
    if (targetIdentity)
    {
      bundlePropertiesManager = self->_bundlePropertiesManager;
      v5 = -[RBProcess identifier](self->_targetProcess, "identifier");
      -[RBBundlePropertiesManaging propertiesForIdentity:identifier:]( bundlePropertiesManager,  "propertiesForIdentity:identifier:",  targetIdentity,  v5);
      v6 = (RBBundleProperties *)objc_claimAutoreleasedReturnValue();
      targetProperties = self->_targetProperties;
      self->_targetProperties = v6;
    }

    else
    {
      v8 = objc_alloc_init(&OBJC_CLASS___RBBundleProperties);
      v5 = self->_targetProperties;
      self->_targetProperties = v8;
    }
  }

  return self->_targetProperties;
}

- (RBEntitlementPossessing)targetEntitlements
{
  if (!self->_targetEntitlements)
  {
    if (self->_targetProcess)
    {
      -[RBEntitlementManaging entitlementsForProcess:](self->_entitlementManager, "entitlementsForProcess:");
      v3 = (RBEntitlementPossessing *)objc_claimAutoreleasedReturnValue();
      targetEntitlements = self->_targetEntitlements;
      self->_targetEntitlements = v3;
    }

    else
    {
      v5 = objc_alloc(&OBJC_CLASS___RBEntitlements);
      [MEMORY[0x189604010] set];
      targetEntitlements = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[RBEntitlements _initWithEntitlements:](v5, "_initWithEntitlements:", targetEntitlements);
      v7 = self->_targetEntitlements;
      self->_targetEntitlements = v6;
    }
  }

  return self->_targetEntitlements;
}

- (RBBundleProperties)originatorProperties
{
  if (!self->_originatorProperties)
  {
    v3 = -[RBProcess identity](self->_originatorProcess, "identity");
    if (v3)
    {
      bundlePropertiesManager = self->_bundlePropertiesManager;
      v5 = -[RBProcess identity](self->_originatorProcess, "identity");
      v6 = -[RBProcess identifier](self->_originatorProcess, "identifier");
      -[RBBundlePropertiesManaging propertiesForIdentity:identifier:]( bundlePropertiesManager,  "propertiesForIdentity:identifier:",  v5,  v6);
      v7 = (RBBundleProperties *)objc_claimAutoreleasedReturnValue();
      originatorProperties = self->_originatorProperties;
      self->_originatorProperties = v7;
    }

    else
    {
      v9 = objc_alloc_init(&OBJC_CLASS___RBBundleProperties);
      v5 = self->_originatorProperties;
      self->_originatorProperties = v9;
    }
  }

  return self->_originatorProperties;
}

- (RBEntitlementPossessing)originatorEntitlements
{
  if (!self->_originatorEntitlements)
  {
    if (self->_originatorProcess)
    {
      -[RBEntitlementManaging entitlementsForProcess:](self->_entitlementManager, "entitlementsForProcess:");
      v3 = (RBEntitlementPossessing *)objc_claimAutoreleasedReturnValue();
      originatorEntitlements = self->_originatorEntitlements;
      self->_originatorEntitlements = v3;
    }

    else
    {
      v5 = objc_alloc(&OBJC_CLASS___RBEntitlements);
      [MEMORY[0x189604010] set];
      originatorEntitlements = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[RBEntitlements _initWithEntitlements:](v5, "_initWithEntitlements:", originatorEntitlements);
      v7 = self->_originatorEntitlements;
      self->_originatorEntitlements = v6;
    }
  }

  return self->_originatorEntitlements;
}

- (void)pushActiveDueToInheritedEndowment
{
}

- (void)popActiveDueToInheritedEndowment
{
}

- (BOOL)isActiveDueToInheritedEndowment
{
  return self->_activeDueToInheritedEndowmentCount != 0;
}

- (RBProcess)targetProcess
{
  return self->_targetProcess;
}

- (RBProcess)originatorProcess
{
  return self->_originatorProcess;
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (RBAssertion)assertion
{
  return self->_assertion;
}

- (RBSAssertionIdentifier)assertionID
{
  return self->_assertionID;
}

- (RBConcreteTargeting)target
{
  return self->_target;
}

- (BOOL)targetIsSystem
{
  return self->_targetIsSystem;
}

- (RBSProcessIdentity)targetIdentity
{
  return self->_targetIdentity;
}

- (RBProcessState)initialProcessState
{
  return self->_initialProcessState;
}

- (void)setInitialProcessState:(id)a3
{
}

- (RBInheritanceCollection)availableInheritances
{
  return self->_availableInheritances;
}

- (void)setAvailableInheritances:(id)a3
{
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return self->_domainAttributeManager;
}

- (void)setDomainAttributeManager:(id)a3
{
}

- (RBBundlePropertiesManaging)bundlePropertiesManager
{
  return self->_bundlePropertiesManager;
}

- (void)setBundlePropertiesManager:(id)a3
{
}

- (RBEntitlementManaging)entitlementManager
{
  return self->_entitlementManager;
}

- (void)setEntitlementManager:(id)a3
{
}

- (NSDictionary)savedEndowments
{
  return self->_savedEndowments;
}

- (void)setSavedEndowments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end