@interface _DASActivityDependency
+ (id)dependencyFromDescriptor:(id)a3 withUID:(unsigned int)a4;
@end

@implementation _DASActivityDependency

+ (id)dependencyFromDescriptor:(id)a3 withUID:(unsigned int)a4
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "DependencyIdentifier");
  if (string)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    if (!v7) {
      goto LABEL_6;
    }
    v8 = xpc_dictionary_get_string(v5, "DependencyType");
    if (!v8) {
      goto LABEL_6;
    }
    v9 = v8;
    if (!strncmp(v8, "DependencyTypeResult", 0x14uLL))
    {
      id v11 = objc_msgSend( objc_alloc((Class)a1),  "initResultDependencyWithIdentifier:batchSize:",  v7,  xpc_dictionary_get_int64(v5, "ResultDependencyBatchSize"));
    }

    else
    {
      if (strncmp(v9, "DependencyTypeCompletion", 0x18uLL))
      {
LABEL_6:
        v10 = 0LL;
LABEL_11:

        goto LABEL_12;
      }

      id v11 = [objc_alloc((Class)a1) initActivityCompletionDependencyWithIdentifier:v7];
    }

    v10 = v11;
    goto LABEL_11;
  }

  v10 = 0LL;
LABEL_12:

  return v10;
}

@end