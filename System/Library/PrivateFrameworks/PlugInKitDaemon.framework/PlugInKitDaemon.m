void OUTLINED_FUNCTION_1( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  os_log_s *v9;
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

  ;
}

LABEL_29:
  os_unfair_lock_lock(lock);
  v42 = -[PKDatabase cacheHits](self, "cacheHits");
  v43 = -[PKDatabase cacheMisses](self, "cacheMisses");
  os_unfair_lock_unlock(lock);
  v45 = pklog_handle_for_category(9LL, v44);
  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    v48 = -[NSMutableSet count](v54, "count");
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v64 = v48;
    *(_WORD *)&v64[4] = 2048;
    *(void *)&v64[6] = v42 - v50;
    *(_WORD *)&v64[14] = 2048;
    *(void *)&v64[16] = v43 - v49 + v42 - v50;
    _os_log_debug_impl(&dword_0, v46, OS_LOG_TYPE_DEBUG, "LS reported %u plug-ins (cached %qu/%qu)", buf, 0x1Cu);
  }

  v10 = v52;
  v8 = v53;
LABEL_33:

  objc_autoreleasePoolPop(v10);
  return v54;
}

void OUTLINED_FUNCTION_0_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_5EF8(_Unwind_Exception *a1)
{
}

LABEL_25:
    }

    else
    {
      v4 = 0LL;
      v20 = 1;
    }

    if (!v20) {
LABEL_27:
    }
      v4 = 0LL;
  }

  return (id)v4;
}
}

LABEL_13:
  return (NSString *)sandboxProfile;
}

  v20 = 0LL;
LABEL_17:

  return v20;
}

LABEL_40:
      LOBYTE(self) = 0;
      goto LABEL_43;
    }

    if (v15)
    {
      LOBYTE(self) = [v15 isEqual:&__kCFBooleanFalse];
      goto LABEL_43;
    }

LABEL_48:
}

LABEL_42:
    LOBYTE(self) = 1;
    goto LABEL_43;
  }

  if (!v15) {
    goto LABEL_40;
  }
  LODWORD(self) = [v15 isEqual:&__kCFBooleanFalse] ^ 1;
LABEL_43:

  return (char)self;
}

LABEL_17:
  return v9;
}

#error "7D7C: call analysis failed (funcsize=96)"
id __cdecl -[PKDPlugIn dataContainerURLForPersona:](PKDPlugIn *self, SEL a2, id a3)
{
  id v4;
  void *v5;
  void *v6;
  v4 = a3;
  if (v4) {
    v5 = (void *)voucher_adopt(0LL);
  }
  else {
    v5 = 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn _dataContainerURLForPersona:](self, "_dataContainerURLForPersona:", v4));
  if (v4) {

  }
  return v6;
}

LABEL_111:
          v89 = 0;
          goto LABEL_112;
        }

        v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
        v157 = objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
        v158 = v144;
        v159 = (void *)v157;
        v160 = pkErrorf(4LL, @"RBSLaunchRequest error trying to launch plugin %@(%@): %@");
        *v179 = (id)objc_claimAutoreleasedReturnValue(v160);

        v144 = v158;
      }

      goto LABEL_103;
    }

    v123 = (void *)_CFXPCCreateXPCObjectFromCFObject(v191);
    v124 = launch_add_external_service( [v194 pid], objc_msgSend(v99, "UTF8String"), v123);
    v126 = pklog_handle_for_category(7LL, v125);
    v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
    v128 = v127;
    if (v124)
    {
      v20 = v196;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        v166 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
        v167 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
        v168 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
        v169 = [v194 pid];
        *(_DWORD *)buf = 138544386;
        v201 = v166;
        v202 = 2112;
        v203 = v167;
        v204 = 2112;
        v205 = (uint64_t)v168;
        v206 = 1024;
        *(_DWORD *)v207 = v124;
        *(_WORD *)&v207[4] = 1024;
        *(_DWORD *)&v207[6] = v169;
        _os_log_error_impl( &dword_0,  v128,  OS_LOG_TYPE_ERROR,  "[u %{public}@] [%@(%@)] launchd error %d trying to allow host pid %d to use plugin",  buf,  0x2Cu);

        v20 = v196;
      }

      if (!a10)
      {
LABEL_110:

        if (!v124) {
          goto LABEL_104;
        }
        goto LABEL_111;
      }

      v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      v172 = (void *)objc_claimAutoreleasedReturnValue([v129 UUIDString]);
      v130 = pkErrorf(4LL, @"unable to enable plug-in %@(%@)");
      *a10 = (id)objc_claimAutoreleasedReturnValue(v130);
    }

    else
    {
      if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
      {
        v161 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
        v162 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
        v163 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
        v164 = [v194 pid];
        *(_DWORD *)buf = 138544130;
        v201 = v161;
        v202 = 2112;
        v203 = v162;
        v204 = 2112;
        v205 = (uint64_t)v163;
        v206 = 1024;
        *(_DWORD *)v207 = v164;
        _os_log_impl( &dword_0,  v128,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] launch_add_external_service() for host %d succeeded",  buf,  0x26u);
      }

      v20 = v196;
    }

    goto LABEL_110;
  }

  v83 = pklog_handle_for_category(7LL, v82);
  v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
    -[PKDPlugIn enableForClient:environment:languages:oneShotUUID:persona:sandbox:pid:error:].cold.1(self);
  }

  if (a10)
  {
    v85 = objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
    v87 = (PKBundle *)objc_claimAutoreleasedReturnValue([v86 UUIDString]);
    v191 = (NSMutableDictionary *)v85;
    v88 = pkErrorf(4LL, @"persona specified but disallowed for system extension %@(%@)");
    v89 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue(v88);
LABEL_114:

    goto LABEL_115;
  }

  v89 = 0;
LABEL_115:

  return v89;
}

LABEL_27:
        goto LABEL_28;
      }
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn containingBundleIdentifier](self, "containingBundleIdentifier"));

  if (!v25)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn personaCache](self, "personaCache"));
    v13 = (id)objc_claimAutoreleasedReturnValue([v39 personalPersonaID]);

    v41 = pklog_handle_for_category(13LL, v40);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v43;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v44;
      LOWORD(v67) = 2112;
      *(void *)((char *)&v67 + 2) = v13;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] assigning to persona ID %@ since it has no containing bundle",  buf,  0x2Au);
    }

    goto LABEL_27;
  }

  *((void *)&v65 + 1) = 0LL;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn personaCache](self, "personaCache"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn containingBundleIdentifier](self, "containingBundleIdentifier"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v26 personasForBundleIdentifier:v27 error:(char *)&v65 + 8]);

  v30 = *((void *)&v65 + 1);
  if (*((void *)&v65 + 1))
  {
    v31 = pklog_handle_for_category(13LL, v29);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[PKDPlugIn _personaIDForClient:requestedPersona:].cold.2( (uint64_t)self,  (uint64_t)&v65 + 8,  (uint64_t)v32,  v33,  v34,  v35,  v36,  v37,  v65,  *(uint64_t *)buf,  *(uint64_t *)&buf[8],  *(__int128 *)&buf[16],  v67,  *((uint64_t *)&v67 + 1),  v68,  v69,  v70,  v71,  v72,  v73,  v74,  v75);
    }
LABEL_22:
    v13 = 0LL;
    goto LABEL_23;
  }

  if (!v28 || ![v28 count])
  {
    v61 = pklog_handle_for_category(13LL, v29);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v62;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v63;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v64;
      _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] assigning to no specific persona",  buf,  0x20u);
    }

    goto LABEL_22;
  }

  if ((unint64_t)[v28 count] >= 2)
  {
    v46 = pklog_handle_for_category(13LL, v45);
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
      -[PKDPlugIn _personaIDForClient:requestedPersona:].cold.1( (uint64_t)self,  (uint64_t)v47,  v48,  v49,  v50,  v51,  v52,  v53,  v65,  *(int *)buf,  *(__int16 *)&buf[4],  *(__int16 *)&buf[6],  *(void **)&buf[8],  *(__int128 *)&buf[16],  v67,  *((uint64_t *)&v67 + 1),  v68,  v69,  v70,  v71,  v72,  v73,  v74,  v75);
    }
  }

  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 anyObject]);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s personaID](v32, "personaID"));
  v55 = pklog_handle_for_category(13LL, v54);
  v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn uuid](self, "uuid"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn identifier](self, "identifier"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPlugIn version](self, "version"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s personaID](v32, "personaID"));
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v57;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v58;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v59;
    LOWORD(v67) = 2112;
    *(void *)((char *)&v67 + 2) = v60;
    _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] assigning to persona ID %@", buf, 0x2Au);
  }

LABEL_23:
  if (!v30)
  {
LABEL_28:
    v13 = v13;
    v38 = (_UNKNOWN **)v13;
    goto LABEL_29;
  }

  v38 = &off_25FC0;
LABEL_29:

  return v38;
}

void OUTLINED_FUNCTION_3_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_5(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_9(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

  ;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

LABEL_23:
  return v13;
}

LABEL_8:
    v9 = 0LL;
    goto LABEL_9;
  }

  v6 = (id)objc_claimAutoreleasedReturnValue([v3 substringFromIndex:1]);
LABEL_7:
  v9 = v6;
LABEL_9:

  return v9;
}

void OUTLINED_FUNCTION_0_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_1_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_C010( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

LABEL_15:
  os_unfair_lock_unlock(p_holdLock);
  return v18;
}

      goto LABEL_48;
    }
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) server]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 holdOnPlugIn:v4]);

  if (v34)
  {
    v36 = pklog_handle_for_category(6LL, v35);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = *(void *)(a1 + 32);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
      v40 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v4 identifier]);
      v41 = (void *)objc_claimAutoreleasedReturnValue([v4 version]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v34 client]);
      v43 = [v42 pid];
      v44 = (void *)objc_claimAutoreleasedReturnValue([v34 created]);
      *(_DWORD *)buf = 138413826;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2112;
      v98 = v40;
      *(_WORD *)v99 = 2112;
      *(void *)&v99[2] = v41;
      *(_WORD *)&v99[10] = 1024;
      *(_DWORD *)&v99[12] = v43;
      *(_WORD *)&v99[16] = 2114;
      *(void *)&v99[18] = v44;
      *(_WORD *)&v99[26] = 2112;
      *(void *)&v99[28] = v34;
      _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_DEFAULT,  "[d %@] [u %{public}@] [%@(%@)] rejecting; plugin has an active hold by pid %d taken at %{public}@ (%@)",
        buf,
        0x44u);
    }

    goto LABEL_48;
  }

LABEL_25:
  v45 = *(void *)(a1 + 48);
  v46 = *(void *)(a1 + 32);
  v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) server]);
  LODWORD(v45) = [v4 match:v45 discoveryInstanceUUID:v46 server:v47];

  if (!(_DWORD)v45) {
    goto LABEL_48;
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v48 = *(id *)(a1 + 56);
  v49 = [v48 countByEnumeratingWithState:&v90 objects:v96 count:16];
  if (v49)
  {
    v50 = *(void *)v91;
    while (2)
    {
      v51 = 0LL;
      else {
        v52 = (uint64_t)v49;
      }
      do
      {
        if (*(void *)v91 != v50) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void *)(*((void *)&v90 + 1) + 8 * v51);
        v54 = *(void *)(a1 + 32);
        v55 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) server]);
        LODWORD(v53) = [v4 match:v53 discoveryInstanceUUID:v54 server:v55];

        if ((_DWORD)v53)
        {
          v61 = pklog_handle_for_category(6LL, v56);
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            v62 = *(void *)(a1 + 32);
            v63 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
            v64 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v4 identifier]);
            v65 = (void *)objc_claimAutoreleasedReturnValue([v4 version]);
            *(_DWORD *)buf = 138413058;
            *(void *)&buf[4] = v62;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v63;
            *(_WORD *)&buf[22] = 2112;
            v98 = v64;
            *(_WORD *)v99 = 2112;
            *(void *)&v99[2] = v65;
            _os_log_impl( &dword_0,  v60,  OS_LOG_TYPE_INFO,  "[d %@] [u %{public}@] [%@(%@)] rejecting; plugin globally excluded",
              buf,
              0x2Au);
          }

          goto LABEL_40;
        }

        ++v51;
      }

      while (v52 != v51);
      v49 = [v48 countByEnumeratingWithState:&v90 objects:v96 count:16];
      if (v49) {
        continue;
      }
      break;
    }
  }

  if ((*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 25LL) & 2) != 0) {
    goto LABEL_45;
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) client]);
  v48 = (id)objc_claimAutoreleasedReturnValue([v4 allowForClient:v57 discoveryInstanceUUID:*(void *)(a1 + 32)]);

  if (!v48)
  {

LABEL_45:
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v98 = __Block_byref_object_copy_;
    *(void *)v99 = __Block_byref_object_dispose_;
    *(void *)&v99[8] = v4;
    v66 = *(void **)(a1 + 64);
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472LL;
    v85[2] = __30__PKDTransaction_matchPlugIns__block_invoke_110;
    v85[3] = &unk_24E20;
    v88 = buf;
    v67 = *(id *)(a1 + 32);
    v69 = *(void **)(a1 + 64);
    v68 = *(void *)(a1 + 72);
    v86 = v67;
    v89 = v68;
    v87 = v69;
    [v66 enumerateKeysAndObjectsUsingBlock:v85];
    v70 = *(void *)(*(void *)&buf[8] + 40LL);
    if (v70)
    {
      v71 = *(void **)(a1 + 64);
      v72 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) uuid]);
      [v71 setObject:v70 forKeyedSubscript:v72];
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_48;
  }

  v59 = pklog_handle_for_category(6LL, v58);
  v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    v79 = *(void *)(a1 + 32);
    v80 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    v81 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v4 identifier]);
    v82 = (void *)objc_claimAutoreleasedReturnValue([v4 version]);
    *(_DWORD *)buf = 138413314;
    *(void *)&buf[4] = v79;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v80;
    *(_WORD *)&buf[22] = 2112;
    v98 = v81;
    *(_WORD *)v99 = 2112;
    *(void *)&v99[2] = v82;
    *(_WORD *)&v99[10] = 2114;
    *(void *)&v99[12] = v48;
    _os_log_error_impl( &dword_0,  v60,  OS_LOG_TYPE_ERROR,  "[d %@] [u %{public}@] [%@(%@)] rejecting; plugin disallowed for client: %{public}@",
      buf,
      0x34u);
  }

LABEL_16:
  os_unfair_lock_unlock(p_holdLock);
}

    v20 = 1LL;
    goto LABEL_17;
  }

  v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) lastModified];
  v15 = [*(id *)(a1 + 32) lastModified];
  v17 = pklog_handle_for_category(6LL, v16);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  v18 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((uint64_t)v14 > (uint64_t)v15)
  {
    if (v18) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }

  if (v18)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) uuid]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) version]);
    v19 = *(void *)(a1 + 40);
    v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) version]);
    v30 = 138413826;
    v31 = v5;
    v32 = 2114;
    v33 = v6;
    v34 = 2112;
    v35 = v7;
    v36 = 2112;
    v37 = v19;
    v38 = 2114;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v11;
    v12 = "[d %@] [u %{public}@] [%@(%@)] detected another plugin with the same modification date: [u %{public}@] [%@(%@)] ";
    goto LABEL_12;
  }

void OUTLINED_FUNCTION_0_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_2_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}
}

void sub_E204( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

LABEL_30:
      return v16;
    }

    v15 = @"invalid request (uuid allocation failure)";
  }

  else
  {
    v8 = *(void **)(a1 + 32);
    v15 = @"invalid request (bad uuid array)";
  }

  [v8 fail:4 message:v15];
  return 0LL;
}

void sub_ED68(_Unwind_Exception *a1)
{
}

void sub_11EBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

LABEL_5:
  if ([v4 isDedicated])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) client]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundle]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 url]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
    v94 = 0LL;
    v12 = [v7 getRelationship:&v95 ofDirectoryAtURL:v10 toItemAtURL:v11 error:&v94];
    v13 = v94;

    if ((v12 & 1) == 0)
    {
      v27 = pklog_handle_for_category(6LL, v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v83 = *(void *)(a1 + 32);
        v73 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
        v84 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v4 identifier]);
        v74 = (void *)objc_claimAutoreleasedReturnValue([v4 version]);
        v75 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) client]);
        v76 = (void *)objc_claimAutoreleasedReturnValue([v75 bundle]);
        v77 = (void *)objc_claimAutoreleasedReturnValue([v76 url]);
        v78 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
        *(_DWORD *)buf = 138413826;
        *(void *)&buf[4] = v83;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v73;
        *(_WORD *)&buf[22] = 2112;
        v98 = v84;
        *(_WORD *)v99 = 2112;
        *(void *)&v99[2] = v74;
        *(_WORD *)&v99[10] = 2112;
        *(void *)&v99[12] = v77;
        *(_WORD *)&v99[20] = 2112;
        *(void *)&v99[22] = v78;
        *(_WORD *)&v99[30] = 2112;
        *(void *)&v99[32] = v13;
        _os_log_error_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "[d %@] [u %{public}@] [%@(%@)] failed to get relationship between %@ and %@: %@",  buf,  0x48u);
      }

      goto LABEL_15;
    }

    if (v95)
    {
      v15 = pklog_handle_for_category(6LL, v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = *(void *)(a1 + 32);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
        v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v4 identifier]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v4 version]);
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        v98 = v19;
        *(_WORD *)v99 = 2112;
        *(void *)&v99[2] = v20;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "[d %@] [u %{public}@] [%@(%@)] rejecting; plugin is dedicated but isn't in host bundle",
          buf,
          0x2Au);
      }

void sub_12AA8(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

LABEL_22:
        v48 = *(void *)(*(void *)(a1 + 48) + 8LL);
        v49 = *(void **)(v48 + 40);
        *(void *)(v48 + 40) = 0LL;

        goto LABEL_23;
      }

      v27 = pklog_handle_for_category(6LL, v16);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v55 = *(void *)(a1 + 32);
        v51 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v14 version]);
        *(_DWORD *)buf = 138413826;
        v68 = v59;
        v69 = 2114;
        v70 = v29;
        v71 = 2112;
        v72 = v30;
        v73 = 2112;
        v74 = v55;
        v75 = 2114;
        v76 = v51;
        v77 = 2112;
        v78 = v31;
        v79 = 2112;
        v80 = v32;
        _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "[d %@] [u %{public}@] [%@(%@)] rejecting; ordered same but another plugin has precedent: [u %{public}@] [%@(%@)] ",
          buf,
          0x48u);
      }
    }

    [*(id *)(a1 + 40) removeObjectForKey:v6];
LABEL_23:
    *a4 = 1;
    goto LABEL_24;
  }

void __zeroUUID_block_invoke(id a1)
{
  uint64_t v1 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &UUID_NULL_0);
  v2 = (void *)zeroUUID_zero;
  zeroUUID_zero = (uint64_t)v1;
}

void OUTLINED_FUNCTION_0_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v1 - 176), 8) = a1;
}

  ;
}

  ;
}

  ;
}

  ;
}

id OUTLINED_FUNCTION_6_0(void *a1, const char *a2)
{
  return [a1 pid];
}

LABEL_11:
  v18 = v9;
LABEL_37:

  return v18;
}

void OUTLINED_FUNCTION_2_5(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_5_1( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id OUTLINED_FUNCTION_7_0(void *a1, const char *a2)
{
  return [a1 pid];
}

void OUTLINED_FUNCTION_8_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v1 - 176), 8) = a1;
}

  ;
}

id OUTLINED_FUNCTION_10_0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 32) pid];
}

id objc_msgSend_create_or_lookup_path_for_current_user_identifier_create_if_necessary_transient_out_existed_out_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "create_or_lookup_path_for_current_user:identifier:create_if_necessary:transient:out_existed:out_error:");
}

id objc_msgSend_enableForClient_environment_languages_oneShotUUID_persona_sandbox_pid_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableForClient:environment:languages:oneShotUUID:persona:sandbox:pid:error:");
}

id objc_msgSend_initWithLSData_personaCache_discoveryInstanceUUID_extensionPointCache_externalProviders_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLSData:personaCache:discoveryInstanceUUID:extensionPointCache:externalProviders:");
}