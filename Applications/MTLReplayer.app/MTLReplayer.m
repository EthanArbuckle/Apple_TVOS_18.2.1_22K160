void sub_100004930(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t Metadata;
  void *TexturePlane;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  CFDataRef v12;
  void *v13;
  uint64_t v14;
  size_t v15;
  CGDataProvider *v16;
  uint64_t v17;
  size_t v18;
  size_t v19;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v21;
  CGBitmapInfo v22;
  CGImage *v23;
  UIImage *v24;
  NSData *v25;
  void *v26;
  __int128 v27;
  id v28;
  v28 = a2;
  v3 = a1;
  v4 = [v3 bytes];
  v5 = [v3 length];

  Metadata = GTHarvesterGetMetadata(v4, v5);
  if (GTHarvesterGetTexturePlaneCount() == 1)
  {
    TexturePlane = (void *)GTHarvesterGetTexturePlane(Metadata, 0LL);
    v8 = *TexturePlane - 30LL;
    v9 = v8 > 0x3E;
    v10 = (1LL << v8) & 0x5000000840800001LL;
    if (v9 || v10 == 0)
    {
      v13 = TexturePlane;
      v12 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  GTHarvesterGetData(v4, v5),  TexturePlane[5],  0LL);
      v14 = *v13;
      v27 = *(_OWORD *)(v13 + 1);
      v15 = v13[4];
      v16 = CGDataProviderCreateWithCFData(v12);
      v17 = 5LL;
      v18 = 4LL;
      switch(v14)
      {
        case 1LL:
        case 2LL:
        case 3LL:
        case 4LL:
        case 5LL:
        case 6LL:
        case 7LL:
        case 8LL:
        case 9LL:
        case 10LL:
        case 11LL:
        case 12LL:
        case 13LL:
        case 14LL:
        case 15LL:
        case 16LL:
        case 17LL:
        case 18LL:
        case 19LL:
        case 21LL:
        case 26LL:
        case 27LL:
        case 28LL:
        case 29LL:
        case 30LL:
        case 31LL:
        case 32LL:
        case 33LL:
        case 34LL:
        case 35LL:
        case 36LL:
        case 37LL:
        case 38LL:
        case 39LL:
        case 44LL:
        case 45LL:
        case 46LL:
        case 47LL:
        case 48LL:
        case 49LL:
        case 50LL:
        case 51LL:
        case 52LL:
        case 56LL:
        case 57LL:
        case 58LL:
        case 59LL:
        case 61LL:
        case 66LL:
        case 67LL:
        case 68LL:
        case 69LL:
        case 70LL:
        case 71LL:
        case 72LL:
        case 73LL:
        case 74LL:
        case 75LL:
        case 76LL:
        case 77LL:
        case 78LL:
        case 79LL:
        case 80LL:
        case 81LL:
        case 82LL:
        case 83LL:
        case 84LL:
        case 85LL:
        case 86LL:
        case 87LL:
        case 88LL:
        case 89LL:
        case 95LL:
        case 96LL:
        case 97LL:
        case 98LL:
        case 99LL:
        case 100LL:
        case 101LL:
        case 102LL:
        case 106LL:
        case 107LL:
        case 108LL:
        case 109LL:
        case 111LL:
        case 116LL:
        case 117LL:
        case 118LL:
        case 119LL:
        case 120LL:
        case 121LL:
        case 122LL:
          goto LABEL_10;
        case 20LL:
        case 22LL:
        case 23LL:
        case 24LL:
        case 25LL:
        case 60LL:
        case 62LL:
        case 63LL:
        case 64LL:
        case 65LL:
        case 110LL:
        case 112LL:
        case 113LL:
        case 114LL:
        case 115LL:
          v17 = 16LL;
          goto LABEL_15;
        case 40LL:
        case 41LL:
        case 43LL:
          goto LABEL_15;
        case 42LL:
LABEL_18:
          v19 = 16LL;
          goto LABEL_24;
        case 53LL:
        case 54LL:
        case 55LL:
        case 103LL:
        case 104LL:
        case 105LL:
        case 123LL:
        case 124LL:
        case 125LL:
          goto LABEL_14;
        case 90LL:
        case 91LL:
        case 92LL:
        case 93LL:
        case 94LL:
          v17 = 10LL;
          goto LABEL_15;
        default:
          if (v14 == 252) {
LABEL_14:
          }
            v17 = 32LL;
          else {
LABEL_10:
          }
            v17 = 8LL;
LABEL_15:
          v18 = v17;
          v19 = 8LL;
          if (v14 > 251)
          {
            if ((unint64_t)(v14 - 552) < 2)
            {
LABEL_22:
              v19 = 64LL;
            }

            else if (v14 != 253)
            {
LABEL_17:
              v19 = 32LL;
            }
          }

          else
          {
            switch(v14)
            {
              case 1LL:
              case 10LL:
              case 11LL:
              case 12LL:
              case 13LL:
              case 14LL:
                break;
              case 20LL:
              case 22LL:
              case 23LL:
              case 24LL:
              case 25LL:
              case 30LL:
              case 31LL:
              case 32LL:
              case 33LL:
              case 34LL:
              case 40LL:
              case 41LL:
              case 42LL:
              case 43LL:
                goto LABEL_18;
              case 103LL:
              case 104LL:
              case 105LL:
              case 110LL:
              case 112LL:
              case 113LL:
              case 114LL:
              case 115LL:
                goto LABEL_22;
              case 123LL:
              case 124LL:
              case 125LL:
                v19 = 128LL;
                break;
              default:
                goto LABEL_17;
            }
          }

LABEL_24:
          if (v14 == 71) {
            goto LABEL_30;
          }
LABEL_27:
          if ((unint64_t)(v14 - 252) >= 2)
          {
            if (v14 == 81) {
LABEL_30:
            }
              DeviceRGB = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
            else {
              DeviceRGB = CGColorSpaceCreateDeviceRGB();
            }
          }

          else
          {
LABEL_28:
            DeviceRGB = CGColorSpaceCreateDeviceGray();
          }

          v21 = DeviceRGB;
          v22 = 7;
          switch(v14)
          {
            case 1LL:
              goto LABEL_47;
            case 2LL:
            case 3LL:
            case 4LL:
            case 5LL:
            case 6LL:
            case 7LL:
            case 8LL:
            case 9LL:
            case 10LL:
            case 11LL:
            case 12LL:
            case 13LL:
            case 14LL:
            case 15LL:
            case 16LL:
            case 17LL:
            case 18LL:
            case 19LL:
            case 21LL:
            case 26LL:
            case 27LL:
            case 28LL:
            case 29LL:
            case 30LL:
            case 31LL:
            case 32LL:
            case 33LL:
            case 34LL:
            case 35LL:
            case 36LL:
            case 37LL:
            case 38LL:
            case 39LL:
            case 44LL:
            case 45LL:
            case 46LL:
            case 47LL:
            case 48LL:
            case 49LL:
            case 50LL:
            case 51LL:
            case 52LL:
            case 56LL:
            case 57LL:
            case 58LL:
            case 59LL:
            case 61LL:
            case 66LL:
            case 67LL:
            case 68LL:
            case 69LL:
            case 75LL:
            case 76LL:
            case 77LL:
            case 78LL:
            case 79LL:
            case 82LL:
            case 83LL:
            case 84LL:
            case 85LL:
            case 86LL:
            case 87LL:
            case 88LL:
            case 89LL:
            case 95LL:
            case 96LL:
            case 97LL:
            case 98LL:
            case 99LL:
            case 100LL:
            case 101LL:
            case 102LL:
            case 106LL:
            case 107LL:
            case 108LL:
            case 109LL:
            case 111LL:
            case 116LL:
            case 117LL:
            case 118LL:
            case 119LL:
            case 120LL:
            case 121LL:
            case 122LL:
              goto LABEL_33;
            case 20LL:
            case 22LL:
            case 23LL:
            case 24LL:
            case 40LL:
            case 60LL:
            case 62LL:
            case 63LL:
            case 64LL:
              v22 = 4096;
              goto LABEL_47;
            case 25LL:
            case 65LL:
              v22 = 4352;
              goto LABEL_47;
            case 41LL:
            case 42LL:
              v22 = 4100;
              goto LABEL_47;
            case 43LL:
            case 110LL:
            case 112LL:
            case 113LL:
            case 114LL:
              v22 = 4099;
              goto LABEL_47;
            case 53LL:
            case 54LL:
            case 103LL:
            case 104LL:
              goto LABEL_39;
            case 55LL:
            case 92LL:
            case 93LL:
            case 105LL:
            case 123LL:
            case 124LL:
              v22 = 8448;
              goto LABEL_47;
            case 70LL:
            case 71LL:
            case 72LL:
            case 73LL:
            case 74LL:
              v22 = 3;
              goto LABEL_47;
            case 80LL:
            case 81LL:
              v22 = 8196;
              goto LABEL_47;
            case 90LL:
            case 91LL:
              v22 = 204803;
              goto LABEL_47;
            case 94LL:
              v22 = 16387;
              goto LABEL_47;
            case 115LL:
              v22 = 4355;
              goto LABEL_47;
            case 125LL:
              v22 = 8451;
              goto LABEL_47;
            default:
              if (v14 == 252) {
LABEL_39:
              }
                v22 = 0x2000;
              else {
LABEL_33:
              }
                v22 = 0;
LABEL_47:
              v23 = CGImageCreate( v27,  *((size_t *)&v27 + 1),  v18,  v19,  v15,  DeviceRGB,  v22,  v16,  0LL,  1,  kCGRenderingIntentDefault);
              CGColorSpaceRelease(v21);
              CGDataProviderRelease(v16);
              v24 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](&OBJC_CLASS___UIImage, "imageWithCGImage:", v23));
              v25 = UIImagePNGRepresentation(v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

              [v26 writeToURL:v28 atomically:0];
              CGImageRelease(v23);

              break;
          }

          break;
      }
    }

    else
    {
      v12 = (const __CFData *)objc_claimAutoreleasedReturnValue([v28 path]);
      NSLog(@"SaveTexture Can't handle floating point textures: url:%@", v12);
    }
  }
}

uint64_t start(int a1, uint64_t a2)
{
  v4 = objc_autoreleasePoolPush();
  if (off_100012240 == &_os_log_default)
  {
    os_log_t v7 = os_log_create("com.apple.gputools.MTLReplayer", (const char *)&unk_10000A94B);
    v8 = off_100012240;
    off_100012240 = v7;

    qword_100012278 = (uint64_t)calloc(0LL, 0x20uLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v10 = [v9 BOOLForKey:@"GPUToolsPerfLogging"];

    if (v10)
    {
      os_log_t v11 = os_log_create("com.apple.gputools.MTLReplayer", (const char *)&unk_10000A94B);
      v12 = off_100012238;
      off_100012238 = v11;
    }
  }

  else
  {
    id v5 = sub_100006EBC();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "Log already initialized, did you call GTCoreLogInit twice?";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "warning: %s", (uint8_t *)&buf, 0xCu);
    }
  }

  v13 = (os_log_s *)off_100012238;
  if (os_signpost_enabled((os_log_t)off_100012238))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Replayer-1-serial",  "MTLReplayer main() inited!",  (uint8_t *)&buf,  2u);
  }

  if (dword_100012268++) {
    goto LABEL_10;
  }
  if (byte_100012250++)
  {
LABEL_15:
    goto LABEL_10;
  }

  qword_100012258 = 0LL;
  vm_address_t v27 = sub_10000685C(0xC8uLL);
  if (!v27)
  {
LABEL_29:
    byte_100012250 = 0;
    goto LABEL_10;
  }

  *(_OWORD *)vm_address_t v27 = 0u;
  *(_OWORD *)(v27 + 16) = 0u;
  *(void *)(v27 + 192) = 0LL;
  *(_OWORD *)(v27 + 160) = 0u;
  *(_OWORD *)(v27 + 176) = 0u;
  *(_OWORD *)(v27 + 128) = 0u;
  *(_OWORD *)(v27 + 144) = 0u;
  *(_OWORD *)(v27 + 96) = 0u;
  *(_OWORD *)(v27 + 112) = 0u;
  *(_OWORD *)(v27 + 64) = 0u;
  *(_OWORD *)(v27 + 80) = 0u;
  *(_OWORD *)(v27 + 32) = 0u;
  *(_OWORD *)(v27 + 48) = 0u;
  qword_100012258 = v27;
  *(int64x2_t *)(v27 + 8) = vdupq_n_s64(0x8000uLL);
  if (sub_100006BA4((uint64_t **)&qword_100012260, (unint64_t *)v27))
  {
    uint64_t v28 = 0LL;
    vm_address_t v29 = qword_100012258;
    do
    {
      vm_address_t v30 = v29 + 8 * v28;
      vm_address_t v33 = *(void *)(v30 + 40);
      v32 = (vm_address_t *)(v30 + 40);
      vm_address_t v31 = v33;
      if (v33)
      {
        do
        {
          vm_address_t *v32 = *(void *)v31;
          vm_deallocate(mach_task_self_, v31, ((*(_DWORD *)(v31 + 16) << 12) + 4096));
          vm_address_t v31 = *v32;
        }

        while (*v32);
      }

      ++v28;
    }

    while (v28 != 20);
    vm_deallocate(mach_task_self_, v29, 0xC8uLL);
    qword_100012258 = 0LL;
    goto LABEL_29;
  }

  v53 = (void *)qword_100012260;
  *(void *)(qword_100012260 + 80) = "apr_global_pool";
  if (qword_100012248)
  {
LABEL_115:
    uint64_t v55 = qword_100012258;
    uint64_t v56 = qword_100012260;
    *(void *)(qword_100012258 + 24) = buf;
    *(void *)(v55 + 32) = v56;
    goto LABEL_15;
  }

  qword_100012248 = sub_100006CA0((uint64_t)v53, 0x38uLL);
  sub_100006DC4(v53, qword_100012248, (uint64_t)sub_1000069EC);
  uint64_t v54 = 0LL;
  while (!sub_100006E34((void *)(qword_100012248 + v54), (uint64_t)v53))
  {
    v54 += 8LL;
    if (v54 == 56)
    {
      v53 = (void *)qword_100012260;
      goto LABEL_115;
    }
  }

LABEL_10:
  sub_100006BA4(&v58, 0LL);
  GTMTLReplayController_init(v58);
  if (a1 >= 2 && (uint64_t v15 = a2 + 8, !strcmp("-CLI", *(const char **)(a2 + 8))))
  {
    *(void *)(a2 + 8) = *(void *)a2;
    if (a1 > 2)
    {
      int v34 = a1 - 1;
      uint64_t v57 = *(void *)(a2 + 16);
      __int128 v68 = xmmword_10000C3C8;
      __int128 v69 = unk_10000C3D8;
      __int128 v70 = xmmword_10000C3E8;
      __int128 v71 = unk_10000C3F8;
      __int128 v64 = xmmword_10000C388;
      __int128 v65 = unk_10000C398;
      __int128 v66 = xmmword_10000C3A8;
      __int128 v67 = unk_10000C3B8;
      __int128 buf = xmmword_10000C348;
      __int128 v61 = *(_OWORD *)algn_10000C358;
      __int128 v62 = xmmword_10000C368;
      __int128 v63 = *(_OWORD *)&off_10000C378;
      if (v34 != 2)
      {
        int v35 = 2;
        while (1)
        {
          uint64_t v36 = 0LL;
          uint64_t v37 = v35;
          v38 = *(const char **)(v15 + 8LL * v35);
          v39 = (const char **)&off_10000C408;
          while (strcmp(v38, *v39))
          {
            ++v36;
            v39 += 2;
            if (v36 == 61)
            {
LABEL_36:
              v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown token: %s",  v38));
              v41 = __stdoutp;
              if (g_runningInCI) {
                v42 = "#CI_ERROR# ";
              }
              else {
                v42 = (const char *)&unk_10000A94B;
              }
              id v43 = v40;
              fprintf( v41,  "%s%s %u: %s\n",  v42,  "void ParseArguments(GTMTLReplayCLIOptions *, int, const char **)",  451,  (const char *)[v43 UTF8String]);
              id v44 = v43;
              GTMTLReplay_handleError( 101,  [v44 UTF8String],  "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/GTMTLReplay_mainCLI.m",  "ParseArguments",  451,  1);

              goto LABEL_99;
            }
          }

          switch(LODWORD((&off_10000C408)[2 * v36 + 1]))
          {
            case 1:
              int v45 = DWORD2(v71) | 0x8000;
              goto LABEL_98;
            case 2:
            case 0x17:
              goto LABEL_99;
            case 3:
            case 0x1F:
              int v45 = DWORD2(v71) | 0x200;
              goto LABEL_98;
            case 4:
              ++v35;
              *((void *)&buf + 1) = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 5:
              ++v35;
              *(void *)&__int128 buf = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 6:
              ++v35;
              int v46 = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              if (v46 <= 1) {
                int v47 = 1;
              }
              else {
                int v47 = v46;
              }
              DWORD2(v61) = v47;
              goto LABEL_99;
            case 7:
              BYTE4(v62) = 1;
              goto LABEL_99;
            case 8:
              int v45 = DWORD2(v71) | 0x100;
              goto LABEL_98;
            case 9:
              ++v35;
              *(void *)&__int128 v61 = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0xA:
              ++v35;
              HIDWORD(v61) = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0xB:
              ++v35;
              LODWORD(v62) = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0xC:
              BYTE5(v62) = 1;
              goto LABEL_99;
            case 0xD:
              ++v35;
              *((void *)&v62 + 1) = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0xE:
              ++v35;
              *(void *)&__int128 v63 = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0xF:
              ++v35;
              sscanf(*(const char **)(v15 + 8 * (v37 + 1)), "%llu:%llu", (char *)&v70 + 8, &v71);
              goto LABEL_99;
            case 0x10:
              int v45 = DWORD2(v71) | 1;
              goto LABEL_98;
            case 0x11:
              int v45 = DWORD2(v71) | 2;
              goto LABEL_98;
            case 0x12:
              int v45 = DWORD2(v71) | 4;
              goto LABEL_98;
            case 0x13:
              ++v35;
              HIDWORD(v69) = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0x14:
              ++v35;
              LODWORD(v70) = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0x15:
              int v45 = DWORD2(v71) | 8;
              goto LABEL_98;
            case 0x16:
              int v45 = DWORD2(v71) | 0x40;
              goto LABEL_98;
            case 0x18:
              ++v35;
              *((void *)&v64 + 1) = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x19:
              int v48 = DWORD2(v71) | 0x800;
              goto LABEL_69;
            case 0x1A:
              int v45 = DWORD2(v71) | 0x80;
              goto LABEL_98;
            case 0x1B:
              int v48 = DWORD2(v71) | 0x100;
LABEL_69:
              DWORD2(v71) = v48;
              ++v35;
              *(void *)&__int128 v66 = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x1C:
              DWORD2(v71) |= 0x2000u;
              ++v35;
              *((void *)&v66 + 1) = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x1D:
              ++v35;
              *(void *)&__int128 v67 = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x1E:
              ++v35;
              *((void *)&v67 + 1) = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x20:
              ++v35;
              *((void *)&v63 + 1) = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x21:
              ++v35;
              *(void *)&__int128 v64 = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x22:
              int v45 = DWORD2(v71) | 0x1000;
              goto LABEL_98;
            case 0x23:
              DWORD2(v71) |= 0x80u;
              ++v35;
              *(void *)&__int128 v65 = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x24:
              DWORD2(v71) |= 0x4000u;
              ++v35;
              *(void *)&__int128 v68 = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x25:
              int v45 = DWORD2(v71) | 0x10000;
              goto LABEL_98;
            case 0x26:
              int v45 = DWORD2(v71) | 0x20000;
              goto LABEL_98;
            case 0x27:
              g_runningInCI = 1;
              goto LABEL_99;
            case 0x28:
              g_runningValidationCI = 1;
              goto LABEL_99;
            case 0x29:
              ++v35;
              goto LABEL_99;
            case 0x2A:
              int v45 = DWORD2(v71) | 0x40000;
              goto LABEL_98;
            case 0x2B:
              int v45 = DWORD2(v71) | 0x10;
              goto LABEL_98;
            case 0x2C:
              int v45 = DWORD2(v71) | 0x80000;
              goto LABEL_98;
            case 0x2D:
              int v45 = DWORD2(v71) | 0x100000;
              goto LABEL_98;
            case 0x2E:
              int v45 = DWORD2(v71) | 0x200000;
              goto LABEL_98;
            case 0x30:
              DWORD2(v71) |= 0x400000u;
              uint64_t v49 = v35 + 1LL;
              v50 = *(const char **)(v15 + 8 * v49);
              if (!v50 || *v50 == 45)
              {
                DWORD1(v70) = -1;
                goto LABEL_99;
              }

              if (!strcmp(*(const char **)(v15 + 8 * v49), "max"))
              {
                int v52 = 2;
LABEL_107:
                DWORD1(v70) = v52;
                goto LABEL_108;
              }

              if (!strcmp(v50, "med"))
              {
                int v52 = 1;
                goto LABEL_107;
              }

              if (!strcmp(v50, "min")) {
                DWORD1(v70) = 0;
              }
              else {
                DWORD1(v70) = atoi(v50);
              }
LABEL_108:
              ++v35;
LABEL_99:
              if (++v35 >= v34) {
                goto LABEL_31;
              }
              break;
            case 0x31:
              DWORD2(v71) |= 0x1000000u;
              ++v35;
              *((void *)&v68 + 1) = *(void *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x32:
              int v51 = DWORD2(v71) | 0x2000000;
              goto LABEL_94;
            case 0x33:
              int v51 = DWORD2(v71) | 0x4000000;
LABEL_94:
              DWORD2(v71) = v51;
              DWORD2(v69) = atoi(*(const char **)(v15 + 8LL * v35 + 8));
              v35 += 2;
              *(void *)&__int128 v69 = *(void *)(v15 + 8 * (v37 + 2));
              goto LABEL_99;
            case 0x34:
              int v45 = DWORD2(v71) | 0x800000;
              goto LABEL_98;
            case 0x35:
              int v45 = DWORD2(v71) | 0x20;
LABEL_98:
              DWORD2(v71) = v45;
              goto LABEL_99;
            default:
              goto LABEL_36;
          }
        }
      }

LABEL_31:
      v59[8] = v68;
      v59[9] = v69;
      v59[10] = v70;
      v59[11] = v71;
      v59[4] = v64;
      v59[5] = v65;
      v59[6] = v66;
      v59[7] = v67;
      v59[0] = buf;
      v59[1] = v61;
      v59[2] = v62;
      v59[3] = v63;
      uint64_t v19 = GTMTLReplay_CLI(v57, v59, sub_100004930);
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid command-line arguments (usage: MTLReplayer archivePath [options])"));
      v23 = __stdoutp;
      if (g_runningInCI) {
        v24 = "#CI_ERROR# ";
      }
      else {
        v24 = (const char *)&unk_10000A94B;
      }
      id v25 = v22;
      fprintf( v23,  "%s%s %u: %s\n",  v24,  "int GTMTLReplayCLI_main(int, const char **)",  462,  (const char *)[v25 UTF8String]);
      id v26 = v25;
      uint64_t v19 = 1LL;
      GTMTLReplay_handleError( 101,  [v26 UTF8String],  "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/GTMTLReplay_mainCLI.m",  "GTMTLReplayCLI_main",  462,  1);
    }
  }

  else
  {
    v16 = (objc_class *)objc_opt_class(&OBJC_CLASS___ReplayerAppDelegate);
    v17 = NSStringFromClass(v16);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = UIApplicationMain(a1, (char **)a2, 0LL, v18);
  }

  objc_autoreleasePoolPop(v4);
  return v19;
}
}

id sub_10000683C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOrientation:*(void *)(a1 + 40)];
}

id sub_100006848(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsUpdateOfSupportedInterfaceOrientations];
}

id sub_100006850(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDevice:*(void *)(a1 + 40)];
}

vm_address_t sub_10000685C(memory_object_size_t a1)
{
  kern_return_t memory_entry_64;
  mach_error_t v3;
  os_log_s *v4;
  char *v5;
  const char *v6;
  kern_return_t v7;
  mach_error_t v8;
  char *v10;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v15;
  __int16 v16;
  char *v17;
  address = 0LL;
  size = a1;
  memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0LL, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    v3 = memory_entry_64;
    v4 = (os_log_s *)sub_100006EBC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = mach_error_string(v3);
      *(_DWORD *)__int128 buf = 67109378;
      uint64_t v15 = v3;
      v16 = 2080;
      v17 = v5;
      v6 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
    }
  }

  else
  {
    os_log_t v7 = vm_map(mach_task_self_, &address, a1, 0LL, 1, object_handle, 0LL, 0, 3, 3, 1u);
    if (!v7)
    {
      mach_port_deallocate(mach_task_self_, object_handle);
      return address;
    }

    v8 = v7;
    v4 = (os_log_s *)sub_100006EBC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = mach_error_string(v8);
      *(_DWORD *)__int128 buf = 67109378;
      uint64_t v15 = v8;
      v16 = 2080;
      v17 = v10;
      v6 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_10;
    }
  }

  return 0LL;
}

uint64_t sub_1000069EC(uint64_t a1)
{
  if (qword_100012248 == a1) {
    qword_100012248 = 0LL;
  }
  return 0LL;
}

void *sub_100006A08(unint64_t *a1, unint64_t a2)
{
  v2 = 0LL;
  unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000LL;
  unint64_t v4 = 0x2000LL;
  if (v3 > 0x2000) {
    unint64_t v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000LL;
  }
  if (v3 >= a2) {
    memory_object_size_t v5 = v4;
  }
  else {
    memory_object_size_t v5 = 0LL;
  }
  if (v3 < a2) {
    return v2;
  }
  unint64_t v7 = *a1;
  if (*a1)
  {
    unint64_t v8 = a1[3];
    if (v8)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v8 + 8));
      unint64_t v7 = *a1;
    }

    v9 = a1 + 6;
    v2 = (void *)a1[6];
    BOOL v10 = v2 == 0LL;
    BOOL v11 = v7 > 1;
    if (!v2 && v7 >= 2)
    {
      unint64_t v12 = 2LL;
      do
      {
        v13 = (void *)v9[1];
        ++v9;
        v2 = v13;
        BOOL v10 = v13 == 0LL;
        BOOL v11 = v12 < v7;
        if (v13) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v12 >= v7;
        }
        ++v12;
      }

      while (!v14);
    }

    if (!v10)
    {
      uint64_t v21 = *v2;
      void *v9 = *v2;
      if (v21) {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        v22 = v9 - 1;
        do
        {
          if (*v22--) {
            BOOL v24 = 1;
          }
          else {
            BOOL v24 = v7 == 1;
          }
          --v7;
        }

        while (!v24);
        *a1 = v7;
      }

      uint64_t v19 = (*((_DWORD *)v2 + 4) + 1);
LABEL_40:
      unint64_t v25 = a1[2] + v19;
      if (v25 >= a1[1]) {
        unint64_t v25 = a1[1];
      }
      a1[2] = v25;
      unint64_t v26 = a1[3];
      if (v26) {
        pthread_mutex_unlock((pthread_mutex_t *)(v26 + 8));
      }
      goto LABEL_44;
    }
  }

  else
  {
    v2 = a1 + 5;
    if (!a1[5]) {
      goto LABEL_27;
    }
    unint64_t v16 = a1[3];
    if (v16) {
      pthread_mutex_lock((pthread_mutex_t *)(v16 + 8));
    }
    while (1)
    {
      v17 = v2;
      v2 = (void *)*v2;
      if (!v2) {
        break;
      }
      int v18 = *((_DWORD *)v2 + 4);
      if (v18)
      {
        void *v17 = *v2;
        uint64_t v19 = (v18 + 1);
        goto LABEL_40;
      }
    }
  }

  unint64_t v15 = a1[3];
  if (v15) {
    pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
  }
LABEL_27:
  vm_address_t v20 = sub_10000685C(v5);
  v2 = (void *)v20;
  if (v20)
  {
    *(_DWORD *)(v20 + 16) = 1;
    *(void *)(v20 + 32) = v20 + v5;
LABEL_44:
    void *v2 = 0LL;
    v2[3] = v2 + 5;
  }

  return v2;
}

uint64_t sub_100006BA4(uint64_t **a1, unint64_t *a2)
{
  v2 = a2;
  *a1 = 0LL;
  uint64_t v4 = qword_100012260;
  if (qword_100012260)
  {
    memory_object_size_t v5 = *(void (**)(uint64_t))(qword_100012260 + 64);
    if (a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  memory_object_size_t v5 = 0LL;
  if (!a2) {
LABEL_3:
  }
    v2 = *(unint64_t **)(qword_100012260 + 48);
LABEL_4:
  v6 = sub_100006A08(v2, 0x1FD8uLL);
  if (v6)
  {
    void *v6 = v6;
    v6[1] = v6;
    unint64_t v7 = (uint64_t *)v6[3];
    v6[3] = v7 + 15;
    v7[12] = (uint64_t)v6;
    v7[13] = (uint64_t)(v7 + 15);
    v7[14] = 0LL;
    v7[6] = (uint64_t)v2;
    v7[7] = 0LL;
    v7[4] = 0LL;
    v7[5] = 0LL;
    v7[10] = 0LL;
    v7[11] = (uint64_t)v6;
    v7[8] = (uint64_t)v5;
    v7[9] = 0LL;
    *unint64_t v7 = v4;
    v7[1] = 0LL;
    if (v4)
    {
      uint64_t v8 = *(void *)(*(void *)(v4 + 48) + 24LL);
      if (v8) {
        pthread_mutex_lock((pthread_mutex_t *)(v8 + 8));
      }
      uint64_t v11 = *(void *)(v4 + 8);
      BOOL v10 = (uint64_t **)(v4 + 8);
      uint64_t v9 = v11;
      v7[2] = v11;
      if (v11) {
        *(void *)(v9 + 24) = v7 + 2;
      }
      *BOOL v10 = v7;
      v7[3] = (uint64_t)v10;
      if (v8) {
        pthread_mutex_unlock((pthread_mutex_t *)(v8 + 8));
      }
    }

    else
    {
      v7[2] = 0LL;
      v7[3] = 0LL;
    }

    uint64_t v12 = 0LL;
    *a1 = v7;
  }

  else
  {
    uint64_t v12 = 12LL;
    if (v5) {
      v5(12LL);
    }
  }

  return v12;
}

uint64_t sub_100006CA0(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  if (v3 < a2)
  {
LABEL_2:
    uint64_t v4 = *(void (**)(uint64_t))(a1 + 64);
    if (v4) {
      v4(12LL);
    }
    return 0LL;
  }

  v6 = *(void **)(a1 + 88);
  uint64_t result = v6[3];
  if (v3 <= v6[4] - result)
  {
    v6[3] = result + v3;
    return result;
  }

  unint64_t v7 = (void *)*v6;
  if (v3 <= *(void *)(*v6 + 32LL) - *(void *)(*v6 + 24LL))
  {
    *(void *)v7[1] = *v7;
    *(void *)(*v7 + 8LL) = v7[1];
  }

  else
  {
    unint64_t v7 = sub_100006A08(*(unint64_t **)(a1 + 48), (a2 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    if (!v7) {
      goto LABEL_2;
    }
  }

  *((_DWORD *)v7 + 5) = 0;
  uint64_t result = v7[3];
  v7[3] = result + v3;
  uint64_t v8 = (void *)v6[1];
  v7[1] = v8;
  void *v8 = v7;
  *unint64_t v7 = v6;
  v6[1] = v7;
  *(void *)(a1 + 88) = v7;
  unint64_t v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20LL))
  {
    BOOL v10 = (uint64_t *)*v6;
    do
      BOOL v10 = (uint64_t *)*v10;
    while (*((_DWORD *)v10 + 5) > v9);
    *unint64_t v7 = *v6;
    *(void *)(*v6 + 8LL) = v6[1];
    uint64_t v11 = (void *)v10[1];
    v6[1] = v11;
    *uint64_t v11 = v6;
    void *v6 = v10;
    v10[1] = (uint64_t)v6;
  }

  return result;
}

void *sub_100006DC4(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    uint64_t result = (void *)result[5];
    if (result) {
      *(void *)(v5 + 40) = *result;
    }
    else {
      uint64_t result = (void *)sub_100006CA0(v5, 0x20uLL);
    }
    result[2] = a3;
    result[3] = sub_100006E2C;
    *uint64_t result = *(void *)(v5 + 32);
    result[1] = a2;
    *(void *)(v5 + 32) = result;
  }

  return result;
}

uint64_t sub_100006E2C()
{
  return 0LL;
}

uint64_t sub_100006E34(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100006CA0(a2, 0x48uLL);
  uint64_t v5 = (void **)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 8) = 0u;
  }

  *(void *)uint64_t v4 = a2;
  uint64_t result = pthread_mutex_init((pthread_mutex_t *)(v4 + 8), 0LL);
  if (!(_DWORD)result)
  {
    sub_100006DC4(*v5, (uint64_t)v5, (uint64_t)sub_100006EB4);
    uint64_t result = 0LL;
    *a1 = v5;
  }

  return result;
}

uint64_t sub_100006EB4(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

id sub_100006EBC()
{
  v0 = off_100012240;
  if (off_100012240 == &_os_log_default)
  {
    if (qword_100012270 != -1) {
      dispatch_once(&qword_100012270, &stru_10000C870);
    }
    v0 = off_100012240;
  }

  return v0;
}

void sub_100006F18(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead",  v1,  2u);
  }

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}