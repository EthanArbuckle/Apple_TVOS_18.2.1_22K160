@interface LSCopyOrMoveFileResource
@end

@implementation LSCopyOrMoveFileResource

uint64_t ___LSCopyOrMoveFileResource_block_invoke(uint64_t a1)
{
  v86[1] = *(id *)MEMORY[0x1895F89C0];
  v2 = (void *)MEMORY[0x186E2A59C]();
  [MEMORY[0x189607A40] currentThread];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setName:@"LS MDT helper thread/run loop"];

  CFTypeRef cf = 0LL;
  v4 = objc_alloc_init(&OBJC_CLASS____LSOpenCopierContext);
  id v5 = *(id *)(a1 + 32);
  LOBYTE(v73) = 0;
  char v74 = 0;
  if (*(_BYTE *)(a1 + 72))
  {
    v6 = 0LL;
LABEL_3:
    uint64_t v7 = 3LL;
    goto LABEL_4;
  }

  v18 = *(void **)(a1 + 40);
  id v19 = *(id *)(a1 + 32);
  id v20 = v18;
  v21 = v20;
  __int128 v76 = xmmword_183FBF390;
  uint64_t v77 = 0LL;
  DWORD2(v76) = -2147352576;
  if (!v20)
  {
    v86[0] = *(id *)MEMORY[0x189607490];
    *(void *)buf = @"Missing resource file handle";
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v86 count:1];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"_LSStageOrConfirmInPlaceOpenabilityOfFileResource",  317LL,  v43);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

    goto LABEL_33;
  }

  if (fstat([v20 fileDescriptor], &v79) < 0 || fstatfs(objc_msgSend(v21, "fileDescriptor"), &v83) < 0)
  {
    v39 = __error();
    v40 = (void *)*MEMORY[0x189607688];
    uint64_t v41 = 322LL;
LABEL_30:
    _LSMakeNSErrorImpl(v40, *v39, (uint64_t)"_LSStageOrConfirmInPlaceOpenabilityOfFileResource", v41, 0LL);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
    id v44 = v42;
    v6 = 0LL;
    id v42 = v44;
    id v22 = v19;
    goto LABEL_34;
  }

  if (getattrlist(v83.f_mntonname, &v76, v78, 0x24uLL, 0x800u) < 0)
  {
    v39 = __error();
    v40 = (void *)*MEMORY[0x189607688];
    uint64_t v41 = 327LL;
    goto LABEL_30;
  }

  if (fcntl([v21 fileDescriptor], 50, v82) == -1)
  {
    v39 = __error();
    v40 = (void *)*MEMORY[0x189607688];
    uint64_t v41 = 338LL;
    goto LABEL_30;
  }

  [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v82 isDirectory:(v79.st_mode & 0xF000) == 0x4000 relativeToURL:0];
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  if ((v83.f_flags & 1) != 0) {
    goto LABEL_68;
  }
  if ((v78[10] & 1) == 0 || *(unsigned __int16 *)v83.f_mntonname == 47)
  {
    if (*(unsigned __int16 *)v83.f_mntonname != 47)
    {
      _LSDefaultLog();
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v22;
        _os_log_impl( &dword_183E58000,  v56,  OS_LOG_TYPE_DEFAULT,  "Open of %@ from writable non-clone-supporting filesystem is unexpected.",  buf,  0xCu);
      }

      if ((v79.st_mode & 0xF000) == 0x8000)
      {
        v86[0] = 0LL;
        copyProvidedResourceToStagingContainerRegularFile(v22, v21, v86, buf);
        id v42 = v86[0];
        v6 = *(id **)buf;
        goto LABEL_80;
      }

      v86[0] = *(id *)MEMORY[0x189607490];
      *(void *)buf = @"Open of non-regular file from writable filesystem requires clone support";
      [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v86 count:1];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"_LSStageOrConfirmInPlaceOpenabilityOfFileResource",  355LL,  v43);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = v22;
      goto LABEL_32;
    }

@end