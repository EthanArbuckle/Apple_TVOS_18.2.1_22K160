@interface IDSNGMKeyLoadingMetric
- (BOOL)missingIdentity;
- (BOOL)missingPrekey;
- (IDSNGMKeyLoadingErrorContainer)errorContainer;
- (IDSNGMKeyLoadingMetric)initWithErrorContainer:(id)a3 missingIdentity:(BOOL)a4 missingPrekey:(BOOL)a5;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (unsigned)rtcType;
@end

@implementation IDSNGMKeyLoadingMetric

- (IDSNGMKeyLoadingMetric)initWithErrorContainer:(id)a3 missingIdentity:(BOOL)a4 missingPrekey:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSNGMKeyLoadingMetric;
  v10 = -[IDSNGMKeyLoadingMetric init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_errorContainer, a3);
    v11->_missingIdentity = a4;
    v11->_missingPrekey = a5;
  }

  return v11;
}

- (NSString)name
{
  return (NSString *)kIDSNGMKeyLoadingMetricName;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 registeredKeychainError]);
  if (!v5)
  {
LABEL_14:

    goto LABEL_15;
  }

  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 shouldHaveRegisteredIdentity]);
  if (!v8)
  {

LABEL_6:
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 registeredKeychainError]);
    v4 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 registeredKeychainError]);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v16 code]));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 registeredKeychainError]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 userInfo]);

    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"IDSKeychainWrapperErrorOSStatus"]);
    if ([v4 isEqualToString:@"IDSKeychainWrapperErrorDomain"] && v21)
    {
      id v22 = v21;

      v17 = v22;
    }

    if (v4) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"RegisteredKeychainErrorDomain", v4);
    }
    if (v17) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"RegisteredKeychainErrorCode", v17);
    }

    goto LABEL_14;
  }

  id v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 shouldHaveRegisteredIdentity]);
  unsigned __int8 v12 = [v11 BOOLValue];

  if ((v12 & 1) != 0) {
    goto LABEL_6;
  }
LABEL_15:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 unregisteredKeychainError]);
  if (!v24)
  {
LABEL_28:

    goto LABEL_29;
  }

  v25 = (void *)v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 shouldHaveUnregisteredIdentity]);
  if (!v27)
  {

LABEL_20:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 unregisteredKeychainError]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v33 domain]);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 unregisteredKeychainError]);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v35 code]));

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 unregisteredKeychainError]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 userInfo]);

    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:@"IDSKeychainWrapperErrorOSStatus"]);
    if ([v23 isEqualToString:@"IDSKeychainWrapperErrorDomain"] && v40)
    {
      id v41 = v40;

      v36 = v41;
    }

    if (v23) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"UnregisteredKeychainErrorDomain", v23);
    }
    if (v36) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"UnregisteredKeychainErrorCode", v36);
    }

    goto LABEL_28;
  }

  v28 = (void *)v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 shouldHaveUnregisteredIdentity]);
  unsigned __int8 v31 = [v30 BOOLValue];

  if ((v31 & 1) != 0) {
    goto LABEL_20;
  }
LABEL_29:
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 registeredDeserializationError]);

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 registeredDeserializationError]);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 domain]);

    if (v46) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"RegisteredDeserializationErrorDomain", v46);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v48 = (void *)objc_claimAutoreleasedReturnValue([v47 registeredDeserializationError]);
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v48 code]));

    if (v49) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"RegisteredDeserializationErrorCode", v49);
    }
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v51 = (void *)objc_claimAutoreleasedReturnValue([v50 unregisteredDeserializationError]);

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v52 unregisteredDeserializationError]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v53 domain]);

    if (v54) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"UnregisteredDeserializationErrorDomain", v54);
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 unregisteredDeserializationError]);
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v56 code]));

    if (v57) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"UnregisteredDeserializationErrorCode", v57);
    }
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v59 = (void *)objc_claimAutoreleasedReturnValue([v58 generationError]);

  if (v59)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v60 generationError]);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v61 domain]);

    if (v62) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"GenerationErrorDomain", v62);
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 generationError]);
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v64 code]));

    if (v65) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"GenerationErrorCode", v65);
    }
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v66 rollingError]);

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v69 = (void *)objc_claimAutoreleasedReturnValue([v68 rollingError]);
    v70 = (void *)objc_claimAutoreleasedReturnValue([v69 domain]);

    if (v70) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"RollingErrorDomain", v70);
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 rollingError]);
    v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v72 code]));

    if (v73) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"RollingErrorCode", v73);
    }
  }

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v74 identityToRegisterError]);

  if (v75)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v76 identityToRegisterError]);
    v78 = (void *)objc_claimAutoreleasedReturnValue([v77 domain]);

    if (v78) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"IdentityToRegisterErrorDomain", v78);
    }

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
    v80 = (void *)objc_claimAutoreleasedReturnValue([v79 identityToRegisterError]);
    v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v80 code]));

    if (v81) {
      CFDictionarySetValue((CFMutableDictionaryRef)v3, @"IdentityToRegisterErrorCode", v81);
    }
  }

  v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[IDSNGMKeyLoadingMetric missingPrekey](self, "missingPrekey")));
  if (v82) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"NGMMissingPrekey", v82);
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[IDSNGMKeyLoadingMetric missingIdentity](self, "missingIdentity")));
  if (v83) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"NGMMissingIdentity", v83);
  }

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v85 = (void *)objc_claimAutoreleasedReturnValue([v84 shouldHaveRegisteredIdentity]);

  if (v85) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"ShouldHaveRegisteredIdentity", v85);
  }

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v87 = (void *)objc_claimAutoreleasedReturnValue([v86 shouldHaveUnregisteredIdentity]);

  if (v87) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"ShouldHaveUnregisteredIdentity", v87);
  }

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v88 hasRegisteredContainer]));

  if (v89) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"HasRegisteredIdentity", v89);
  }

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNGMKeyLoadingMetric errorContainer](self, "errorContainer"));
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v90 hasUnregisteredContainer]));

  if (v91) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"HasUnregisteredIdentity", v91);
  }

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeNGMKeyLoading;
}

- (BOOL)missingIdentity
{
  return self->_missingIdentity;
}

- (BOOL)missingPrekey
{
  return self->_missingPrekey;
}

- (IDSNGMKeyLoadingErrorContainer)errorContainer
{
  return self->_errorContainer;
}

- (void).cxx_destruct
{
}

@end