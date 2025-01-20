LABEL_101:
  objc_storeStrong(&v79, 0LL);
  objc_storeStrong(&v80, 0LL);
  if (!v82)
  {
LABEL_104:
    v30 = objc_alloc(&OBJC_CLASS___NSError);
    v31 =  -[NSError initWithDomain:code:userInfo:]( v30,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  179LL,  0LL);
    *v85 = v31;
    v89 = 0LL;
    v82 = 1;
  }

LABEL_105:
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(location, 0LL);
  return v89;
}

LABEL_28:
  v32 = 0;
LABEL_29:

  if (!v32)
  {
    v44 = v40;
    v32 = 1;
  }

  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(location, 0LL);
  return v44;
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

    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v13);
    v20 = *v18;
    v19 = v18[1];
    sub_100024884(*(void *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(void *)&v40 = v20;
    *((void *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(void *)&v38[0] = v20;
    *((void *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_100024D34(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_100024D34(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_100024D34(v37, v38);
    sub_100024D34(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1LL << *((_BYTE *)v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        v26 = v23 == v25;
        if (v23 == v25) {
          v23 = 0LL;
        }
        v24 |= v26;
        v27 = *(void *)&v7[8 * v23];
      }

      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }

    *(void *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(void *)(v11 + 32) = v32;
    result = (uint64_t)sub_100024D34(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }

  v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_100024D44(a1);
    return (uint64_t)v3;
  }

  v15 = *(void *)(v29 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }

  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v16 >= v28) {
      goto LABEL_37;
    }
    v15 = *(void *)(v29 + 8 * v16);
    ++v17;
    if (v15) {
      goto LABEL_27;
    }
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

  result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
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

int64_t sub_10001934C(id a1, NSArray *a2, NSArray *a3)
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

uint64_t sub_100022F5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_1000247FC(&qword_100032698);
    v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v29 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  id v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain(v3);
  int64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }

    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v14 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    int64_t v16 = v9 + 1;
    if (!v15)
    {
      int64_t v16 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v29 + 8 * v16);
          if (!v15) {
            break;
          }
        }
      }
    }

LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_100023320(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_1000247FC(&qword_100032688);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100024CEC(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100023BC8(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    unint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *unint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_100024D34(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100023448()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for PFLAMDODMLTaskRunner()
{
  return objc_opt_self(&OBJC_CLASS____TtC21PFLASLArcadeRetention20PFLAMDODMLTaskRunner);
}

void sub_10002348C()
{
}

uint64_t sub_1000234A0()
{
  return sub_100024D4C(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 1LL);
}

uint64_t sub_1000234B0(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100032680 + dword_100032680);
  uint64_t v3 = (void *)swift_task_alloc(unk_100032684);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100023518;
  return v5(a1);
}

uint64_t sub_100023518(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 16);
  uint64_t v5 = *v2;
  uint64_t v6 = swift_task_dealloc(v4);
  if (!v1) {
    uint64_t v6 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_10002356C()
{
  return sub_100024600();
}

uint64_t sub_100023580()
{
  return 0LL;
}

uint64_t sub_100023588(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100023658(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100024884((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100024884((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000248F4(v12);
  return v7;
}

uint64_t sub_100023658(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_100023810(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_100023810(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000238A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100023A7C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100023A7C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000238A4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_100023A18(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100023A18(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_1000247FC(&qword_100032678);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100023A7C(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_1000247FC(&qword_100032678);
    char v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    char v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

unint64_t sub_100023BC8(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100023C5C(a1, a2, v5);
}

unint64_t sub_100023C2C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100023D3C(a1, v4);
}

unint64_t sub_100023C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_100023D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_100024918(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000248C0((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

uint64_t sub_100023E00()
{
  uint64_t v68 = type metadata accessor for Logger(0LL);
  uint64_t v0 = *(void *)(v68 - 8);
  uint64_t v1 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v66 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __chkstk_darwin(v1);
  uint64_t v6 = (char *)&v66 - v5;
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v66 - v8;
  __chkstk_darwin(v7);
  BOOL v11 = (char *)&v66 - v10;
  static String._unconditionallyBridgeFromObjectiveC(_:)(AMD_DOMAIN_APPS);
  uint64_t v13 = v12;
  id v14 = objc_allocWithZone(&OBJC_CLASS___AMDClientRequestEvent);
  NSString v15 = String._bridgeToObjectiveC()();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  id v17 = [v14 initWithFeatureName:v15 withAccountDSID:0 andAccountStoreFrontId:0 inDomain:v16 withCustomDescriptor:0 andSchemaVersion:0];

  if (!v17)
  {
    uint64_t v25 = ((uint64_t (*)(void))static PFLLogging.plugin.getter)();
    BOOL v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      int64_t v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)int64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failed to create AMDClientRequestEvent", v28, 2u);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v0 + 8))(v3, v68);
    goto LABEL_20;
  }

  id v18 = [objc_allocWithZone(AMDClient) init];
  id v19 = [v18 getFeature:v17];

  if (!v19) {
    goto LABEL_17;
  }
  uint64_t v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v19,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

  uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(AMD_CLIENT_STATUS);
  unint64_t v70 = v22;
  AnyHashable.init<A>(_:)(v71, &v69, &type metadata for String, &protocol witness table for String);
  if (*(void *)(v21 + 16) && (unint64_t v23 = sub_100023C2C((uint64_t)v71), (v24 & 1) != 0))
  {
    sub_100024884(*(void *)(v21 + 56) + 32 * v23, (uint64_t)&v72);
  }

  else
  {
    __int128 v72 = 0u;
    __int128 v73 = 0u;
  }

  sub_1000248C0((uint64_t)v71);
  if (!*((void *)&v73 + 1))
  {
    swift_bridgeObjectRelease(v21);
    uint64_t v20 = sub_1000247BC((uint64_t)&v72);
LABEL_17:
    uint64_t v34 = static PFLLogging.plugin.getter(v20);
    __int128 v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v37 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  v36,  "Failed to get feature contains_arcade_plays from AMDClient",  v37,  2u);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v0 + 8))(v6, v68);
    goto LABEL_20;
  }

  if ((swift_dynamicCast(&v69, &v72, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) == 0)
  {
    uint64_t v20 = swift_bridgeObjectRelease(v21);
    goto LABEL_17;
  }

  uint64_t v30 = v69;
  unint64_t v29 = v70;
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(AMD_CLIENT_STATUS_OK);
  uint64_t v33 = v31;
  if (v30 != v32 || v29 != v31)
  {
    char v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v30, v29, v32, v31, 0LL);
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(v29);
    if ((v40 & 1) != 0) {
      goto LABEL_23;
    }
    uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(AMD_CLIENT_ERROR);
    unint64_t v70 = v55;
    AnyHashable.init<A>(_:)(v71, &v69, &type metadata for String, &protocol witness table for String);
    if (*(void *)(v21 + 16) && (unint64_t v56 = sub_100023C2C((uint64_t)v71), (v57 & 1) != 0))
    {
      sub_100024884(*(void *)(v21 + 56) + 32 * v56, (uint64_t)&v72);
    }

    else
    {
      __int128 v72 = 0u;
      __int128 v73 = 0u;
    }

    swift_bridgeObjectRelease(v21);
    sub_1000248C0((uint64_t)v71);
    if (*((void *)&v73 + 1))
    {
      uint64_t v58 = swift_dynamicCast(&v69, &v72, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
      if ((_DWORD)v58)
      {
        uint64_t v60 = v69;
        unint64_t v59 = v70;
LABEL_46:
        static PFLLogging.plugin.getter(v58);
        uint64_t v61 = swift_bridgeObjectRetain(v59);
        v62 = (os_log_s *)Logger.logObject.getter(v61);
        os_log_type_t v63 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v62, v63))
        {
          uint64_t v67 = v60;
          v64 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v65 = swift_slowAlloc(32LL, -1LL);
          v71[0] = v65;
          *(_DWORD *)v64 = 136315138;
          swift_bridgeObjectRetain(v59);
          *(void *)&__int128 v72 = sub_100023588(v67, v59, v71);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, (char *)&v72 + 8, v64 + 4, v64 + 12);
          swift_bridgeObjectRelease_n(v59, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v62,  v63,  "Failed to get feature contains_arcade_plays from AMDClient with error %s",  v64,  0xCu);
          swift_arrayDestroy(v65, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v65, -1LL, -1LL);
          swift_slowDealloc(v64, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(v59, 2LL);
        }

        (*(void (**)(char *, uint64_t))(v0 + 8))(v9, v68);
LABEL_20:
        char v38 = 0;
        return v38 & 1;
      }
    }

    else
    {
      uint64_t v58 = sub_1000247BC((uint64_t)&v72);
    }

    unint64_t v59 = 0xE700000000000000LL;
    uint64_t v60 = 0x6E776F6E6B6E75LL;
    goto LABEL_46;
  }

  swift_bridgeObjectRelease_n(v29, 2LL);
LABEL_23:
  uint64_t v41 = AMD_CLIENT_DATA;
  uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(AMD_CLIENT_DATA);
  unint64_t v70 = v42;
  AnyHashable.init<A>(_:)(v71, &v69, &type metadata for String, &protocol witness table for String);
  if (*(void *)(v21 + 16) && (unint64_t v43 = sub_100023C2C((uint64_t)v71), (v44 & 1) != 0))
  {
    sub_100024884(*(void *)(v21 + 56) + 32 * v43, (uint64_t)&v72);
  }

  else
  {
    __int128 v72 = 0u;
    __int128 v73 = 0u;
  }

  swift_bridgeObjectRelease(v21);
  sub_1000248C0((uint64_t)v71);
  if (!*((void *)&v73 + 1))
  {
    uint64_t v45 = sub_1000247BC((uint64_t)&v72);
    goto LABEL_33;
  }

  uint64_t v45 = swift_dynamicCast(&v69, &v72, (char *)&type metadata for Any + 8, &type metadata for String, 6LL);
  if ((v45 & 1) == 0)
  {
LABEL_33:
    uint64_t v47 = static PFLLogging.plugin.getter(v45);
    v48 = (os_log_s *)Logger.logObject.getter(v47);
    os_log_type_t v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v51 = swift_slowAlloc(32LL, -1LL);
      v71[0] = v51;
      *(_DWORD *)v50 = 136315138;
      uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
      unint64_t v54 = v53;
      *(void *)&__int128 v72 = sub_100023588(v52, v53, v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, (char *)&v72 + 8, v50 + 4, v50 + 12);
      swift_bridgeObjectRelease(v54);
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "No %s returned from AMDClient", v50, 0xCu);
      swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1LL, -1LL);
      swift_slowDealloc(v50, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v0 + 8))(v11, v68);
    goto LABEL_20;
  }

  unint64_t v46 = v70;
  if (v69 == 1702195828 && v70 == 0xE400000000000000LL)
  {

    swift_bridgeObjectRelease(0xE400000000000000LL);
    char v38 = 1;
  }

  else
  {
    char v38 = _stringCompareWithSmolCheck(_:_:expecting:)(v69, v70, 1702195828LL, 0xE400000000000000LL, 0LL);

    swift_bridgeObjectRelease(v46);
  }

  return v38 & 1;
}

uint64_t sub_100024600()
{
  uint64_t v0 = dispatch thunk of PFLTask.recipe.getter();
  if (!*(void *)(v0 + 16) || (unint64_t v1 = sub_100023BC8(0xD000000000000010LL, 0x800000010002AFB0LL), (v2 & 1) == 0))
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    swift_bridgeObjectRelease(v0);
    return sub_1000247BC((uint64_t)&v13);
  }

  sub_100024884(*(void *)(v0 + 56) + 32 * v1, (uint64_t)&v13);
  swift_bridgeObjectRelease(v0);
  if (!*((void *)&v14 + 1)) {
    return sub_1000247BC((uint64_t)&v13);
  }
  uint64_t v3 = sub_1000247FC(&qword_100032668);
  uint64_t result = swift_dynamicCast(&v12, &v13, (char *)&type metadata for Any + 8, v3, 6LL);
  if ((result & 1) == 0) {
    return result;
  }
  uint64_t v5 = v12;
  if (*(void *)(v12 + 16) && (unint64_t v6 = sub_100023BC8(0xD000000000000015LL, 0x800000010002AFD0LL), (v7 & 1) != 0))
  {
    sub_100024884(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v13);
  }

  else
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
  }

  swift_bridgeObjectRelease(v5);
  if (!*((void *)&v14 + 1)) {
    return sub_1000247BC((uint64_t)&v13);
  }
  uint64_t result = swift_dynamicCast(&v12, &v13, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL);
  if ((_DWORD)result && (v12 & 1) != 0)
  {
    uint64_t v8 = type metadata accessor for PFLError(0LL);
    unint64_t v9 = sub_10002483C();
    uint64_t v10 = swift_allocError(v8, v9, 0LL, 0LL);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104LL))( v11,  enum case for PFLError.dataNotAvailable(_:),  v8);
    if ((sub_100023E00() & 1) != 0) {
      return swift_errorRelease(v10);
    }
    else {
      return swift_willThrow();
    }
  }

  return result;
}

uint64_t sub_1000247BC(uint64_t a1)
{
  uint64_t v2 = sub_1000247FC(&qword_100032660);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000247FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_10002483C()
{
  unint64_t result = qword_100032670;
  if (!qword_100032670)
  {
    uint64_t v1 = type metadata accessor for PFLError(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for PFLError, v1);
    atomic_store(result, (unint64_t *)&qword_100032670);
  }

  return result;
}

uint64_t sub_100024884(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000248C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000248F4(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100024918(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100024954(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return swift_task_switch(sub_1000249B8, 0LL, 0LL);
}

uint64_t sub_1000249B8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 32) + 24LL);
  id v2 = objc_allocWithZone((Class)&OBJC_CLASS___AMDDODMLTask);
  swift_bridgeObjectRetain(v1);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  id v4 = [v2 initWithErrorDomain:v3];

  uint64_t v5 = dispatch thunk of PFLTask.recipe.getter();
  uint64_t v6 = sub_100022F5C(v5);
  swift_bridgeObjectRelease(v5);
  id v7 = objc_allocWithZone(&OBJC_CLASS___MLRTaskParameters);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  id v9 = [v7 initWithParametersDict:isa];

  uint64_t v10 = dispatch thunk of PFLTask.attachments.getter();
  id v11 = objc_allocWithZone(&OBJC_CLASS___MLRTaskAttachments);
  type metadata accessor for URL(0LL);
  Class v12 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  id v13 = [v11 initWithURLs:v12];

  id v14 = [objc_allocWithZone(MLRTask) initWithParameters:v9 attachments:v13];
  *(void *)(v0 + 16) = 0LL;
  id v15 = [v4 performTask:v14 error:v0 + 16];
  NSString v16 = *(void **)(v0 + 16);
  if (v15)
  {
    id v17 = v15;
    id v18 = v16;
    id v19 = [v17 JSONResult];
    if (v19)
    {
      uint64_t v20 = v19;
      unint64_t v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v19,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    }

    else
    {
      unint64_t v21 = sub_100023320((uint64_t)&_swiftEmptyArrayStorage);
    }

    id v24 = [v17 vector];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v28 = v27;
    }

    else
    {
      uint64_t v26 = 0LL;
      unint64_t v28 = 0xF000000000000000LL;
    }

    uint64_t v29 = type metadata accessor for PFLTaskResult(0LL);
    swift_allocObject(v29, *(unsigned int *)(v29 + 48), *(unsigned __int16 *)(v29 + 52));
    uint64_t v30 = PFLTaskResult.init(json:vector:)(v21, v26, v28);

    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v30);
  }

  else
  {
    id v22 = v16;
    _convertNSErrorToError(_:)(v16);

    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100024CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000247FC(&qword_100032690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100024D34(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100024D44(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100024D4C(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_100024D5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (void *)swift_task_alloc(async function pointer to MLHostExtension.shouldRun(context:)[1]);
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_100025618;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100024DC4(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000326C8 + dword_1000326C8);
  uint64_t v3 = (void *)swift_task_alloc(unk_1000326CC);
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100024E24;
  return v5(a1);
}

uint64_t sub_100024E24(uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100024E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  *id v15 = v7;
  v15[1] = sub_100024F10;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100024F10()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100024F58(uint64_t a1)
{
  unint64_t v2 = sub_100025088();
  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100024FEC()
{
  unint64_t result = qword_1000326A0[0];
  if (!qword_1000326A0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100028448, &type metadata for PFLASLArcadeRetention);
    atomic_store(result, qword_1000326A0);
  }

  return result;
}

ValueMetadata *type metadata accessor for PFLASLArcadeRetention()
{
  return &type metadata for PFLASLArcadeRetention;
}

uint64_t sub_100025044(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100025088();
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

unint64_t sub_100025088()
{
  unint64_t result = qword_1000326C0;
  if (!qword_1000326C0)
  {
    unint64_t result = swift_getWitnessTable("qC", &type metadata for PFLASLArcadeRetention);
    atomic_store(result, (unint64_t *)&qword_1000326C0);
  }

  return result;
}

uint64_t sub_1000250CC(uint64_t a1)
{
  v1[9] = a1;
  uint64_t v2 = type metadata accessor for PFLTaskSource(0LL);
  v1[10] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[11] = v3;
  v1[12] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for PFLPluginConsent(0LL);
  v1[13] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[14] = v5;
  v1[15] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100025154, 0LL, 0LL);
}

uint64_t sub_100025154()
{
  id v1 = [(id)objc_opt_self(NSBundle) mainBundle];
  id v2 = [v1 bundleIdentifier];

  if (v2)
  {
    uint64_t v4 = *(void *)(v0 + 112);
    uint64_t v3 = *(void *)(v0 + 120);
    uint64_t v6 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v32 = *(void *)(v0 + 88);
    uint64_t v34 = *(void *)(v0 + 80);
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    uint64_t v9 = v8;

    *(void *)(v0 + 56) = &type metadata for PFLASLArcadeRetention;
    uint64_t v10 = sub_1000247FC(&qword_1000326D0);
    uint64_t v33 = String.init<A>(describing:)(v0 + 56, v10);
    uint64_t v12 = v11;
    uint64_t v13 = sub_1000247FC(&qword_1000326D8);
    uint64_t v14 = swift_allocObject( v13,  ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
          + 2LL * *(void *)(v4 + 72),
            *(unsigned __int8 *)(v4 + 80) | 7LL);
    *(_OWORD *)(v14 + 16) = xmmword_1000283E0;
    uint64_t v15 = swift_bridgeObjectRetain(v9);
    uint64_t v16 = static PFLPluginConsent.DNU.getter(v15);
    static PFLPluginConsent.PrivacyBudget.getter(v16);
    *(void *)(v0 + 64) = v14;
    uint64_t v17 = sub_1000255B8( &qword_1000326E0,  (uint64_t (*)(uint64_t))&type metadata accessor for PFLPluginConsent,  (uint64_t)&protocol conformance descriptor for PFLPluginConsent);
    uint64_t v18 = sub_1000247FC(&qword_1000326E8);
    unint64_t v19 = sub_100025528();
    dispatch thunk of SetAlgebra.init<A>(_:)(v0 + 64, v18, v19, v5, v17);
    (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))(v6, enum case for PFLTaskSource.DodMLProd(_:), v34);
    uint64_t v20 = type metadata accessor for PFLPlugin(0LL);
    swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
    *(void *)(v0 + 128) = PFLPlugin.init(plugin:useCase:consent:taskSource:)(v7, v9, v33, v12, v3, v6);
    uint64_t v36 = v9;
    v21._countAndFlagsBits = 0x6F44726F7272452ELL;
    v21._object = (void *)0xEC0000006E69616DLL;
    String.append(_:)(v21);
    uint64_t v22 = v7;
    uint64_t v23 = type metadata accessor for PFLAMDODMLTaskRunner();
    uint64_t v24 = swift_allocObject(v23, 32LL, 7LL);
    *(void *)(v0 + 136) = v24;
    *(void *)(v24 + 16) = v22;
    *(void *)(v24 + 24) = v36;
    *(void *)(v0 + 40) = v23;
    uint64_t v25 = sub_1000255B8( &qword_1000326F8,  (uint64_t (*)(uint64_t))type metadata accessor for PFLAMDODMLTaskRunner,  (uint64_t)&unk_100028388);
    *(void *)(v0 + 16) = v24;
    *(void *)(v0 + 48) = v25;
    uint64_t v26 = *((unsigned int *)&async function pointer to dispatch thunk of PFLPlugin.run(context:runner:) + 1);
    swift_retain(v24);
    unint64_t v27 = (void *)swift_task_alloc(v26);
    *(void *)(v0 + 144) = v27;
    *unint64_t v27 = v0;
    v27[1] = sub_10002546C;
    return ((uint64_t (*)(void, uint64_t))v35)(*(void *)(v0 + 72), v0 + 16);
  }

  else
  {
    id v29 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v30 = MLHostResult.init(status:policy:)(0LL, 2LL);
    uint64_t v31 = *(void *)(v0 + 96);
    swift_task_dealloc(*(void *)(v0 + 120));
    swift_task_dealloc(v31);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v30);
  }

uint64_t sub_10002546C(uint64_t a1)
{
  id v2 = (void *)(*(void *)v1 + 16LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 144LL);
  *(void *)(*(void *)v1 + 152LL) = a1;
  swift_task_dealloc(v3);
  sub_1000255F8(v2);
  return swift_task_switch(sub_1000254D4, 0LL, 0LL);
}

uint64_t sub_1000254D4()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_release(*(void *)(v0 + 136));
  swift_release(v1);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 96);
  swift_task_dealloc(*(void *)(v0 + 120));
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

unint64_t sub_100025528()
{
  unint64_t result = qword_1000326F0;
  if (!qword_1000326F0)
  {
    uint64_t v1 = sub_100025574(&qword_1000326E8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000326F0);
  }

  return result;
}

uint64_t sub_100025574(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000255B8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1000255F8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id objc_msgSend_JSONResult(void *a1, const char *a2, ...)
{
  return _[a1 JSONResult];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__bindBuffers_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bindBuffers:errorDomain:");
}

id objc_msgSend__buildPlan_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildPlan:errorDomain:");
}

id objc_msgSend__flattenedWeightsBeforeTraining(void *a1, const char *a2, ...)
{
  return _[a1 _flattenedWeightsBeforeTraining];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_aggregateArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateArray:error:errorDomain:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentURLsForBasename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentURLsForBasename:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _[a1 attachments];
}

id objc_msgSend_batchSize(void *a1, const char *a2, ...)
{
  return _[a1 batchSize];
}

id objc_msgSend_bindDataToInputsDirectly_batchSize_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDataToInputsDirectly:batchSize:error:errorDomain:");
}

id objc_msgSend_bindToBuffer_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindToBuffer:error:errorDomain:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_callAMDClient_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callAMDClient:error:");
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return _[a1 callStackReturnAddresses];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return _[a1 callStackSymbols];
}

id objc_msgSend_checkIfArrayEmptyAndThrowError_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkIfArrayEmptyAndThrowError:error:errorDomain:");
}

id objc_msgSend_combineArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineArray:error:errorDomain:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computeAndGetMetrics_programTrainer_numIterationsToTrain_error_errorDomain_dataProvider_localTrainingStage_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "computeAndGetMetrics:programTrainer:numIterationsToTrain:error:errorDomain:dataProvider:localTrainingStage:");
}

id objc_msgSend_constantValueMathFunction_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constantValueMathFunction:error:errorDomain:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyCurrentTrainingDelta(void *a1, const char *a2, ...)
{
  return _[a1 copyCurrentTrainingDelta];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createBufferDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBufferDictionary:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_destroyArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyArray:error:errorDomain:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_doubleMultiArrayWithShape_valueArray_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleMultiArrayWithShape:valueArray:error:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downSampleData_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downSampleData:error:errorDomain:");
}

id objc_msgSend_downSampleDictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downSampleDictionaryForKey:");
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return _[a1 errorDomain];
}

id objc_msgSend_evaluateUsingTestData_evaluationMetricNames_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateUsingTestData:evaluationMetricNames:error:");
}

id objc_msgSend_evaluationMetrics(void *a1, const char *a2, ...)
{
  return _[a1 evaluationMetrics];
}

id objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:");
}

id objc_msgSend_featureValueForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueForName:");
}

id objc_msgSend_featuresAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featuresAtIndex:");
}

id objc_msgSend_fetchData_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchData:error:errorDomain:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filterArrayOnNumber_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterArrayOnNumber:error:errorDomain:");
}

id objc_msgSend_finishInitializeManually_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishInitializeManually:errorDomain:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flattenedModelUpdate(void *a1, const char *a2, ...)
{
  return _[a1 flattenedModelUpdate];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_floatValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValueForKey:defaultValue:");
}

id objc_msgSend_generateHashFromInputs_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateHashFromInputs:error:errorDomain:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getCurrentTime_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentTime:error:errorDomain:");
}

id objc_msgSend_getDictionaryValueDataType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDictionaryValueDataType:error:");
}

id objc_msgSend_getElementsInSampleDictionary(void *a1, const char *a2, ...)
{
  return _[a1 getElementsInSampleDictionary];
}

id objc_msgSend_getFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFeature:");
}

id objc_msgSend_getFeatureStub_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFeatureStub:");
}

id objc_msgSend_getInputDictionary(void *a1, const char *a2, ...)
{
  return _[a1 getInputDictionary];
}

id objc_msgSend_getInputSize(void *a1, const char *a2, ...)
{
  return _[a1 getInputSize];
}

id objc_msgSend_getNewDeltasContainer_withError_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNewDeltasContainer:withError:errorDomain:");
}

id objc_msgSend_getOperationsArray(void *a1, const char *a2, ...)
{
  return _[a1 getOperationsArray];
}

id objc_msgSend_getURLFromURLArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getURLFromURLArray:error:errorDomain:");
}

id objc_msgSend_hashAdamIdsToIndices_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashAdamIdsToIndices:error:errorDomain:");
}

id objc_msgSend_hashFromCoreDictionary_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashFromCoreDictionary:error:errorDomain:");
}

id objc_msgSend_hashMapForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashMapForKey:");
}

id objc_msgSend_ifStatement_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ifStatement:error:errorDomain:");
}

id objc_msgSend_initModelMetadata_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initModelMetadata:error:errorDomain:");
}

id objc_msgSend_initWithActionArray_withAttachmentProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionArray:withAttachmentProcessor:");
}

id objc_msgSend_initWithAttachmentURLs_withInstructions_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttachmentURLs:withInstructions:error:errorDomain:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithFeatureName_withAccountDSID_andAccountStoreFrontId_inDomain_withCustomDescriptor_andSchemaVersion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:");
}

id objc_msgSend_initWithFeatureProviderArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeatureProviderArray:");
}

id objc_msgSend_initWithInputs_featureSizeMap_inputDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputs:featureSizeMap:inputDictionary:");
}

id objc_msgSend_initWithJSONResult_unprivatizedVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJSONResult:unprivatizedVector:");
}

id objc_msgSend_initWithModelMetadata_withAttachmentProcessor_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithModelMetadata:withAttachmentProcessor:error:errorDomain:");
}

id objc_msgSend_initWithProgram_learningRate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProgram:learningRate:error:");
}

id objc_msgSend_initializationFunctionName(void *a1, const char *a2, ...)
{
  return _[a1 initializationFunctionName];
}

id objc_msgSend_initializeManually(void *a1, const char *a2, ...)
{
  return _[a1 initializeManually];
}

id objc_msgSend_initializeManually_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeManually:errorDomain:");
}

id objc_msgSend_inputNames(void *a1, const char *a2, ...)
{
  return _[a1 inputNames];
}

id objc_msgSend_insertArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertArray:error:errorDomain:");
}

id objc_msgSend_insertRawArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertRawArray:error:errorDomain:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_learningRate(void *a1, const char *a2, ...)
{
  return _[a1 learningRate];
}

id objc_msgSend_learningRateBufferName(void *a1, const char *a2, ...)
{
  return _[a1 learningRateBufferName];
}

id objc_msgSend_learningRateSchedule(void *a1, const char *a2, ...)
{
  return _[a1 learningRateSchedule];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_loss(void *a1, const char *a2, ...)
{
  return _[a1 loss];
}

id objc_msgSend_lossName(void *a1, const char *a2, ...)
{
  return _[a1 lossName];
}

id objc_msgSend_metricsNames(void *a1, const char *a2, ...)
{
  return _[a1 metricsNames];
}

id objc_msgSend_modelPath(void *a1, const char *a2, ...)
{
  return _[a1 modelPath];
}

id objc_msgSend_modelWithContentsOfURL_configuration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelWithContentsOfURL:configuration:error:");
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return _[a1 multiArrayValue];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_negSampleArrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "negSampleArrayForKey:");
}

id objc_msgSend_numEpochs(void *a1, const char *a2, ...)
{
  return _[a1 numEpochs];
}

id objc_msgSend_numLocalIterations(void *a1, const char *a2, ...)
{
  return _[a1 numLocalIterations];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfIterationsPerEpoch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfIterationsPerEpoch:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_outputNames(void *a1, const char *a2, ...)
{
  return _[a1 outputNames];
}

id objc_msgSend_padArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "padArray:error:errorDomain:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_parseAndCall_withInputs_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseAndCall:withInputs:error:errorDomain:");
}

id objc_msgSend_parseData_withArray_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseData:withArray:error:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performOperation_onArray_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performOperation:onArray:error:");
}

id objc_msgSend_postProc_withDirections_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postProc:withDirections:error:");
}

id objc_msgSend_processForLoop_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processForLoop:error:errorDomain:");
}

id objc_msgSend_processForLoopHelper_withNumber_withDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processForLoopHelper:withNumber:withDictionary:");
}

id objc_msgSend_processRecipe_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processRecipe:errorDomain:");
}

id objc_msgSend_program(void *a1, const char *a2, ...)
{
  return _[a1 program];
}

id objc_msgSend_randomizeArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomizeArray:error:errorDomain:");
}

id objc_msgSend_readDownSampleDictionary_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDownSampleDictionary:withAttachments:error:errorDomain:");
}

id objc_msgSend_readDownSampleDictionaryBytes_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDownSampleDictionaryBytes:withAttachments:error:errorDomain:");
}

id objc_msgSend_readHashMapDictionary_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readHashMapDictionary:withAttachments:error:errorDomain:");
}

id objc_msgSend_readHashMapDictionaryBytes_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readHashMapDictionaryBytes:withAttachments:error:errorDomain:");
}

id objc_msgSend_readNegativeSampleArray_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readNegativeSampleArray:withAttachments:error:errorDomain:");
}

id objc_msgSend_readNegativeSampleArrayBytes_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readNegativeSampleArrayBytes:withAttachments:error:errorDomain:");
}

id objc_msgSend_readWeightsArrayBytes_withAttachments_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readWeightsArrayBytes:withAttachments:error:errorDomain:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_replaceBytesInRange_withBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceBytesInRange:withBytes:");
}

id objc_msgSend_replicateArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replicateArray:error:errorDomain:");
}

id objc_msgSend_requestData_withUseStubs_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestData:withUseStubs:error:errorDomain:");
}

id objc_msgSend_runTask_error_errorDomain_dataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTask:error:errorDomain:dataProvider:");
}

id objc_msgSend_runTask_error_errorDomain_dataProvider_attachmentProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTask:error:errorDomain:dataProvider:attachmentProcessor:");
}

id objc_msgSend_sampleFromDistribution_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sampleFromDistribution:error:errorDomain:");
}

id objc_msgSend_setBatchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatchSize:");
}

id objc_msgSend_setComputeUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComputeUnits:");
}

id objc_msgSend_setElementInCoreDictionary_withKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementInCoreDictionary:withKey:");
}

id objc_msgSend_setErrorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorDomain:");
}

id objc_msgSend_setHashMap_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHashMap:forKey:");
}

id objc_msgSend_setInitializationFunctionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializationFunctionName:");
}

id objc_msgSend_setInitializeManually_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializeManually:");
}

id objc_msgSend_setInputNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputNames:");
}

id objc_msgSend_setLearningRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLearningRate:");
}

id objc_msgSend_setLearningRateBufferName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLearningRateBufferName:");
}

id objc_msgSend_setLearningRateSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLearningRateSchedule:");
}

id objc_msgSend_setLossName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLossName:");
}

id objc_msgSend_setMetricsNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsNames:");
}

id objc_msgSend_setModelPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModelPath:");
}

id objc_msgSend_setNumEpochs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumEpochs:");
}

id objc_msgSend_setNumLocalIterations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumLocalIterations:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setOutputNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputNames:");
}

id objc_msgSend_setShortenedEmbeddingMappingKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingMappingKeys:");
}

id objc_msgSend_setShortenedEmbeddingNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingNames:");
}

id objc_msgSend_setShortenedEmbeddingNumberVectorsAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingNumberVectorsAfter:");
}

id objc_msgSend_setShortenedEmbeddingNumberVectorsBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingNumberVectorsBefore:");
}

id objc_msgSend_setShortenedEmbeddingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortenedEmbeddingSize:");
}

id objc_msgSend_setTrainingModeBufferName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrainingModeBufferName:");
}

id objc_msgSend_setUseCoreMLTrainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseCoreMLTrainer:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWeightNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeightNames:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_shortenedEmbeddingMappingKeys(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingMappingKeys];
}

id objc_msgSend_shortenedEmbeddingNames(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingNames];
}

id objc_msgSend_shortenedEmbeddingNumberVectorsAfter(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingNumberVectorsAfter];
}

id objc_msgSend_shortenedEmbeddingNumberVectorsBefore(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingNumberVectorsBefore];
}

id objc_msgSend_shortenedEmbeddingSize(void *a1, const char *a2, ...)
{
  return _[a1 shortenedEmbeddingSize];
}

id objc_msgSend_sortArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortArray:error:errorDomain:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_spliceArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spliceArray:error:errorDomain:");
}

id objc_msgSend_strideCopyAndSplitArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strideCopyAndSplitArray:error:errorDomain:");
}

id objc_msgSend_strideCopyArray_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strideCopyArray:error:errorDomain:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValueForKey:defaultValue:");
}

id objc_msgSend_stringWithContentsOfURL_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithContentsOfURL:encoding:error:");
}

id objc_msgSend_taskResultFromDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskResultFromDict:");
}

id objc_msgSend_trainOnData_numLocalIterations_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainOnData:numLocalIterations:error:errorDomain:");
}

id objc_msgSend_trainUsingTrainingData_evaluationMetricNames_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainUsingTrainingData:evaluationMetricNames:error:");
}

id objc_msgSend_trainingModeBufferName(void *a1, const char *a2, ...)
{
  return _[a1 trainingModeBufferName];
}

id objc_msgSend_twoArrayMathFunction_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "twoArrayMathFunction:error:errorDomain:");
}

id objc_msgSend_unsignedIntegerValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValueForKey:defaultValue:");
}

id objc_msgSend_useCoreMLTrainer(void *a1, const char *a2, ...)
{
  return _[a1 useCoreMLTrainer];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_weightNames(void *a1, const char *a2, ...)
{
  return _[a1 weightNames];
}

id objc_msgSend_weightsArray(void *a1, const char *a2, ...)
{
  return _[a1 weightsArray];
}

id objc_msgSend_windowFunction_error_errorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowFunction:error:errorDomain:");
}