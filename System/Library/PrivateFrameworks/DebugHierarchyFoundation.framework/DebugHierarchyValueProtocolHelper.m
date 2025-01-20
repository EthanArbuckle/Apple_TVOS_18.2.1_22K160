@interface DebugHierarchyValueProtocolHelper
+ (BOOL)objectImplementsRequiredDebugHierarchyValueMethods:(id)a3;
+ (id)debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4 onObject:(id)a5;
@end

@implementation DebugHierarchyValueProtocolHelper

+ (BOOL)objectImplementsRequiredDebugHierarchyValueMethods:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "debugHierarchyValueWithOutOptions:outError:") & 1) != 0) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector(v3, "fallback_debugHierarchyValueWithOutOptions:outError:");
  }

  return v4 & 1;
}

+ (id)debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4 onObject:(id)a5
{
  id v7 = a5;
  if ((objc_opt_respondsToSelector(v7, "debugHierarchyValueWithOutOptions:outError:") & 1) != 0)
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    v8 = (id *)&v19;
    v9 = (id *)&v18;
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 debugHierarchyValueWithOutOptions:&v19 outError:&v18]);
    goto LABEL_5;
  }

  if ((objc_opt_respondsToSelector(v7, "fallback_debugHierarchyValueWithOutOptions:outError:") & 1) != 0)
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    v8 = (id *)&v17;
    v9 = (id *)&v16;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fallback_debugHierarchyValueWithOutOptions:outError:", &v17, &v16));
LABEL_5:
    v11 = (void *)v10;
    id v12 = *v8;
    id v13 = *v9;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  v11 = 0LL;
  id v13 = 0LL;
  id v12 = 0LL;
  if (a3) {
LABEL_6:
  }
    *a3 = v12;
LABEL_7:
  if (a4) {
    *a4 = v13;
  }
  id v14 = v11;

  return v14;
}

@end