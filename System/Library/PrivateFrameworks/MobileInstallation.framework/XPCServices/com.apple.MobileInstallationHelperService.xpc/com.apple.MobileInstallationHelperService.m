LABEL_9:
    v15 = v15;
    v17 = 0;
    *a4 = v15;
    goto LABEL_14;
  }

  self->_isNew = container_is_new(self->_mcmContainer);
  is_transient = container_is_transient(-[MIMCMContainer mcmContainer](self, "mcmContainer"), &v28);
  if (is_transient != 1)
  {
    v19 = is_transient;
    error_description = container_get_error_description();
    v22 = "(container_get_error_description returned NULL)";
    if (error_description) {
      v22 = (const char *)error_description;
    }
    Error = _CreateError( (uint64_t)"-[MIMCMContainer _doInitWithContainer:error:]",  141LL,  MIContainerManagerErrorDomain,  v19,  0LL,  0LL,  @"%s",  v21,  (uint64_t)v22);
    v24 = objc_claimAutoreleasedReturnValue(Error);

    v15 = (id)v24;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }

  self->_isTransient = v28;
  v17 = 1;
LABEL_14:

  return v17;
}

  return v6;
}

LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }

  v55 = 0LL;
  v16 = -[MIMCMContainer _doInitWithContainer:error:](v10, "_doInitWithContainer:error:", single_result, &v55);
  v17 = v55;
LABEL_24:
  container_free_object(v13, v9);
  container_query_free(v14);
  if (a5 && (v16 & 1) == 0) {
    *a5 = v17;
  }

  return v10;
}

              v24 = v43;
              if (v43)
              {
                while (1)
                {
                  v25 = v24 >= 0x10000 ? 0x10000LL : v24;
                  if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))( a5,  2LL,  v18,  v25,  v20) != v25) {
                    goto LABEL_60;
                  }
                  v20 += v25;
                  v24 -= v25;
                  if (!v24) {
                    goto LABEL_30;
                  }
                }

                v40 = gLogHandle;
                goto LABEL_72;
              }

id sub_1000040DC()
{
  uint64_t path = container_error_get_path();
  if (path) {
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "stringWithFileSystemRepresentation:",  path));
  }
  else {
    v1 = @"Failed to read container error path";
  }
  NSErrorUserInfoKey v4 = NSFilePathErrorKey;
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

__CFString *sub_1000042D0()
{
  v0 = (void *)container_copy_unlocalized_description();
  if (v0) {
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v0));
  }
  else {
    v1 = @"<No container description>";
  }
  free(v0);
  return v1;
}

LABEL_15:
  return v17;
}

      ++v10;
      goto LABEL_16;
    }

    v10 = 0LL;
LABEL_23:
    fts_close(v7);
  }

  else
  {
    v16 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v17 = __error();
      strerror(*v17);
      MOLogWrite(v16);
    }

    v10 = 1LL;
  }

  return v10;
}

  v19 = v18 == 0LL;

  return v19;
}

LABEL_17:
  return v11;
}

LABEL_11:
  return v14;
}

    v11 = v11;
    v7 = 0LL;
    *a3 = v11;
    goto LABEL_24;
  }

  v7 = (const void *)Unique;
  v8 = (id)_CFBundleCopyInfoPlistURL();
  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v30 = v7;
      MOLogWrite(gLogHandle);
    }

    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", @"Info.plist", 0, v30));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  v32 = 0LL;
  v10 = [v9 itemIsFileAtURL:v8 error:&v32];
  v11 = v32;

  if ((v10 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    if ([v16 isEqualToString:NSPOSIXErrorDomain])
    {
      v17 = [v11 code];

      if (v17 == (id)2)
      {
        v18 = (void *)MIInstallerErrorDomain;
        v19 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
        v21 = _CreateAndLogError( (uint64_t)"_CreateCFBundle",  310LL,  v18,  35LL,  v11,  0LL,  @"Info.plist missing at %@",  v20,  (uint64_t)v19);
        goto LABEL_22;
      }
    }

    else
    {
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    if ([v22 isEqualToString:NSPOSIXErrorDomain])
    {
      v23 = [v11 code];

      if (v23 == (id)22)
      {
        v24 = (void *)MIInstallerErrorDomain;
        v19 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
        v31 = (uint64_t)v19;
        v26 = @"Expected Info.plist file at %@ but found something that was not a file.";
        v27 = 312LL;
LABEL_21:
        v21 = _CreateAndLogError((uint64_t)"_CreateCFBundle", v27, v24, 3LL, v11, 0LL, v26, v25, v31);
LABEL_22:
        v28 = objc_claimAutoreleasedReturnValue(v21);

        CFRelease(v7);
        v11 = (id)v28;
        if (!a3) {
          goto LABEL_23;
        }
        goto LABEL_11;
      }
    }

    else
    {
    }

    v24 = (void *)MIInstallerErrorDomain;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    v31 = (uint64_t)v19;
    v26 = @"Error when introspecting %@";
    v27 = 314LL;
    goto LABEL_21;
  }

  if (a2)
  {
    v8 = v8;
    *a2 = v8;
  }

LABEL_36:
  container_query_free(v19);
  v53 = (id)v70[5];
  _Block_object_dispose(&v69, 8);

  return v53;
}

  v41 = 0;
LABEL_37:

  if ((v41 & 1) != 0) {
    MIRestoreIdentity();
  }
  v4[2](v4, v6);
LABEL_40:
}

void sub_1000052F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38)
{
}

uint64_t sub_100005350(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005360(uint64_t a1)
{
}

uint64_t sub_100005368(void *a1, uint64_t a2)
{
  NSErrorUserInfoKey v4 = objc_autoreleasePoolPush();
  id v5 = objc_alloc((Class)objc_opt_class(a1[6]));
  id v14 = 0LL;
  id v6 = [v5 initWithContainer:a2 error:&v14];
  id v7 = v14;
  id v8 = v14;
  if (v6)
  {
    uint64_t v9 = (*(uint64_t (**)(void))(a1[4] + 16LL))();
  }

  else
  {
    uint64_t v10 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v11 = sub_1000042D0();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
      MOLogWrite(v10);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), v7);
    uint64_t v9 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

void sub_100005690( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000056A8(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t hardlink_copy_hierarchy( char *a1, const char *a2, const char *a3, const char *a4, const char *a5, const void *a6, uint64_t a7, const __CFArray *a8, void *a9, CFErrorRef *a10)
{
  v238[0] = a1;
  v238[1] = 0LL;
  v17 = fts_open_b(v238, 85, &stru_10001C8E0);
  if (!v17)
  {
    v32 = __error();
    strerror(*v32);
    CFErrorRef v37 = sub_1000077B4( "hardlink_copy_hierarchy",  746,  v33,  v34,  0LL,  v35,  @"fts_open of %s failed: %s",  v36,  (char)a1);
    goto LABEL_24;
  }

  v18 = v17;
  if (!a3)
  {
    bzero(__str, 0x400uLL);
    if ((unint64_t)__strlcpy_chk(__str, a2, 1024LL, 1024LL) < 0x400)
    {
      LOWORD(v235.st_dev) = 0;
      cf[0] = 0LL;
      if ((sub_100007B98(__str, v241, (mode_t *)&v235, (CFErrorRef *)cf) & 1) == 0)
      {
        CFErrorRef v37 = sub_1000077B4( "hardlink_copy_hierarchy",  786,  v46,  v47,  cf[0],  v48,  @"Failed to realpath parent of %s",  v49,  (char)__str);
        CFErrorRef v55 = (CFErrorRef)cf[0];
        if (cf[0]) {
LABEL_22:
        }
          CFRelease(v55);
LABEL_23:
        fts_close(v18);
        goto LABEL_24;
      }

      if (!LOWORD(v235.st_dev) || (v235.st_dev & 0xF000) == 0x4000)
      {
        v234 = 0LL;
        BOOL v75 = 0LL;
        goto LABEL_41;
      }

      CFErrorRef v45 = sub_1000077B4( "hardlink_copy_hierarchy",  792,  v46,  v47,  0LL,  v48,  @"Entity exists at %s but it's not a directory",  v49,  (char)v241);
LABEL_14:
      CFErrorRef v37 = v45;
      goto LABEL_23;
    }

    v42 = @"Destination path was too long";
    int v43 = 779;
LABEL_13:
    CFErrorRef v45 = sub_1000077B4("hardlink_copy_hierarchy", v43, v38, v39, 0LL, v40, v42, v41, (char)fts_path);
    goto LABEL_14;
  }

  if (!realpath_DARWIN_EXTSN(a2, v241))
  {
    v44 = __error();
    strerror(*v44);
    LOBYTE(fts_path) = (_BYTE)a2;
    v42 = @"realpath of '%s' failed at element '%s': %s";
    int v43 = 752;
    goto LABEL_13;
  }

  memset(&v235, 0, sizeof(v235));
  int v19 = open(a3, 256);
  if (v19 < 0)
  {
    v50 = __error();
    strerror(*v50);
    CFErrorRef v27 = sub_1000077B4("open_delta_manifest", 416, v51, v52, 0LL, v53, @"Could not open %s: %s", v54, (char)a3);
    goto LABEL_20;
  }

  int v20 = v19;
  if (fstat(v19, &v235))
  {
    v21 = __error();
    strerror(*v21);
    CFErrorRef v26 = sub_1000077B4("open_delta_manifest", 421, v22, v23, 0LL, v24, @"Could not stat %s: %s", v25, (char)a3);
LABEL_7:
    CFErrorRef v27 = v26;
    goto LABEL_8;
  }

  v57 = mmap(0LL, v235.st_size, 1, 1026, v20, 0LL);
  if (v57 == (void *)-1LL)
  {
    v143 = __error();
    strerror(*v143);
    CFErrorRef v26 = sub_1000077B4( "open_delta_manifest",  435,  v144,  v145,  0LL,  v146,  @"Failed to map file at %s; error %s",
            v147,
            (char)a3);
    goto LABEL_7;
  }

  v58 = v57;
  if (madvise(v57, v235.st_size, 2))
  {
    uint64_t v59 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v60 = __error();
      LOBYTE(fts_path) = strerror(*v60);
      MOLogWrite(v59);
    }
  }

  v61 = calloc(1uLL, 0x18uLL);
  if (!v61)
  {
    CFErrorRef v27 = sub_1000077B4( "open_delta_manifest",  446,  v62,  v63,  0LL,  v64,  @"Failed to allocate command stream object",  v65,  (char)fts_path);
    munmap(v58, v235.st_size);
    goto LABEL_8;
  }

  void *v61 = v58;
  v61[1] = v235.st_size;
  v61[2] = 0LL;
  __int128 v310 = 0u;
  __int128 v309 = 0u;
  __int128 v308 = 0u;
  __int128 v307 = 0u;
  __int128 v306 = 0u;
  __int128 v305 = 0u;
  __int128 v304 = 0u;
  __int128 v303 = 0u;
  __int128 v302 = 0u;
  __int128 v301 = 0u;
  __int128 v300 = 0u;
  __int128 v299 = 0u;
  __int128 v298 = 0u;
  __int128 v297 = 0u;
  __int128 v296 = 0u;
  __int128 v295 = 0u;
  __int128 v294 = 0u;
  __int128 v293 = 0u;
  __int128 v292 = 0u;
  __int128 v291 = 0u;
  __int128 v290 = 0u;
  __int128 v289 = 0u;
  __int128 v288 = 0u;
  __int128 v287 = 0u;
  __int128 v286 = 0u;
  __int128 v285 = 0u;
  __int128 v284 = 0u;
  __int128 v283 = 0u;
  __int128 v282 = 0u;
  __int128 v281 = 0u;
  __int128 v280 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v278 = 0u;
  __int128 v277 = 0u;
  __int128 v276 = 0u;
  __int128 v275 = 0u;
  __int128 v274 = 0u;
  __int128 v273 = 0u;
  __int128 v272 = 0u;
  __int128 v271 = 0u;
  __int128 v270 = 0u;
  __int128 v269 = 0u;
  __int128 v268 = 0u;
  __int128 v267 = 0u;
  __int128 v266 = 0u;
  __int128 v265 = 0u;
  __int128 v264 = 0u;
  __int128 v263 = 0u;
  __int128 v262 = 0u;
  __int128 v261 = 0u;
  __int128 v260 = 0u;
  __int128 v259 = 0u;
  __int128 v258 = 0u;
  __int128 v257 = 0u;
  __int128 v256 = 0u;
  __int128 v255 = 0u;
  __int128 v254 = 0u;
  __int128 v253 = 0u;
  __int128 v252 = 0u;
  __int128 v251 = 0u;
  __int128 v250 = 0u;
  __int128 v249 = 0u;
  __int128 v248 = 0u;
  *(_OWORD *)cf = 0u;
  __int16 v237 = 0;
  int v236 = 0;
  __int16 v246 = 0;
  *(void *)v245 = 0LL;
  v234 = v61;
  if ((sub_100007EB4(v61, 0, (uint64_t)&v236, 6uLL) & 1) == 0)
  {
    v148 = @"Failed to read magic";
    int v149 = 299;
    goto LABEL_146;
  }

  if (v236 ^ 0x44617069 | v237)
  {
    CFErrorRef v70 = sub_1000077B4( "validate_stream",  305,  v66,  v67,  0LL,  v68,  @"Stream had invalid magic: %s",  v69,  (char)&v236);
LABEL_147:
    CFErrorRef v150 = v70;
    goto LABEL_148;
  }

  if ((sub_100007EB4(v234, 0, (uint64_t)v245, 0xAuLL) & 1) == 0)
  {
    v148 = @"Failed to read version from manifest header";
    int v149 = 310;
    goto LABEL_146;
  }

  uint64_t v155 = strtol(v245, 0LL, 10);
  uint64_t v160 = v155;
  if ((unint64_t)(v155 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    CFErrorRef v70 = sub_1000077B4( "validate_stream",  318,  v156,  v157,  0LL,  v158,  @"Manifest had invalid version: %ld; expected 1, 2, or 3",
            v159,
            v155);
    goto LABEL_147;
  }

  if ((sub_100007EB4(v234, 0, (uint64_t)__str, 0x200uLL) & 1) == 0)
  {
    v148 = @"Failed to read manifest source version";
    int v149 = 323;
    goto LABEL_146;
  }

  uint64_t cStr = v160;
  if (a4) {
    v163 = a5;
  }
  else {
    v163 = (const char *)&unk_100016019;
  }
  if (a4) {
    v164 = a4;
  }
  else {
    v164 = "0";
  }
  if (a4) {
    v165 = " ";
  }
  else {
    v165 = (const char *)&unk_100016019;
  }
  if (v163) {
    v166 = v163;
  }
  else {
    v166 = (const char *)&unk_100016019;
  }
  if (snprintf((char *)cf, 0x200uLL, "%s%s%s", v164, v165, v166) > 0x1FF)
  {
    CFErrorRef v70 = sub_1000077B4( "validate_stream",  350,  v167,  v168,  0LL,  v169,  @"Incoming expected source version string %s%s%s was too long",  v170,  (char)v164);
    goto LABEL_147;
  }

  v191 = cf;
  v151 = v234;
  while (*(_BYTE *)v191 == 10)
  {
    *(_BYTE *)v191 = 32;
LABEL_219:
    v191 = (CFTypeRef *)((char *)v191 + 1);
  }

  if (*(_BYTE *)v191) {
    goto LABEL_219;
  }
  if (strcmp((const char *)cf, __str))
  {
    CFErrorRef v150 = sub_1000077B4( "validate_stream",  357,  v193,  v194,  0LL,  v195,  @"Got manifest for version %s, but expected version %s",  v196,  (char)__str);
LABEL_149:
    CFErrorRef v27 = sub_1000077B4( "open_delta_manifest",  456,  v71,  v72,  v150,  v73,  @"Invalid manifest file at %s",  v74,  (char)a3);
    if (v150) {
      CFRelease(v150);
    }
    munmap(v58, v235.st_size);
    free(v151);
LABEL_8:
    close(v20);
LABEL_20:
    CFErrorRef v37 = sub_1000077B4( "hardlink_copy_hierarchy",  758,  v28,  v29,  v27,  v30,  @"Failed to open manifest %s",  v31,  (char)a3);
    if (v27)
    {
      CFErrorRef v55 = v27;
      goto LABEL_22;
    }

    goto LABEL_23;
  }

  if (cStr < 2) {
    goto LABEL_242;
  }
  char v244 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!sub_100007EB4(v234, 0, (uint64_t)__s2, 0x41uLL))
  {
    v148 = @"Failed to read stream";
    int v149 = 375;
LABEL_146:
    CFErrorRef v70 = sub_1000077B4("validate_stream", v149, v66, v67, 0LL, v68, v148, v69, (char)fts_path);
    goto LABEL_147;
  }

  if (!a6)
  {
    v148 = @"expected_infoplisthash is NULL";
    int v149 = 371;
    goto LABEL_146;
  }

  if (memcmp(a6, __s2, 0x41uLL))
  {
    v148 = @"Compare of info plist hash failed";
    int v149 = 367;
    goto LABEL_146;
  }

  v151 = v234;
  if ((unint64_t)cStr >= 3)
  {
    *(void *)&__s2[0] = 0LL;
    if ((sub_100007F28(v234, a8, (CFErrorRef *)__s2) & 1) != 0)
    {
      v151 = v234;
      goto LABEL_242;
    }

    CFErrorRef v150 = sub_1000077B4( "validate_stream",  384,  v219,  v220,  *(const void **)&__s2[0],  v221,  @"Failed to validate supported devices",  v222,  (char)fts_path);
    if (*(void *)&__s2[0]) {
      CFRelease(*(CFTypeRef *)&__s2[0]);
    }
LABEL_148:
    v151 = v234;
    goto LABEL_149;
  }

LABEL_242:
  close(v20);
  *(void *)__str = 0LL;
  if ((sub_10000793C(v151, &v239, (CFErrorRef *)__str, v223, v224, v225, v226, v227) & 1) == 0)
  {
    CFErrorRef v37 = sub_1000077B4( "hardlink_copy_hierarchy",  765,  v228,  v229,  *(const void **)__str,  v230,  @"Failed to read first manifest command",  v231,  (char)fts_path);
    if (*(void *)__str) {
      CFRelease(*(CFTypeRef *)__str);
    }
    goto LABEL_168;
  }

  BOOL v75 = v239 != 120;
LABEL_41:
  size_t v76 = strlen(a1);
  v77 = fts_read(v18);
  if (!v77)
  {
    uint64_t v85 = 0LL;
LABEL_153:
    if (!a3 || v239 == 120)
    {
      v132 = (void **)v234;
      CFErrorRef v37 = 0LL;
      if (a9) {
        *a9 = v85 << 9;
      }
      char v154 = 1;
      goto LABEL_225;
    }

    v152 = @"Got done processing bundle but there were still commands remaining in manifest.";
    int v153 = 1110;
LABEL_166:
    CFErrorRef v142 = sub_1000077B4("hardlink_copy_hierarchy", v153, v78, v79, 0LL, v81, v152, v83, (char)fts_path);
    goto LABEL_167;
  }

  v84 = v77;
  uint64_t v85 = 0LL;
  while (2)
  {
    __new[0] = 0;
    unsigned int fts_info = v84->fts_info;
    if (fts_info > 0xD || ((1 << fts_info) & 0x314A) == 0)
    {
      v91 = 0LL;
      int v92 = 0;
    }

    else
    {
      v88 = &v84->fts_path[v76];
      int v90 = *v88;
      v89 = v88 + 1;
      if (v90 == 47) {
        v91 = v89;
      }
      else {
        v91 = &v84->fts_path[v76];
      }
      if (fts_info != 6 && v75 && !sub_1000076A8(v240, v91))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          LOBYTE(fts_path) = v239;
          MOLogWrite(gLogHandle);
        }

        int v92 = 1;
      }

      else
      {
        int v92 = 0;
      }

      unsigned int fts_info = v84->fts_info;
    }

    switch(fts_info)
    {
      case 1u:
        if (v92 && (v239 == 45 || v239 == 43))
        {
          if (!fts_set(v18, v84, 4))
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v91;
              MOLogWrite(gLogHandle);
            }

LABEL_125:
            *(void *)__str = 0LL;
            v132 = (void **)v234;
            if ((sub_10000793C(v234, &v239, (CFErrorRef *)__str, v79, v80, v81, v82, v83) & 1) != 0)
            {
              if (v239 == 120)
              {
                BOOL v75 = 0LL;
              }

              goto LABEL_131;
            }

            CFErrorRef v37 = sub_1000077B4( "hardlink_copy_hierarchy",  1094,  v133,  v134,  *(const void **)__str,  v135,  @"Failed to read next manifest command",  v136,  (char)fts_path);
            CFTypeRef v161 = *(CFTypeRef *)__str;
            if (!*(void *)__str) {
              goto LABEL_224;
            }
LABEL_211:
            CFRelease(v161);
            goto LABEL_224;
          }

          v203 = __error();
          strerror(*v203);
          CFErrorRef v142 = sub_1000077B4( "hardlink_copy_hierarchy",  1012,  v204,  v205,  0LL,  v206,  @"Failed to skip directory %s: %s",  v207,  (char)v91);
          goto LABEL_167;
        }

        LOWORD(cf[0]) = 0;
        *(void *)__str = 0LL;
        if ((sub_100007D44(v241, v91, __new, (mode_t *)cf, (CFErrorRef *)__str) & 1) == 0)
        {
          CFErrorRef v190 = sub_1000077B4( "hardlink_copy_hierarchy",  1023,  v121,  v79,  *(const void **)__str,  v81,  @"Failed to make dest path for directory %s",  v83,  (char)v91);
LABEL_209:
          CFErrorRef v37 = v190;
          CFTypeRef v161 = *(CFTypeRef *)__str;
LABEL_210:
          v132 = (void **)v234;
          if (!v161) {
            goto LABEL_224;
          }
          goto LABEL_211;
        }

        if (LOWORD(cf[0]) && ((uint64_t)cf[0] & 0xF000) != 0x4000)
        {
          CFErrorRef v218 = sub_1000077B4( "hardlink_copy_hierarchy",  1030,  v121,  v79,  0LL,  v81,  @"Non-directory entity with mode 0%o exists at directory location in dest path %s",  v83,  (char)cf[0]);
          goto LABEL_223;
        }

        if (LOWORD(cf[0]))
        {
          if (LOWORD(cf[0]) != (v84->fts_statp->st_mode | 0x80) && chmod(__new, v84->fts_statp->st_mode | 0x80))
          {
            v213 = __error();
            strerror(*v213);
            CFErrorRef v218 = sub_1000077B4( "hardlink_copy_hierarchy",  1043,  v214,  v215,  0LL,  v216,  @"Failed to make destination directory %s writable: %s",  v217,  (char)__new);
            goto LABEL_223;
          }
        }

        else
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            fts_uint64_t path = __new;
            MOLogWrite(gLogHandle);
          }

          if (mkdir(__new, v84->fts_statp->st_mode | 0x80))
          {
            v208 = __error();
            strerror(*v208);
            CFErrorRef v218 = sub_1000077B4( "hardlink_copy_hierarchy",  1038,  v209,  v210,  0LL,  v211,  @"mkdir of '%s' failed: %s",  v212,  (char)__new);
            goto LABEL_223;
          }
        }

        goto LABEL_124;
      case 3u:
      case 8u:
        if (v239 == 94) {
          int v93 = v92;
        }
        else {
          int v93 = 0;
        }
        if (v93 != 1)
        {
          if (v92 && (v239 == 45 || v239 == 43))
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v91;
              MOLogWrite(gLogHandle);
            }
          }

          else
          {
            LOWORD(cf[0]) = 0;
            *(void *)__str = 0LL;
            if ((sub_100007D44(v241, v91, __new, (mode_t *)cf, (CFErrorRef *)__str) & 1) == 0)
            {
              CFErrorRef v190 = sub_1000077B4( "hardlink_copy_hierarchy",  975,  v122,  v123,  *(const void **)__str,  v124,  @"Failed to make dest path for file %s",  v125,  (char)v91);
              goto LABEL_209;
            }

            if (LOWORD(cf[0]))
            {
              CFErrorRef v218 = sub_1000077B4( "hardlink_copy_hierarchy",  982,  v122,  v123,  0LL,  v124,  @"Entity with mode 0%o exists at file location in dest path %s",  v125,  (char)cf[0]);
              goto LABEL_223;
            }

            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              fts_uint64_t path = v84->fts_path;
              MOLogWrite(gLogHandle);
            }

            if (link(v84->fts_path, __new))
            {
              uint64_t v126 = gLogHandle;
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              {
                BOOL v127 = v75;
                v128 = v84->fts_path;
                v129 = __error();
                strerror(*v129);
                LOBYTE(fts_path) = (_BYTE)v128;
                BOOL v75 = v127;
                MOLogWrite(v126);
              }

              if (copyfile(v84->fts_path, __new, 0LL, 0xC000Fu))
              {
                v197 = v84->fts_path;
                v198 = __error();
                strerror(*v198);
                CFErrorRef v218 = sub_1000077B4( "hardlink_copy_hierarchy",  991,  v199,  v200,  0LL,  v201,  @"copyfile of %s to %s failed: %s",  v202,  (char)v197);
                goto LABEL_223;
              }
            }
          }

          goto LABEL_123;
        }

        int v94 = v92;
        LOWORD(v235.st_dev) = 0;
        bzero(__str, 0x400uLL);
        cf[0] = 0LL;
        if ((sub_100007D44(v241, v91, __new, (mode_t *)&v235, (CFErrorRef *)cf) & 1) == 0)
        {
          CFErrorRef v37 = sub_1000077B4( "hardlink_copy_hierarchy",  882,  v95,  v96,  cf[0],  v97,  @"Failed to make dest path for file %s",  v98,  (char)v91);
          v132 = (void **)v234;
          if (cf[0]) {
            CFRelease(cf[0]);
          }
          int v162 = -1;
          goto LABEL_205;
        }

        BOOL v99 = v75;
        mode_t st_dev = v235.st_dev;
        if (LOWORD(v235.st_dev))
        {
          if (snprintf(__str, 0x400uLL, "%s.XXXXXX", __new) >= 0x400)
          {
            CFErrorRef v173 = sub_1000077B4( "hardlink_copy_hierarchy",  894,  v101,  v102,  0LL,  v103,  @"failed to make newfile path: %s.XXXXXXX",  v104,  (char)__new);
          }

          else
          {
            int v105 = mkstemp(__str);
            if (v105 != -1)
            {
              int v106 = v105;
              v107 = v84->fts_path;
              if (patch_file(v107, __new, v105))
              {
                int v162 = v106;
                CFErrorRef v179 = sub_1000077B4( "hardlink_copy_hierarchy",  934,  v108,  v109,  0LL,  v110,  @"patch_file failed for:\n\t%s\n\t%s\n\t%s",  v111,  (char)v107);
              }

              else
              {
                if (!fchmod(v106, st_dev))
                {
                  close(v106);
                  if (!rename(__str, __new))
                  {
                    BOOL v75 = v99;
                    int v92 = v94;
LABEL_123:
                    v85 += v84->fts_statp->st_blocks;
                    goto LABEL_124;
                  }

                  v185 = __error();
                  strerror(*v185);
                  CFErrorRef v173 = sub_1000077B4( "hardlink_copy_hierarchy",  948,  v186,  v187,  0LL,  v188,  @"rename of %s to %s failed: %s",  v189,  (char)__str);
                  goto LABEL_203;
                }

                int v162 = v106;
                v180 = __error();
                strerror(*v180);
                CFErrorRef v179 = sub_1000077B4( "hardlink_copy_hierarchy",  939,  v181,  v182,  0LL,  v183,  @"chmod failed for %s : %s",  v184,  (char)__str);
              }

              CFErrorRef v37 = v179;
LABEL_204:
              v132 = (void **)v234;
LABEL_205:
              char v154 = 0;
              goto LABEL_226;
            }

            v174 = __error();
            strerror(*v174);
            CFErrorRef v173 = sub_1000077B4( "hardlink_copy_hierarchy",  899,  v175,  v176,  0LL,  v177,  @"mktemp failed for %s : %s",  v178,  (char)__str);
          }
        }

        else
        {
          CFErrorRef v173 = sub_1000077B4( "hardlink_copy_hierarchy",  889,  v95,  v96,  0LL,  v97,  @"Entity does not exist at file location in dest path %s",  v98,  (char)__new);
        }

LABEL_203:
        CFErrorRef v37 = v173;
        int v162 = -1;
        goto LABEL_204;
      case 4u:
      case 7u:
      case 0xAu:
        fts_uint64_t path = "hardlink_copy_hierarchy";
        v152 = @"FTS in %s returned an error %d for path '%s'";
        int v153 = 1078;
        goto LABEL_166;
      case 6u:
        *(_WORD *)__str = 0;
        if ((*(_WORD *)__str & 0xF000) == 0x4000
          && (int st_mode = v84->fts_statp->st_mode, st_mode != *(unsigned __int16 *)__str))
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            fts_uint64_t path = __new;
            MOLogWrite(gLogHandle);
            LOWORD(st_mode) = v84->fts_statp->st_mode;
          }

          if (chmod(__new, st_mode))
          {
            v137 = __error();
            strerror(*v137);
            CFErrorRef v142 = sub_1000077B4( "hardlink_copy_hierarchy",  1060,  v138,  v139,  0LL,  v140,  @"chmod of '%s' failed: %s",  v141,  (char)__new);
LABEL_167:
            CFErrorRef v37 = v142;
LABEL_168:
            char v154 = 0;
            int v162 = -1;
            v132 = (void **)v234;
            goto LABEL_226;
          }
        }

        else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          LOBYTE(fts_path) = __str[0];
          MOLogWrite(gLogHandle);
        }

LABEL_124:
        if (v92) {
          goto LABEL_125;
        }
LABEL_131:
        v84 = fts_read(v18);
        if (!v84) {
          goto LABEL_153;
        }
        continue;
      case 0xCu:
      case 0xDu:
        if (v92 && (v239 == 43 || v239 == 45)) {
          goto LABEL_123;
        }
        LOWORD(v235.st_dev) = 0;
        cf[0] = 0LL;
        if ((sub_100007D44(v241, v91, __new, (mode_t *)&v235, (CFErrorRef *)cf) & 1) == 0)
        {
          CFErrorRef v37 = sub_1000077B4( "hardlink_copy_hierarchy",  848,  v112,  v113,  cf[0],  v114,  @"Failed to make dest path for symlink %s",  v115,  (char)v91);
          CFTypeRef v161 = cf[0];
          goto LABEL_210;
        }

        if (LOWORD(v235.st_dev))
        {
          CFErrorRef v218 = sub_1000077B4( "hardlink_copy_hierarchy",  855,  v112,  v113,  0LL,  v114,  @"Entity with mode 0%o exists at symlink location in dest path %s",  v115,  v235.st_dev);
          goto LABEL_223;
        }

        BOOL v116 = v75;
        uint64_t v117 = gLogHandle;
        if (gLogHandle)
        {
          p_fts_uint64_t path = (const char **)&v84->fts_path;
          v118 = v84->fts_path;
          if (*(int *)(gLogHandle + 44) <= 6
            || (fts_uint64_t path = v84->fts_path, MOLogWrite(gLogHandle), v117 = gLogHandle, v118 = *p_fts_path, gLogHandle))
          {
            if (*(int *)(v117 + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v118;
              MOLogWrite(v117);
            }
          }
        }

        else
        {
          p_fts_uint64_t path = (const char **)&v84->fts_path;
          v118 = v84->fts_path;
        }

        ssize_t v130 = readlink(v118, __str, 0x400uLL);
        if ((v130 & 0x8000000000000000LL) == 0)
        {
          __str[v130] = 0;
          if (symlink(__str, __new))
          {
            uint64_t v171 = gLogHandle;
            goto LABEL_192;
          }

          BOOL v75 = v116;
          goto LABEL_123;
        }

        uint64_t v171 = gLogHandle;
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
LABEL_191:
          v172 = __error();
          strerror(*v172);
          MOLogWrite(v171);
        }

LABEL_192:
        CFErrorRef v218 = sub_1000077B4( "hardlink_copy_hierarchy",  862,  v131,  v79,  0LL,  v81,  @"Failed to copy symlink %s to %s",  v83,  (char)*p_fts_path);
LABEL_223:
        CFErrorRef v37 = v218;
        v132 = (void **)v234;
LABEL_224:
        char v154 = 0;
LABEL_225:
        int v162 = -1;
LABEL_226:
        if (v132)
        {
          munmap(*v132, (size_t)v132[1]);
          free(v132);
        }

        fts_close(v18);
        if ((v162 & 0x80000000) == 0) {
          close(v162);
        }
        if ((v154 & 1) != 0) {
          return 1LL;
        }
LABEL_24:
        if (a10)
        {
          uint64_t result = 0LL;
          *a10 = v37;
        }

        else
        {
          if (v37) {
            CFRelease(v37);
          }
          return 0LL;
        }

        return result;
      default:
        goto LABEL_124;
    }
  }
}

int sub_100007694(id a1, const _ftsent **a2, const _ftsent **a3)
{
  return sub_1000076A8((*a2)->fts_name, (*a3)->fts_name);
}

uint64_t sub_1000076A8(char *cStr, const char *a2)
{
  v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  NSErrorUserInfoKey v4 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  bzero(buffer, 0x400uLL);
  bzero(__s2, 0x400uLL);
  if (!CFStringGetFileSystemRepresentation(v3, buffer, 1024LL)
    || !CFStringGetFileSystemRepresentation(v4, __s2, 1024LL))
  {
    uint64_t v5 = 0xFFFFFFFFLL;
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  uint64_t v5 = strcmp(buffer, __s2);
  if (v3) {
LABEL_6:
  }
    CFRelease(v3);
LABEL_7:
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

CFErrorRef sub_1000077B4( const char *a1, int a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, const __CFString *a7, uint64_t a8, char a9)
{
  int valuePtr = a2;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v13 = CFStringCreateWithCString(0LL, a1, 0x8000100u);
  CFDictionaryAddValue(Mutable, @"FunctionName", v13);
  if (v13) {
    CFRelease(v13);
  }
  CFNumberRef v14 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"SourceFileLine", v14);
  if (v14) {
    CFRelease(v14);
  }
  if (a5) {
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, a5);
  }
  CFStringRef v15 = CFStringCreateWithFormatAndArguments(0LL, 0LL, a7, &a9);
  CFDictionaryAddValue(Mutable, kCFErrorLocalizedDescriptionKey, v15);
  if (v15) {
    CFRelease(v15);
  }
  CFErrorRef v16 = CFErrorCreate(0LL, @"MIInstallerDeltaErrorDomain", 1LL, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v16;
}

uint64_t sub_10000793C( void *a1, unsigned __int8 *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[1];
  uint64_t v8 = a1[2];
  if (v8 >= v9) {
    sub_100012224();
  }
  if (v8 + 1 >= v9)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      LOBYTE(v31) = 1;
      MOLogWrite(gLogHandle);
    }

    CFErrorRef v26 = @"Failed to read command from manifest";
    int v27 = 508;
  }

  else
  {
    int v13 = *(unsigned __int8 *)(*a1 + v8);
    *a2 = v13;
    ++a1[2];
    BOOL v14 = (v13 - 43) > 0x33 || ((1LL << (v13 - 43)) & 0x8000000040005LL) == 0;
    if (v14 && v13 != 120)
    {
      CFErrorRef v28 = sub_1000077B4( "read_next_manifest_command",  514,  (uint64_t)a3,  a4,  0LL,  a6,  @"Stream had invalid command: %hhu",  a8,  v13);
      goto LABEL_26;
    }

    char v15 = sub_100007EB4(a1, 1, (uint64_t)(a2 + 1), 0x400uLL);
    int v20 = *a2;
    if ((v15 & 1) == 0)
    {
      CFErrorRef v28 = sub_1000077B4( "read_next_manifest_command",  520,  v16,  v17,  0LL,  v18,  @"Failed to read arg1 of command %hhu",  v19,  *a2);
      goto LABEL_26;
    }

    if (v20 != 61) {
      goto LABEL_12;
    }
    *(void *)__str = 0LL;
    uint64_t v33 = 0LL;
    char v35 = 0;
    uint64_t v34 = 0LL;
    if ((sub_100007EB4(a1, 1, (uint64_t)__str, 0x19uLL) & 1) == 0)
    {
      CFErrorRef v28 = sub_1000077B4( "read_next_manifest_command",  528,  v21,  v22,  0LL,  v23,  @"Failed to read arg2 of command %hhu",  v24,  *a2);
      goto LABEL_26;
    }

    uint64_t v25 = strtoll(__str, 0LL, 10);
    *((void *)a2 + 129) = v25;
    if (v25)
    {
      int v20 = *a2;
LABEL_12:
      CFErrorRef v26 = @"Got malformed EOF marker";
      int v27 = 542;
      goto LABEL_25;
    }

    uint64_t v31 = __str;
    CFErrorRef v26 = @"Invalid touch time %s found for path %s";
    int v27 = 535;
  }

LABEL_25:
  CFErrorRef v28 = sub_1000077B4("read_next_manifest_command", v27, (uint64_t)a3, a4, 0LL, a6, v26, a8, (char)v31);
LABEL_26:
  if (a3)
  {
    uint64_t v29 = 0LL;
    *a3 = v28;
  }

  else
  {
    if (v28) {
      CFRelease(v28);
    }
    return 0LL;
  }

  return v29;
}

uint64_t sub_100007B98(const char *a1, char *a2, mode_t *a3, CFErrorRef *a4)
{
  size_t v8 = strlen(a1);
  size_t v13 = v8 - 1;
  if (a1[v8 - 1] == 47)
  {
    a1[v13] = 0;
    size_t v13 = v8 - 2;
  }

  if ((v13 & 0x8000000000000000LL) != 0)
  {
LABEL_6:
    char v30 = (char)a1;
    BOOL v14 = @"Failed to find parent of '%s'";
    int v15 = 588;
LABEL_7:
    CFErrorRef v16 = sub_1000077B4("realpath_parent_no_symlink", v15, v9, v10, 0LL, v11, v14, v12, v30);
    goto LABEL_8;
  }

  while (a1[v13] != 47)
  {
    if (&a1[--v13] < a1) {
      goto LABEL_6;
    }
  }

  if (v13)
  {
    uint64_t v18 = (char *)&a1[v13];
    a1[v13] = 0;
    if (!realpath_DARWIN_EXTSN(a1, a2))
    {
      uint64_t v24 = __error();
      strerror(*v24);
      CFErrorRef v16 = sub_1000077B4( "realpath_parent_no_symlink",  599,  v25,  v26,  0LL,  v27,  @"realpath of '%s' failed at element '%s': %s",  v28,  (char)a1);
      char *v18 = 47;
      if (a4) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }

    char *v18 = 47;
    if (strlcat(a2, v18, 0x400uLL) >= 0x400)
    {
      BOOL v14 = @"Path was too long";
      int v15 = 608;
      goto LABEL_7;
    }
  }

  else
  {
    strlcpy(a2, a1, 0x400uLL);
  }

  if (lstat(a2, &v31))
  {
    mode_t st_mode = 0;
LABEL_23:
    *a3 = st_mode;
    return 1LL;
  }

  mode_t st_mode = v31.st_mode;
  if ((v31.st_mode & 0xF000) != 0xA000) {
    goto LABEL_23;
  }
  CFErrorRef v16 = sub_1000077B4( "realpath_parent_no_symlink",  618,  v19,  v20,  0LL,  v21,  @"Found symlink at destination path %s; this is not allowed.",
          v22,
          (char)a2);
LABEL_8:
  if (a4)
  {
LABEL_9:
    uint64_t v17 = 0LL;
    *a4 = v16;
    return v17;
  }

LABEL_18:
  if (v16) {
    CFRelease(v16);
  }
  return 0LL;
}

uint64_t sub_100007D44(const char *a1, const char *a2, char *a3, mode_t *a4, CFErrorRef *a5)
{
  if (snprintf(__str, 0x400uLL, "%s/%s", a1, a2) < 0x400)
  {
    CFTypeRef cf = 0LL;
    if ((sub_100007B98(__str, a3, a4, (CFErrorRef *)&cf) & 1) == 0)
    {
      CFErrorRef v23 = sub_1000077B4( "make_and_check_dest_path",  701,  v15,  v16,  cf,  v17,  @"Failed to realpath parent of %s",  v18,  (char)__str);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      goto LABEL_7;
    }

    CFErrorRef v14 = sub_1000077B4( "make_and_check_dest_path",  709,  v19,  v20,  0LL,  v21,  @"realpath'd destpath '%s' is different from non-realpath '%s'",  v22,  (char)a3);
  }

  else
  {
    CFErrorRef v14 = sub_1000077B4( "make_and_check_dest_path",  695,  v10,  v11,  0LL,  v12,  @"Dest path '%s/%s' was too long",  v13,  (char)a1);
  }

  CFErrorRef v23 = v14;
LABEL_7:
  if (a5)
  {
    uint64_t result = 0LL;
    *a5 = v23;
  }

  else
  {
    if (v23) {
      CFRelease(v23);
    }
    return 0LL;
  }

  return result;
}

uint64_t sub_100007EB4(void *a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1[2];
  if (v4 >= a1[1]) {
    sub_10001224C();
  }
  if (!a4) {
    return 0LL;
  }
  unint64_t v5 = 0LL;
  while (1)
  {
    int v6 = *(unsigned __int8 *)(*a1 + v4);
    a1[2] = v4 + 1;
    int v7 = v6 == 9 ? a2 : 0;
    if (v6 == 10 || v7 != 0) {
      break;
    }
    *(_BYTE *)(a3 + v5++) = v6;
    uint64_t v4 = a1[2];
    if (v4 >= a1[1] || v5 >= a4) {
      return 0LL;
    }
  }

  *(_BYTE *)(a3 + v5) = 0;
  return 1LL;
}

uint64_t sub_100007F28(void *a1, const __CFArray *a2, CFErrorRef *a3)
{
  uint64_t v10 = calloc(1uLL, 0x800uLL);
  if (!v10)
  {
    v32 = @"Failed to malloc buffer for line";
    int v33 = 200;
LABEL_23:
    CFErrorRef v34 = sub_1000077B4("validate_supported_devices", v33, v6, v7, 0LL, v8, v32, v9, v42);
    free(v10);
    goto LABEL_24;
  }

  if ((sub_100007EB4(a1, 0, (uint64_t)v10, 0x800uLL) & 1) == 0)
  {
    v32 = @"Failed to read supported devices from stream";
    int v33 = 205;
    goto LABEL_23;
  }

  if (!*v10)
  {
    if (!a2)
    {
      free(v10);
      return 1LL;
    }

    v32 = @"Existing app lists supported devices but there were none in the manifest";
    int v33 = 211;
    goto LABEL_23;
  }

  uint64_t v11 = CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
  if (!v11)
  {
    v32 = @"Failed to create patch supported devices string";
    int v33 = 222;
    goto LABEL_23;
  }

  uint64_t v12 = v11;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v11, @" ");
  uint64_t v18 = ArrayBySeparatingStrings;
  if (!ArrayBySeparatingStrings || !CFArrayGetCount(ArrayBySeparatingStrings))
  {
    CFErrorRef v36 = sub_1000077B4( "validate_supported_devices",  228,  v14,  v15,  0LL,  v16,  @"Failed to split patch supported devices string",  v17,  v42);
LABEL_32:
    CFErrorRef v34 = v36;
    free(v10);
    char v37 = 0;
    Mutable = 0LL;
    uint64_t v20 = 0LL;
    goto LABEL_42;
  }

  if (!a2)
  {
    CFErrorRef v36 = sub_1000077B4( "validate_supported_devices",  234,  v14,  v15,  0LL,  v16,  @"Target app had no supported devices but patch did: %@",  v17,  (char)v18);
    goto LABEL_32;
  }

  int v43 = v12;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  uint64_t v20 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  uint64_t Count = CFArrayGetCount(a2);
  uint64_t v22 = CFArrayGetCount(v18);
  if (Count >= 1)
  {
    for (CFIndex i = 0LL; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
      v44.location = 0LL;
      v44.length = v22;
      if (!CFArrayContainsValue(v18, v44, ValueAtIndex)) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }

  if (v22 >= 1)
  {
    for (CFIndex j = 0LL; j != v22; ++j)
    {
      uint64_t v26 = CFArrayGetValueAtIndex(v18, j);
      v45.location = 0LL;
      v45.length = Count;
      if (!CFArrayContainsValue(a2, v45, v26)) {
        CFArrayAppendValue(v20, v26);
      }
    }
  }

  if (Mutable && CFArrayGetCount(Mutable))
  {
    CFErrorRef v31 = sub_1000077B4( "validate_supported_devices",  242,  v27,  v28,  0LL,  v29,  @"Expected supported devices had devices that were not in patch: %@",  v30,  (char)Mutable);
  }

  else
  {
    if (!v20 || !CFArrayGetCount(v20))
    {
      CFErrorRef v34 = 0LL;
      char v37 = 1;
      goto LABEL_41;
    }

    CFErrorRef v31 = sub_1000077B4( "validate_supported_devices",  247,  v38,  v39,  0LL,  v40,  @"Patch listed devices that were not in expected supported devices: %@",  v41,  (char)v20);
  }

  CFErrorRef v34 = v31;
  char v37 = 0;
LABEL_41:
  uint64_t v12 = v43;
  free(v10);
LABEL_42:
  CFRelease(v12);
  if (v18) {
    CFRelease(v18);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if ((v37 & 1) != 0) {
    return 1LL;
  }
LABEL_24:
  if (a3)
  {
    uint64_t result = 0LL;
    *a3 = v34;
  }

  else
  {
    if (v34) {
      CFRelease(v34);
    }
    return 0LL;
  }

  return result;
}

id MobileInstallationHelperServiceProtocolInterface()
{
  id WeakRetained = objc_loadWeakRetained(&qword_100021648);
  if (!WeakRetained)
  {
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MobileInstallationHelperServiceProtocol));
    objc_storeWeak(&qword_100021648, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100021640);
  return WeakRetained;
}

id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    uint64_t v19 = (NSMutableDictionary *)[v17 mutableCopy];
  }
  else {
    uint64_t v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v20 = v19;
  if (v18)
  {
    uint64_t v21 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v18,  a8);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v21,  NSLocalizedDescriptionKey);
  }

  if (v16) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v16, NSUnderlyingErrorKey);
  }
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v22, MIFunctionNameErrorKey);

  CFErrorRef v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a2));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v23,  MISourceFileLineErrorKey);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  a4,  v20));
  return v24;
}

id _CreateError( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id ErrorV = _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(ErrorV);
}

id _CreateAndLogError( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v9 = _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id _CreateAndLogErrorV( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a5;
  id ErrorV = _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(ErrorV);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

  uint64_t v20 = gLogHandle;
  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
      [v15 code];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
      MOLogWrite(v20);
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite(gLogHandle);
  }

  return v17;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  uint64_t v3 = MIInstallerErrorDomain;
  if ([v2 isEqualToString:MIInstallerErrorDomain] && objc_msgSend(v1, "code") == (id)12)
  {
    BOOL v4 = 1LL;
  }

  else
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
    if ([v5 isEqualToString:v3] && objc_msgSend(v1, "code") == (id)11)
    {
      BOOL v4 = 1LL;
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
      else {
        BOOL v4 = 0LL;
      }
    }
  }

  return v4;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v0));
    free(v1);
  }

  else
  {
    v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }

  return v2;
}

__CFString *MICopyProcessNameForPid(int a1)
{
  int v1 = proc_pidpath(a1, buffer, 0x1000u);
  if (v1 < 1) {
    return @"Unknown Process Name";
  }
  v2 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  v1,  4LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v2, "lastPathComponent"));

  return (__CFString *)v3;
}

id MIFetchInfoForUsername(const char *a1, uid_t *a2, gid_t *a3, void *a4)
{
  if (sysconf(71) == -1) {
    sub_100012274(&v18, v23);
  }
  uint64_t v8 = __chkstk_darwin();
  id v17 = 0LL;
  id result = (id)getpwnam_r(a1, &v18, (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL), v9, &v17);
  if ((_DWORD)result)
  {
    uint64_t v16 = 0LL;
    memset(v23, 0, sizeof(v23));
    int v11 = (int)result;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v12 = 3LL;
    }
    else {
      uint64_t v12 = 2LL;
    }
    uint64_t v13 = strerror(v11);
    int v19 = 136315394;
    uint64_t v20 = a1;
    __int16 v21 = 2080;
    uint64_t v22 = v13;
    uint64_t v14 = _os_log_send_and_compose_impl(v12, &v16, v23, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    _os_crash_msg(v16, v14);
    __break(1u);
LABEL_16:
    sub_100012320(&v19, v23);
  }

  if (!v17) {
    goto LABEL_16;
  }
  if (a2) {
    *a2 = v18.pw_uid;
  }
  if (a3) {
    *a3 = v18.pw_gid;
  }
  if (a4)
  {
    id result = (id)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v18.pw_dir,  1LL,  0LL));
    *a4 = result;
  }

  return result;
}

uint64_t MIFetchInfoForUID(uint64_t a1, void *a2, gid_t *a3, void *a4, void *a5)
{
  if (sysconf(71) == -1)
  {
    int v19 = *__error();
    uint64_t v20 = v19;
    __int16 v21 = strerror(v19);
    id Error = _CreateError( (uint64_t)"MIFetchInfoForUID",  140LL,  NSPOSIXErrorDomain,  v20,  0LL,  0LL,  @"Failed to get home dir path size: %s",  v22,  (uint64_t)v21);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(Error);
    uint64_t v18 = 0LL;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  uint64_t v10 = __chkstk_darwin();
  uint64_t v26 = 0LL;
  int v12 = getpwuid_r(a1, &v27, (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), v11, &v26);
  if (v12)
  {
    uint64_t v14 = v12;
    strerror(v12);
    id v16 = _CreateError( (uint64_t)"MIFetchInfoForUID",  150LL,  NSPOSIXErrorDomain,  v14,  0LL,  0LL,  @"getpwuid_r failed for uid %d : %s",  v15,  a1);
LABEL_4:
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = 0LL;
    goto LABEL_5;
  }

  if (!v26)
  {
    id v16 = _CreateError( (uint64_t)"MIFetchInfoForUID",  155LL,  NSPOSIXErrorDomain,  2LL,  0LL,  0LL,  @"getpwuid_r succeeded but no user was found with uid %d",  v13,  a1);
    goto LABEL_4;
  }

  if (a2) {
    *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v27.pw_name));
  }
  if (a3) {
    *a3 = v27.pw_gid;
  }
  if (a4)
  {
    uint64_t v18 = 1LL;
    id v17 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v27.pw_dir,  1LL,  0LL));
  }

  else
  {
    id v17 = 0LL;
    uint64_t v18 = 1LL;
  }

LABEL_5:
  if (!a5) {
    goto LABEL_10;
  }
LABEL_8:
  if ((v18 & 1) == 0) {
    *a5 = v17;
  }
LABEL_10:

  return v18;
}

void MIGetCurrentMobileUserInfo(_DWORD *a1, _DWORD *a2)
{
  if (qword_100021658 != -1) {
    dispatch_once(&qword_100021658, &stru_10001C968);
  }
  *a1 = dword_100021650;
  *a2 = dword_100021654;
}

void sub_100008CD0(id a1)
{
}

uint64_t MIAssumeIdentityOfUsername(const char *a1, void *a2)
{
  uint64_t v4 = 0LL;
  MIFetchInfoForUsername(a1, (uid_t *)&v4 + 1, (gid_t *)&v4, 0LL);
  return MIAssumeIdentity(HIDWORD(v4), v4, a2);
}

uint64_t MIAssumeIdentity(uint64_t a1, gid_t a2, void *a3)
{
  if (!(a2 | a1))
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v6) {
      sub_1000123B8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  id v26 = 0LL;
  id v27 = 0LL;
  int v14 = MIFetchInfoForUID(a1, &v27, 0LL, 0LL, &v26);
  id v15 = v27;
  id v16 = v26;
  if (v14)
  {
    if (pthread_setugid_np(a1, a2))
    {
      id v17 = __error();
      uint64_t v25 = *v17;
      strerror(*v17);
      id v19 = _CreateAndLogError( (uint64_t)"MIAssumeIdentity",  228LL,  NSPOSIXErrorDomain,  v25,  0LL,  0LL,  @"pthread_setugid_np failed for uid %d gid %d; error %d (%s)",
              v18,
              a1);
    }

    else
    {
      if (!initgroups((const char *)[v15 UTF8String], a2))
      {
        uint64_t v23 = 1LL;
        goto LABEL_16;
      }

      uint64_t v20 = *__error();
      MIRestoreIdentity();
      strerror(v20);
      id v19 = _CreateAndLogError( (uint64_t)"MIAssumeIdentity",  238LL,  NSPOSIXErrorDomain,  v20,  0LL,  0LL,  @"SYS_initgroups failed; error %d (%s)",
              v21,
              v20);
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue(v19);

    id v16 = (id)v22;
  }

  if (a3)
  {
    id v16 = v16;
    uint64_t v23 = 0LL;
    *a3 = v16;
  }

  else
  {
    uint64_t v23 = 0LL;
  }

LABEL_16:
  return v23;
}

        uint64_t v9 = fts_read(v7);
        if (!v9) {
          goto LABEL_23;
        }
      }

      id v15 = gLogHandle;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        strerror(v9->fts_errno);
        int v14 = v15;
LABEL_14:
        MOLogWrite(v14);
      }

  uint64_t v25 = 0;
LABEL_20:
  CFErrorRef v31 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  int v33 = (void *)objc_claimAutoreleasedReturnValue([v32 oldArchiveDirectory]);
  [v31 removeItemAtURL:v33 error:0];

  if (v25)
  {
    CFErrorRef v34 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    char v35 = (void *)objc_claimAutoreleasedReturnValue([v34 roleUserMigrationMarkerFilePath]);
    -[MobileInstallationHelperService _writeMigrationFileToDiskAtURL:](v40, "_writeMigrationFileToDiskAtURL:", v35);
  }

  v37[2](v37, v4);
LABEL_23:
}

uint64_t MIRestoreIdentity()
{
  uid_t v0 = getuid();
  gid_t v1 = getgid();
  if (!(v0 | v1))
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v2) {
      sub_100012430(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

  uint64_t result = pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if ((_DWORD)result)
  {
    int v11 = *__error();
    uint64_t v14 = 0LL;
    memset(v23, 0, sizeof(v23));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v12 = 3LL;
    }
    else {
      uint64_t v12 = 2LL;
    }
    int v15 = 67109890;
    uid_t v16 = v0;
    __int16 v17 = 1024;
    gid_t v18 = v1;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2080;
    uint64_t v22 = strerror(v11);
    uint64_t v13 = _os_log_send_and_compose_impl(v12, &v14, v23, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    _os_crash_msg(v14, v13);
    __break(1u);
  }

  return result;
}

uint64_t MIAssumeMobileIdentity(void *a1)
{
  if (qword_100021658 != -1) {
    dispatch_once(&qword_100021658, &stru_10001C968);
  }
  return MIAssumeIdentity(dword_100021650, dword_100021654, a1);
}

id MILoadInfoPlist(void *a1, void *a2)
{
  return MILoadInfoPlistWithError(a1, a2, 0LL);
}

id MILoadInfoPlistWithError(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v28 = 0LL;
  uint64_t v7 = (__CFBundle *)sub_100009350(v5, 0LL, &v28);
  id v8 = v28;
  if (v7)
  {
    if (v6)
    {
      uint64_t FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist(v7, v6, 1LL);
      if (FilteredInfoPlist)
      {
        int v11 = (const void *)FilteredInfoPlist;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v11))
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));
          CFRelease(v11);
        }

        else
        {
          CFTypeID v18 = CFGetTypeID(v11);
          CFStringRef v19 = CFCopyTypeIDDescription(v18);
          id v21 = _CreateAndLogError( (uint64_t)"MILoadInfoPlistWithError",  363LL,  MIInstallerErrorDomain,  3LL,  0LL,  0LL,  @"Object returned from _CFBundleCreateFilteredInfoPlist was not a dictionary, was type %@",  v20,  (uint64_t)v19);
          uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

          if (v19) {
            CFRelease(v19);
          }
          CFRelease(v11);
          uint64_t v13 = 0LL;
          id v8 = (id)v22;
        }

        goto LABEL_17;
      }

      id v16 = _CreateAndLogError( (uint64_t)"MILoadInfoPlistWithError",  357LL,  MIInstallerErrorDomain,  3LL,  0LL,  0LL,  @"Failed to get filtered Info.plist with keys %@ from bundle %@",  v10,  (uint64_t)v6);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    }

    else
    {
      CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v7);
      if (InfoDictionary)
      {
        int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  InfoDictionary));
        uint64_t v13 = v15;
        if (v15) {
          [v15 removeObjectForKey:@"CFBundleInfoPlistURL"];
        }
LABEL_17:
        CFRelease(v7);
        if (!a3) {
          goto LABEL_20;
        }
        goto LABEL_18;
      }

      uint64_t v23 = (void *)MIInstallerErrorDomain;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
      id v26 = _CreateAndLogError( (uint64_t)"MILoadInfoPlistWithError",  378LL,  v23,  35LL,  0LL,  0LL,  @"CFBundleGetInfoDictionary failed for bundle at %@",  v25,  (uint64_t)v24);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(v26);
    }

    uint64_t v13 = 0LL;
    id v8 = (id)v17;
    goto LABEL_17;
  }

  uint64_t v13 = 0LL;
  if (!a3) {
    goto LABEL_20;
  }
LABEL_18:
  if (!v13) {
    *a3 = v8;
  }
LABEL_20:

  return v13;
}

const void *sub_100009350(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t Unique = _CFBundleCreateUnique(0LL, v5);
  if (!Unique)
  {
    uint64_t v12 = (void *)MIInstallerErrorDomain;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    id v15 = _CreateAndLogError( (uint64_t)"_CreateCFBundle",  296LL,  v12,  3LL,  0LL,  0LL,  @"Failed to create CFBundle for %@",  v14,  (uint64_t)v13);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v15);

    id v8 = 0LL;
    if (!a3)
    {
LABEL_23:
      uint64_t v7 = 0LL;
      goto LABEL_24;
    }

LABEL_24:
  return v7;
}

  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (v33)
  {
    CFRelease(v33);
    int v33 = 0LL;
  }

  uint64_t v29 = v12;

  return v29;
}

  return v29;
}

id MILoadRawInfoPlist(void *a1, void *a2)
{
  id v11 = 0LL;
  id v12 = 0LL;
  uint64_t v3 = sub_100009350(a1, &v12, &v11);
  id v4 = v12;
  id v5 = v11;
  if (v3)
  {
    id v10 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary MI_dictionaryWithContentsOfURL:options:error:]( &OBJC_CLASS___NSDictionary,  "MI_dictionaryWithContentsOfURL:options:error:",  v4,  0LL,  &v10));
    id v7 = v10;

    id v8 = [v6 mutableCopy];
    CFRelease(v3);
    id v5 = v7;
    if (!a2) {
      goto LABEL_7;
    }
  }

  else
  {
    id v8 = 0LL;
    if (!a2) {
      goto LABEL_7;
    }
  }

  if (!v8) {
    *a2 = v5;
  }
LABEL_7:

  return v8;
}

void MIRecordCurrentBuildVersion(void *a1)
{
  id v1 = a1;
  BOOL v2 = (void *)_CFCopySystemVersionDictionary();
  id v8 = 0LL;
  unsigned __int8 v3 = objc_msgSend(v2, "MI_writeToURL:format:options:error:", v1, 200, 268435457, &v8);
  id v4 = v8;
  uint64_t v5 = gLogHandle;
  if ((v3 & 1) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ReleaseType"]);
      MOLogWrite(v5);

LABEL_8:
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v1 path]);
    MOLogWrite(v5);
    goto LABEL_8;
  }
}

uint64_t MIIsBuildUpgrade(uint64_t a1, void *a2)
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  a1));
  id v4 = v3;
  if (!v3)
  {
    uint64_t v15 = gLogHandle;
LABEL_15:
    MOLogWrite(v15);
LABEL_16:
    id v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v9 = 0LL;
    id v11 = 0LL;
    id v7 = 0LL;
    goto LABEL_26;
  }

  uint64_t v5 = _kCFSystemVersionBuildVersionKey;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey]);
  if (!v6)
  {
    uint64_t v15 = gLogHandle;
    goto LABEL_15;
  }

  id v7 = (id)v6;
  id v8 = (void *)_CFCopySystemVersionDictionary();
  if (!v8)
  {
    id v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_25;
  }

  uint64_t v9 = v8;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v5]);
  if (!v10)
  {
    id v12 = 0LL;
    uint64_t v13 = 0LL;
LABEL_25:
    id v11 = 0LL;
    goto LABEL_26;
  }

  id v11 = (void *)v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ReleaseType"]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ReleaseType"]);
  if ([v7 isEqual:v11])
  {
    uint64_t v14 = 0LL;
    goto LABEL_29;
  }

LABEL_26:
  if (a2)
  {
    id v7 = v7;
    *a2 = v7;
  }

  uint64_t v14 = 1LL;
LABEL_29:

  return v14;
}

id MILoadFilteredPlist(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  CFTypeRef v33 = 0LL;
  CFTypeRef cf = 0LL;
  id v32 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v5,  3LL,  &v32));
  id v8 = v32;
  if (!v7)
  {
    id v17 = (void *)MIInstallerErrorDomain;
    id v12 = (id)objc_claimAutoreleasedReturnValue([v5 path]);
    id v19 = _CreateAndLogError( (uint64_t)"MILoadFilteredPlist",  502LL,  v17,  4LL,  v8,  0LL,  @"Failed to read plist from %@",  v18,  (uint64_t)v12);
    id v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_21;
  }

  if (!v6)
  {
    id v31 = 0LL;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v7,  0LL,  0LL,  &v31));
    id v14 = v31;

    if (!v10)
    {
      id v26 = (void *)MIInstallerErrorDomain;
      id v12 = (id)objc_claimAutoreleasedReturnValue([v5 path]);
      id v28 = _CreateAndLogError( (uint64_t)"MILoadFilteredPlist",  520LL,  v26,  4LL,  v14,  0LL,  @"Failed to decode plist from %@",  v27,  (uint64_t)v12);
      id v20 = (id)objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_20;
    }

    id v8 = v14;
    goto LABEL_12;
  }

  int v9 = _CFPropertyListCreateFiltered(kCFAllocatorDefault, v7, 0LL, v6, &v33, &cf);
  uint64_t v10 = (void *)v33;
  if (v9) {
    BOOL v11 = v33 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    CFTypeRef v33 = 0LL;
LABEL_12:
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v12 = v10;
    if ((objc_opt_isKindOfClass(v12) & 1) != 0) {
      id v21 = v12;
    }
    else {
      id v21 = 0LL;
    }

    if (v21)
    {
      id v20 = v8;
      goto LABEL_24;
    }

    uint64_t v22 = (void *)MIInstallerErrorDomain;
    id v23 = (objc_class *)objc_opt_class(v12);
    uint64_t v24 = NSStringFromClass(v23);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v24);
    id v16 = _CreateAndLogError( (uint64_t)"MILoadFilteredPlist",  526LL,  v22,  4LL,  0LL,  0LL,  @"Object returned from _CFPropertyListCreateFiltered was not a dictionary, was type %@",  v25,  (uint64_t)v14);
    goto LABEL_18;
  }

  id v12 = (id)cf;
  CFTypeRef cf = 0LL;
  uint64_t v13 = (void *)MIInstallerErrorDomain;
  id v14 = (id)objc_claimAutoreleasedReturnValue([v5 path]);
  id v16 = _CreateAndLogError( (uint64_t)"MILoadFilteredPlist",  511LL,  v13,  4LL,  v12,  0LL,  @"Failed to decode plist from %@",  v15,  (uint64_t)v14);
LABEL_18:
  id v20 = (id)objc_claimAutoreleasedReturnValue(v16);

LABEL_20:
  id v8 = v14;
LABEL_21:

  if (a3)
  {
    id v20 = v20;
    id v12 = 0LL;
    *a3 = v20;
  }

  else
  {
    id v12 = 0LL;
  }

id MICopyCurrentBuildVersion()
{
  if (qword_100021668 != -1) {
    dispatch_once(&qword_100021668, &stru_10001C988);
  }
  return (id)qword_100021660;
}

void sub_100009E3C(id a1)
{
  id v1 = (void *)_CFCopySystemVersionDictionaryValue(_kCFSystemVersionBuildVersionKey);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  id v4 = (void *)qword_100021660;
  qword_100021660 = (uint64_t)v3;
}

void MIAssertHighResourceUsage()
{
  do
    unsigned int v0 = __ldaxr((unsigned int *)&unk_100021670);
  while (__stlxr(v0 + 1, (unsigned int *)&unk_100021670));
  if (!v0)
  {
    uint64_t v1 = getpid();
    proc_disable_cpumon(v1);
  }

void MIClearResourceAssertion()
{
  do
  {
    unsigned int v0 = __ldaxr((unsigned int *)&unk_100021670);
    unsigned int v1 = v0 - 1;
  }

  while (__stlxr(v1, (unsigned int *)&unk_100021670));
  if (!v1)
  {
    uint64_t v2 = getpid();
    proc_set_cpumon_defaults(v2);
  }

void sub_100009F74( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_100009F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, a2, a3, 80LL, a5, v5, 16LL);
}

BOOL sub_100009F94()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void sub_10000A738(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100021678;
  qword_100021678 = (uint64_t)v1;
}

void sub_10000B004(_Unwind_Exception *a1)
{
}

uint64_t sub_10000B034(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B044(uint64_t a1)
{
}

uint64_t sub_10000B04C(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
  if (*(_BYTE *)(a1 + 72))
  {
    if (a3 == 4)
    {
      uint64_t v7 = gLogHandle;
    }

    else
    {
      uint64_t v7 = gLogHandle;
    }

LABEL_28:
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    MOLogWrite(v7);

LABEL_29:
    uint64_t v15 = 1LL;
    goto LABEL_30;
  }

LABEL_4:
  if ([v6 isEqualToString:@".com.apple.mobile_container_manager.metadata.plist"])
  {
    uint64_t v7 = gLogHandle;
    goto LABEL_28;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) URLByAppendingPathComponent:v6 isDirectory:1]);
  int v9 = *(void **)(a1 + 56);
  id v40 = 0LL;
  unsigned __int8 v10 = [v9 removeItemAtURL:v8 error:&v40];
  id v11 = v40;
  if ((v10 & 1) == 0)
  {
    uint64_t v12 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      CFTypeRef v33 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      id v36 = v11;
      uint64_t v30 = v13;
      MOLogWrite(v12);
    }
  }

  id v14 = *(void **)(a1 + 56);
  id v39 = v11;
  uint64_t v15 = (uint64_t)objc_msgSend(v14, "moveItemIfExistsAtURL:toURL:error:", v5, v8, &v39, v30, v33, v36);
  id v16 = v39;

  if ((v15 & 1) == 0)
  {
    uint64_t v17 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v18 = (void *)getuid();
      uint64_t v19 = getgid();
      uint64_t v37 = geteuid();
      uint64_t v38 = getegid();
      uint64_t v34 = v19;
      id v31 = v18;
      MOLogWrite(v17);
      uint64_t v17 = gLogHandle;
      if (!gLogHandle) {
        goto LABEL_20;
      }
    }

    if (*(int *)(v17 + 44) >= 5)
    {
LABEL_20:
      id v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path", v31, v34, v37, v38));
      MOLogWrite(v17);
    }

    objc_msgSend(*(id *)(a1 + 56), "logAccessPermissionsForURL:", v5, v31);
    uint64_t v20 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      MOLogWrite(v20);
    }

    objc_msgSend(*(id *)(a1 + 56), "logAccessPermissionsForURL:", v8, v32);
    id v21 = (void *)MIInstallerErrorDomain;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    char v35 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    id v24 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDat aFrom:containsOneOrMoreSymlinks:withError:]_block_invoke",  183LL,  v21,  21LL,  v16,  0LL,  @"Failed to move %@ to %@ : %@",  v23,  (uint64_t)v22);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }

LABEL_30:
  return v15;
}

id sub_10000B6EC(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_runAsyncForIdentifier:description:operation:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
}

LABEL_14:
LABEL_30:
      if (gLogHandle)
      {
      }
    }
  }

  else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    MOLogWrite(gLogHandle);
  }

void sub_10000BCA4(id *a1)
{
  uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([a1[4] block]);
  v2[2]();

  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] internalQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BD5C;
  block[3] = &unk_10001CA20;
  id v7 = a1[6];
  id v4 = a1[4];
  id v5 = a1[5];
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v3, block);
}

id sub_10000BD5C(uint64_t a1)
{
  uint64_t v2 = gLogHandle;
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) descString]);
    MOLogWrite(v2);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "activeIdentifiers", v5, v6));
  [v3 removeObject:*(void *)(a1 + 32)];

  return objc_msgSend(*(id *)(a1 + 48), "_onQueue_deQueueIfNeeded");
}

uint64_t patchFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, void))(a3 + 16))(a3, 3LL, &v45, 32LL, 0LL) != 32)
  {
    uint64_t v27 = gLogHandle;
LABEL_34:
    id v28 = __error();
    strerror(*v28);
    uint64_t v29 = v27;
LABEL_37:
    MOLogWrite(v29);
    return 0LL;
  }

  if (v45 != 0x3034464649445342LL)
  {
    uint64_t v29 = gLogHandle;
    goto LABEL_37;
  }

  id v9 = sub_10000CA18(a3, 4, a4, 32LL);
  if (!v9)
  {
    uint64_t v27 = gLogHandle;
    goto LABEL_34;
  }

  unsigned __int8 v10 = v9;
  id v11 = sub_10000CA18(a3, 5, a4, v46 + 32);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_10000CA18(a3, 6, a4, v46 + v47 + 32);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = malloc(0x10000uLL);
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = malloc(0x10000uLL);
        if (v17)
        {
          uint64_t v18 = v17;
          if (v48)
          {
            uint64_t v19 = 0LL;
            unint64_t v20 = 0LL;
            uint64_t v41 = (uint64_t)v14;
            while (sub_10000CB94((uint64_t)v10, &buf, 24) == 24)
            {
              if (v44 < 0) {
                uint64_t v44 = -(v44 & 0x7FFFFFFFFFFFFFFFLL);
              }
              unint64_t v21 = buf;
              if (buf)
              {
                while (1)
                {
                  if (v21 >= 0x10000) {
                    uint64_t v22 = 0x10000LL;
                  }
                  else {
                    uint64_t v22 = v21;
                  }
                  if ((*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(a1 + 16))( a1,  1LL,  v16,  v22,  v19) != v22)
                  {
                    uint64_t v39 = gLogHandle;
                    goto LABEL_72;
                  }

                  uint64_t v23 = 0LL;
                  do
                  {
                    *((_BYTE *)v18 + v23) += v16[v23];
                    ++v23;
                  }

                  while (v22 != v23);
                  if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))( a5,  2LL,  v18,  v22,  v20) != v22)
                  {
LABEL_60:
                    uint64_t v39 = gLogHandle;
                    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                    {
LABEL_65:
                      uint64_t v40 = v39;
                      goto LABEL_71;
                    }

                    goto LABEL_72;
                  }

                  v19 += v22;
                  v20 += v22;
                  v21 -= v22;
                  if (!v21) {
                    goto LABEL_23;
                  }
                }

                uint64_t v40 = gLogHandle;
LABEL_71:
                MOLogWrite(v40);
LABEL_72:
                uint64_t v26 = 0LL;
                id v14 = (void *)v41;
                goto LABEL_73;
              }

LABEL_30:
              v19 += v44;
              uint64_t v26 = 1LL;
              id v14 = (void *)v41;
              if (v20 >= v48) {
                goto LABEL_73;
              }
            }

            uint64_t v26 = 0LL;
          }

          else
          {
            uint64_t v26 = 1LL;
          }

LABEL_73:
          free(v18);
        }

        else
        {
          uint64_t v37 = gLogHandle;
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            uint64_t v38 = __error();
            strerror(*v38);
            MOLogWrite(v37);
          }

          uint64_t v26 = 0LL;
        }

        free(v16);
      }

      else
      {
        uint64_t v35 = gLogHandle;
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          id v36 = __error();
          strerror(*v36);
          MOLogWrite(v35);
        }

        uint64_t v26 = 0LL;
      }

      sub_10000CC0C(v14);
    }

    else
    {
      uint64_t v33 = gLogHandle;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t v34 = __error();
        strerror(*v34);
        MOLogWrite(v33);
      }

      uint64_t v26 = 0LL;
    }

    sub_10000CC0C(v12);
  }

  else
  {
    uint64_t v31 = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v32 = __error();
      strerror(*v32);
      MOLogWrite(v31);
    }

    uint64_t v26 = 0LL;
  }

  sub_10000CC0C(v10);
  return v26;
}

void *sub_10000CA18(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int bzerror = 0;
  id v8 = calloc(1uLL, 0x30uLL);
  id v9 = v8;
  if (!v8)
  {
    uint64_t v13 = gLogHandle;
LABEL_12:
    id v14 = __error();
    strerror(*v14);
    uint64_t v12 = v13;
LABEL_13:
    MOLogWrite(v12);
LABEL_14:
    sub_10000CC0C(v9);
    return 0LL;
  }

  *(_DWORD *)id v8 = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a1;
  unsigned __int8 v10 = funopen(v8, (int (__cdecl *)(void *, char *, int))sub_10000CF24, 0LL, 0LL, 0LL);
  v9[4] = v10;
  if (!v10)
  {
    uint64_t v13 = gLogHandle;
    goto LABEL_12;
  }

  id v11 = BZ2_bzReadOpen(&bzerror, v10, 0, 0, 0LL, 0);
  v9[5] = v11;
  if (!v11)
  {
    uint64_t v12 = gLogHandle;
    goto LABEL_13;
  }

  return v9;
}

uint64_t sub_10000CB94(uint64_t a1, void *buf, int len)
{
  int bzerror = 0;
  uint64_t result = BZ2_bzRead(&bzerror, *(BZFILE **)(a1 + 40), buf, len);
  if ((bzerror & 0xFFFFFFFB) != 0)
  {
    return 0xFFFFFFFFLL;
  }

  return result;
}

void sub_10000CC0C(void *a1)
{
  int bzerror = 0;
  if (a1)
  {
    uint64_t v2 = (BZFILE *)a1[5];
    if (v2) {
      BZ2_bzReadClose(&bzerror, v2);
    }
    id v3 = (FILE *)a1[4];
    if (v3) {
      fclose(v3);
    }
    free(a1);
  }

uint64_t patch_file(const char *a1, const char *a2, int a3)
{
  int v5 = open(a1, 256);
  if (v5 != -1)
  {
    int v6 = v5;
    if (fstat(v5, &v29) == -1)
    {
      uint64_t v13 = gLogHandle;
      id v14 = __error();
      strerror(*v14);
      uint64_t v15 = v13;
    }

    else
    {
      int v7 = open(a2, 256);
      if (v7 != -1)
      {
        int v8 = v7;
        if (fstat(v7, &v28) == -1)
        {
          uint64_t v18 = gLogHandle;
          uint64_t v19 = __error();
          strerror(*v19);
          uint64_t v20 = v18;
        }

        else
        {
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 0x40000000LL;
          v26[2] = sub_10000CEE8;
          v26[3] = &unk_10001CA40;
          int v27 = v6;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 0x40000000LL;
          v24[2] = sub_10000CEFC;
          v24[3] = &unk_10001CA60;
          int v25 = v8;
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 0x40000000LL;
          v22[2] = sub_10000CF10;
          v22[3] = &unk_10001CA80;
          int v23 = a3;
          if ((patchFile((uint64_t)v26, v9, (uint64_t)v24, v28.st_size, (uint64_t)v22) & 1) != 0)
          {
            uint64_t v10 = 0LL;
LABEL_26:
            close(v8);
            goto LABEL_27;
          }

          uint64_t v20 = gLogHandle;
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_25:
            uint64_t v10 = 0xFFFFFFFFLL;
            goto LABEL_26;
          }
        }

        MOLogWrite(v20);
        goto LABEL_25;
      }

      uint64_t v16 = gLogHandle;
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_18:
        uint64_t v10 = 0xFFFFFFFFLL;
LABEL_27:
        close(v6);
        return v10;
      }

      uint64_t v17 = __error();
      strerror(*v17);
      uint64_t v15 = v16;
    }

    MOLogWrite(v15);
    goto LABEL_18;
  }

  uint64_t v11 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    uint64_t v12 = __error();
    strerror(*v12);
    MOLogWrite(v11);
  }

  return 0xFFFFFFFFLL;
}

ssize_t sub_10000CEE8(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_10000CEFC(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_10000CF10(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pwrite(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

uint64_t sub_10000CF24(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16LL))();
  if (result == -1) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 16) += result;
  return result;
}

id MIGetBooleanEntitlement(void *a1, void *a2, id a3)
{
  id v5 = a2;
  if (a1)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:v5]);
    if (v6)
    {
      objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v6) & 1) != 0)
      {
        a3 = [v6 BOOLValue];
      }

      else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        MOLogWrite(gLogHandle);
      }
    }

    else
    {
      a3 = 0LL;
    }
  }

  else
  {
    a3 = 0LL;
  }

  return a3;
}

uint64_t MIGetFirstTrueBooleanEntitlement(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = a2;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ((MIGetBooleanEntitlement(v5, *(void **)(*((void *)&v13 + 1) + 8LL * (void)v10), a3) & 1) != 0)
        {
          uint64_t v11 = 1LL;
          goto LABEL_11;
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = 0LL;
LABEL_11:

  return v11;
}

id MIHasUpgradeEnabledEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.upgrade-enabled", 0LL);
}

id MIHasContainerRequiredEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.container-required", (id)1);
}

id MIHasNoContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-container", 0LL);
}

id MIHasNoSandboxEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-sandbox", 0LL);
}

BOOL MIHasSeatbeltProfilesEntitlement(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"seatbelt-profiles"]);
  BOOL v2 = v1 != 0LL;

  return v2;
}

id MIHasPlatformApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"platform-application", 0LL);
}

id MIHasSystemContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.security.system-container", 0LL);
}

id MIHasXPCServicesAllowedEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.xpc-services-enabled", 0LL);
}

id MIHasSystemApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.system-application", 0LL);
}

id MIHasWebKitPushBundleEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.webkit.pushbundle", 0LL);
}

id MIHasMarketplaceEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.marketplace.app-installation", 0LL);
}

id MICopyPlaceholderEntitlements(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0]);
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v1));

  return v2;
}

id MIWritePlaceholderEntitlements(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0]);
  id v7 = objc_msgSend(v5, "MI_writeToURL:format:options:error:", v6, 200, 268435457, a3);

  return v7;
}

id MICopyApplicationGroupEntitlement(void *a1)
{
  return sub_10000D33C(a1, @"com.apple.security.application-groups");
}

id sub_10000D33C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:v3]);
  if (!v4) {
    goto LABEL_14;
  }
  objc_opt_class(&OBJC_CLASS___NSArray);
  char isKindOfClass = objc_opt_isKindOfClass(v4);
  objc_opt_class(&OBJC_CLASS___NSString);
  if ((isKindOfClass & 1) == 0)
  {
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      uint64_t v11 = v4;
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
      if (v6) {
        goto LABEL_7;
      }
LABEL_15:
      id v8 = 0LL;
      goto LABEL_16;
    }

    uint64_t v9 = gLogHandle;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
LABEL_14:
      id v6 = 0LL;
      goto LABEL_15;
    }

LABEL_13:
    MOLogWrite(v9);
    goto LABEL_14;
  }

  if ((MIArrayContainsOnlyClass(v4) & 1) == 0)
  {
    uint64_t v9 = gLogHandle;
    goto LABEL_13;
  }

  id v6 = v4;
LABEL_7:
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

LABEL_16:
  return v8;
}

BOOL MIHasAnyApplicationGroupEntitlements(void *a1)
{
  id v1 = sub_10000D33C(a1, @"com.apple.security.application-groups");
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  BOOL v3 = v2 != 0LL;

  return v3;
}

id MICopySystemGroupEntitlement(void *a1)
{
  id v1 = a1;
  id v2 = sub_10000D33C(v1, @"com.apple.security.system-groups");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (!v3 || ![v3 count])
  {
    id v5 = sub_10000D33C(v1, @"com.apple.security.system-group-containers");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    id v4 = (void *)v6;
  }

  return v4;
}

BOOL MIHasAnySystemGroupEntitlements(void *a1)
{
  id v1 = MICopySystemGroupEntitlement(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  BOOL v3 = v2 != 0LL;

  return v3;
}

id MIHasOnDemandInstallCapableEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.on-demand-install-capable", 0LL);
}

id MICopyParentIdentifiersEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [a1 objectForKeyedSubscript:@"com.apple.developer.parent-application-identifiers"]);
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id MICopyApplicationIdentifierEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"application-identifier"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id MICopyPreviousApplicationIdentifiersEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"previous-application-identifiers"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = MIArrayifyThing(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  return v3;
}

id MIHasBetaReportsActiveEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"beta-reports-active", 0LL);
}

id MICopyKeychainAccessGroupEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"keychain-access-groups"]);
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id MIHasSwiftPlaygroundsAppEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.swift-playgrounds-app", 0LL);
}

id MICopyAppManagementDomainEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"com.apple.developer.app-management-domain"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainValue(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    if ([v1 hasPrefix:@"swift-playgrounds"])
    {
      uint64_t v3 = 2LL;
    }

    else if ([v2 isEqualToString:@"com.apple.WebKit.PushBundles"])
    {
      uint64_t v3 = 3LL;
    }

    else
    {
      uint64_t v3 = 0LL;
    }
  }

  else
  {
    uint64_t v3 = 1LL;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainEntitlement(void *a1)
{
  id v1 = MICopyAppManagementDomainEntitlement(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = MIClassifyAppManagementDomainValue(v2);

  return v3;
}

id MICopyNetworkExtensionEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"com.apple.developer.networking.networkextension"]);
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id MICopyAssociatedAppClipsEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [a1 objectForKeyedSubscript:@"com.apple.developer.associated-appclip-app-identifiers"]);
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id MIHasDriverKitEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.driverkit", 0LL);
}

id MICopyDataProtectionClassEntitlement(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v3 = v2;
  if ((objc_opt_isKindOfClass(v3) & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"data-protection-class"]);
    objc_opt_class(&OBJC_CLASS___NSString);
    id v6 = v5;
    id v4 = (objc_opt_isKindOfClass(v6) & 1) != 0 ? v6 : 0LL;

    if (!v4)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"DataProtectionClass"]);
      objc_opt_class(&OBJC_CLASS___NSString);
      id v8 = v7;
      if ((objc_opt_isKindOfClass(v8) & 1) != 0) {
        id v4 = v8;
      }
      else {
        id v4 = 0LL;
      }
    }
  }

  return v4;
}

id MICopyDataProtectionIfAvailableEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [a1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection-if-available"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  if (v3)
  {
    id v4 = v2;
  }

  else
  {
    objc_opt_class(&OBJC_CLASS___NSArray);
    id v5 = v2;
    if ((objc_opt_isKindOfClass(v5) & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0LL;
    }

    if (v6)
    {
      id v7 = v5;
      objc_opt_class(&OBJC_CLASS___NSString);
      id v8 = MIArrayFilteredToContainOnlyClass(v7);
      id v4 = (id)objc_claimAutoreleasedReturnValue(v8);
    }

    else
    {
      id v4 = 0LL;
    }
  }

  return v4;
}

id MIHasBrowserEngineHostEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.host", 0LL);
}

id MIHasEmbeddedBrowserEngineEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.embedded-web-browser-engine", 0LL);
}

id MIHasBrowserEngineRenderingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.rendering", 0LL);
}

id MIHasBrowserEngineNetworkingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.networking", 0LL);
}

id MIHasBrowserEngineContentEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.webcontent", 0LL);
}

id MICopyMemoryTransferAcceptEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-accept"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id MICopyMemoryTransferSendEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-send"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id MIHasDefaultBrowserEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser", 0LL);
}

id MIHasBrowserAppInstallationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.browser.app-installation", 0LL);
}

id MIBooleanValue(void *a1, id a2)
{
  id v3 = a1;
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3) & 1) != 0) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v1 = a1;
  id v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      id v5 = 0LL;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v5)) & 1) == 0)
        {
          uint64_t v6 = 0LL;
          goto LABEL_11;
        }

        id v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  uint64_t v6 = 1LL;
LABEL_11:

  return v6;
}

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v1 count]));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (CFIndex i = 0LL; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v8) & 1) != 0) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  id v9 = [v2 copy];
  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0LL;
  __int128 v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E140;
  v8[3] = &unk_10001CAA8;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_10000E128( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000E140(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass(v8) & 1) == 0 || a1[6] && (objc_opt_isKindOfClass(v7) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

id MIStringifyObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v1) & 1) != 0) {
      id v2 = v1;
    }
    else {
      id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v1));
    }
    id v3 = v2;
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_11;
  }
  objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v1) & 1) != 0)
  {
    if (MIArrayContainsOnlyClass(v1))
    {
      id v2 = v1;
LABEL_7:
      id v3 = v2;
      goto LABEL_12;
    }

    goto LABEL_11;
  }

  if ((objc_opt_isKindOfClass(v1) & 1) != 0)
  {
    id v6 = v1;
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    goto LABEL_7;
  }

  objc_opt_class(&OBJC_CLASS___NSSet);
  if ((objc_opt_isKindOfClass(v1) & 1) == 0)
  {
LABEL_11:
    id v3 = 0LL;
    goto LABEL_12;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 allObjects]);
  else {
    id v3 = 0LL;
  }

LABEL_12:
  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

LABEL_7:
  return v5 != 0LL;
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  context = objc_autoreleasePoolPush();
  uint64_t v33 = (void *)os_transaction_create("com.apple.installd.helper-startup");
  id v4 = &BZ2_bzRead_ptr;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 helperLogDirectory]);
  id v32 = (id)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"mobile_installation_helper.log" isDirectory:0]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  LODWORD(v6) = [v7 allowsInternalSecurityPolicy];

  uint64_t v8 = 0LL;
  id v9 = 0LL;
  if ((_DWORD)v6) {
    int v10 = 4;
  }
  else {
    int v10 = 1;
  }
  unsigned int v31 = v10;
  int v35 = v10 + 1;
  do
  {
    uint64_t v11 = v9;
    char v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s.%u",  "mobile_installation_helper.log",  v8,  v30));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4[35] sharedInstance]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 logDirectory]);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 URLByAppendingPathComponent:v12 isDirectory:0]);

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4[35] sharedInstance]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 helperLogDirectory]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([(id)v17 URLByAppendingPathComponent:v12 isDirectory:0]);

    id v36 = v11;
    LOBYTE(v17) = [v3 moveItemIfExistsAtURL:v15 toURL:v18 error:&v36];
    id v9 = v36;

    if ((v17 & 1) == 0)
    {
      uint64_t v19 = gLogHandle;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
        stat v29 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
        id v30 = v9;
        MOLogWrite(v19);

        id v4 = &BZ2_bzRead_ptr;
      }

      id v9 = 0LL;
    }

    uint64_t v8 = (v8 + 1);
  }

  while (v35 != (_DWORD)v8);
  uint64_t v21 = MOLogOpen("com.apple.MobileInstallationHelperService", 5LL);
  gLogHandle = v21;
  if (!v21)
  {
    syslog( 3, "Failed to set up rotating logs at path %s", (const char *)[v32 fileSystemRepresentation]);
    uint64_t v21 = gLogHandle;
  }

  id v22 = v32;
  MOLogEnableDiskLogging(v21, [v22 fileSystemRepresentation], v31, 0x40000);
  ICLSetLoggingHandle(gLogHandle);
  signal(15, (void (__cdecl *)(int))1);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  unint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  int v25 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v24);
  dispatch_source_set_event_handler(v25, &stru_10001CB08);
  dispatch_activate(v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  int v27 = objc_opt_new(&OBJC_CLASS___MobileInstallationHelperServiceDelegate);
  [v26 setDelegate:v27];

  objc_autoreleasePoolPop(context);
  [v26 resume];

  return 0;
}

void sub_10000EA94(id a1)
{
  uint64_t v1 = gLogHandle;
  xpc_transaction_exit_clean(v1);
}

void sub_10000EB14(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___MILimitedConcurrencyQueue);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v2 = -[MILimitedConcurrencyQueue initWithName:width:]( v1,  "initWithName:width:",  @"com.apple.MobileInstallationHelperService.LimitedConcurrencyQueue",  [v4 nSimultaneousInstallations]);
  id v3 = (void *)qword_100021690;
  qword_100021690 = (uint64_t)v2;
}

void sub_10000F8B4(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10000F834LL);
  }

  JUMPOUT(0x10000F8C8LL);
}

LABEL_49:
    MIRestoreIdentity();
    [v5 logAccessPermissionsForURL:v67];
    if (!v32)
    {
      uint64_t v54 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        CFErrorRef v55 = (void *)objc_claimAutoreleasedReturnValue([v67 path]);
        v56 = strerror(__errnum);
        sub_1000124A8(v55, (uint64_t)v56, (uint64_t)&v83);
      }

      v57 = gLogHandle;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v67 path]);
        strerror(__errnum);
        MOLogWrite(v57);
      }

      goto LABEL_68;
    }

    memset(&v83, 0, sizeof(v83));
    uint64_t v46 = v32;
    if (lstat((const char *)[v46 fileSystemRepresentation], &v83))
    {
      uint64_t v47 = *__error();
      unint64_t v48 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v46 path]);
        v50 = strerror(v47);
        sub_1000125A4(v49, (uint64_t)v50, (uint64_t)buf);
      }

      uint64_t v51 = v47;
      uint64_t v52 = gLogHandle;
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v46 path]);
      strerror(v51);
      MOLogWrite(v52);
    }

    else
    {
      v58 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v46 path]);
        sub_100012504(v59, (uint64_t)&v83, buf);
      }

      v60 = gLogHandle;
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v46 path]);
      MOLogWrite(v60);
    }

LABEL_68:
    goto LABEL_35;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite(gLogHandle);
    uint64_t v41 = 0;
    goto LABEL_37;
  }

void sub_10001042C(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1000103A8LL);
  }

  JUMPOUT(0x100010440LL);
}

void sub_100010B84()
{
}

id sub_100010D4C(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_stageItemAtURL:options:completion:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
}

void sub_10001143C()
{
}

void sub_100011578(id a1)
{
  id v3 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.MobileInstallation.%s", "-[MobileInstallationHelperService createSafeHarborWithIdentifier:forPersona:contai nerType:andMigrateDataFrom:completion:]_block_invoke"));
  dispatch_workloop_t v1 = dispatch_workloop_create((const char *)[v3 UTF8String]);
  id v2 = (void *)qword_1000216A0;
  qword_1000216A0 = (uint64_t)v1;
}

id sub_1000115D8(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 72),  *(void *)(a1 + 56),  *(void *)(a1 + 64));
}

uint64_t sub_1000121E0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W8>)
{
  *(void *)(a3 + 14) = v4;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = result;
  *(_WORD *)(a3 + 32) = a4;
  *(void *)(a3 + 34) = a2;
  return result;
}

  ;
}

void sub_100012204(uint64_t a1@<X2>, uint64_t a2@<X8>, float a3@<S0>)
{
  *(float *)a1 = a3;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2080;
}

void sub_100012218(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100012224()
{
}

void sub_10001224C()
{
}

void sub_100012274(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100009F94()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  strerror(v4);
  uint64_t v7 = sub_100009F84(v5, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100012320(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100009F94()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100009F84(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v6);
  __break(1u);
}

void sub_1000123B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100012430( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000124A8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1000121FC();
}

void sub_100012504(void *a1, uint64_t a2, uint8_t *buf)
{
  int v4 = *(_DWORD *)(a2 + 16);
  int v5 = *(_DWORD *)(a2 + 20);
  int v6 = *(unsigned __int16 *)(a2 + 4);
  *(void *)(buf + 4) = "-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]";
  *((_WORD *)buf + 6) = 2080;
  *(_DWORD *)unint64_t buf = 136316418;
  *(void *)(buf + 14) = "_installd";
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a1;
  *((_WORD *)buf + 16) = 1024;
  *(_DWORD *)(buf + 34) = v4;
  *((_WORD *)buf + 19) = 1024;
  *((_DWORD *)buf + 10) = v5;
  *((_WORD *)buf + 22) = 1024;
  *(_DWORD *)(buf + 46) = v6;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: User %s is unable to traverse past %@ %u/%u 0%o",  buf,  0x32u);

  sub_1000121FC();
}

void sub_1000125A4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1000121FC();
}

id objc_msgSend_MI_writeAtomicallyToURL_withMode_owner_group_protectionClass_withBarrier_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:");
}

id objc_msgSend__allContainersForIdentifiers_groupIdentifiers_contentClass_forPersona_transient_create_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_allContainersForIdentifiers:groupIdentifiers:contentClass:forPersona:transient:create:error:");
}

id objc_msgSend__enumeratorWithContainerClass_forPersona_isTransient_identifiers_groupIdentifiers_create_usingBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:");
}

id objc_msgSend_containerWithIdentifier_forPersona_ofContentClass_createIfNeeded_created_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:");
}

id objc_msgSend_fromMIH_createSafeHarborWithIdentifier_forPersona_containerType_andMigrateDataFrom_containsOneOrMoreSymlinks_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:");
}

id objc_msgSend_stageURL_toItemName_inStagingDir_stagingMode_settingUID_gid_hasSymlink_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageURL:toItemName:inStagingDir:stagingMode:settingUID:gid:hasSymlink:error:");
}

id objc_msgSend_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "stageURLByMoving:toItemName:inStagingDir:settingUID:gid:dataProtectionClass:breakHardlinks:hasSymlink:error:");
}

id objc_msgSend_standardizeOwnershipAtURL_toUID_GID_removeACLs_setProtectionClass_foundSymlink_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardizeOwnershipAtURL:toUID:GID:removeACLs:setProtectionClass:foundSymlink:error:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}