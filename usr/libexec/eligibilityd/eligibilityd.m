LABEL_11:
  return v11;
}

  return v9;
}

  return v9;
}

  return v9;
}

  return v11;
}

  return v11;
}

  return v9;
}

  return v11;
}

  return v9;
}

  return v9;
}

  return v9;
}

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"OS_ELIGIBILITY_INTERNAL_STATE_GRACE_PERIOD_IN_EFFECT"];
}

  return v9;
}

  return v9;
}

void sub_100004A0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 unsignedIntegerValue];
  if (v6 == (id)3)
  {
    [*(id *)(a1 + 32) setDeviceClassesOfInterest:v5];
  }

  else if (v6 == (id)2)
  {
    [*(id *)(a1 + 32) setBillingCountriesOfInterest:v5];
  }

  else if (v6 == (id)1)
  {
    objc_msgSend( *(id *)(a1 + 32),  "setLocatedCountriesOfInterest:withGracePeriod:",  v5,  objc_msgSend(*(id *)(a1 + 40), "gracePeriodInSeconds"));
  }

  else
  {
    id v7 = sub_10000C968();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[SulfurDomain status]_block_invoke";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: Unsupported input type passed in to SulfurDomain",  (uint8_t *)&v9,  0xCu);
    }
  }
}

const char *sub_10000580C(uint64_t a1)
{
  switch(a1)
  {
    case 1LL:
      result = "OS_ELIGIBILITY_DOMAIN_LOTX";
      break;
    case 2LL:
      result = "OS_ELIGIBILITY_DOMAIN_HYDROGEN";
      break;
    case 3LL:
      result = "OS_ELIGIBILITY_DOMAIN_HELIUM";
      break;
    case 4LL:
      result = "OS_ELIGIBILITY_DOMAIN_LITHIUM";
      break;
    case 5LL:
      result = "OS_ELIGIBILITY_DOMAIN_BERYLLIUM";
      break;
    case 6LL:
      result = "OS_ELIGIBILITY_DOMAIN_BORON";
      break;
    case 7LL:
      result = "OS_ELIGIBILITY_DOMAIN_CARBON";
      break;
    case 8LL:
      result = "OS_ELIGIBILITY_DOMAIN_NITROGEN";
      break;
    case 9LL:
      result = "OS_ELIGIBILITY_DOMAIN_OXYGEN";
      break;
    case 10LL:
      result = "OS_ELIGIBILITY_DOMAIN_FLUORINE";
      break;
    case 11LL:
      result = "OS_ELIGIBILITY_DOMAIN_NEON";
      break;
    case 12LL:
      result = "OS_ELIGIBILITY_DOMAIN_SODIUM";
      break;
    case 13LL:
      result = "OS_ELIGIBILITY_DOMAIN_MAGNESIUM";
      break;
    case 14LL:
      result = "OS_ELIGIBILITY_DOMAIN_ALUMINUM";
      break;
    case 15LL:
      result = "OS_ELIGIBILITY_DOMAIN_SILICON";
      break;
    case 16LL:
      result = "OS_ELIGIBILITY_DOMAIN_PHOSPHORUS";
      break;
    case 17LL:
      result = "OS_ELIGIBILITY_DOMAIN_SULFUR";
      break;
    case 18LL:
      result = "OS_ELIGIBILITY_DOMAIN_CHLORINE";
      break;
    case 19LL:
      result = "OS_ELIGIBILITY_DOMAIN_ARGON";
      break;
    case 20LL:
      result = "OS_ELIGIBILITY_DOMAIN_POTASSIUM";
      break;
    case 21LL:
      result = "OS_ELIGIBILITY_DOMAIN_CALCIUM";
      break;
    case 22LL:
      result = "OS_ELIGIBILITY_DOMAIN_SCANDIUM";
      break;
    case 23LL:
      result = "OS_ELIGIBILITY_DOMAIN_TITANIUM";
      break;
    case 24LL:
      result = "OS_ELIGIBILITY_DOMAIN_VANADIUM";
      break;
    case 25LL:
      result = "OS_ELIGIBILITY_DOMAIN_CHROMIUM";
      break;
    case 26LL:
      result = "OS_ELIGIBILITY_DOMAIN_MANGANESE";
      break;
    case 27LL:
      result = "OS_ELIGIBILITY_DOMAIN_IRON";
      break;
    case 28LL:
      result = "OS_ELIGIBILITY_DOMAIN_COBALT";
      break;
    case 29LL:
      result = "OS_ELIGIBILITY_DOMAIN_NICKEL";
      break;
    case 30LL:
      result = "OS_ELIGIBILITY_DOMAIN_COPPER";
      break;
    case 31LL:
      result = "OS_ELIGIBILITY_DOMAIN_ZINC";
      break;
    case 32LL:
      result = "OS_ELIGIBILITY_DOMAIN_GALLIUM";
      break;
    case 33LL:
      result = "OS_ELIGIBILITY_DOMAIN_GERMANIUM";
      break;
    case 34LL:
      result = "OS_ELIGIBILITY_DOMAIN_ARSENIC";
      break;
    case 35LL:
      result = "OS_ELIGIBILITY_DOMAIN_SELENIUM";
      break;
    case 36LL:
      result = "OS_ELIGIBILITY_DOMAIN_BROMINE";
      break;
    case 37LL:
      result = "OS_ELIGIBILITY_DOMAIN_KRYPTON";
      break;
    case 38LL:
      result = "OS_ELIGIBILITY_DOMAIN_RUBIDIUM";
      break;
    case 39LL:
      result = "OS_ELIGIBILITY_DOMAIN_STRONTIUM";
      break;
    case 40LL:
      result = "OS_ELIGIBILITY_DOMAIN_YTTRIUM";
      break;
    case 41LL:
      result = "OS_ELIGIBILITY_DOMAIN_ZIRCONIUM";
      break;
    case 42LL:
      result = "OS_ELIGIBILITY_DOMAIN_NIOBIUM";
      break;
    case 43LL:
      result = "OS_ELIGIBILITY_DOMAIN_MOLYBDENUM";
      break;
    default:
      uint64_t v2 = a1 - 120;
      result = "OS_ELIGIBILITY_DOMAIN_TEST";
      switch(v2)
      {
        case 0LL:
          return result;
        case 1LL:
          result = "OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS";
          break;
        case 2LL:
          result = "OS_ELIGIBILITY_DOMAIN_GREYMATTER";
          break;
        case 3LL:
          result = "OS_ELIGIBILITY_DOMAIN_XCODE_LLM";
          break;
        case 4LL:
          result = "OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES";
          break;
        case 5LL:
          result = "OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST";
          break;
        default:
          result = 0LL;
          break;
      }

      break;
  }

  return result;
}

char *sub_100005AA4()
{
  uint64_t v2 = 0LL;
  if (asprintf(&v2, "%s%s", "/", "/private/var/db/eligibilityd/eligibility.plist") == -1)
  {
    v0 = (os_log_s *)sub_10000C968();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v4 = "copy_eligibility_domain_public_answer_plist_path";
      __int16 v5 = 2080;
      id v6 = "/private/var/db/eligibilityd/eligibility.plist";
      _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  return v2;
}

void sub_100005EE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 unsignedIntegerValue];
  if (v6 == (id)3)
  {
    [*(id *)(a1 + 32) setDeviceClassesOfInterest:v5];
  }

  else if (v6 == (id)2)
  {
    [*(id *)(a1 + 32) setBillingCountriesOfInterest:v5];
  }

  else if (v6 == (id)1)
  {
    objc_msgSend( *(id *)(a1 + 32),  "setLocatedCountriesOfInterest:withGracePeriod:",  v5,  objc_msgSend(*(id *)(a1 + 40), "gracePeriodInSeconds"));
  }

  else
  {
    id v7 = sub_10000C968();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[PhosphorusDomain status]_block_invoke";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: Unsupported input type passed in to PhosphorusDomain",  (uint8_t *)&v9,  0xCu);
    }
  }
}
}

LABEL_50:
                                v43 = 0;
                                goto LABEL_51;
                              }

                              v57 = sub_10000C968();
                              v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
                              if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_50;
                              }
                              *(_DWORD *)buf = 136315394;
                              v62 = "-[EligibilityDomain isEqual:]";
                              v63 = 2080;
                              v64 = "ageOfInterest";
                            }

                            else
                            {
                              v56 = sub_10000C968();
                              v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
                              if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_50;
                              }
                              *(_DWORD *)buf = 136315394;
                              v62 = "-[EligibilityDomain isEqual:]";
                              v63 = 2080;
                              v64 = "initialLocationsOfInterest";
                            }
                          }

                          else
                          {
                            v55 = sub_10000C968();
                            v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
                            if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                              goto LABEL_50;
                            }
                            *(_DWORD *)buf = 136315394;
                            v62 = "-[EligibilityDomain isEqual:]";
                            v63 = 2080;
                            v64 = "deviceRegionCodesOfInterest";
                          }
                        }

                        else
                        {
                          v54 = sub_10000C968();
                          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                          if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                            goto LABEL_50;
                          }
                          *(_DWORD *)buf = 136315394;
                          v62 = "-[EligibilityDomain isEqual:]";
                          v63 = 2080;
                          v64 = "locatedCountryTimer";
                        }
                      }

                      else
                      {
                        v53 = sub_10000C968();
                        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                        if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_50;
                        }
                        *(_DWORD *)buf = 136315394;
                        v62 = "-[EligibilityDomain isEqual:]";
                        v63 = 2080;
                        v64 = "deviceLanguagesOfInterest";
                      }
                    }

                    else
                    {
                      v52 = sub_10000C968();
                      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
                      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_50;
                      }
                      *(_DWORD *)buf = 136315394;
                      v62 = "-[EligibilityDomain isEqual:]";
                      v63 = 2080;
                      v64 = "deviceLocalesOfInterest";
                    }
                  }

                  else
                  {
                    v51 = sub_10000C968();
                    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
                    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_50;
                    }
                    *(_DWORD *)buf = 136315394;
                    v62 = "-[EligibilityDomain isEqual:]";
                    v63 = 2080;
                    v64 = "deviceClassesOfInterest";
                  }
                }

                else
                {
                  v50 = sub_10000C968();
                  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                  if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_50;
                  }
                  *(_DWORD *)buf = 136315394;
                  v62 = "-[EligibilityDomain isEqual:]";
                  v63 = 2080;
                  v64 = "billingCountriesOfInterest";
                }
              }

              else
              {
                v49 = sub_10000C968();
                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_50;
                }
                *(_DWORD *)buf = 136315394;
                v62 = "-[EligibilityDomain isEqual:]";
                v63 = 2080;
                v64 = "locatedCountriesOfInterest";
              }
            }

            else
            {
              v48 = sub_10000C968();
              v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_50;
              }
              *(_DWORD *)buf = 136315394;
              v62 = "-[EligibilityDomain isEqual:]";
              v63 = 2080;
              v64 = "supportedInputs";
            }
          }

          else
          {
            v47 = sub_10000C968();
            v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_50;
            }
            *(_DWORD *)buf = 136315394;
            v62 = "-[EligibilityDomain isEqual:]";
            v63 = 2080;
            v64 = "context";
          }
        }

        else
        {
          v46 = sub_10000C968();
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_50;
          }
          *(_DWORD *)buf = 136315394;
          v62 = "-[EligibilityDomain isEqual:]";
          v63 = 2080;
          v64 = "status";
        }
      }

      else
      {
        v44 = sub_10000C968();
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 136315394;
        v62 = "-[EligibilityDomain isEqual:]";
        v63 = 2080;
        v64 = "answer";
      }

LABEL_49:
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      goto LABEL_50;
    }
  }

  v43 = 0;
LABEL_52:

  return v43;
}

LABEL_26:
  v23 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" chinaCellular: Y"));
  id v5 = (__CFString *)v23;
  if ((v4 & 0x20) == 0)
  {
LABEL_13:
    if ((v4 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }

LABEL_27:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](self, "deviceRegionCodesOfInterest"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 description]);
  v26 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" regionCodes: %@", v25));

  id v5 = (__CFString *)v26;
  if ((v4 & 0x40) == 0)
  {
LABEL_14:
    if ((v4 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }

LABEL_28:
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 description]);
  v29 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" deviceLanguage: %@", v28));

  id v5 = (__CFString *)v29;
  if ((v4 & 0x80) == 0)
  {
LABEL_15:
    if ((v4 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_30;
  }

LABEL_29:
  v30 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" generativeModelInterest: Y"));
  id v5 = (__CFString *)v30;
  if ((v4 & 0x100) == 0)
  {
LABEL_16:
    if ((v4 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_31;
  }

LABEL_30:
  v31 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" greymatterQueue: Y"));
  id v5 = (__CFString *)v31;
  if ((v4 & 0x200) == 0)
  {
LABEL_17:
    if ((v4 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_32;
  }

LABEL_31:
  v32 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" siriLanguage: Y"));
  id v5 = (__CFString *)v32;
  if ((v4 & 0x400) == 0)
  {
LABEL_18:
    if ((v4 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_33;
  }

LABEL_32:
  v33 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" externalBootDrive: Y"));
  id v5 = (__CFString *)v33;
  if ((v4 & 0x800) == 0)
  {
LABEL_19:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_34;
  }

LABEL_33:
  v34 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" sharediPad: Y"));
  id v5 = (__CFString *)v34;
  if ((v4 & 0x1000) == 0)
  {
LABEL_20:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_21;
    }
LABEL_35:
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain initialLocationsOfInterest](self, "initialLocationsOfInterest"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 description]);
    v38 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @" initialSetupLocations: %@",  v37));

    id v5 = (__CFString *)v38;
    if ((v4 & 0x4000) == 0) {
      return v5;
    }
    goto LABEL_22;
  }

LABEL_34:
  v35 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @" deviceAndSiriLangaugeMatchInterest: Y"));
  id v5 = (__CFString *)v35;
  if ((v4 & 0x2000) != 0) {
    goto LABEL_35;
  }
LABEL_21:
  if ((v4 & 0x4000) != 0)
  {
LABEL_22:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain ageOfInterest](self, "ageOfInterest"));
    v15 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @" age: %@", v14));

    id v5 = (__CFString *)v15;
  }

  return v5;
}

LABEL_16:
  return v14;
}

      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      goto LABEL_17;
    }
  }

  v16 = 0;
LABEL_19:

  return v16;
}

  v16 = sub_10000C968();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[EligibilityEngine _onQueue_urlToDomainData]_block_invoke";
    v21 = 2112;
    v22 = (const char *)v6;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "%s: Skipping domain %@ because it doesn't have a plist specified",  buf,  0x16u);
  }

LABEL_19:
}

void sub_10000A8AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 description]);
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void sub_10000A980(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100044730;
  qword_100044730 = (uint64_t)v1;
}

void sub_10000C480(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 unsignedIntegerValue];
  if (v6 == (id)3)
  {
    [*(id *)(a1 + 32) setDeviceClassesOfInterest:v5];
  }

  else if (v6 == (id)2)
  {
    [*(id *)(a1 + 32) setBillingCountriesOfInterest:v5];
  }

  else if (v6 == (id)1)
  {
    objc_msgSend( *(id *)(a1 + 32),  "setLocatedCountriesOfInterest:withGracePeriod:",  v5,  objc_msgSend(*(id *)(a1 + 40), "gracePeriodInSeconds"));
  }

  else
  {
    id v7 = sub_10000C968();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[KryptonDomain status]_block_invoke";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: Unsupported input type passed in to KryptonDomain",  (uint8_t *)&v9,  0xCu);
    }
  }
}

char *sub_10000C740(unint64_t a1)
{
  if (a1 < 0x10) {
    return (&off_100034A20)[a1];
  }
  id v3 = sub_10000C968();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "eligibility_input_to_str";
    __int16 v7 = 2048;
    unint64_t v8 = a1;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s: Unsupported input type: %llu",  (uint8_t *)&v5,  0x16u);
  }

  return 0LL;
}

id sub_10000C814(unint64_t a1)
{
  if (a1 >= 5)
  {
    id v3 = sub_10000C968();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v7 = "eligibility_answer_to_str";
      __int16 v8 = 2048;
      unint64_t v9 = a1;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s: Unsupported answer type: %llu",  buf,  0x16u);
    }

    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Unknown: %llu>",  a1));
  }

  else
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  (&off_1000349F8)[a1]));
  }

  return v2;
}

id sub_10000C910(unint64_t a1)
{
  if (sub_10000C740(a1)) {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
  }
  else {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Unknown: %llu>",  a1));
  }
  return v2;
}

id sub_10000C968()
{
  if (qword_100044748 != -1) {
    dispatch_once(&qword_100044748, &stru_100034AF8);
  }
  return (id)qword_100044740;
}

void sub_10000C9A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.os_eligibility", "daemon");
  uint64_t v2 = (void *)qword_100044740;
  qword_100044740 = (uint64_t)v1;
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = sub_10000C968();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "main";
    __int16 v20 = 2080;
    v21 = "160.60.1";
    __int16 v22 = 2080;
    v23 = "Nov 10 2024";
    __int16 v24 = 2080;
    v25 = "02:43:55";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s: eligibilityd (%s) built at %s %s started",  buf,  0x2Au);
  }

  dispatch_workloop_t v3 = dispatch_workloop_create("com.apple.eligibility.xpc_workloop");
  dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("com.apple.eligibility.xpc_handler", v5, v3);

  sub_100016A8C(v6, &stru_100034B18);
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __int16 v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
  v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);

  v11 = dispatch_queue_create("com.apple.eligibility.notifications", v10);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v11, &stru_100034B58);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.eligibilityd", v6, 1uLL);
  if (!mach_service)
  {
    id v13 = sub_10000C968();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "main";
      __int16 v20 = 2080;
      v21 = "com.apple.eligibilityd";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "%s: Unable to start xpc service %s",  buf,  0x16u);
    }

    exit(1);
  }

  v15 = mach_service;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000CC10;
  handler[3] = &unk_100034B80;
  v17 = v3;
  xpc_connection_set_event_handler(v15, handler);
  xpc_connection_activate(v15);

  dispatch_main();
}

void sub_10000CC10(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_attr_t v4 = *(void **)(a1 + 32);
  int v5 = (_xpc_connection_s *)v3;
  dispatch_queue_t v6 = v4;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(v5, v6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000CD84;
    handler[3] = &unk_100034B80;
    dispatch_queue_attr_t v7 = v5;
    v16 = v7;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume(v7);
    __int16 v8 = v6;
    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](&OBJC_CLASS___GlobalConfiguration, "sharedInstance"));
    unsigned int v10 = [v9 isMemoryConstrainedDevice];

    if (v10)
    {
      v11 = (dispatch_source_s *)qword_100044750;
      if (!qword_100044750)
      {
        dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v8);
        id v13 = (void *)qword_100044750;
        qword_100044750 = (uint64_t)v12;

        dispatch_source_set_event_handler((dispatch_source_t)qword_100044750, &stru_100034BA0);
        v11 = (dispatch_source_s *)qword_100044750;
      }

      dispatch_time_t v14 = dispatch_time(0LL, 30000000000LL);
      dispatch_source_set_timer(v11, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_activate((dispatch_object_t)qword_100044750);
    }
  }
}

void sub_10000CD84(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_attr_t v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v5 = v3;
  *(void *)&__int128 v6 = -1LL;
  *((void *)&v6 + 1) = -1LL;
  __int128 v127 = v6;
  __int128 v128 = v6;
  xpc_connection_get_audit_token(v4, &v127);
  uint64_t pid = xpc_connection_get_pid(v4);
  int v8 = proc_pidpath(pid, buffer, 0x1000u);
  if (v8 < 1)
  {
    dispatch_source_t v12 = @"(unknown)";
  }

  else
  {
    unsigned int v9 = v8;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringWithFileSystemRepresentation:buffer length:v9]);

    dispatch_source_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@(%d)", v12, pid));

  dispatch_time_t v14 = xpc_copy_description(v5);
  id v15 = sub_10000C968();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 136315650;
    *(void *)&buffer[4] = "_connectionHandler";
    *(_WORD *)&buffer[12] = 2112;
    *(void *)&buffer[14] = v13;
    *(_WORD *)&buffer[22] = 2080;
    *(void *)&buffer[24] = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Message from %@: %s", buffer, 0x20u);
  }

  free(v14);
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
    id v20 = sub_10000C968();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      string = xpc_dictionary_get_string(v5, _xpc_error_key_description);
      *(_DWORD *)buffer = 136315394;
      *(void *)&buffer[4] = "_connectionHandler";
      *(_WORD *)&buffer[12] = 2080;
      *(void *)&buffer[14] = string;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s: Received xpc error: %s",  buffer,  0x16u);
    }

    goto LABEL_89;
  }

  reply = (os_log_s *)xpc_dictionary_create_reply(v5);
  if (reply)
  {
    v18 = reply;
    if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_dictionary)
    {
      v19 = (os_log_s *)sub_10000C968();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buffer = 136315138;
        *(void *)&buffer[4] = "eligibility_xpc_get_message_type";
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: xpc message type must be a dictionary",  buffer,  0xCu);
      }

LABEL_88:
      xpc_connection_cancel(v4);
LABEL_89:

      goto LABEL_90;
    }

    uint64_t uint64 = xpc_dictionary_get_uint64(v5, "eligibility_message_type");
    switch(uint64)
    {
      case 1uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (sub_10000DFFC((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.setInput"))
        {
          *(_OWORD *)buffer = v127;
          *(_OWORD *)&buffer[16] = v128;
          if ((sub_10000E154(buffer) & 1) != 0)
          {
            id v25 = v13;
            id v26 = v5;
            uint64_t v27 = xpc_dictionary_get_uint64(v26, "input");
            xpc_object_t value = xpc_dictionary_get_value(v26, "value");
            v29 = (void *)objc_claimAutoreleasedReturnValue(value);
            uint64_t v30 = xpc_dictionary_get_uint64(v26, "status");

            if (v27 <= 0xF
              && ((0xC216u >> v27) & 1) != 0
              && (!v29 || !v30)
              && (v29 || v30)
              && v30 <= 7
              && ((1LL << v30) & 0xE1) != 0)
            {
              v121 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
              *(void *)buffer = 0LL;
              unsigned __int8 v122 = [v121 setInput:v27 to:v29 status:v30 fromProcess:v25 withError:buffer];
              id v33 = *(id *)buffer;

              v31 = v18;
              if ((v122 & 1) != 0)
              {
                v32 = v13;
                v35 = 0LL;
                char v34 = 1;
                goto LABEL_27;
              }

              v32 = v13;
            }

            else
            {
              v31 = v18;
              v32 = v13;
              id v33 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
            }

            id v33 = v33;
            char v34 = 0;
            v35 = v33;
LABEL_27:

            id v36 = v35;
            if ((v34 & 1) != 0)
            {
              int64_t v37 = 0LL;
              id v13 = v32;
              goto LABEL_100;
            }

            id v13 = v32;
            goto LABEL_103;
          }
        }

        id v83 = sub_10000C968();
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
          goto LABEL_87;
        }
        *(_DWORD *)buffer = 136315394;
        *(void *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(void *)&buffer[14] = v13;
        v85 = "%s: Process %@ not entitled to send set input message";
        goto LABEL_86;
      case 2uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (sub_10000DFFC((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.resetDomain"))
        {
          *(_OWORD *)buffer = v127;
          *(_OWORD *)&buffer[16] = v128;
          if ((sub_10000E154(buffer) & 1) != 0)
          {
            id v126 = 0LL;
            uint64_t v38 = xpc_dictionary_get_uint64(v5, "domain");
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
            unsigned __int8 v40 = [v39 resetDomain:v38 withError:&v126];

            goto LABEL_43;
          }
        }

        id v86 = sub_10000C968();
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
          goto LABEL_87;
        }
        *(_DWORD *)buffer = 136315394;
        *(void *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(void *)&buffer[14] = v13;
        v85 = "%s: Process %@ not entitled to send reset domain message";
        goto LABEL_86;
      case 3uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DFFC((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.forceDomain")
          || (*(_OWORD *)buffer = v127, *(_OWORD *)&buffer[16] = v128, (sub_10000E154(buffer) & 1) == 0))
        {
          id v87 = sub_10000C968();
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send force domain message";
          goto LABEL_86;
        }

        id v41 = v5;
        uint64_t v42 = xpc_dictionary_get_uint64(v41, "domain");
        uint64_t v43 = xpc_dictionary_get_uint64(v41, "answer");
        xpc_object_t dictionary = xpc_dictionary_get_dictionary(v41, "context");
        v45 = (void *)objc_claimAutoreleasedReturnValue(dictionary);

        if (v43 - 2 >= 3)
        {
          v49 = v18;
          v50 = v13;
          id v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
        }

        else
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
          *(void *)buffer = 0LL;
          unsigned __int8 v47 = [v46 forceDomainAnswer:v42 answer:v43 context:v45 withError:buffer];
          id v48 = *(id *)buffer;

          v49 = v18;
          if ((v47 & 1) != 0)
          {
            v50 = v13;
            v51 = 0LL;
            char v52 = 1;
            goto LABEL_138;
          }

          v50 = v13;
        }

        id v48 = v48;
        char v52 = 0;
        v51 = v48;
LABEL_138:

        id v36 = v51;
        if ((v52 & 1) != 0)
        {
          int64_t v37 = 0LL;
          id v13 = v50;
          v18 = v49;
          goto LABEL_135;
        }

        id v13 = v50;
        v18 = v49;
        goto LABEL_108;
      case 4uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (sub_10000DFFC((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.internalState"))
        {
          id v126 = 0LL;
          v53 = v18;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
          uint64_t v55 = objc_claimAutoreleasedReturnValue([v54 internalStateWithError:&v126]);
          v56 = (void *)v55;
          if (!v55) {
            goto LABEL_55;
          }
          v57 = (void *)_CFXPCCreateXPCObjectFromCFObject(v55);
          v58 = "internalStateDictionary";
          goto LABEL_54;
        }

        id v91 = sub_10000C968();
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
          goto LABEL_87;
        }
        *(_DWORD *)buffer = 136315394;
        *(void *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(void *)&buffer[14] = v13;
        v85 = "%s: Process %@ not entitled to send internal state message";
        goto LABEL_86;
      case 5uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DFFC((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.resetAllDomains")
          || (*(_OWORD *)buffer = v127, *(_OWORD *)&buffer[16] = v128, (sub_10000E154(buffer) & 1) == 0))
        {
          id v88 = sub_10000C968();
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send reset all domains message";
          goto LABEL_86;
        }

        id v126 = 0LL;
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
        unsigned __int8 v40 = [v59 resetAllDomainsWithError:&v126];

LABEL_43:
        id v36 = v126;
        int64_t v37 = 0LL;
        if ((v40 & 1) == 0) {
          goto LABEL_108;
        }
        goto LABEL_135;
      case 6uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DFFC((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.forceDomainSet")
          || (*(_OWORD *)buffer = v127, *(_OWORD *)&buffer[16] = v128, (sub_10000E154(buffer) & 1) == 0))
        {
          id v89 = sub_10000C968();
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send force domain set message";
          goto LABEL_86;
        }

        v31 = v18;
        id v60 = v5;
        uint64_t v61 = xpc_dictionary_get_uint64(v60, "domainSet");
        uint64_t v62 = xpc_dictionary_get_uint64(v60, "answer");
        xpc_object_t v63 = xpc_dictionary_get_dictionary(v60, "context");
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);

        if (v61 == 1 && v62 - 2 <= 2)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
          *(void *)buffer = 0LL;
          char v66 = 1;
          unsigned __int8 v67 = [v65 forceDomainSetAnswers:1 answer:v62 context:v64 withError:buffer];
          id v68 = *(id *)buffer;

          v69 = v13;
          if ((v67 & 1) != 0)
          {
            v70 = 0LL;
            goto LABEL_98;
          }
        }

        else
        {
          v69 = v13;
          id v68 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
        }

        id v68 = v68;
        char v66 = 0;
        v70 = v68;
LABEL_98:

        id v36 = v70;
        if ((v66 & 1) != 0)
        {
          int64_t v37 = 0LL;
          id v13 = v69;
LABEL_100:
          v18 = v31;
          goto LABEL_135;
        }

        id v13 = v69;
LABEL_103:
        v18 = v31;
        goto LABEL_108;
      case 7uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DFFC((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.stateDump"))
        {
          id v92 = sub_10000C968();
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send state dump message";
          goto LABEL_86;
        }

        id v126 = 0LL;
        v53 = v18;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
        uint64_t v71 = objc_claimAutoreleasedReturnValue([v54 stateDumpWithError:&v126]);
        v56 = (void *)v71;
        if (v71)
        {
          v57 = (void *)_CFXPCCreateXPCObjectFromCFObject(v71);
          v58 = "stateDumpDictionary";
LABEL_54:
          xpc_dictionary_set_value(v53, v58, v57);
        }

LABEL_55:
        id v36 = v126;
        if (v56) {
          goto LABEL_67;
        }
        goto LABEL_108;
      case 8uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (sub_10000DFFC((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.dumpSysdiagnoseDataToDir"))
        {
          v72 = xpc_dictionary_get_string(v5, "dirPath");
          if (v72)
          {
            v73 = v72;
            uint64_t v74 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v72,  1LL,  0LL));
            if (v74)
            {
              v75 = (void *)v74;
              v76 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
              *(void *)&__int128 v129 = 0LL;
              unsigned int v77 = [v76 dumpToDirectory:v75 withError:&v129];
              id v78 = (id)v129;

              if (v77)
              {

                goto LABEL_66;
              }

              goto LABEL_106;
            }

            id v100 = sub_10000C968();
            v95 = (void *)objc_claimAutoreleasedReturnValue(v100);
            if (!os_log_type_enabled((os_log_t)v95, OS_LOG_TYPE_ERROR))
            {
LABEL_105:

              id v78 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
LABEL_106:
              v99 = v78;
              goto LABEL_107;
            }

            *(_DWORD *)buffer = 136315394;
            *(void *)&buffer[4] = "_dumpToDirectory";
            *(_WORD *)&buffer[12] = 2080;
            *(void *)&buffer[14] = v73;
            v96 = "%s: Failed to convert directory path %s to an NSURL, aborting.";
            v97 = (os_log_s *)v95;
            uint32_t v98 = 22;
          }

          else
          {
            id v94 = sub_10000C968();
            v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
            if (!os_log_type_enabled((os_log_t)v95, OS_LOG_TYPE_ERROR)) {
              goto LABEL_105;
            }
            *(_DWORD *)buffer = 136315138;
            *(void *)&buffer[4] = "_dumpToDirectory";
            v96 = "%s: File path read from xpc message was nil, aborting.";
            v97 = (os_log_s *)v95;
            uint32_t v98 = 12;
          }

          _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, v96, buffer, v98);
          goto LABEL_105;
        }

        id v93 = sub_10000C968();
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
          goto LABEL_87;
        }
        *(_DWORD *)buffer = 136315394;
        *(void *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(void *)&buffer[14] = v13;
        v85 = "%s: Process %@ not entitled to send sysdiagnose dump message";
        goto LABEL_86;
      case 9uLL:
        *(_OWORD *)buffer = v127;
        *(_OWORD *)&buffer[16] = v128;
        if (!sub_10000DFFC((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.setTestMode")
          || (*(_OWORD *)buffer = v127, *(_OWORD *)&buffer[16] = v128, (sub_10000E154(buffer) & 1) == 0))
        {
          id v90 = sub_10000C968();
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
          if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v13;
          v85 = "%s: Process %@ not entitled to send set test mode message";
LABEL_86:
          _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, v85, buffer, 0x16u);
LABEL_87:

          goto LABEL_88;
        }

        BOOL v79 = xpc_dictionary_get_BOOL(v5, "enabled");
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](&OBJC_CLASS___GlobalConfiguration, "sharedInstance"));
        *(void *)buffer = 0LL;
        unsigned int v81 = [v80 setTestMode:v79 withError:buffer];
        id v82 = *(id *)buffer;

        if (v81)
        {

LABEL_66:
          id v36 = 0LL;
LABEL_67:
          int64_t v37 = 0LL;
          goto LABEL_135;
        }

        v99 = v82;
LABEL_107:
        id v101 = v99;

        id v36 = v101;
LABEL_108:
        id v102 = sub_10000C968();
        v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buffer = 136315650;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2048;
          *(void *)&buffer[14] = uint64;
          *(_WORD *)&buffer[22] = 2112;
          *(void *)&buffer[24] = v36;
          _os_log_error_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_ERROR,  "%s: Message %llu failed: %@",  buffer,  0x20u);
        }

        id v104 = v36;
        id v36 = v104;
        if (v104)
        {
          v105 = (void *)objc_claimAutoreleasedReturnValue([v104 domain]);
          unsigned int v106 = [v105 isEqualToString:NSPOSIXErrorDomain];

          if (v106)
          {
            id v107 = v36;
            goto LABEL_127;
          }

          v123 = v18;
          v124 = v13;
          __int128 v131 = 0u;
          __int128 v132 = 0u;
          __int128 v129 = 0u;
          __int128 v130 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue([v36 underlyingErrors]);
          id v108 = [obj countByEnumeratingWithState:&v129 objects:buffer count:16];
          if (!v108) {
            goto LABEL_121;
          }
          id v109 = v108;
          uint64_t v110 = *(void *)v130;
LABEL_115:
          uint64_t v111 = 0LL;
          while (1)
          {
            if (*(void *)v130 != v110) {
              objc_enumerationMutation(obj);
            }
            v112 = *(void **)(*((void *)&v129 + 1) + 8 * v111);
            v113 = (void *)objc_claimAutoreleasedReturnValue([v112 domain]);
            unsigned __int8 v114 = [v113 isEqualToString:NSPOSIXErrorDomain];

            if ((v114 & 1) != 0) {
              break;
            }
            if (v109 == (id)++v111)
            {
              id v109 = [obj countByEnumeratingWithState:&v129 objects:buffer count:16];
              if (!v109)
              {
LABEL_121:

                v18 = v123;
                id v13 = v124;
                goto LABEL_122;
              }

              goto LABEL_115;
            }
          }

          id v107 = v112;

          v18 = v123;
          id v13 = v124;
          if (v107)
          {
LABEL_127:
            int64_t v37 = (int64_t)[v107 code];
LABEL_128:
            if (v36)
            {
              id v117 = objc_claimAutoreleasedReturnValue([v36 description]);
              v118 = (const char *)[v117 UTF8String];

              if (v118)
              {
                xpc_dictionary_set_string(v18, "errorDesc", v118);
              }

              else
              {
                id v119 = sub_10000C968();
                v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buffer = 136315394;
                  *(void *)&buffer[4] = "_connectionHandler";
                  *(_WORD *)&buffer[12] = 2112;
                  *(void *)&buffer[14] = v36;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v120,  OS_LOG_TYPE_ERROR,  "%s: Received an error, but couldn't obtain its c-string description: %@",  buffer,  0x16u);
                }
              }
            }

LABEL_135:
            xpc_dictionary_set_int64(v18, "errorNum", v37);
            xpc_connection_send_message(v4, v18);

            goto LABEL_91;
          }
        }

        else
        {
LABEL_122:
        }

        id v115 = sub_10000C968();
        v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
        if (os_log_type_enabled(v116, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v36;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_FAULT,  "%s: Unknown underlying POSIX error for - %@",  buffer,  0x16u);
        }

        id v107 = 0LL;
        int64_t v37 = 107LL;
        goto LABEL_128;
      default:
        goto LABEL_88;
    }
  }

  id v22 = sub_10000C968();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buffer = 136315138;
    *(void *)&buffer[4] = "_connectionHandler";
    _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct reply message, canceling connection",  buffer,  0xCu);
  }

  xpc_connection_cancel(v4);
LABEL_90:
  id v36 = 0LL;
LABEL_91:
}

void sub_10000DF44(id a1)
{
  if (!dispatch_source_testcancel((dispatch_source_t)qword_100044750))
  {
    id v1 = sub_10000C968();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      dispatch_queue_attr_t v4 = "_tryExitWhenCleanOnWorkloop_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s: Running on a memory-constrained device; eager exiting when clean",
        (uint8_t *)&v3,
        0xCu);
    }

    xpc_transaction_exit_clean();
  }

BOOL sub_10000DFFC(uint64_t a1, uint64_t a2)
{
  int v3 = (void *)xpc_copy_entitlement_for_token(a2, a1);
  dispatch_queue_attr_t v4 = v3;
  if (v3)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_BOOL)
    {
      BOOL value = xpc_BOOL_get_value(v4);
      goto LABEL_8;
    }

    id v5 = sub_10000C968();
    __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      dispatch_source_t v12 = "_checkEntitlement";
      __int16 v13 = 2080;
      uint64_t v14 = a2;
      dispatch_queue_attr_t v7 = "%s: Entitlement %s was the wrong type";
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, 0x16u);
    }
  }

  else
  {
    id v8 = sub_10000C968();
    __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      dispatch_source_t v12 = "_checkEntitlement";
      __int16 v13 = 2080;
      uint64_t v14 = a2;
      dispatch_queue_attr_t v7 = "%s: Missing entitlement %s";
      goto LABEL_10;
    }
  }

  BOOL value = 0LL;
LABEL_8:

  return value;
}

uint64_t sub_10000E154(_OWORD *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](&OBJC_CLASS___GlobalConfiguration, "sharedInstance"));
  unsigned int v3 = [v2 testMode];

  if (!v3) {
    return 1LL;
  }
  __int128 v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  id v6 = sub_10000C968();
  dispatch_queue_attr_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v8[0]) = 136315138;
    *(void *)((char *)v8 + 4) = "_checkTestModeEntitlement";
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s: Missing the com.apple.private.eligibilityd.setTestMode entitlement while test mode is enabled",  (uint8_t *)v8,  0xCu);
  }

  return 0LL;
}

void sub_10000E254(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  id v3 = sub_10000C968();
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    dispatch_queue_attr_t v7 = "main_block_invoke_2";
    __int16 v8 = 2080;
    unsigned int v9 = string;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Got darwin notification %s",  (uint8_t *)&v6,  0x16u);
  }

  if (!strcmp(string, "AppleLanguagePreferencesChangedNotification")
    || !strcmp(string, "AFLanguageCodeDidChangeDarwinNotification")
    || !strcmp(string, "com.apple.coregraphics.GUIConsoleSessionChanged"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
    [v5 recomputeAllDomainAnswers];
  }

void sub_10000E374(id a1)
{
  uint32_t v1 = notify_post("com.apple.os-eligibility-domain.input-needed");
  if (v1)
  {
    uint32_t v2 = v1;
    id v3 = sub_10000C968();
    __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "_sendInputsNeededNotification";
      __int16 v19 = 1024;
      LODWORD(v20) = v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s: Could not send inputs needed notification com.apple.os-eligibility-domain.input-needed: %u",  buf,  0x12u);
    }
  }

  v16 = 0LL;
  if (asprintf(&v16, "%s%s", "/", "/private/var/db/os_eligibility") == -1)
  {
    id v5 = (os_log_s *)sub_10000C968();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "copy_eligibility_domain_data_vault_directory_path";
      __int16 v19 = 2080;
      id v20 = "/private/var/db/os_eligibility";
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  int v6 = v16;
  sub_10000E680(v16, 1);
  free(v6);
  v16 = 0LL;
  if (asprintf(&v16, "%s%s", "/", "/private/var/db/eligibilityd") == -1)
  {
    dispatch_queue_attr_t v7 = (os_log_s *)sub_10000C968();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "copy_eligibility_domain_daemon_directory_path";
      __int16 v19 = 2080;
      id v20 = "/private/var/db/eligibilityd";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
    }
  }

  __int16 v8 = v16;
  sub_10000E680(v16, 0);
  free(v8);
  v16 = 0LL;
  id v9 = sub_100019D6C(&v16);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  int v11 = v16;
  if (v10)
  {
    id v12 = objc_claimAutoreleasedReturnValue( [v10 URLByAppendingPathComponent:@"Library/Caches/NeverRestore/" isDirectory:1]);
    sub_10000E680((const char *)[v12 fileSystemRepresentation], 0);
  }

  else
  {
    id v13 = sub_10000C968();
    id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "_createDirectories";
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to obtain the URL for data container: %@",  buf,  0x16u);
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
  [v14 recomputeAllDomainAnswers];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
  [v15 scheduleDailyRecompute];
}

void sub_10000E680(const char *a1, int a2)
{
  if (mkdir(a1, 0x1EDu))
  {
    int v4 = *__error();
    if (v4 == 17) {
      goto LABEL_8;
    }
    id v5 = sub_10000C968();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315906;
    v23 = "_createDirectoryAtPath";
    __int16 v24 = 2080;
    id v25 = a1;
    __int16 v26 = 2080;
    uint64_t v27 = strerror(v4);
    __int16 v28 = 1024;
    int v29 = v4;
    dispatch_queue_attr_t v7 = "%s: mkdir of path %s failed; this directory should already exist: %s(%d)";
    __int16 v8 = v6;
    uint32_t v9 = 38;
    goto LABEL_18;
  }

  if (!a2) {
    goto LABEL_8;
  }
  id v10 = sub_10000C968();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "_createDirectoryAtPath";
    __int16 v24 = 2080;
    id v25 = a1;
    dispatch_queue_attr_t v7 = "%s: Successfully created directory %s; this should already exist";
    __int16 v8 = v6;
    uint32_t v9 = 22;
LABEL_18:
    _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, v7, buf, v9);
  }

LABEL_7:
LABEL_8:
  int v11 = opendir(a1);
  if (v11)
  {
    id v12 = v11;
    int v13 = dirfd(v11);
    if (fcntl(v13, 64, 4LL))
    {
      id v14 = sub_10000C968();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = __error();
        __int16 v19 = strerror(*v18);
        *(_DWORD *)buf = 136315650;
        v23 = "_setDataProtectionClassDForPath";
        __int16 v24 = 2080;
        id v25 = a1;
        __int16 v26 = 2080;
        uint64_t v27 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Failed to setclass(PROTECTION_CLASS_D) on directory %s: %s",  buf,  0x20u);
      }
    }

    closedir(v12);
  }

  else
  {
    id v16 = sub_10000C968();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v20 = __error();
      v21 = strerror(*v20);
      *(_DWORD *)buf = 136315650;
      v23 = "_setDataProtectionClassDForPath";
      __int16 v24 = 2080;
      id v25 = a1;
      __int16 v26 = 2080;
      uint64_t v27 = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: opendir of %s failed: %s",  buf,  0x20u);
    }
  }

    int v6 = 0LL;
    dispatch_queue_attr_t v7 = 0LL;
    goto LABEL_8;
  }

  last_error = container_query_get_last_error(v3);
  id v12 = (void *)container_error_copy_unlocalized_description();
  int v13 = sub_10000C968();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315394;
    __int16 v19 = "OEURLForContainerWithError";
    id v20 = 2080;
    v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to query container manager: %s",  (uint8_t *)&v18,  0x16u);
  }

  free(v12);
  id v15 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  (int)container_error_get_posix_errno(last_error),  0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v15);
  int v6 = 0LL;
  dispatch_queue_attr_t v7 = 0LL;
LABEL_12:
  container_query_free(v3);
  if (a1 && !v7) {
    *a1 = v10;
  }

  return v7;
}

void sub_10000F140( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10000F1F8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) testModeEnabled];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_10000F228(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTestModeEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void sub_10000F234(id a1)
{
  byte_100044780 = MGGetSInt64Answer(@"DeviceMemorySize", 0LL) < 1073741825;
}

void sub_10000F26C(id a1)
{
  byte_100044770 = os_variant_has_internal_content("com.apple.eligibilityd");
}

void sub_10000F2D0(id a1)
{
  uint32_t v1 = objc_alloc_init(&OBJC_CLASS___GlobalConfiguration);
  uint32_t v2 = (void *)qword_100044758;
  qword_100044758 = (uint64_t)v1;
}

LABEL_17:
          id v16 = 0;
          goto LABEL_18;
        }

        __int16 v19 = sub_10000C968();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 136315394;
        __int16 v24 = "-[BillingRegionAndLocationAsset isEqual:]";
        id v25 = 2080;
        __int16 v26 = "regionSKUs";
      }

      else
      {
        v17 = sub_10000C968();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 136315394;
        __int16 v24 = "-[BillingRegionAndLocationAsset isEqual:]";
        id v25 = 2080;
        __int16 v26 = "billingCountryCodes";
      }

void sub_10001119C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001127C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001135C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001143C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001151C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000115FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000116DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000117BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001189C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001197C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011A5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011B3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011C1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011CFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011DDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011EBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011F9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001207C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001215C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001223C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001231C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000123FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000124DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000125BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001269C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001277C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001285C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001293C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100012A1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100012AFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100012BDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100012CBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100012D9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100012E7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100012F5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001303C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001311C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000131FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000132DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000133BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001349C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001357C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001365C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001373C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000150D8(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (a3)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([a4 path]);
    id v15 = sub_10000C968();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
        *(_DWORD *)buf = 136315650;
        unsigned __int8 v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
        __int16 v41 = 2112;
        id v42 = v33;
        __int16 v43 = 2112;
        id v44 = v14;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s: Config auto-asset %@ successfully locked at path:%@",  buf,  0x20u);
      }

      id v18 = sub_10000C968();
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v12)
      {
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
          *(_DWORD *)buf = 136315394;
          unsigned __int8 v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
          __int16 v41 = 2112;
          id v42 = v21;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s: Newer version in progress: %@",  buf,  0x16u);
        }
      }

      else if (v20)
      {
        *(_DWORD *)buf = 136315138;
        unsigned __int8 v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s: No newer version currently being downloaded",  buf,  0xCu);
      }

      v38[0] = v14;
      v38[1] = @"Config.plist";
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v26));

      id v37 = 0LL;
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v27,  &v37));
      id v25 = v37;
      if (v28)
      {
        [*(id *)(a1 + 32) _initDomainsWithConfigPlist:v28];
        int v29 = (void *)objc_claimAutoreleasedReturnValue(+[EligibilityEngine sharedInstance](&OBJC_CLASS___EligibilityEngine, "sharedInstance"));
        [v29 asyncUpdateAndRecomputeAllAnswers];

        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_100015584;
        v35[3] = &unk_100034D48;
        uint64_t v30 = *(void **)(a1 + 40);
        id v36 = *(id *)(a1 + 48);
        [v30 endLockUsage:@"lockEligibilityConfigOptions" completion:v35];
      }

      else
      {
        id v31 = sub_10000C968();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          char v34 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
          *(_DWORD *)buf = 136315650;
          unsigned __int8 v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
          __int16 v41 = 2112;
          id v42 = v34;
          __int16 v43 = 2112;
          id v44 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s: Failed to open Mobile Asset configuration plist at %@: %@",  buf,  0x20u);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      }
    }

    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        unsigned __int8 v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Sucessfully locked content, but the URL given by MobileAsset was nil",  buf,  0xCu);
      }

      uint64_t v24 = *(void *)(a1 + 48);
      id v25 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
      (*(void (**)(uint64_t, id))(v24 + 16))(v24, v25);
    }
  }

  else
  {
    id v22 = sub_10000C968();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v40 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
      __int16 v41 = 2112;
      id v42 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s: Failed to get content lock on Mobile Asset: %@",  buf,  0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_100015584(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000C968();
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint32_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      int v11 = 136315650;
      id v12 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Failed to release lock on %@: %@",  (uint8_t *)&v11,  0x20u);
LABEL_7:
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    int v11 = 136315394;
    id v12 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s: Successfully released lock on %@",  (uint8_t *)&v11,  0x16u);
    goto LABEL_7;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100015700(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:", &stru_100034D68);
}

void sub_100015710(id a1, NSError *a2)
{
  uint32_t v2 = a2;
  if (v2)
  {
    id v3 = sub_10000C968();
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[MobileAssetManager asyncRefetchMobileAsset]_block_invoke_2";
      __int16 v7 = 2112;
      __int16 v8 = v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s: Failed to fetch MobileAsset: %@",  (uint8_t *)&v5,  0x16u);
    }
  }
}

void sub_1000157D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000C968();
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint32_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      int v11 = 136315650;
      id v12 = "-[MobileAssetManager _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Failed to register interest in Mobile Asset %@: %@",  (uint8_t *)&v11,  0x20u);
LABEL_7:
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    int v11 = 136315394;
    id v12 = "-[MobileAssetManager _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s: Sucessfully registered interest in Mobile Asset: %@",  (uint8_t *)&v11,  0x16u);
    goto LABEL_7;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100015950(uint64_t a1)
{
  id v2 = sub_10000C968();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[MobileAssetManager registerForMobileAssetUpdateNotification]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: AUTO-ASSET-NOTIFICATION: %@",  (uint8_t *)&v6,  0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:", &stru_100034CF8);
}

void sub_100015A18(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_10000C968();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    __int16 v8 = "-[MobileAssetManager registerForMobileAssetUpdateNotification]_block_invoke";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s: Done updating values with new MobileAsset",  (uint8_t *)&v7,  0xCu);
  }

  if (v2)
  {
    id v5 = sub_10000C968();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      __int16 v8 = "-[MobileAssetManager registerForMobileAssetUpdateNotification]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s: Failed to update MobileAsset on update notification: %@",  (uint8_t *)&v7,  0x16u);
    }
  }
}

void sub_100015B38(uint64_t a1)
{
  id v2 = sub_10000C968();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[MobileAssetManager init]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: Marking interest in MobileAsset", buf, 0xCu);
  }

  uint64_t v4 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100015C28;
  v5[3] = &unk_100034CD8;
  id v6 = v4;
  objc_msgSend(v6, "_onMobileAssetQueue_markInterestInMobileAssetWithCompletion:", v5);
}

void sub_100015C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000C968();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      __int16 v8 = "-[MobileAssetManager init]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s: Failed to express interest in MobileAsset: %@",  (uint8_t *)&v7,  0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      __int16 v8 = "-[MobileAssetManager init]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: Fetching MobileAsset", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:", &stru_100034CB0);
  }
}

void sub_100015D58(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = sub_10000C968();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[MobileAssetManager init]_block_invoke";
      __int16 v7 = 2112;
      __int16 v8 = v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s: Failed to fetch MobileAsset: %@",  (uint8_t *)&v5,  0x16u);
    }
  }
}

id sub_100015E1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssetVersion:*(void *)(a1 + 384)];
}

uint64_t sub_100016040(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100016050(uint64_t a1)
{
}

void sub_100016058(uint64_t a1)
{
}

void sub_10001606C(uint64_t a1)
{
}

void sub_100016080(uint64_t a1)
{
}

void sub_100016094(uint64_t a1)
{
}

void sub_1000160A8(uint64_t a1)
{
}

void sub_1000160BC(uint64_t a1)
{
}

void sub_1000160D0(uint64_t a1)
{
}

void sub_1000160E4(uint64_t a1)
{
}

void sub_1000160F8(uint64_t a1)
{
}

void sub_10001610C(uint64_t a1)
{
}

void sub_100016120(uint64_t a1)
{
}

void sub_100016134(uint64_t a1)
{
}

void sub_100016148(uint64_t a1)
{
}

void sub_10001615C(uint64_t a1)
{
}

void sub_100016170(uint64_t a1)
{
}

void sub_100016184(uint64_t a1)
{
}

void sub_100016198(uint64_t a1)
{
}

void sub_1000161AC(uint64_t a1)
{
}

void sub_1000161C0(uint64_t a1)
{
}

void sub_1000161D4(uint64_t a1)
{
}

void sub_1000161E8(uint64_t a1)
{
}

void sub_1000161FC(uint64_t a1)
{
}

void sub_100016210(uint64_t a1)
{
}

void sub_100016224(uint64_t a1)
{
}

void sub_100016238(uint64_t a1)
{
}

void sub_10001624C(uint64_t a1)
{
}

void sub_100016260(uint64_t a1)
{
}

void sub_100016274(uint64_t a1)
{
}

void sub_100016288(uint64_t a1)
{
}

void sub_10001629C(uint64_t a1)
{
}

void sub_1000162B0(uint64_t a1)
{
}

void sub_1000162C4(uint64_t a1)
{
}

void sub_1000162D8(uint64_t a1)
{
}

void sub_1000162EC(uint64_t a1)
{
}

void sub_100016300(uint64_t a1)
{
}

void sub_100016314(uint64_t a1)
{
}

void sub_100016328(uint64_t a1)
{
}

void sub_10001633C(uint64_t a1)
{
}

void sub_100016350(uint64_t a1)
{
}

void sub_100016364(uint64_t a1)
{
}

void sub_100016378(uint64_t a1)
{
}

void sub_10001638C(uint64_t a1)
{
}

void sub_1000163A0(uint64_t a1)
{
}

void sub_1000163B4(uint64_t a1)
{
}

void sub_10001643C(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100044788;
  qword_100044788 = (uint64_t)v1;
}

void sub_100016A8C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100016B3C;
  v7[3] = &unk_100034DB8;
  id v8 = (id)os_transaction_create("com.apple.eligibilityd.async-block");
  id v9 = v3;
  id v5 = v8;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_100016B3C(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_1000179E0(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  id v5 = (void *)v4;
  if (v3 | v4)
  {
    if ((v3 != 0) != (v4 != 0)) {
      uint64_t v6 = 0LL;
    }
    else {
      uint64_t v6 = (uint64_t)[(id)v3 isEqual:v4];
    }
  }

  else
  {
    uint64_t v6 = 1LL;
  }

  return v6;
}

uint64_t sub_100017A60(void *a1, uint64_t a2)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = a1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      __int16 v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v7), a2) & 1) == 0)
        {
          uint64_t v8 = 0LL;
          goto LABEL_11;
        }

        __int16 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v8 = 1LL;
LABEL_11:

  return v8;
}

void sub_10001877C(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v15, v6) & 1) != 0)
  {
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([&off_10003B1B8 objectForKeyedSubscript:v15]);
    uint64_t v8 = v7;
    if (!v7)
    {
LABEL_8:

      goto LABEL_9;
    }

    unsigned int v9 = [v7 unsignedIntValue];

    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
      {
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
        if (sub_100017A60(v5, v11))
        {
          uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
          if (v12)
          {
            uint64_t v8 = (void *)v12;
            __int128 v13 = *(void **)(a1 + 32);
            id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v9));
            [v13 setObject:v8 forKeyedSubscript:v14];

            goto LABEL_8;
          }
        }
      }
    }
  }

LABEL_9:
}

LABEL_13:
  -[EligibilityDomain setAnswer:](self, "setAnswer:", v12);
  if (a3 && !v12) {
    *a3 = v11;
  }

  return v12 != 0;
}

  return v11;
}

  return v13;
}

        v23 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
        if (a7)
        {
          v23 = v23;
          uint64_t v24 = 0;
          *a7 = v23;
        }

        else
        {
          uint64_t v24 = 0;
        }
      }

      return v24;
    default:
      id v15 = sub_10000C968();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315394;
      id v31 = "-[EligibilityEngine setInput:to:status:fromProcess:withError:]";
      v32 = 2048;
      id v33 = a3;
      v17 = "%s: Unsupported eligibility input type %llu";
      id v18 = v16;
      __int16 v19 = 22;
      goto LABEL_18;
  }

id sub_100019D6C(void *a1)
{
  uint64_t v2 = container_query_create();
  uint64_t v3 = v2;
  if (!v2)
  {
    id v8 = sub_10000C968();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      __int16 v19 = "OEURLForContainerWithError";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Failed to create query for container",  (uint8_t *)&v18,  0xCu);
    }

    goto LABEL_7;
  }

  container_query_set_class(v2, 12LL);
  xpc_object_t v4 = xpc_string_create("com.apple.eligibilityd");
  container_query_set_identifiers(v3, v4);

  container_query_set_persona_unique_string(v3, CONTAINER_PERSONA_PRIMARY);
  container_query_operation_set_flags(v3, 0x100000003LL);
  if (container_query_get_single_result(v3))
  {
    uint64_t path = container_get_path();
    if (path)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", path));
      __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v6, 1LL));
LABEL_8:
      uint64_t v10 = 0LL;
      goto LABEL_12;
    }

    id v17 = sub_10000C968();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      __int16 v19 = "OEURLForContainerWithError";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to read path from returned container",  (uint8_t *)&v18,  0xCu);
    }

LABEL_20:
            id v15 = 0;
            goto LABEL_21;
          }

          __int16 v19 = sub_10000C968();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 136315394;
          uint64_t v24 = "-[EligibilityInput isEqual:]";
          id v25 = 2080;
          __int16 v26 = "setTime";
        }

        else
        {
          int v18 = sub_10000C968();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 136315394;
          uint64_t v24 = "-[EligibilityInput isEqual:]";
          id v25 = 2080;
          __int16 v26 = "status";
        }
      }

      else
      {
        id v16 = sub_10000C968();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v24 = "-[EligibilityInput isEqual:]";
        id v25 = 2080;
        __int16 v26 = "type";
      }

LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      goto LABEL_20;
    }
  }

  id v15 = 0;
LABEL_22:

  return v15;
}

LABEL_14:
    uint64_t v12 = 0LL;
    goto LABEL_18;
  }

  __int16 v28 = v10;
  uint64_t v12 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v9,  &v28);
  id v13 = v28;

  if (v12)
  {
    id v14 = objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v12,  "decodeObjectOfClasses:forKey:",  v7,  NSKeyedArchiveRootObjectKey));
    if (v14)
    {
      id v15 = (void *)v14;
      -[NSKeyedUnarchiver finishDecoding](v12, "finishDecoding");
      goto LABEL_21;
    }

    v23 = sub_10000C968();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 path]);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v12, "error"));
      *(_DWORD *)buf = 136315650;
      id v31 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
      v32 = 2112;
      id v33 = v26;
      char v34 = 2112;
      v35 = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to decode data at %@ : %@",  buf,  0x20u);
    }

    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v12, "error"));
    __int16 v19 = v13;
  }

  else
  {
    v21 = sub_10000C968();
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v31 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
      v32 = 2112;
      id v33 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: Failed to create unarchiver: %@",  buf,  0x16u);
    }

    uint64_t v12 = 0LL;
    uint64_t v11 = v13;
  }

      int v18 = 0LL;
      goto LABEL_15;
    }

    id v13 = (os_log_s *)_CFXPCCreateCFObjectFromXPCObject(v8);
    id v14 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((sub_100017A60(v13, v14) & 1) == 0)
    {
      __int16 v19 = sub_10000C968();
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v24 = "-[InitialSetupLocationInput initWithLocations:status:process:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: Initial setup location input contains non-String entries",  buf,  0xCu);
      }

      goto LABEL_14;
    }

    id v15 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));

    id v13 = (os_log_s *)v15;
  }

  else
  {
    id v13 = 0LL;
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___InitialSetupLocationInput;
  id v16 = -[EligibilityInput initWithInputType:status:process:](&v22, "initWithInputType:status:process:", 14LL, a4, v9);
  id v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_countryCodes, v13);
  }
  self = v17;
  int v18 = self;
LABEL_15:

  return v18;
}

LABEL_18:
  if (a5)
  {
    id v13 = v11;
    id v15 = 0LL;
    *a5 = v13;
  }

  else
  {
    id v15 = 0LL;
    id v13 = v11;
  }

LABEL_21:
  return v15;
}

void sub_10001CEFC(_Unwind_Exception *a1)
{
}

LABEL_15:
  return v13;
}

void sub_10001D6FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001DF78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10001E0C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001E3B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

LABEL_12:
  _Block_object_dispose(&v29, 8);
  return v18;
}

  return v12;
}

void sub_10001E674( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10001EDE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

id sub_10001EF3C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleRecompute:", a2);
}

void sub_10001EF48(uint64_t a1)
{
  id v2 = sub_10000C968();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "-[EligibilityEngine _onQueue_handleRecompute:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s: Expiration handler called for %@",  (uint8_t *)&v5,  0x16u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
}

id sub_10001F014(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "domains", 0));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      __int16 v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) updateParameters];
        __int16 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_recomputeAllDomainAnswers");
}

void sub_10001F120(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](&OBJC_CLASS___InputManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 debugDictionary]);
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_INPUTS"];

  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) domains]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001F2D0;
  v14[3] = &unk_100034E68;
  id v15 = v4;
  id v13 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v14];

  id v6 = -[NSMutableDictionary copy](v13, "copy");
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_DOMAINS"];

  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) eligibilityOverrides]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_OVERRIDES"];

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](&OBJC_CLASS___GlobalConfiguration, "sharedInstance"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 debugDescription]);
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_GLOBAL_STATE"];

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](&OBJC_CLASS___MobileAssetManager, "sharedInstance"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 debugDescription]);
  [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_MOBILE_ASSET"];
}

void sub_10001F2D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 description]);
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void sub_10001F330(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](&OBJC_CLASS___InputManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForInputValue:1]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCodes]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"OS_ELIGIBILITY_INTERNAL_STATE_COUNTRY_LOCATION"];

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "domains", 0));
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) hasActiveGracePeriod])
        {
          uint64_t v8 = 1LL;
          goto LABEL_11;
        }
      }

      uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

uint64_t sub_10001F4D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001F4E8(uint64_t a1)
{
}

void sub_10001F4F0(uint64_t a1)
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domains]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v29;
    *(void *)&__int128 v5 = 136315650LL;
    __int128 v26 = v5;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v8);
        unint64_t v10 = (unint64_t)objc_msgSend(v9, "domain", v26);
        unint64_t v11 = v10;
        uint64_t v12 = *(void *)(a1 + 64);
        if (v12 == 1)
        {
          BOOL v13 = v10 > 0x2A || ((1LL << v10) & 0x73F07DFFFFELL) == 0;
          if (!v13 || (v10 - 120 <= 4 ? (BOOL v18 = ((1LL << (v10 - 120)) & 0x13) == 0) : (BOOL v18 = 1), !v18))
          {
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eligibilityOverrides]);
            objc_msgSend( v14,  "forceDomain:answer:context:",  objc_msgSend(v9, "domain"),  *(void *)(a1 + 72),  *(void *)(a1 + 40));

            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notificationsToSend]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 domainChangeNotificationName]);
            [v15 addObject:v16];
          }
        }

        else
        {
          id v17 = (os_log_s *)sub_10000C968();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v26;
            char v34 = "eligibility_domain_in_domain_set";
            __int16 v35 = 2048;
            unint64_t v36 = v11;
            __int16 v37 = 2048;
            uint64_t v38 = v12;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "%s: Checking if a domain %llu is in unknown domain set %llu",  buf,  0x20u);
          }
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v19 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
      id v6 = v19;
    }

    while (v19);
  }

  __int16 v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v21 + 40);
  unsigned __int8 v22 = objc_msgSend(v20, "_onQueue_saveDomainsWithError:", &obj);
  objc_storeStrong((id *)(v21 + 40), obj);
  if ((v22 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_sendNotifications");
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }

  else
  {
    id v23 = sub_10000C968();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      unint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      *(_DWORD *)buf = 136315394;
      char v34 = "-[EligibilityEngine forceDomainSetAnswers:answer:context:withError:]_block_invoke";
      __int16 v35 = 2112;
      unint64_t v36 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to save updated eligibility to disk: %@",  buf,  0x16u);
    }
  }

void sub_10001F800(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 64)));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domains]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v2]);

  if (v4)
  {
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eligibilityOverrides]);
    [v5 forceDomain:*(void *)(a1 + 72) answer:*(void *)(a1 + 80) context:*(void *)(a1 + 40)];

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id obj = *(id *)(v7 + 40);
    unsigned __int8 v8 = objc_msgSend(v6, "_onQueue_saveDomainsWithError:", &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    if ((v8 & 1) != 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notificationsToSend]);
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 domainChangeNotificationName]);
      [v9 addObject:v10];

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_sendNotifications");
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }

    else
    {
      id v16 = sub_10000C968();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
        *(_DWORD *)buf = 136315394;
        unsigned __int8 v22 = "-[EligibilityEngine forceDomainAnswer:answer:context:withError:]_block_invoke";
        __int16 v23 = 2112;
        uint64_t v24 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Failed to save updated eligibility to disk: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v11 = sub_10000C968();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v22 = "-[EligibilityEngine forceDomainAnswer:answer:context:withError:]_block_invoke";
      __int16 v23 = 2048;
      uint64_t v24 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Unknown domain: %llu", buf, 0x16u);
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int128 v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

void sub_10001FA64(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notificationsToSend]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domains]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      unsigned __int8 v8 = 0LL;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v8);
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eligibilityOverrides]);
        objc_msgSend(v10, "resetAnswerForDomain:", objc_msgSend(v9, "domain"));

        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 domainChangeNotificationName]);
        [v2 addObject:v11];

        unsigned __int8 v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v6);
  }

  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v13 + 40);
  unsigned __int8 v14 = objc_msgSend(v12, "_onQueue_saveDomainsWithError:", &obj);
  objc_storeStrong((id *)(v13 + 40), obj);
  if ((v14 & 1) != 0)
  {
    [v2 addObject:@"com.apple.os-eligibility-domain.input-needed"];
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_sendNotifications");
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  else
  {
    id v15 = sub_10000C968();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[EligibilityEngine resetAllDomainsWithError:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: Failed to save updated eligibility to disk: %@",  buf,  0x16u);
    }
  }
}

void sub_10001FC9C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 56)));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domains]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v2]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eligibilityOverrides]);
    [v5 resetAnswerForDomain:*(void *)(a1 + 64)];

    id v6 = *(void **)(a1 + 32);
    id v20 = 0LL;
    unsigned __int8 v7 = objc_msgSend(v6, "_onQueue_saveDomainsWithError:", &v20);
    id v8 = v20;
    id v9 = v20;
    if ((v7 & 1) != 0)
    {
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notificationsToSend]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 domainChangeNotificationName]);
      [v10 addObject:v11];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notificationsToSend]);
      [v12 addObject:@"com.apple.os-eligibility-domain.input-needed"];

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_sendNotifications");
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    }

    else
    {
      id v17 = sub_10000C968();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int128 v22 = "-[EligibilityEngine resetDomain:withError:]_block_invoke";
        __int16 v23 = 2112;
        id v24 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s: Failed to save updated eligibility to disk: %@",  buf,  0x16u);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v8);
    }
  }

  else
  {
    id v13 = sub_10000C968();
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int128 v19 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 136315394;
      __int128 v22 = "-[EligibilityEngine resetDomain:withError:]_block_invoke";
      __int16 v23 = 2048;
      id v24 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Unknown domain: %llu", buf, 0x16u);
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v9 = *(id *)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
}

void sub_10001FF18(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](&OBJC_CLASS___InputManager, "sharedInstance"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0LL;
  unsigned __int8 v4 = [v2 setInput:v3 withError:&v8];
  id v5 = v8;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_recomputeAllDomainAnswers");
  }

  else
  {
    id v6 = sub_10000C968();
    unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v10 = "-[EligibilityEngine setInput:to:status:fromProcess:withError:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s: Failed to set input value: %@",  buf,  0x16u);
    }
  }
}

void sub_100020024(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 answer];
  id v13 = 0LL;
  unsigned __int8 v8 = [v6 computeWithError:&v13];
  id v9 = v13;
  if ((v8 & 1) == 0)
  {
    id v12 = sub_10000C968();
    unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "-[EligibilityEngine _onQueue_recomputeAllDomainAnswers]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s: Failed to compute eligibility for domain %@: %@",  buf,  0x20u);
    }

    goto LABEL_6;
  }

  if (v7 != [v6 answer])
  {
    unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notificationsToSend]);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 domainChangeNotificationName]);
    -[os_log_s addObject:](v10, "addObject:", v11);

LABEL_6:
  }
}

id sub_100020184(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_recomputeAllDomainAnswers");
}

void sub_10002018C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v16 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  100LL,  0LL,  &v16));
  id v7 = v16;
  unsigned __int8 v8 = v7;
  if (v6)
  {
    id v15 = v7;
    unsigned __int8 v9 = [v6 writeToURL:v5 options:268435457 error:&v15];
    id v10 = v15;

    if ((v9 & 1) != 0)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      goto LABEL_8;
    }

    unsigned __int8 v8 = v10;
  }

  id v11 = sub_10000C968();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    *(_DWORD *)buf = 136315650;
    __int16 v18 = "-[EligibilityEngine _onQueue_saveDomainAnswerOutputsWithError:]_block_invoke";
    __int16 v19 = 2112;
    id v20 = v14;
    __int16 v21 = 2112;
    __int128 v22 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s: Failed to write answer plist %@: %@",  buf,  0x20u);
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v10 = *(id *)(v13 + 40);
  *(void *)(v13 + 40) = v8;
LABEL_8:
}

void sub_10002031C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (uint64_t)[v6 domain];
  if (v7 <= 20)
  {
    goto LABEL_2;
  }

  if ((unint64_t)(v7 - 123) < 3)
  {
LABEL_2:
    __int16 v18 = 0LL;
    if (asprintf(&v18, "%s%s", "/", "/private/var/db/os_eligibility/eligibility.plist") == -1)
    {
      unsigned __int8 v8 = (os_log_s *)sub_10000C968();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v20 = "copy_eligibility_domain_answer_plist_path";
        __int16 v21 = 2080;
        __int128 v22 = "/private/var/db/os_eligibility/eligibility.plist";
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: Failed to construct absolute path for relative path: %s",  buf,  0x16u);
      }
    }

    unsigned __int8 v9 = v18;
    if (v18) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }

  if (v7 == 21 || v7 == 122)
  {
    unsigned __int8 v9 = sub_100005AA4();
    if (v9)
    {
LABEL_6:
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
      free(v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v10,  0LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v11]);

      if (!v12)
      {
        uint64_t v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v11];
      }

      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_onQueue_finalEligibilityDictionaryForDomain:", v6));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v11]);
      [v15 setObject:v14 forKeyedSubscript:v5];

      goto LABEL_19;
    }
  }

void sub_1000205AC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
}

BOOL sub_100020604(id a1, NSString *a2, EligibilityDomain *a3, BOOL *a4)
{
  return !-[EligibilityDomain shouldSaveToDisk](a3, "shouldSaveToDisk");
}

void sub_100020694(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100044798;
  qword_100044798 = (uint64_t)v1;
}

id objc_msgSend_yttriumAsset(void *a1, const char *a2, ...)
{
  return [a1 yttriumAsset];
}