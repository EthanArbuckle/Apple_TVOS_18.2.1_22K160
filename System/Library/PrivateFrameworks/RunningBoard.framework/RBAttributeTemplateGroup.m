@interface RBAttributeTemplateGroup
- (NSArray)attributes;
- (NSDictionary)additionalRestrictions;
- (NSDictionary)targetBundleProperties;
- (NSString)description;
- (RBDomainRestriction)restriction;
- (RBEntitlementPredicate)originatorEntitlements;
- (RBEntitlementPredicate)targetEntitlements;
- (void)setAdditionalRestrictions:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setOriginatorEntitlements:(id)a3;
- (void)setRestriction:(id)a3;
- (void)setTargetBundleProperties:(id)a3;
- (void)setTargetEntitlements:(id)a3;
@end

@implementation RBAttributeTemplateGroup

- (NSString)description
{
  unint64_t v3 = -[RBEntitlementPredicate count](self->_originatorEntitlements, "count");
  unint64_t v4 = -[RBEntitlementPredicate count](self->_targetEntitlements, "count");
  NSUInteger v5 = -[NSDictionary count](self->_targetBundleProperties, "count");
  NSUInteger v6 = -[NSDictionary count](self->_additionalRestrictions, "count");
  id v37 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = -[NSArray componentsJoinedByString:](self->_attributes, "componentsJoinedByString:", @",\n\t\t\t\t\t\t");
  v8 = @"\n\t\t\t\t\toriginatorEntitlements: ";
  if (!v3) {
    v8 = &stru_18A257E48;
  }
  v35 = v8;
  if (v3)
  {
    -[RBEntitlementPredicate description](self->_originatorEntitlements, "description");
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = &stru_18A257E48;
  }

  v10 = @"\n\t\t\t\t\ttargetEntitlements: ";
  if (!v4) {
    v10 = &stru_18A257E48;
  }
  v34 = v10;
  if (v4)
  {
    -[RBEntitlementPredicate description](self->_targetEntitlements, "description");
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v11 = &stru_18A257E48;
  }

  v12 = @"\n\t\t\t\t\ttargetBundleProperties:{\n";
  if (!v5) {
    v12 = &stru_18A257E48;
  }
  v33 = v12;
  v38 = v9;
  if (v5)
  {
    -[NSDictionary entriesToStringWithIndent:debug:]( self->_targetBundleProperties,  "entriesToStringWithIndent:debug:",  6LL,  1LL);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = @"\n\t\t\t\t\t}";
  }

  else
  {
    v32 = &stru_18A257E48;
    v40 = &stru_18A257E48;
  }

  v36 = v11;
  if (v6) {
    v13 = @"\n\t\t\t\t\tadditionalRestrictions:{\n";
  }
  else {
    v13 = &stru_18A257E48;
  }
  if (v6)
  {
    -[NSDictionary entriesToStringWithIndent:debug:]( self->_additionalRestrictions,  "entriesToStringWithIndent:debug:",  6LL,  1LL);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = @"\n\t\t\t\t\t}";
  }

  else
  {
    v15 = &stru_18A257E48;
    v14 = &stru_18A257E48;
  }

  restriction = self->_restriction;
  if (restriction)
  {
    uint64_t v17 = -[RBDomainRestriction description](restriction, "description");
    NSUInteger v31 = v6;
    NSUInteger v18 = v5;
    unint64_t v19 = v3;
    v20 = (void *)v17;
    v21 = @"\n\t\t\t\t\t}";
    if (!self->_restriction) {
      v21 = &stru_18A257E48;
    }
    v29 = v15;
    v27 = v13;
    v22 = (__CFString *)v36;
    v23 = (__CFString *)v38;
    v24 = (void *)v39;
    v25 = (void *)[v37 initWithFormat:@"<%@|\n\t\t\t\t\tattributes:[\n\t\t\t\t\t\t%@\n\t\t\t\t\t]%@%@%@%@%@%@%@%@%@%@%@%@%@>", v7, v39, v35, v38, v34, v36, v33, v40, v32, v27, v14, v29, @"\n\t\t\t\t\trestrictions:{\n", v17, v21];

    unint64_t v3 = v19;
    NSUInteger v5 = v18;
    if (v31) {
      goto LABEL_26;
    }
  }

  else
  {
    v30 = v15;
    v28 = v13;
    v22 = (__CFString *)v36;
    v23 = (__CFString *)v38;
    v24 = (void *)v39;
    v25 = (void *)[v37 initWithFormat:@"<%@|\n\t\t\t\t\tattributes:[\n\t\t\t\t\t\t%@\n\t\t\t\t\t]%@%@%@%@%@%@%@%@%@%@%@%@%@>", v7, v39, v35, v38, v34, v36, v33, v40, v32, v28, v14, v30, &stru_18A257E48, &stru_18A257E48, &stru_18A257E48];
    if (v6) {
LABEL_26:
    }
  }

  if (v5) {

  }
  if (v4) {
  if (v3)
  }

  return (NSString *)v25;
}

- (NSArray)attributes
{
  attributes = self->_attributes;
  if (attributes) {
    return attributes;
  }
  [MEMORY[0x189603F18] array];
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setAttributes:(id)a3
{
}

- (NSDictionary)targetBundleProperties
{
  return self->_targetBundleProperties;
}

- (void)setTargetBundleProperties:(id)a3
{
}

- (RBEntitlementPredicate)originatorEntitlements
{
  return self->_originatorEntitlements;
}

- (void)setOriginatorEntitlements:(id)a3
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

- (void).cxx_destruct
{
}

@end