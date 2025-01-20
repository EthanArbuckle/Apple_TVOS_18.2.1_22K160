@interface RBDomainAttributeTemplate
- (NSArray)attributeGroups;
- (NSDictionary)additionalRestrictions;
- (NSDictionary)targetBundleProperties;
- (NSString)description;
- (RBDomainRestriction)restriction;
- (RBEntitlementPredicate)originatorEntitlements;
- (RBEntitlementPredicate)targetEntitlements;
- (uint64_t)domain;
- (uint64_t)endowmentNamespace;
- (uint64_t)name;
- (void)setAdditionalRestrictions:(id)a3;
- (void)setAttributeGroups:(id)a3;
- (void)setDomain:(void *)a1;
- (void)setEndowmentNamespace:(void *)a1;
- (void)setName:(void *)a1;
- (void)setOriginatorEntitlements:(id)a3;
- (void)setRestriction:(id)a3;
- (void)setTargetBundleProperties:(id)a3;
- (void)setTargetEntitlements:(id)a3;
@end

@implementation RBDomainAttributeTemplate

- (NSString)description
{
  unint64_t v3 = -[RBEntitlementPredicate count](self->_originatorEntitlements, "count");
  unint64_t v4 = -[RBEntitlementPredicate count](self->_targetEntitlements, "count");
  NSUInteger v5 = -[NSDictionary count](self->_targetBundleProperties, "count");
  NSUInteger v6 = -[NSDictionary count](self->_additionalRestrictions, "count");
  id v33 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  domain = self->_domain;
  endowmentNamespace = self->_endowmentNamespace;
  v8 = @" endowmentNamespace:";
  v9 = &stru_18A257E48;
  if (!endowmentNamespace) {
    v8 = &stru_18A257E48;
  }
  v29 = v8;
  if (endowmentNamespace) {
    v10 = (const __CFString *)self->_endowmentNamespace;
  }
  else {
    v10 = &stru_18A257E48;
  }
  v11 = @"\n\t\t\toriginatorEntitlements: ";
  if (!v3) {
    v11 = &stru_18A257E48;
  }
  v27 = v11;
  v28 = v10;
  unint64_t v38 = v3;
  if (v3)
  {
    -[RBEntitlementPredicate description](self->_originatorEntitlements, "description");
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v34 = &stru_18A257E48;
  }

  v12 = @"\n\t\t\ttargetEntitlements: ";
  if (!v4) {
    v12 = &stru_18A257E48;
  }
  v26 = v12;
  if (v4)
  {
    -[RBEntitlementPredicate description](self->_targetEntitlements, "description");
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v30 = &stru_18A257E48;
  }

  v13 = @"\n\t\t\ttargetBundleProperties:{\n";
  if (!v5) {
    v13 = &stru_18A257E48;
  }
  v25 = v13;
  if (v5)
  {
    -[NSDictionary entriesToStringWithIndent:debug:]( self->_targetBundleProperties,  "entriesToStringWithIndent:debug:",  4LL,  1LL);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = @"\t\t\t}";
  }

  else
  {
    v24 = &stru_18A257E48;
    v39 = &stru_18A257E48;
  }

  if (v6) {
    v14 = @"\n\t\t\tadditionalRestrictions:{\n";
  }
  else {
    v14 = &stru_18A257E48;
  }
  unint64_t v37 = v4;
  NSUInteger v35 = v6;
  if (v6)
  {
    -[NSDictionary entriesToStringWithIndent:debug:]( self->_additionalRestrictions,  "entriesToStringWithIndent:debug:",  4LL,  1LL);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = @"\t\t\t}";
  }

  else
  {
    v16 = &stru_18A257E48;
    v15 = &stru_18A257E48;
  }

  NSUInteger v17 = v5;
  restriction = self->_restriction;
  if (restriction) {
    v19 = @"\n\t\t\t\t\trestrictions:{\n";
  }
  else {
    v19 = &stru_18A257E48;
  }
  if (restriction)
  {
    -[RBDomainRestriction description](self->_restriction, "description");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_restriction) {
      v9 = @"\n\t\t\t\t\t}";
    }
  }

  else
  {
    v20 = &stru_18A257E48;
  }
  v21 = -[NSArray componentsJoinedByString:](self->_attributeGroups, "componentsJoinedByString:", @",\n\t\t\t\t");
  v22 = (void *)[v33 initWithFormat:@"<%@| domain:%@ name:%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@\n\t\t\tattributeGroups:[\n\t\t\t\t%@\n\t\t\t]>", v36, domain, name, v29, v28, v27, v34, v26, v30, v25, v39, v24, v14, v15, v16, v19, v20, v9, v21];

  if (restriction) {
  if (v35)
  }

  if (v17) {
  if (v37)
  }

  if (v38) {
  return (NSString *)v22;
  }
}

- (NSArray)attributeGroups
{
  attributeGroups = self->_attributeGroups;
  if (attributeGroups) {
    return attributeGroups;
  }
  [MEMORY[0x189603F18] array];
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setAttributeGroups:(id)a3
{
}

- (uint64_t)domain
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setDomain:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16LL);
  }
}

- (uint64_t)name
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setName:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 24LL);
  }
}

- (RBEntitlementPredicate)originatorEntitlements
{
  return self->_originatorEntitlements;
}

- (void)setOriginatorEntitlements:(id)a3
{
}

- (NSDictionary)targetBundleProperties
{
  return self->_targetBundleProperties;
}

- (void)setTargetBundleProperties:(id)a3
{
}

- (RBEntitlementPredicate)targetEntitlements
{
  return self->_targetEntitlements;
}

- (void)setTargetEntitlements:(id)a3
{
}

- (NSDictionary)additionalRestrictions
{
  return self->_additionalRestrictions;
}

- (void)setAdditionalRestrictions:(id)a3
{
}

- (RBDomainRestriction)restriction
{
  return self->_restriction;
}

- (void)setRestriction:(id)a3
{
}

- (uint64_t)endowmentNamespace
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (void)setEndowmentNamespace:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72LL);
  }
}

- (void).cxx_destruct
{
}

@end