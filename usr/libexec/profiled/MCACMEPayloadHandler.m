@interface MCACMEPayloadHandler
- (BOOL)anonymous;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (void)dealloc;
- (void)setAnonymous:(BOOL)a3;
@end

@implementation MCACMEPayloadHandler

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCACMEPayloadHandler;
  -[MCACMEPayloadHandler dealloc](&v4, "dealloc");
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
  unsigned int v13 = [v12 isUserEnrollmentProfile];

  if (v13)
  {
    self->_anonymous = 1;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
    int v15 = [v14 BOOLValue];

    if ((v15 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
      self->_anonymous = [v16 isUserEnrollment];
    }

    else
    {
      self->_anonymous = 0;
    }
  }

  id v36 = 0LL;
  v17 = -[MCACMEPayloadHandler copyIdentityImmediatelyWithInteractionClient:outError:]( self,  "copyIdentityImmediatelyWithInteractionClient:outError:",  v10,  &v36);
  id v18 = v36;
  if (!v18)
  {
    v34 = a6;
    id v35 = v9;
    v19 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
    v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Storing ACME identity with accessibility %@",  buf,  0xCu);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    uint64_t v22 = kMCAppleIdentitiesKeychainGroup;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 profile]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v17,  v21,  v22,  [v24 isInstalledForSystem],  v19));

    if (v17) {
      CFRelease(v17);
    }
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
      -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v25,  v26);

      if (v10)
      {
        id v18 = 0LL;
        a6 = v34;
        if (([v10 didUpdateStatus:0] & 1) == 0)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          id v18 = (id)objc_claimAutoreleasedReturnValue([v27 userCancelledError]);
        }
      }

      else
      {
        id v18 = 0LL;
        a6 = v34;
      }

      [v11 setCertificatePersistentID:v25];
      v31 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:",  v25,  v31);

      v32 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Successfully installed certificate.",  buf,  2u);
      }

      id v9 = v35;
    }

    else
    {
      uint64_t v28 = MCCertificateErrorDomain;
      uint64_t v29 = MCErrorArray(@"ERROR_CERTIFICATE_CANNOT_STORE");
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v28,  9002LL,  v30,  MCErrorTypeFatal,  0LL));

      a6 = v34;
      id v9 = v35;
    }
  }

  if (a6 && v18) {
    *a6 = [v18 MCCopyAsPrimaryError];
  }

  return v18 == 0LL;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  identity = self->_identity;
  if (!identity)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    uint64_t v69 = 0LL;
    v70 = &v69;
    uint64_t v71 = 0x3032000000LL;
    v72 = sub_1000215BC;
    v73 = sub_1000215CC;
    id v74 = 0LL;
    uint64_t v65 = 0LL;
    v66 = &v65;
    uint64_t v67 = 0x2020000000LL;
    uint64_t v68 = 0LL;
    if ([v62 isHardwareBound])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCDeviceCapabilities currentDevice](&OBJC_CLASS___MCDeviceCapabilities, "currentDevice"));
      unsigned __int8 v10 = [v9 hasSEP];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = MCErrorArray(@"ACME_NO_SEP_ERROR");
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  MCACMEErrorDomain,  60001LL,  v12,  0LL,  MCErrorTypeFatal,  0LL));
        v14 = (void *)v70[5];
        v70[5] = v13;
      }
    }

    if (v6
      && (uint64_t v15 = MCLocalizedString(@"PROGRESS_ENROLLING_CERTIFICATE", v8),
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15),
          unsigned __int8 v17 = [v6 didUpdateStatus:v16],
          v16,
          (v17 & 1) == 0))
    {
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 userCancelledError]);
      v38 = (void *)v70[5];
      v70[5] = v37;
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v62 keyType]);
      unsigned __int8 v19 = [v18 isEqualToString:kMCACMEKeyTypeRSA];

      if ((v19 & 1) != 0)
      {
        v20 = (id *)&kSecAttrKeyTypeRSA;
      }

      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v62 keyType]);
        unsigned __int8 v22 = [v21 isEqualToString:kMCACMEKeyTypeECSECPrimeRandom];

        if ((v22 & 1) == 0)
        {
          v44 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "Invalid ACME key type",  (uint8_t *)&buf,  2u);
          }

          if (!a4) {
            goto LABEL_52;
          }
          uint64_t v45 = MCErrorArray(@"ACME_INTERNAL_ERROR");
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  MCACMEErrorDomain,  60000LL,  v46,  0LL,  MCErrorTypeFatal,  0LL));

          goto LABEL_51;
        }

        v20 = (id *)&kSecAttrKeyTypeECSECPrimeRandom;
      }

      id v61 = *v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue([v62 directoryURLString]);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v23));

      if (!v24)
      {
        if (a4)
        {
          uint64_t v42 = MCErrorArray(@"ACME_INTERNAL_ERROR");
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  MCACMEErrorDomain,  60000LL,  v43,  0LL,  MCErrorTypeFatal,  0LL));
        }

        goto LABEL_51;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v25 setObject:v24 forKeyedSubscript:kSecACMEDirectoryURL];
      unsigned int v26 = [v62 isHardwareBound];
      v27 = &kCFBooleanTrue;
      if (!v26) {
        v27 = &kCFBooleanFalse;
      }
      [v25 setObject:*v27 forKeyedSubscript:kSecUseHardwareBoundKey];
      [v25 setObject:v61 forKeyedSubscript:kSecAttrKeyType];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v62 keySize]));
      [v25 setObject:v28 forKeyedSubscript:kSecAttrKeySizeInBits];

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v62 subjectAltName]);
      [v25 setObject:v29 forKeyedSubscript:kSecSubjectAltName];

      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v62 usageFlags]));
      [v25 setObject:v30 forKeyedSubscript:kSecCertificateKeyUsage];

      v31 = (void *)objc_claimAutoreleasedReturnValue([v62 extendedKeyUsage]);
      [v25 setObject:v31 forKeyedSubscript:kSecCertificateExtendedKeyUsage];

      v32 = (void *)objc_claimAutoreleasedReturnValue([v62 clientIdentifier]);
      [v25 setObject:v32 forKeyedSubscript:kSecClientIdentifier];

      [v25 setObject:kSecCMSHashingAlgorithmSHA256 forKeyedSubscript:kSecCMSSignHashAlgorithm];
      if ([v62 attest])
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  &off_1000CBF38,  &off_1000CBF50,  &off_1000CBF68,  0LL));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[DMCMobileGestalt chipID](&OBJC_CLASS___DMCMobileGestalt, "chipID"));
        if (v34 && ![v33 containsObject:v34])
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:]( &OBJC_CLASS___MDMSharedDefinitions,  "oidsAnonymous:nonce:coresidency:",  self->_anonymous,  1LL,  0LL));
          [v25 setObject:v49 forKeyedSubscript:kSecAttestationOids];
        }

        else
        {
          id v35 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Ignoring request for attestation on unsupported device. Continuing without attestation.",  (uint8_t *)&buf,  2u);
          }
        }
      }

      v50 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        if (self->_anonymous) {
          v51 = &stru_1000C4568;
        }
        else {
          v51 = @"non-";
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "Requesting %@anonymous ACME attestation",  (uint8_t *)&buf,  0xCu);
      }

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v76 = 0x3032000000LL;
      v77 = sub_1000215BC;
      v78 = sub_1000215CC;
      dispatch_semaphore_t v79 = dispatch_semaphore_create(0LL);
      v52 = (void *)objc_claimAutoreleasedReturnValue([v62 subject]);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v54 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_1000215D4;
      v64[3] = &unk_1000C3578;
      v64[4] = &v69;
      v64[5] = &v65;
      v64[6] = &buf;
      SecRequestClientIdentity(v52, v25, v54, v64);

      v55 = *(dispatch_semaphore_s **)(*((void *)&buf + 1) + 40LL);
      dispatch_time_t v56 = dispatch_time(0LL, 60000000000LL);
      if (dispatch_semaphore_wait(v55, v56))
      {
        v57 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v63 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "Timeout waiting for ACME identity",  v63,  2u);
        }

        if (a4)
        {
          uint64_t v58 = MCErrorArray(@"ACME_TIMEOUT_ERROR");
          v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  MCACMEErrorDomain,  60002LL,  v59,  0LL,  MCErrorTypeFatal,  0LL));
        }

        _Block_object_dispose(&buf, 8);

        goto LABEL_51;
      }

      _Block_object_dispose(&buf, 8);

      if (!v6)
      {
LABEL_22:
        v39 = (void *)v70[5];
        if (!v39)
        {
          v47 = (const void *)v66[3];
          if (v47)
          {
            CFRetain(v47);
            a4 = (id *)v66[3];
            self->_identity = (__SecIdentity *)a4;
          }

          else
          {
            a4 = (id *)self->_identity;
          }

          goto LABEL_52;
        }

        if (a4) {
          *a4 = v39;
        }
        v40 = _MCLogObjects[0];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue([(id)v70[5] MCVerboseDescription]);
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Cannot obtain ACME certificate: %{public}@",  (uint8_t *)&buf,  0xCu);
        }

LABEL_51:
        a4 = 0LL;
LABEL_52:
        _Block_object_dispose(&v65, 8);
        _Block_object_dispose(&v69, 8);

        goto LABEL_53;
      }
    }

    [v6 didUpdateStatus:0];
    goto LABEL_22;
  }

  CFRetain(identity);
  a4 = (id *)self->_identity;
LABEL_53:

  return (__SecIdentity *)a4;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_anonymous = a3;
}

@end