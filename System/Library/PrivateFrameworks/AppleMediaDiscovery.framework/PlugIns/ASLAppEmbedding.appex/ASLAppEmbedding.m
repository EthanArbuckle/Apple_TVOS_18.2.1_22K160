LABEL_27:
  v48 = (AMDDODMLAttachmentProcessor *)v47;
  v38 = 1;
LABEL_28:
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v47, 0LL);
  return v48;
}

LABEL_15:
  objc_storeStrong(&v55, 0LL);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v59, 0LL);
  return v60;
}

LABEL_45:
  objc_storeStrong(&location, 0LL);
  return v68;
}

LABEL_38:
    objc_storeStrong(&v68, 0LL);
    objc_storeStrong(&v69, 0LL);
    objc_storeStrong(&v70, 0LL);
  }

  objc_storeStrong(&v73, 0LL);
  objc_storeStrong(location, 0LL);
  return v78;
}

LABEL_14:
  if (!v19)
  {
    v27 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
    v19 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v27;
}

LABEL_20:
        objc_storeStrong(&v33, 0LL);
      }

      else
      {
        v6 = objc_alloc(&OBJC_CLASS___NSError);
        v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v39, 81LL, 0LL);
        *v40 = v7;
        v44 = 0LL;
        v34 = 1;
      }

      objc_storeStrong(&v35, 0LL);
      if (v34) {
        break;
      }
      ++v20;
      if (v18 + 1 >= (unint64_t)v21)
      {
        v20 = 0LL;
        v21 = [v25 countByEnumeratingWithState:__b objects:v49 count:16];
        if (!v21) {
          goto LABEL_24;
        }
      }
    }
  }

  else
  {
LABEL_24:
    v34 = 0;
  }

  if (!v34)
  {
    v43->_currentIndex += v41;
    v44 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
    v34 = 1;
  }

  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(location, 0LL);
  return v44;
}

LABEL_57:
          v91 = 0;
LABEL_58:

          if (!v91)
          {
            v60 = [v80 objectForKey:FunctionName];
            v59 =  -[AMDDODMLDataProcessor parseAndCall:withInputs:error:errorDomain:]( v102,  "parseAndCall:withInputs:error:errorDomain:",  v60,  v80,  v100,  v99);
            if (v59)
            {
              v91 = 0;
            }

            else
            {
              v103 = 0LL;
              v91 = 1;
            }

            objc_storeStrong(&v59, 0LL);
            objc_storeStrong(&v60, 0LL);
          }

          objc_storeStrong(&v80, 0LL);
          objc_storeStrong(&v81, 0LL);
          objc_storeStrong(&v82, 0LL);
          objc_storeStrong(&v83, 0LL);
          if (v91) {
            goto LABEL_66;
          }
        }

        v91 = 0;
LABEL_66:
        objc_storeStrong(&v85, 0LL);
        if (v91) {
          goto LABEL_69;
        }
      }

      v103 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      v91 = 1;
LABEL_69:
      objc_storeStrong(&v87, 0LL);
    }
  }

  objc_storeStrong(&v95, 0LL);
  objc_storeStrong(&v96, 0LL);
  objc_storeStrong(&v97, 0LL);
  objc_storeStrong(&v98, 0LL);
  objc_storeStrong(&v99, 0LL);
  objc_storeStrong(location, 0LL);
  return v103;
}

LABEL_30:
    if (!v98) {
      goto LABEL_31;
    }
  }

    if (v111) {
      goto LABEL_95;
    }
  }

  if (!v116 || !v115 || !v114 || !v113 || !*((void *)&v112 + 1) || !(void)v112)
  {
    v15 = objc_alloc(&OBJC_CLASS___NSError);
    v16 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", v117, 102LL, 0LL);
    *v118 = v16;
    v121 = 0LL;
    v111 = 1;
    goto LABEL_95;
  }

  v105 = -[NSMutableDictionary objectForKey:](v120->_coreDictionary, "objectForKey:", v116);
  if (!v105)
  {
    v17 = objc_alloc(&OBJC_CLASS___NSError);
    v18 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", v117, 101LL, 0LL);
    *v118 = v18;
    v121 = 0LL;
    v111 = 1;
    goto LABEL_94;
  }

  v104 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  memset(v102, 0, sizeof(v102));
  v66 = *((id *)&v112 + 1);
  v67 = [v66 countByEnumeratingWithState:v102 objects:v124 count:16];
  if (v67)
  {
    v63 = *(void *)v102[2];
    v64 = 0LL;
    v65 = v67;
    while (1)
    {
      v62 = v64;
      if (*(void *)v102[2] != v63) {
        objc_enumerationMutation(v66);
      }
      v103 = *(void *)(v102[1] + 8 * v64);
      v101 = [*((id *)&v112 + 1) objectForKey:v103];
      v60 = v104;
      v61 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      objc_msgSend(v60, "setObject:forKey:");

      objc_storeStrong(&v101, 0LL);
      ++v64;
      if (v62 + 1 >= (unint64_t)v65)
      {
        v64 = 0LL;
        v65 = [v66 countByEnumeratingWithState:v102 objects:v124 count:16];
        if (!v65) {
          break;
        }
      }
    }
  }

  v100 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  for (i = 0LL; ; ++i)
  {
    v59 = i;
    v98 = [v105 objectAtIndex:i];
    v97 = 0LL;
    if ([v114 isEqual:GreaterThan])
    {
      [v98 doubleValue];
      v58 = v19;
      [v113 doubleValue];
      v21 = v20;
      v22 = v58;
      if (v58 > v21) {
        v97 = 1LL;
      }
    }

    else if ([v114 isEqual:LessThan])
    {
      [v98 doubleValue];
      v57 = v23;
      [v113 doubleValue];
      v25 = v24;
      v22 = v57;
      if (v57 < v25) {
        v97 = 1LL;
      }
    }

    else if ([v114 isEqual:NotEqualTo])
    {
      [v98 doubleValue];
      v56 = v26;
      [v113 doubleValue];
      v28 = v27;
      v22 = v56;
      if (v56 != v28) {
        v97 = 1LL;
      }
    }

    else
    {
      if (([v114 isEqual:IsEqualTo] & 1) == 0)
      {
        v32 = objc_alloc(&OBJC_CLASS___NSError);
        v33 = -[NSError initWithDomain:code:userInfo:](v32, "initWithDomain:code:userInfo:", v117, 100LL, 0LL);
        *v118 = v33;
        v121 = 0LL;
        v111 = 1;
        goto LABEL_84;
      }

      [v98 doubleValue];
      v55 = v29;
      [v113 doubleValue];
      v31 = v30;
      v22 = v55;
      if (v55 == v31) {
        v97 = 1LL;
      }
    }

    if (!v97) {
      goto LABEL_83;
    }
    objc_msgSend(v100, "addObject:", v98, v22);
    memset(v95, 0, sizeof(v95));
    v53 = *((id *)&v112 + 1);
    v54 = [v53 countByEnumeratingWithState:v95 objects:v123 count:16];
    if (v54)
    {
      v50 = *(void *)v95[2];
      v51 = 0LL;
      v52 = v54;
      while (1)
      {
        v49 = v51;
        if (*(void *)v95[2] != v50) {
          objc_enumerationMutation(v53);
        }
        v96 = *(void *)(v95[1] + 8 * v51);
        v94 = [(id)v112 objectForKey:v96];
        v93 = [*((id *)&v112 + 1) objectForKey:v96];
        v92 = [v104 objectForKey:v93];
        for (j = 0LL; ; ++j)
        {
          v48 = j;
          v46 = i;
          v34 = [v94 longValue];
          v90 = v46 * (void)v34 + j;
          v89 = -[NSMutableDictionary objectForKey:](v120->_coreDictionary, "objectForKey:", v96);
          v47 = v90;
          if (v47 < (unint64_t)[v89 count])
          {
            v88 = [v89 objectAtIndex:v90];
            [v92 addObject:v88];
            objc_storeStrong(&v88, 0LL);
            v111 = 0;
          }

          else
          {
            v35 = objc_alloc(&OBJC_CLASS___NSError);
            v36 = -[NSError initWithDomain:code:userInfo:](v35, "initWithDomain:code:userInfo:", v117, 105LL, 0LL);
            *v118 = v36;
            v121 = 0LL;
            v111 = 1;
          }

          objc_storeStrong(&v89, 0LL);
          if (v111) {
            goto LABEL_78;
          }
        }

        v111 = 0;
LABEL_78:
        objc_storeStrong(&v92, 0LL);
        objc_storeStrong(&v93, 0LL);
        objc_storeStrong(&v94, 0LL);
        if (v111) {
          break;
        }
        ++v51;
        if (v49 + 1 >= (unint64_t)v52)
        {
          v51 = 0LL;
          v52 = [v53 countByEnumeratingWithState:v95 objects:v123 count:16];
          if (!v52) {
            goto LABEL_81;
          }
        }
      }
    }

    else
    {
LABEL_81:
      v111 = 0;
    }

    if (!v111) {
LABEL_83:
    }
      v111 = 0;
LABEL_84:
    objc_storeStrong(&v98, 0LL);
    if (v111) {
      goto LABEL_93;
    }
  }

  memset(v86, 0, sizeof(v86));
  v44 = v104;
  v45 = [v44 countByEnumeratingWithState:v86 objects:v122 count:16];
  if (v45)
  {
    v41 = *(void *)v86[2];
    v42 = 0LL;
    v43 = v45;
    while (1)
    {
      v40 = v42;
      if (*(void *)v86[2] != v41) {
        objc_enumerationMutation(v44);
      }
      v87 = *(void *)(v86[1] + 8 * v42);
      coreDictionary = v120->_coreDictionary;
      v39 = [v104 objectForKey:v87];
      -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

      ++v42;
      if (v40 + 1 >= (unint64_t)v43)
      {
        v42 = 0LL;
        v43 = [v44 countByEnumeratingWithState:v86 objects:v122 count:16];
        if (!v43) {
          break;
        }
      }
    }
  }

  -[NSMutableDictionary setObject:forKey:](v120->_coreDictionary, "setObject:forKey:", v100, v115);
  v121 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
  v111 = 1;
LABEL_93:
  objc_storeStrong(&v100, 0LL);
  objc_storeStrong(&v104, 0LL);
LABEL_94:
  objc_storeStrong(&v105, 0LL);
LABEL_95:
  objc_storeStrong((id *)&v112, 0LL);
  objc_storeStrong((id *)&v112 + 1, 0LL);
  objc_storeStrong(&v113, 0LL);
  objc_storeStrong(&v114, 0LL);
  objc_storeStrong(&v115, 0LL);
  objc_storeStrong(&v116, 0LL);
  objc_storeStrong(&v117, 0LL);
  objc_storeStrong(location, 0LL);
  return v121;
}

    if (!v102) {
      goto LABEL_31;
    }
  }

    if (!v108) {
      goto LABEL_31;
    }
  }

LABEL_83:
  objc_storeStrong((id *)&v99, 0LL);
  objc_storeStrong((id *)&v99 + 1, 0LL);
  objc_storeStrong(&v100, 0LL);
  objc_storeStrong(&v101, 0LL);
  objc_storeStrong(&v102, 0LL);
  objc_storeStrong(&v103, 0LL);
  objc_storeStrong(&v104, 0LL);
  objc_storeStrong(location, 0LL);
  return v108;
}

LABEL_68:
    objc_storeStrong(&v99, 0LL);
  }

  v74 = [location[0] objectForKey:IfEffect];
  v73 = [location[0] objectForKey:ElseEffect];
  if (([v101 BOOLValue] & 1) != 0 && v74)
  {
    memset(__b, 0, sizeof(__b));
    v32 = v74;
    v33 = [v32 countByEnumeratingWithState:__b objects:v116 count:16];
    if (v33)
    {
      v29 = *(void *)__b[2];
      v30 = 0LL;
      v31 = v33;
      while (1)
      {
        v28 = v30;
        if (*(void *)__b[2] != v29) {
          objc_enumerationMutation(v32);
        }
        v72 = *(id *)(__b[1] + 8 * v30);
        v70 = [v72 objectForKey:FunctionName];
        v69 =  -[AMDDODMLDataProcessor parseAndCall:withInputs:error:errorDomain:]( v112,  "parseAndCall:withInputs:error:errorDomain:",  v70,  v72,  v110,  v109);
        if (v69)
        {
          v102 = 0;
        }

        else
        {
          v113 = 0LL;
          v102 = 1;
        }

        objc_storeStrong(&v69, 0LL);
        objc_storeStrong(&v70, 0LL);
        if (v102) {
          break;
        }
        ++v30;
        if (v28 + 1 >= (unint64_t)v31)
        {
          v30 = 0LL;
          v31 = [v32 countByEnumeratingWithState:__b objects:v116 count:16];
          if (!v31) {
            goto LABEL_81;
          }
        }
      }
    }

    else
    {
LABEL_81:
      v102 = 0;
    }

    if (!v102) {
      goto LABEL_98;
    }
  }

  else
  {
    memset(v67, 0, sizeof(v67));
    v26 = v73;
    v27 = [v26 countByEnumeratingWithState:v67 objects:v115 count:16];
    if (v27)
    {
      v23 = *(void *)v67[2];
      v24 = 0LL;
      v25 = v27;
      while (1)
      {
        v22 = v24;
        if (*(void *)v67[2] != v23) {
          objc_enumerationMutation(v26);
        }
        v68 = *(id *)(v67[1] + 8 * v24);
        v66 = [v68 objectForKey:FunctionName];
        v65 =  -[AMDDODMLDataProcessor parseAndCall:withInputs:error:errorDomain:]( v112,  "parseAndCall:withInputs:error:errorDomain:",  v66,  v68,  v110,  v109);
        if (v65)
        {
          v102 = 0;
        }

        else
        {
          v113 = 0LL;
          v102 = 1;
        }

        objc_storeStrong(&v65, 0LL);
        objc_storeStrong(&v66, 0LL);
        if (v102) {
          break;
        }
        ++v24;
        if (v22 + 1 >= (unint64_t)v25)
        {
          v24 = 0LL;
          v25 = [v26 countByEnumeratingWithState:v67 objects:v115 count:16];
          if (!v25) {
            goto LABEL_96;
          }
        }
      }
    }

    else
    {
LABEL_96:
      v102 = 0;
    }

    if (!v102)
    {
LABEL_98:
      coreDictionary = v112->_coreDictionary;
      v114 = v101;
      v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v114, 1LL);
      -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

      v113 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      v102 = 1;
    }
  }

  objc_storeStrong(&v73, 0LL);
  objc_storeStrong(&v74, 0LL);
  objc_storeStrong(&v101, 0LL);
LABEL_100:
  objc_storeStrong(&v103, 0LL);
  objc_storeStrong(&v104, 0LL);
  objc_storeStrong(&v105, 0LL);
  objc_storeStrong(&v106, 0LL);
  objc_storeStrong(&v107, 0LL);
  objc_storeStrong(&v108, 0LL);
  objc_storeStrong(&v109, 0LL);
  objc_storeStrong(location, 0LL);
  return v113;
}

LABEL_21:
    objc_storeStrong(&v31, 0LL);
  }

  else
  {
    v5 = objc_alloc(&OBJC_CLASS___NSError);
    v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v36, 111LL, 0LL);
    *v37 = v6;
    v40 = 0LL;
    v32 = 1;
  }

  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(location, 0LL);
  return v40;
}

LABEL_77:
  objc_storeStrong((id *)&v103, 0LL);
  objc_storeStrong((id *)&v103 + 1, 0LL);
  objc_storeStrong(&v104, 0LL);
  objc_storeStrong(&v105, 0LL);
  objc_storeStrong(&v106, 0LL);
  objc_storeStrong(location, 0LL);
  return v110;
}

  objc_storeStrong((id *)&v109, 0LL);
  objc_storeStrong((id *)&v109 + 1, 0LL);
  objc_storeStrong(&v110, 0LL);
  objc_storeStrong(&v111, 0LL);
  objc_storeStrong(&v112, 0LL);
  objc_storeStrong(location, 0LL);
  return v116;
}

int64_t sub_10001BA84(id a1, NSArray *a2, NSArray *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v6 = [location[0] firstObject];
  id v5 = [v8 firstObject];
  id v7 = objc_msgSend(v6, "compare:");

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return (int64_t)v7;
}

LABEL_42:
  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong(location, 0LL);
  return v67;
}

id objc_msgSend_computeAndGetMetrics_programTrainer_numIterationsToTrain_error_errorDomain_dataProvider_localTrainingStage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:");
}

id objc_msgSend_initWithFeatureName_withAccountDSID_andAccountStoreFrontId_inDomain_withCustomDescriptor_andSchemaVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:");
}

id objc_msgSend_windowFunction_error_errorDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowFunction:error:errorDomain:");
}