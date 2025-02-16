char **_os_feature_search_paths()
{
  return _os_feature_search_paths_paths;
}

const char *_os_feature_internal_search_path()
{
  return "/System/AppleInternal/Library/FeatureFlags";
}

LABEL_10:
  return v9;
}

  return v18;
}

uint64_t isBooleanYes(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"true"] & 1) != 0
    || ([v1 isEqualToString:@"yes"] & 1) != 0)
  {
    uint64_t v2 = 1LL;
  }

  else
  {
    uint64_t v2 = [v1 isEqualToString:@"1"];
  }

  return v2;
}

uint64_t isBooleanNo(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"false"] & 1) != 0
    || ([v1 isEqualToString:@"no"] & 1) != 0)
  {
    uint64_t v2 = 1LL;
  }

  else
  {
    uint64_t v2 = [v1 isEqualToString:@"0"];
  }

  return v2;
}

LABEL_5:
    v6 = 0LL;
  }

    v6 = 0LL;
  }

LABEL_6:
  return v6;
}

  return v6;
}

void ffConfigurationInitOnce()
{
  id v0 = -[FFConfiguration initPrivate](objc_alloc(&OBJC_CLASS___FFConfiguration), "initPrivate");
  id v1 = (void *)instance;
  instance = (uint64_t)v0;
}

LABEL_28:
            v15 = v37;
            v13 = v20;
            v10 = v45;
          }
        }

        objc_autoreleasePoolPop(v18);
        ++v16;
      }

      while (v16 != v12);
      v12 = [v10 countByEnumeratingWithState:&v60 objects:v65 count:16];
    }

    while (v12);
  }

  return v42;
}
}

LABEL_42:
              ++v43;
            }

            while (v41 != v43);
            v56 = [v39 countByEnumeratingWithState:&v73 objects:v81 count:16];
            v41 = v56;
          }

          while (v56);
        }

        v3 = a3;
        disclosuresByLevelIndex = v59;
        v8 = 0x189603000LL;
        v12 = v65;
        v30 = v60;
        v24 = v61;
        v34 = v70;
      }

      if (disclosuresByLevelIndex[v3]) {
        -[NSMutableSet unionSet:](v34, "unionSet:");
      }
      v57 = disclosuresByLevelIndex[v3];
      disclosuresByLevelIndex[v3] = v34;

      v7 = 0;
      v5 = 1LL;
      v4 = self;
    }

    while ((v67 & 1) != 0);
  }

LABEL_11:
  return v10;
}

uint64_t FFConfigurationValidateProfilePayload(void *a1, void *a2)
{
  uint64_t v102 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"Features"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a2) {
        *a2 = v4;
      }

      uint64_t v53 = 0LL;
      goto LABEL_176;
    }

    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v92 objects:v101 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v93;
      v70 = a2;
      uint64_t v59 = *(void *)v93;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v93 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v70)
            {
              uint64_t v53 = 0LL;
              void *v70 = v4;
              goto LABEL_175;
            }

LABEL_132:
            uint64_t v53 = 0LL;
            goto LABEL_175;
          }

          [v11 objectForKeyedSubscript:@"Domain"];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || !+[FFConfiguration isValidName:](&OBJC_CLASS___FFConfiguration, "isValidName:", v12))
          {
            if (v70) {
              void *v70 = v4;
            }
            goto LABEL_131;
          }

          [v11 objectForKeyedSubscript:@"Features"];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (v70) {
              void *v70 = v4;
            }

LABEL_131:
            goto LABEL_132;
          }

          __int128 v90 = 0u;
          __int128 v91 = 0u;
          __int128 v88 = 0u;
          __int128 v89 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v88 objects:v100 count:16];
          if (!v15) {
            goto LABEL_27;
          }
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v89;
          id v61 = v4;
          v63 = v5;
          id v67 = v6;
          do
          {
            id v18 = v3;
            for (uint64_t j = 0LL; j != v16; ++j)
            {
              if (*(void *)v89 != v17) {
                objc_enumerationMutation(v14);
              }
              v20 = *(void **)(*((void *)&v88 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v3 = v18;
                v4 = v61;
                v5 = v63;
                if (v70) {
                  void *v70 = v61;
                }
                goto LABEL_125;
              }

              [v20 objectForKeyedSubscript:@"FeatureName"];
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                id v3 = v18;
                v4 = v61;
                v5 = v63;
                if (v70) {
                  void *v70 = v61;
                }

                goto LABEL_125;
              }

              if (!+[FFConfiguration isValidName:](&OBJC_CLASS___FFConfiguration, "isValidName:", v21))
              {
                id v3 = v18;
                v4 = v61;
                if (v70) {
                  void *v70 = v61;
                }
LABEL_124:

                v5 = v63;
LABEL_125:

                uint64_t v53 = 0LL;
                id v6 = v67;
                goto LABEL_175;
              }

              [v20 objectForKeyedSubscript:@"Enabled"];
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                id v3 = v18;
                v4 = v61;
                if (v70) {
                  void *v70 = v61;
                }

                goto LABEL_124;
              }
            }

            uint64_t v16 = [v14 countByEnumeratingWithState:&v88 objects:v100 count:16];
            id v3 = v18;
            v4 = v61;
            v5 = v63;
            id v6 = v67;
          }

          while (v16);
LABEL_27:

          uint64_t v9 = v59;
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v92 objects:v101 count:16];
        a2 = v70;
      }

      while (v8);
    }
  }

  [v3 objectForKeyedSubscript:@"Disclosures"];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a2)
    {
      uint64_t v53 = 0LL;
      *a2 = v4;
      goto LABEL_175;
    }

    goto LABEL_132;
  }

  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  id v23 = v6;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v84 objects:v99 count:16];
  if (!v24) {
    goto LABEL_46;
  }
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)v85;
  v64 = v5;
  id v68 = v6;
  do
  {
    for (uint64_t k = 0LL; k != v25; ++k)
    {
      if (*(void *)v85 != v26) {
        objc_enumerationMutation(v23);
      }
      v28 = *(void **)(*((void *)&v84 + 1) + 8 * k);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a2)
        {
          uint64_t v53 = 0LL;
          *a2 = v4;
LABEL_143:
          v5 = v64;
          id v6 = v68;
          goto LABEL_174;
        }

LABEL_142:
        uint64_t v53 = 0LL;
        goto LABEL_143;
      }

      [v28 objectForKeyedSubscript:@"DisclosureName"];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (a2) {
          *a2 = v4;
        }
LABEL_141:

        goto LABEL_142;
      }

      if (!+[FFConfiguration isValidDisclosureName:](&OBJC_CLASS___FFConfiguration, "isValidDisclosureName:", v29))
      {
        id v6 = v68;
        if (a2) {
          *a2 = v4;
        }
        goto LABEL_137;
      }

      [v28 objectForKeyedSubscript:@"Disclosed"];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v6 = v68;
        if (a2) {
          *a2 = v4;
        }

LABEL_137:
        uint64_t v53 = 0LL;
        v5 = v64;
        goto LABEL_174;
      }

      if (([v30 BOOLValue] & 1) == 0)
      {
        if (a2) {
          *a2 = v4;
        }

        goto LABEL_141;
      }
    }

    uint64_t v25 = [v23 countByEnumeratingWithState:&v84 objects:v99 count:16];
    v5 = v64;
    id v6 = v68;
  }

  while (v25);
LABEL_46:

LABEL_47:
  [v3 objectForKeyedSubscript:@"FeatureSets"];
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v23) {
    goto LABEL_77;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v53 = 0LL;
    if (a2) {
      *a2 = v4;
    }
    goto LABEL_174;
  }

  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v31 = v23;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v80 objects:v98 count:16];
  if (!v32) {
    goto LABEL_76;
  }
  uint64_t v33 = *(void *)v81;
  v65 = v5;
  id v69 = v6;
  v60 = v31;
  uint64_t v55 = *(void *)v81;
  while (2)
  {
    uint64_t v34 = 0LL;
    uint64_t v56 = v32;
    while (2)
    {
      if (*(void *)v81 != v33) {
        objc_enumerationMutation(v31);
      }
      v35 = *(void **)(*((void *)&v80 + 1) + 8 * v34);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_97;
      }
      [v35 objectForKeyedSubscript:@"FeatureSetGroupName"];
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      if (!v36
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || !+[FFConfiguration isValidName:](&OBJC_CLASS___FFConfiguration, "isValidName:", v36))
      {
        if (a2) {
          *a2 = v4;
        }
LABEL_171:

        goto LABEL_172;
      }

      [v35 objectForKeyedSubscript:@"FeatureSets"];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (a2) {
          *a2 = v4;
        }
LABEL_170:

        goto LABEL_171;
      }

      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      id v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v76 objects:v97 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v77;
        v71 = a2;
        id v57 = v23;
        while (2)
        {
          for (uint64_t m = 0LL; m != v40; ++m)
          {
            if (*(void *)v77 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v76 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v5 = v65;
              id v31 = v60;
              if (v71) {
                void *v71 = v4;
              }
              goto LABEL_148;
            }

            [v43 objectForKeyedSubscript:@"FeatureSetName"];
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v44
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || !+[FFConfiguration isValidName:](&OBJC_CLASS___FFConfiguration, "isValidName:", v44))
            {
              v5 = v65;
              id v31 = v60;
              if (v71) {
                void *v71 = v4;
              }
LABEL_147:

LABEL_148:
              uint64_t v53 = 0LL;
              id v6 = v69;
              id v23 = v57;
              goto LABEL_173;
            }

            [v43 objectForKeyedSubscript:@"Enabled"];
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v5 = v65;
              id v31 = v60;
              if (v71) {
                void *v71 = v4;
              }

              goto LABEL_147;
            }

            if (([v45 BOOLValue] & 1) == 0)
            {
              if (v71) {
                void *v71 = v4;
              }

              v5 = v65;
              id v31 = v60;
              goto LABEL_148;
            }
          }

          uint64_t v40 = [v38 countByEnumeratingWithState:&v76 objects:v97 count:16];
          a2 = v71;
          id v23 = v57;
          if (v40) {
            continue;
          }
          break;
        }
      }

      ++v34;
      uint64_t v33 = v55;
      v5 = v65;
      id v6 = v69;
      id v31 = v60;
      if (v34 != v56) {
        continue;
      }
      break;
    }

    uint64_t v32 = [v60 countByEnumeratingWithState:&v80 objects:v98 count:16];
    if (v32) {
      continue;
    }
    break;
  }

LABEL_76:
LABEL_77:
  objc_msgSend(v3, "objectForKeyedSubscript:", @"Subscriptions", v55);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v66 = v5;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      id v36 = v31;
      uint64_t v46 = [v36 countByEnumeratingWithState:&v72 objects:v96 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v73;
        id v62 = v4;
        id v58 = v23;
        while (2)
        {
          id v49 = v3;
          for (uint64_t n = 0LL; n != v47; ++n)
          {
            if (*(void *)v73 != v48) {
              objc_enumerationMutation(v36);
            }
            v51 = *(void **)(*((void *)&v72 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v3 = v49;
              v4 = v62;
              v5 = v66;
              id v23 = v58;
              if (a2) {
                *a2 = v62;
              }
              goto LABEL_171;
            }

            [v51 objectForKeyedSubscript:@"SubscriptionClass"];
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              id v3 = v49;
              v4 = v62;
              v5 = v66;
              id v23 = v58;
              if (a2) {
                *a2 = v62;
              }
              goto LABEL_170;
            }

            if (([v37 isEqualToString:@"FFMinimumPhaseInReleaseSubscription"] & 1) == 0)
            {
              id v3 = v49;
              v4 = v62;
              v5 = v66;
              if (a2) {
                *a2 = v62;
              }
              goto LABEL_167;
            }

            [v51 objectForKeyedSubscript:@"SubscriptionContents"];
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v52 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              id v3 = v49;
              v4 = v62;
              v5 = v66;
              if (a2) {
                *a2 = v62;
              }

LABEL_167:
              id v23 = v58;
              goto LABEL_171;
            }
          }

          uint64_t v47 = [v36 countByEnumeratingWithState:&v72 objects:v96 count:16];
          id v3 = v49;
          v4 = v62;
          id v23 = v58;
          if (v47) {
            continue;
          }
          break;
        }
      }

      v5 = v66;
      goto LABEL_93;
    }

LABEL_97:
    if (a2)
    {
      uint64_t v53 = 0LL;
      *a2 = v4;
    }

    else
    {
LABEL_172:
      uint64_t v53 = 0LL;
    }
  }

  else
  {
LABEL_93:
    uint64_t v53 = 1LL;
    if (!v5 && !v6 && !v23 && !v31) {
      goto LABEL_97;
    }
  }

LABEL_173:
LABEL_174:
LABEL_175:

LABEL_176:
  return v53;
}

uint64_t _os_feature_enabled_is_safe_mode()
{
  return 0LL;
}

void NSLog(NSString *format, ...)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t _os_once()
{
  return MEMORY[0x1895F8E38]();
}

void abort(void)
{
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1895FC5E0]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

uint64_t objc_msgSend__configurationForTestingWithFileReader_fileWriter_buildVersionGetter_parseErrorReporter_safeModeChecker_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__configurationForTestingWithFileReader_fileWriter_buildVersionGetter_parseErrorReporter_safeModeChecker_);
}

uint64_t objc_msgSend_initWithDomain_feature_value_phase_disclosureRequired_attributes_buildVersion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithDomain_feature_value_phase_disclosureRequired_attributes_buildVersion_);
}

uint64_t objc_msgSend_makeFeatureDictionaryFrom_forDomain_atDomainLevel_reportableFilename_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_makeFeatureDictionaryFrom_forDomain_atDomainLevel_reportableFilename_);
}