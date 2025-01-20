@interface NWConcrete_nw_path
- (NSString)description;
- (NWConcrete_nw_path)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation NWConcrete_nw_path

- (NWConcrete_nw_path)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_path;
  v2 = -[NWConcrete_nw_path init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->lock._os_unfair_lock_opaque = 0LL;
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_path init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path init]";
        _os_log_impl(&dword_181A5C000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_path init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path init]";
        _os_log_impl(&dword_181A5C000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NWConcrete_nw_path);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __35__NWConcrete_nw_path_copyWithZone___block_invoke;
  v9[3] = &unk_189BC9238;
  v5 = v4;
  v10 = v5;
  os_log_type_t v11 = self;
  v6 = self;
  os_unfair_lock_lock(&v6->lock);
  __35__NWConcrete_nw_path_copyWithZone___block_invoke((uint64_t)v9);
  os_unfair_lock_unlock(&v6->lock);

  v7 = v5;
  return v7;
}

- (NSString)description
{
  uint64_t v208 = *MEMORY[0x1895F89C0];
  uint64_t v161 = 0LL;
  v162 = &v161;
  uint64_t v163 = 0x3032000000LL;
  v164 = __Block_byref_object_copy__67543;
  v165 = __Block_byref_object_dispose__67544;
  id v166 = 0LL;
  p_description_lock = &self->description_lock;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v160[0] = MEMORY[0x1895F87A8];
  v160[1] = 3221225472LL;
  v160[2] = __33__NWConcrete_nw_path_description__block_invoke;
  v160[3] = &unk_189BC9210;
  v160[4] = self;
  v160[5] = &v161;
  os_unfair_lock_lock(&self->description_lock);
  __33__NWConcrete_nw_path_description__block_invoke((uint64_t)v160);
  os_unfair_lock_unlock(p_description_lock);
  v5 = (void *)v162[5];
  if (!v5)
  {
    v7 = self;
    v8 = v7;
    if (v7)
    {
      direct = (char *)v7->direct;
      if (direct)
      {
        v10 = direct;
        int v11 = v10[84];

        if (v11)
        {
          BOOL v12 = nw_interface_radio_type_to_string(v11);
        }

        else
        {
          os_log_type_t v13 = v8->direct;
          if (v13)
          {
            char v14 = v13;
            int v15 = *((_DWORD *)v14 + 24);

            if (v15 == 1) {
              BOOL v12 = "802.11";
            }
            else {
              BOOL v12 = 0LL;
            }
          }

          else
          {
            BOOL v12 = 0LL;
          }
        }

        snprintf(__str, 0x28uLL, ", interface: %s", direct + 104);
      }

      else
      {
        BOOL v12 = 0LL;
        __str[0] = 0;
      }

      BOOL is_viable = nw_path_is_viable(v8);
      v17 = ", viable";
      if (!is_viable) {
        v17 = "";
      }
      v158 = v17;
      v18 = v8;
      __int16 v19 = v18;
      unsigned int routing_result = v18->policy_result.routing_result;
      if (routing_result == 6 || routing_result == 12)
      {
        unsigned int tunnel_interface_index = v18->policy_result.routing_result_parameter.tunnel_interface_index;

        if (tunnel_interface_index)
        {
          v22 = ", scoped";
          goto LABEL_22;
        }
      }

      else
      {
      }

      v22 = "";
LABEL_22:
      v157 = v22;
      v23 = v19;
      BOOL v24 = (*((_BYTE *)v23 + 473) & 0x40) == 0;

      v25 = ", ipv4";
      if (v24) {
        v25 = "";
      }
      v156 = v25;
      v26 = v23;
      BOOL v27 = *((char *)v23 + 473) < 0;

      v28 = ", ipv6";
      if (!v27) {
        v28 = "";
      }
      v155 = v28;
      v29 = v26;
      *(void *)buf = v4;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = ___ZL18nw_path_update_dnsP18NWConcrete_nw_path_block_invoke;
      *(void *)&buf[24] = &unk_189BC93A0;
      v30 = v29;
      *(void *)&__int128 v176 = v30;
      os_unfair_lock_lock(v30 + 2);
      (*(void (**)(uint8_t *))&buf[16])(buf);
      os_unfair_lock_unlock(v30 + 2);

      uint64_t v31 = *(void *)&v30[46]._os_unfair_lock_opaque;
      if (v31)
      {
        BOOL v32 = *(void *)(v31 + 24) - *(void *)(v31 + 16) < 8uLL;

        if (v32) {
          v33 = "";
        }
        else {
          v33 = ", dns";
        }
      }

      else
      {

        v33 = "";
      }

      BOOL is_expensive = nw_path_is_expensive((nw_path_t)v30);
      v35 = ", expensive";
      if (!is_expensive) {
        v35 = "";
      }
      v154 = v35;
      BOOL is_constrained = nw_path_is_constrained((nw_path_t)v30);
      v37 = ", constrained";
      if (!is_constrained) {
        v37 = "";
      }
      v153 = v37;
      int is_ultra_constrained = nw_path_is_ultra_constrained(v30);
      v39 = ", ultra constrained";
      if (!is_ultra_constrained) {
        v39 = "";
      }
      v152 = v39;
      BOOL v40 = nw_path_uses_interface_type((nw_path_t)v30, nw_interface_type_wifi);
      v41 = ", uses wifi";
      if (!v40) {
        v41 = "";
      }
      v151 = v41;
      BOOL v42 = nw_path_uses_interface_type((nw_path_t)v30, nw_interface_type_cellular);
      v43 = ", uses cell";
      if (!v42) {
        v43 = "";
      }
      v149 = v43;
      v150 = v33;
      v44 = v30;
      v45 = v44;
      if (*(void *)&v44[60]._os_unfair_lock_opaque)
      {
      }

      else
      {
        BOOL v46 = *(void *)&v44[58]._os_unfair_lock_opaque == 0LL;

        if (v46)
        {
          v47 = "";
LABEL_45:
          __int128 v181 = 0u;
          memset(v182, 0, sizeof(v182));
          __int128 v179 = 0u;
          __int128 v180 = 0u;
          __int128 v177 = 0u;
          __int128 v178 = 0u;
          __int128 v176 = 0u;
          memset(buf, 0, sizeof(buf));
          v148 = v47;
          if (!nw_path_should_fallback(v45, 0)) {
            goto LABEL_61;
          }
          v48 = v45;
          *(void *)v204 = 0LL;
          v205 = v204;
          uint64_t v206 = 0x2020000000LL;
          v207 = buf;
          *(void *)v200 = 0LL;
          v201 = v200;
          uint64_t v202 = 0x2020000000LL;
          uint64_t v203 = 150LL;
          v171 = 0LL;
          v172 = &v171;
          uint64_t v173 = 0x2020000000LL;
          char v174 = 0;
          uint64_t v167 = 0LL;
          v168 = &v167;
          uint64_t v169 = 0x2020000000LL;
          char v170 = 1;
          int v49 = snprintf((char *)buf, 0x96uLL, "%sfallback: {", ", ");
          v50 = v201;
          unint64_t v51 = *((void *)v201 + 3);
          BOOL v52 = v51 > v49;
          unint64_t v53 = v51 - v49;
          if (v52)
          {
            if (v49 >= 1)
            {
              *((void *)v205 + 3) += v49;
              *((void *)v50 + 3) = v53;
            }
          }

          else
          {
            **((_BYTE **)v205 + 3) = 0;
            *((_BYTE *)v172 + 24) = 1;
          }

          *((_BYTE *)v168 + 24) = 0;
          if (!*((_BYTE *)v172 + 24))
          {
            uint64_t v78 = *(void *)&v48[28]._os_unfair_lock_opaque;
            if (!v78) {
              goto LABEL_200;
            }
            int v79 = snprintf( *((char **)v205 + 3),  *((void *)v201 + 3),  "%sinterface: %s",  "",  (const char *)(v78 + 104));
            v80 = v201;
            unint64_t v81 = *((void *)v201 + 3);
            BOOL v52 = v81 > v79;
            unint64_t v82 = v81 - v79;
            if (v52)
            {
              if (v79 >= 1)
              {
                *((void *)v205 + 3) += v79;
                *((void *)v80 + 3) = v82;
              }
            }

            else
            {
              **((_BYTE **)v205 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
            }

            *((_BYTE *)v168 + 24) = 1;
            if (!*((_BYTE *)v172 + 24))
            {
LABEL_200:
              if (!uuid_is_null((const unsigned __int8 *)&v48[38]))
              {
                uuid_unparse((const unsigned __int8 *)&v48[38], out);
                v101 = ", ";
                if (!*((_BYTE *)v168 + 24)) {
                  v101 = "";
                }
                int v102 = snprintf(*((char **)v205 + 3), *((void *)v201 + 3), "%sagent: %s", v101, out);
                v103 = v201;
                unint64_t v104 = *((void *)v201 + 3);
                BOOL v52 = v104 > v102;
                unint64_t v105 = v104 - v102;
                if (v52)
                {
                  if (v102 >= 1)
                  {
                    *((void *)v205 + 3) += v102;
                    *((void *)v103 + 3) = v105;
                  }
                }

                else
                {
                  **((_BYTE **)v205 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }

                *((_BYTE *)v168 + 24) = 1;
              }
            }
          }

          if (!*((_BYTE *)v172 + 24))
          {
            v83 = *(void **)&v48[42]._os_unfair_lock_opaque;
            if (v83)
            {
              if (xpc_array_get_count(v83)
                && *xpc_array_get_string(*(xpc_object_t *)&v48[42]._os_unfair_lock_opaque, 0LL))
              {
                v84 = ", ";
                if (!*((_BYTE *)v168 + 24)) {
                  v84 = "";
                }
                int v85 = snprintf(*((char **)v205 + 3), *((void *)v201 + 3), "%sagent_domains: {", v84);
                v86 = v201;
                unint64_t v87 = *((void *)v201 + 3);
                BOOL v52 = v87 > v85;
                unint64_t v88 = v87 - v85;
                if (v52)
                {
                  if (v85 >= 1)
                  {
                    *((void *)v205 + 3) += v85;
                    *((void *)v86 + 3) = v88;
                  }
                }

                else
                {
                  **((_BYTE **)v205 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }

                *((_BYTE *)v168 + 24) = 0;
                v118 = *(void **)&v48[42]._os_unfair_lock_opaque;
                *(void *)out = v4;
                uint64_t v193 = 3221225472LL;
                v194 = ___ZL28nw_path_fallback_descriptionP18NWConcrete_nw_pathPcm_block_invoke;
                v195 = &unk_189BC54E8;
                v196 = v204;
                v197 = v200;
                v198 = &v167;
                v199 = &v171;
                xpc_array_apply(v118, out);
                *((_BYTE *)v168 + 24) = 0;
                int v119 = snprintf(*((char **)v205 + 3), *((void *)v201 + 3), "%s}", "");
                v120 = v201;
                unint64_t v121 = *((void *)v201 + 3);
                BOOL v52 = v121 > v119;
                unint64_t v122 = v121 - v119;
                if (v52)
                {
                  if (v119 >= 1)
                  {
                    *((void *)v205 + 3) += v119;
                    *((void *)v120 + 3) = v122;
                  }
                }

                else
                {
                  **((_BYTE **)v205 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }

                *((_BYTE *)v168 + 24) = 1;
              }
            }
          }

          if (!*((_BYTE *)v172 + 24))
          {
            v89 = *(void **)&v48[44]._os_unfair_lock_opaque;
            if (v89)
            {
              if (xpc_array_get_count(v89)
                && *xpc_array_get_string(*(xpc_object_t *)&v48[44]._os_unfair_lock_opaque, 0LL))
              {
                v90 = ", ";
                if (!*((_BYTE *)v168 + 24)) {
                  v90 = "";
                }
                int v91 = snprintf(*((char **)v205 + 3), *((void *)v201 + 3), "%sagent_types: {", v90);
                v92 = v201;
                unint64_t v93 = *((void *)v201 + 3);
                BOOL v52 = v93 > v91;
                unint64_t v94 = v93 - v91;
                if (v52)
                {
                  if (v91 >= 1)
                  {
                    *((void *)v205 + 3) += v91;
                    *((void *)v92 + 3) = v94;
                  }
                }

                else
                {
                  **((_BYTE **)v205 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }

                *((_BYTE *)v168 + 24) = 0;
                v123 = *(void **)&v48[44]._os_unfair_lock_opaque;
                *(void *)applier = v4;
                uint64_t v185 = 3221225472LL;
                v186 = ___ZL28nw_path_fallback_descriptionP18NWConcrete_nw_pathPcm_block_invoke_2;
                v187 = &unk_189BC54E8;
                v188 = v204;
                v189 = v200;
                v190 = &v167;
                v191 = &v171;
                xpc_array_apply(v123, applier);
                *((_BYTE *)v168 + 24) = 0;
                int v124 = snprintf(*((char **)v205 + 3), *((void *)v201 + 3), "%s}", "");
                v125 = v201;
                unint64_t v126 = *((void *)v201 + 3);
                BOOL v52 = v126 > v124;
                unint64_t v127 = v126 - v124;
                if (v52)
                {
                  if (v124 >= 1)
                  {
                    *((void *)v205 + 3) += v124;
                    *((void *)v125 + 3) = v127;
                  }
                }

                else
                {
                  **((_BYTE **)v205 + 3) = 0;
                  *((_BYTE *)v172 + 24) = 1;
                }

                *((_BYTE *)v168 + 24) = 1;
              }
            }
          }

          if (*((_BYTE *)v172 + 24))
          {
            v54 = v168;
            v55 = v205;
LABEL_55:
            v56 = v201;
            goto LABEL_56;
          }

          char v95 = *((_BYTE *)v23 + 473);
          v54 = v168;
          v55 = v205;
          if ((v95 & 1) != 0)
          {
            v96 = ", ";
            if (!*((_BYTE *)v168 + 24)) {
              v96 = "";
            }
            int v97 = snprintf(*((char **)v205 + 3), *((void *)v201 + 3), "%sweak", v96);
            v98 = v201;
            unint64_t v99 = *((void *)v201 + 3);
            unint64_t v100 = v99 - v97;
            if (v99 <= v97)
            {
              **((_BYTE **)v205 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
              v55 = v205;
            }

            else
            {
              v55 = v205;
              if (v97 >= 1)
              {
                *((void *)v205 + 3) += v97;
                *((void *)v98 + 3) = v100;
              }
            }

            v54 = v168;
            *((_BYTE *)v168 + 24) = 1;
            if (*((_BYTE *)v172 + 24)) {
              goto LABEL_55;
            }
            char v95 = *((_BYTE *)v23 + 473);
          }

          if ((v95 & 2) != 0)
          {
            v106 = (char *)*((void *)v55 + 3);
            v107 = ", ";
            if (!*((_BYTE *)v54 + 24)) {
              v107 = "";
            }
            int v108 = snprintf(v106, *((void *)v201 + 3), "%sno fallback timer", v107);
            v109 = v201;
            unint64_t v110 = *((void *)v201 + 3);
            unint64_t v111 = v110 - v108;
            if (v110 <= v108)
            {
              **((_BYTE **)v205 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
              v55 = v205;
            }

            else
            {
              v55 = v205;
              if (v108 >= 1)
              {
                *((void *)v205 + 3) += v108;
                *((void *)v109 + 3) = v111;
              }
            }

            v54 = v168;
            *((_BYTE *)v168 + 24) = 1;
            if (*((_BYTE *)v172 + 24)) {
              goto LABEL_55;
            }
            char v95 = *((_BYTE *)v23 + 473);
          }

          if ((v95 & 4) != 0)
          {
            v112 = (char *)*((void *)v55 + 3);
            v113 = ", ";
            if (!*((_BYTE *)v54 + 24)) {
              v113 = "";
            }
            int v114 = snprintf(v112, *((void *)v201 + 3), "%sforced", v113);
            v115 = v201;
            unint64_t v116 = *((void *)v201 + 3);
            unint64_t v117 = v116 - v114;
            if (v116 <= v114)
            {
              **((_BYTE **)v205 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
              v55 = v205;
            }

            else
            {
              v55 = v205;
              if (v114 >= 1)
              {
                *((void *)v205 + 3) += v114;
                *((void *)v115 + 3) = v117;
              }
            }

            v54 = v168;
            *((_BYTE *)v168 + 24) = 1;
            if (*((_BYTE *)v172 + 24)) {
              goto LABEL_55;
            }
            char v95 = *((_BYTE *)v23 + 473);
          }

          if ((v95 & 8) != 0)
          {
            v130 = (char *)*((void *)v55 + 3);
            v131 = ", ";
            if (!*((_BYTE *)v54 + 24)) {
              v131 = "";
            }
            int v132 = snprintf(v130, *((void *)v201 + 3), "%spreferred", v131);
            v56 = v201;
            unint64_t v133 = *((void *)v201 + 3);
            unint64_t v134 = v133 - v132;
            if (v133 <= v132)
            {
              **((_BYTE **)v205 + 3) = 0;
              *((_BYTE *)v172 + 24) = 1;
              v55 = v205;
              v56 = v201;
            }

            else
            {
              v55 = v205;
              if (v132 >= 1)
              {
                *((void *)v205 + 3) += v132;
                *((void *)v56 + 3) = v134;
              }
            }

            v54 = v168;
            *((_BYTE *)v168 + 24) = 1;
            if (*((_BYTE *)v172 + 24)) {
              goto LABEL_56;
            }
            v129 = ", ";
          }

          else
          {
            v56 = v201;
            BOOL v128 = *((_BYTE *)v54 + 24) == 0;
            v129 = ", ";
            if (v128) {
              v129 = "";
            }
          }

          int v135 = snprintf( *((char **)v55 + 3),  *((void *)v56 + 3),  "%sgeneration: %u",  v129,  v48[93]._os_unfair_lock_opaque);
          v56 = v201;
          unint64_t v136 = *((void *)v201 + 3);
          unint64_t v137 = v136 - v135;
          if (v136 <= v135)
          {
            **((_BYTE **)v205 + 3) = 0;
            *((_BYTE *)v172 + 24) = 1;
            v55 = v205;
            v56 = v201;
          }

          else
          {
            v55 = v205;
            if (v135 >= 1)
            {
              *((void *)v205 + 3) += v135;
              *((void *)v56 + 3) = v137;
            }
          }

          v54 = v168;
          *((_BYTE *)v168 + 24) = 1;
LABEL_56:
          *((_BYTE *)v54 + 24) = 0;
          int v57 = snprintf(*((char **)v55 + 3), *((void *)v56 + 3), "%s}", "");
          v58 = v201;
          unint64_t v59 = *((void *)v201 + 3);
          BOOL v52 = v59 > v57;
          unint64_t v60 = v59 - v57;
          if (v52)
          {
            if (v57 >= 1)
            {
              *((void *)v205 + 3) += v57;
              *((void *)v58 + 3) = v60;
            }
          }

          else
          {
            **((_BYTE **)v205 + 3) = 0;
            *((_BYTE *)v172 + 24) = 1;
          }

          *((_BYTE *)v168 + 24) = 1;
          _Block_object_dispose(&v167, 8);
          _Block_object_dispose(&v171, 8);
          _Block_object_dispose(v200, 8);
          _Block_object_dispose(v204, 8);

LABEL_61:
          v61 = v45;
          v62 = v61;
          if (v19->policy_result.routing_result == 4)
          {
            int os_unfair_lock_opaque = v61[67]._os_unfair_lock_opaque;

            if (os_unfair_lock_opaque)
            {
              snprintf(v200, 0x18uLL, ", flow divert: %u", os_unfair_lock_opaque);
              int v64 = v62[88]._os_unfair_lock_opaque;
              if (!v64)
              {
LABEL_64:
                v204[0] = 0;
                goto LABEL_68;
              }

- (void)dealloc
{
  reason_description = self->reason_description;
  if (reason_description)
  {
    free(reason_description);
    self->reason_description = 0LL;
  }

  netagents = self->policy_result.netagents;
  if (netagents)
  {
    free(netagents);
    self->policy_result.netagents = 0LL;
  }

  interface_options = self->policy_result.interface_options;
  if (interface_options)
  {
    free(interface_options);
    self->policy_result.interface_options = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_path;
  -[NWConcrete_nw_path dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end