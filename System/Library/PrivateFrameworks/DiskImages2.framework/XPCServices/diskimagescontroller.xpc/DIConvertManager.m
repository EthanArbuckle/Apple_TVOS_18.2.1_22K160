@interface DIConvertManager
- (BOOL)runWithError:(id *)a3;
- (BOOL)validateFormatsWithDiskImage:(void *)a3 error:(id *)a4;
- (DIBaseParams)outputParams;
- (DIConvertManager)initWithParams:(id)a3;
- (DIConvertParams)convertParams;
- (unique_ptr<DiskImage,)convertWithDiskImage:(void *)a3 error:(id *)a4;
- (void)convertUserDataWithDiskImage:(void *)a3 destination:(void *)a4;
- (void)dealloc;
- (void)setConvertParams:(id)a3;
- (void)setOutputParams:(id)a3;
@end

@implementation DIConvertManager

- (DIConvertManager)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIConvertManager;
  v6 = -[DIConvertManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_convertParams, a3);
  }

  return v7;
}

- (DIBaseParams)outputParams
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
  if ([v3 inPlaceConversion])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 outputParams]);
  }

  return (DIBaseParams *)v4;
}

- (BOOL)validateFormatsWithDiskImage:(void *)a3 error:(id *)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
  unsigned int v8 = [v7 inPlaceConversion];

  if (!v8) {
    return 1;
  }
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
  unsigned __int8 v10 = +[DIConvertParams isUDIFWithFormat:]( DIConvertParams,  "isUDIFWithFormat:",  [v9 outputFormat]);

  if ((v10 & 1) == 0)
  {
    v13 = @"In-place conversion to this image format is not supported";
    return +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  v13,  a4);
  }

  if (!a3) {
    goto LABEL_13;
  }
  if (!v11)
  {
    if (v12 && !v12[152]) {
      goto LABEL_6;
    }
LABEL_13:
    v13 = @"In-place conversion from this image format is not supported";
    return +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  v13,  a4);
  }

  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  if (v12[153])
  {
LABEL_7:
    {
      v13 = @"Cannot convert in-place with a shadow file";
      return +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  v13,  a4);
    }

    return 1;
  }

  return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Cannot convert this image in-place, as it contains unordered UDIF runs",  a4);
}

- (unique_ptr<DiskImage,)convertWithDiskImage:(void *)a3 error:(id *)a4
{
  v259 = v4;
  *(void *)&__int128 v377 = sub_100062288(*(uint64_t (****)(void))a3);
  *((void *)&v377 + 1) = v7;
  if (!((unint64_t)v377 | v7))
  {
    *(void *)&__int128 v377 = sub_100120D7C();
    *((void *)&v377 + 1) = v8;
  }

  v260 = self;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
  unsigned int v10 = +[DIConvertParams isUDIFWithFormat:]( DIConvertParams,  "isUDIFWithFormat:",  [v9 outputFormat]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager outputParams](v260, "outputParams"));
    if ([v11 hasUnlockedBackend])
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager outputParams](v260, "outputParams"));
      v13 = v12;
      if (v12) {
        [v12 backend];
      }
      else {
        *(_OWORD *)v378 = 0uLL;
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager outputParams](v260, "outputParams"));
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 diskImageParamsXPC]);
      id v340 = [v42 blockSize];
      sub_100026CA4((uint64_t)v378, &v340, v298);
      __int128 v277 = v298[0];
      v298[0] = 0uLL;

      v43 = *(std::__shared_weak_count **)&v378[8];
      if (*(void *)&v378[8])
      {
        v44 = (unint64_t *)(*(void *)&v378[8] + 8LL);
        do
          unint64_t v45 = __ldaxr(v44);
        while (__stlxr(v45 - 1, v44));
        if (!v45)
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
      }
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager outputParams](v260, "outputParams"));
      v22 = v21;
      if (v21) {
        [v21 backend];
      }
      else {
        __int128 v277 = 0uLL;
      }
    }

    sub_10000A1B0(*(void *)a3, 1, 2, (uint64_t)v375);
    sub_1000131AC((uint64_t)v375, (uint64_t)"Could not get mapping information", (uint64_t)&v368);
    v46 = (uint64_t *)sub_10000A304((uint64_t)&v368);
    sub_1000147D8((uint64_t)&v361, v46);
    sub_10001321C((uint64_t)&v361, (uint64_t)v275);
    sub_1000EA2B8((uint64_t)v276, v275);
    uint64_t v47 = v275[0];
    v275[0] = 0LL;
    if (v47) {
      (*(void (**)(uint64_t))(*(void *)v47 + 24LL))(v47);
    }
    sub_1000132BC((uint64_t)&v361, (uint64_t)v273);
    sub_1000EA2B8((uint64_t)v274, v273);
    uint64_t v48 = v273[0];
    v273[0] = 0LL;
    if (v48) {
      (*(void (**)(uint64_t))(*(void *)v48 + 24LL))(v48);
    }
    sub_10001335C(v276, v274, (uint64_t)&v340);
    sub_10001335C(v276, v274, (uint64_t)&v338);
    sub_10000A0FC((uint64_t)&v368, (uint64_t)v298);
    uint64_t v49 = sub_10000A094(v298, (uint64_t)"Could not get media info");
    uint64_t v50 = (*(uint64_t (**)(void))(**(void **)a3 + 32LL))(*(void *)a3);
    __int128 v278 = v277;
    if (*((void *)&v277 + 1))
    {
      v51 = (unint64_t *)(*((void *)&v277 + 1) + 8LL);
      do
        unint64_t v52 = __ldxr(v51);
      while (__stxr(v52 + 1, v51));
    }

    sub_100026D98((uint64_t)v298, &v278, v50);
    *(void *)&v298[0] = off_1001729A8;
    id v304 = v340;
    __int128 v306 = 0u;
    __int128 v307 = 0u;
    __int128 v308 = 0u;
    uint64_t v305 = 850045863LL;
    uint64_t v309 = 0LL;
    int v310 = v343[4];
    v311 = v344;
    v312[0] = v345;
    v312[1] = v346;
    if (v346)
    {
      *(void *)(v345 + 16) = v312;
      v344 = &v345;
      uint64_t v345 = 0LL;
      uint64_t v346 = 0LL;
    }

    else
    {
      v311 = v312;
    }

    v312[2] = v347;
    __int128 v313 = v348;
    __int128 v314 = v349;
    int v315 = v350;
    uint64_t v53 = v351;
    uint64_t v347 = 0LL;
    uint64_t v351 = 0LL;
    uint64_t v316 = v53;
    __int128 v317 = v352;
    __int128 v318 = v353;
    int v319 = v354;
    uint64_t v54 = v355;
    uint64_t v355 = 0LL;
    uint64_t v320 = v54;
    __int128 v321 = v356;
    __int128 v322 = v357;
    int v323 = v358;
    uint64_t v324 = v359;
    char v325 = 0;
    char v326 = v360;
    v327 = (uint64_t *)&v304;
    uint64_t v330 = 0LL;
    v329 = 0LL;
    v328 = &v329;
    unint64_t v331 = 0LL;
    uint64_t v334 = 0LL;
    v333 = 0LL;
    v332 = &v333;
    sub_100019F4C(v335);
    v335[1] = 0;
    char v336 = 1;
    uint64_t v258 = v49;
    __int128 v337 = v377;
    v55 = *(void **)(v49 + 32);
    v261 = (void *)(v49 + 40);
    v257 = (uint64_t *)a3;
    if (v55 != (void *)(v49 + 40))
    {
      while (1)
      {
        v56 = v327;
        v57 = (char *)operator new(0x158uLL);
        v58 = v57;
        *((void *)v57 + 1) = 0LL;
        *((void *)v57 + 2) = 0LL;
        *(void *)v57 = off_1001751D8;
        v59 = v57 + 24;
        if (*((char *)v55 + 79) < 0)
        {
          sub_10000AD88(v57 + 24, (void *)v55[7], v55[8]);
        }

        else
        {
          __int128 v60 = *(_OWORD *)(v55 + 7);
          *((void *)v57 + 5) = v55[9];
          _OWORD *v59 = v60;
        }

        sub_100024644((uint64_t)(v58 + 48), v56, (uint64_t)(v55 + 4));
        __int128 v295 = *((_OWORD *)v55 + 2);
        uint64_t v296 = v55[6];
        *(void *)&__int128 v297 = v59;
        *((void *)&v297 + 1) = v58;
        unint64_t v61 = v55[4];
        unint64_t v62 = v55[5];
        int v63 = *((char *)v55 + 48);
        int v64 = *((unsigned __int8 *)v55 + 48);
        v279[0] = *(_DWORD *)((char *)v55 + 49);
        *(_DWORD *)((char *)v279 + 3) = *((_DWORD *)v55 + 13);
        if (v63)
        {
          if (v64 == 3)
          {
            if (v62 < v61) {
              goto LABEL_150;
            }
          }

          else if (v61 >= v62)
          {
            goto LABEL_150;
          }
        }

        else if (v61 >= v62 || v61 + 1 >= v62)
        {
          goto LABEL_150;
        }

        unsigned __int8 v65 = atomic_load((unsigned __int8 *)&qword_1001A4710);
        if ((v65 & 1) == 0 && __cxa_guard_acquire(&qword_1001A4710))
        {
          __cxa_atexit((void (*)(void *))sub_10001A1FC, &qword_1001A4700, (void *)&_mh_execute_header);
          __cxa_guard_release(&qword_1001A4710);
        }

        uint64_t v67 = qword_1001A4700;
        v66 = *(std::__shared_weak_count **)algn_1001A4708;
        if (*(void *)algn_1001A4708)
        {
          v68 = (unint64_t *)(*(void *)algn_1001A4708 + 8LL);
          do
            unint64_t v69 = __ldxr(v68);
          while (__stxr(v69 + 1, v68));
          uint64_t v70 = v297;
          do
            unint64_t v71 = __ldaxr(v68);
          while (__stlxr(v71 - 1, v68));
          if (!v71)
          {
            ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
            std::__shared_weak_count::__release_weak(v66);
          }
        }

        else
        {
          uint64_t v70 = v297;
        }

        if (v70 == v67) {
          goto LABEL_150;
        }
        v72 = (uint64_t **)sub_10000CB80((uint64_t)&v328, v266, (uint64_t)&v295);
        if (!*v72)
        {
          v102 = v72;
          v103 = (uint64_t *)operator new(0x48uLL);
          v104 = v103;
          *(void *)&v378[8] = &v329;
          *((_OWORD *)v103 + 2) = v295;
          uint64_t v105 = v297;
          v103[6] = v296;
          v103[7] = v105;
          uint64_t v106 = *((void *)&v297 + 1);
          v103[8] = *((void *)&v297 + 1);
          if (v106)
          {
            v107 = (unint64_t *)(v106 + 8);
            do
              unint64_t v108 = __ldxr(v107);
            while (__stxr(v108 + 1, v107));
          }

          v378[16] = 1;
          locale = v266[0].__locale_;
          uint64_t *v103 = 0LL;
          v103[1] = 0LL;
          v103[2] = (uint64_t)locale;
          *v102 = v103;
          if (*v328)
          {
            v328 = (uint64_t **)*v328;
            v104 = *v102;
          }

          sub_10000CC58(v329, v104);
          ++v330;
          *(void *)v378 = 0LL;
          sub_100026FB0((uint64_t)v378);
          goto LABEL_150;
        }

        v73 = v329;
        v74 = &v329;
        v75 = &v329;
        if (v329)
        {
          unint64_t v76 = (v64 & 2) != 0 ? v61 : v61 + 1;
          v75 = &v329;
          v77 = v329;
          do
          {
            unint64_t v78 = (v77[6] & 1) + v77[5] - 1;
            BOOL v79 = v78 >= v76;
            if (v78 >= v76) {
              v80 = v77;
            }
            else {
              v80 = v77 + 1;
            }
            if (v79) {
              v75 = (uint64_t **)v77;
            }
            v77 = (uint64_t *)*v80;
          }

          while (*v80);
          unint64_t v81 = (v63 & 1) + v62 - 1;
          v74 = &v329;
          do
          {
            unint64_t v82 = v73[4];
            if ((v73[6] & 2) == 0) {
              ++v82;
            }
            BOOL v83 = v81 >= v82;
            if (v81 >= v82) {
              v84 = v73 + 1;
            }
            else {
              v84 = v73;
            }
            if (!v83) {
              v74 = (uint64_t **)v73;
            }
            v73 = (uint64_t *)*v84;
          }

          while (*v84);
          v85 = *v74;
          if (*v74) {
            break;
          }
        }

        do
        {
          v86 = (uint64_t *)v74;
          v74 = (uint64_t **)v74[2];
        }

        while (*v74 == v86);
        v87 = v74[1];
        if (!v87) {
          goto LABEL_95;
        }
        do
        {
          v88 = (uint64_t **)v87;
          v87 = (uint64_t *)*v87;
        }

        while (v87);
LABEL_97:
        v90 = &v329;
        if (v328 != v75)
        {
          uint64_t v91 = (uint64_t)*v75;
          v92 = v75;
          if (*v75)
          {
            do
            {
              v90 = (uint64_t **)v91;
              uint64_t v91 = *(void *)(v91 + 8);
            }

            while (v91);
          }

          else
          {
            do
            {
              v90 = (uint64_t **)v92[2];
              BOOL v93 = *v90 == (uint64_t *)v92;
              v92 = v90;
            }

            while (v93);
          }
        }

        v294[0] = v279[0];
        *(_DWORD *)((char *)v294 + 3) = *(_DWORD *)((char *)v279 + 3);
        v266[0].__locale_ = (std::locale::__imp *)qword_1001A3B40;
        v266[1].__locale_ = (std::locale::__imp *)qword_1001A3B40;
        char v267 = 2;
        *(_OWORD *)cf = *((_OWORD *)v74 + 2);
        v292 = v74[6];
        if (v88 != v75)
        {
          while (1)
          {
            *(_OWORD *)&v266[0].__locale_ = *((_OWORD *)v75 + 2);
            char v267 = *((_BYTE *)v75 + 48);
            v288[0] = v61;
            v288[1] = v62;
            char v289 = v64;
            *(_DWORD *)v290 = v294[0];
            *(_DWORD *)&v290[3] = *(_DWORD *)((char *)v294 + 3);
            sub_10000D658(v288, (uint64_t)v266, (uint64_t)v378);
            if (v378[16])
            {
              v94 = (uint64_t *)v75;
              if (v378[16] == 3)
              {
                if (*(void *)&v378[8] >= *(void *)v378) {
                  goto LABEL_111;
                }
              }

              else if (*(void *)v378 < *(void *)&v378[8])
              {
LABEL_111:
                *(_DWORD *)&v378[17] = *(_DWORD *)v293;
                *(_DWORD *)&v378[20] = *(_DWORD *)&v293[3];
                __int128 v379 = v297;
                if (*((void *)&v297 + 1))
                {
                  v95 = (unint64_t *)(*((void *)&v297 + 1) + 8LL);
                  do
                    unint64_t v96 = __ldxr(v95);
                  while (__stxr(v96 + 1, v95));
                }

                v94 = sub_100026FF4((uint64_t **)&v328, (uint64_t)v90, (uint64_t)v378);
                v97 = (std::__shared_weak_count *)*((void *)&v379 + 1);
                if (*((void *)&v379 + 1))
                {
                  v98 = (unint64_t *)(*((void *)&v379 + 1) + 8LL);
                  do
                    unint64_t v99 = __ldaxr(v98);
                  while (__stlxr(v99 - 1, v98));
                  if (!v99)
                  {
                    ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
                    std::__shared_weak_count::__release_weak(v97);
                  }
                }
              }
            }

            else if (*(void *)v378 >= *(void *)&v378[8])
            {
              v94 = (uint64_t *)v75;
            }

            else
            {
              v94 = (uint64_t *)v75;
            }

            v285[0] = v61;
            v285[1] = v62;
            char v286 = v64;
            *(_DWORD *)v287 = v294[0];
            *(_DWORD *)&v287[3] = *(_DWORD *)((char *)v294 + 3);
            sub_10000D72C((uint64_t)v285, (uint64_t)v266, (uint64_t)v378);
            v100 = (uint64_t *)v94[1];
            v101 = v94;
            if (v100)
            {
              do
              {
                v75 = (uint64_t **)v100;
                v100 = (uint64_t *)*v100;
              }

              while (v100);
            }

            else
            {
              do
              {
                v75 = (uint64_t **)v101[2];
                BOOL v93 = *v75 == v101;
                v101 = (uint64_t *)v75;
              }

              while (!v93);
            }

            unint64_t v62 = *(void *)&v378[8];
            unint64_t v61 = *(void *)v378;
            v90 = (uint64_t **)v94;
            LOBYTE(v64) = v378[16];
            if (v75 == v88) {
              goto LABEL_134;
            }
          }
        }

        v94 = (uint64_t *)v90;
LABEL_134:
        v280[0] = v61;
        v280[1] = v62;
        char v281 = v64;
        *(_DWORD *)v282 = v294[0];
        *(_DWORD *)&v282[3] = *(_DWORD *)((char *)v294 + 3);
        sub_10000D72C((uint64_t)v280, (uint64_t)cf, (uint64_t)&v283);
        if ((_BYTE)v284)
        {
          if (v284 == 3)
          {
            goto LABEL_150;
          }

          unint64_t v110 = *((void *)&v283 + 1);
          unint64_t v111 = v283;
        }

        else
        {
          unint64_t v110 = *((void *)&v283 + 1);
          unint64_t v111 = v283 + 1;
        }

        if (v111 < v110)
        {
LABEL_142:
          *(_OWORD *)v378 = v283;
          *(void *)&v378[16] = v284;
          __int128 v379 = v297;
          if (*((void *)&v297 + 1))
          {
            v112 = (unint64_t *)(*((void *)&v297 + 1) + 8LL);
            do
              unint64_t v113 = __ldxr(v112);
            while (__stxr(v113 + 1, v112));
          }

          sub_100026FF4((uint64_t **)&v328, (uint64_t)v94, (uint64_t)v378);
          v114 = (std::__shared_weak_count *)*((void *)&v379 + 1);
          if (*((void *)&v379 + 1))
          {
            v115 = (unint64_t *)(*((void *)&v379 + 1) + 8LL);
            do
              unint64_t v116 = __ldaxr(v115);
            while (__stlxr(v116 - 1, v115));
            if (!v116)
            {
              ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
              std::__shared_weak_count::__release_weak(v114);
            }
          }
        }

- (void)convertUserDataWithDiskImage:(void *)a3 destination:(void *)a4
{
  int v7 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v17 = 0LL;
    uint64_t v8 = sub_1000BE278();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = 61;
    __int16 v19 = 2080;
    uint64_t v20 = "-[DIConvertManager convertUserDataWithDiskImage:destination:]";
    LODWORD(v16) = 18;
    v11 = (char *)_os_log_send_and_compose_impl( v10,  &v17,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%.*s: Converting user data",  (int)buf,  v16);

    if (v11)
    {
      fprintf(__stderrp, "%s\n", v11);
      free(v11);
    }
  }

  else
  {
    uint64_t v12 = sub_1000BE278();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 61;
      __int16 v19 = 2080;
      uint64_t v20 = "-[DIConvertManager convertUserDataWithDiskImage:destination:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Converting user data", buf, 0x12u);
    }
  }

  *__error() = v7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
  unsigned __int8 v15 = +[DIConvertParams isUDIFWithFormat:]( DIConvertParams,  "isUDIFWithFormat:",  [v14 outputFormat]);

  if ((v15 & 1) == 0)
  {
    (*(void (**)(uint8_t *__return_ptr))(**(void **)a3 + 104LL))(buf);
    if (CFDictionaryGetCount(*(CFDictionaryRef *)buf)) {
      (*(void (**)(void, void))(**(void **)a4 + 112LL))(*(void *)a4, *(void *)buf);
    }
    sub_10000D8A4((const void **)buf);
  }

- (BOOL)runWithError:(id *)a3
{
  uint64_t v50 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 diskImageParamsXPC]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager outputParams](self, "outputParams"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 shadowChain]);
  id v9 = [(id)v8 shouldValidate];
  if (v6)
  {
    [v6 createDiskImageWithCache:0 shadowValidation:v9];
    uint64_t v10 = *(void *)buf;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  *(void *)buf = 0LL;
  uint64_t v50 = v10;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager outputParams](self, "outputParams"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 diskImageParamsXPC]);
  LOBYTE(v8) = [v12 lockBackendsWithError:a3];

  if ((v8 & 1) == 0) {
    goto LABEL_23;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
  if ([v13 inPlaceConversion])
  {

    goto LABEL_8;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager convertParams](self, "convertParams"));
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 diskImageParamsXPC]);
  LOBYTE(v8) = [v15 lockBackendsWithError:a3];

  if ((v8 & 1) == 0)
  {
LABEL_23:
    LOBYTE(v8) = 0;
    int v27 = 1;
    goto LABEL_24;
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertManager outputParams](self, "outputParams"));
  v4 = v3;
  if (v3)
  {
    [v3 backend];
  }

  else
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
  }

  sub_10011EBCC((uint64_t)&v18, &lpsrc);
  id v5 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  if (lpsrc)
  {
    if (v8)
    {
      id v9 = v21;
      uint64_t v18 = v8;
      uint64_t v19 = v21;
      if (v21)
      {
        uint64_t v10 = (unint64_t *)&v21->__shared_owners_;
        do
          unint64_t v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }

      (*(void (**)(void *))(*(void *)v8 + 8LL))(v8);
      if (v9)
      {
        uint64_t v12 = (unint64_t *)&v9->__shared_owners_;
        do
          unint64_t v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
  }

  v14 = v21;
  if (v21)
  {
    unsigned __int8 v15 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DIConvertManager;
  -[DIConvertManager dealloc](&v17, "dealloc");
}

- (DIConvertParams)convertParams
{
  return self->_convertParams;
}

- (void)setConvertParams:(id)a3
{
}

- (void)setOutputParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end