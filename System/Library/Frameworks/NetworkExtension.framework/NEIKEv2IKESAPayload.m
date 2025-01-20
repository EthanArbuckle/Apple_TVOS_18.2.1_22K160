@interface NEIKEv2IKESAPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2IKESAPayload

- (unint64_t)type
{
  return 33LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend( v7,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v9, 32, 1),  @"Rekey SPI",  v5,  a4);
    id Property = objc_getProperty(self, v10, 24LL, 1);
  }

  else
  {
    [v7 appendPrettyObject:0 withName:@"Rekey SPI" andIndent:v5 options:a4];
    id Property = 0LL;
  }

  [v7 appendPrettyObject:Property withName:@"Proposals" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2IKESAPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2IKESAPayload *)objc_getProperty(self, a2, 24LL, 1);
  }
  return -[NEIKEv2IKESAPayload count](self, "count") != 0;
}

- (BOOL)generatePayloadData
{
  v2 = self;
  uint64_t v212 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 16LL, 1)) {
    goto LABEL_3;
  }
  if (-[NEIKEv2IKESAPayload hasRequiredFields](v2, "hasRequiredFields"))
  {
    unint64_t v6 = 0x189603000uLL;
    id v8 = objc_alloc_init(MEMORY[0x189603FB8]);
    if (v2) {
      id Property = objc_getProperty(v2, v7, 24LL, 1);
    }
    else {
      id Property = 0LL;
    }
    unsigned __int8 v11 = [Property count];
    __int128 v194 = 0u;
    __int128 v195 = 0u;
    __int128 v196 = 0u;
    __int128 v197 = 0u;
    if (v2) {
      id v12 = objc_getProperty(v2, v10, 24LL, 1);
    }
    else {
      id v12 = 0LL;
    }
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v194 objects:v211 count:16];
    if (!v14)
    {
LABEL_170:

      if (!v2)
      {

        id v4 = 0LL;
        return v4 != 0LL;
      }

      objc_setProperty_atomic(v2, v143, v8, 16LL);

LABEL_3:
      id v4 = objc_getProperty(v2, v3, 16LL, 1);
      return v4 != 0LL;
    }

    unint64_t v154 = v14;
    uint64_t v15 = 0LL;
    unsigned int v147 = v11;
    uint64_t v16 = *(void *)v195;
    uint64_t v17 = *(void *)v195;
    unsigned __int8 v151 = 1;
    uint64_t v150 = *(void *)v195;
LABEL_12:
    if (v17 != v16)
    {
      uint64_t v18 = v15;
      objc_enumerationMutation(v13);
      uint64_t v15 = v18;
    }

    uint64_t v153 = v15;
    v19 = *(void **)(*((void *)&v194 + 1) + 8 * v15);
    [v19 encryptionProtocols];
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    selfa = v19;
    if (v19) {
      id v22 = objc_getProperty(v19, v20, 88LL, 1);
    }
    else {
      id v22 = 0LL;
    }
    id v23 = v22;

    if (v23)
    {
      id v25 = selfa;
      if (selfa) {
        id v25 = objc_getProperty(selfa, v24, 88LL, 1);
      }
      id v26 = v25;
      id v210 = v26;
      uint64_t v27 = [MEMORY[0x189603F18] arrayWithObjects:&v210 count:1];

      id v21 = (id)v27;
    }

    if ([v21 count])
    {
      __int128 v192 = 0u;
      __int128 v193 = 0u;
      __int128 v190 = 0u;
      __int128 v191 = 0u;
      id v21 = v21;
      uint64_t v28 = [v21 countByEnumeratingWithState:&v190 objects:v209 count:16];
      if (!v28) {
        goto LABEL_30;
      }
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v191;
      do
      {
        for (uint64_t i = 0LL; i != v29; ++i)
        {
          if (*(void *)v191 != v30) {
            objc_enumerationMutation(v21);
          }
          uint64_t v32 = *(void *)(*((void *)&v190 + 1) + 8 * i);
          if (v32 && (unint64_t)(*(void *)(v32 + 16) - 29LL) <= 2)
          {
            ne_log_obj();
            v142 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_1876B1000,  v142,  OS_LOG_TYPE_ERROR,  "IIV encryption algorithms only allowed in child SA proposals",  buf,  2u);
            }

            v34 = v21;
            goto LABEL_167;
          }
        }

        uint64_t v29 = [v21 countByEnumeratingWithState:&v190 objects:v209 count:16];
      }

      while (v29);
LABEL_30:

      [selfa prfProtocols];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (selfa) {
        id v35 = objc_getProperty(selfa, v33, 104LL, 1);
      }
      else {
        id v35 = 0LL;
      }
      id v36 = v35;

      if (v36)
      {
        id v38 = selfa;
        v39 = v34;
        if (selfa) {
          id v38 = objc_getProperty(selfa, v37, 104LL, 1);
        }
        id v40 = v38;
        id v208 = v40;
        [MEMORY[0x189603F18] arrayWithObjects:&v208 count:1];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (![v34 count])
      {
        ne_log_obj();
        v144 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1876B1000, v144, OS_LOG_TYPE_ERROR, "IKE SA proposal missing PRF protocol", buf, 2u);
        }

        goto LABEL_167;
      }

      [selfa additionalKEMProtocols];
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](selfa);
      id v158 = v21;
      v152 = v34;
      id v145 = v13;
      v146 = v8;
      v149 = v2;
      if (v41)
      {
        v42 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](selfa);
        if ([v42 count])
        {
          id v43 = objc_alloc(MEMORY[0x189603FC8]);
          v44 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](selfa);
          v45 = (void *)objc_msgSend(v43, "initWithCapacity:", objc_msgSend(v44, "count"));

          __int128 v188 = 0u;
          __int128 v189 = 0u;
          __int128 v186 = 0u;
          __int128 v187 = 0u;
          id v46 = v42;
          uint64_t v47 = [v46 countByEnumeratingWithState:&v186 objects:v207 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v187;
            do
            {
              for (uint64_t j = 0LL; j != v48; ++j)
              {
                if (*(void *)v187 != v49) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v51 = *(void *)(*((void *)&v186 + 1) + 8 * j);
                [v46 objectForKeyedSubscript:v51];
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v206 = v52;
                [MEMORY[0x189603F18] arrayWithObjects:&v206 count:1];
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                [v45 setObject:v53 forKeyedSubscript:v51];
              }

              uint64_t v48 = [v46 countByEnumeratingWithState:&v186 objects:v207 count:16];
            }

            while (v48);
          }

          id v13 = v145;
          id v8 = v146;
          v2 = v149;
          id v21 = v158;
          v34 = v152;
        }

        else
        {
          v45 = (void *)MEMORY[0x189604A60];
        }

        v159 = v45;
        unint64_t v6 = 0x189603000uLL;
      }

      [selfa kemProtocols];
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (selfa) {
        id v56 = objc_getProperty(selfa, v54, 112LL, 1);
      }
      else {
        id v56 = 0LL;
      }
      id v57 = v56;

      if (v57)
      {
        id v59 = selfa;
        if (selfa) {
          id v59 = objc_getProperty(selfa, v58, 112LL, 1);
        }
        id v60 = v59;
        id v205 = v60;
        uint64_t v61 = [MEMORY[0x189603F18] arrayWithObjects:&v205 count:1];

        v62 = (void *)v61;
        v34 = v152;
      }

      else
      {
        v62 = v55;
      }

      v148 = v62;
      if (![v62 count])
      {
        ne_log_obj();
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1876B1000, v63, OS_LOG_TYPE_ERROR, "IKE SA proposal missing KE protocol", buf, 2u);
        }

        int v78 = 0;
        goto LABEL_151;
      }

      v63 = (os_log_s *)objc_alloc_init(*(Class *)(v6 + 4024));
      __int128 v182 = 0u;
      __int128 v183 = 0u;
      __int128 v184 = 0u;
      __int128 v185 = 0u;
      id v64 = v21;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v182 objects:v204 count:16];
      if (!v65)
      {
        LOBYTE(v67) = 0;
        char v68 = 0;
LABEL_84:

        __int128 v179 = 0u;
        __int128 v180 = 0u;
        __int128 v177 = 0u;
        __int128 v178 = 0u;
        id v79 = v34;
        uint64_t v80 = [v79 countByEnumeratingWithState:&v177 objects:v203 count:16];
        if (v80)
        {
          unint64_t v81 = v80;
          uint64_t v82 = 0LL;
          uint64_t v83 = *(void *)v178;
          for (uint64_t k = *(void *)v178; ; uint64_t k = *(void *)v178)
          {
            if (k != v83) {
              objc_enumerationMutation(v79);
            }
            v85 = *(void **)(*((void *)&v177 + 1) + 8 * v82);
            *(void *)buf = 0LL;
            unsigned int v86 = [v85 type];
            buf[0] = 3;
            buf[4] = 2;
            *(_WORD *)&buf[6] = bswap32(v86) >> 16;
            *(_WORD *)&buf[2] = 2048;
            -[os_log_s appendBytes:length:](v63, "appendBytes:length:", buf, 8LL);
            LOBYTE(v67) = v67 + 1;
            if (++v82 >= v81)
            {
              uint64_t v87 = [v79 countByEnumeratingWithState:&v177 objects:v203 count:16];
              if (!v87) {
                break;
              }
              unint64_t v81 = v87;
              uint64_t v82 = 0LL;
            }
          }
        }

        if ((v68 & 1) != 0)
        {
          v88 = v159;
        }

        else
        {
          [selfa integrityProtocols];
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v149;
          if (selfa) {
            id v91 = objc_getProperty(selfa, v89, 96LL, 1);
          }
          else {
            id v91 = 0LL;
          }
          id v92 = v91;

          if (v92)
          {
            id v94 = selfa;
            if (selfa) {
              id v94 = objc_getProperty(selfa, v93, 96LL, 1);
            }
            id v95 = v94;
            id v202 = v95;
            uint64_t v96 = [MEMORY[0x189603F18] arrayWithObjects:&v202 count:1];

            v90 = (void *)v96;
          }

          if (![v90 count])
          {
            ne_log_obj();
            v106 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl( &dword_1876B1000,  v106,  OS_LOG_TYPE_ERROR,  "IKE SA proposal missing integrity protocol",  buf,  2u);
            }

            int v78 = 0;
            id v13 = v145;
            id v8 = v146;
            v34 = v152;
            goto LABEL_151;
          }

          __int128 v175 = 0u;
          __int128 v176 = 0u;
          __int128 v173 = 0u;
          __int128 v174 = 0u;
          id v97 = v90;
          uint64_t v98 = [v97 countByEnumeratingWithState:&v173 objects:v201 count:16];
          if (v98)
          {
            unint64_t v99 = v98;
            uint64_t v100 = 0LL;
            uint64_t v101 = *(void *)v174;
            uint64_t v102 = *(void *)v174;
            v88 = v159;
            while (1)
            {
              if (v102 != v101) {
                objc_enumerationMutation(v97);
              }
              v103 = *(void **)(*((void *)&v173 + 1) + 8 * v100);
              *(void *)buf = 0LL;
              unsigned int v104 = [v103 type];
              buf[0] = 3;
              buf[4] = 3;
              *(_WORD *)&buf[6] = bswap32(v104) >> 16;
              *(_WORD *)&buf[2] = 2048;
              -[os_log_s appendBytes:length:](v63, "appendBytes:length:", buf, 8LL);
              LOBYTE(v67) = v67 + 1;
              if (++v100 >= v99)
              {
                uint64_t v105 = [v97 countByEnumeratingWithState:&v173 objects:v201 count:16];
                if (!v105) {
                  goto LABEL_113;
                }
                unint64_t v99 = v105;
                uint64_t v100 = 0LL;
              }

              uint64_t v102 = *(void *)v174;
            }
          }

          v88 = v159;
LABEL_113:
        }

        if ([v88 count])
        {
          [v88 allKeys];
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          [v107 sortedArrayUsingSelector:sel_compare_];
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          __int128 v171 = 0u;
          __int128 v172 = 0u;
          __int128 v169 = 0u;
          __int128 v170 = 0u;
          obuint64_t j = v108;
          uint64_t v109 = [obj countByEnumeratingWithState:&v169 objects:v200 count:16];
          if (v109)
          {
            unint64_t v110 = v109;
            unint64_t v111 = 0LL;
            uint64_t v112 = *(void *)v170;
            uint64_t v156 = *(void *)v170;
            while (1)
            {
              if (v112 != v156) {
                objc_enumerationMutation(obj);
              }
              v113 = *(void **)(*((void *)&v169 + 1) + 8 * v111);
              uint8_t v114 = [v113 unsignedCharValue];
              __int128 v165 = 0u;
              __int128 v166 = 0u;
              __int128 v167 = 0u;
              __int128 v168 = 0u;
              [v159 objectForKeyedSubscript:v113];
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v116 = [v115 countByEnumeratingWithState:&v165 objects:v199 count:16];
              if (v116)
              {
                unint64_t v117 = v116;
                uint64_t v118 = 0LL;
                uint64_t v119 = *(void *)v166;
                for (uint64_t m = *(void *)v166; ; uint64_t m = *(void *)v166)
                {
                  if (m != v119) {
                    objc_enumerationMutation(v115);
                  }
                  v121 = *(void **)(*((void *)&v165 + 1) + 8 * v118);
                  *(void *)buf = 0LL;
                  unsigned int v122 = [v121 method];
                  buf[0] = 3;
                  buf[4] = v114;
                  *(_WORD *)&buf[6] = bswap32(v122) >> 16;
                  *(_WORD *)&buf[2] = 2048;
                  -[os_log_s appendBytes:length:](v63, "appendBytes:length:", buf, 8LL);
                  LOBYTE(v67) = v67 + 1;
                  if (++v118 >= v117)
                  {
                    uint64_t v123 = [v115 countByEnumeratingWithState:&v165 objects:v199 count:16];
                    if (!v123) {
                      break;
                    }
                    unint64_t v117 = v123;
                    uint64_t v118 = 0LL;
                  }
                }
              }

              ++v111;
              id v21 = v158;
              if (v111 >= v110)
              {
                uint64_t v124 = [obj countByEnumeratingWithState:&v169 objects:v200 count:16];
                if (!v124) {
                  break;
                }
                unint64_t v110 = v124;
                unint64_t v111 = 0LL;
              }

              uint64_t v112 = *(void *)v170;
            }
          }
        }

        v2 = v149;
        unsigned __int8 v125 = [v148 count];
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        id v126 = v148;
        uint64_t v127 = [v126 countByEnumeratingWithState:&v161 objects:v198 count:16];
        if (!v127) {
          goto LABEL_144;
        }
        unint64_t v128 = v127;
        uint64_t v129 = 0LL;
        uint64_t v130 = *(void *)v162;
        unsigned __int8 v131 = 1;
        for (uint64_t n = *(void *)v162; ; uint64_t n = *(void *)v162)
        {
          if (n != v130) {
            objc_enumerationMutation(v126);
          }
          v133 = *(void **)(*((void *)&v161 + 1) + 8 * v129);
          *(void *)buf = 0LL;
          unsigned int v134 = [v133 method];
          else {
            uint8_t v135 = 3;
          }
          buf[0] = v135;
          buf[4] = 4;
          *(_WORD *)&buf[6] = bswap32(v134) >> 16;
          *(_WORD *)&buf[2] = 2048;
          -[os_log_s appendBytes:length:](v63, "appendBytes:length:", buf, 8LL);
          LOBYTE(v67) = v67 + 1;
          if (++v129 >= v128)
          {
            uint64_t v136 = [v126 countByEnumeratingWithState:&v161 objects:v198 count:16];
            if (!v136)
            {
              v2 = v149;
              id v21 = v158;
LABEL_144:

              *(void *)buf = 0x10000000000LL;
              buf[0] = 2 * (v147 > v151);
              v34 = v152;
              uint8_t v138 = selfa;
              if (selfa) {
                uint8_t v138 = selfa[8];
              }
              buf[4] = v138;
              if (v2 && objc_getProperty(v2, v137, 32LL, 1))
              {
                uint64_t v160 = objc_msgSend(objc_getProperty(v2, v139, 32, 1), "value");
                buf[6] = 8;
                -[os_log_s replaceBytesInRange:withBytes:length:]( v63,  "replaceBytesInRange:withBytes:length:",  0LL,  0LL,  &v160,  8LL);
              }

              else
              {
                buf[6] = 0;
              }

              buf[7] = v67;
              *(_WORD *)&buf[2] = bswap32(-[os_log_s length](v63, "length") + 8) >> 16;
              id v8 = v146;
              [v146 appendBytes:buf length:8];
              [v146 appendData:v63];
              ++v151;
              int v78 = 1;
              id v13 = v145;
LABEL_151:

              if (!v78) {
                goto LABEL_168;
              }
              uint64_t v140 = v154;
              uint64_t v15 = v153 + 1;
              unint64_t v6 = 0x189603000LL;
              if (v153 + 1 < v154) {
                goto LABEL_155;
              }
              uint64_t v140 = [v13 countByEnumeratingWithState:&v194 objects:v211 count:16];
              if (!v140) {
                goto LABEL_170;
              }
              uint64_t v15 = 0LL;
LABEL_155:
              unint64_t v154 = v140;
              uint64_t v17 = *(void *)v195;
              uint64_t v16 = v150;
              goto LABEL_12;
            }

            unint64_t v128 = v136;
            uint64_t v129 = 0LL;
          }

          ++v131;
        }
      }

      unint64_t v66 = v65;
      int v67 = 0;
      char v68 = 0;
      uint64_t v69 = 0LL;
      uint64_t v70 = *(void *)v183;
      for (iuint64_t i = *(void *)v183; ; iuint64_t i = *(void *)v183)
      {
        if (ii != v70) {
          objc_enumerationMutation(v64);
        }
        uint64_t v72 = *(void *)(*((void *)&v182 + 1) + 8 * v69);
        *(void *)buf = 0LL;
        LODWORD(v160) = 0;
        if (!v72) {
          break;
        }
        unint64_t v73 = *(void *)(v72 + 16);
        if (v73 != 12 && (v73 > 0x1E || ((0x401C0000u >> v73) & 1) == 0)) {
          goto LABEL_65;
        }
        if ((*(_BYTE *)(v72 + 8) & 1) != 0) {
          unsigned int v74 = 256;
        }
        else {
          unsigned int v74 = 128;
        }
        buf[0] = 3;
        buf[4] = 1;
        *(_WORD *)&buf[6] = bswap32(v73) >> 16;
        LOWORD(v160) = 3712;
        WORD1(v160) = __rev16(v74);
        *(_WORD *)&buf[2] = 3072;
        -[os_log_s appendBytes:length:](v63, "appendBytes:length:", buf, 8LL);
        -[os_log_s appendBytes:length:](v63, "appendBytes:length:", &v160, 4LL);
        ++v67;
LABEL_71:
        unint64_t v75 = *(void *)(v72 + 16);
        if (v75 <= 0x1F)
        {
          unsigned int v76 = (0xD01C0000 >> v75) & 1;
          goto LABEL_74;
        }

- (BOOL)parsePayloadData
{
  *(void *)((char *)&v70[1] + 4) = *MEMORY[0x1895F89C0];
  if (!self || (v2 = self, !objc_getProperty(self, a2, 16LL, 1)))
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v70[0] = "-[NEIKEv2IKESAPayload parsePayloadData]";
      _os_log_fault_impl(&dword_1876B1000, v4, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", buf, 0xCu);
    }

    goto LABEL_8;
  }

  if ((unint64_t)objc_msgSend(objc_getProperty(v2, v3, 16, 1), "length") > 7)
  {
    newValue = (os_log_s *)objc_alloc_init(MEMORY[0x189603FA8]);
    id v7 = objc_getProperty(v2, v6, 16LL, 1);
    id v8 = (unsigned __int8 *)[v7 bytes];
    id v56 = v7;
    unsigned int v10 = [v7 length];
    unsigned __int8 v11 = &off_18A087000;
    *(void *)&__int128 v12 = 67109376LL;
    __int128 v55 = v12;
    id v57 = v2;
    while (1)
    {
      if (v10 < 8)
      {
LABEL_79:
        id v4 = newValue;
        objc_setProperty_atomic(v2, v9, newValue, 24LL);
        BOOL v5 = -[NEIKEv2IKESAPayload hasRequiredFields](v2, "hasRequiredFields");

        goto LABEL_80;
      }

      unsigned int v13 = bswap32(*((unsigned __int16 *)v8 + 1));
      unint64_t v14 = HIWORD(v13);
      if (v10 < HIWORD(v13))
      {
        ne_log_obj();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
        {
LABEL_78:

          goto LABEL_79;
        }

        *(_DWORD *)buf = v55;
        LODWORD(v70[0]) = v10;
        WORD2(v70[0]) = 1024;
        *(_DWORD *)((char *)v70 + 6) = v14;
        uint64_t v51 = "Not enough bytes remaining (%u) to process proposal length %u";
        v52 = (os_log_s *)v50;
        uint32_t v53 = 14;
LABEL_82:
        _os_log_error_impl(&dword_1876B1000, v52, OS_LOG_TYPE_ERROR, v51, buf, v53);
        goto LABEL_78;
      }

      if ((unint64_t)v8[6] + 8 > v14)
      {
        ne_log_obj();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR)) {
          goto LABEL_78;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v70[0]) = v14;
        uint64_t v51 = "Proposal length %u is too short";
        v52 = (os_log_s *)v50;
        uint32_t v53 = 8;
        goto LABEL_82;
      }

      unsigned int v63 = v8[7];
      uint64_t v15 = objc_alloc_init((Class)v11[348]);
      uint64_t v16 = v8[6];
      if ((_DWORD)v16 == 8) {
        break;
      }
      if (v8[6])
      {
        ne_log_obj();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v48 = v8[4];
          int v49 = v8[6];
          *(_DWORD *)buf = v55;
          LODWORD(v70[0]) = v48;
          WORD2(v70[0]) = 1024;
          *(_DWORD *)((char *)v70 + 6) = v49;
          _os_log_error_impl(&dword_1876B1000, v17, OS_LOG_TYPE_ERROR, "SA proposal %u has wrong length %u", buf, 0xEu);
        }

        goto LABEL_15;
      }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"SA(IKE)";
}

@end