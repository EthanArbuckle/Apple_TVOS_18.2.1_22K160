@interface DebugHierarchyMetaDataProviderProtocolHelper
+ (BOOL)classImplementsRequiredEnumDescriptionMethods:(Class)a3;
+ (BOOL)classImplementsRequiredOptionDescriptionMethods:(Class)a3;
+ (id)debugHierarchyEnumDescriptionsOnClass:(Class)a3;
+ (id)debugHierarchyOptionDescriptionsOnClass:(Class)a3;
@end

@implementation DebugHierarchyMetaDataProviderProtocolHelper

+ (BOOL)classImplementsRequiredEnumDescriptionMethods:(Class)a3
{
  if ((objc_opt_respondsToSelector(a3, "debugHierarchyEnumDescriptions") & 1) != 0) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector(a3, "fallback_debugHierarchyEnumDescriptions");
  }
  return v4 & 1;
}

+ (BOOL)classImplementsRequiredOptionDescriptionMethods:(Class)a3
{
  if ((objc_opt_respondsToSelector(a3, "debugHierarchyOptionDescriptions") & 1) != 0) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector(a3, "fallback_debugHierarchyOptionDescriptions");
  }
  return v4 & 1;
}

+ (id)debugHierarchyEnumDescriptionsOnClass:(Class)a3
{
  if ((objc_opt_respondsToSelector(a3, "debugHierarchyEnumDescriptions") & 1) != 0)
  {
    char v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class debugHierarchyEnumDescriptions](a3, "debugHierarchyEnumDescriptions"));
  }

  else if ((objc_opt_respondsToSelector(a3, "fallback_debugHierarchyEnumDescriptions") & 1) != 0)
  {
    char v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class fallback_debugHierarchyEnumDescriptions](a3, "fallback_debugHierarchyEnumDescriptions"));
  }

  else
  {
    char v4 = 0LL;
  }

  return v4;
}

+ (id)debugHierarchyOptionDescriptionsOnClass:(Class)a3
{
  if ((objc_opt_respondsToSelector(a3, "debugHierarchyOptionDescriptions") & 1) != 0)
  {
    char v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class debugHierarchyOptionDescriptions](a3, "debugHierarchyOptionDescriptions"));
  }

  else if ((objc_opt_respondsToSelector(a3, "fallback_debugHierarchyOptionDescriptions") & 1) != 0)
  {
    char v4 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class fallback_debugHierarchyOptionDescriptions]( a3,  "fallback_debugHierarchyOptionDescriptions"));
  }

  else
  {
    char v4 = 0LL;
  }

  return v4;
}

@end