@interface RMIReportCommand
- (BOOL)_switchToRMDUserIfNeeded;
- (BOOL)runWithOptions:(id)a3;
- (id)_getDeclarationStatusWithContext:(id)a3 scope:(int64_t)a4;
- (id)_getReportWithContext:(id)a3;
- (id)_reportInScope:(int64_t)a3;
- (id)name;
- (id)options;
- (id)shortEnglishDescription;
- (id)usageLine;
@end

@implementation RMIReportCommand

- (id)name
{
  return @"report";
}

- (id)options
{
  v2 = objc_opt_new(&OBJC_CLASS___CLIOption);
  -[CLIOption setLongName:](v2, "setLongName:", @"scope");
  -[CLIOption setShortName:](v2, "setShortName:", @"s");
  -[CLIOption setShortEnglishDescription:](v2, "setShortEnglishDescription:", @"Scope to use (default: system).");
  -[CLIOption setParameterCount:](v2, "setParameterCount:", 1LL);
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (id)usageLine
{
  return @"[--scope (system|user)]";
}

- (id)shortEnglishDescription
{
  return @"Reports the Remote Management state on this device.";
}

- (BOOL)runWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryWithOptionsAndValues]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"scope"]);
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"system";
  }
  v9 = v8;

  if (-[__CFString isEqualToString:](v9, "isEqualToString:", @"system"))
  {
    -[RMIReportCommand _switchToRMDUserIfNeeded](self, "_switchToRMDUserIfNeeded");
    uint64_t v10 = 1LL;
  }

  else
  {
    if ((-[__CFString isEqualToString:](v9, "isEqualToString:", @"user") & 1) == 0)
    {
      sub_100011B4C(@"You must specify a valid scope.", v11, v12, v13, v14, v15, v16, v17, v21);
      sub_100011CF0(self);
    }

    uint64_t v10 = 0LL;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RMIReportCommand _reportInScope:](self, "_reportInScope:", v10));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RMJSONSerialization serializeValue:](&OBJC_CLASS___RMJSONSerialization, "serializeValue:", v18));
  sub_100005784(0LL, @"Remote Management Report", v19, 0LL);

  return 1;
}

- (BOOL)_switchToRMDUserIfNeeded
{
  return 1;
}

- (id)_reportInScope:(int64_t)a3
{
  id v4 = sub_100005AB4(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v5)
  {
    v90 = v5;
    v89 = self;
    id v91 = [v5 newBackgroundContext];
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[RMIReportCommand _getReportWithContext:](self, "_getReportWithContext:"));
    v93 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v182 = 0u;
    __int128 v183 = 0u;
    __int128 v184 = 0u;
    __int128 v185 = 0u;
    id obj = v7;
    id v96 = [obj countByEnumeratingWithState:&v182 objects:v210 count:16];
    if (v96)
    {
      uint64_t v95 = *(void *)v183;
      v8 = @"inactiveReasons";
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v183 != v95)
          {
            uint64_t v10 = v9;
            objc_enumerationMutation(obj);
            uint64_t v9 = v10;
          }

          uint64_t v11 = *(void **)(*((void *)&v182 + 1) + 8 * v9);
          uint64_t v12 = v9;
          if ([v11 isEqual:@"Management Sources"])
          {
            uint64_t v94 = v12;
            v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v11]);
            __int128 v178 = 0u;
            __int128 v179 = 0u;
            __int128 v180 = 0u;
            __int128 v181 = 0u;
            id v98 = v13;
            id v104 = [v13 countByEnumeratingWithState:&v178 objects:v209 count:16];
            if (v104)
            {
              uint64_t v100 = *(void *)v179;
              id v142 = v11;
              do
              {
                uint64_t v14 = 0LL;
                do
                {
                  if (*(void *)v179 != v100) {
                    objc_enumerationMutation(v98);
                  }
                  uint64_t v106 = v14;
                  uint64_t v15 = *(void **)(*((void *)&v178 + 1) + 8 * v14);
                  v110 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  __int128 v174 = 0u;
                  __int128 v175 = 0u;
                  __int128 v176 = 0u;
                  __int128 v177 = 0u;
                  id v114 = v15;
                  id v112 = [v114 countByEnumeratingWithState:&v174 objects:v208 count:16];
                  if (v112)
                  {
                    uint64_t v108 = *(void *)v175;
                    do
                    {
                      uint64_t v16 = 0LL;
                      do
                      {
                        if (*(void *)v175 != v108)
                        {
                          uint64_t v17 = v16;
                          objc_enumerationMutation(v114);
                          uint64_t v16 = v17;
                        }

                        uint64_t v116 = v16;
                        v18 = *(void **)(*((void *)&v174 + 1) + 8 * v16);
                        if ([v18 isEqual:@"activations"])
                        {
                          v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                          v19 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKeyedSubscript:v18]);
                          __int128 v170 = 0u;
                          __int128 v171 = 0u;
                          __int128 v172 = 0u;
                          __int128 v173 = 0u;
                          id v118 = v19;
                          id v124 = [v19 countByEnumeratingWithState:&v170 objects:v207 count:16];
                          if (v124)
                          {
                            uint64_t v120 = *(void *)v171;
                            v140 = v18;
                            do
                            {
                              uint64_t v20 = 0LL;
                              do
                              {
                                if (*(void *)v171 != v120) {
                                  objc_enumerationMutation(v118);
                                }
                                uint64_t v126 = v20;
                                uint64_t v21 = *(void **)(*((void *)&v170 + 1) + 8 * v20);
                                v134 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                                __int128 v166 = 0u;
                                __int128 v167 = 0u;
                                __int128 v168 = 0u;
                                __int128 v169 = 0u;
                                id v22 = v21;
                                id v136 = [v22 countByEnumeratingWithState:&v166 objects:v206 count:16];
                                if (v136)
                                {
                                  id v130 = v22;
                                  uint64_t v132 = *(void *)v167;
                                  do
                                  {
                                    uint64_t v23 = 0LL;
                                    do
                                    {
                                      if (*(void *)v167 != v132)
                                      {
                                        uint64_t v24 = v23;
                                        objc_enumerationMutation(v22);
                                        uint64_t v23 = v24;
                                      }

                                      uint64_t v138 = v23;
                                      v25 = *(void **)(*((void *)&v166 + 1) + 8 * v23);
                                      if ([v25 isEqual:@"predicateDescription"])
                                      {
                                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v134,  "setObject:forKeyedSubscript:",  @"YES",  v25);
                                      }

                                      else
                                      {
                                        if ([v25 isEqual:@"state"])
                                        {
                                          v128 = v25;
                                          v26 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v25]);
                                          v152 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                                          __int128 v162 = 0u;
                                          __int128 v163 = 0u;
                                          __int128 v164 = 0u;
                                          __int128 v165 = 0u;
                                          id v27 = v26;
                                          id v28 = [v27 countByEnumeratingWithState:&v162 objects:v205 count:16];
                                          if (v28)
                                          {
                                            id v29 = v28;
                                            uint64_t v30 = *(void *)v163;
                                            uint64_t v144 = *(void *)v163;
                                            id v146 = v27;
                                            do
                                            {
                                              uint64_t v31 = 0LL;
                                              id v148 = v29;
                                              do
                                              {
                                                if (*(void *)v163 != v30)
                                                {
                                                  v32 = v8;
                                                  v33 = v18;
                                                  v34 = v11;
                                                  uint64_t v35 = v31;
                                                  objc_enumerationMutation(v27);
                                                  uint64_t v31 = v35;
                                                  uint64_t v11 = v34;
                                                  v18 = v33;
                                                  v8 = v32;
                                                }

                                                uint64_t v154 = v31;
                                                v36 = *(void **)(*((void *)&v162 + 1) + 8 * v31);
                                                if ([v36 isEqual:v8])
                                                {
                                                  v150 = v36;
                                                  v37 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v36]);
                                                  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray array]( &OBJC_CLASS___NSMutableArray,  "array"));
                                                  __int128 v200 = 0u;
                                                  __int128 v201 = 0u;
                                                  __int128 v202 = 0u;
                                                  __int128 v203 = 0u;
                                                  id v39 = v37;
                                                  id v160 = [v39 countByEnumeratingWithState:&v200 objects:v204 count:16];
                                                  if (v160)
                                                  {
                                                    id v156 = v39;
                                                    uint64_t v158 = *(void *)v201;
                                                    do
                                                    {
                                                      for (i = 0LL; i != v160; i = (char *)i + 1)
                                                      {
                                                        if (*(void *)v201 != v158) {
                                                          objc_enumerationMutation(v156);
                                                        }
                                                        v41 = *(void **)(*((void *)&v200 + 1) + 8LL * (void)i);
                                                        __int128 v196 = 0u;
                                                        __int128 v197 = 0u;
                                                        __int128 v198 = 0u;
                                                        __int128 v199 = 0u;
                                                        id v42 = v41;
                                                        id v43 = [v42 countByEnumeratingWithState:&v196 objects:&v192 count:16];
                                                        if (v43)
                                                        {
                                                          id v44 = v43;
                                                          uint64_t v45 = *(void *)v197;
                                                          do
                                                          {
                                                            for (j = 0LL; j != v44; j = (char *)j + 1)
                                                            {
                                                              if (*(void *)v197 != v45) {
                                                                objc_enumerationMutation(v42);
                                                              }
                                                              if (objc_msgSend( *(id *)(*((void *)&v196 + 1)
                                                                                         + 8LL * (void)j),
                                                                                   "isEqual:",
                                                                                   @"code"))
                                                              {
                                                                v190 = @"code";
                                                                v47 = (void *)objc_claimAutoreleasedReturnValue( [v42 objectForKeyedSubscript:@"code"]);
                                                                v191 = v47;
                                                                v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v191,  &v190,  1LL));
                                                                [v38 addObject:v48];
                                                              }
                                                            }

                                                            id v44 = [v42 countByEnumeratingWithState:&v196 objects:&v192 count:16];
                                                          }

                                                          while (v44);
                                                        }
                                                      }

                                                      id v39 = v156;
                                                      id v160 = [v156 countByEnumeratingWithState:&v200 objects:v204 count:16];
                                                    }

                                                    while (v160);
                                                  }

                                                  -[NSMutableDictionary setObject:forKey:]( v152,  "setObject:forKey:",  v38,  v150);
                                                  v8 = @"inactiveReasons";
                                                  v18 = v140;
                                                  uint64_t v11 = v142;
                                                  uint64_t v30 = v144;
                                                  id v27 = v146;
                                                  id v29 = v148;
                                                }

                                                else
                                                {
                                                  id v39 = (id)objc_claimAutoreleasedReturnValue([v27 objectForKey:v36]);
                                                  -[NSMutableDictionary setObject:forKey:]( v152,  "setObject:forKey:",  v39,  v36);
                                                }

                                                uint64_t v31 = v154 + 1;
                                              }

                                              while ((id)(v154 + 1) != v29);
                                              id v29 = [v27 countByEnumeratingWithState:&v162 objects:v205 count:16];
                                            }

                                            while (v29);
                                          }

                                          -[NSMutableDictionary setObject:forKey:]( v134,  "setObject:forKey:",  v152,  v128);
                                        }

                                        else
                                        {
                                          v49 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v25]);
                                          -[NSMutableDictionary setObject:forKey:](v134, "setObject:forKey:", v49, v25);
                                        }

                                        id v22 = v130;
                                      }

                                      uint64_t v23 = v138 + 1;
                                    }

                                    while ((id)(v138 + 1) != v136);
                                    id v136 = [v22 countByEnumeratingWithState:&v166 objects:v206 count:16];
                                  }

                                  while (v136);
                                }

                                [v122 addObject:v134];
                                uint64_t v20 = v126 + 1;
                              }

                              while ((id)(v126 + 1) != v124);
                              id v124 = [v118 countByEnumeratingWithState:&v170 objects:v207 count:16];
                            }

                            while (v124);
                          }

                          v50 = v122;
                          -[NSMutableDictionary setObject:forKeyedSubscript:]( v110,  "setObject:forKeyedSubscript:",  v122,  v18);
                        }

                        else
                        {
                          v50 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKey:v18]);
                          -[NSMutableDictionary setObject:forKeyedSubscript:]( v110,  "setObject:forKeyedSubscript:",  v50,  v18);
                        }

                        uint64_t v16 = v116 + 1;
                      }

                      while ((id)(v116 + 1) != v112);
                      id v112 = [v114 countByEnumeratingWithState:&v174 objects:v208 count:16];
                    }

                    while (v112);
                  }

                  [v102 addObject:v110];
                  uint64_t v14 = v106 + 1;
                }

                while ((id)(v106 + 1) != v104);
                id v104 = [v98 countByEnumeratingWithState:&v178 objects:v209 count:16];
              }

              while (v104);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:](v93, "setObject:forKeyedSubscript:", v102, v11);

            uint64_t v12 = v94;
          }

          uint64_t v9 = v12 + 1;
        }

        while ((id)(v12 + 1) != v96);
        id v96 = [obj countByEnumeratingWithState:&v182 objects:v210 count:16];
      }

      while (v96);
    }

    id v51 = (id)objc_claimAutoreleasedReturnValue( -[RMIReportCommand _getDeclarationStatusWithContext:scope:]( v89,  "_getDeclarationStatusWithContext:scope:",  v91,  a3));
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v192 = 0u;
    __int128 v193 = 0u;
    __int128 v194 = 0u;
    __int128 v195 = 0u;
    id v99 = v51;
    id v103 = [v99 countByEnumeratingWithState:&v192 objects:v210 count:16];
    if (v103)
    {
      uint64_t v101 = *(void *)v193;
      do
      {
        uint64_t v52 = 0LL;
        do
        {
          if (*(void *)v193 != v101) {
            objc_enumerationMutation(v99);
          }
          uint64_t v107 = v52;
          v53 = *(void **)(*((void *)&v192 + 1) + 8 * v52);
          v111 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          __int128 v182 = 0u;
          __int128 v183 = 0u;
          __int128 v184 = 0u;
          __int128 v185 = 0u;
          id v115 = v53;
          id v113 = [v115 countByEnumeratingWithState:&v182 objects:v209 count:16];
          if (v113)
          {
            uint64_t v109 = *(void *)v183;
            do
            {
              uint64_t v54 = 0LL;
              do
              {
                if (*(void *)v183 != v109) {
                  objc_enumerationMutation(v115);
                }
                uint64_t v117 = v54;
                v55 = *(void **)(*((void *)&v182 + 1) + 8 * v54);
                unsigned __int8 v56 = [v55 isEqual:@"Status"];
                v57 = (void *)objc_claimAutoreleasedReturnValue([v115 objectForKeyedSubscript:v55]);
                id v58 = v57;
                if ((v56 & 1) != 0)
                {
                  v59 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:@"management"]);

                  v125 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  __int128 v178 = 0u;
                  __int128 v179 = 0u;
                  __int128 v180 = 0u;
                  __int128 v181 = 0u;
                  id v58 = v59;
                  id v60 = [v58 countByEnumeratingWithState:&v178 objects:v208 count:16];
                  if (v60)
                  {
                    id v61 = v60;
                    id v62 = *(id *)v179;
                    id v121 = v58;
                    v123 = v55;
                    id v119 = *(id *)v179;
                    do
                    {
                      v63 = 0LL;
                      id v127 = v61;
                      do
                      {
                        if (*(id *)v179 != v62) {
                          objc_enumerationMutation(v58);
                        }
                        v64 = *(void **)(*((void *)&v178 + 1) + 8LL * (void)v63);
                        if ([v64 isEqual:@"declarations"])
                        {
                          v129 = v63;
                          v65 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:v64]);
                          v133 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                          __int128 v174 = 0u;
                          __int128 v175 = 0u;
                          __int128 v176 = 0u;
                          __int128 v177 = 0u;
                          id v137 = v65;
                          id v135 = [v137 countByEnumeratingWithState:&v174 objects:v207 count:16];
                          if (v135)
                          {
                            uint64_t v131 = *(void *)v175;
                            v153 = v64;
                            do
                            {
                              uint64_t v66 = 0LL;
                              do
                              {
                                if (*(void *)v175 != v131) {
                                  objc_enumerationMutation(v137);
                                }
                                uint64_t v139 = *(void *)(*((void *)&v174 + 1) + 8 * v66);
                                uint64_t v141 = v66;
                                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "objectForKeyedSubscript:"));
                                v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                                __int128 v170 = 0u;
                                __int128 v171 = 0u;
                                __int128 v172 = 0u;
                                __int128 v173 = 0u;
                                id v143 = v67;
                                id v149 = [v143 countByEnumeratingWithState:&v170 objects:v206 count:16];
                                if (v149)
                                {
                                  uint64_t v145 = *(void *)v171;
                                  do
                                  {
                                    uint64_t v68 = 0LL;
                                    do
                                    {
                                      if (*(void *)v171 != v145) {
                                        objc_enumerationMutation(v143);
                                      }
                                      uint64_t v151 = v68;
                                      v69 = *(void **)(*((void *)&v170 + 1) + 8 * v68);
                                      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                                      v71 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                                      __int128 v166 = 0u;
                                      __int128 v167 = 0u;
                                      __int128 v168 = 0u;
                                      __int128 v169 = 0u;
                                      id v72 = v69;
                                      id v161 = [v72 countByEnumeratingWithState:&v166 objects:v205 count:16];
                                      if (v161)
                                      {
                                        v157 = v71;
                                        uint64_t v159 = *(void *)v167;
                                        id v155 = v72;
                                        do
                                        {
                                          for (k = 0LL; k != v161; k = (char *)k + 1)
                                          {
                                            if (*(void *)v167 != v159) {
                                              objc_enumerationMutation(v72);
                                            }
                                            v74 = *(void **)(*((void *)&v166 + 1) + 8LL * (void)k);
                                            if ([v74 isEqual:@"reasons"])
                                            {
                                              v75 = (void *)objc_claimAutoreleasedReturnValue( [v72 objectForKeyedSubscript:@"reasons"]);
                                              v76 = v75;
                                              if (v75)
                                              {
                                                __int128 v164 = 0u;
                                                __int128 v165 = 0u;
                                                __int128 v162 = 0u;
                                                __int128 v163 = 0u;
                                                id v77 = [v75 countByEnumeratingWithState:&v162 objects:v204 count:16];
                                                if (v77)
                                                {
                                                  id v78 = v77;
                                                  uint64_t v79 = *(void *)v163;
                                                  do
                                                  {
                                                    for (m = 0LL; m != v78; m = (char *)m + 1)
                                                    {
                                                      if (*(void *)v163 != v79) {
                                                        objc_enumerationMutation(v76);
                                                      }
                                                      v81 = *(void **)(*((void *)&v162 + 1) + 8LL * (void)m);
                                                      *(void *)&__int128 v196 = @"code";
                                                      v82 = (void *)objc_claimAutoreleasedReturnValue( [v81 objectForKeyedSubscript:@"code"]);
                                                      *(void *)&__int128 v200 = v82;
                                                      v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v200,  &v196,  1LL));
                                                      [v70 addObject:v83];
                                                    }

                                                    id v78 = [v76 countByEnumeratingWithState:&v162 objects:v204 count:16];
                                                  }

                                                  while (v78);
                                                }

                                                v71 = v157;
                                                -[NSMutableDictionary setObject:forKey:]( v157,  "setObject:forKey:",  v70,  @"reasons");
                                                v64 = v153;
                                                id v72 = v155;
                                              }
                                            }

                                            else
                                            {
                                              v76 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKey:v74]);
                                              -[NSMutableDictionary setObject:forKey:]( v71,  "setObject:forKey:",  v76,  v74);
                                            }
                                          }

                                          id v161 = [v72 countByEnumeratingWithState:&v166 objects:v205 count:16];
                                        }

                                        while (v161);
                                      }

                                      [v147 addObject:v71];
                                      uint64_t v68 = v151 + 1;
                                    }

                                    while ((id)(v151 + 1) != v149);
                                    id v149 = [v143 countByEnumeratingWithState:&v170 objects:v206 count:16];
                                  }

                                  while (v149);
                                }

                                -[NSMutableDictionary setObject:forKey:](v133, "setObject:forKey:", v147, v139);
                                uint64_t v66 = v141 + 1;
                              }

                              while ((id)(v141 + 1) != v135);
                              id v135 = [v137 countByEnumeratingWithState:&v174 objects:v207 count:16];
                            }

                            while (v135);
                          }

                          -[NSMutableDictionary setObject:forKey:](v125, "setObject:forKey:", v133, v64);
                          id v58 = v121;
                          v55 = v123;
                          id v62 = v119;
                          id v61 = v127;
                          v63 = v129;
                        }

                        v63 = (char *)v63 + 1;
                      }

                      while (v63 != v61);
                      id v61 = [v58 countByEnumeratingWithState:&v178 objects:v208 count:16];
                    }

                    while (v61);
                  }

                  v84 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  -[NSMutableDictionary setObject:forKey:](v84, "setObject:forKey:", v125, @"management");
                  -[NSMutableDictionary setObject:forKey:](v111, "setObject:forKey:", v84, v55);
                }

                else
                {
                  -[NSMutableDictionary setValue:forKey:](v111, "setValue:forKey:", v57, v55);
                }

                uint64_t v54 = v117 + 1;
              }

              while ((id)(v117 + 1) != v113);
              id v113 = [v115 countByEnumeratingWithState:&v182 objects:v209 count:16];
            }

            while (v113);
          }

          [v105 addObject:v111];
          uint64_t v52 = v107 + 1;
        }

        while ((id)(v107 + 1) != v103);
        id v103 = [v99 countByEnumeratingWithState:&v192 objects:v210 count:16];
      }

      while (v103);
    }

    v85 = @"user";
    if (a3 == 1) {
      v85 = @"system";
    }
    v188[0] = @"Scope";
    v188[1] = @"Report";
    v189[0] = v85;
    v189[1] = v93;
    v188[2] = @"Status";
    v189[2] = v105;
    v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v189,  v188,  3LL));

    uint64_t v6 = v90;
  }

  else
  {
    v186[0] = @"Error";
    v186[1] = @"Scope";
    if (a3 == 1) {
      v87 = @"system";
    }
    else {
      v87 = @"user";
    }
    v187[0] = @"Missing or invalid container";
    v187[1] = v87;
    v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v187,  v186,  2LL));
  }

  return v86;
}

- (id)_getReportWithContext:(id)a3
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_100007FF4;
  uint64_t v13 = sub_100008004;
  id v14 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000800C;
  v6[3] = &unk_10001C5B0;
  v8 = &v9;
  id v3 = a3;
  id v7 = v3;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)_getDeclarationStatusWithContext:(id)a3 scope:(int64_t)a4
{
  id v5 = a3;
  v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472LL;
  uint64_t v34 = (uint64_t)sub_100008374;
  uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_10001C5D8;
  uint64_t v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v18 = v5;
  v36 = (void (*)(uint64_t))v17;
  [v5 performBlockAndWait:&v32];

  uint64_t v6 = v17;
  if (-[NSMutableArray count](v17, "count"))
  {
    id v20 = +[RMXPCProxy newConnectionWithScope:](&OBJC_CLASS___RMXPCProxy, "newConnectionWithScope:", a4);
    [v20 resume];
    uint64_t v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = v17;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v38,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          id v11 = v20;
          id v12 = v10;
          v32 = 0LL;
          uint64_t v33 = (uint64_t)&v32;
          uint64_t v34 = 0x3032000000LL;
          uint64_t v35 = sub_100007FF4;
          v36 = sub_100008004;
          v37 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          [*(id *)(v33 + 40) setObject:v12 forKeyedSubscript:@"Channel"];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472LL;
          v29[2] = sub_1000084CC;
          v29[3] = &unk_10001C600;
          uint64_t v30 = &off_10001E908;
          uint64_t v31 = &v32;
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 synchronousRemoteObjectProxyWithErrorHandler:v29]);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_10000869C;
          v26[3] = &unk_10001C628;
          id v27 = &off_10001E908;
          id v28 = &v32;
          [v13 queryForStatusAndErrorsWithKeyPaths:&off_10001E908 fromManagementSourceWithIdentifier:v12 completionHandler:v26];
          id v14 = v27;
          id v15 = *(id *)(v33 + 40);

          _Block_object_dispose(&v32, 8);
          -[NSMutableArray addObject:](v21, "addObject:", v15);
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v38,  16LL);
      }

      while (v7);
    }

    uint64_t v6 = v17;
  }

  else
  {
    uint64_t v21 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v21;
}

@end