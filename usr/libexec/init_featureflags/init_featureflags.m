char **sub_100002178()
{
  return off_100008138;
}

uint64_t start(int a1, const char **a2)
{
  if (a1 >= 2)
  {
    v4 = a2[1];
    if (!strcmp(v4, "-n"))
    {
      byte_100008150 = 1;
      byte_100008151 = 1;
    }

    if (!strcmp(v4, "-v")) {
      ++dword_100008154;
    }
    if (a1 >= 3)
    {
      if (!strcmp(a2[2], "-v")) {
        ++dword_100008154;
      }
    }
  }

  v174 = objc_autoreleasePoolPush();
  if (os_variant_allows_internal_security_policies("com.apple.featureflags") && (byte_100008151 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v206[0] = NSFileOwnerAccountID;
    v206[1] = NSFileGroupOwnerAccountID;
    v207[0] = &off_100004388;
    v207[1] = &off_100004388;
    v206[2] = NSFilePosixPermissions;
    v207[2] = &off_1000043A0;
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v207,  v206,  3LL));
    *(void *)&__int128 v212 = NSFileOwnerAccountID;
    *((void *)&v212 + 1) = NSFileGroupOwnerAccountID;
    *(void *)&__int128 v217 = &off_100004388;
    *((void *)&v217 + 1) = &off_100004388;
    *(void *)&__int128 v213 = NSFilePosixPermissions;
    *(void *)&__int128 v218 = &off_1000043B8;
    v190 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v217,  &v212,  3LL));
    v7 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100002178()[1]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v183 = (id)v6;
    *(void *)&__int128 v196 = 0LL;
    else {
      unsigned __int8 v9 = [v5 createDirectoryAtPath:v8 withIntermediateDirectories:0 attributes:v6 error:&v196];
    }
    unsigned __int8 v10 = v9;
    id v11 = (id)v196;
    if ((v10 & 1) == 0)
    {
      id v12 = [v8 UTF8String];
      id v13 = objc_claimAutoreleasedReturnValue([v11 description]);
      [v13 UTF8String];
      sub_100002F0C( @"Failed to create or configure directory %s: %s",  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)v12);
    }

    __int128 v210 = 0u;
    __int128 v211 = 0u;
    __int128 v208 = 0u;
    __int128 v209 = 0u;
    *(void *)&__int128 v192 = v11;
    __nel = v5;
    v21 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v8 error:&v192]);
    id v23 = (id)v192;

    id v24 = [v22 countByEnumeratingWithState:&v208 objects:v216 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v209;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v209 != v26) {
            objc_enumerationMutation(v22);
          }
          v28 = *(void **)(*((void *)&v208 + 1) + 8LL * (void)i);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v28 pathExtension]);
          unsigned int v30 = [v29 isEqualToString:@"plist"];

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v28]);
            id v202 = v23;
            unsigned __int8 v32 = [__nel setAttributes:v190 ofItemAtPath:v31 error:&v202];
            id v33 = v202;

            if ((v32 & 1) == 0)
            {
              id v34 = [v31 UTF8String];
              id v35 = objc_claimAutoreleasedReturnValue([v33 description]);
              [v35 UTF8String];
              sub_100002F0C( @"Failed to set permissions for file %s: %s",  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)v34);
            }

            id v23 = v33;
          }
        }

        id v25 = [v22 countByEnumeratingWithState:&v208 objects:v216 count:16];
      }

      while (v25);
    }
  }

  v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v44 = [[FFConfiguration alloc] initPrivateForBootTask];
  context = objc_autoreleasePoolPush();
  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 domains]);
  __int128 v196 = 0u;
  __int128 v197 = 0u;
  __int128 v198 = 0u;
  __int128 v199 = 0u;
  id obj = v45;
  v191 = v44;
  id v184 = [v45 countByEnumeratingWithState:&v196 objects:v207 count:16];
  if (v184)
  {
    uint64_t v181 = *(void *)v197;
    do
    {
      size_t v46 = 0LL;
      do
      {
        if (*(void *)v197 != v181) {
          objc_enumerationMutation(obj);
        }
        size_t __nela = v46;
        uint64_t v47 = *(void *)(*((void *)&v196 + 1) + 8 * v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v44 featuresForDomain:v47]);
        __int128 v192 = 0u;
        __int128 v193 = 0u;
        __int128 v194 = 0u;
        __int128 v195 = 0u;
        id v49 = [v48 countByEnumeratingWithState:&v192 objects:v206 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v193;
          do
          {
            for (j = 0LL; j != v50; j = (char *)j + 1)
            {
              if (*(void *)v193 != v51) {
                objc_enumerationMutation(v48);
              }
              v53 = (void *)objc_claimAutoreleasedReturnValue( [v44 stateForFeature:*(void *)(*((void *)&v192 + 1) + 8 * (void)j) domain:v47 level:4]);
              if (v53) {
                -[NSMutableArray addObject:](v43, "addObject:", v53);
              }
              if (dword_100008154 >= 2)
              {
                v54 = __stderrp;
                id v55 = objc_claimAutoreleasedReturnValue([v53 name]);
                v56 = (const char *)[v55 UTF8String];
                id v57 = [v53 value];
                v58 = "disabled";
                if (v57 == (id)1) {
                  v58 = "enabled";
                }
                fprintf(v54, "Feature %s = %s\n", v56, v58);

                id v44 = v191;
              }
            }

            id v50 = [v48 countByEnumeratingWithState:&v192 objects:v206 count:16];
          }

          while (v50);
        }

        size_t v46 = __nela + 1;
      }

      while ((id)(__nela + 1) != v184);
      id v184 = [obj countByEnumeratingWithState:&v196 objects:v207 count:16];
    }

    while (v184);
  }

  objc_autoreleasePoolPop(context);
  v175 = v43;
  uint64_t v59 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  size_t v60 = 0LL;
  int contexta = 0;
  __int128 v200 = *(_OWORD *)"FEATFLAG";
  __int128 v201 = *(_OWORD *)&algn_100003A29[7];
  v182 = (void *)v59;
  do
  {
    arc4random_buf((char *)&v201 + 8, 8uLL);
    __int128 v219 = 0u;
    __int128 v220 = 0u;
    __int128 v217 = 0u;
    __int128 v218 = 0u;
    v185 = v175;
    id v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v185,  "countByEnumeratingWithState:objects:count:",  &v217,  v216,  16LL);
    if (v61)
    {
      id v62 = v61;
      size_t __nelb = 0LL;
      id v63 = *(id *)v218;
      id obja = *(id *)v218;
      while (2)
      {
        for (k = 0LL; k != v62; k = (char *)k + 1)
        {
          if (*(id *)v218 != v63) {
            objc_enumerationMutation(v185);
          }
          v65 = *(void **)(*((void *)&v217 + 1) + 8LL * (void)k);
          id v66 = objc_claimAutoreleasedReturnValue([v65 name]);
          v67 = (const char *)[v66 UTF8String];

          size_t v68 = strlen(v67);
          if (v68 < 0x401)
          {
            unint64_t v76 = *((void *)&v201 + 1) ^ (0xC6A4A7935BD1E995LL * v68);
            id v202 = (id)v68;
            unint64_t v203 = v76;
            uint64_t v204 = 0LL;
            int v205 = 0;
            unint64_t v77 = (unint64_t)&v67[v68];
            v78 = v67;
            if (v68 >= 0x10)
            {
              do
              {
                unint64_t v76 = 0xC6A4A7935BD1E995LL
                    * ((0xC6A4A7935BD1E995LL
                      * ((0xC6A4A7935BD1E995LL
                        * ((0xC6A4A7935BD1E995LL * *(void *)v78) ^ ((0xC6A4A7935BD1E995LL * *(void *)v78) >> 47))) ^ v76)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *((void *)v78 + 1)) ^ ((0xC6A4A7935BD1E995LL * *((void *)v78 + 1)) >> 47))));
                v79 = v78 + 32;
                v78 += 16;
              }

              while ((unint64_t)v79 <= v77);
            }

            if ((unint64_t)(v78 + 8) <= v77)
            {
              do
              {
                unint64_t v76 = 0xC6A4A7935BD1E995LL
                    * ((0xC6A4A7935BD1E995LL
                      * ((0xC6A4A7935BD1E995LL * *(void *)v78) ^ ((0xC6A4A7935BD1E995LL * *(void *)v78) >> 47))) ^ v76);
                BOOL v80 = (unint64_t)(v78 + 16) > v77;
                v78 += 8;
              }

              while (!v80);
            }

            size_t v81 = v60;
            if ((unint64_t)v78 >= v77)
            {
              uint64_t v83 = 0LL;
              int v82 = 0;
            }

            else
            {
              int v82 = 0;
              uint64_t v83 = 0LL;
              int64_t v84 = &v67[v68] - v78;
              do
              {
                unsigned int v85 = *(unsigned __int8 *)v78++;
                v83 |= (unint64_t)v85 << v82;
                v82 += 8;
                --v84;
              }

              while (v84);
            }

            id v202 = 0LL;
            unint64_t v203 = v76;
            uint64_t v204 = v83;
            int v205 = v82;
            unint64_t v86 = sub_100003008((uint64_t)&v202);
            v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v86));
            v88 = (void *)objc_claimAutoreleasedReturnValue([v182 objectForKeyedSubscript:v87]);

            if (v88)
            {
              [v182 removeAllObjects];
              size_t v60 = 0LL;
              goto LABEL_79;
            }

            v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v86));
            [v182 setObject:v65 forKeyedSubscript:v89];

            if ([v65 value] == (id)1) {
              size_t v60 = v81 + 1;
            }
            else {
              size_t v60 = v81;
            }
            id v63 = obja;
          }

          else
          {
            sub_100002F94(v68, v69, v70, v71, v72, v73, v74, v75, (uint64_t)v67);
            ++__nelb;
          }
        }

        id v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v185,  "countByEnumeratingWithState:objects:count:",  &v217,  v216,  16LL);
        if (v62) {
          continue;
        }
        break;
      }
    }

    else
    {
      size_t __nelb = 0LL;
    }

LABEL_79:
    v90 = (char *)[v182 count] + __nelb;
    if (v90 == -[NSMutableArray count](v185, "count")) {
      break;
    }
    ++contexta;
  }

  while (contexta != 10);
  v91 = (char *)[v182 count] + __nelb;
  if (v91 != -[NSMutableArray count](v185, "count")) {
    sub_100003374(@"hash collision retry reached", v92, v93, v94, v95, v96, v97, v98, v173);
  }
  v99 = (void *)(8 * v60);
  v100 = malloc(8 * v60 + 32);
  if (!v100)
  {
    __error();
    sub_100003374(@"could not malloc(%zu): %d", v126, v127, v128, v129, v130, v131, v132, 8 * v60 + 32);
  }

  v101 = v100;
  id objb = (id)(8 * v60 + 32);
  __int128 v102 = v201;
  _OWORD *v100 = v200;
  v100[1] = v102;
  *((void *)v100 + 2) = v60;
  if (dword_100008154 >= 1) {
    fprintf( __stderrp,  "Generating hash table with %zu enabled features of %lu known\n",  v60,  [v182 count]);
  }
  size_t __nelc = v60;
  __int128 v214 = 0u;
  __int128 v215 = 0u;
  __int128 v212 = 0u;
  __int128 v213 = 0u;
  id v103 = v182;
  id v104 = [v103 countByEnumeratingWithState:&v212 objects:&v208 count:16];
  if (v104)
  {
    id v105 = v104;
    uint64_t v106 = 0LL;
    uint64_t v107 = *(void *)v213;
    do
    {
      for (m = 0LL; m != v105; m = (char *)m + 1)
      {
        if (*(void *)v213 != v107) {
          objc_enumerationMutation(v103);
        }
        v109 = *(void **)(*((void *)&v212 + 1) + 8LL * (void)m);
        v110 = (void *)objc_claimAutoreleasedReturnValue([v103 objectForKeyedSubscript:v109]);
        if ([v110 value] == (id)1) {
          v101[v106++ + 4] = [v109 unsignedLongLongValue];
        }
      }

      id v105 = [v103 countByEnumeratingWithState:&v212 objects:&v208 count:16];
    }

    while (v105);
  }

  qsort_b(v101 + 4, __nelc, 8uLL, &stru_1000041B8);
  uint64_t v111 = *((void *)&v201 + 1) ^ (0x35253C9ADE8F4CA8LL * __nelc);
  id v202 = v99;
  unint64_t v203 = v111;
  uint64_t v204 = 0LL;
  int v205 = 0;
  unint64_t v112 = (unint64_t)v99 + (void)(v101 + 4);
  if ((unint64_t)(v101 + 6) <= v112)
  {
    v114 = v101 + 4;
    do
    {
      uint64_t v111 = 0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL
             * ((0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *v114) ^ ((0xC6A4A7935BD1E995LL * *v114) >> 47))) ^ v111)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * v114[1]) ^ ((0xC6A4A7935BD1E995LL * v114[1]) >> 47))));
      v113 = (char *)(v114 + 2);
      v115 = v114 + 4;
      v114 += 2;
    }

    while ((unint64_t)v115 <= v112);
  }

  else
  {
    v113 = (char *)(v101 + 4);
  }

  if ((unint64_t)(v113 + 8) <= v112)
  {
    do
    {
      v116 = v113 + 8;
      uint64_t v111 = 0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL
             * ((0xC6A4A7935BD1E995LL * *(void *)v113) ^ ((0xC6A4A7935BD1E995LL * *(void *)v113) >> 47))) ^ v111);
      BOOL v80 = (unint64_t)(v113 + 16) > v112;
      v113 += 8;
    }

    while (!v80);
  }

  else
  {
    v116 = v113;
  }

  if ((unint64_t)v116 >= v112)
  {
    uint64_t v118 = 0LL;
    int v117 = 0;
  }

  else
  {
    int v117 = 0;
    uint64_t v118 = 0LL;
    int64_t v119 = (char *)v101 + (void)v99 + 32 - v116;
    do
    {
      unsigned int v120 = *v116++;
      v118 |= (unint64_t)v120 << v117;
      v117 += 8;
      --v119;
    }

    while (v119);
  }

  id v202 = 0LL;
  unint64_t v203 = v111;
  uint64_t v204 = v118;
  int v205 = v117;
  v101[1] = sub_100003008((uint64_t)&v202);

  if ((byte_100008150 & 1) == 0)
  {
    int v121 = shm_open("com.apple.featureflags.shm", 2562, 420LL);
    if (v121 < 0)
    {
      v133 = __error();
      sub_100003374(@"shm_open failed: %d", v134, v135, v136, v137, v138, v139, v140, *v133);
    }

    int v122 = v121;
    if (ftruncate(v121, (off_t)objb) == -1)
    {
      v141 = __error();
      sub_100003374( @"failed to size shared memory: %d",  v142,  v143,  v144,  v145,  v146,  v147,  v148,  *v141);
    }

    v123 = mmap(0LL, (size_t)objb, 3, 1, v122, 0LL);
    if (v123 == (void *)-1LL)
    {
      v149 = __error();
      sub_100003374( @"failed to mmap shared memory: %d",  v150,  v151,  v152,  v153,  v154,  v155,  v156,  *v149);
    }

    v124 = v123;
    memcpy(v123, v101, (size_t)objb);
    if (munmap(v124, (size_t)objb) == -1)
    {
      v157 = __error();
      sub_100003374( @"failed to unmap shared memory: %d",  v158,  v159,  v160,  v161,  v162,  v163,  v164,  *v157);
    }

    if (close(v122) == -1)
    {
      v165 = __error();
      sub_100003374( @"failed to close shared memory descriptor: %d",  v166,  v167,  v168,  v169,  v170,  v171,  v172,  *v165);
    }
  }

  objc_autoreleasePoolPop(v174);
  return 0LL;
}

void sub_100002F0C( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  unsigned __int8 v10 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v9, &a9);

  id v11 = __stderrp;
  id v12 = v10;
  fprintf(v11, "init_featureflags: %s\n", -[NSString UTF8String](v12, "UTF8String"));
}

void sub_100002F94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  @"feature name is too long: %s - ignored",  &a9);
  unsigned __int8 v10 = __stderrp;
  id v11 = v9;
  fprintf(v10, "init_featureflags: %s\n", -[NSString UTF8String](v11, "UTF8String"));
}

unint64_t sub_100003008(uint64_t a1)
{
  unint64_t v1 = *(void *)a1;
  if (!*(void *)a1)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    if (!*(_DWORD *)(a1 + 24)) {
      return (0xC6A4A7935BD1E995LL * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995LL * (v2 ^ (v2 >> 47))) >> 47);
    }
    goto LABEL_61;
  }

  memset(v29, 0, sizeof(v29));
  if (v1 > 0x1F)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(a1 + 16);
    unint64_t v4 = v1;
    unsigned int v5 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      uint64_t v6 = v1 >= 0x20 ? 32LL : v1;
      v7 = (char *)v29 + v6;
      if (!v5) {
        break;
      }
      if (v6 && v5 <= 0x3F)
      {
        uint64_t v8 = 0LL;
        id v9 = (char *)v29;
        do
        {
          unint64_t v10 = v5 + v8;
          unsigned int v11 = *v9++;
          v3 |= (unint64_t)v11 << (v5 + v8);
          v8 += 8LL;
        }

        while (v9 < v7 && v10 < 0x38);
        if (v10 > 0x37) {
          goto LABEL_18;
        }
        v5 += v8;
      }

      else if (v5 >= 0x40)
      {
        id v9 = (char *)v29;
LABEL_18:
        unint64_t v12 = 0xC6A4A7935BD1E995LL * v3;
        uint64_t v3 = 0LL;
        unint64_t v2 = 0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * (v12 ^ (v12 >> 47))) ^ v2);
LABEL_19:
        id v13 = v9 + 16;
        while (v13 <= v7)
        {
          unint64_t v2 = 0xC6A4A7935BD1E995LL
             * ((0xC6A4A7935BD1E995LL
               * ((0xC6A4A7935BD1E995LL
                 * ((0xC6A4A7935BD1E995LL * *(void *)v9) ^ ((0xC6A4A7935BD1E995LL * *(void *)v9) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *((void *)v9 + 1)) ^ ((0xC6A4A7935BD1E995LL * *((void *)v9 + 1)) >> 47))));
          id v13 = v9 + 32;
          v9 += 16;
        }

        if (v9 + 8 <= v7)
        {
          do
          {
            unint64_t v2 = 0xC6A4A7935BD1E995LL
               * ((0xC6A4A7935BD1E995LL
                 * ((0xC6A4A7935BD1E995LL * *(void *)v9) ^ ((0xC6A4A7935BD1E995LL * *(void *)v9) >> 47))) ^ v2);
            BOOL v14 = v9 + 16 > v7;
            v9 += 8;
          }

          while (!v14);
        }

        if (v9 >= v7)
        {
          unsigned int v5 = 0;
        }

        else
        {
          unsigned int v5 = 0;
          uint64_t v15 = (char *)((char *)v29 + v6 - v9);
          do
          {
            unsigned int v16 = *v9++;
            v3 |= (unint64_t)v16 << v5;
            v5 += 8;
            --v15;
          }

          while (v15);
        }
      }

      v1 -= v6;
      v4 -= 32LL;
      if (v4 <= 0x1F)
      {
        *(void *)a1 = v1;
        *(void *)(a1 + 8) = v2;
        *(void *)(a1 + 16) = v3;
        *(_DWORD *)(a1 + 24) = v5;
        goto LABEL_35;
      }
    }

    id v9 = (char *)v29;
    goto LABEL_19;
  }

  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t v4 = v1;
  unsigned int v5 = *(_DWORD *)(a1 + 24);
LABEL_35:
  if (v1 < v4) {
    unint64_t v4 = v1;
  }
  uint64_t v17 = (unsigned __int8 *)v29;
  uint64_t v18 = (unsigned __int8 *)v29 + v4;
  if (v5)
  {
    if (v4 && v5 <= 0x3F)
    {
      uint64_t v19 = 0LL;
      uint64_t v17 = (unsigned __int8 *)v29;
      do
      {
        unint64_t v20 = v5 + v19;
        unsigned int v21 = *v17++;
        v3 |= (unint64_t)v21 << (v5 + v19);
        v19 += 8LL;
      }

      while (v17 < v18 && v20 < 0x38);
      if (v20 <= 0x37)
      {
        v5 += v19;
        goto LABEL_60;
      }
    }

    else
    {
      if (v5 < 0x40) {
        goto LABEL_60;
      }
      uint64_t v17 = (unsigned __int8 *)v29;
    }

    unint64_t v22 = 0xC6A4A7935BD1E995LL * v3;
    uint64_t v3 = 0LL;
    unint64_t v2 = 0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * (v22 ^ (v22 >> 47))) ^ v2);
  }

  if (v17 + 16 <= v18)
  {
    do
    {
      unint64_t v2 = 0xC6A4A7935BD1E995LL
         * ((0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL
             * ((0xC6A4A7935BD1E995LL * *(void *)v17) ^ ((0xC6A4A7935BD1E995LL * *(void *)v17) >> 47))) ^ v2)) ^ (0xC6A4A7935BD1E995LL * ((0xC6A4A7935BD1E995LL * *((void *)v17 + 1)) ^ ((0xC6A4A7935BD1E995LL * *((void *)v17 + 1)) >> 47))));
      id v23 = (char *)(v17 + 16);
      id v24 = v17 + 32;
      v17 += 16;
    }

    while (v24 <= v18);
  }

  else
  {
    id v23 = (char *)v17;
  }

  if (v23 + 8 <= (char *)v18)
  {
    do
    {
      id v25 = v23 + 8;
      unint64_t v2 = 0xC6A4A7935BD1E995LL
         * ((0xC6A4A7935BD1E995LL
           * ((0xC6A4A7935BD1E995LL * *(void *)v23) ^ ((0xC6A4A7935BD1E995LL * *(void *)v23) >> 47))) ^ v2);
      BOOL v14 = v23 + 16 > (char *)v18;
      v23 += 8;
    }

    while (!v14);
  }

  else
  {
    id v25 = v23;
  }

  if (v25 >= (char *)v18)
  {
    unsigned int v5 = 0;
  }

  else
  {
    unsigned int v5 = 0;
    uint64_t v26 = (char *)((char *)v29 + v4 - v25);
    do
    {
      unsigned int v27 = *v25++;
      v3 |= (unint64_t)v27 << v5;
      v5 += 8;
      --v26;
    }

    while (v26);
  }

LABEL_60:
  *(void *)a1 = v1 - v4;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = v5;
  if (v5) {
LABEL_61:
  }
    unint64_t v2 = 0xC6A4A7935BD1E995LL * (*(void *)(a1 + 16) ^ v2);
  return (0xC6A4A7935BD1E995LL * (v2 ^ (v2 >> 47))) ^ ((0xC6A4A7935BD1E995LL * (v2 ^ (v2 >> 47))) >> 47);
}

void sub_100003374( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a1,  &a9);
  fprintf(__stderrp, "init_featureflags: %s\n", -[NSString UTF8String](v9, "UTF8String"));
  abort();
}

int sub_1000033D8(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3) {
    sub_100003374( @"duplicate hash found in table: 0x%llx",  (uint64_t)a2,  (uint64_t)a3,  v3,  v4,  v5,  v6,  v7,  *(void *)a2);
  }
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return 1;
  }
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}