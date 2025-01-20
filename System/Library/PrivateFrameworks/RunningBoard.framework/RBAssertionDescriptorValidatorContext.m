@interface RBAssertionDescriptorValidatorContext
+ (id)context;
- (BOOL)ignoreRestrictions;
- (BOOL)targetIsSystem;
- (NSDictionary)savedEndowments;
- (RBAssertionAcquisitionContext)acquisitionContext;
- (RBAssertionDescriptorValidator)assertionDescriptionValidator;
- (RBBundleProperties)originatorProperties;
- (RBBundleProperties)targetProperties;
- (RBBundlePropertiesManaging)bundlePropertiesManager;
- (RBConcreteTargeting)target;
- (RBDomainAttributeManaging)domainAttributeManager;
- (RBEntitlementManaging)entitlementManager;
- (RBEntitlementPossessing)originatorEntitlements;
- (RBEntitlementPossessing)targetEntitlements;
- (RBProcess)originatorProcess;
- (RBProcess)targetProcess;
- (RBProcessState)originatorState;
- (RBProcessState)targetState;
- (RBSAssertionDescriptor)assertionDescriptor;
- (RBSProcessIdentifier)targetIdentifier;
- (RBSProcessIdentity)originatorIdentity;
- (RBSProcessIdentity)targetIdentity;
- (RBSystemState)systemState;
- (id)copyWithZone:(_NSZone *)a3;
- (void)popIgnoreRestrictions;
- (void)pushIgnoreRestrictions;
- (void)setAcquisitionContext:(id)a3;
- (void)setAssertionDescriptionValidator:(id)a3;
- (void)setAssertionDescriptor:(id)a3;
- (void)setBundlePropertiesManager:(id)a3;
- (void)setDomainAttributeManager:(id)a3;
- (void)setEntitlementManager:(id)a3;
- (void)setOriginatorEntitlements:(id)a3;
- (void)setOriginatorProcess:(id)a3;
- (void)setOriginatorState:(id)a3;
- (void)setSavedEndowments:(id)a3;
- (void)setSystemState:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTargetEntitlements:(id)a3;
- (void)setTargetIdentifier:(id)a3;
- (void)setTargetIdentity:(id)a3;
- (void)setTargetProcess:(id)a3;
- (void)setTargetProperties:(id)a3;
- (void)setTargetState:(id)a3;
@end

@implementation RBAssertionDescriptorValidatorContext

+ (id)context
{
  return objc_alloc_init(&OBJC_CLASS___RBAssertionDescriptorValidatorContext);
}

- (void)pushIgnoreRestrictions
{
}

- (void)popIgnoreRestrictions
{
}

- (BOOL)ignoreRestrictions
{
  return self->_ignoreRestrictions != 0;
}

- (void)setTarget:(id)a3
{
  id v5 = a3;
  char v6 = [v5 isSystem];

  self->_targetIsSystem = v6;
}

- (void)setTargetProcess:(id)a3
{
}

- (void)setTargetProperties:(id)a3
{
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
      -[RBBundlePropertiesManaging propertiesForIdentity:identifier:]( self->_bundlePropertiesManager,  "propertiesForIdentity:identifier:",  targetIdentity,  self->_targetIdentifier);
      v4 = (RBBundleProperties *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v4 = objc_alloc_init(&OBJC_CLASS___RBBundleProperties);
    }

    targetProperties = self->_targetProperties;
    self->_targetProperties = v4;
  }

  return self->_targetProperties;
}

- (RBEntitlementManaging)entitlementManager
{
  if (-[RBAssertionDescriptorValidatorContext ignoreRestrictions](self, "ignoreRestrictions")) {
    v3 = objc_alloc_init(&OBJC_CLASS___RBIgnoreAllEntitlementsManager);
  }
  else {
    v3 = self->_entitlementManager;
  }
  return (RBEntitlementManaging *)v3;
}

- (RBEntitlementPossessing)originatorEntitlements
{
  if (-[RBAssertionDescriptorValidatorContext ignoreRestrictions](self, "ignoreRestrictions"))
  {
    v3 = objc_alloc_init(&OBJC_CLASS___RBIgnoreAllEntitlementsManager);
  }

  else
  {
    originatorEntitlements = self->_originatorEntitlements;
    if (!originatorEntitlements)
    {
      -[RBEntitlementManaging entitlementsForProcess:]( self->_entitlementManager,  "entitlementsForProcess:",  self->_originatorProcess);
      id v5 = (RBEntitlementPossessing *)objc_claimAutoreleasedReturnValue();
      char v6 = self->_originatorEntitlements;
      self->_originatorEntitlements = v5;

      originatorEntitlements = self->_originatorEntitlements;
    }

    v3 = originatorEntitlements;
  }

  return (RBEntitlementPossessing *)v3;
}

- (RBEntitlementPossessing)targetEntitlements
{
  if (-[RBAssertionDescriptorValidatorContext ignoreRestrictions](self, "ignoreRestrictions"))
  {
    v3 = objc_alloc_init(&OBJC_CLASS___RBIgnoreAllEntitlementsManager);
  }

  else
  {
    if (!self->_targetEntitlements)
    {
      targetProcess = self->_targetProcess;
      if ((!targetProcess || -[RBProcess isTerminating](targetProcess, "isTerminating"))
        && -[RBAssertionAcquisitionContext allowAbstractTarget](self->_acquisitionContext, "allowAbstractTarget"))
      {
        id v5 = objc_alloc_init(&OBJC_CLASS___RBIgnoreAllEntitlementsManager);
      }

      else
      {
        -[RBEntitlementManaging entitlementsForProcess:]( self->_entitlementManager,  "entitlementsForProcess:",  self->_targetProcess);
        id v5 = (RBIgnoreAllEntitlementsManager *)objc_claimAutoreleasedReturnValue();
      }

      targetEntitlements = self->_targetEntitlements;
      self->_targetEntitlements = (RBEntitlementPossessing *)v5;
    }

    v3 = self->_targetEntitlements;
  }

  return (RBEntitlementPossessing *)v3;
}

- (RBSProcessIdentity)originatorIdentity
{
  return -[RBProcess identity](self->_originatorProcess, "identity");
}

- (void)setAcquisitionContext:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[RBAssertionDescriptorValidatorContext init]( +[RBAssertionDescriptorValidatorContext allocWithZone:]( &OBJC_CLASS___RBAssertionDescriptorValidatorContext,  "allocWithZone:",  a3),  "init");
  -[RBAssertionDescriptorValidatorContext setAssertionDescriptionValidator:]( v4,  "setAssertionDescriptionValidator:",  self->_assertionDescriptionValidator);
  -[RBAssertionDescriptorValidatorContext setAssertionDescriptor:]( v4,  "setAssertionDescriptor:",  self->_assertionDescriptor);
  -[RBAssertionDescriptorValidatorContext setOriginatorProcess:](v4, "setOriginatorProcess:", self->_originatorProcess);
  -[RBAssertionDescriptorValidatorContext setOriginatorState:](v4, "setOriginatorState:", self->_originatorState);
  -[RBAssertionDescriptorValidatorContext setTarget:](v4, "setTarget:", self->_target);
  -[RBAssertionDescriptorValidatorContext setTargetProcess:](v4, "setTargetProcess:", self->_targetProcess);
  -[RBAssertionDescriptorValidatorContext setTargetIdentity:](v4, "setTargetIdentity:", self->_targetIdentity);
  -[RBAssertionDescriptorValidatorContext setTargetIdentifier:](v4, "setTargetIdentifier:", self->_targetIdentifier);
  -[RBAssertionDescriptorValidatorContext setTargetState:](v4, "setTargetState:", self->_targetState);
  -[RBAssertionDescriptorValidatorContext setBundlePropertiesManager:]( v4,  "setBundlePropertiesManager:",  self->_bundlePropertiesManager);
  -[RBAssertionDescriptorValidatorContext setDomainAttributeManager:]( v4,  "setDomainAttributeManager:",  self->_domainAttributeManager);
  -[RBAssertionDescriptorValidatorContext setEntitlementManager:]( v4,  "setEntitlementManager:",  self->_entitlementManager);
  v4->_ignoreRestrictions = self->_ignoreRestrictions;
  objc_storeStrong((id *)&v4->_acquisitionContext, self->_acquisitionContext);
  return v4;
}

- (RBProcess)targetProcess
{
  return self->_targetProcess;
}

- (void)setTargetEntitlements:(id)a3
{
}

- (RBProcess)originatorProcess
{
  return self->_originatorProcess;
}

- (void)setOriginatorProcess:(id)a3
{
}

- (RBBundleProperties)originatorProperties
{
  return self->_originatorProperties;
}

- (void)setOriginatorEntitlements:(id)a3
{
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (RBAssertionDescriptorValidator)assertionDescriptionValidator
{
  return self->_assertionDescriptionValidator;
}

- (void)setAssertionDescriptionValidator:(id)a3
{
}

- (RBSAssertionDescriptor)assertionDescriptor
{
  return self->_assertionDescriptor;
}

- (void)setAssertionDescriptor:(id)a3
{
}

- (RBProcessState)originatorState
{
  return self->_originatorState;
}

- (void)setOriginatorState:(id)a3
{
}

- (RBConcreteTargeting)target
{
  return self->_target;
}

- (RBSProcessIdentity)targetIdentity
{
  return self->_targetIdentity;
}

- (void)setTargetIdentity:(id)a3
{
}

- (RBSProcessIdentifier)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
}

- (RBProcessState)targetState
{
  return self->_targetState;
}

- (void)setTargetState:(id)a3
{
}

- (RBAssertionAcquisitionContext)acquisitionContext
{
  return self->_acquisitionContext;
}

- (void)setEntitlementManager:(id)a3
{
}

- (RBBundlePropertiesManaging)bundlePropertiesManager
{
  return self->_bundlePropertiesManager;
}

- (void)setBundlePropertiesManager:(id)a3
{
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return self->_domainAttributeManager;
}

- (void)setDomainAttributeManager:(id)a3
{
}

- (NSDictionary)savedEndowments
{
  return self->_savedEndowments;
}

- (void)setSavedEndowments:(id)a3
{
}

- (BOOL)targetIsSystem
{
  return self->_targetIsSystem;
}

- (void).cxx_destruct
{
}

@end