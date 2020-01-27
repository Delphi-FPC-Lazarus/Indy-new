unit IdOpenSSLHeaders_async;

// This File is generated!
// Any modification should be in the respone unit in the 
// responding unit in the "intermediate" folder! 

// Generation date: 27.01.2020 13:25:51

interface

// Headers for OpenSSL 1.1.1
// async.h

{$i IdCompilerDefines.inc}

uses
  IdCTypes;

const
  ASYNC_ERR = 0;
  ASYNC_NO_JOBS = 0;
  ASYNC_PAUSE = 2;
  ASYNC_FINISH = 3;

type
  async_job_st = type Pointer;
  ASYNC_JOB = async_job_st;
  PASYNC_JOB = ^ASYNC_JOB;
  PPASYNC_JOB = ^PASYNC_JOB;
  
  async_wait_ctx_st = type Pointer;
  ASYNC_WAIT_CTX = async_wait_ctx_st;
  PASYNC_WAIT_CTX = ^ASYNC_WAIT_CTX;
  
  OSSL_ASYNC_FD = type TIdC_INT;
  POSSL_ASYNC_FD = ^OSSL_ASYNC_FD;

  ASYNC_WAIT_CTX_set_wait_fd_cleanup = procedure(v1: PASYNC_WAIT_CTX;
    const v2: Pointer; v3: OSSL_ASYNC_FD; v4: Pointer);
  ASYNC_start_job_cb = function(v1: Pointer): TIdC_INT;

{$REGION 'Generated loading and unloading methods'}
function Load(const ADllHandle: THandle): TArray<string>;
procedure UnLoad;
{$ENDREGION}

var
  ASYNC_init_thread: function(max_size: size_t; init_size: size_t): TIdC_INT cdecl = nil;
  ASYNC_cleanup_thread: procedure cdecl = nil;

  ASYNC_WAIT_CTX_new: function: PASYNC_WAIT_CTX cdecl = nil;
  ASYNC_WAIT_CTX_free: procedure(ctx: PASYNC_WAIT_CTX) cdecl = nil;
  ASYNC_WAIT_CTX_set_wait_fd: function(ctx: PASYNC_WAIT_CTX; const key: Pointer; fd: OSSL_ASYNC_FD; custom_data: Pointer; cleanup_cb: ASYNC_WAIT_CTX_set_wait_fd_cleanup): TIdC_INT cdecl = nil;
  ASYNC_WAIT_CTX_get_fd: function(ctx: PASYNC_WAIT_CTX; const key: Pointer; fd: POSSL_ASYNC_FD; custom_data: PPointer): TIdC_INT cdecl = nil;
  ASYNC_WAIT_CTX_get_all_fds: function(ctx: PASYNC_WAIT_CTX; fd: POSSL_ASYNC_FD; numfds: PSize_t): TIdC_INT cdecl = nil;
  ASYNC_WAIT_CTX_get_changed_fds: function(ctx: PASYNC_WAIT_CTX; addfd: POSSL_ASYNC_FD; numaddfds: PSize_t; delfd: POSSL_ASYNC_FD; numdelfds: PSize_t): TIdC_INT cdecl = nil;
  ASYNC_WAIT_CTX_clear_fd: function(ctx: PASYNC_WAIT_CTX; const key: Pointer): TIdC_INT cdecl = nil;

  ASYNC_is_capable: function: TIdC_INT cdecl = nil;

  ASYNC_start_job: function(job: PPASYNC_JOB; ctx: PASYNC_WAIT_CTX; ret: PIdC_INT; func: ASYNC_start_job_cb; args: Pointer; size: size_t): TIdC_INT cdecl = nil;
  ASYNC_pause_job: function: TIdC_INT cdecl = nil;

  ASYNC_get_current_job: function: PASYNC_JOB cdecl = nil;
  ASYNC_get_wait_ctx: function(job: PASYNC_JOB): PASYNC_WAIT_CTX cdecl = nil;
  ASYNC_block_pause: procedure cdecl = nil;
  ASYNC_unblock_pause: procedure cdecl = nil;

implementation

uses
  System.Classes,
  Winapi.Windows;

{$REGION 'Generated loading and unloading methods'}
function Load(const ADllHandle: THandle): TArray<string>;

  function LoadFunction(const AMethodName: string; const AFailed: TStringList): Pointer;
  begin
    Result := GetProcAddress(ADllHandle, PChar(AMethodName));
    if not Assigned(Result) then
      AFailed.Add(AMethodName);
  end;

var
  LFailed: TStringList;
begin
  LFailed := TStringList.Create();
  try
    ASYNC_init_thread := LoadFunction('ASYNC_init_thread', LFailed);
    ASYNC_cleanup_thread := LoadFunction('ASYNC_cleanup_thread', LFailed);
    ASYNC_WAIT_CTX_new := LoadFunction('ASYNC_WAIT_CTX_new', LFailed);
    ASYNC_WAIT_CTX_free := LoadFunction('ASYNC_WAIT_CTX_free', LFailed);
    ASYNC_WAIT_CTX_set_wait_fd := LoadFunction('ASYNC_WAIT_CTX_set_wait_fd', LFailed);
    ASYNC_WAIT_CTX_get_fd := LoadFunction('ASYNC_WAIT_CTX_get_fd', LFailed);
    ASYNC_WAIT_CTX_get_all_fds := LoadFunction('ASYNC_WAIT_CTX_get_all_fds', LFailed);
    ASYNC_WAIT_CTX_get_changed_fds := LoadFunction('ASYNC_WAIT_CTX_get_changed_fds', LFailed);
    ASYNC_WAIT_CTX_clear_fd := LoadFunction('ASYNC_WAIT_CTX_clear_fd', LFailed);
    ASYNC_is_capable := LoadFunction('ASYNC_is_capable', LFailed);
    ASYNC_start_job := LoadFunction('ASYNC_start_job', LFailed);
    ASYNC_pause_job := LoadFunction('ASYNC_pause_job', LFailed);
    ASYNC_get_current_job := LoadFunction('ASYNC_get_current_job', LFailed);
    ASYNC_get_wait_ctx := LoadFunction('ASYNC_get_wait_ctx', LFailed);
    ASYNC_block_pause := LoadFunction('ASYNC_block_pause', LFailed);
    ASYNC_unblock_pause := LoadFunction('ASYNC_unblock_pause', LFailed);
    Result := LFailed.ToStringArray();
  finally
    LFailed.Free();
  end;
end;

procedure UnLoad;
begin
  ASYNC_init_thread := nil;
  ASYNC_cleanup_thread := nil;
  ASYNC_WAIT_CTX_new := nil;
  ASYNC_WAIT_CTX_free := nil;
  ASYNC_WAIT_CTX_set_wait_fd := nil;
  ASYNC_WAIT_CTX_get_fd := nil;
  ASYNC_WAIT_CTX_get_all_fds := nil;
  ASYNC_WAIT_CTX_get_changed_fds := nil;
  ASYNC_WAIT_CTX_clear_fd := nil;
  ASYNC_is_capable := nil;
  ASYNC_start_job := nil;
  ASYNC_pause_job := nil;
  ASYNC_get_current_job := nil;
  ASYNC_get_wait_ctx := nil;
  ASYNC_block_pause := nil;
  ASYNC_unblock_pause := nil;
end;
{$ENDREGION}

end.
